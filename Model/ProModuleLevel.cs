namespace ProjectMgt.Model
{
    public class ProModuleLevel
    {
        public ProModuleLevel()
        {
        }

        public virtual int ID
        {
            get; set;
        }

        public virtual string ModuleName
        {
            get; set;
        }
        public virtual string ParentModule
        {
            get; set;
        }

        public virtual string PageName
        {
            get; set;
        }
        public virtual string ModuleType
        {
            get; set;
        }
        public virtual string UserType
        {
            get; set;
        }

        public virtual string Visible
        {
            get; set;
        }

        public virtual string LangCode
        {
            get; set;
        }

        public virtual string IsDeleted
        {
            get; set;
        }

        public virtual string HomeModuleName
        {
            get; set;
        }

        public virtual string IconURL
        {
            get; set;
        }

        public virtual string ModuleDefinition
        {
            get; set;
        }

        public virtual int SortNumber
        {
            get; set;
        }
    }
}
