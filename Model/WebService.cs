using System;

namespace ProjectMgt.Model
{
    public class WebService
    {
        public WebService()
        {
        }

        public virtual int ID { get; set; }
        public virtual string WebServiceName { get; set; }
        public virtual string WebServiceURI { get; set; }
        public virtual string MethodName { get; set; }
        public virtual string ArgArray { get; set; }
        public virtual string Comment { get; set; }
        public virtual string CreatorCode { get; set; }
        public virtual string CreatorName { get; set; }
        public virtual DateTime CreateTime { get; set; }
    }
}