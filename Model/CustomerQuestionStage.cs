namespace ProjectMgt.Model
{
    public class CustomerQuestionStage
    {
        public CustomerQuestionStage()
        {
        }

        public virtual string Stage
        {
            set;
            get;
        }

        public virtual int Possibility
        {
            set;
            get;
        }
    }
}