using System;

namespace ProjectMgt.Model
{
    public class HSEHealthCheck
    {
        public HSEHealthCheck()
        {
        }

        private string code;

        /// <summary>
        /// 格式 HSEHCKX
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

        private string checkPersion;

        public virtual string CheckPersion
        {
            get { return checkPersion; }
            set { checkPersion = value; }
        }

        private string checkArea;

        public virtual string CheckArea
        {
            get { return checkArea; }
            set { checkArea = value; }
        }

        private DateTime checkDate;

        public virtual DateTime CheckDate
        {
            get { return checkDate; }
            set { checkDate = value; }
        }

        private string unitCode;

        public virtual string UnitCode
        {
            get { return unitCode; }
            set { unitCode = value; }
        }

        private string leader;

        public virtual string Leader
        {
            get { return leader; }
            set { leader = value; }
        }

        private string checkResult;

        public virtual string CheckResult
        {
            get { return checkResult; }
            set { checkResult = value; }
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