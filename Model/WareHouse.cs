namespace ProjectMgt.Model
{
    public class WareHouse
    {
        public WareHouse()
        {
        }

        private string whName;
        private int sortNumber;
        private string belongDepartCode;
        private string belongDepartName;
        private string parentWH;

        public virtual string WHName
        {
            get { return whName; }
            set { whName = value; }
        }

        public virtual int SortNumber
        {
            get { return sortNumber; }
            set { sortNumber = value; }
        }

        public virtual string BelongDepartCode
        {
            get { return belongDepartCode; }
            set { belongDepartCode = value; }
        }

        public virtual string BelongDepartName
        {
            get { return belongDepartName; }
            set { belongDepartName = value; }
        }

        public virtual string ParentWH
        {
            get { return parentWH; }
            set { parentWH = value; }
        }

        public virtual string CapitalMethod
        {
            get; set;
        }
    }
}