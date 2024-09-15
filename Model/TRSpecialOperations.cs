using System;

namespace ProjectMgt.Model
{
    /// <summary>
    /// 特种作业
    /// </summary>
    public class TRSpecialOperations
    {
        public TRSpecialOperations()
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

        private string speOpeType;

        /// <summary>
        /// 特种作业类别
        /// </summary>
        public virtual string SpeOpeType
        {
            get { return speOpeType; }
            set { speOpeType = value; }
        }

        private string speOpeProject;

        /// <summary>
        /// 特种作业准操项目
        /// </summary>
        public virtual string SpeOpeProject
        {
            get { return speOpeProject; }
            set { speOpeProject = value; }
        }

        private DateTime speOpeStartTime;

        /// <summary>
        /// 特种作业取证日期
        /// </summary>
        public virtual DateTime SpeOpeStartTime
        {
            get { return speOpeStartTime; }
            set { speOpeStartTime = value; }
        }

        private DateTime speOpeReviewTime;

        /// <summary>
        /// 特种作业复审日期
        /// </summary>
        public virtual DateTime SpeOpeReviewTime
        {
            get { return speOpeReviewTime; }
            set { speOpeReviewTime = value; }
        }

        private string speOpeNumber;

        /// <summary>
        /// 特种作业证书编号
        /// </summary>
        public virtual string SpeOpeNumber
        {
            get { return speOpeNumber; }
            set { speOpeNumber = value; }
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