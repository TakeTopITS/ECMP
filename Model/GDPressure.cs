namespace ProjectMgt.Model
{
    public class GDPressure
    {
        public GDPressure()
        {
        }

        public virtual string PressureCode { get; set; }
        public virtual string OrderNumber { get; set; }
        public virtual string PublicTime { get; set; }
        public virtual string PressureMedium { get; set; }
        public virtual string PressureTest { get; set; }
        public virtual string MainArea { get; set; }
        public virtual string PointArea { get; set; }
        public virtual string PressureUser { get; set; }
        public virtual string SystemCode { get; set; }
        public virtual string Medium { get; set; }
        public virtual string PipelineCheck { get; set; }
        public virtual string HistoryRecord { get; set; }
        public virtual string PressureTime { get; set; }
        public virtual string Remarks { get; set; }
        public virtual int IsMark { get; set; }
        public virtual string UserCode { get; set; }
        public virtual string ProjectCode { get; set; }
    }
}