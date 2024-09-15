using System;

namespace ProjectMgt.Model
{
    /// <summary>
    /// 评标记录
    /// </summary>
    public class BMAssessBidRecord
    {
        public BMAssessBidRecord()
        {
        }

        private int id;

        /// <summary>
        /// 自增ID
        /// </summary>
        public virtual int ID
        {
            get { return id; }
            set { id = value; }
        }

        private string name;

        /// <summary>
        /// 评标名称
        /// </summary>
        public virtual string Name
        {
            get { return name; }
            set { name = value; }
        }

        private int openBidRecordID;

        /// <summary>
        /// 开标记录ID
        /// </summary>
        public virtual int OpenBidRecordID
        {
            get { return openBidRecordID; }
            set { openBidRecordID = value; }
        }

        private string openBidRecordName;

        /// <summary>
        /// 开标记录名称
        /// </summary>
        public virtual string OpenBidRecordName
        {
            get { return openBidRecordName; }
            set { openBidRecordName = value; }
        }

        private decimal budgetPrice;

        /// <summary>
        /// 预算价
        /// </summary>
        public virtual decimal BudgetPrice
        {
            get { return budgetPrice; }
            set { budgetPrice = value; }
        }

        private decimal reservePrice;

        /// <summary>
        /// 标底价
        /// </summary>
        public virtual decimal ReservePrice
        {
            get { return reservePrice; }
            set { reservePrice = value; }
        }

        private string assessBidder;

        /// <summary>
        /// 评标人
        /// </summary>
        public virtual string AssessBidder
        {
            get { return assessBidder; }
            set { assessBidder = value; }
        }

        private string bidWay;

        /// <summary>
        /// 招标方式
        /// </summary>
        public virtual string BidWay
        {
            get { return bidWay; }
            set { bidWay = value; }
        }

        private string assessBidFactors;

        /// <summary>
        /// 评标要素
        /// </summary>
        public virtual string AssessBidFactors
        {
            get { return assessBidFactors; }
            set { assessBidFactors = value; }
        }

        private DateTime assessBidDate;

        /// <summary>
        /// 评标日期
        /// </summary>
        public virtual DateTime AssessBidDate
        {
            get { return assessBidDate; }
            set { assessBidDate = value; }
        }

        private string assessBidContent;

        /// <summary>
        /// 评标内容
        /// </summary>
        public virtual string AssessBidContent
        {
            get { return assessBidContent; }
            set { assessBidContent = value; }
        }
    }
}