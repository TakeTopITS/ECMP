using System;

namespace ProjectMgt.Model
{
    public class WorkFlowStepDetail
    {
        public WorkFlowStepDetail()
        {
        }

        private int id;
        private int stepID;
        private int wlID;
        private string operatorCode;
        private string operatorName;
        private string operation;
        private string operatorCommand;
        private DateTime checkingTime;
        private string status;
        private string workDetail;
        private string actor;
        private int finishedTime;
        private string requisite;
        private string fieldList;
        private string allowFullEdit;
        private string editFieldList;
        private string canNotNullFieldList;

        private string signPictureField;
        private string isOperator;

        private decimal manHour;
        private decimal expense;

        public virtual int ID
        {
            get { return id; }
            set { id = value; }
        }

        public virtual int StepID
        {
            get { return stepID; }
            set { stepID = value; }
        }

        public virtual int WLID
        {
            get { return wlID; }
            set { wlID = value; }
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

        public virtual string Operation
        {
            get { return operation; }
            set { operation = value; }
        }

        public virtual string OperatorCommand
        {
            get { return operatorCommand; }
            set { operatorCommand = value; }
        }

        public virtual DateTime CheckingTime
        {
            get { return checkingTime; }
            set { checkingTime = value; }
        }

        public virtual string Status
        {
            get { return status; }
            set { status = value; }
        }

        public virtual string WorkDetail
        {
            get { return workDetail; }
            set { workDetail = value; }
        }

        public virtual string Actor
        {
            get { return actor; }
            set { actor = value; }
        }

        public virtual int FinishedTime
        {
            get { return finishedTime; }
            set { finishedTime = value; }
        }

        public virtual string Requisite
        {
            get { return requisite; }
            set { requisite = value; }
        }

        public virtual string FieldList
        {
            get { return fieldList; }
            set { fieldList = value; }
        }

        public virtual string AllowFullEdit
        {
            get { return allowFullEdit; }
            set { allowFullEdit = value; }
        }

        public virtual string EditFieldList
        {
            get { return editFieldList; }
            set { editFieldList = value; }
        }

        public virtual string CanNotNullFieldList
        {
            get { return canNotNullFieldList; }
            set { canNotNullFieldList = value; }
        }

        public virtual string SignPictureField
        {
            get { return signPictureField; }
            set { signPictureField = value; }
        }

        public virtual string IsOperator
        {
            get { return isOperator; }
            set { isOperator = value; }
        }

        public virtual decimal ManHour
        {
            get { return manHour; }
            set { manHour = value; }
        }

        public virtual decimal Expense
        {
            get { return expense; }
            set { expense = value; }
        }
    }
}