using System;
using Loogn.OrmLite;

namespace project.dao.Models
{
    /// <summary>
    /// 
    /// </summary>
    public partial class SimpleOrder
    {
        [OrmLiteField(IsPrimaryKey = true, InsertIgnore = true)]
        public long Id { get; set; }

        /// <summary>
        /// 用户名
        /// </summary>
        public long UserId { get; set; }

        /// <summary>
        /// 订单号
        /// </summary>
        public string OrderNO { get; set; }

        /// <summary>
        /// 支付订单号
        /// </summary>
        public string transaction_id { get; set; }

        /// <summary>
        /// 支付完成时间
        /// </summary>
        public string time_end { get; set; }

        /// <summary>
        /// 订单金额（分）
        /// </summary>
        public int total_fee { get; set; }

        /// <summary>
        /// 订单描述
        /// </summary>
        public string body { get; set; }

        /// <summary>
        /// 订单状态，0-未支付，1-已支付，2-已取消，3-支付失败
        /// </summary>
        public int Status { get; set; }

        /// <summary>
        /// 订单类型 1-充值
        /// </summary>
        public int Type { get; set; }

        /// <summary>
        /// 添加时间
        /// </summary>
        public DateTime AddTime { get; set; }


    }
}
