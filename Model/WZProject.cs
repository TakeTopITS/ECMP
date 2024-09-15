using System;

namespace ProjectMgt.Model
{
    public class WZProject
    {
        public WZProject()
        {
        }

        public virtual string ProjectCode { get; set; }
        public virtual string ProjectName { get; set; }
        public virtual string ProjectManager { get; set; }
        public virtual DateTime StartTime { get; set; }
        public virtual DateTime EndTime { get; set; }
        public virtual string PowerPurchase { get; set; }
        //public virtual string PickingUnit { get; set; }
        //public virtual string UnitCode { get; set; }

        //public virtual string FeeManage { get; set; }
        public virtual decimal ForCost { get; set; }

        public virtual decimal SelfCost { get; set; }
        public virtual string BuildUnit { get; set; }
        public virtual string SupervisorUnit { get; set; }
        public virtual string ProjectDesc { get; set; }
        public virtual DateTime MarkTime { get; set; }
        public virtual string Marker { get; set; }
        public virtual string StoreRoom { get; set; }

        public virtual string DelegateAgent { get; set; }

        public virtual string PurchaseManager { get; set; }
        public virtual string PurchaseEngineer { get; set; }
        public virtual string Contracter { get; set; }
        public virtual string Checker { get; set; }
        public virtual string Safekeep { get; set; }
        public virtual string SupplementEditor { get; set; }
        public virtual decimal TheBudget { get; set; }
        public virtual decimal ContractMoney { get; set; }
        public virtual decimal AcceptMoney { get; set; }
        public virtual decimal ProjectTax { get; set; }
        public virtual decimal TheFreight { get; set; }
        public virtual decimal SendMoney { get; set; }
        public virtual decimal FinishingRate { get; set; }
        public virtual string Progress { get; set; }
        public virtual int IsMark { get; set; }

        public virtual string RelatedCode { get; set; }

        public virtual string IsStatus { get; set; }
        public virtual string Leader { get; set; }
        public virtual string FeeManage { get; set; }

        public virtual string UnitType { get; set; }

        public virtual decimal ShenJianLu { get; set; }
        public virtual decimal ShenJianE { get; set; }
        public virtual decimal TaxRate { get; set; }
        public virtual decimal TaxAmount { get; set; }
        public virtual decimal BaoGuanZongE { get; set; }

        public virtual string ProjectAttribute { get; set; }
        public virtual string ProjectNature { get; set; }

        public virtual int RelatedProjectID { get; set; }
    }
}