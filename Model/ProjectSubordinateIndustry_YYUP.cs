namespace ProjectMgt.Model
{
    public class ProjectSubordinateIndustry_YYUP
    {
        public ProjectSubordinateIndustry_YYUP()
        {
        }

        public virtual int ID { get; set; }
        public virtual string Name { get; set; }
        public virtual int ParentID { get; set; }
        public virtual string Remark { get; set; }
    }
}