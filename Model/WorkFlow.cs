using System;

namespace ProjectMgt.Model
{
    public class WorkFlow
    {
        public WorkFlow()
        {
        }

        private int wlID;
        private string wlName;
        private string wlType;
        private string xmlFile;
        private string xsnFile;
        private string temName;
        private string creatorCode;
        private string creatorName;
        private DateTime createTime;
        private string description;
        private string relatedType;
        private int relatedID;
        private string relatedCode;
        private string receiveSMS;
        private string receiveEMail;
        private string diyNextStep;
        private string fieldList;
        private string editFieldList;
        private string canNotNullFieldList;
        private string isPlanMainWorkflow;

        private decimal manHour;
        private decimal expense;

        private string status;

        public virtual int WLID
        {
            get { return wlID; }
            set { wlID = value; }
        }

        public virtual string WLName
        {
            get { return wlName; }
            set { wlName = value; }
        }

        public virtual string WLType
        {
            get { return wlType; }
            set { wlType = value; }
        }

        public virtual string XMLFile
        {
            get { return xmlFile; }
            set { xmlFile = value; }
        }

        public virtual string XSNFile
        {
            get { return xsnFile; }
            set { xsnFile = value; }
        }

        public virtual string TemName
        {
            get { return temName; }
            set { temName = value; }
        }

        public virtual string CreatorCode
        {
            get { return creatorCode; }
            set { creatorCode = value; }
        }

        public virtual string CreatorName
        {
            get { return creatorName; }
            set { creatorName = value; }
        }

        public virtual DateTime CreateTime
        {
            get { return createTime; }
            set { createTime = value; }
        }

        public virtual string Description
        {
            get { return description; }
            set { description = value; }
        }

        public virtual string RelatedType
        {
            get { return relatedType; }
            set { relatedType = value; }
        }

        public virtual int RelatedID
        {
            get { return relatedID; }
            set { relatedID = value; }
        }

        public virtual string RelatedCode
        {
            get { return relatedCode; }
            set { relatedCode = value; }
        }

        public virtual string ReceiveSMS
        {
            get { return receiveSMS; }
            set { receiveSMS = value; }
        }

        public virtual string ReceiveEMail
        {
            get { return receiveEMail; }
            set { receiveEMail = value; }
        }

        public virtual string DIYNextStep
        {
            get { return diyNextStep; }
            set { diyNextStep = value; }
        }

        public virtual string FieldList
        {
            get { return fieldList; }
            set { fieldList = value; }
        }

        public virtual string EditFieldList
        {
            get { return editFieldList; }
            set { editFieldList = value; }
        }

        public virtual string CanNotNullFieldList
        {
            get { return canNotNullFieldList; }
            set { canNotNullFieldList = value; }
        }

        public virtual string Status
        {
            get { return status; }
            set { status = value; }
        }

        public virtual string IsPlanMainWorkflow
        {
            get { return isPlanMainWorkflow; }
            set { isPlanMainWorkflow = value; }
        }

        public virtual decimal ManHour
        {
            get { return manHour; }
            set { manHour = value; }
        }

        public virtual decimal Expense
        {
            get { return expense; }
            set { expense = value; }
        }

        public virtual string BusinessType
        {
            get; set;
        }

        public virtual string BusinessCode
        {
            get; set;
        }
    }
}