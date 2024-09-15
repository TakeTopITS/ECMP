using System;

namespace ProjectMgt.Model
{
    public class ProjectPrimavera
    {
        public ProjectPrimavera()
        {
        }

        private int id;
        private int projectID;
        private string projectCode;
        private string projectName;
        private DateTime beginDate;
        private DateTime endDate;
        private DateTime makeDate;
        private string guid;

        public virtual int ID
        {
            get { return id; }
            set { id = value; }
        }

        public virtual int ProjectID
        {
            get { return projectID; }
            set { projectID = value; }
        }

        public virtual string ProjectCode
        {
            get { return projectCode; }
            set { projectCode = value; }
        }

        public virtual string ProjectName
        {
            get { return projectName; }
            set { projectName = value; }
        }

        public virtual DateTime BeginDate
        {
            get { return beginDate; }
            set { beginDate = value; }
        }

        public virtual DateTime EndDate
        {
            get { return endDate; }
            set { endDate = value; }
        }

        public virtual DateTime MakeDate
        {
            get { return makeDate; }
            set { makeDate = value; }
        }

        public virtual string Guid
        {
            get { return guid; }
            set { guid = value; }
        }
    }
}