using System.Collections.Concurrent;
using System.IO;
using System.Threading;
using System.Threading.Tasks;

namespace project.api.Services
{

    public class UploadChunkItem
    {
        //public byte[] Data { get; set; }
        public int ChunkNumber { get; set; }
        public int ChunkSize { get; set; }
        public string FilePath { get; set; }
        public string ChunkPath { get; set; }
    }


    public class UploadChunkWriter
    {
        public static UploadChunkWriter Instance = new UploadChunkWriter();

        private object lockObj = new object();

        private BlockingCollection<UploadChunkItem> _queue;
        private int _writeWorkerCount = 3;
        private Thread _writeThread;
        public UploadChunkWriter()
        {
            _queue = new BlockingCollection<UploadChunkItem>(500);
            _writeThread = new Thread(this.Write);
        }

        public void Write()
        {
            while (true)
            {
                //单线程写入
                //var item = _queue.Take();
                //using (var fileStream = File.Open(item.FilePath, FileMode.Open, FileAccess.Write, FileShare.ReadWrite))
                //{
                //    fileStream.Position = (item.ChunkNumber - 1) * item.ChunkSize;
                //    fileStream.Write(item.Data, 0, item.Data.Length);
                //    item.Data = null;
                //}

                //多线程写入
                Task[] tasks = new Task[_writeWorkerCount];
                for (int i = 0; i < _writeWorkerCount; i++)
                {
                    var item = _queue.Take();
                    //线程安全的创建文件
                    if (!File.Exists(item.FilePath))
                    {
                        lock (lockObj)
                        {
                            if (!File.Exists(item.FilePath))
                            {
                                var folder = Path.GetDirectoryName(item.FilePath);
                                if (!Directory.Exists(folder))
                                {
                                    Directory.CreateDirectory(folder);
                                }
                                File.Create(item.FilePath).Dispose();
                            }
                        }
                    }

                    tasks[i] = Task.Run(() =>
                     {
                         using (var fileStream = File.Open(item.FilePath, FileMode.Open, FileAccess.Write, FileShare.ReadWrite))
                         {
                             var data = File.ReadAllBytes(item.ChunkPath);
                             fileStream.Position = (item.ChunkNumber - 1) * item.ChunkSize;
                             fileStream.Write(data, 0, data.Length);
                             data = null;
                         }
                     });
                }
                Task.WaitAll(tasks);
            }
        }

        public void Add(UploadChunkItem item)
        {
            _queue.Add(item);
        }

        public void Start()
        {
            _writeThread.Start();
        }
    }
}
