using System;

namespace ProjectMgt.Model
{
    public class RegisterUser
    {
        public RegisterUser()
        {
        }

        private int id;
        private string userName;
        private string company;
        private string email;
        private string phoneNumber;
        private string province;
        private string duty;
        private DateTime registerTime;
        private string mark;
        private string password;
        private int sendNumber;

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

        public virtual string Company
        {
            get { return company; }
            set { company = value; }
        }

        public virtual string EMail
        {
            get { return email; }
            set { email = value; }
        }

        public virtual string PhoneNumber
        {
            get { return phoneNumber; }
            set { phoneNumber = value; }
        }

        public virtual string Province
        {
            get { return province; }
            set { province = value; }
        }

        public virtual string Duty
        {
            get { return duty; }
            set { duty = value; }
        }

        public virtual DateTime RegisterTime
        {
            get { return registerTime; }
            set { registerTime = value; }
        }

        public virtual string Mark
        {
            get { return mark; }
            set { mark = value; }
        }

        public virtual string Password
        {
            get { return password; }
            set { password = value; }
        }

        public virtual int SendNumber
        {
            get { return sendNumber; }
            set { sendNumber = value; }
        }
    }
}