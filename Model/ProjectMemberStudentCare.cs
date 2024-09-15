using System;

namespace ProjectMgt.Model
{
    public class ProjectMemberStudentCare
    {
        public ProjectMemberStudentCare()
        {
        }

        public virtual int ID { get; set; }
        public virtual string StudentCode { get; set; }
        public virtual string StudentName { get; set; }
        public virtual DateTime CheckTime { get; set; }
        public virtual string CheckContent { get; set; }
        public virtual string ActualAge { get; set; }
        public virtual string WeightKG { get; set; }
        public virtual string WeightEvaluation { get; set; }
        public virtual string HeightCM { get; set; }
        public virtual string HeightEvaluation { get; set; }
        public virtual string Eyesight { get; set; }
        public virtual string Ear { get; set; }
        public virtual string Nose { get; set; }
        public virtual string PharynxFlat { get; set; }
        public virtual string Heart { get; set; }
        public virtual string Lung { get; set; }
        public virtual string LiverSpleen { get; set; }
        public virtual string Genitals { get; set; }
        public virtual string HearingScreening { get; set; }
        public virtual string RefractiveScreening { get; set; }
        public virtual string Hemoglobin { get; set; }
        public virtual string TurnEnzyme { get; set; }
        public virtual string HepatitisAntigen { get; set; }
        public virtual string OtherRemark { get; set; }
        public virtual string PhysicianGuidance { get; set; }
        public virtual string PhysicianSignature { get; set; }
    }
}