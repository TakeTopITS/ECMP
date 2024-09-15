namespace ProjectMgt.Model
{
    public class ProjectMemberStudentAttendance
    {
        public ProjectMemberStudentAttendance()
        {
        }

        public virtual int ID { get; set; }
        public virtual string StudentCode { get; set; }
        public virtual string StudentName { get; set; }
        public virtual string AttendanceTime { get; set; }
        public virtual string IsStudy { get; set; }
    }
}