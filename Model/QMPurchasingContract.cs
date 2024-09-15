using System;

namespace ProjectMgt.Model
{
    /// <summary>
    /// 采购合同信息
    /// </summary>
    public class QMPurchasingContract
    {
        public QMPurchasingContract()
        {
        }

        private string code;
        private string name;
        private string companyCode;
        private string companyName;
        private string transportUnit;
        private string receivingUnit;
        private string status;
        private DateTime createDate;
        private string createPer;

        /// <summary>
        /// 格式：QMPCCX
        /// </summary>
        public virtual string Code
        {
            get { return code; }
            set { code = value; }
        }

        public virtual string Name
        {
            get { return name; }
            set { name = value; }
        }

        public virtual string CompanyCode
        {
            get { return companyCode; }
            set { companyCode = value; }
        }

        public virtual string CompanyName
        {
            get { return companyName; }
            set { companyName = value; }
        }

        public virtual string TransportUnit
        {
            get { return transportUnit; }
            set { transportUnit = value; }
        }

        public virtual string ReceivingUnit
        {
            get { return receivingUnit; }
            set { receivingUnit = value; }
        }

        public virtual string Status
        {
            get { return status; }
            set { status = value; }
        }

        private string isOverAll;

        public virtual string IsOverAll
        {
            get { return isOverAll; }
            set { isOverAll = value; }
        }

        private string isTechnicalDisclosure;

        public virtual string IsTechnicalDisclosure
        {
            get { return isTechnicalDisclosure; }
            set { isTechnicalDisclosure = value; }
        }

        private string qualityRepStatus;

        public virtual string QualityRepStatus
        {
            get { return qualityRepStatus; }
            set { qualityRepStatus = value; }
        }

        private string qualityInsStatus;

        public virtual string QualityInsStatus
        {
            get { return qualityInsStatus; }
            set { qualityInsStatus = value; }
        }

        private string qualityPenNotStatus;

        public virtual string QualityPenNotStatus
        {
            get { return qualityPenNotStatus; }
            set { qualityPenNotStatus = value; }
        }

        private string remark;

        public virtual string Remark
        {
            get { return remark; }
            set { remark = value; }
        }

        public virtual DateTime CreateDate
        {
            get { return createDate; }
            set { createDate = value; }
        }

        public virtual string CreatePer
        {
            get { return createPer; }
            set { createPer = value; }
        }

        private string enterCode;

        public virtual string EnterCode
        {
            get { return enterCode; }
            set { enterCode = value; }
        }

        public virtual string RelatedConstractCode
        {
            get; set;
        }

        public virtual string RelatedConstractName
        {
            get; set;
        }
    }
}