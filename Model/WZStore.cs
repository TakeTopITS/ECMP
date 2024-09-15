using System;

namespace ProjectMgt.Model
{
    public class WZStore
    {
        public WZStore()
        {
        }

        public virtual int ID { get; set; }
        public virtual string StockCode { get; set; }
        public virtual string ObjectCode { get; set; }
        public virtual string CheckCode { get; set; }
        public virtual DateTime YearTime { get; set; }
        public virtual decimal YearNumber { get; set; }
        public virtual decimal YearPrice { get; set; }
        public virtual decimal YearMoney { get; set; }
        public virtual decimal InNumber { get; set; }
        public virtual decimal InMoney { get; set; }
        public virtual DateTime EndInTime { get; set; }
        public virtual decimal OutNumber { get; set; }
        public virtual decimal OutPrice { get; set; }
        public virtual DateTime EndOutTime { get; set; }
        public virtual decimal StoreNumber { get; set; }
        public virtual decimal StorePrice { get; set; }
        public virtual decimal StoreMoney { get; set; }
        public virtual string GoodsCode { get; set; }
        public virtual int IsMark { get; set; }
        public virtual decimal DownRatio { get; set; }
        public virtual decimal DownMoney { get; set; }
        public virtual decimal CleanMoney { get; set; }
        public virtual string DownCode { get; set; }
        public virtual int DownDesc { get; set; }
        public virtual string WearyCode { get; set; }
        public virtual int WearyDesc { get; set; }
    }
}