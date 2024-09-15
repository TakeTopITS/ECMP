using System;

namespace ProjectMgt.Model
{
    public class MeetingAssign
    {
        public MeetingAssign()
        {
        }

        public virtual int ID { get; set; }
        public virtual int MeetingApplyID { get; set; }
        public virtual string Name { get; set; }
        public virtual string Type { get; set; }
        public virtual string RelatedType { get; set; }
        public virtual int RelatedID { get; set; }
        public virtual string Host { get; set; }
        public virtual string Recorder { get; set; }
        public virtual string Content { get; set; }
        public virtual string Address { get; set; }
        public virtual DateTime BeginTime { get; set; }
        public virtual DateTime EndTime { get; set; }
        public virtual string BuilderCode { get; set; }
        public virtual string Organizer { get; set; }
        public virtual string OrganizerNote { get; set; }
        public virtual string Record { get; set; }
        public virtual DateTime MakeTime { get; set; }
        public virtual string Status { get; set; }
        public virtual string MainPass { get; set; }
        public virtual string MeetPassword { get; set; }
    }
}