using System;
using System.Globalization;
using System.Threading.Tasks;
using CoreHelper.Ioc;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using project.api.Services;
using WxPaySDK;

namespace project.api.Controllers
{
    public class NotifyController : Controller
    {
        [Autowired] private ILoggerFactory _loggerFactory;
        [Autowired] private OrderService _orderService;

        public NotifyController(AutowiredService autowiredService)
        {
            autowiredService.Autowired(this);
        }

        public async Task<string> WxPayNotify()
        {
            var logger = _loggerFactory.CreateLogger<NotifyController>();
            try
            {
                var wxPayConfig = _orderService.GetWxPayConfig();

                WxPayData notifyData = await WxPayApi.GetNotifyData(wxPayConfig, HttpContext.Request.Body);

                //检查支付结果中transaction_id是否存在
                if (!notifyData.IsSet("transaction_id"))
                {
                    //若transaction_id不存在，则立即返回结果给微信支付后台
                    WxPayData res = new WxPayData();
                    res.SetValue("return_code", "FAIL");
                    res.SetValue("return_msg", "支付结果中微信订单号不存在");
                    logger.LogError("The Pay result is error : " + res.ToXml());
                    return res.ToXml();
                }

                string transaction_id = notifyData.GetValue("transaction_id").ToString();

                //查询订单，判断订单真实性
                if (!WxPayHelper.QueryOrder(wxPayConfig, transaction_id))
                {
                    //若订单查询失败，则立即返回结果给微信支付后台
                    WxPayData res = new WxPayData();
                    res.SetValue("return_code", "FAIL");
                    res.SetValue("return_msg", "订单查询失败");
                    logger.LogError("Order query failure : " + res.ToXml());
                    return res.ToXml();
                }
                //查询订单成功
                else
                {
                    var result_code = notifyData.GetValue("result_code").ToString();
                    var total_fee = int.Parse(notifyData.GetValue("total_fee").ToString());
                    var out_trade_no = notifyData.GetValue("out_trade_no").ToString();
                    var time_end = notifyData.GetValue("time_end").ToString();
                    WxPayData res = new WxPayData();


                    //处理已支付
                    var order = _orderService.GetPayOrder(out_trade_no);
                    if (order == null || order.PayStatus == 2)
                    {
                        res.SetValue("return_code", "SUCCESS");
                        res.SetValue("return_msg", "OK");
                        return res.ToXml();
                    }

                    ////设置成功或失败
                    var status = result_code == "SUCCESS" ? 2 : 3;
                    if (status == 1 && total_fee != (int) (order.Amount * 100))
                    {
                        res.SetValue("return_code", "FAIL");
                        res.SetValue("return_msg", "订单金额不正确");
                        logger.LogError("Order query failure[订单金额不正确] : " + res.ToXml());
                        return res.ToXml();
                    }

                    _orderService.SetPay(order.Id, status,
                        DateTime.ParseExact(time_end, "yyyyMMddHHmmss", CultureInfo.CurrentCulture));

                    //成功后根据订单类型处理不同的逻辑
                    _orderService.DealPayOK(order);

                    res.SetValue("return_code", "SUCCESS");
                    res.SetValue("return_msg", "OK");
                    logger.LogInformation("order query success : " + res.ToXml());
                    return res.ToXml();
                }
            }
            catch (Exception exp)
            {
                WxPayData res = new WxPayData();
                res.SetValue("return_code", "FAIL");
                res.SetValue("return_msg", exp.Message);
                logger.LogError("order query success : " + res.ToXml());
                return res.ToXml();
            }
        }
    }
}