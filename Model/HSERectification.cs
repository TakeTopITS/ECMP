using System;

namespace ProjectMgt.Model
{
    /// <summary>
    /// 安全隐患整改
    /// </summary>
    public class HSERectification
    {
        public HSERectification()
        {
        }

        private string code;
        private string name;
        private string status;
        private string rectificationNoticeId;
        private string rectificationNoticeName;
        private string unitDepartCode;
        private string type;
        private string noFactDescribe;
        private string causeAnalysis;
        private string correctiveAction;
        private string rectificationOpinions;
        private string departCode;
        private string implementationHeader;
        private DateTime estimateCompletionDate;
        private string reviewer;
        private DateTime reviewDate;
        private string reviewResult;

        public virtual string Code
        {
            get { return code; }
            set { code = value; }
        }

        public virtual string Name
        {
            get { return name; }
            set { name = value; }
        }

        public virtual string Status
        {
            get { return status; }
            set { status = value; }
        }

        public virtual string RectificationNoticeId
        {
            get { return rectificationNoticeId; }
            set { rectificationNoticeId = value; }
        }

        public virtual string RectificationNoticeName
        {
            get { return rectificationNoticeName; }
            set { rectificationNoticeName = value; }
        }

        public virtual string UnitDepartCode
        {
            get { return unitDepartCode; }
            set { unitDepartCode = value; }
        }

        public virtual string Type
        {
            get { return type; }
            set { type = value; }
        }

        public virtual string NoFactDescribe
        {
            get { return noFactDescribe; }
            set { noFactDescribe = value; }
        }

        public virtual string CauseAnalysis
        {
            get { return causeAnalysis; }
            set { causeAnalysis = value; }
        }

        public virtual string CorrectiveAction
        {
            get { return correctiveAction; }
            set { correctiveAction = value; }
        }

        public virtual string RectificationOpinions
        {
            get { return rectificationOpinions; }
            set { rectificationOpinions = value; }
        }

        public virtual string DepartCode
        {
            get { return departCode; }
            set { departCode = value; }
        }

        public virtual string ImplementationHeader
        {
            get { return implementationHeader; }
            set { implementationHeader = value; }
        }

        public virtual DateTime EstimateCompletionDate
        {
            get { return estimateCompletionDate; }
            set { estimateCompletionDate = value; }
        }

        public virtual string Reviewer
        {
            get { return reviewer; }
            set { reviewer = value; }
        }

        public virtual DateTime ReviewDate
        {
            get { return reviewDate; }
            set { reviewDate = value; }
        }

        public virtual string ReviewResult
        {
            get { return reviewResult; }
            set { reviewResult = value; }
        }

        private string enterCode;

        public virtual string EnterCode
        {
            get { return enterCode; }
            set { enterCode = value; }
        }
    }
}