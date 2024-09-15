using System;

namespace ProjectMgt.Model
{
    /// <summary>
    /// 环境评估
    /// </summary>
    public class HSEEnvironmentalObjectives
    {
        public HSEEnvironmentalObjectives()
        {
        }

        private string code;

        /// <summary>
        /// 格式 HSEENOX
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

        private string status;

        public virtual string Status
        {
            get { return status; }
            set { status = value; }
        }

        private string enterPer;

        public virtual string EnterPer
        {
            get { return enterPer; }
            set { enterPer = value; }
        }

        private DateTime setDate;

        public virtual DateTime SetDate
        {
            get { return setDate; }
            set { setDate = value; }
        }

        private string version;

        public virtual string Version
        {
            get { return version; }
            set { version = value; }
        }

        private DateTime versionDate;

        public virtual DateTime VersionDate
        {
            get { return versionDate; }
            set { versionDate = value; }
        }

        private string remark;

        public virtual string Remark
        {
            get { return remark; }
            set { remark = value; }
        }

        private string reviewer;

        public virtual string Reviewer
        {
            get { return reviewer; }
            set { reviewer = value; }
        }

        private DateTime reviewDate;

        public virtual DateTime ReviewDate
        {
            get { return reviewDate; }
            set { reviewDate = value; }
        }

        private string reviewResult;

        public virtual string ReviewResult
        {
            get { return reviewResult; }
            set { reviewResult = value; }
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