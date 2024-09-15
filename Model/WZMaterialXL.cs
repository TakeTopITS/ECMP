namespace ProjectMgt.Model
{
    public class WZMaterialXL
    {
        public WZMaterialXL()
        {
        }

        public virtual string DLCode { get; set; }
        public virtual string ZLCode { get; set; }
        public virtual string XLCode { get; set; }
        public virtual string XLName { get; set; }
        public virtual string XLDesc { get; set; }
        public virtual int IsMark { get; set; }
        public virtual string CreateProgress { get; set; }
        public virtual string Creater { get; set; }
        public virtual int CreateTitle { get; set; }
    }
}