using System;

namespace ProjectMgt.Model
{
    public class WorkFlowTemplate
    {
        public WorkFlowTemplate()
        {
        }

        private string temName;
        private string type;

        private DateTime createTime;
        private string creatorCode;
        private string creatorName;
        private string xsnFile;
        private string pageFile;
        private string status;
        private string authority;
        private string identifyString;
        private string wfDefinition;
        private string enableEdit;
        private string belongDepartCode;
        private string belongDepartName;
        private string chartURL;
        private int sortNumber;
        private string visible;
        private string designType;

        public virtual string TemName
        {
            get { return temName; }
            set { temName = value; }
        }

        public virtual string Type
        {
            get { return type; }
            set { type = value; }
        }

        public virtual DateTime CreateTime
        {
            get { return createTime; }
            set { createTime = value; }
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

        public virtual string XSNFile
        {
            get { return xsnFile; }
            set { xsnFile = value; }
        }

        public virtual string PageFile
        {
            get { return pageFile; }
            set { pageFile = value; }
        }

        public virtual string Status
        {
            get { return status; }
            set { status = value; }
        }

        public virtual string Authority
        {
            get { return authority; }
            set { authority = value; }
        }

        public virtual string IdentifyString
        {
            get { return identifyString; }
            set { identifyString = value; }
        }

        public virtual string WFDefinition
        {
            get { return wfDefinition; }
            set { wfDefinition = value; }
        }

        public virtual string EnableEdit
        {
            get { return enableEdit; }
            set { enableEdit = value; }
        }

        public virtual string BelongDepartCode
        {
            get { return belongDepartCode; }
            set { belongDepartCode = value; }
        }

        public virtual string BelongDepartName
        {
            get { return belongDepartName; }
            set { belongDepartName = value; }
        }

        public virtual string ChartURL
        {
            get { return chartURL; }
            set { chartURL = value; }
        }

        public virtual int SortNumber
        {
            get { return sortNumber; }
            set { sortNumber = value; }
        }

        public virtual string Visible
        {
            get { return visible; }
            set { visible = value; }
        }

        public virtual string AutoActive
        {
            get; set;
        }

        public virtual string DesignType
        {
            get { return designType; }
            set { designType = value; }
        }

        public virtual string OverTimeAutoAgree
        {
            get; set;
        }

        public virtual int OverTimeHourNumber
        {
            get; set;
        }
    }
}