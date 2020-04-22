using CoreHelper.Ioc;
using Loogn.OrmLite;
using project.dao;
using project.dao.Models;

namespace project.backsite.Services
{
    public class OrderService
    {
        public OrderService(AutowiredService autowiredService)
        {
            autowiredService.Autowired(this);
        }
       
    }
}