namespace ProjectMgt.Model
{
    public class TableTemplateMapping
    {
        public TableTemplateMapping()
        {
        }

        public virtual int ID { get; set; }
        public virtual string TableName { get; set; }
        public virtual string TableXMLNodeName { get; set; }
        public virtual string WFTemplateName { get; set; }
        public virtual string XSNFile { get; set; }
        public virtual string WFTemplateXMLNodeName { get; set; }
        public virtual string IdentifyString { get; set; }
    }
}