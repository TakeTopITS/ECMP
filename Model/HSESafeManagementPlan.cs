namespace ProjectMgt.Model
{
    /// <summary>
    /// 安全管理方案
    /// </summary>
    public class HSESafeManagementPlan
    {
        public HSESafeManagementPlan()
        {
        }

        private string code;
        private string name;
        private int projectId;
        private string projectName;

        /// <summary>
        /// 编码 HSESMPX
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

        private string perEquipRecordCode;

        /// <summary>
        /// 人员，设备备案编码
        /// </summary>
        public virtual string PerEquipRecordCode
        {
            get { return perEquipRecordCode; }
            set { perEquipRecordCode = value; }
        }

        private string perEquipRecordName;

        /// <summary>
        /// 人员，设备备案名称
        /// </summary>
        public virtual string PerEquipRecordName
        {
            get { return perEquipRecordName; }
            set { perEquipRecordName = value; }
        }

        private string leader;

        /// <summary>
        /// 负责人
        /// </summary>
        public virtual string Leader
        {
            get { return leader; }
            set { leader = value; }
        }

        private string remark;

        /// <summary>
        /// 方案内容
        /// </summary>
        public virtual string Remark
        {
            get { return remark; }
            set { remark = value; }
        }

        private string enterCode;

        public virtual string EnterCode
        {
            get { return enterCode; }
            set { enterCode = value; }
        }
    }
}