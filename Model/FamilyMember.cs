namespace ProjectMgt.Model
{
    public class FamilyMember
    {
        public FamilyMember()
        {
        }

        private int id;
        private string userCode;
        private string memberName;
        private string relation;
        private string workAddress;
        private string duty;
        private string postCode;
        private string comment;

        public virtual int ID
        {
            get { return id; }
            set { id = value; }
        }

        public virtual string UserCode
        {
            get { return userCode; }
            set { userCode = value; }
        }

        public virtual string MemberName
        {
            get { return memberName; }
            set { memberName = value; }
        }

        public virtual string Relation
        {
            get { return relation; }
            set { relation = value; }
        }

        public virtual string WorkAddress
        {
            get { return workAddress; }
            set { workAddress = value; }
        }

        public virtual string Duty
        {
            get { return duty; }
            set { duty = value; }
        }

        public virtual string PostCode
        {
            get { return postCode; }
            set { postCode = value; }
        }

        public virtual string Comment
        {
            get { return comment; }
            set { comment = value; }
        }
    }
}