namespace ProjectMgt.Model
{
    public class ProjectMemberClass
    {
        public ProjectMemberClass()
        {
        }

        public virtual int ID { get; set; }
        public virtual int GradeID { get; set; }
        public virtual string ClassName { get; set; }

        public virtual string UserCode { get; set; }
    }
}