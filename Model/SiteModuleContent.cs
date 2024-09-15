using System;

namespace ProjectMgt.Model
{
    public class SiteModuleContent
    {
        public SiteModuleContent()
        {
        }

        private int id;
        private string title;
        private string moduleName;
        private string content;
        private string publisherCode;
        private string publisherName;
        private DateTime publishTime;
        private string langCode;

        public virtual int ID
        {
            get { return id; }
            set { id = value; }
        }

        public virtual string Title
        {
            get { return title; }
            set { title = value; }
        }

        public virtual string ModuleName
        {
            get { return moduleName; }
            set { moduleName = value; }
        }

        public virtual string Content
        {
            get { return content; }
            set { content = value; }
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

        public virtual string LangCode
        {
            get { return langCode; }
            set { langCode = value; }
        }
    }
}