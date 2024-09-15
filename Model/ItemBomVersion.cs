namespace ProjectMgt.Model
{
    public class ItemBomVersion
    {
        public ItemBomVersion()
        {
        }

        private int id;
        private string itemCode;
        private int verID;
        private string type;

        private string relatedType;
        private int relatedID;

        public virtual int ID
        {
            get { return id; }
            set { id = value; }
        }

        public virtual string ItemCode
        {
            get { return itemCode; }
            set { itemCode = value; }
        }

        public virtual int VerID
        {
            get { return verID; }
            set { verID = value; }
        }

        public virtual string Type
        {
            get { return type; }
            set { type = value; }
        }

        public virtual string RelatedType
        {
            get { return relatedType; }
            set { relatedType = value; }
        }

        public virtual int RelatedID
        {
            get { return relatedID; }
            set { relatedID = value; }
        }
    }
}