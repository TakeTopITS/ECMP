namespace ProjectMgt.Model
{
    public class DefectType
    {
        public DefectType()
        {
        }

        private string type;
        private int sortNumber;

        public virtual string Type
        {
            get { return type; }
            set { type = value; }
        }

        public virtual int SortNumber
        {
            get { return sortNumber; }
            set { sortNumber = value; }
        }
    }
}