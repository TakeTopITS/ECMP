namespace ProjectMgt.Model
{
    public class WorkFlowTStepOperator
    {
        public WorkFlowTStepOperator()
        {
        }

        private int id;
        private int stepID;
        private string temName;
        private string actorGroup;
        private string identifyString;
        private string workDetail;
        private string actor;
        private int limitedTime;
        private string requisite;
        private string fieldList;
        private string allowFullEdit;
        private string editFieldList;
        private string canNotNullFieldList;

        private string signPictrueField;

        public virtual int ID
        {
            get { return id; }
            set { id = value; }
        }

        public virtual int StepID
        {
            get { return stepID; }
            set { stepID = value; }
        }

        public virtual string TemName
        {
            get { return temName; }
            set { temName = value; }
        }

        public virtual string ActorGroup
        {
            get { return actorGroup; }
            set { actorGroup = value; }
        }

        public virtual string IdentifyString
        {
            get { return identifyString; }
            set { identifyString = value; }
        }

        public virtual string WorkDetail
        {
            get { return workDetail; }
            set { workDetail = value; }
        }

        public virtual string Actor
        {
            get { return actor; }
            set { actor = value; }
        }

        public virtual int LimitedTime
        {
            get { return limitedTime; }
            set { limitedTime = value; }
        }

        public virtual string Requisite
        {
            get { return requisite; }
            set { requisite = value; }
        }

        public virtual string FieldList
        {
            get { return fieldList; }
            set { fieldList = value; }
        }

        public virtual string AllowFullEdit
        {
            get { return allowFullEdit; }
            set { allowFullEdit = value; }
        }

        public virtual string EditFieldList
        {
            get { return editFieldList; }
            set { editFieldList = value; }
        }

        public virtual string CanNotNullFieldList
        {
            get { return canNotNullFieldList; }
            set { canNotNullFieldList = value; }
        }

        public virtual string SignPictureField
        {
            get { return signPictrueField; }
            set { signPictrueField = value; }
        }
    }
}