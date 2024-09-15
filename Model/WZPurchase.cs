using System;

namespace ProjectMgt.Model
{
    public class WZPurchase
    {
        public WZPurchase()
        {
        }

        public virtual string PurchaseCode { get; set; }
        public virtual string PurchaseName { get; set; }
        public virtual string ProjectCode { get; set; }
        public virtual DateTime MarkTime { get; set; }

        public virtual string PurchaseEngineer { get; set; }
        public virtual string PurchaseManager { get; set; }

        public virtual string Decision { get; set; }

        public virtual string TenderCompetent { get; set; }

        public virtual string UpLeader { get; set; }

        public virtual string PurchaseMethod { get; set; }

        public virtual string PurchaseDocument { get; set; }
        public virtual string PurchaseDocumentURL { get; set; }

        public virtual string AssessmentDocument { get; set; }
        public virtual string AssessmentDocumentURL { get; set; }

        public virtual int RowNumber { get; set; }
        public virtual decimal PlanMoney { get; set; }
        public virtual decimal TotalMoney { get; set; }

        public virtual string DisciplinarySupervision { get; set; }
        public virtual string ControlMoney { get; set; }

        public virtual string PurchaseStartTime { get; set; }
        public virtual string PurchaseEndTime { get; set; }

        public virtual string DecisionTime { get; set; }

        public virtual string Progress { get; set; }
        public virtual int IsMark { get; set; }

        public virtual string SupplierCode1 { get; set; }
        public virtual string SupplierCode2 { get; set; }
        public virtual string SupplierCode3 { get; set; }
        public virtual string SupplierCode4 { get; set; }
        public virtual string SupplierCode5 { get; set; }
        public virtual string SupplierCode6 { get; set; }
        public virtual string ExpertCode1 { get; set; }
        public virtual string ExpertCode2 { get; set; }
        public virtual string ExpertCode3 { get; set; }
        public virtual string ExpertCode4 { get; set; }
        public virtual string ExpertCode5 { get; set; }
        public virtual string ExpertCode6 { get; set; }
        public virtual string TenderDocument1 { get; set; }
        public virtual string TenderDocumentURL1 { get; set; }
        public virtual string TenderDocument2 { get; set; }
        public virtual string TenderDocumentURL2 { get; set; }
        public virtual string TenderDocument3 { get; set; }
        public virtual string TenderDocumentURL3 { get; set; }
        public virtual string TenderDocument4 { get; set; }
        public virtual string TenderDocumentURL4 { get; set; }
        public virtual string TenderDocument5 { get; set; }
        public virtual string TenderDocumentURL5 { get; set; }
        public virtual string TenderDocument6 { get; set; }
        public virtual string TenderDocumentURL6 { get; set; }
    }
}