using System;

namespace ProjectMgt.Model
{
    /// <summary>
    /// 环境因素调查
    /// </summary>
    public class HSEEnvirFactorSurvey
    {
        public HSEEnvirFactorSurvey()
        {
        }

        private string code;

        /// <summary>
        /// 格式 HSEEFSX
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

        private string status;

        public virtual string Status
        {
            get { return status; }
            set { status = value; }
        }

        private string leader;

        public virtual string Leader
        {
            get { return leader; }
            set { leader = value; }
        }

        private string unitCode;

        public virtual string UnitCode
        {
            get { return unitCode; }
            set { unitCode = value; }
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

        private string remark;

        public virtual string Remark
        {
            get { return remark; }
            set { remark = value; }
        }

        private string distributedObject;

        public virtual string DistributedObject
        {
            get { return distributedObject; }
            set { distributedObject = value; }
        }

        private string evaluationOpinions;

        public virtual string EvaluationOpinions
        {
            get { return evaluationOpinions; }
            set { evaluationOpinions = value; }
        }

        private DateTime evaluationDate;

        public virtual DateTime EvaluationDate
        {
            get { return evaluationDate; }
            set { evaluationDate = value; }
        }

        private string associatedProcess;

        public virtual string AssociatedProcess
        {
            get { return associatedProcess; }
            set { associatedProcess = value; }
        }

        private string attachName;

        public virtual string AttachName
        {
            get { return attachName; }
            set { attachName = value; }
        }

        private string attachPath;

        public virtual string AttachPath
        {
            get { return attachPath; }
            set { attachPath = value; }
        }

        private string evaluationPer;

        public virtual string EvaluationPer
        {
            get { return evaluationPer; }
            set { evaluationPer = value; }
        }

        private string enterCodeValue;

        public virtual string EnterCodeValue
        {
            get { return enterCodeValue; }
            set { enterCodeValue = value; }
        }
    }
}