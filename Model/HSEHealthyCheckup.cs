using System;

namespace ProjectMgt.Model
{
    public class HSEHealthyCheckup
    {
        public HSEHealthyCheckup()
        {
        }

        private string code;

        /// <summary>
        /// 格式 HSEHCUX
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

        private DateTime checkDate;

        public virtual DateTime CheckDate
        {
            get { return checkDate; }
            set { checkDate = value; }
        }

        private string persionName;

        public virtual string PersionName
        {
            get { return persionName; }
            set { persionName = value; }
        }

        private string perAttribute;

        public virtual string PerAttribute
        {
            get { return perAttribute; }
            set { perAttribute = value; }
        }

        private string gender;

        public virtual string Gender
        {
            get { return gender; }
            set { gender = value; }
        }

        private DateTime birthDay;

        public virtual DateTime BirthDay
        {
            get { return birthDay; }
            set { birthDay = value; }
        }

        private string perType;

        public virtual string PerType
        {
            get { return perType; }
            set { perType = value; }
        }

        private string medicalConclusion;

        public virtual string MedicalConclusion
        {
            get { return medicalConclusion; }
            set { medicalConclusion = value; }
        }

        private string enterCode;

        public virtual string EnterCode
        {
            get { return enterCode; }
            set { enterCode = value; }
        }

        private DateTime enterDate;

        public virtual DateTime EnterDate
        {
            get { return enterDate; }
            set { enterDate = value; }
        }

        private string enterCodeValue;

        /// <summary>
        /// 创建者编码
        /// </summary>
        public virtual string EnterCodeValue
        {
            get { return enterCodeValue; }
            set { enterCodeValue = value; }
        }
    }
}