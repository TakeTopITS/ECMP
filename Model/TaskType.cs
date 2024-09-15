namespace ProjectMgt.Model
{
    public class TaskType
    {
        public TaskType()
        {
        }

        private string type;
        private int sortNumber;

        public virtual string Type
        {
            set { type = value; }
            get { return type; }
        }

        public virtual int SortNumber
        {
            set { sortNumber = value; }
            get { return sortNumber; }
        }
    }
}