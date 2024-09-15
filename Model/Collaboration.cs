using System;

namespace ProjectMgt.Model
{
    public class Collaboration
    {
        public Collaboration()
        {
        }

        private int coID;
        private string collaborationName;
        private string creatorCode;
        private string creatorName;
        private DateTime createTime;
        private string comment;
        private string relatedType;
        private int relatedID;
        private string status;
        private string identifyString;
        private string relatedCode;

        public virtual int CoID
        {
            get { return coID; }
            set { coID = value; }
        }

        public virtual string CollaborationName
        {
            get { return collaborationName; }
            set { collaborationName = value; }
        }

        public virtual string CreatorCode
        {
            get { return creatorCode; }
            set { creatorCode = value; }
        }

        public virtual string CreatorName
        {
            get { return creatorName; }
            set { creatorName = value; }
        }

        public virtual DateTime CreateTime
        {
            get { return createTime; }
            set { createTime = value; }
        }

        public virtual string Comment
        {
            get { return comment; }
            set { comment = value; }
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

        public virtual string Status
        {
            get { return status; }
            set { status = value; }
        }

        public virtual string IdentifyString
        {
            get { return identifyString; }
            set { identifyString = value; }
        }

        public virtual string RelatedCode
        {
            get { return relatedCode; }
            set { relatedCode = value; }
        }
    }
}