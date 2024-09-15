namespace ProjectMgt.Model
{
    public class WZStock
    {
        public WZStock()
        {
        }

        public virtual int ID { get; set; }
        public virtual string StockCode { get; set; }
        public virtual string StockDesc { get; set; }
        public virtual string Safekeep { get; set; }
        public virtual string Checker { get; set; }
        public virtual int IsMark { get; set; }
        public virtual int IsCancel { get; set; }
    }
}