using System;

namespace ProjectMgt.Model
{
    /// <summary>
    /// 中标/未中标通知书
    /// </summary>
    public class BMBidNoticeContent
    {
        public BMBidNoticeContent()
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

        private DateTime noticeDate;

        /// <summary>
        /// 通知日期
        /// </summary>
        public virtual DateTime NoticeDate
        {
            get { return noticeDate; }
            set { noticeDate = value; }
        }

        private string bidWinContent;

        /// <summary>
        /// 中标通知内容
        /// </summary>
        public virtual string BidWinContent
        {
            get { return bidWinContent; }
            set { bidWinContent = value; }
        }

        private string noBidWinContent;

        /// <summary>
        /// 未中标通知内容
        /// </summary>
        public virtual string NoBidWinContent
        {
            get { return noBidWinContent; }
            set { noBidWinContent = value; }
        }

        private string enterCode;

        /// <summary>
        /// 未中标通知内容
        /// </summary>
        public virtual string EnterCode
        {
            get { return enterCode; }
            set { enterCode = value; }
        }
    }
}