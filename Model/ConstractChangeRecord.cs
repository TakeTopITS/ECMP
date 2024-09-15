using System;

namespace ProjectMgt.Model
{
    public class ConstractChangeRecord
    {
        public ConstractChangeRecord()
        {
        }

        private int id;
        private string changeType;
        private string constractCode;
        private string changeContent;
        private decimal afterChangeAmount;
        private DateTime changeTime;
        private string operatorCode;
        private string operatorName;

        public virtual int ID
        {
            get { return id; }
            set { id = value; }
        }

        public virtual string ChangeType
        {
            get { return changeType; }
            set { changeType = value; }
        }

        public virtual string ConstractCode
        {
            get { return constractCode; }
            set { constractCode = value; }
        }

        public virtual string ChangeContent
        {
            get { return changeContent; }
            set { changeContent = value; }
        }

        public virtual decimal AfterChangeAmount
        {
            get { return afterChangeAmount; }
            set { afterChangeAmount = value; }
        }

        public virtual DateTime ChangeTime
        {
            get { return changeTime; }
            set { changeTime = value; }
        }

        public virtual string OperatorCode
        {
            get { return operatorCode; }
            set { operatorCode = value; }
        }

        public virtual string OperatorName
        {
            get { return operatorName; }
            set { operatorName = value; }
        }
    }
}