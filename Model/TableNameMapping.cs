namespace ProjectMgt.Model
{
    public class TableNameMapping
    {
        public TableNameMapping()
        {
        }

        public virtual int ID { get; set; }
        public virtual string TableName { get; set; }
        public virtual string Description { get; set; }
    }
}