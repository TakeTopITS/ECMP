using System;

namespace ProjectMgt.Model
{
    /// <summary>
    /// 应急预案演练
    /// </summary>
    public class HSEEmergencyRehearse
    {
        public HSEEmergencyRehearse()
        {
        }

        private string code;
        private string name;
        private string emergencyCompileCode;
        private string emergencyCompileName;
        private DateTime rehearseDate;
        private string rehearseAddr;
        private string header;
        private string rehearseQuestion;
        private string rehearseFeedBack;
        private string participants;

        /// <summary>
        /// 编码 HSEENRX
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
        /// 预案编制编码
        /// </summary>
        public virtual string EmergencyCompileCode
        {
            get { return emergencyCompileCode; }
            set { emergencyCompileCode = value; }
        }

        /// <summary>
        /// 预案编制名称
        /// </summary>
        public virtual string EmergencyCompileName
        {
            get { return emergencyCompileName; }
            set { emergencyCompileName = value; }
        }

        /// <summary>
        /// 演练日期
        /// </summary>
        public virtual DateTime RehearseDate
        {
            get { return rehearseDate; }
            set { rehearseDate = value; }
        }

        /// <summary>
        /// 演练地址
        /// </summary>
        public virtual string RehearseAddr
        {
            get { return rehearseAddr; }
            set { rehearseAddr = value; }
        }

        /// <summary>
        /// 负责人
        /// </summary>
        public virtual string Header
        {
            get { return header; }
            set { header = value; }
        }

        /// <summary>
        /// 演练发现问题
        /// </summary>
        public virtual string RehearseQuestion
        {
            get { return rehearseQuestion; }
            set { rehearseQuestion = value; }
        }

        /// <summary>
        /// 演练反馈情况
        /// </summary>
        public virtual string RehearseFeedBack
        {
            get { return rehearseFeedBack; }
            set { rehearseFeedBack = value; }
        }

        /// <summary>
        /// 参加人员
        /// </summary>
        public virtual string Participants
        {
            get { return participants; }
            set { participants = value; }
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