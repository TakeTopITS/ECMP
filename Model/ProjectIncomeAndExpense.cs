namespace ProjectMgt.Model
{
    public class ProjectIncomeAndExpense
    {
        public ProjectIncomeAndExpense()
        {
        }

        private string userCode;
        private string userName;
        private int projectID;
        private decimal totalSalary;
        private decimal totalExpense;
        private decimal totalIncome;

        public virtual string UserCode
        {
            get { return userCode; }
            set { userCode = value; }
        }

        public virtual string UserName
        {
            get { return userName; }
            set { userName = value; }
        }

        public virtual int ProjectID
        {
            get { return projectID; }
            set { projectID = value; }
        }

        public virtual decimal TotalSalary
        {
            get { return totalSalary; }
            set { totalSalary = value; }
        }

        public virtual decimal TotalExpense
        {
            get { return totalExpense; }
            set { totalExpense = value; }
        }

        public virtual decimal TotalIncome
        {
            get { return totalIncome; }
            set { totalIncome = value; }
        }
    }
}