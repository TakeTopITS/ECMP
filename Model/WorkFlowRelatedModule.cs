namespace ProjectMgt.Model
{
    public class WorkFlowRelatedModule
    {
        public WorkFlowRelatedModule()
        {
        }

        public virtual int ID
        {
            get;
            set;
        }

        public virtual int WorkflowID
        {
            get;
            set;
        }

        public virtual int WorkflowStepID
        {
            get;
            set;
        }

        public virtual int WorkflowStepDetailID
        {
            get;
            set;
        }

        public virtual string RelatedModuleName
        {
            get;
            set;
        }

        public virtual string RelatedID
        {
            get;
            set;
        }
    }
}