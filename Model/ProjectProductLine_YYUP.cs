namespace ProjectMgt.Model
{
    public class ProjectProductLine_YYUP
    {
        public ProjectProductLine_YYUP()
        {
        }

        public virtual int ID { get; set; }
        public virtual string Name { get; set; }//名称（U8、U9、CRM、PLM、BA、移动应用）
        public virtual string Remark { get; set; }//备注
    }
}