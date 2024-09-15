using System;

namespace ProjectMgt.Model
{
    public class CameraLog
    {
        public CameraLog()
        {
        }

        public virtual int ID { get; set; }
        public virtual int CameraID { get; set; }
        public virtual string CameraName { get; set; }
        public virtual string ServerIP { get; set; }
        public virtual string CreatorCode { get; set; }
        public virtual string CreatorName { get; set; }
        public virtual DateTime CreateTime { get; set; }
        public virtual string Description { get; set; }
    }
}