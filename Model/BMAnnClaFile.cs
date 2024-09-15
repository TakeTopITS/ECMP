using System;

namespace ProjectMgt.Model
{
    /// <summary>
    /// 澄清/答疑文件
    /// </summary>
    public class BMAnnClaFile
    {
        public BMAnnClaFile()
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

        private string type;

        /// <summary>
        /// 类型 澄清/答疑
        /// </summary>
        public virtual string Type
        {
            get { return type; }
            set { type = value; }
        }

        private int bidPlanID;

        /// <summary>
        /// 招标计划ID
        /// </summary>
        public virtual int BidPlanID
        {
            get { return bidPlanID; }
            set { bidPlanID = value; }
        }

        private string bidPlanName;

        /// <summary>
        /// 招标计划名称
        /// </summary>
        public virtual string BidPlanName
        {
            get { return bidPlanName; }
            set { bidPlanName = value; }
        }

        private string supplierCode;

        /// <summary>
        /// 供应商编码
        /// </summary>
        public virtual string SupplierCode
        {
            get { return supplierCode; }
            set { supplierCode = value; }
        }

        private string sendContent;

        /// <summary>
        /// 发送内容
        /// </summary>
        public virtual string SendContent
        {
            get { return sendContent; }
            set { sendContent = value; }
        }

        private string replyContent;

        /// <summary>
        /// 回复内容
        /// </summary>
        public virtual string ReplyContent
        {
            get { return replyContent; }
            set { replyContent = value; }
        }

        private string enterPer;

        /// <summary>
        /// 操作人，指发送人
        /// </summary>
        public virtual string EnterPer
        {
            get { return enterPer; }
            set { enterPer = value; }
        }

        private DateTime sentDate;

        /// <summary>
        /// 发送时间
        /// </summary>
        public virtual DateTime SentDate
        {
            get { return sentDate; }
            set { sentDate = value; }
        }

        private DateTime replyDate;

        /// <summary>
        /// 回复时间
        /// </summary>
        public virtual DateTime ReplyDate
        {
            get { return replyDate; }
            set { replyDate = value; }
        }

        private string enterCode;

        /// <summary>
        /// 操作人编码，指发送人编码
        /// </summary>
        public virtual string EnterCode
        {
            get { return enterCode; }
            set { enterCode = value; }
        }
    }
}