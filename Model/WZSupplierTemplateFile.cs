using System;

namespace ProjectMgt.Model
{
    public class WZSupplierTemplateFile
    {
        public WZSupplierTemplateFile()
        {
        }

        public virtual int ID { get; set; }
        public virtual string TemplateFileName { get; set; }
        public virtual string TemplateFileURL { get; set; }
        public virtual DateTime CreateTime { get; set; }
    }
}