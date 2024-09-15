using System;

namespace ProjectMgt.Model
{
    /// <summary>
    /// 特种设备
    /// </summary>
    public class TRSpecialEquipment
    {
        public TRSpecialEquipment()
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

        private string speEquType;

        /// <summary>
        /// 特种设备类别
        /// </summary>
        public virtual string SpeEquType
        {
            get { return speEquType; }
            set { speEquType = value; }
        }

        private string speEquProject;

        /// <summary>
        /// 特种设备准操项目
        /// </summary>
        public virtual string SpeEquProject
        {
            get { return speEquProject; }
            set { speEquProject = value; }
        }

        private DateTime speEquStartTime;

        /// <summary>
        /// 特种设备取证日期
        /// </summary>
        public virtual DateTime SpeEquStartTime
        {
            get { return speEquStartTime; }
            set { speEquStartTime = value; }
        }

        private DateTime speEquReviewTime;

        /// <summary>
        /// 特种设备复审日期
        /// </summary>
        public virtual DateTime SpeEquReviewTime
        {
            get { return speEquReviewTime; }
            set { speEquReviewTime = value; }
        }

        private string speEquNumber;

        /// <summary>
        /// 特种设备证书编号
        /// </summary>
        public virtual string SpeEquNumber
        {
            get { return speEquNumber; }
            set { speEquNumber = value; }
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