namespace ProjectMgt.Model
{
    /// <summary>
    /// 供应商联系人
    /// </summary>
    public class BMSupplierLink
    {
        public BMSupplierLink()
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

        private string supplierCode;

        /// <summary>
        /// 供应商编码
        /// </summary>
        public virtual string SupplierCode
        {
            get { return supplierCode; }
            set { supplierCode = value; }
        }

        private string name;

        /// <summary>
        /// 姓名
        /// </summary>
        public virtual string Name
        {
            get { return name; }
            set { name = value; }
        }

        private string gender;

        /// <summary>
        /// 性别
        /// </summary>
        public virtual string Gender
        {
            get { return gender; }
            set { gender = value; }
        }

        private string position;

        /// <summary>
        /// 职务
        /// </summary>
        public virtual string Position
        {
            get { return position; }
            set { position = value; }
        }

        private string mobileNum;

        /// <summary>
        /// 手机
        /// </summary>
        public virtual string MobileNum
        {
            get { return mobileNum; }
            set { mobileNum = value; }
        }

        private string officePhone;

        /// <summary>
        /// 办公电话
        /// </summary>
        public virtual string OfficePhone
        {
            get { return officePhone; }
            set { officePhone = value; }
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

        private string code;

        /// <summary>
        /// 帐号
        /// </summary>
        public virtual string Code
        {
            get { return code; }
            set { code = value; }
        }
    }
}