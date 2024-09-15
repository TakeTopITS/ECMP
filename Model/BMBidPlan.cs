using System;

namespace ProjectMgt.Model
{
    /// <summary>
    /// 招标计划
    /// </summary>
    public class BMBidPlan
    {
        public BMBidPlan()
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
        /// 招标计划名称
        /// </summary>
        public virtual string Name
        {
            get { return name; }
            set { name = value; }
        }

        private int purchaseAppID;

        /// <summary>
        /// 采购申请ID
        /// </summary>
        public virtual int PurchaseAppID
        {
            get { return purchaseAppID; }
            set { purchaseAppID = value; }
        }

        private string purchaseAppName;

        /// <summary>
        /// 采购申请名称
        /// </summary>
        public virtual string PurchaseAppName
        {
            get { return purchaseAppName; }
            set { purchaseAppName = value; }
        }

        public virtual string EnginerringSupplier
        {
            get; set;
        }

        public virtual string InternationSupplier
        {
            get; set;
        }

        public virtual string RetailSupplier
        {
            get; set;
        }

        public virtual string StoreSupplier
        {
            get; set;
        }

        private string bidType;

        /// <summary>
        /// 招标类型
        /// </summary>
        public virtual string BidType
        {
            get { return bidType; }
            set { bidType = value; }
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

        private string enterPer;

        /// <summary>
        /// 编制人
        /// </summary>
        public virtual string EnterPer
        {
            get { return enterPer; }
            set { enterPer = value; }
        }

        private DateTime enterDate;

        /// <summary>
        /// 编制日期
        /// </summary>
        public virtual DateTime EnterDate
        {
            get { return enterDate; }
            set { enterDate = value; }
        }

        private DateTime bidStartDate;

        /// <summary>
        /// 招标开始日期
        /// </summary>
        public virtual DateTime BidStartDate
        {
            get { return bidStartDate; }
            set { bidStartDate = value; }
        }

        private DateTime bidEndDate;

        /// <summary>
        /// 招标结束日期
        /// </summary>
        public virtual DateTime BidEndDate
        {
            get { return bidEndDate; }
            set { bidEndDate = value; }
        }

        private string bidAddress;

        /// <summary>
        /// 招标地点
        /// </summary>
        public virtual string BidAddress
        {
            get { return bidAddress; }
            set { bidAddress = value; }
        }

        private string enterDepart;

        /// <summary>
        /// 编制部门
        /// </summary>
        public virtual string EnterDepart
        {
            get { return enterDepart; }
            set { enterDepart = value; }
        }

        private string bidRemark;

        /// <summary>
        /// 招标内容
        /// </summary>
        public virtual string BidRemark
        {
            get { return bidRemark; }
            set { bidRemark = value; }
        }

        private string userCodeList;

        /// <summary>
        /// 专家成员列表
        /// </summary>
        public virtual string UserCodeList
        {
            get { return userCodeList; }
            set { userCodeList = value; }
        }

        private string enterCode;

        /// <summary>
        /// 编制人编码
        /// </summary>
        public virtual string EnterCode
        {
            get { return enterCode; }
            set { enterCode = value; }
        }

        private string purchaseAppCode;

        /// <summary>
        /// 采购申请名称
        /// </summary>
        public virtual string PurchaseAppCode
        {
            get { return purchaseAppCode; }
            set { purchaseAppCode = value; }
        }

        public virtual decimal BidLimitedPrice
        {
            get; set;
        }

        private string addUserCodeList;

        /// <summary>
        /// 追加现场参评人员
        /// </summary>
        public virtual string AddUserCodeList
        {
            get { return addUserCodeList; }
            set { addUserCodeList = value; }
        }
    }
}