using System;

namespace ProjectMgt.Model
{
    public class WZCard
    {
        public WZCard()
        {
        }

        public virtual string CardCode { get; set; }
        public virtual string CardName { get; set; }
        public virtual DateTime CardTime { get; set; }
        public virtual int RowNumber { get; set; }
        public virtual decimal DetailMoney { get; set; }
        public virtual decimal CardMoney { get; set; }
        public virtual string Progress { get; set; }
        public virtual int IsMark { get; set; }
        public virtual string CardMarker { get; set; }
    }
}