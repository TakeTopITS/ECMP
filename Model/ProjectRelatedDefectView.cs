using System;

namespace ProjectMgt.Model
{
    public class ProjectRelatedDefectView
    {
        public ProjectRelatedDefectView()
        {
        }

        private int defectID;
        private string defectType;
        private string defectName;
        private string applicantCode;
        private string applicantName;
        private DateTime makeDate;
        private DateTime defectFinishedDate;
        private string status;
        private int projectID;

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