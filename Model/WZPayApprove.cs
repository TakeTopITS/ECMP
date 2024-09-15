using System;

namespace ProjectMgt.Model
{
    public class WZPayApprove
    {
        public WZPayApprove()
        {
        }

        public virtual int ID { get; set; }
        public virtual string AdvanceCode { get; set; }
        public virtual string PayID { get; set; }
        public virtual string PayName { get; set; }
        public virtual string ProjectCode { get; set; }
        public virtual string ProjectName { get; set; }
        public virtual decimal PlanMoney { get; set; }
        public virtual string Marker { get; set; }
        public virtual string Progress { get; set; }
        public virtual decimal ConfirmMoney { get; set; }
        public virtual DateTime PayTime { get; set; }
        public virtual string Approver { get; set; }
    }
}