using System;

namespace ProjectMgt.Model
{
    public class AssetApplication
    {
        public AssetApplication()
        {
        }

        private int aaID;
        private string aaName;
        private string type;
        private string applicantCode;
        private string applicantName;
        private DateTime applyTime;
        private DateTime finishTime;
        private string applyReason;
        private string status;
        private string relatedType;
        private int relatedID;

        public virtual int AAID
        {
            get { return aaID; }
            set { aaID = value; }
        }

        public virtual string AAName
        {
            get { return aaName; }
            set { aaName = value; }
        }

        public virtual string Type
        {
            get { return type; }
            set { type = value; }
        }

        public virtual string ApplicantCode
        {
            get { return applicantCode; }
            set { applicantCode = value; }
        }

        public virtual string ApplicantName
        {
            get { return applicantName; }
            set { applicantName = value; }
        }

        public virtual DateTime ApplyTime
        {
            get { return applyTime; }
            set { applyTime = value; }
        }

        public virtual DateTime FinishTime
        {
            get { return finishTime; }
            set { finishTime = value; }
        }

        public virtual string ApplyReason
        {
            get { return applyReason; }
            set { applyReason = value; }
        }

        public virtual string Status
        {
            get { return status; }
            set { status = value; }
        }

        public virtual string RelatedType
        {
            get { return relatedType; }
            set { relatedType = value; }
        }

        public virtual int RelatedID
        {
            get { return relatedID; }
            set { relatedID = value; }
        }
    }
}