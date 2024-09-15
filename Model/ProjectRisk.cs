using System;

namespace ProjectMgt.Model
{
    public class ProjectRisk
    {
        public ProjectRisk()
        {
        }

        private int id;
        private int projectID;
        private string riskLevel;
        private string risk;
        private string detail;
        private DateTime effectDate;
        private DateTime findDate;
        private string status;

        public virtual int ID
        {
            get { return id; }
            set { id = value; }
        }

        public virtual int ProjectID
        {
            get { return projectID; }
            set { projectID = value; }
        }

        public virtual string RiskLevel
        {
            get { return riskLevel; }
            set { riskLevel = value; }
        }

        public virtual string Risk
        {
            get { return risk; }
            set { risk = value; }
        }

        public virtual string Detail
        {
            get { return detail; }
            set { detail = value; }
        }

        public virtual DateTime EffectDate
        {
            get { return effectDate; }
            set { effectDate = value; }
        }

        public virtual DateTime FindDate
        {
            get { return findDate; }
            set { findDate = value; }
        }

        public virtual String Status
        {
            get { return status; }
            set { status = value; }
        }
    }
}