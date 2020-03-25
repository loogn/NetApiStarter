using System.Collections.Generic;
using System.Linq;
using CoreHelper;
using CoreHelper.Ioc;
using Loogn.OrmLite;
using project.dao;
using project.dao.Models;

namespace project.backsite.Services
{
    [AppService]
    public class DataDictService
    {
        [Autowired] private DataDictDao _dataDictDao;
        [Autowired] private AdDao _adDao;
        public DataDictService(AutowiredService autowiredService)
        {
            autowiredService.Autowired(this);
        }

        public List<DataDict> GetList(int dictType, int? parentId)
        {
            var dict = DictBuilder
                .Assign("DictType", dictType);
            if (parentId != null)
            {
                dict.Assign("ParentId", parentId);
            }

            return _dataDictDao.SelectWhere(dict, "OrderNum asc,Id desc");
        }

        /// <summary>
        /// 获取父级列表
        /// </summary>
        /// <param name="dictId"></param>
        /// <param name="withSelf"></param>
        /// <returns></returns>
        public List<DataDict> GetParentList(int dictType, long dictId, bool withSelf)
        {
            var list = new List<DataDict>();
            if (dictId == 0)
            {
                return list;
            }

            var self = _dataDictDao.SingleWhere(DictBuilder.Assign("DictType", dictType).Assign("DictId", dictId));

            if (withSelf)
            {
                list.Add(self);
            }

            var cur = self;
            while (cur.ParentId != 0)
            {
                var par = _dataDictDao.SingleWhere(DictBuilder.Assign("DictType", dictType)
                    .Assign("DictId", cur.ParentId));
                list.Add(par);
                cur = par;
            }

            list.Reverse();
            return list;
        }

        /// <summary>
        /// 列表重新排序，支持三级，用于select的option
        /// </summary>
        /// <param name="dictType"></param>
        /// <returns></returns>
        public List<DataDict> GetTreeList(int dictType)
        {
            var dataDictList = _dataDictDao.SelectWhere(DictBuilder
                .Assign("DictType", dictType), "OrderNum asc,id");

            List<DataDict> newList = new List<DataDict>();
            foreach (var item0 in dataDictList.Where(x => x.ParentId == 0))
            {
                item0.igLevel = 0;
                newList.Add(item0);
                foreach (var item1 in dataDictList.Where(x => x.ParentId == item0.DictId))
                {
                    item1.igLevel = 1;
                    newList.Add(item1);
                    foreach (var item2 in dataDictList.Where(x => x.ParentId == item1.DictId))
                    {
                        item2.igLevel = 2;
                        newList.Add(item2);
                    }
                }
            }

            return newList;
        }


        public DataDict Single(long id)
        {
            return _dataDictDao.SingleById(id);
        }

        public ResultObject Edit(DataDict dataDict)
        {
            if (string.IsNullOrEmpty(dataDict.Name))
            {
                return new ResultObject("名称不能为空");
            }

            var flag = 0L;
            if (dataDict.Id == 0)
            {
                dataDict.DictId = _dataDictDao.GetMaxDictId(dataDict.DictType) + 1;

                flag = _dataDictDao.Insert(dataDict);
            }
            else
            {
                flag = _dataDictDao.Update(dataDict);
            }

            return new ResultObject(flag);
        }
        
        
        public ResultObject DeleteById(long id)
        {
            var childCount = _dataDictDao.CountWhere("ParentId", id);
            if (childCount > 0)
            {
                return  new ResultObject("存在子数据，不能删¬除");
            }
            
            var m =Single(id) ;
            var c = 0L;
            
            if (m.DictType == DataDictType.广告类型)
            {
                c = _adDao.CountWhere("TypeId", m.DictId);
            }else if (m.DictType == DataDictType.文章类型)
            {
                //todo
            }
            
            if (c == 0)
            {
                _dataDictDao.DeleteById(id);
                return new ResultObject(true);
            }
            else
            {
                return new ResultObject("有对象引用，删除失败");
            }
        }
    }
}