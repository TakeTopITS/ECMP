using System;

namespace ProjectMgt.Model
{
    public class CustomerContactRecord
    {
        public CustomerContactRecord()
        {
        }

        private int id;
        private string type;
        private string comment;
        private string contactPerson;
        private string officePhone;
        private string mobilePhone;
        private string email1;
        private string msn;
        private string ysn;
        private string qq;
        private string company;
        private string department;
        private string duty;
        private string companyAddress;
        private string country;
        private string state;
        private string city;
        private string postCode;
        private string homeAddress;
        private string userCode;
        private string status;
        private DateTime nextContactTime;

        public virtual int ID
        {
            get { return id; }
            set { id = value; }
        }

        public virtual string Type
        {
            get { return type; }
            set { type = value; }
        }

        public virtual string Comment
        {
            get { return comment; }
            set { comment = value; }
        }

        public virtual string ContactPerson
        {
            get { return contactPerson; }
            set { contactPerson = value; }
        }

        public virtual string OfficePhone
        {
            get { return officePhone; }
            set { officePhone = value; }
        }

        public virtual string MobilePhone
        {
            get { return mobilePhone; }
            set { mobilePhone = value; }
        }

        public virtual string Email1
        {
            get { return email1; }
            set { email1 = value; }
        }

        public virtual string Msn
        {
            get { return msn; }
            set { msn = value; }
        }

        public virtual string Ysn
        {
            get { return ysn; }
            set { ysn = value; }
        }

        public virtual string QQ
        {
            get { return qq; }
            set { qq = value; }
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

        public virtual string Duty
        {
            get { return duty; }
            set { duty = value; }
        }

        public virtual string CompanyAddress
        {
            get { return companyAddress; }
            set { companyAddress = value; }
        }

        public virtual string Country
        {
            get { return country; }
            set { country = value; }
        }

        public virtual string State
        {
            get { return state; }
            set { state = value; }
        }

        public virtual string City
        {
            get { return city; }
            set { city = value; }
        }

        public virtual string PostCode
        {
            get { return postCode; }
            set { postCode = value; }
        }

        public virtual string HomeAddress
        {
            get { return homeAddress; }
            set { homeAddress = value; }
        }

        public virtual string UserCode
        {
            get { return userCode; }
            set { userCode = value; }
        }

        public virtual string Status
        {
            get { return status; }
            set { status = value; }
        }

        public virtual DateTime NextContactTime
        {
            get { return nextContactTime; }
            set { nextContactTime = value; }
        }
    }
}