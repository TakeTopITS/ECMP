namespace ProjectMgt.Model
{
    public class ProductProcess
    {
        public ProductProcess()
        {
        }

        private string processName;
        private int sortNumber;

        public virtual string ProcessName
        {
            get { return processName; }
            set { processName = value; }
        }

        public virtual int SortNumber
        {
            get { return sortNumber; }
            set { sortNumber = value; }
        }
    }
}