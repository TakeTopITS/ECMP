using System;

namespace ProjectMgt.Model
{
    public class HeadLine
    {
        public HeadLine()
        {
        }

        private int id;
        private string type;
        private string title;
        private string content;
        private string publisherCode;
        private string publisherName;
        private DateTime publishTime;
        private string relatedDepartCode;
        private string relatedDepartName;
        private string status;
        private string isHead;
        private string langCode;
        private string newsType;

        public virtual int ID
        {
            get { return id; }
            set { id = value; }
        }

        public virtual string Type
        {
            get { return type; }
            set { type = value; }
        }

        public virtual string Title
        {
            get { return title; }
            set { title = value; }
        }

        public virtual string Content
        {
            get { return content; }
            set { content = value; }
        }

        public virtual string ContentDocUrl
        {
            get; set;
        }

        public virtual string PublisherCode
        {
            get { return publisherCode; }
            set { publisherCode = value; }
        }

        public virtual string PublisherName
        {
            get { return publisherName; }
            set { publisherName = value; }
        }

        public virtual DateTime PublishTime
        {
            get { return publishTime; }
            set { publishTime = value; }
        }

        public virtual string RelatedDepartCode
        {
            get { return relatedDepartCode; }
            set { relatedDepartCode = value; }
        }

        public virtual string RelatedDepartName
        {
            get { return relatedDepartName; }
            set { relatedDepartName = value; }
        }

        public virtual string Status
        {
            get { return status; }
            set { status = value; }
        }

        public virtual string IsHead
        {
            get { return isHead; }
            set { isHead = value; }
        }

        public virtual string LangCode
        {
            get { return langCode; }
            set { langCode = value; }
        }

        public virtual string NewsType
        {
            get { return newsType; }
            set { newsType = value; }
        }
    }
}