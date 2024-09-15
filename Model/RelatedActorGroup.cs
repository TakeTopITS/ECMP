namespace ProjectMgt.Model
{
    public class RelatedActorGroup
    {
        public RelatedActorGroup()
        {
        }

        private int id;
        private string relatedType;
        private int relatedID;
        private string actorGroupName;

        public virtual int ID
        {
            get { return id; }
            set { id = value; }
        }

        public virtual string RelatedType
        {
            get { return relatedType; }
            set { relatedType = value; }
        }

        public virtual int RelatedID
        {
            get { return relatedID; }
            set { relatedID = value; }
        }

        public virtual string ActorGroupName
        {
            get { return actorGroupName; }
            set { actorGroupName = value; }
        }
    }
}