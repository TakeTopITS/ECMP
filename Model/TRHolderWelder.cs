using System;

namespace ProjectMgt.Model
{
    /// <summary>
    /// 焊工持证项目
    /// </summary>
    public class TRHolderWelder
    {
        public TRHolderWelder()
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

        private string certificateNo;

        /// <summary>
        /// 证件编码
        /// </summary>
        public virtual string CertificateNo
        {
            get { return certificateNo; }
            set { certificateNo = value; }
        }

        private string welderSeal;

        /// <summary>
        /// 焊工钢印
        /// </summary>
        public virtual string WelderSeal
        {
            get { return welderSeal; }
            set { welderSeal = value; }
        }

        private string holderProject;

        /// <summary>
        /// 持证项目
        /// </summary>
        public virtual string HolderProject
        {
            get { return holderProject; }
            set { holderProject = value; }
        }

        private string validTime;

        /// <summary>
        /// 持证项目有效期
        /// </summary>
        public virtual string ValidTime
        {
            get { return validTime; }
            set { validTime = value; }
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

        private string attachPath;

        /// <summary>
        /// 扫描件路径
        /// </summary>
        public virtual string AttachPath
        {
            get { return attachPath; }
            set { attachPath = value; }
        }
    }
}