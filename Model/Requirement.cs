using System;

namespace ProjectMgt.Model
{
    public class Requirement
    {
        public Requirement()
        {
        }

        private int reqID;
        private string reqType;
        private string reqName;
        private string reqDetail;
        private string acceptStandard;
        private string applicantCode;
        private string applicantName;
        private DateTime makeDate;
        private DateTime reqFinishedDate;
        private string fileAddress;
        private string status;
        private int routeNumber;

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

        public virtual string ReqDetail
        {
            get { return reqDetail; }
            set { reqDetail = value; }
        }

        public virtual string AcceptStandard
        {
            get { return acceptStandard; }
            set { acceptStandard = value; }
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

        public virtual string FileAddress
        {
            get { return fileAddress; }
            set { fileAddress = value; }
        }

        public virtual string Status
        {
            get { return status; }
            set { status = value; }
        }

        public virtual int RouteNumber
        {
            get { return routeNumber; }
            set { routeNumber = value; }
        }
    }
}