namespace ProjectMgt.Model
{
    public class DailyWorkUnitBonus
    {
        public DailyWorkUnitBonus()
        {
        }

        private int id;
        private decimal everyCharPrice;
        private int charUpper;
        private decimal everyDocPrice;
        private int docUpper;

        public virtual int ID
        {
            get { return id; }
            set { id = value; }
        }

        public virtual decimal EveryCharPrice
        {
            get { return everyCharPrice; }
            set { everyCharPrice = value; }
        }

        public virtual int CharUpper
        {
            get { return charUpper; }
            set { charUpper = value; }
        }

        public virtual decimal EveryDocPrice
        {
            get { return everyDocPrice; }
            set { everyDocPrice = value; }
        }

        public virtual int DocUpper
        {
            get { return docUpper; }
            set { docUpper = value; }
        }
    }
}