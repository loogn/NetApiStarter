using System;

namespace WxPaySDK
{
    public class WxPayConfig
    {
        /// <summary>
        /// 绑定支付的APPID（必须配置）
        /// </summary>
        public string AppID { get; set; }
        /// <summary>
        /// MCHID：商户号（必须配置）
        /// </summary>
        public string MchID { get; set; }
        /// <summary>
        ///  KEY：商户支付密钥，参考开户邮件设置（必须配置），请妥善保管，避免密钥泄露
        /// </summary>
        public string Key { get; set; }
        /// <summary>
        /// APPSECRET：公众帐号secert（仅JSAPI支付的时候需要配置），请妥善保管，避免密钥泄露
        /// </summary>
        public string AppSecret { get; set; }
        
        /// <summary>
        /// 支付结果通知回调url，用于商户接收支付结果
        /// </summary>
        public string NotifyUrl { get; set; } = "";

        /// <summary>
        /// 证书路径,注意应该填写绝对路径（仅退款、撤销订单时需要）
        /// 1.证书文件不能放在web服务器虚拟目录，应放在有访问权限控制的目录中，防止被他人下载；
        /// 2.建议将证书文件名改为复杂且不容易猜测的文件
        /// 3.商户服务器要做好病毒和木马防护工作，不被非法侵入者窃取证书文件。
        /// </summary>
        public string SSlCertPath { get; set; } = "";
        /// <summary>
        /// 证书密码
        /// </summary>
        public string SSlCertPassword { get; set; } = "";
        
        /// <summary>
        /// 商户系统后台机器IP,此参数可手动配置也可在程序中自动获取
        /// </summary>
        public string Ip { get; set; } = "";
        /// <summary>
        /// 代理服务器设置
        /// 默认IP和端口号分别为0.0.0.0和0，此时不开启代理（如有需要才设置）
        /// </summary>
        public string ProxyUrl { get; set; } = "";
        /// <summary>
        /// 上报信息配置
        /// 测速上报等级，0.关闭上报; 1.仅错误时上报; 2.全量上报
        /// </summary>
        public int ReportLevel { get; set; } = 1;
        /// <summary>
        /// 日志等级，
        /// 0.不输出日志；1.只输出错误信息; 2.输出错误和正常信息; 3.输出错误信息、正常信息和调试信息
        /// </summary>
        public int LogLevel { get; set; } = 1;
    }
    
}