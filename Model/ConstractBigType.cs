namespace ProjectMgt.Model
{
    public class ConstractBigType
    {
        public ConstractBigType()
        {
        }

        private string bigType;
        private int sortNumber;

        public virtual string BigType
        {
            get { return bigType; }
            set { bigType = value; }
        }

        public virtual int SortNumber
        {
            get { return sortNumber; }
            set { sortNumber = value; }
        }
    }
}