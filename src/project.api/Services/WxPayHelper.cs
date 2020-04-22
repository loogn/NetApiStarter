using System;
using Serilog;
using WxPaySDK;

namespace project.api.Services
{
    public class WxPayHelper
    {
        /// <summary>
        /// 发起统一支付,并且获取js参数
        /// </summary>
        /// <param name="wxPayConfig">商户订单号</param>
        /// <param name="out_trade_no">商户订单号</param>
        /// <param name="body">标题</param>
        /// <param name="total_fee">金额（分）</param>
        /// <param name="openid">wx openid</param>
        /// <returns></returns>
        public static WxPayData JSAPIOrderAndGetParams(WxPayConfig wxPayConfig, string out_trade_no, string body,
            int total_fee, string openid)
        {
            var unifiedOrderResult = JSAPIOrder(wxPayConfig, out_trade_no, body, total_fee, openid);
            return GetJSApiParameters(wxPayConfig, unifiedOrderResult.GetValue("prepay_id"));
        }

        /// <summary>
        /// 发起统一支付(Demo）
        /// </summary>
        /// <param name="wxPayConfig"></param>
        /// <param name="out_trade_no">商户订单号</param>
        /// <param name="body">标题</param>
        /// <param name="total_fee">金额（分）</param>
        /// <param name="openid">wx openid</param>
        /// <returns></returns>
        public static WxPayData JSAPIOrder(WxPayConfig wxPayConfig, string out_trade_no, string body, int total_fee,
            string openid)
        {
            WxPayData data = new WxPayData();
            data.SetValue("time_start", DateTime.Now.ToString("yyyyMMddHHmmss"));
            data.SetValue("time_expire", DateTime.Now.AddMinutes(30).ToString("yyyyMMddHHmmss"));
            data.SetValue("device_info", "WEB");
            data.SetValue("body", body);
            data.SetValue("out_trade_no", out_trade_no);
            data.SetValue("total_fee", total_fee);
            data.SetValue("trade_type", "JSAPI");
            data.SetValue("openid", openid);

            WxPayData result = WxPayApi.UnifiedOrder(wxPayConfig, data);
            if (!result.IsSet("appid") || !result.IsSet("prepay_id") || result.GetValue("prepay_id").ToString() == "")
            {
                Log.Error("WeiXinMPPayHelper.UnifiedOrder", "UnifiedOrder response error!");
                throw new WxPayException("UnifiedOrder response error!" + result.ToJson());
            }

            return result;
        }

        /// <summary>
        /// wx.requestPayment的参数
        /// </summary>
        /// <param name="wxPayConfig"></param>
        /// <param name="prepay_id"></param>
        /// <returns></returns>
        public static WxPayData GetJSApiParameters(WxPayConfig wxPayConfig, object prepay_id)
        {
            WxPayData jsApiParam = new WxPayData();
            jsApiParam.SetValue("appId", wxPayConfig.AppID);
            jsApiParam.SetValue("timeStamp", WxPayApi.GenerateTimeStamp());
            jsApiParam.SetValue("nonceStr", WxPayApi.GenerateNonceStr());
            jsApiParam.SetValue("package", "prepay_id=" + prepay_id);
            jsApiParam.SetValue("signType", WxPayData.SIGN_TYPE_HMAC_SHA256);
            jsApiParam.SetValue("paySign", jsApiParam.MakeSign(wxPayConfig));

            return jsApiParam;
        }

        /// <summary>
        /// 查询订单
        /// </summary>
        /// <param name="wxPayConfig"></param>
        /// <param name="transaction_id"></param>
        /// <returns></returns>
        public static bool QueryOrder(WxPayConfig wxPayConfig, string transaction_id)
        {
            WxPayData req = new WxPayData();
            req.SetValue("transaction_id", transaction_id);
            WxPayData res = WxPayApi.OrderQuery(wxPayConfig, req);
            if (res.GetValue("return_code").ToString() == "SUCCESS" &&
                res.GetValue("result_code").ToString() == "SUCCESS")
            {
                return true;
            }
            else
            {
                return false;
            }
        }
    }
}