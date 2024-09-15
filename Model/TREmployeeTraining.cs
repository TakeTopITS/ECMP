using System;

namespace ProjectMgt.Model
{
    /// <summary>
    /// 员工培训
    /// </summary>
    public class TREmployeeTraining
    {
        public TREmployeeTraining()
        {
        }

        private int id;

        /// <summary>
        /// 自增ID
        /// </summary>
        public virtual int ID
        {
            get { return id; }
            set { id = value; }
        }

        private string userCode;

        /// <summary>
        /// 用户编码
        /// </summary>
        public virtual string UserCode
        {
            get { return userCode; }
            set { userCode = value; }
        }

        private string professionalSkillLevel;

        /// <summary>
        /// 职业技能等级
        /// </summary>
        public virtual string ProfessionalSkillLevel
        {
            get { return professionalSkillLevel; }
            set { professionalSkillLevel = value; }
        }

        private string professionSkillNumber;

        /// <summary>
        /// 职业技能鉴定证书编号
        /// </summary>
        public virtual string ProfessionSkillNumber
        {
            get { return professionSkillNumber; }
            set { professionSkillNumber = value; }
        }

        private string validityType;

        /// <summary>
        /// 鉴定工种
        /// </summary>
        public virtual string ValidityType
        {
            get { return validityType; }
            set { validityType = value; }
        }

        private DateTime releaseTime;

        /// <summary>
        /// 发证日期
        /// </summary>
        public virtual DateTime ReleaseTime
        {
            get { return releaseTime; }
            set { releaseTime = value; }
        }

        private string annValidTime;

        /// <summary>
        /// 安恐有效期
        /// </summary>
        public virtual string AnnValidTime
        {
            get { return annValidTime; }
            set { annValidTime = value; }
        }

        private string annCertificateNo;

        /// <summary>
        /// 安恐证书编号
        /// </summary>
        public virtual string AnnCertificateNo
        {
            get { return annCertificateNo; }
            set { annCertificateNo = value; }
        }

        private string englishRiew;

        /// <summary>
        /// 涉外英语考核
        /// </summary>
        public virtual string EnglishRiew
        {
            get { return englishRiew; }
            set { englishRiew = value; }
        }

        private string trainingInfo;

        /// <summary>
        /// 培训相关信息
        /// </summary>
        public virtual string TrainingInfo
        {
            get { return trainingInfo; }
            set { trainingInfo = value; }
        }

        private string remark;

        /// <summary>
        /// 备注
        /// </summary>
        public virtual string Remark
        {
            get { return remark; }
            set { remark = value; }
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

        private DateTime enterTime;

        /// <summary>
        /// 创建日期
        /// </summary>
        public virtual DateTime EnterTime
        {
            get { return enterTime; }
            set { enterTime = value; }
        }
    }
}