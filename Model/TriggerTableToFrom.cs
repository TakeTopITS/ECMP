using System;

namespace ProjectMgt.Model
{
    public class TriggerTableToFrom
    {
        public TriggerTableToFrom()
        {
        }

        public virtual int ID { get; set; }
        public virtual string Name { get; set; }
        public virtual string MainTable { get; set; }
        public virtual string FromTable { get; set; }
        public virtual int MainID { get; set; }
        public virtual int Status { get; set; }
        public virtual DateTime CreateTime { get; set; }
    }
}