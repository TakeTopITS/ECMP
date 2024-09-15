namespace ProjectMgt.Model
{
    public class ContactInfor
    {
        public ContactInfor()
        {
        }

        private int id;
        private string firstName;
        private string lastName;
        private string gender;
        private int age;
        private string officePhone;
        private string homePhone;
        private string mobilePhone;
        private string email1;
        private string email2;
        private string webSite;
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
        private string type;
        private string relatedType;
        private string relatedID;

        public virtual int ID
        {
            get { return id; }
            set { id = value; }
        }

        public virtual string FirstName
        {
            get { return firstName; }
            set { firstName = value; }
        }

        public virtual string LastName
        {
            get { return lastName; }
            set { lastName = value; }
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

        public virtual string OfficePhone
        {
            get { return officePhone; }
            set { officePhone = value; }
        }

        public virtual string HomePhone
        {
            get { return homePhone; }
            set { homePhone = value; }
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

        public virtual string Email2
        {
            get { return email2; }
            set { email2 = value; }
        }

        public virtual string WebSite
        {
            get { return webSite; }
            set { webSite = value; }
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

        public virtual string Type
        {
            get { return type; }
            set { type = value; }
        }

        public virtual string RelatedType
        {
            get { return relatedType; }
            set { relatedType = value; }
        }

        public virtual string RelatedID
        {
            get { return relatedID; }
            set { relatedID = value; }
        }
    }
}