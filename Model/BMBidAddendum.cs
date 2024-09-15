using System;

namespace ProjectMgt.Model
{
    /// <summary>
    /// 招标补遗
    /// </summary>
    public class BMBidAddendum
    {
        public BMBidAddendum()
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

        private string addendumer;

        /// <summary>
        /// 补遗人
        /// </summary>
        public virtual string Addendumer
        {
            get { return addendumer; }
            set { addendumer = value; }
        }

        private DateTime addendumDate;

        /// <summary>
        /// 补遗日期
        /// </summary>
        public virtual DateTime AddendumDate
        {
            get { return addendumDate; }
            set { addendumDate = value; }
        }

        private string addendumContent;

        /// <summary>
        /// 补遗内容
        /// </summary>
        public virtual string AddendumContent
        {
            get { return addendumContent; }
            set { addendumContent = value; }
        }

        private string enterCode;

        /// <summary>
        /// 补遗人编码
        /// </summary>
        public virtual string EnterCode
        {
            get { return enterCode; }
            set { enterCode = value; }
        }
    }
}