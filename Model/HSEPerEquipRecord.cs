using System;

namespace ProjectMgt.Model
{
    /// <summary>
    /// 人员、设备备案
    /// </summary>
    public class HSEPerEquipRecord
    {
        public HSEPerEquipRecord()
        {
        }

        private string code;
        private string name;
        private string companyFor;
        private string address;

        /// <summary>
        /// 编码 HSEPERX
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
        /// 公司缩写
        /// </summary>
        public virtual string CompanyFor
        {
            get { return companyFor; }
            set { companyFor = value; }
        }

        /// <summary>
        /// 公司地址
        /// </summary>
        public virtual string Address
        {
            get { return address; }
            set { address = value; }
        }

        private string einNo;

        /// <summary>
        /// 税后
        /// </summary>
        public virtual string EinNo
        {
            get { return einNo; }
            set { einNo = value; }
        }

        private DateTime validityStart;

        /// <summary>
        /// 有效期(开始)
        /// </summary>
        public virtual DateTime ValidityStart
        {
            get { return validityStart; }
            set { validityStart = value; }
        }

        private DateTime validityEnd;

        /// <summary>
        /// 有效期(结束)
        /// </summary>
        public virtual DateTime ValidityEnd
        {
            get { return validityEnd; }
            set { validityEnd = value; }
        }

        private string linkTel;

        /// <summary>
        /// 联系电话
        /// </summary>
        public virtual string LinkTel
        {
            get { return linkTel; }
            set { linkTel = value; }
        }

        private string email;

        /// <summary>
        /// 邮箱地址
        /// </summary>
        public virtual string Email
        {
            get { return email; }
            set { email = value; }
        }

        private string zipCode;

        /// <summary>
        /// 邮编
        /// </summary>
        public virtual string ZipCode
        {
            get { return zipCode; }
            set { zipCode = value; }
        }

        private string suppServScope;

        /// <summary>
        /// 供货/服务范围
        /// </summary>
        public virtual string SuppServScope
        {
            get { return suppServScope; }
            set { suppServScope = value; }
        }

        private string bankName;

        /// <summary>
        /// 开户银行
        /// </summary>
        public virtual string BankName
        {
            get { return bankName; }
            set { bankName = value; }
        }

        private string auditStatus;

        /// <summary>
        /// 评审情况  合格，不合格
        /// </summary>
        public virtual string AuditStatus
        {
            get { return auditStatus; }
            set { auditStatus = value; }
        }

        private string fax;

        /// <summary>
        /// 传真
        /// </summary>
        public virtual string Fax
        {
            get { return fax; }
            set { fax = value; }
        }

        private string webAddress;

        /// <summary>
        /// 网址
        /// </summary>
        public virtual string WebAddress
        {
            get { return webAddress; }
            set { webAddress = value; }
        }

        private string qualifications;

        /// <summary>
        /// 资质
        /// </summary>
        public virtual string Qualifications
        {
            get { return qualifications; }
            set { qualifications = value; }
        }

        private string type;

        /// <summary>
        /// 类型 人员备案、设备备案
        /// </summary>
        public virtual string Type
        {
            get { return type; }
            set { type = value; }
        }

        private string enterCode;

        public virtual string EnterCode
        {
            get { return enterCode; }
            set { enterCode = value; }
        }
    }
}