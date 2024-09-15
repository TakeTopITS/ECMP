namespace ProjectMgt.Model
{
    public class ProjectProduct_YYUP
    {
        public ProjectProduct_YYUP()
        {
        }

        public virtual int ID { get; set; }
        public virtual int ProjectID { get; set; }
        public virtual string ModuleCode { get; set; }//模块编号
        public virtual string ModuleName { get; set; }//模块名称
        public virtual string ModuleType { get; set; }//模块类型，财务会计(FinancialAccounting)，管理会计(ManagementAccounting)，供应链(SupplyChain)，生产制造(ProductionManufacturing)
    }
}