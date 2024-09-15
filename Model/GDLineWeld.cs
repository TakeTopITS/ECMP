namespace ProjectMgt.Model
{
    public class GDLineWeld
    {
        public GDLineWeld()
        {
        }

        public virtual int ID { get; set; }
        public virtual string PipelineLevel { get; set; }
        public virtual string Area { get; set; }
        public virtual string LineNumber { get; set; }
        public virtual string OrderNumber { get; set; }
        public virtual string LineLevel { get; set; }
        public virtual string MediumCode { get; set; }
        public virtual string Isom_no { get; set; }
        public virtual string PipelineRule { get; set; }
        public virtual string Edition { get; set; }

        public virtual string PublicTime { get; set; }
        public virtual string publictime { get; set; }
        public virtual string PressurePack1 { get; set; }
        public virtual string PressureMpa { get; set; }
        public virtual string DesignTemperature { get; set; }
        public virtual string ProjectCode { get; set; }
        public virtual int IsMark { get; set; }
        public virtual string UserCode { get; set; }
    }
}