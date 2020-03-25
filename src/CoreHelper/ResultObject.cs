namespace CoreHelper
{
    /// <summary>
    /// 结果对象
    /// </summary>
    public class ResultObject
    {
        public ResultObject() { }
        public ResultObject(string msg)
        {
            Msg = msg;
        }

        public ResultObject(string msg, long code)
        {
            Msg = msg;
            Code = code;
        }

        public ResultObject(bool success)
        {
            Success = success;
            if (success)
            {
                Msg = "操作成功";
            }
            else
            {
                Msg = "操作失败";
            }
        }
        public ResultObject(bool success, string msg)
        {
            Success = success;
            Msg = msg;
        }

        public ResultObject(long flag) : this(flag > 0)
        {
        }

        /// <summary>
        /// 是否成功
        /// </summary>
        public bool Success { get; set; }
        /// <summary>
        /// 返回码
        /// </summary>
        public long Code { get; set; }
        /// <summary>
        /// 错误提示信息
        /// </summary>
        public string Msg { get; set; }

        /// <summary>
        /// 生成TResult结果
        /// </summary>
        /// <typeparam name="TResult"></typeparam>
        /// <param name="result"></param>
        /// <returns></returns>
        public ResultObject<TResult> To<TResult>(TResult result)
        {
            return new ResultObject<TResult>
            {
                Code = Code,
                Msg = Msg,
                Success = Success,
                Result = result
            };
        }

        /// <summary>
        /// 生成TResult结果,TResult为null
        /// </summary>
        /// <typeparam name="TResult"></typeparam>
        /// <returns></returns>
        public ResultObject<TResult> To<TResult>()
        {
            return To<TResult>(default(TResult));
        }
    }

    /// <summary>
    /// 结果对象
    /// </summary>
    /// <typeparam name="TResult"></typeparam>
    public class ResultObject<TResult> : ResultObject
    {
        public ResultObject()
        {
        }

        public ResultObject(string msg) : base(msg)
        {
        }

        public ResultObject(string msg, long code) : base(msg, code)
        {
        }

        public ResultObject(TResult result)
        {
            Success = true;
            Result = result;
        }

        /// <summary>
        /// 结果
        /// </summary>
        public TResult Result { get; set; }
    }
}
