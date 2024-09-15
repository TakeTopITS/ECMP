using System;

namespace ProjectMgt.Model
{
    public class Meeting
    {
        public Meeting()
        {
        }

        private int id;
        private string name;
        private string type;
        private string relatedType;
        private int relatedID;
        private string host;
        private string content;
        private string address;
        private DateTime beginTime;
        private DateTime endTime;
        private string builderCode;
        private string organizer;
        private string organizerNote;
        private string recorder;
        private string record;
        private DateTime makeTime;
        private string status;

        public virtual int ID
        {
            get { return id; }
            set { id = value; }
        }

        public virtual string Name
        {
            get { return name; }
            set { name = value; }
        }

        public virtual string Type
        {
            get { return type; }
            set { type = value; }
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

        public virtual string Host
        {
            get { return host; }
            set { host = value; }
        }

        public virtual string Address
        {
            get { return address; }
            set { address = value; }
        }

        public virtual DateTime BeginTime
        {
            get { return beginTime; }
            set { beginTime = value; }
        }

        public virtual DateTime EndTime
        {
            get { return endTime; }
            set { endTime = value; }
        }

        public virtual string BuilderCode
        {
            get { return builderCode; }
            set { builderCode = value; }
        }

        public virtual string Content
        {
            get { return content; }
            set { content = value; }
        }

        public virtual string Organizer
        {
            get { return organizer; }
            set { organizer = value; }
        }

        public virtual string OrganizerNote
        {
            get { return organizerNote; }
            set { organizerNote = value; }
        }

        public virtual string Recorder
        {
            get { return recorder; }
            set { recorder = value; }
        }

        public virtual string Record
        {
            get { return record; }
            set { record = value; }
        }

        public virtual DateTime MakeTime
        {
            get { return makeTime; }
            set { makeTime = value; }
        }

        public virtual string Status
        {
            get { return status; }
            set { status = value; }
        }
    }
}