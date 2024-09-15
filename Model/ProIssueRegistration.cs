using System;

namespace ProjectMgt.Model
{
    /// <summary>
    /// 发文登记表
    /// </summary>
    public class ProIssueRegistration
    {
        public ProIssueRegistration()
        {
        }

        private int id;
        private string documentNo;
        private string fileName;
        private string receivingDepartment;
        private DateTime issuingDate;
        private string filePath;
        private int attachments;
        private string recipients;
        private string recycling;
        private DateTime collectionDate;
        private string docType;

        public virtual string DocType
        {
            get { return docType; }
            set { docType = value; }
        }

        public virtual int ID
        {
            get { return id; }
            set { id = value; }
        }

        public virtual string DocumentNo
        {
            get { return documentNo; }
            set { documentNo = value; }
        }

        public virtual string FileName
        {
            get { return fileName; }
            set { fileName = value; }
        }

        public virtual string ReceivingDepartment
        {
            get { return receivingDepartment; }
            set { receivingDepartment = value; }
        }

        public virtual DateTime IssuingDate
        {
            get { return issuingDate; }
            set { issuingDate = value; }
        }

        public virtual string FilePath
        {
            get { return filePath; }
            set { filePath = value; }
        }

        public virtual int Attachments
        {
            get { return attachments; }
            set { attachments = value; }
        }

        public virtual string Recipients
        {
            get { return recipients; }
            set { recipients = value; }
        }

        public virtual string Recycling
        {
            get { return recycling; }
            set { recycling = value; }
        }

        public virtual DateTime CollectionDate
        {
            get { return collectionDate; }
            set { collectionDate = value; }
        }
    }
}