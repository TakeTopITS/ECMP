using System;

namespace ProjectMgt.Model
{
    public class DocumentForProjectPlanTemplate
    {
        public DocumentForProjectPlanTemplate()
        {
        }

        private int docID;
        private string relatedType;
        private int docTypeID;
        private string docType;
        private int relatedID;
        private string relatedName;
        private string docName;
        private string description;
        private string address;
        private string author;
        private string uploadManCode;
        private string uploadManName;
        private DateTime uploadTime;
        private string departCode;
        private string departName;
        private string visible;
        private string status;

        public virtual int DocID
        {
            get { return docID; }
            set { docID = value; }
        }

        public virtual string RelatedType
        {
            get { return relatedType; }
            set { relatedType = value; }
        }

        public virtual int DocTypeID
        {
            get { return docTypeID; }
            set { docTypeID = value; }
        }

        public virtual string DocType
        {
            get { return docType; }
            set { docType = value; }
        }

        public virtual int RelatedID
        {
            get { return relatedID; }
            set { relatedID = value; }
        }

        public virtual string RelatedName
        {
            get { return relatedName; }
            set { relatedName = value; }
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

        public virtual string DepartCode
        {
            get { return departCode; }
            set { departCode = value; }
        }

        public virtual string DepartName
        {
            get { return departName; }
            set { departName = value; }
        }

        public virtual string Visible
        {
            get { return visible; }
            set { visible = value; }
        }

        public virtual string Status
        {
            get { return status; }
            set { status = value; }
        }
    }
}