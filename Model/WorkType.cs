namespace ProjectMgt.Model
{
    public class WorkType
    {
        public WorkType()
        {
        }

        private string typename;
        private int sortno;

        public virtual string TypeName
        {
            get { return typename; }
            set { typename = value; }
        }

        public virtual int SortNo
        {
            get { return sortno; }
            set { sortno = value; }
        }
    }
}