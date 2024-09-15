using System;

namespace ProjectMgt.Model
{
    public class Defectment
    {
        public Defectment()
        {
        }

        private int defectID;
        private string defectType;
        private string defectName;
        private string defectDetail;
        private string acceptStandard;
        private string applicantCode;
        private string applicantName;
        private DateTime makeDate;
        private DateTime defectFinishedDate;
        private string fileAddress;
        private string status;
        private int routeNumber;

        public virtual int DefectID
        {
            get { return defectID; }
            set { defectID = value; }
        }

        public virtual string DefectType
        {
            get { return defectType; }
            set { defectType = value; }
        }

        public virtual string DefectName
        {
            get { return defectName; }
            set { defectName = value; }
        }

        public virtual string DefectDetail
        {
            get { return defectDetail; }
            set { defectDetail = value; }
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

        public virtual DateTime DefectFinishedDate
        {
            get { return defectFinishedDate; }
            set { defectFinishedDate = value; }
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