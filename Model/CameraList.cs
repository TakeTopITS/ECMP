using System;

namespace ProjectMgt.Model
{
    public class CameraList
    {
        public CameraList()
        {
        }

        public virtual int ID { get; set; }
        public virtual string Area { get; set; }
        public virtual string ProjectDepartment { get; set; }
        public virtual string ServerIP { get; set; }
        public virtual string ServerPort { get; set; }
        public virtual string ServerChannel { get; set; }
        public virtual string CameraName { get; set; }
        public virtual string CameraUserName { get; set; }
        public virtual string CameraPass { get; set; }
        public virtual string CreatorCode { get; set; }
        public virtual string CreatorName { get; set; }
        public virtual DateTime CreateTime { get; set; }
        public virtual string Description { get; set; }
    }
}