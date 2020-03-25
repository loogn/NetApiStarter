using System;
using System.Text;
using CoreHelper;
using CoreHelper.Ioc;
using Loogn.OrmLite;
using project.dao;
using project.dao.Models;

namespace project.backsite.Services
{
    [AppService]
    public class AdService
    {
        [Autowired] private AdDao _adDao;
            
        public AdService(AutowiredService autowiredService)
        {
            autowiredService.Autowired(this);
        }
        
        public ResultObject Edit(Ad m)
        {
            var flag = 0L;
            if (m.Id > 0)
            {
                flag = _adDao.Update(m);
            }
            else
            {
                flag = _adDao.Insert(m);
            }

            return new ResultObject(flag > 0);
        }

        public OrmLitePageResult<Ad> SelectList(string title, int? adTypeId, DateTime? start, DateTime? end,
            int pageIndex, int pageSize)
        {
            StringBuilder sb = new StringBuilder();
            var ps = DictBuilder.New();
            sb.Append("1=1");
            var orderBy = "id desc";
            title = SqlInjection.Filter(title);
            if (!string.IsNullOrEmpty(title))
            {
                sb.AppendFormat(" and Title like '%{0}%'", title);
            }

            if (adTypeId > 0)
            {
                orderBy = "OrderNum";
                sb.AppendFormat(" and TypeId={0}", adTypeId);
            }

            if (start.HasValue)
            {
                sb.AppendFormat(" and EndTime>@start");
                ps.EQ("start", start.Value);
            }

            if (end.HasValue)
            {
                sb.Append(" and EndTime<@end");
                ps.EQ("end", end.Value.AddDays(1));
            }


            var factor = new OrmLitePageFactor
            {
                Conditions = sb.ToString(),
                PageIndex = pageIndex,
                PageSize = pageSize,
                OrderBy = orderBy,
                Params = ps
            };
            return _adDao.SelectPage(factor);
        }

        public Ad SingleById(long id)
        {
            return _adDao.SingleById(id);
        }

        public ResultObject Del(long id)
        {
            _adDao.DeleteById(id);
            return new ResultObject(true);
        }
    }
}