namespace ProjectMgt.Model
{
    public class RelatedReq
    {
        public RelatedReq()
        {
        }

        private int id;
        private int projectID;
        private int reqID;

        public virtual int ID
        {
            get { return id; }
            set { id = value; }
        }

        public virtual int ProjectID
        {
            get { return projectID; }
            set { projectID = value; }
        }

        public virtual int ReqID
        {
            get { return reqID; }
            set { reqID = value; }
        }
    }
}