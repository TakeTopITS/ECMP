namespace ProjectMgt.Model
{
    public class WFStepRelatedWF
    {
        public WFStepRelatedWF()
        {
        }

        private int id;
        private int wfID;
        private int wfStepID;
        private int wfChildID;

        public virtual int ID
        {
            get { return id; }
            set { id = value; }
        }

        public virtual int WFID
        {
            get { return wfID; }
            set { wfID = value; }
        }

        public virtual int WFStepID
        {
            get { return wfStepID; }
            set { wfStepID = value; }
        }

        public virtual int WFChildID
        {
            get { return wfChildID; }
            set { wfChildID = value; }
        }
    }
}