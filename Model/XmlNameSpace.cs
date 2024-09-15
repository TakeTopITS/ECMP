namespace ProjectMgt.Model
{
    public class XmlNameSpace
    {
        public XmlNameSpace()
        {
        }

        private int id;
        private string wlTemName;
        private string xmlNameSpaceName;
        private string xmlNameSpaceValue;

        public virtual int ID
        {
            get { return id; }
            set { id = value; }
        }

        public virtual string WLTemName
        {
            get { return wlTemName; }
            set { wlTemName = value; }
        }

        public virtual string XmlNameSpaceName
        {
            get { return xmlNameSpaceName; }
            set { xmlNameSpaceName = value; }
        }

        public virtual string XmlNameSpaceValue
        {
            get { return xmlNameSpaceValue; }
            set { xmlNameSpaceValue = value; }
        }
    }
}