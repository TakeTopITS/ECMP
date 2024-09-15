using System;

namespace ProjectMgt.Model
{
    /// <summary>
    /// 采购申请
    /// </summary>
    public class BMPurchaseApplication
    {
        public BMPurchaseApplication()
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

        private string code;

        /// <summary>
        /// 申请编码 唯一  yyyyMM001
        /// </summary>
        public virtual string Code
        {
            get { return code; }
            set { code = value; }
        }

        public virtual int ProjectID
        {
            get;
            set;
        }

        private string name;

        /// <summary>
        /// 采购申请名称
        /// </summary>
        public virtual string Name
        {
            get { return name; }
            set { name = value; }
        }

        private string application;

        /// <summary>
        /// 申请人
        /// </summary>
        public virtual string Application
        {
            get { return application; }
            set { application = value; }
        }

        private DateTime applicationDate;

        /// <summary>
        /// 申请日期
        /// </summary>
        public virtual DateTime ApplicationDate
        {
            get { return applicationDate; }
            set { applicationDate = value; }
        }

        private string remark;

        /// <summary>
        /// 采购申请内容
        /// </summary>
        public virtual string Remark
        {
            get { return remark; }
            set { remark = value; }
        }

        private string enterCode;

        /// <summary>
        /// 采购申请内容
        /// </summary>
        public virtual string EnterCode
        {
            get { return enterCode; }
            set { enterCode = value; }
        }

        private string departName;

        /// <summary>
        /// 部门名称
        /// </summary>
        public virtual string DepartName
        {
            get { return departName; }
            set { departName = value; }
        }

        public virtual string EngineeringAddress
        {
            get;
            set;
        }

        public virtual decimal EngineeringNumber
        {
            get;
            set;
        }

        public virtual string EngineeringUnitName
        {
            get;
            set;
        }

        public virtual DateTime PlanStartTime
        {
            get;
            set;
        }

        public virtual decimal TotalDuration
        {
            get;
            set;
        }

        public virtual decimal DeviceNumber
        {
            get;
            set;
        }

        public virtual string DeviceUnitName
        {
            get;
            set;
        }

        public virtual string SiteCondition
        {
            get;
            set;
        }

        public virtual decimal ManHour
        {
            get;
            set;
        }

        public virtual string OtherComment
        {
            get;
            set;
        }

        public virtual decimal ExpectedAmount
        {
            get;
            set;
        }

        public virtual decimal ActualManHour
        {
            get;
            set;
        }

        public virtual decimal UnitPrice
        {
            get;
            set;
        }

        public virtual decimal ActualAmount
        {
            get;
            set;
        }

        public virtual string SupplierCode
        {
            get;
            set;
        }

        public virtual string SupplierName
        {
            get;
            set;
        }

        public virtual string Status
        {
            get;
            set;
        }

        public virtual decimal OutContractPayAmount
        {
            get;
            set;
        }

        public virtual decimal DeductedAmount
        {
            get;
            set;
        }

        public virtual decimal TotalPayAmount
        {
            get;
            set;
        }

        public virtual string AccountCode
        {
            get;
            set;
        }

        public virtual string AccountName
        {
            get;
            set;
        }

        public virtual string CurrencyType
        {
            get;
            set;
        }

        public virtual string Comment
        {
            get;
            set;
        }
    }
}