using CoreHelper.Ioc;
using Loogn.OrmLite;
using project.dao;
using project.dao.Models;

namespace project.backsite.Services
{
    public class OrderService
    {
        [Autowired] private PayOrderDao _payOrderDao;
        
        public OrderService(AutowiredService autowiredService)
        {
            autowiredService.Autowired(this);
        }
        
        
        /// <summary>
        /// 收到通知，设置状态，成功锁死
        /// </summary>
        /// <param name="id"></param>
        /// <param name="payStatus"></param>
        /// <param name="payTime"></param>
        /// <returns></returns>
        public int SetPay(long id, int payStatus, string payTime)
        {
            return _payOrderDao.UpdateWhere(
                DictBuilder
                    .Assign("PayStatus", payStatus)
                    .Assign("PayTime", payTime),
                DictBuilder.Assign("Id", id).NEQ("Status", 2));
        }
        
    }
}