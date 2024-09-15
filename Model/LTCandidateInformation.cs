using System;

namespace ProjectMgt.Model
{
    public class LTCandidateInformation
    {
        public LTCandidateInformation()
        {
        }

        private int id;
        private string userName;
        private string gender;
        private int age;
        private string company;
        private string department;
        private string currentDuty;
        private string mobilePhone;
        private string brief;
        private string photoURL;

        private string belongDepartCode;
        private string belongDepartName;
        private string creatorCode;

        private DateTime createTime;
        private string status;

        public virtual int ID
        {
            get { return id; }
            set { id = value; }
        }

        public virtual string UserName
        {
            get { return userName; }
            set { userName = value; }
        }

        public virtual string Gender
        {
            get { return gender; }
            set { gender = value; }
        }

        public virtual int Age
        {
            get { return age; }
            set { age = value; }
        }

        public virtual string CurrentDuty
        {
            get { return currentDuty; }
            set { currentDuty = value; }
        }

        public virtual string MobilePhone
        {
            get { return mobilePhone; }
            set { mobilePhone = value; }
        }

        public virtual string Brief
        {
            get { return brief; }
            set { brief = value; }
        }

        public virtual DateTime CreateTime
        {
            get { return createTime; }
            set { createTime = value; }
        }

        public virtual string Company
        {
            get { return company; }
            set { company = value; }
        }

        public virtual string Department
        {
            get { return department; }
            set { department = value; }
        }

        public virtual string PhotoURL
        {
            get { return photoURL; }
            set { photoURL = value; }
        }

        public virtual string BelongDepartCode
        {
            get { return belongDepartCode; }
            set { belongDepartCode = value; }
        }

        public virtual string BelongDepartName
        {
            get { return belongDepartName; }
            set { belongDepartName = value; }
        }

        public virtual string CreatorCode
        {
            get { return creatorCode; }
            set { creatorCode = value; }
        }

        public virtual string Status
        {
            get { return status; }
            set { status = value; }
        }
    }
}