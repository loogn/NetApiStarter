using System;

namespace WxPaySDK
{
    public class WxPayException:Exception
    {
        public WxPayException(string msg) : base(msg) 
        {

        }
    }
}