using System;

namespace ProjectMgt.Model
{
    /// <summary>
    /// 开标记录
    /// </summary>
    public class BMOpenBidRecord
    {
        public BMOpenBidRecord()
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
        /// 开标名称
        /// </summary>
        public virtual string Name
        {
            get { return name; }
            set { name = value; }
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

        private string openBidder;

        /// <summary>
        /// 开标人
        /// </summary>
        public virtual string OpenBidder
        {
            get { return openBidder; }
            set { openBidder = value; }
        }

        private DateTime openBidDate;

        /// <summary>
        /// 开标日期
        /// </summary>
        public virtual DateTime OpenBidDate
        {
            get { return openBidDate; }
            set { openBidDate = value; }
        }

        private string openBidRemark;

        /// <summary>
        /// 开标内容
        /// </summary>
        public virtual string OpenBidRemark
        {
            get { return openBidRemark; }
            set { openBidRemark = value; }
        }
    }
}