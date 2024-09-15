using System;

namespace ProjectMgt.Model
{
    public class WZObject
    {
        public WZObject()
        {
        }

        public virtual string DLCode { get; set; }
        public virtual string ZLCode { get; set; }
        public virtual string XLCode { get; set; }
        public virtual string ObjectCode { get; set; }
        public virtual string Creater { get; set; }
        public virtual string ObjectName { get; set; }
        public virtual string Model { get; set; }
        public virtual string Grade { get; set; }
        public virtual string Criterion { get; set; }
        public virtual int Unit { get; set; }
        public virtual int ConvertUnit { get; set; }
        public virtual decimal ConvertRatio { get; set; }
        public virtual string ReferDesc { get; set; }
        public virtual string ReferStandard { get; set; }
        public virtual decimal Market { get; set; }
        public virtual DateTime CollectTime { get; set; }
        public virtual int IsMark { get; set; }
    }
}