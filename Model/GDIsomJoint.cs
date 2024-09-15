namespace ProjectMgt.Model
{
    public class GDIsomJoint
    {
        public GDIsomJoint()
        {
        }

        public virtual int ID { get; set; }
        public virtual string JointNo { get; set; }
        public virtual string Rev { get; set; }
        public virtual string Size { get; set; }
        public virtual string Mold { get; set; }
        public virtual string SF { get; set; }
        public virtual string MediumCode { get; set; }
        public virtual string Pipefittings { get; set; }
        public virtual string InstallationTime { get; set; }
        public virtual string RanderWelder1 { get; set; }
        public virtual string RanderWelderName1 { get; set; }
        public virtual string RanderWelder2 { get; set; }
        public virtual string RanderWelderName2 { get; set; }
        public virtual string RanderTime { get; set; }
        public virtual string CoveringWelder1 { get; set; }
        public virtual string CoveringWelderName1 { get; set; }
        public virtual string CoveringWelder2 { get; set; }
        public virtual string CoveringWelderName2 { get; set; }
        public virtual string CoveringTime { get; set; }
        public virtual string WPSNo { get; set; }
        public virtual string PressurePackNo { get; set; }
        public virtual string FRI1 { get; set; }
        public virtual string FRI2 { get; set; }
        public virtual string FRI3 { get; set; }
        public virtual string FRI4 { get; set; }
        public virtual string FitUpTime { get; set; }
        public virtual string FitUp { get; set; }
        public virtual string VisualTime { get; set; }
        public virtual string Visual { get; set; }
        public virtual string RTTime { get; set; }
        public virtual string RT { get; set; }
        public virtual string PTTime { get; set; }
        public virtual string PT { get; set; }
        public virtual string PWHTTime { get; set; }
        public virtual string PWHT { get; set; }
        public virtual string PMITime { get; set; }
        public virtual string PMI { get; set; }
        public virtual string MTTime { get; set; }
        public virtual string MT { get; set; }
        public virtual string HistorySheet { get; set; }
        public virtual string PressTest { get; set; }
        public virtual string RTLotDetailsRT1 { get; set; }
        public virtual string RTLotDetailsRT2 { get; set; }
        public virtual string RTLotDetailsRT3 { get; set; }
        public virtual string RTLotDetailsRT4 { get; set; }
        public virtual string Isom_no { get; set; }
        public virtual int IsMark { get; set; }
        public virtual string UserCode { get; set; }
    }
}