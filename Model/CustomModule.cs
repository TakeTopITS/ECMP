namespace ProjectMgt.Model
{
    public class CustomModule
    {
        public CustomModule()
        {
        }

        public virtual int ID { get; set; }
        public virtual string CustomModuleName { get; set; }
        public virtual string CustomType { get; set; }
        public virtual string Type { get; set; }
        public virtual string TemName { get; set; }
        public virtual string IdentifyString { get; set; }
    }
}