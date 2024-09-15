namespace ProjectMgt.Model
{
    public class ProModule
    {
        public ProModule()
        {
        }

        private int id;

        private string moduleName;
        private string moduleType;

        private string userCode;
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

        public virtual string UserCode
        {
            get { return userCode; }
            set { userCode = value; }
        }

        public virtual string Visible
        {
            get { return visible; }
            set { visible = value; }
        }


        public virtual string ModuleDefinition
        {
            get; set;
        }
    }
}