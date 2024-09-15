namespace ProjectMgt.Model
{
    public class ProductLineVersion_YYUP
    {
        public ProductLineVersion_YYUP()
        {
        }

        public virtual int ID { get; set; }
        public virtual string ProductLine { get; set; }
        public virtual string VersionName { get; set; }
        public virtual int SortNumber { get; set; }
    }
}