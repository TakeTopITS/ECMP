using System;

namespace ProjectMgt.Model
{
    /// <summary>
    /// 事故调查报告
    /// </summary>
    public class HSEAccidentInvestigation
    {
        public HSEAccidentInvestigation()
        {
        }

        private string code;
        private string name;
        private string accidentDescriptionCode;
        private string accidentDescriptionName;

        /// <summary>
        /// 编码 HSEADIX
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
        /// 事故描述编码
        /// </summary>
        public virtual string AccidentDescriptionCode
        {
            get { return accidentDescriptionCode; }
            set { accidentDescriptionCode = value; }
        }

        /// <summary>
        /// 事故描述名称
        /// </summary>
        public virtual string AccidentDescriptionName
        {
            get { return accidentDescriptionName; }
            set { accidentDescriptionName = value; }
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

        private DateTime happenDate;

        /// <summary>
        /// 发生日期
        /// </summary>
        public virtual DateTime HappenDate
        {
            get { return happenDate; }
            set { happenDate = value; }
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

        private string currency;

        /// <summary>
        /// 币种
        /// </summary>
        public virtual string Currency
        {
            get { return currency; }
            set { currency = value; }
        }

        private decimal exchangeRate;

        /// <summary>
        /// 汇率
        /// </summary>
        public virtual decimal ExchangeRate
        {
            get { return exchangeRate; }
            set { exchangeRate = value; }
        }

        private decimal propertyDamage;

        /// <summary>
        /// 财产损失
        /// </summary>
        public virtual decimal PropertyDamage
        {
            get { return propertyDamage; }
            set { propertyDamage = value; }
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

        private string influenceHarm;

        /// <summary>
        /// 影响及危害
        /// </summary>
        public virtual string InfluenceHarm
        {
            get { return influenceHarm; }
            set { influenceHarm = value; }
        }

        private string causeResponsibility;

        /// <summary>
        /// 原因分析及责任划分
        /// </summary>
        public virtual string CauseResponsibility
        {
            get { return causeResponsibility; }
            set { causeResponsibility = value; }
        }

        private string engineeringSolutions;

        /// <summary>
        /// 工程处理方案
        /// </summary>
        public virtual string EngineeringSolutions
        {
            get { return engineeringSolutions; }
            set { engineeringSolutions = value; }
        }

        private string takeMeasures;

        /// <summary>
        /// 采取的措施
        /// </summary>
        public virtual string TakeMeasures
        {
            get { return takeMeasures; }
            set { takeMeasures = value; }
        }

        private string lessonText;

        /// <summary>
        /// 教训
        /// </summary>
        public virtual string LessonText
        {
            get { return lessonText; }
            set { lessonText = value; }
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