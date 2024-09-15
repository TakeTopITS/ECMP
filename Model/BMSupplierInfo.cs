using System;

namespace ProjectMgt.Model
{
    /// <summary>
    /// 供应商信息
    /// </summary>
    public class BMSupplierInfo
    {
        public BMSupplierInfo()
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

        private string code;

        /// <summary>
        /// 企业编码 登录帐号 不能与ProjectMember中的编码重复
        /// </summary>
        public virtual string Code
        {
            get { return code; }
            set { code = value; }
        }

        private string name;

        /// <summary>
        /// 企业名称
        /// </summary>
        public virtual string Name
        {
            get { return name; }
            set { name = value; }
        }

        private string passWord;

        /// <summary>
        /// 登录密码
        /// </summary>
        public virtual string PassWord
        {
            get { return passWord; }
            set { passWord = value; }
        }

        private string companyFor;

        /// <summary>
        /// 企业简称
        /// </summary>
        public virtual string CompanyFor
        {
            get { return companyFor; }
            set { companyFor = value; }
        }

        private string companyType;

        /// <summary>
        /// 企业性质 国企，私企等
        /// </summary>
        public virtual string CompanyType
        {
            get { return companyType; }
            set { companyType = value; }
        }

        private string address;

        /// <summary>
        /// 地址
        /// </summary>
        public virtual string Address
        {
            get { return address; }
            set { address = value; }
        }

        private string phoneNum;

