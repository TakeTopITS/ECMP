using System;

namespace ProjectMgt.Model
{
    public class TransferProject
    {
        public TransferProject()
        {
        }

        private int id;
        private int projectID;
        private string actor;
        private string oldPMCode;
        private string oldPMName;
        private string newPMCode;
        private string newPMName;
        private DateTime changeTime;

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

        public virtual string Actor
        {
            get { return actor; }
            set { actor = value; }
        }

        public virtual string OldPMCode
        {
            get { return oldPMCode; }
            set { oldPMCode = value; }
        }

        public virtual string OldPMName
        {
            get { return oldPMName; }
            set { oldPMName = value; }
        }

        public virtual string NewPMCode
        {
            get { return newPMCode; }
            set { newPMCode = value; }
        }

        public virtual string NewPMName
        {
            get { return newPMName; }
            set { newPMName = value; }
        }

        public virtual DateTime ChangeTime
        {
            get { return changeTime; }
            set { changeTime = value; }
        }
    }
}