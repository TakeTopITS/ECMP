namespace ProjectMgt.Model
{
    public class GoodsType
    {
        public GoodsType()
        {
        }

        private string type;
        private string typeChar;
        private string parentType;
        private int sortNumber;

        public virtual string Type
        {
            get { return type; }
            set { type = value; }
        }

        public virtual string ParentType
        {
            get { return parentType; }
            set { parentType = value; }
        }

        public virtual string TypeChar
        {
            get { return typeChar; }
            set { typeChar = value; }
        }

        public virtual int SortNumber
        {
            get { return sortNumber; }
            set { sortNumber = value; }
        }
    }
}