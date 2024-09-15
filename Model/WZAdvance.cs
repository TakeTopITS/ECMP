using System;

namespace ProjectMgt.Model
{
    public class WZAdvance
    {
        public WZAdvance()
        {
        }

        public virtual string AdvanceCode { get; set; }
        public virtual string ProjectCode { get; set; }
        public virtual string AdvanceName { get; set; }
        public virtual decimal AdvanceMoney { get; set; }
        public virtual DateTime AdvanceTime { get; set; }
        public virtual string Marker { get; set; }
        public virtual string Progress { get; set; }
        public virtual int IsMark { get; set; }
    }
}