using System;
using System.Collections.Generic;
using CoreHelper;
using CoreHelper.Ioc;
using Loogn.OrmLite;
using Microsoft.Extensions.Logging;
using project.dao;
using project.dao.Models;
using WxPaySDK;

namespace project.api.Services
{
    public class OrderService
    {
        [Autowired] private PayOrderDao _payOrderDao;
        // [Autowired] private ILoggerFactory loggerFactory;

        public OrderService(AutowiredService autowiredService)
        {
            autowiredService.Autowired(this);
        }

        public PayOrder GetPayOrder(string payNo)
        {
            return _payOrderDao.SingleWhere("PayNO", payNo);
        }

        public WxPayConfig GetWxPayConfig()
        {
            var wxPayConfig = new WxPayConfig();
            //todo 填充微信支付配置
            return wxPayConfig;
        }

        public ResultObject CreateOrder(string wxopenid)
        {
            // todo 如果是简单的订单，直接填充payorder即可,如果是像购物这样复杂的订单，需要新建另外的Order和OrderDetail

            //TODO 具体订单信息

            //填充支付单
            var payOrder = new PayOrder()
            {
                PayNO = DateTime.Now.ToString("yyyyMMddHHmmssfffff"),
                PayStatus = 2,
                OrderNO = "",
                Amount = 0.01m,
                Remark = "",
            };

            //数据库插入
            var flag = _payOrderDao.Insert(payOrder);
            if (flag == 0)
            {
                return new ResultObject("操作失败");
            }

            var wxPayConfig = GetWxPayConfig();
            try
            {
                var wxData = WxPayHelper.JSAPIOrder(wxPayConfig, payOrder.PayNO, "title",
                    (int) (payOrder.Amount * 100),
                    wxopenid);
                var prepay_id = wxData.GetValue("prepay_id").ToString();
                return new ResultObject
                {
                    Msg = prepay_id,
                    Success = true
                };
            }
            catch
            {
                return new ResultObject("下单失败，请重新操作");
            }
        }

        public IDictionary<string, object> GetJsApiParams(string prepay_id)
        {
            var wxPayConfig = GetWxPayConfig();
            var data = WxPayHelper.GetJSApiParameters(wxPayConfig, prepay_id);
            var dict = data.GetValues();
            return dict;
        }

        public void DealPayOK(PayOrder payOrder)
        {
            //todo 支付通知后逻辑
        }

        /// <summary>
        /// 收到通知，设置状态，成功锁死
        /// </summary>
        /// <param name="id"></param>
        /// <param name="payStatus"></param>
        /// <param name="payTime"></param>
        /// <returns></returns>
        public int SetPay(long id, int payStatus, DateTime payTime)
        {
            return _payOrderDao.UpdateWhere(
                DictBuilder
                    .Assign("PayStatus", payStatus)
                    .Assign("PayTime", payTime),
                DictBuilder.Assign("Id", id).NEQ("PayStatus", 2));
        }
    }
}