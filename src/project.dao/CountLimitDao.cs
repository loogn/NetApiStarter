using System;
using CoreHelper.Ioc;
using Loogn.OrmLite;
using project.dao.Models;

namespace project.dao
{
    [AppService]
    public class CountLimitDao : BaseDao<CountLimit>
    {
        /// <summary>
        /// 检测计数公共方法 /// </summary>
        /// <param name="uniqueId">特定使用类型中唯一标识</param>
        /// <param name="limit">限制次数</param>
        /// <param name="duration">时间间隔</param>
        /// <param name="beginTime">当前间隔开始时间</param>
        /// <returns>是否可以操作</returns>
        public bool CheckLimit(string uniqueId, int limit, TimeSpan duration, DateTime? beginTime = null)
        {
            if (beginTime == null)
            {
                beginTime = DateTime.Now;
            }

            var m = Single(uniqueId); //还没计数记录
            if (m == null)
            {
                Insert(new CountLimit
                {
                    AlreadyCount = 1,
                    BeginTime = beginTime.Value,
                    UniqueId = uniqueId,
                });
            }
            else
            {
                //时间范围之内
                if (m.BeginTime <= DateTime.Now && m.BeginTime.Add(duration) > DateTime.Now)
                {
                    //计数已满
                    if (m.AlreadyCount >= limit)
                    {
                        return false;
                    }
                    else
                    {
                        //增加计数
                        IncCount(m.Id);
                    }
                }
                else
                {
                    //不在时间范围之内，设置为一次计数
                    ResetOne(m.Id, beginTime.Value);
                }
            }

            return true;
        }
        
        public CountLimit Single(string uniqueId)
        {
            using (var db = Open())
            {
                return db.SingleWhere<CountLimit>(DictBuilder.Assign("UniqueId", uniqueId));
            }
        }

        public int IncCount(long id)
        {
            using (var db = Open())
            {
                return db.UpdateFieldById<CountLimit>("$AlreadyCount", "AlreadyCount+1", id);
            }
        }

        public int ResetOne(long id, DateTime beginTime)
        {
            using (var db = Open())
            {
                return db.UpdateById<CountLimit>(DictBuilder.Assign("AlreadyCount", 1).Assign("BeginTime", beginTime),
                    id);
            }
        }
    }
}