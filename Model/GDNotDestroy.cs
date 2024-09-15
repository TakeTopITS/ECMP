namespace ProjectMgt.Model
{
    public class GDNotDestroy
    {
        public GDNotDestroy()
        {
        }

        public virtual int ID { get; set; }
        public virtual string ProjectCode { get; set; }
        public virtual string Isom_no { get; set; }
        public virtual string WeldCode { get; set; }
        public virtual string WeldStatus { get; set; }
        public virtual string Size { get; set; }
        public virtual string Mold { get; set; }
        public virtual string SF { get; set; }
        public virtual string Medium { get; set; }
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
        public virtual string ReturnWelder { get; set; }
        public virtual string ReturnWelderName { get; set; }
        public virtual string ReturnTime { get; set; }
        public virtual string PressurePackNo { get; set; }
        public virtual string FRI1 { get; set; }
        public virtual string FRI2 { get; set; }
        public virtual string FRI3 { get; set; }
        public virtual string FRI4 { get; set; }
        public virtual string PackageTime { get; set; }
        public virtual string Package { get; set; }
        public virtual string OutsideTime { get; set; }
        public virtual string Outside { get; set; }
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
        public virtual string OrificeTime { get; set; }
        public virtual string Orifice { get; set; }
        public virtual string AirPressTime { get; set; }
        public virtual string AirPress { get; set; }
        public virtual string TieInTime { get; set; }
        public virtual string TieIn { get; set; }
        public virtual string RTDetail1 { get; set; }
        public virtual string RTDetail2 { get; set; }
        public virtual int IsMark { get; set; }
        public virtual string UserCode { get; set; }
    }
}