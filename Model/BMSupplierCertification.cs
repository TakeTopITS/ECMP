using System;

namespace ProjectMgt.Model
{
    /// <summary>
    /// 供应商证书
    /// </summary>
    public class BMSupplierCertification
    {
        public BMSupplierCertification()
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

        private string certificateNum;

        /// <summary>
        /// 证书编号
        /// </summary>
        public virtual string CertificateNum
        {
            get { return certificateNum; }
            set { certificateNum = value; }
        }

        private string certificateName;

        /// <summary>
        /// 证书名称
        /// </summary>
        public virtual string CertificateName
        {
            get { return certificateName; }
            set { certificateName = value; }
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

        private string licenseAgency;

        /// <summary>
        /// 发证机关
        /// </summary>
        public virtual string LicenseAgency
        {
            get { return licenseAgency; }
            set { licenseAgency = value; }
        }

        private string attach;

        /// <summary>
        /// 附件
        /// </summary>
        public virtual string Attach
        {
            get { return attach; }
            set { attach = value; }
        }
    }
}