namespace ProjectMgt.Model
{
    public class HSEDiseasePrevention
    {
        public HSEDiseasePrevention()
        {
        }

        private string code;

        /// <summary>
        /// 格式 HSEDPTX
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

        private string diseaseType;

        public virtual string DiseaseType
        {
            get { return diseaseType; }
            set { diseaseType = value; }
        }

        private string briefDescription;

        public virtual string BriefDescription
        {
            get { return briefDescription; }
            set { briefDescription = value; }
        }

        private string enterCode;

        /// <summary>
        /// 创建者编码
        /// </summary>
        public virtual string EnterCode
        {
            get { return enterCode; }
            set { enterCode = value; }
        }
    }
}