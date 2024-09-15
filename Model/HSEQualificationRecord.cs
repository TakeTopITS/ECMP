namespace ProjectMgt.Model
{
    /// <summary>
    /// 资质备案
    /// </summary>
    public class HSEQualificationRecord
    {
        public HSEQualificationRecord()
        {
        }

        private string code;
        private string name;
        private string perEquipRecordCode;
        private string perEquipRecordName;

        /// <summary>
        /// 编码 HSEQFRX
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
        /// 人员、设备备案编码
        /// </summary>
        public virtual string PerEquipRecordCode
        {
            get { return perEquipRecordCode; }
            set { perEquipRecordCode = value; }
        }

        /// <summary>
        /// 人员、设备备案名称
        /// </summary>
        public virtual string PerEquipRecordName
        {
            get { return perEquipRecordName; }
            set { perEquipRecordName = value; }
        }

        private string businessScope;

        /// <summary>
        /// 经营范围及项目
        /// </summary>
        public virtual string BusinessScope
        {
            get { return businessScope; }
            set { businessScope = value; }
        }

        private string subcontractWork;

        /// <summary>
        /// 分包工作内容
        /// </summary>
        public virtual string SubcontractWork
        {
            get { return subcontractWork; }
            set { subcontractWork = value; }
        }

        private string construction;

        /// <summary>
        /// 近三年施工简介
        /// </summary>
        public virtual string Construction
        {
            get { return construction; }
            set { construction = value; }
        }

        private string enterCode;

        public virtual string EnterCode
        {
            get { return enterCode; }
            set { enterCode = value; }
        }
    }
}