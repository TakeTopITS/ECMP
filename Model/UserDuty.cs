namespace ProjectMgt.Model
{
    public class UserDuty
    {
        public UserDuty()
        {
        }

        private string duty;
        private string keyWord;
        private int sortNumber;

        public virtual string Duty
        {
            get { return duty; }
            set { duty = value; }
        }

        public virtual string KeyWord
        {
            get { return keyWord; }
            set { keyWord = value; }
        }

        public virtual int SortNumber
        {
            get { return sortNumber; }
            set { sortNumber = value; }
        }
    }
}