namespace ProjectMgt.Model
{
    public class WZMaterialZL
    {
        public WZMaterialZL()
        {
        }

        public virtual string DLCode { get; set; }
        public virtual string ZLCode { get; set; }
        public virtual string ZLName { get; set; }
        public virtual string ZLDesc { get; set; }
        public virtual int IsMark { get; set; }
        public virtual string CreateProgress { get; set; }
        public virtual string Creater { get; set; }
        public virtual int CreateTitle { get; set; }
    }
}