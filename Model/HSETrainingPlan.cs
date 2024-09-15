using System;

namespace ProjectMgt.Model
{
    public class HSETrainingPlan
    {
        public HSETrainingPlan()
        {
        }

        private string code;

        /// <summary>
        /// 格式 HSETNPX
        /// </summary>
        public virtual string Code
        {
            get { return code; }
            set { code = value; }
        }

        private string name;

        public virtual string Name
        {
            get { return name; }
            set { name = value; }
        }

        private int projectId;

        public virtual int ProjectId
        {
            get { return projectId; }
            set { projectId = value; }
        }

        private string projectName;

        public virtual string ProjectName
        {
            get { return projectName; }
            set { projectName = value; }
        }

        private string professional;

        public virtual string Professional
        {
            get { return professional; }
            set { professional = value; }
        }

        private string trainingContent;

        public virtual string TrainingContent
        {
            get { return trainingContent; }
            set { trainingContent = value; }
        }

        private DateTime trainingDate;

        public virtual DateTime TrainingDate
        {
            get { return trainingDate; }
            set { trainingDate = value; }
        }

        private string enterCode;

        public virtual string EnterCode
        {
            get { return enterCode; }
            set { enterCode = value; }
        }

        private DateTime enterDate;

        public virtual DateTime EnterDate
        {
            get { return enterDate; }
            set { enterDate = value; }
        }

        private string enterCodeValue;

        public virtual string EnterCodeValue
        {
            get { return enterCodeValue; }
            set { enterCodeValue = value; }
        }
    }
}