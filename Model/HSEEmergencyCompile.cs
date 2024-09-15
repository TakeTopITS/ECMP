using System;

namespace ProjectMgt.Model
{
    /// <summary>
    /// 应急预案编制
    /// </summary>
    public class HSEEmergencyCompile
    {
        public HSEEmergencyCompile()
        {
        }

        private string code;
        private string name;
        private int projectId;
        private string projectName;
        private string status;
        private string remark;
        private DateTime createDate;

        /// <summary>
        /// 编码 HSEEMCX
        /// </summary>
        public virtual string Code
        {
            get { return code; }
            set { code = value; }
        }

        /// <summary>
        /// 名称
        /// </summary>
        public virtual string Name
        {
            get { return name; }
            set { name = value; }
        }

        /// <summary>
        /// 项目编号
        /// </summary>
        public virtual int ProjectId
        {
            get { return projectId; }
            set { projectId = value; }
        }

        /// <summary>
        /// 项目名称
        /// </summary>
        public virtual string ProjectName
        {
            get { return projectName; }
            set { projectName = value; }
        }

        /// <summary>
        /// 状态 新建，已演练
        /// </summary>
        public virtual string Status
        {
            get { return status; }
            set { status = value; }
        }

        /// <summary>
        /// 应急预案的重点内容
        /// </summary>
        public virtual string Remark
        {
            get { return remark; }
            set { remark = value; }
        }

        /// <summary>
        /// 创建时间
        /// </summary>
        public virtual DateTime CreateDate
        {
            get { return createDate; }
            set { createDate = value; }
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