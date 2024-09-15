namespace ProjectMgt.Model
{
    public class WFTStepRelatedTem
    {
        public WFTStepRelatedTem()
        {
        }

        private int id;
        private string relatedWFTemName;
        private int relatedStepID;
        private string requisite;
        private int belongStepSortNumber;
        private string belongIsMustPassed;

        public virtual int ID
        {
            get { return id; }
            set { id = value; }
        }

        public virtual string RelatedWFTemName
        {
            get { return relatedWFTemName; }
            set { relatedWFTemName = value; }
        }

        public virtual int RelatedStepID
        {
            get { return relatedStepID; }
            set { relatedStepID = value; }
        }

        public virtual string Requisite
        {
            get { return requisite; }
            set { requisite = value; }
        }

        public virtual int BelongStepSortNumber
        {
            get { return belongStepSortNumber; }
            set { belongStepSortNumber = value; }
        }

        public virtual string BelongIsMustPassed
        {
            get { return belongIsMustPassed; }
            set { belongIsMustPassed = value; }
        }
    }
}