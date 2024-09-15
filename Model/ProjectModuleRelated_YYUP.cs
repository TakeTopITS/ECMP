namespace ProjectMgt.Model
{
    public class ProjectModuleRelated_YYUP
    {
        public ProjectModuleRelated_YYUP()
        {
        }

        public virtual int ID { get; set; }
        public virtual string ProductLine { get; set; }
        public virtual string SubordinateIndustry { get; set; }
        public virtual string ModuleIDs { get; set; }
        public virtual string ModuleNames { get; set; }
        public virtual decimal StartAmount { get; set; }
        public virtual decimal EndAmount { get; set; }
        public virtual int StartPersonDay { get; set; }
        public virtual int EndPersonDay { get; set; }
        public virtual int ProjectID { get; set; }
    }
}