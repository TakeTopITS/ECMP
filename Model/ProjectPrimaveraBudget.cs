namespace ProjectMgt.Model
{
    public class ProjectPrimaveraBudget
    {
        public ProjectPrimaveraBudget()
        {
        }

        private int id;
        private int projectID;
        private int projBudgID;
        private decimal budgetAmount;
        private decimal realAmount;
        private decimal totalAmount;
        private string projGuid;
        private int p6ID;
        private int taskID;

        public virtual int P6ID
        {
            get { return p6ID; }
            set { p6ID = value; }
        }

        public virtual int TaskID
        {
            get { return taskID; }
            set { taskID = value; }
        }

        public virtual int ID
        {
            get { return id; }
            set { id = value; }
        }

        public virtual int ProjBudgID
        {
            get { return projBudgID; }
            set { projBudgID = value; }
        }

        public virtual int ProjectID
        {
            get { return projectID; }
            set { projectID = value; }
        }

        public virtual decimal BudgetAmount
        {
            get { return budgetAmount; }
            set { budgetAmount = value; }
        }

        public virtual decimal RealAmount
        {
            get { return realAmount; }
            set { realAmount = value; }
        }

        public virtual decimal TotalAmount
        {
            get { return totalAmount; }
            set { totalAmount = value; }
        }

        public virtual string ProjGuid
        {
            get { return projGuid; }
            set { projGuid = value; }
        }
    }
}