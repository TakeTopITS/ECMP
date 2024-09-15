namespace ProjectMgt.Model
{
    public class ProjectOfferStandard_YYUP
    {
        public ProjectOfferStandard_YYUP()
        {
        }

        public virtual int ID { get; set; }
        public virtual string Name { get; set; }//名称（无外包、伙伴外包、内部外包）
        public virtual string Remark { get; set; }//备注
    }
}