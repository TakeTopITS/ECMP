using System;

namespace ProjectMgt.Model
{
    public class Constract
    {
        public Constract()
        {
        }

        private int constractID;
        private string constractCode;
        private string constractName;
        private string constractClass;
        private string type;

        private DateTime signDate;
        private decimal amount;
        private string currency;
        private string reAndPayType;
        private string departCode;
        private string departName;
        private DateTime startDate;
        private DateTime endDate;
        private string status;
        private string mainContent;
        private string constractMainDocURL;
        private string exception;
        private string partA;
        private string partAOperator;
        private string partB;
        private string partBOperator;
        private DateTime recordTime;
        private string recorderCode;
        private string recorderName;
        private string relatedCustomerCode;
        private string relatedVendorCode;

        private string parentCode;

        private string archiveTime;



        public virtual string ConstractCode
        {
            get { return constractCode; }
            set { constractCode = value; }
        }

        public virtual string ConstractName
        {
            get { return constractName; }
            set { constractName = value; }
        }

        public virtual string ConstractClass
        {
            get { return constractClass; }
            set { constractClass = value; }
        }

        public virtual string Type
        {
            get { return type; }
            set { type = value; }
        }

        public virtual DateTime SignDate
        {
            get { return signDate; }
            set { signDate = value; }
        }

        public virtual decimal Amount
        {
            get { return amount; }
            set { amount = value; }
        }

        public virtual string Currency
        {
            get { return currency; }
            set { currency = value; }
        }

        public virtual string ReAndPayType
        {
            get { return reAndPayType; }
            set { reAndPayType = value; }
        }

        public virtual string DepartCode
        {
            get { return departCode; }
            set { departCode = value; }
        }

        public virtual string DepartName
        {
            get { return departName; }
            set { departName = value; }
        }

        public virtual DateTime StartDate
        {
            get { return startDate; }
            set { startDate = value; }
        }

        public virtual DateTime EndDate
        {
            get { return endDate; }
            set { endDate = value; }
        }

        public virtual string Status
        {
            get { return status; }
            set { status = value; }
        }

        public virtual string MainContent
        {
            get { return mainContent; }
            set { mainContent = value; }
        }

        public virtual string ConstractMainDocURL
        {
            get; set;
        }

        public virtual string Exception
        {
            get { return exception; }
            set { exception = value; }
        }

        public virtual string PartA
        {
            get { return partA; }
            set { partA = value; }
        }

        public virtual string PartAOperator
        {
            get { return partAOperator; }
            set { partAOperator = value; }
        }

        public virtual string PartB
        {
            get { return partB; }
            set { partB = value; }
        }

        public virtual string PartBOperator
        {
            get { return partBOperator; }
            set { partBOperator = value; }
        }

        public virtual DateTime RecordTime
        {
            get { return recordTime; }
            set { recordTime = value; }
        }

        public virtual String RecorderCode
        {
            get { return recorderCode; }
            set { recorderCode = value; }
        }

        public virtual String RecorderName
        {
            get { return recorderName; }
            set { recorderName = value; }
        }

        public virtual int ConstractID
        {
            get { return constractID; }
            set { constractID = value; }
        }

        public virtual string RelatedCustomerCode
        {
            get { return relatedCustomerCode; }
            set { relatedCustomerCode = value; }
        }

        public virtual string RelatedVendorCode
        {
            get { return relatedVendorCode; }
            set { relatedVendorCode = value; }
        }

        public virtual string ParentCode
        {
            get { return parentCode; }
            set { parentCode = value; }
        }

        public virtual string ArchiveTime
        {
            get { return archiveTime; }
            set { archiveTime = value; }
        }

        public virtual decimal ProvisionalAmount
        {
            get; set;
        }

        public virtual decimal SafeCivilizedFee
        {
            get; set;
        }

        public virtual string PartAConnectWay
        {
            get; set;
        }

        public virtual string PartBConnectWay
        {
            get; set;
        }
    }
}