using System;

namespace ProjectMgt.Model
{
    /// <summary>
    /// 事故描述
    /// </summary>
    public class HSEAccidentDescription
    {
        public HSEAccidentDescription()
        {
        }

        private string code;
        private string name;
        private int projectId;
        private string projectName;
        private string status;

        /// <summary>
        /// 编码 HSEADDX
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
        /// 状态 新建，已调查
        /// </summary>
        public virtual string Status
        {
            get { return status; }
            set { status = value; }
        }

        private string sceneLeader;

        /// <summary>
        /// 现场负责人
        /// </summary>
        public virtual string SceneLeader
        {
            get { return sceneLeader; }
            set { sceneLeader = value; }
        }

        private DateTime accidentDate;

        /// <summary>
        /// 事故日期
        /// </summary>
        public virtual DateTime AccidentDate
        {
            get { return accidentDate; }
            set { accidentDate = value; }
        }

        private string accidentAddr;

        /// <summary>
        /// 事故地点
        /// </summary>
        public virtual string AccidentAddr
        {
            get { return accidentAddr; }
            set { accidentAddr = value; }
        }

        private string accidentType;

        /// <summary>
        /// 事故类型
        /// </summary>
        public virtual string AccidentType
        {
            get { return accidentType; }
            set { accidentType = value; }
        }

        private string departCode;

        /// <summary>
        /// 责任单位
        /// </summary>
        public virtual string DepartCode
        {
            get { return departCode; }
            set { departCode = value; }
        }

        private int deathNum;

        /// <summary>
        /// 死亡人数
        /// </summary>
        public virtual int DeathNum
        {
            get { return deathNum; }
            set { deathNum = value; }
        }

        private int seriousInjury;

        /// <summary>
        /// 重伤人数
        /// </summary>
        public virtual int SeriousInjury
        {
            get { return seriousInjury; }
            set { seriousInjury = value; }
        }

        private int minorInjury;

        /// <summary>
        /// 轻伤人数
        /// </summary>
        public virtual int MinorInjury
        {
            get { return minorInjury; }
            set { minorInjury = value; }
        }

        private string accidentAfter;

        /// <summary>
        /// 事故经过
        /// </summary>
        public virtual string AccidentAfter
        {
            get { return accidentAfter; }
            set { accidentAfter = value; }
        }

        private string accidentScope;

        /// <summary>
        /// 事故影响范围
        /// </summary>
        public virtual string AccidentScope
        {
            get { return accidentScope; }
            set { accidentScope = value; }
        }

        private string accidentBecause;

        /// <summary>
        /// 事故原因初步判断
        /// </summary>
        public virtual string AccidentBecause
        {
            get { return accidentBecause; }
            set { accidentBecause = value; }
        }

        private string measures;

        /// <summary>
        /// 采取的措施
        /// </summary>
        public virtual string Measures
        {
            get { return measures; }
            set { measures = value; }
        }

        private string others;

        /// <summary>
        /// 其他情况
        /// </summary>
        public virtual string Others
        {
            get { return others; }
            set { others = value; }
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