namespace ProjectMgt.Model
{
    public class ConstractType
    {
        public ConstractType()
        {
        }

        private string type;
        private string keyWord;
        private int sortNumber;

        public virtual string Type
        {
            get { return type; }
            set { type = value; }
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