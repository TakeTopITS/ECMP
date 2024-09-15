using System;

namespace ProjectMgt.Model
{
    /// <summary>
    /// 岗位证书
    /// </summary>
    public class TRPostCertificate
    {
        public TRPostCertificate()
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

        private string unit;

        /// <summary>
        /// 单位
        /// </summary>
        public virtual string Unit
        {
            get { return unit; }
            set { unit = value; }
        }

        private string job;

        /// <summary>
        /// 岗位职务
        /// </summary>
        public virtual string Job
        {
            get { return job; }
            set { job = value; }
        }

        private string certificateNo;

        /// <summary>
        /// 岗位证书编号
        /// </summary>
        public virtual string CertificateNo
        {
            get { return certificateNo; }
            set { certificateNo = value; }
        }

        private string certificateOffice;

        /// <summary>
        /// 发证机关
        /// </summary>
        public virtual string CertificateOffice
        {
            get { return certificateOffice; }
            set { certificateOffice = value; }
        }

        private DateTime certificateTime;

        /// <summary>
        /// 岗位证书取证日期
        /// </summary>
        public virtual DateTime CertificateTime
        {
            get { return certificateTime; }
            set { certificateTime = value; }
        }

        private DateTime certificateReviewTime;

        /// <summary>
        /// 岗位证书复审日期
        /// </summary>
        public virtual DateTime CertificateReviewTime
        {
            get { return certificateReviewTime; }
            set { certificateReviewTime = value; }
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