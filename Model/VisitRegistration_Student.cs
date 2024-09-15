using System;

namespace ProjectMgt.Model
{
    public class VisitRegistration_Student
    {
        public VisitRegistration_Student()
        {
        }

        public virtual int ID { get; set; }
        public virtual DateTime VisitStartTime { get; set; }
        public virtual string VisitName { get; set; }
        public virtual string VisitSex { get; set; }
        public virtual string VisitCardType { get; set; }
        public virtual string VisitCardName { get; set; }
        public virtual string VisitCardUrl { get; set; }
        public virtual string VisitReason { get; set; }
        public virtual string Receiver { get; set; }
        public virtual string ReceiverName { get; set; }
        public virtual string VisitEndTime { get; set; }
        public virtual string UserCode { get; set; }
    }
}