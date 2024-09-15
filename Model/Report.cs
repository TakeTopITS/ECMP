using System;

namespace ProjectMgt.Model
{
    public class Report
    {
        public Report()
        {
        }

        private int id;
        private string reportType;
        private string reportName;
        private string reportComment;
        private string temName;
        private string reportURL;
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

        public virtual string ReportName
        {
            get { return reportName; }
            set { reportName = value; }
        }

        public virtual string ReportComment
        {
            get { return reportComment; }
            set { reportComment = value; }
        }

        public virtual string TemName
        {
            get { return temName; }
            set { temName = value; }
        }

        public virtual string ReportURL
        {
            get { return reportURL; }
            set { reportURL = value; }
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
    }
}