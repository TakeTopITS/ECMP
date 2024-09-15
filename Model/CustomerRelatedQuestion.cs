namespace ProjectMgt.Model
{
    public class CustomerRelatedQuestion
    {
        public CustomerRelatedQuestion()
        {
        }

        private int id;
        private string customerCode;
        private int questionID;

        public virtual int ID
        {
            get { return id; }
            set { id = value; }
        }

        public virtual string CustomerCode
        {
            get { return customerCode; }
            set { customerCode = value; }
        }

        public virtual int QuestionID
        {
            get { return questionID; }
            set { questionID = value; }
        }
    }
}