        /// <summary>
        /// 联系电话
        /// </summary>
        public virtual string PhoneNum
        {
            get { return phoneNum; }
            set { phoneNum = value; }
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

        private string email;

        /// <summary>
        /// 电子邮箱
        /// </summary>
        public virtual string Email
        {
            get { return email; }
            set { email = value; }
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

        private string webUrl;

        /// <summary>
        /// 网址
        /// </summary>
        public virtual string WebUrl
        {
            get { return webUrl; }
            set { webUrl = value; }
        }

        private string supplyScope;

        /// <summary>
        /// 供货范围
        /// </summary>
        public virtual string SupplyScope
        {
            get { return supplyScope; }
            set { supplyScope = value; }
        }

        private string bank;

        /// <summary>
        /// 开户银行
        /// </summary>
        public virtual string Bank
        {
            get { return bank; }
            set { bank = value; }
        }

        private string bankNo;

        /// <summary>
        /// 银行帐号
        /// </summary>
        public virtual string BankNo
        {
            get { return bankNo; }
            set { bankNo = value; }
        }

        private string einNo;

        /// <summary>
        /// 税号
        /// </summary>
        public virtual string EinNo
        {
            get { return einNo; }
            set { einNo = value; }
        }

        private string qualification;

        /// <summary>
        /// 企业资质
        /// </summary>
        public virtual string Qualification
        {
            get { return qualification; }
            set { qualification = value; }
        }

        private string status;

        /// <summary>
        /// 状态 合格，不合格 合格的供应商可以参与投标
        /// </summary>
        public virtual string Status
        {
            get { return status; }
            set { status = value; }
        }

        private string reviewer;

        /// <summary>
        /// 评审人
        /// </summary>
        public virtual string Reviewer
        {
            get { return reviewer; }
            set { reviewer = value; }
        }

        private DateTime reviewDate;

        /// <summary>
        /// 评审日期
        /// </summary>
        public virtual DateTime ReviewDate
        {
            get { return reviewDate; }
            set { reviewDate = value; }
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

        private string enterPer;

        /// <summary>
        /// 录入人
        /// </summary>
        public virtual string EnterPer
        {
            get { return enterPer; }
            set { enterPer = value; }
        }

        private DateTime enterDate;

        /// <summary>
        /// 录入时间
        /// </summary>
        public virtual DateTime EnterDate
        {
            get { return enterDate; }
            set { enterDate = value; }
        }

        private decimal point;

        /// <summary>
        /// 评价得分
        /// </summary>
        public virtual decimal Point
        {
            get { return point; }
            set { point = value; }
        }

        private string subcontractProfessional;

        /// <summary>
        /// 分包专业
        /// </summary>
        public virtual string SubcontractProfessional
        {
            get { return subcontractProfessional; }
            set { subcontractProfessional = value; }
        }

        private string legalRepresentative;

        /// <summary>
        /// 法定代表人
        /// </summary>
        public virtual string LegalRepresentative
        {
            get { return legalRepresentative; }
            set { legalRepresentative = value; }
        }

        private string technicalTitles;

        /// <summary>
        /// 法定代表人技术职称
        /// </summary>
        public virtual string TechnicalTitles
        {
            get { return technicalTitles; }
            set { technicalTitles = value; }
        }

        private string legalTel;

        /// <summary>
        /// 法定代表人电话
        /// </summary>
        public virtual string LegalTel
        {
            get { return legalTel; }
            set { legalTel = value; }
        }

        private string technicalDirector;

        /// <summary>
        /// 技术负责人
        /// </summary>
        public virtual string TechnicalDirector
        {
            get { return technicalDirector; }
            set { technicalDirector = value; }
        }

        private string technicalTitles_T;

        /// <summary>
        /// 技术负责人技术职称
        /// </summary>
        public virtual string TechnicalTitles_T
        {
            get { return technicalTitles_T; }
            set { technicalTitles_T = value; }
        }

        private string technicalTel;

        /// <summary>
        /// 技术负责人电话
        /// </summary>
        public virtual string TechnicalTel
        {
            get { return technicalTel; }
            set { technicalTel = value; }
        }

        private DateTime setUpTime;

        /// <summary>
        /// 成立日期
        /// </summary>
        public virtual DateTime SetUpTime
        {
            get { return setUpTime; }
            set { setUpTime = value; }
        }

        private int employeesNum;

        /// <summary>
        /// 员工总人数
        /// </summary>
        public virtual int EmployeesNum
        {
            get { return employeesNum; }
            set { employeesNum = value; }
        }

        private string qualificationCertificate;

        /// <summary>
        /// 资质证书
        /// </summary>
        public virtual string QualificationCertificate
        {
            get { return qualificationCertificate; }
            set { qualificationCertificate = value; }
        }

        private string businessLicense;

        /// <summary>
        /// 营业执照
        /// </summary>
        public virtual string BusinessLicense
        {
            get { return businessLicense; }
            set { businessLicense = value; }
        }

        private decimal registeredCapital;

        /// <summary>
        /// 注册资金
        /// </summary>
        public virtual decimal RegisteredCapital
        {
            get { return registeredCapital; }
            set { registeredCapital = value; }
        }

        private int pMNumber;

        /// <summary>
        /// 项目经理人数
        /// </summary>
        public virtual int PMNumber
        {
            get { return pMNumber; }
            set { pMNumber = value; }
        }

        private int sTNumber;

        /// <summary>
        /// 高级职称人数
        /// </summary>
        public virtual int STNumber
        {
            get { return sTNumber; }
            set { sTNumber = value; }
        }

        private int iTNumber;

        /// <summary>
        /// 中级职称人数
        /// </summary>
        public virtual int ITNumber
        {
            get { return iTNumber; }
            set { iTNumber = value; }
        }

        private int pTNumber;

        /// <summary>
        /// 初级职称人数
        /// </summary>
        public virtual int PTNumber
        {
            get { return pTNumber; }
            set { pTNumber = value; }
        }

        private int mNumber;

        /// <summary>
        /// 技工人数
        /// </summary>
        public virtual int MNumber
        {
            get { return mNumber; }
            set { mNumber = value; }
        }

        private string recommendedUnits;

        /// <summary>
        /// 推荐单位
        /// </summary>
        public virtual string RecommendedUnits
        {
            get { return recommendedUnits; }
            set { recommendedUnits = value; }
        }

        private string lastFinalistsNumber;

        /// <summary>
        /// 上年度公司入围编号
        /// </summary>
        public virtual string LastFinalistsNumber
        {
            get { return lastFinalistsNumber; }
            set { lastFinalistsNumber = value; }
        }

        private string isLand;

        /// <summary>
        /// 是否入围
        /// </summary>
        public virtual string IsLand
        {
            get { return isLand; }
            set { isLand = value; }
        }

        private string accessoriesPath;

        /// <summary>
        /// 附件路径
        /// </summary>
        public virtual string AccessoriesPath
        {
            get { return accessoriesPath; }
            set { accessoriesPath = value; }
        }

        public virtual string EnginerringSupplier
        {
            get; set;
        }

        public virtual string InternationSupplier
        {
            get; set;
        }

        public virtual string RetailSupplier
        {
            get; set;
        }

        public virtual string StoreSupplier
        {
            get; set;
        }

        public virtual string SupplierBigType
        {
            get; set;
        }

        public virtual string SupplierSmallType
        {
            get; set;
        }
    }
}