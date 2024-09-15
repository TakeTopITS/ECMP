using System;

namespace ProjectMgt.Model
{
    public class ReportTemplate
    {
        public ReportTemplate()
        {
        }

        private int id;
        private string reportType;
        private string temName;
        private string temComment;
        private string temDefinition;
        private string creatorCode;
        private string creatorName;
        private DateTime createTime;

        public virtual int ID
        {
            get { return id; }
            set { id = value; }
        }

        public virtual string ReportType
        {
            get { return reportType; }
            set { reportType = value; }
        }

        public virtual string TemName
        {
            get { return temName; }
            set { temName = value; }
        }

        public virtual string TemComment
        {
            get { return temComment; }
            set { temComment = value; }
        }

        public virtual string TemDefinition
        {
            get { return temDefinition; }
            set { temDefinition = value; }
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

        public virtual string BelongDepartCode
        {
            get; set;
        }

        public virtual string BelongDepartName
        {
            get; set;
        }
    }
}