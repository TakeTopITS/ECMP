namespace ProjectMgt.Model
{
    public class CustomerQuestionRelatedCandidate
    {
        public CustomerQuestionRelatedCandidate()
        {
        }

        private int id;
        private int questionID;
        private string userName;

        public virtual int ID
        {
            get { return id; }
            set { id = value; }
        }

        public virtual int QuestionID
        {
            get { return questionID; }
            set { questionID = value; }
        }

        public virtual string UserName
        {
            get { return userName; }
            set { userName = value; }
        }
    }
}