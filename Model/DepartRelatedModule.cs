namespace ProjectMgt.Model
{
    public class DepartRelatedModule
    {
        public DepartRelatedModule()
        {
        }

        private int id;
        private string moduleName;
        private string moduleType;
        private string departCode;
        private string visible;

        public virtual int ID
        {
            get { return id; }
            set { id = value; }
        }

        public virtual string ModuleName
        {
            get { return moduleName; }
            set { moduleName = value; }
        }

        public virtual string ModuleType
        {
            get { return moduleType; }
            set { moduleType = value; }
        }

        public virtual string DepartCode
        {
            get { return departCode; }
            set { departCode = value; }
        }

        public virtual string Visible
        {
            get { return visible; }
            set { visible = value; }
        }
    }
}