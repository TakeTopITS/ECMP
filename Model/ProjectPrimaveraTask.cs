using System;

namespace ProjectMgt.Model
{
    public class ProjectPrimaveraTask
    {
        public ProjectPrimaveraTask()
        {
        }

        private int id;
        private int projectID;
        private string taskCode;
        private string taskName;
        private DateTime beginDate;
        private DateTime endDate;
        private DateTime createDate;
        private string taskGuid;
        private string projGuid;

        /// <summary>
        ///
        /// </summary>
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

        public virtual string TaskCode
        {
            get { return taskCode; }
            set { taskCode = value; }
        }

        public virtual string TaskName
        {
            get { return taskName; }
            set { taskName = value; }
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

        public virtual DateTime CreateDate
        {
            get { return createDate; }
            set { createDate = value; }
        }

        public virtual string TaskGuid
        {
            get { return taskGuid; }
            set { taskGuid = value; }
        }

        public virtual string ProjGuid
        {
            get { return projGuid; }
            set { projGuid = value; }
        }
    }
}