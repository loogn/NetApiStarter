using System;
using Loogn.OrmLite;

namespace project.dao.Models
{
    /// <summary>
    /// 
    /// </summary>
    public partial class PayOrder
    {
        [OrmLiteField(IsPrimaryKey = true, InsertIgnore = true)]
        public long Id { get; set; }
        
        /// <summary>
        /// 用户名
        /// </summary>
        public long UserId { get; set; }

        /// <summary>
        /// 支付编号
        /// </summary>
        public string PayNO { get; set; }

        /// <summary>
        /// 订单号
        /// </summary>
        public string OrderNO { get; set; }

        /// <summary>
        /// 支付订单号
        /// </summary>
        public string TransactionId { get; set; }

        /// <summary>
        /// 备注
        /// </summary>
        public string Remark { get; set; }

        /// <summary>
        /// 订单类型 1-线上订单
        /// </summary>
        public int Type { get; set; }

        /// <summary>
        /// 添加时间
        /// </summary>
        public DateTime AddTime { get; set; }

        /// <summary>
        /// 支付时间
        /// </summary>
        public DateTime PayTime { get; set; }

        /// <summary>
        /// 支付状态1-已支付，2-未支付
        /// </summary>
        public int PayStatus { get; set; }

        /// <summary>
        /// 支付方式1-微信
        /// </summary>
        public int PayMethod { get; set; }

        /// <summary>
        /// 金额
        /// </summary>
        public decimal Amount { get; set; }


    }
}
