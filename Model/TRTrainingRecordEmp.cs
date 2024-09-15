using System;

namespace ProjectMgt.Model
{
    /// <summary>
    /// 员工培训记录
    /// </summary>
    public class TRTrainingRecordEmp
    {
        public TRTrainingRecordEmp()
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

        private string trainingProject;

        /// <summary>
        /// 培训项目
        /// </summary>
        public virtual string TrainingProject
        {
            get { return trainingProject; }
            set { trainingProject = value; }
        }

        private string trainingAccord;

        /// <summary>
        /// 培训依据
        /// </summary>
        public virtual string TrainingAccord
        {
            get { return trainingAccord; }
            set { trainingAccord = value; }
        }

        private string trainingUnit;

        /// <summary>
        /// 举办单位
        /// </summary>
        public virtual string TrainingUnit
        {
            get { return trainingUnit; }
            set { trainingUnit = value; }
        }

        private DateTime trainingTime;

        /// <summary>
        /// 培训日期
        /// </summary>
        public virtual DateTime TrainingTime
        {
            get { return trainingTime; }
            set { trainingTime = value; }
        }

        private string trainingAddress;

        /// <summary>
        /// 培训地点
        /// </summary>
        public virtual string TrainingAddress
        {
            get { return trainingAddress; }
            set { trainingAddress = value; }
        }

        private string trainingContent;

        /// <summary>
        /// 培训内容
        /// </summary>
        public virtual string TrainingContent
        {
            get { return trainingContent; }
            set { trainingContent = value; }
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