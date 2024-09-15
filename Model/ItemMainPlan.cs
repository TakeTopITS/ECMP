using System;

namespace ProjectMgt.Model
{
    public class ItemMainPlan
    {
        public ItemMainPlan()
        {
        }

        public virtual int PlanVerID
        {
            get;
            set;
        }

        public virtual string PlanType
        {
            get;
            set;
        }

        public virtual string PlanVerName
        {
            get;
            set;
        }

        public virtual string BelongDepartCode
        {
            get;
            set;
        }

        public virtual string BelongDepartName
        {
            get;
            set;
        }

        public virtual string Status
        {
            get;
            set;
        }

        public virtual DateTime CreateTime
        {
            get;
            set;
        }

        public virtual string CreatorCode
        {
            get;
            set;
        }

        public virtual string CreatorName
        {
            get;
            set;
        }
    }
}