namespace ProjectMgt.Model
{
    public class OilType
    {
        public OilType()
        {
        }

        private string oilname;
        private int id;

        public virtual string OilName
        {
            get { return oilname; }
            set { oilname = value; }
        }

        public virtual int ID
        {
            get { return id; }
            set { id = value; }
        }
    }
}