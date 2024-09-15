using System;

namespace ProjectMgt.Model
{
    public class ItemMainPlanDetail
    {
        public ItemMainPlanDetail()
        {
        }

        public virtual int ID
        {
            get;
            set;
        }

        public virtual int PlanVerID
        {
            get;
            set;
        }

        public virtual string ItemCode
        {
            get;
            set;
        }

        public virtual string ItemName
        {
            get;
            set;
        }

        public virtual string Type
        {
            get;
            set;
        }

        public virtual string ModelNumber
        {
            get;
            set;
        }

        public virtual string Specification
        {
            get;
            set;
        }

        public virtual int BomVerID
        {
            get;
            set;
        }

        public virtual decimal PlanNumber
        {
            get;
            set;
        }

        public virtual decimal FinishedNumber
        {
            get;
            set;
        }

        public virtual decimal UNFinishedNumber
        {
            get;
            set;
        }

        public virtual string Unit
        {
            get;
            set;
        }

        public virtual DateTime PlanStartDate
        {
            get;
            set;
        }

        public virtual DateTime DeliveryDate
        {
            get;
            set;
        }

        public virtual DateTime CreateDate
        {
            get;
            set;
        }

        public virtual DateTime ModifyDate
        {
            get;
            set;
        }

        public virtual string SourceType
        {
            get;
            set;
        }

        public virtual int SourceRecordID
        {
            get;
            set;
        }

        public virtual string Brand
        {
            set; get;
        }
    }
}