using System;

namespace ProjectMgt.Model
{
    /// <summary>
    /// 回函信息
    /// </summary>
    public class BMSupplierReply
    {
        public BMSupplierReply()
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

        private int annClaFileID;

        /// <summary>
        /// 招标澄清ID
        /// </summary>
        public virtual int AnnClaFileID
        {
            get { return annClaFileID; }
            set { annClaFileID = value; }
        }

        private int supplierId;

        /// <summary>
        /// 供应商ID
        /// </summary>
        public virtual int SupplierId
        {
            get { return supplierId; }
            set { supplierId = value; }
        }

        private DateTime replyDate;

        /// <summary>
        /// 回函时间
        /// </summary>
        public virtual DateTime ReplyDate
        {
            get { return replyDate; }
            set { replyDate = value; }
        }

        private string sendContent;

        /// <summary>
        /// 回函内容
        /// </summary>
        public virtual string SendContent
        {
            get { return sendContent; }
            set { sendContent = value; }
        }
    }
}