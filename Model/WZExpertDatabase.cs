using System;

namespace ProjectMgt.Model
{
    public class WZExpertDatabase
    {
        public WZExpertDatabase()
        {
        }

        public virtual string ExpertCode { get; set; }
        public virtual string ExpertNumber { get; set; }
        public virtual string Name { get; set; }
        public virtual string UserCode { get; set; }
        public virtual string Job { get; set; }
        public virtual string JobTitle { get; set; }
        public virtual string Phone { get; set; }
        public virtual string ExpertType { get; set; }
        public virtual string ExpertTypeChina { get; set; }
        public virtual int WorkingPoint { get; set; }
        public virtual DateTime CreateTime { get; set; }
        public virtual string CreateCode { get; set; }
    }
}