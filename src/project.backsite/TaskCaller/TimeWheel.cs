using System;
using System.Collections.Generic;
using System.Linq;

namespace project.backsite.TaskCaller
{
    /// <summary>
    /// 时间轮
    /// </summary>
    public class TimeWheel
    {
        /// <summary>
        /// 卡槽数
        /// </summary>
        private int _slotNum;
        /// <summary>
        /// 每个卡槽上的项集合
        /// </summary>
        private HashSet<TWItem>[] _itemsSet;
        private HashSet<long> _itemIds;
        /// <summary>
        /// 当前指针
        /// </summary>
        private int _currentIndex;
        //private object lockObj = new object();

        public TimeWheel() : this(360) { }
        public TimeWheel(int slotNum)
        {
            _slotNum = slotNum;
            _itemsSet = new HashSet<TWItem>[slotNum];
            _itemIds = new HashSet<long>();
            _currentIndex = 0;
        }

        /// <summary>
        /// 添加新项到时间轮上
        /// </summary>
        /// <param name="itemId"></param>
        /// <param name="delaySeconds"></param>
        /// <returns></returns>
        public bool Add(long itemId, int delaySeconds)
        {
            if (_itemIds.Contains(itemId)) return false;
            _itemIds.Add(itemId);
            //如果小于1s,添加不成功
            if (delaySeconds < 1)
            {
                return false;
            }
            var cyNum = delaySeconds / _slotNum;
            var offset = delaySeconds - (cyNum * _slotNum);
            var index = 0;
            if (offset + _currentIndex >= _slotNum)
            {
                index = (_currentIndex + offset) - _slotNum;
            }
            else
            {
                index = _currentIndex + offset;
            }

            var item = new TWItem
            {
                Id = itemId,
                CyNum = cyNum
            };
            var itemSet = _itemsSet[index];
            if (itemSet == null)
            {
                lock (this)
                {
                    itemSet = _itemsSet[index];
                    if (itemSet == null)
                    {
                        itemSet = new HashSet<TWItem>();
                        _itemsSet[index] = itemSet;
                    }
                }
            }
            lock (this)
            {
                return itemSet.Add(item);
            }
        }

        /// <summary>
        /// 添加新项到时间论上
        /// </summary>
        /// <param name="itemId"></param>
        /// <param name="execTime"></param>
        /// <returns></returns>
        public bool Add(long itemId, DateTime execTime)
        {
            var totalSeconds = (int)(execTime - DateTime.Now).TotalSeconds;
            return Add(itemId, totalSeconds);
        }

        /// <summary>
        /// 一步一步往下走
        /// </summary>
        /// <returns></returns>
        public List<long> WalkStep()
        {
            var itemSet = _itemsSet[_currentIndex];
            _currentIndex++;
            if (_currentIndex >= _slotNum)
            {
                _currentIndex = 0;
            }

            if (itemSet == null || itemSet.Count == 0) return new List<long>();

            List<TWItem> itemList = new List<TWItem>();
            foreach (var item in itemSet)
            {
                if (item.CyNum == 0)
                {
                    itemList.Add(item);
                }
                else
                {
                    item.CyNum--;
                }
            }
            if (itemList.Count > 0)
            {
                lock (this)
                {
                    foreach (var item in itemList)
                    {
                        _itemIds.Remove(item.Id);
                        itemSet.Remove(item);
                    }
                }
                return itemList.Select(x => x.Id).ToList();
            }
            else
            {
                return new List<long>();
            }
        }
    }

    class TWItem
    {
        /// <summary>
        /// 唯一编号
        /// </summary>
        public long Id { get; set; }
        /// <summary>
        /// 环数
        /// </summary>
        public int CyNum { get; set; }

        public override bool Equals(object obj)
        {
            if (obj == null || obj.GetType() != GetType())
                return false;

            return Equals((TWItem)obj);
        }
        public bool Equals(TWItem item)
        {
            return item.Id == Id;
        }

        public override int GetHashCode()
        {
            return Id.GetHashCode();
        }

    }
}
