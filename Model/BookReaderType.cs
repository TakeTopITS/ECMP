namespace ProjectMgt.Model
{
    public class BookReaderType
    {
        public BookReaderType()
        {
        }

        private string typename;
        private int id;
        private int borrowdays;
        private int borrownum;

        public virtual string TypeName
        {
            get { return typename; }
            set { typename = value; }
        }

        public virtual int ID
        {
            get { return id; }
            set { id = value; }
        }

        public virtual int BorrowDays
        {
            get { return borrowdays; }
            set { borrowdays = value; }
        }

        public virtual int BorrowNum
        {
            get { return borrownum; }
            set { borrownum = value; }
        }
    }
}