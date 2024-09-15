using System;

namespace ProjectMgt.Model
{
    public class HSETraining
    {
        public HSETraining()
        {
        }

        private string code;

        /// <summary>
        /// 格式 HSETRNX
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

        private string hoster;

        public virtual string Hoster
        {
            get { return hoster; }
            set { hoster = value; }
        }

        private string speaker;

        public virtual string Speaker
        {
            get { return speaker; }
            set { speaker = value; }
        }

        private DateTime trainingStart;

        public virtual DateTime TrainingStart
        {
            get { return trainingStart; }
            set { trainingStart = value; }
        }

        private DateTime trainingEnd;

        public virtual DateTime TrainingEnd
        {
            get { return trainingEnd; }
            set { trainingEnd = value; }
        }

        private string trainingSite;

        public virtual string TrainingSite
        {
            get { return trainingSite; }
            set { trainingSite = value; }
        }

        private string trainingContent;

        public virtual string TrainingContent
        {
            get { return trainingContent; }
            set { trainingContent = value; }
        }

        private string trainingType;

        public virtual string TrainingType
        {
            get { return trainingType; }
            set { trainingType = value; }
        }

        private string enterCode;

        public virtual string EnterCode
        {
            get { return enterCode; }
            set { enterCode = value; }
        }
    }
}