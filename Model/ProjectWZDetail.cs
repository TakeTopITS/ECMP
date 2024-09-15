namespace ProjectMgt.Model
{
    public class ProjectWZDetail
    {
        public ProjectWZDetail()
        {
        }

        private int projectID;
        private string authorizedProcurement;
        private decimal aBudgetFor;
        private decimal sincePurchaseBudget;
        private string constructionUnit;
        private string supervisionUnit;

        private string leader;

        private string feeManage;

        private string materialPerson;

        private int isMark;

        public virtual int IsMark
        {
            get { return isMark; }
            set { isMark = value; }
        }

        public virtual string MaterialPerson
        {
            get { return materialPerson; }
            set { materialPerson = value; }
        }

        public virtual string FeeManage
        {
            get { return feeManage; }
            set { feeManage = value; }
        }

        public virtual string Leader
        {
            get { return leader; }
            set { leader = value; }
        }

        public virtual int ProjectID
        {
            get { return projectID; }
            set { projectID = value; }
        }

        public virtual string AuthorizedProcurement
        {
            get { return authorizedProcurement; }
            set { authorizedProcurement = value; }
        }

        public virtual decimal ABudgetFor
        {
            get { return aBudgetFor; }
            set { aBudgetFor = value; }
        }

        public virtual decimal SincePurchaseBudget
        {
            get { return sincePurchaseBudget; }
            set { sincePurchaseBudget = value; }
        }

        public virtual string ConstructionUnit
        {
            get { return constructionUnit; }
            set { constructionUnit = value; }
        }

        public virtual string SupervisionUnit
        {
            get { return supervisionUnit; }
            set { supervisionUnit = value; }
        }
    }
}