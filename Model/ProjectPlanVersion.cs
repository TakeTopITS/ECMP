using System;

namespace ProjectMgt.Model
{
    public class ProjectPlanVersion
    {
        public ProjectPlanVersion()
        {
        }

        private int id;
        private int verID;
        private int projectID;
        private string type;
        private string creatorCode;
        private DateTime createTime;
        private int fromProjectID;
        private int fromProjectPlanVerID;

        public virtual int ID
        {
            get { return id; }
            set { id = value; }
        }

        public virtual int VerID
        {
            get { return verID; }
            set { verID = value; }
        }

        public virtual int ProjectID
        {
            get { return projectID; }
            set { projectID = value; }
        }

        public virtual string Type
        {
            get { return type; }
            set { type = value; }
        }

        public virtual string CreatorCode
        {
            get { return creatorCode; }
            set { creatorCode = value; }
        }

        public virtual DateTime CreateTime
        {
            get { return createTime; }
            set { createTime = value; }
        }

        public virtual int FromProjectID
        {
            get { return fromProjectID; }
            set { fromProjectID = value; }
        }

        public virtual int FromProjectPlanVerID
        {
            get { return fromProjectPlanVerID; }
            set { fromProjectPlanVerID = value; }
        }
    }
}