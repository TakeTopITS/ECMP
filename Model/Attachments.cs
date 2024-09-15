namespace ProjectMgt.Model
{
    public class Attachments
    {
        public Attachments()
        {
        }

        private int attachmentID;
        private string name;
        private string url;
        private string type;
        private int contain;
        private int mailID;
        private string identifyString;

        public virtual int AttachmentID
        {
            get { return attachmentID; }
            set { attachmentID = value; }
        }

        public virtual string Name
        {
            get { return name; }
            set { name = value; }
        }

        public virtual string Url
        {
            get { return url; }
            set { url = value; }
        }

        public virtual string Type
        {
            get { return type; }
            set { type = value; }
        }

        public virtual int Contain
        {
            get { return contain; }
            set { contain = value; }
        }

        public virtual int MailID
        {
            get { return mailID; }
            set { mailID = value; }
        }

        public virtual string IdentifyString
        {
            get { return identifyString; }
            set { identifyString = value; }
        }
    }
}