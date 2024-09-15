namespace ProjectMgt.Model
{
    public class ProjectMemberGrade
    {
        public ProjectMemberGrade()
        {
        }

        public virtual int ID { get; set; }

        public virtual string GradeName { get; set; }

        public virtual string UserCode { get; set; }

        public virtual string DepartCode { get; set; }

        public virtual string DepartName { get; set; }
    }
}