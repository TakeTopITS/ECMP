namespace ProjectMgt.Model
{
    public class TaskOperation
    {
        public TaskOperation()
        {
        }

        private string operation;
        private int sortNumber;

        public virtual string Operation
        {
            get { return operation; }
            set { operation = value; }
        }

        public virtual int SortNumber
        {
            get { return sortNumber; }
            set { sortNumber = value; }
        }
    }
}