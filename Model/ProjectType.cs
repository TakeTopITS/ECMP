namespace ProjectMgt.Model
{
    public class ProjectType
    {
        public ProjectType()
        {
        }

        private string type;
        private string keyWord;
        private string allowPMChangeStatus;
        private string autoRunWFAfterMakeProject;
        private string progressByDetailImpact;
        private string planProgressNeedPlanerConfirm;
        private int sortNumber;

        public virtual string Type
        {
            get { return type; }
            set { type = value; }
        }

        public virtual string KeyWord
        {
            get { return keyWord; }
            set { keyWord = value; }
        }

        public virtual string AllowPMChangeStatus
        {
            get { return allowPMChangeStatus; }
            set { allowPMChangeStatus = value; }
        }

        public virtual string AutoRunWFAfterMakeProject
        {
            get { return autoRunWFAfterMakeProject; }
            set { autoRunWFAfterMakeProject = value; }
        }

        public virtual string ProgressByDetailImpact
        {
            get { return progressByDetailImpact; }
            set { progressByDetailImpact = value; }
        }

        public virtual string PlanProgressNeedPlanerConfirm
        {
            get; set;
        }

        public virtual string ProjectStartupNeedSupperConfirm
        {
            get; set;
        }

        public virtual int SortNumber
        {
            get { return sortNumber; }
            set { sortNumber = value; }
        }
    }
}