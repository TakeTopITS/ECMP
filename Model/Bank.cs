namespace ProjectMgt.Model
{
    public class Bank
    {
        public Bank()
        {
        }

        private string bankName;
        private int sortNumber;

        public virtual string BankName
        {
            get { return bankName; }
            set { bankName = value; }
        }

        public virtual int SortNumber
        {
            get { return sortNumber; }
            set { sortNumber = value; }
        }
    }
}