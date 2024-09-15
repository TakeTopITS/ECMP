namespace ProjectMgt.Model
{
    public class ProjectLogo_YYUP
    {
        public ProjectLogo_YYUP()
        {
        }

        public virtual int ID { get; set; }
        public virtual int ProjectID { get; set; }
        public virtual string LogoCode { get; set; }//编号
        public virtual string LogoName { get; set; }//名称
        public virtual string LogoType { get; set; }//项目标识，是否样板(IsSample)，是否原型(IsPrototype)，是否战略(IsStrategy)，是否重点(IsKey),销售属性（新项目销售、老客户挖掘）SalesProperty
    }
}