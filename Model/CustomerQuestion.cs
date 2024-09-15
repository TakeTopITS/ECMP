using System;

namespace ProjectMgt.Model
{
    public class CustomerQuestion
    {
        public CustomerQuestion()
        {
        }

        private int id;
        private string company;
        private string contactPerson;
        private string phoneNumber;
        private string email;
        private string address;
        private string postCode;
        private string type;
        private string isImportant;

        private string question;
        private DateTime summitTime;
        private DateTime answerTime;
        private string recorderCode;
        private string status;
        private string operatorCode;
        private string operatorName;
        private string operatorStauts;
        private string userIP;
        private string userPosition;
        private string customerArea;
        private string fromWebSite;

        public virtual string CustomerArea
        {
            get { return customerArea; }
            set { customerArea = value; }
        }

        public virtual int ID
        {
            get { return id; }
            set { id = value; }
        }

        public virtual string Company
        {
            get { return company; }
            set { company = value; }
        }

        public virtual string ContactPerson
        {
            get { return contactPerson; }
            set { contactPerson = value; }
        }

        public virtual string PhoneNumber
        {
            get { return phoneNumber; }
            set { phoneNumber = value; }
        }

        public virtual string EMail
        {
            get { return email; }
            set { email = value; }
        }

        public virtual string Address
        {
            get { return address; }
            set { address = value; }
        }

        public virtual string PostCode
        {
            get { return postCode; }
            set { postCode = value; }
        }

        public virtual string Type
        {
            get { return type; }
            set { type = value; }
        }

        public virtual string IsImportant
        {
            get { return isImportant; }
            set { isImportant = value; }
        }

        public virtual string Question
        {
            get { return question; }
            set { question = value; }
        }

        public virtual DateTime SummitTime
        {
            get { return summitTime; }
            set { summitTime = value; }
        }

        public virtual DateTime AnswerTime
        {
            get { return answerTime; }
            set { answerTime = value; }
        }

        public virtual string RecorderCode
        {
            get { return recorderCode; }
            set { recorderCode = value; }
        }

        public virtual string Status
        {
            get { return status; }
            set { status = value; }
        }

        public virtual string OperatorCode
        {
            get { return operatorCode; }
            set { operatorCode = value; }
        }

        public virtual string OperatorName
        {
            get { return operatorName; }
            set { operatorName = value; }
        }

        public virtual string OperatorStatus
        {
            get { return operatorStauts; }
            set { operatorStauts = value; }
        }

        public virtual string UserIP
        {
            get { return userIP; }
            set { userIP = value; }
        }

        public virtual string UserPosition
        {
            get { return userPosition; }
            set { userPosition = value; }
        }

        public virtual string FromWebSite
        {
            get { return fromWebSite; }
            set { fromWebSite = value; }
        }

        public virtual string BusinessName
        {
            get; set;
        }

        public virtual DateTime ExpectedTime
        {
            set; get;
        }

        public virtual string CustomerName
        {
            set;
            get;
        }

        public virtual string CustomerManager
        {
            set;
            get;
        }

        public virtual decimal ExpectedEarnings
        {
            set;
            get;
        }

        public virtual int Possibility
        {
            set;
            get;
        }

        public virtual string BusinessSource
        {
            set;
            get;
        }

        public virtual string SucessKeyReason
        {
            set;
            get;
        }

        public virtual string FailedKeyReason
        {
            set;
            get;
        }

        public virtual string AgencyName
        {
            set;
            get;
        }

        public virtual string Stage
        {
            set;
            get;
        }

        public virtual string CustomerStage
        {
            set;
            get;
        }
    }
}