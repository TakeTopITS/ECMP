namespace ProjectMgt.Model
{
    public class GDPressureTest
    {
        public GDPressureTest()
        {
        }

        public virtual int ID { get; set; }
        public virtual string TestLoopNo { get; set; }
        public virtual string PressTestRec { get; set; }
        public virtual string PressDate { get; set; }
        public virtual string ReinstRec { get; set; }
        public virtual string ReinstDate { get; set; }
        public virtual string FlushingBlock { get; set; }
        public virtual string FlushingRec { get; set; }
        public virtual string FlushingDate { get; set; }
        public virtual string LeakTestRec { get; set; }
        public virtual string LeakDate { get; set; }
        public virtual string Remarks { get; set; }
        public virtual int IsMark { get; set; }
        public virtual string UserCode { get; set; }
    }
}