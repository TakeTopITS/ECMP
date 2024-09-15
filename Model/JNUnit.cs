namespace ProjectMgt.Model
{
    public class JNUnit
    {
        public JNUnit()
        {
        }

        private string unitName;
        private int sortNumber;

        public virtual string UnitName
        {
            get { return unitName; }
            set { unitName = value; }
        }

        public virtual int SortNumber
        {
            get { return sortNumber; }
            set { sortNumber = value; }
        }
    }
}