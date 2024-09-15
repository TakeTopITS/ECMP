using System;

namespace ProjectMgt.Model
{
    public class PublicNotice
    {
        public PublicNotice()
        {
        }

        private int docID;
        private string docType;
        private string docName;
        private string description;
        private string address;
        private string author;
        private string uploadManCode;
        private string uploadManName;
        private DateTime uploadTime;
        private string relatedDepartCode;
        private string relatedDepartName;
        private string status;
        private string scope;

        public virtual int DocID
        {
            get { return docID; }
            set { docID = value; }
        }

        public virtual string DocType
        {
            get { return docType; }
            set { docType = value; }
        }

        public virtual string DocName
        {
            get { return docName; }
            set { docName = value; }
        }

        public virtual string Description
        {
            get { return description; }
            set { description = value; }
        }

        public virtual string Address
        {
            get { return address; }
            set { address = value; }
        }

        public virtual string Author
        {
            get { return author; }
            set { author = value; }
        }

        public virtual string UploadManCode
        {
            get { return uploadManCode; }
            set { uploadManCode = value; }
        }

        public virtual string UploadManName
        {
            get { return uploadManName; }
            set { uploadManName = value; }
        }

        public virtual DateTime UploadTime
        {
            get { return uploadTime; }
            set { uploadTime = value; }
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

        public virtual string Scope
        {
            get; set;
        }
    }
}