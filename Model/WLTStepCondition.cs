namespace ProjectMgt.Model
{
    public class WLTStepCondition
    {
        public WLTStepCondition()
        {
        }

        private int conID;
        private int stepID;
        private string conDetail;
        private int nextSortNumber;
        private string guid;
        private string temName;

        public virtual int ConID
        {
            set { conID = value; }
            get { return conID; }
        }

        public virtual int StepID
        {
            set { stepID = value; }
            get { return stepID; }
        }

        public virtual string ConDetail
        {
            set { conDetail = value; }
            get { return conDetail; }
        }

        public virtual int NextSortNumber
        {
            set { nextSortNumber = value; }
            get { return nextSortNumber; }
        }

        public virtual string GUID
        {
            get { return guid; }
            set { guid = value; }
        }

        public virtual string TemName
        {
            get { return temName; }
            set { temName = value; }
        }
    }
}