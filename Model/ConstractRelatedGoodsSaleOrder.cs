namespace ProjectMgt.Model
{
    public class ConstractRelatedGoodsSaleOrder
    {
        public ConstractRelatedGoodsSaleOrder()
        {
        }

        private int id;
        private int soID;
        private string constractCode;

        public virtual int ID
        {
            get { return id; }
            set { id = value; }
        }

        public virtual int SOID
        {
            get { return soID; }
            set { soID = value; }
        }

        public virtual string ConstractCode
        {
            get { return constractCode; }
            set { constractCode = value; }
        }
    }
}