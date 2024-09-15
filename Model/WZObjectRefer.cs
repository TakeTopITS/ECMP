namespace ProjectMgt.Model
{
    public class WZObjectRefer
    {
        public WZObjectRefer()
        {
        }

        public virtual string ObjectCode { get; set; }
        public virtual string XLCode { get; set; }
        public virtual string ObjectName { get; set; }
        public virtual string Model { get; set; }
        public virtual string Criterion { get; set; }
        public virtual string Grade { get; set; }
        public virtual int Unit { get; set; }
        public virtual int ConvertUnit { get; set; }
        public virtual decimal ConvertRatio { get; set; }
        public virtual string ReferDesc { get; set; }
        public virtual string ReferStandard { get; set; }
    }
}