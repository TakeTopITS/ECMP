namespace ProjectMgt.Model
{
    public class RCJProjectCostPreformanceType
    {
        private int id;

        public virtual int ID
        {
            get { return id; }
            set { id = value; }
        }

        private int typeCode;

        public virtual int TypeCode
        {
            get { return typeCode; }
            set { typeCode = value; }
        }

        private string typeName;

        public virtual string TypeName
        {
            get { return typeName; }
            set { typeName = value; }
        }
    }
}