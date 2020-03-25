using System.Text;
using CoreHelper;
using CoreHelper.Ioc;
using Loogn.OrmLite;
using project.dao;
using project.dao.Models;

namespace project.backsite.Services
{
    [AppService]
    public class AnnouncementService
    {
        [Autowired] private AnnouncementDao announcementDao;

        public AnnouncementService(AutowiredService autowiredService)
        {
            autowiredService.Autowired(this);
        }
        
        public ResultObject Edit(Announcement m)
        {
            var flag = 0L;
            if (m.Id > 0)
            {
                flag = announcementDao.Update(m);
            }
            else
            {
                flag = announcementDao.Insert(m);
            }

            return new ResultObject(flag > 0);
        }

        public OrmLitePageResult<Announcement> SelectList(string title, int pageIndex, int pageSize)
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

            var factor = new OrmLitePageFactor
            {
                Conditions = sb.ToString(),
                PageIndex = pageIndex,
                PageSize = pageSize,
                OrderBy = orderBy,
                Params = ps
            };
            return announcementDao.SelectPage(factor);
        }

        public Announcement SingleById(long id)
        {
            return announcementDao.SingleById(id);
        }

        public ResultObject Del(long id)
        {
            announcementDao.DeleteById(id);
            return new ResultObject(true);
        }
    }
}