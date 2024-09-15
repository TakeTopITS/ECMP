namespace ProjectMgt.Model
{
    /// <summary>
    /// 货币种类
    /// </summary>
    public class CurrencyType
    {
        public CurrencyType()
        {
        }

        private string type;
        private decimal exchangeRate;
        private int sortNo;

        public virtual string Type
        {
            get { return type; }
            set { type = value; }
        }

        public virtual decimal ExchangeRate
        {
            get { return exchangeRate; }
            set { exchangeRate = value; }
        }

        public virtual string IsHome
        {
            get;
            set;
        }

        public virtual int SortNo
        {
            get { return sortNo; }
            set { sortNo = value; }
        }
    }
}