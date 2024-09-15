namespace ProjectMgt.Model
{
    public class DepartPosition
    {
        public DepartPosition()
        {
        }

        private int id;
        private string position;
        private int sortNumber;

        public virtual int ID
        {
            get { return id; }
            set { id = value; }
        }

        public virtual string Position
        {
            get { return position; }
            set { position = value; }
        }

        public virtual int SortNumber
        {
            get { return sortNumber; }
            set { sortNumber = value; }
        }
    }
}