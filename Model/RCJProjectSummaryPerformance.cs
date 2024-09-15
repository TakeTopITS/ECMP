namespace ProjectMgt.Model
{
    public class RCJProjectSummaryPerformance
    {
        private int projectID;
        private int id;

        public virtual int ProjectID
        {
            get { return projectID; }
            set { projectID = value; }
        }

        public virtual int ID
        {
            get { return id; }
            set { id = value; }
        }

        private string projectYear;

        public virtual string ProjectYear
        {
            get { return projectYear; }
            set { projectYear = value; }
        }

        private string projectMonth;

        public virtual string ProjectMonth
        {
            get { return projectMonth; }
            set { projectMonth = value; }
        }

        private double projectSTCV;

        public virtual double ProjectSTCV
        {
            get { return projectSTCV; }
            set { projectSTCV = value; }
        }

        private double projectBCWS;

        public virtual double ProjectBCWS
        {
            get { return projectBCWS; }
            set { projectBCWS = value; }
        }

        private double projectBCWP;

        public virtual double ProjectBCWP
        {
            get { return projectBCWP; }
            set { projectBCWP = value; }
        }

        private double projectBCRWP;

        public virtual double ProjectBCRWP
        {
            get { return projectBCRWP; }
            set { projectBCRWP = value; }
        }

        private double projectPBCWP;

        public virtual double ProjectPBCWP
        {
            get { return projectPBCWP; }
            set { projectPBCWP = value; }
        }

        private double projectEAV;

        public virtual double ProjectEAV
        {
            get { return projectEAV; }
            set { projectEAV = value; }
        }

        private double projectRV;

        public virtual double ProjectRV
        {
            get { return projectRV; }
            set { projectRV = value; }
        }

        private double projectACWP;

        public virtual double ProjectACWP
        {
            get { return projectACWP; }
            set { projectACWP = value; }
        }

        private double projectAI;

        public virtual double ProjectAI
        {
            get { return projectAI; }
            set { projectAI = value; }
        }

        private double projectBVI;

        public virtual double ProjectBVI
        {
            get { return projectBVI; }
            set { projectBVI = value; }
        }

        private double projectBV;

        public virtual double ProjectBV
        {
            get { return projectBV; }
            set { projectBV = value; }
        }

        private double projectRVI;

        public virtual double ProjectRVI
        {
            get { return projectRVI; }
            set { projectRVI = value; }
        }

        private double projectPL;

        public virtual double ProjectPL
        {
            get { return projectPL; }
            set { projectPL = value; }
        }

        private double projectRP;

        public virtual double ProjectRP
        {
            get { return projectRP; }
            set { projectRP = value; }
        }

        private double projectTotalSpending;

        public virtual double ProjectTotalSpending
        {
            get { return projectTotalSpending; }
            set { projectTotalSpending = value; }
        }

        private double projectTotalIncome;

        public virtual double ProjectTotalIncome
        {
            get { return projectTotalIncome; }
            set { projectTotalIncome = value; }
        }

        private double projectIncomeDifference;

        public virtual double ProjectIncomeDifference
        {
            get { return projectIncomeDifference; }
            set { projectIncomeDifference = value; }
        }

        private double projectContractReceived;

        public virtual double ProjectContractReceived
        {
            get { return projectContractReceived; }
            set { projectContractReceived = value; }
        }

        private double projectCPB;

        public virtual double ProjectCPB
        {
            get { return projectCPB; }
            set { projectCPB = value; }
        }

        private double projectCFI;

        public virtual double ProjectCFI
        {
            get { return projectCFI; }
            set { projectCFI = value; }
        }

        private double thisMonthFinished;

        public virtual double ThisMonthFinished
        {
            get { return thisMonthFinished; }
            set { thisMonthFinished = value; }
        }

        private double totalMonthFinished;

        public virtual double TotalMonthFinished
        {
            get { return totalMonthFinished; }
            set { totalMonthFinished = value; }
        }
    }
}