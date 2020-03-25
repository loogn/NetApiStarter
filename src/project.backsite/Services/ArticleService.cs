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
    public class ArticleService
    {
        [Autowired] private ArticleDao _articleDao;
        public ArticleService(AutowiredService autowiredService)
        {
            autowiredService.Autowired(this);
        }
        
        public ResultObject Edit(Article m)
        {
            var flag = 0L;
            m.UpdateTime=DateTime.Now;
            if (m.Id > 0)
            {
                flag = _articleDao.Update(m,
                    "Title","CoverImage","TypeId","VirtualRead","Status","OrderNum","Body");
            }
            else
            {
                flag = _articleDao.Insert(m);
            }

            return new ResultObject(flag > 0);
        }

        public OrmLitePageResult<Article> SelectList(string title, int? typeId, 
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

            if (typeId > 0)
            {
                orderBy = "OrderNum";
                sb.AppendFormat(" and TypeId={0}", typeId);
            }


            var factor = new OrmLitePageFactor
            {
                Conditions = sb.ToString(),
                PageIndex = pageIndex,
                PageSize = pageSize,
                OrderBy = orderBy,
                Params = ps
            };
            return _articleDao.SelectPage(factor);
        }

        public Article SingleById(long id)
        {
            return _articleDao.SingleById(id);
        }

        public ResultObject Del(long id)
        {
            _articleDao.DeleteById(id);
            return new ResultObject(true);
        }
        
    }
}