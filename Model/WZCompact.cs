using System;

namespace ProjectMgt.Model
{
    public class WZCompact
    {
        public WZCompact()
        {
        }

        public virtual string CompactCode { get; set; }
        public virtual string ProjectCode { get; set; }
        public virtual string NeedCode { get; set; }
        public virtual string SupplierCode { get; set; }
        public virtual string CompactName { get; set; }
        public virtual string CompactText { get; set; }
        public virtual string CompactTextURL { get; set; }
        public virtual int RowNumber { get; set; }
        public virtual decimal CompactMoney { get; set; }
        public virtual decimal CollectMoney { get; set; }
        public virtual decimal RequestMoney { get; set; }
        public virtual decimal NotRequestMoney { get; set; }
        public virtual DateTime MarkTime { get; set; }
        public virtual string SingTime { get; set; }
        public virtual string PurchaseEngineer { get; set; }
        public virtual string ControlMoney { get; set; }
        public virtual string VerifyTime { get; set; }
        public virtual string JuridicalPerson { get; set; }
        public virtual string ApproveTime { get; set; }
        public virtual string DelegateAgent { get; set; }
        public virtual string EffectTime { get; set; }
        public virtual string Compacter { get; set; }
        public virtual string ReceiveTime { get; set; }
        public virtual string StoreRoom { get; set; }
        public virtual string Safekeep { get; set; }
        public virtual string Checker { get; set; }
        public virtual int CheckIsMark { get; set; }
        public virtual string CancelTime { get; set; }
        public virtual decimal BeforePayMoney { get; set; }
        public virtual decimal BeforePayBalance { get; set; }
        public virtual int PayIsMark { get; set; }
        public virtual string Progress { get; set; }
        public virtual int IsMark { get; set; }
        public virtual string RelatedConstractCode { get; set; }
    }
}