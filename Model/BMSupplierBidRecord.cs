using System;

namespace ProjectMgt.Model
{
    /// <summary>
    /// 供应商投标历史记录
    /// </summary>
    public class BMSupplierBidRecord
    {
        public BMSupplierBidRecord()
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

        private int supplierBidID;

        /// <summary>
        /// 供应商投标ID
        /// </summary>
        public virtual int SupplierBidID
        {
            get { return supplierBidID; }
            set { supplierBidID = value; }
        }

        private int annInvitationID;

        /// <summary>
        /// 招标公告/邀请函ID
        /// </summary>
        public virtual int AnnInvitationID
        {
            get { return annInvitationID; }
            set { annInvitationID = value; }
        }

        private int supplierCode;

        /// <summary>
        /// 供应商编号
        /// </summary>
        public virtual int SupplierCode
        {
            get { return supplierCode; }
            set { supplierCode = value; }
        }

        private string biddingContent;

        /// <summary>
        /// 投标内容
        /// </summary>
        public virtual string BiddingContent
        {
            get { return biddingContent; }
            set { biddingContent = value; }
        }

        private string operationType;

        /// <summary>
        /// 操作类型 删除，修改，新增
        /// </summary>
        public virtual string OperationType
        {
            get { return operationType; }
            set { operationType = value; }
        }

        private DateTime operationDate;

        /// <summary>
        /// 操作时间
        /// </summary>
        public virtual DateTime OperationDate
        {
            get { return operationDate; }
            set { operationDate = value; }
        }
    }
}