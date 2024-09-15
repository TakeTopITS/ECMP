using System;

namespace ProjectMgt.Model
{
    public class StatusRelatedWF
    {
        public StatusRelatedWF()
        {
        }

        private int id;
        private string relatedType;
        private int relatedID;
        private string status;
        private int wlID;
        private DateTime createTime;

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

        public virtual string Status
        {
            get { return status; }
            set { status = value; }
        }

        public virtual int WLID
        {
            get { return wlID; }
            set { wlID = value; }
        }

        public virtual DateTime CreateTime
        {
            get { return createTime; }
            set { createTime = value; }
        }
    }
}