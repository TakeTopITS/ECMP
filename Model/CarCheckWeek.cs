using System;

namespace ProjectMgt.Model
{
    public class CarCheckWeek
    {
        public CarCheckWeek()
        {
        }

        public virtual string WeekCode { get; set; }
        public virtual string WeekName { get; set; }
        public virtual string Remark { get; set; }
        public virtual DateTime CreateTime { get; set; }
        public virtual string CustomerCode { get; set; }
        public virtual string CustomerName { get; set; }
        public virtual string Ext1 { get; set; }
        public virtual string Ext2 { get; set; }
        public virtual string Ext3 { get; set; }
        public virtual string Ext4 { get; set; }
        public virtual string Ext5 { get; set; }
    }
}