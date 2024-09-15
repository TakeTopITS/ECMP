namespace ProjectMgt.Model
{
    public class BookPublishers
    {
        public BookPublishers()
        {
        }

        private string isbnno;
        private int id;
        private string publishersname;
        private string publishersaddress;

        public virtual string ISBNNo
        {
            get { return isbnno; }
            set { isbnno = value; }
        }

        public virtual int ID
        {
            get { return id; }
            set { id = value; }
        }

        public virtual string PublishersName
        {
            get { return publishersname; }
            set { publishersname = value; }
        }

        public virtual string PublishersAddress
        {
            get { return publishersaddress; }
            set { publishersaddress = value; }
        }
    }
}