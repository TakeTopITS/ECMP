using System;

namespace ProjectMgt.Model
{
    public class WZPay
    {
        public WZPay()
        {
        }

        public virtual string PayID { get; set; }
        public virtual string ProjectCode { get; set; }
        public virtual string PayName { get; set; }
        public virtual decimal PayTotal { get; set; }
        public virtual int RowNumber { get; set; }
        public virtual DateTime PayTime { get; set; }
        public virtual string Marker { get; set; }
        public virtual string Progress { get; set; }
        public virtual int IsMark { get; set; }
    }
}