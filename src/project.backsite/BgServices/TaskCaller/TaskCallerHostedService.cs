using System;
using System.Threading;
using System.Threading.Tasks;
using Microsoft.Extensions.Hosting;
using Microsoft.Extensions.Logging;

namespace project.backsite.BgServices.TaskCaller
{
    public class TaskCallerHostedService : BackgroundService
    {
        private readonly ILogger _logger;
        private DelayTaskManager _delayTaskManager;
        private TimedTaskManager _timedTaskManager;
        private Timer _timer;


        public TaskCallerHostedService(DelayTaskManager delayTaskManager, TimedTaskManager timedTaskManager, ILogger<TaskCallerHostedService> logger)
        {
            _delayTaskManager = delayTaskManager;
            _timedTaskManager = timedTaskManager;
            _logger = logger;
        }


        public override Task StopAsync(CancellationToken cancellationToken)
        {
            _logger.LogInformation("TaskCaller 后台服务已停止ֹ");
            _timer?.Change(Timeout.Infinite, 0);
            return base.StopAsync(cancellationToken);
        }

        private void DoWork(object state)
        {
            var now = DateTime.Now;//触发的时间
            Task.Factory.StartNew(() =>
            {
                Task.Factory.StartNew(() => { _timedTaskManager.LoadTask(now); }).ContinueWith(task =>
                {
                    _timedTaskManager.TriggerTask(now);
                });

                Task.Factory.StartNew(() => { _delayTaskManager.LoadTask(now); }).ContinueWith(task =>
                {
                    _delayTaskManager.TriggerTask(now);
                });
            });
        }


        protected override Task ExecuteAsync(CancellationToken stoppingToken)
        {
            _logger.LogInformation("TaskCaller 后端服务已开始。");
            _timer = new Timer(DoWork, null, TimeSpan.Zero, TimeSpan.FromSeconds(1));

            return Task.CompletedTask;
        }
    }
}