using System;

namespace ProjectMgt.Model
{
    public class ProjectRelatedReqView
    {
        public ProjectRelatedReqView()
        {
        }

        private int reqID;
        private string reqType;
        private string reqName;
        private string applicantCode;
        private string applicantName;
        private DateTime makeDate;
        private DateTime reqFinishedDate;
        private string status;
        private int projectID;

        public virtual int ReqID
        {
            get { return reqID; }
            set { reqID = value; }
        }

        public virtual string ReqType
        {
            get { return reqType; }
            set { reqType = value; }
        }

        public virtual string ReqName
        {
            get { return reqName; }
            set { reqName = value; }
        }

        public virtual string ApplicantCode
        {
            get { return applicantCode; }
            set { applicantCode = value; }
        }

        public virtual string ApplicantName
        {
            get { return applicantName; }
            set { applicantName = value; }
        }

        public virtual DateTime MakeDate
        {
            get { return makeDate; }
            set { makeDate = value; }
        }

        public virtual DateTime ReqFinishedDate
        {
            get { return reqFinishedDate; }
            set { reqFinishedDate = value; }
        }

        public virtual string Status
        {
            get { return status; }
            set { status = value; }
        }

        public virtual int ProjectID
        {
            get { return projectID; }
            set { projectID = value; }
        }
    }
}