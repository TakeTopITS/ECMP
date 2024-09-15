using System;

namespace ProjectMgt.Model
{
    public class GDProject
    {
        public GDProject()
        {
        }

        public virtual int ID { get; set; }
        public virtual string ProjectCode { get; set; }
        public virtual string ProjectName { get; set; }
        public virtual string ProjectAddress { get; set; }
        public virtual DateTime CreateDate { get; set; }
        public virtual string Remark { get; set; }
        public virtual int IsMark { get; set; }

        public virtual string UserCode { get; set; }
    }
}