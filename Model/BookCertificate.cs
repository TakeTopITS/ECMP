namespace ProjectMgt.Model
{
    public class BookCertificate
    {
        public BookCertificate()
        {
        }

        private int id;
        private string certificatename;
        private int sortno;

        public virtual string CertificateName
        {
            get { return certificatename; }
            set { certificatename = value; }
        }

        public virtual int ID
        {
            get { return id; }
            set { id = value; }
        }

        public virtual int SortNo
        {
            get { return sortno; }
            set { sortno = value; }
        }
    }
}