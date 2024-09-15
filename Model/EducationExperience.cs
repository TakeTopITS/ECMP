using System;

namespace ProjectMgt.Model
{
    public class EducationExperience
    {
        public EducationExperience()
        {
        }

        private int id;
        private string userCode;
        private DateTime startTime;
        private DateTime endTime;
        private string school;
        private string major;
        private string certificate;

        public virtual int ID
        {
            get { return id; }
            set { id = value; }
        }

        public virtual string UserCode
        {
            get { return userCode; }
            set { userCode = value; }
        }

        public virtual DateTime StartTime
        {
            get { return startTime; }
            set { startTime = value; }
        }

        public virtual DateTime EndTime
        {
            get { return endTime; }
            set { endTime = value; }
        }

        public virtual string School
        {
            get { return school; }
            set { school = value; }
        }

        public virtual string Major
        {
            get { return major; }
            set { major = value; }
        }

        public virtual string Certificate
        {
            get { return certificate; }
            set { certificate = value; }
        }
    }
}