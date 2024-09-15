namespace ProjectMgt.Model
{
    public class ActorGroupDetail
    {
        public ActorGroupDetail()
        {
        }

        private int groupID;
        private string groupName;
        private string userCode;
        private string userName;
        private string departCode;
        private string departName;
        private string actor;
        private string workDetail;

        public virtual int GroupID
        {
            get { return groupID; }
            set { groupID = value; }
        }

        public virtual string GroupName
        {
            get { return groupName; }
            set { groupName = value; }
        }

        public virtual string UserCode
        {
            get { return userCode; }
            set { userCode = value; }
        }

        public virtual string UserName
        {
            get { return userName; }
            set { userName = value; }
        }

        public virtual string DepartCode
        {
            get { return departCode; }
            set { departCode = value; }
        }

        public virtual string DepartName
        {
            get { return departName; }
            set { departName = value; }
        }

        public virtual string Actor
        {
            get { return actor; }
            set { actor = value; }
        }

        public virtual string WorkDetail
        {
            get { return workDetail; }
            set { workDetail = value; }
        }
    }
}