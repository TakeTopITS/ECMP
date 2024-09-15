using System;

namespace ProjectMgt.Model
{
    public class WZExpert
    {
        public WZExpert()
        {
        }

        public virtual int ID { get; set; }
        public virtual string ExpertCode { get; set; }
        public virtual string Name { get; set; }
        public virtual string WorkUnit { get; set; }
        public virtual string Job { get; set; }
        public virtual string JobTitle { get; set; }
        public virtual string Phone { get; set; }
        public virtual string ExpertType { get; set; }
        public virtual string ExpertType2 { get; set; }
        public virtual int WorkingPoint { get; set; }
        public virtual DateTime CreateTime { get; set; }
        public virtual string CreateCode { get; set; }
        public virtual string Type { get; set; }
        public virtual string EngagedCategory { get; set; }
        public virtual string LaborExpertise { get; set; }
        public virtual string ProcurementCategory { get; set; }
        public virtual string NotLaborExpertise { get; set; }
        public virtual string ActionOutstanding { get; set; }
        public virtual string GoodPerformance { get; set; }
        public virtual string SuccessfulCasePro { get; set; }
        public virtual string LiteratureWorks { get; set; }
        public virtual string PatentInvention { get; set; }
        public virtual string ScientificAchieve { get; set; }
        public virtual string ManagementInnovation { get; set; }
        public virtual string BadTrackRecord { get; set; }
    }
}