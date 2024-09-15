namespace ProjectMgt.Model
{
    public class ConstractRelatedAssetPurchaseOrder
    {
        public ConstractRelatedAssetPurchaseOrder()
        {
        }

        private int id;
        private int poID;
        private string constractCode;

        public virtual int ID
        {
            get { return id; }
            set { id = value; }
        }

        public virtual int POID
        {
            get { return poID; }
            set { poID = value; }
        }

        public virtual string ConstractCode
        {
            get { return constractCode; }
            set { constractCode = value; }
        }
    }
}