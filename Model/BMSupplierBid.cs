using System;

namespace ProjectMgt.Model
{
    /// <summary>
    /// 供应商投标
    /// </summary>
    public class BMSupplierBid
    {
        public BMSupplierBid()
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

        private int annInvitationID;

        /// <summary>
        /// 招标公告/邀请函ID
        /// </summary>
        public virtual int AnnInvitationID
        {
            get { return annInvitationID; }
            set { annInvitationID = value; }
        }

        private string annInvitationName;

        /// <summary>
        /// 招标公告/邀请函名称
        /// </summary>
        public virtual string AnnInvitationName
        {
            get { return annInvitationName; }
            set { annInvitationName = value; }
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

        private string bidStatus;

        /// <summary>
        /// 中标标识 W(代表未开标) Y(代表中标) N(代表未中标)
        /// </summary>
        public virtual string BidStatus
        {
            get { return bidStatus; }
            set { bidStatus = value; }
        }

        private string noticeContent;

        /// <summary>
        /// 中标与否的通知内容
        /// </summary>
        public virtual string NoticeContent
        {
            get { return noticeContent; }
            set { noticeContent = value; }
        }

        private DateTime biddingDate;

        /// <summary>
        /// 投标时间
        /// </summary>
        public virtual DateTime BiddingDate
        {
            get { return biddingDate; }
            set { biddingDate = value; }
        }

        private string exportResult;

        /// <summary>
        /// 专家评估意见
        /// </summary>
        public virtual string ExportResult
        {
            get { return exportResult; }
            set { exportResult = value; }
        }
    }
}