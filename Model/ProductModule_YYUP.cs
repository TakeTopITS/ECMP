namespace ProjectMgt.Model
{
    public class ProductModule_YYUP
    {
        public ProductModule_YYUP()
        {
        }

        public virtual int ID { get; set; }
        public virtual string ModuleName { get; set; }
        public virtual string ModuleEnglishName { get; set; }
        public virtual string ModuleType { get; set; }
        public virtual string ModuleEnglishType { get; set; }

        public virtual int SortNumber { get; set; }
    }
}