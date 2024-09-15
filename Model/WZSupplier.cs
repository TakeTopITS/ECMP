using System;

namespace ProjectMgt.Model
{
    public class WZSupplier
    {
        public WZSupplier()
        {
        }

        public virtual int ID { get; set; }
        public virtual string SupplierCode { get; set; }
        public virtual string SupplierNumber { get; set; }
        public virtual string SupplierName { get; set; }
        public virtual string OpeningBank { get; set; }
        public virtual string AccountNumber { get; set; }
        public virtual string RateNumber { get; set; }
        public virtual string UnitAddress { get; set; }
        public virtual string ZipCode { get; set; }
        public virtual string UnitPhone { get; set; }
        public virtual string PersonDelegate { get; set; }
        public virtual string DelegateAgent { get; set; }
        public virtual string ContactPhone { get; set; }
        public virtual string Mobile { get; set; }
        public virtual string QQ { get; set; }
        public virtual string Email { get; set; }
        public virtual string MainSupplier { get; set; }
        public virtual string InDocumentURL { get; set; }
        public virtual string InDocument { get; set; }
        public virtual DateTime InTime { get; set; }
        public virtual string PushUnit { get; set; }
        public virtual string Grade { get; set; }
        public virtual string Auditor { get; set; }
        public virtual string ApproveTime { get; set; }
        public virtual string ReviewDate { get; set; }
        public virtual string ReviewDocument { get; set; }
        public virtual string ReviewDocumentURL { get; set; }
        public virtual string ReviewResult { get; set; }
        public virtual string QualityEngineer { get; set; }
        public virtual string Progress { get; set; }
        public virtual int IsMark { get; set; }
        public virtual string PushPerson { get; set; }

        public virtual string ApprovalDocument { get; set; }//			--审批文件名称
        public virtual string ApprovalDocumentURL { get; set; }//				--审批文件URL
        public virtual string CompetentMaterials { get; set; }//				--物资主管

        public virtual string CompetentMaterialsDocument { get; set; }
        public virtual string CompetentMaterialsDocumentURL { get; set; }

        public virtual string ContractWhose { get; set; }//				--合同监审

        public virtual string ContractWhoseDocument { get; set; }
        public virtual string ContractWhoseDocumentURL { get; set; }

        public virtual string CompetentLeadership { get; set; }//				--主管领导

        public virtual string CompetentLeadershipDocument { get; set; }
        public virtual string CompetentLeadershipDocumentURL { get; set; }
    }
}