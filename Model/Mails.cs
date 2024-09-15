using System;

namespace ProjectMgt.Model
{
    public class Mails
    {
        public Mails()
        {
        }

        private int mailID;
        private string title;
        private string body;
        private string fromAddress;
        private string toAddress;
        private string ccAddress;
        private int htmlFormat;
        private DateTime senderDate;
        private int contain;
        private int attachmentFlag;
        private int readerFlag;
        private int folderID;
        private string userCode;

        public virtual int MailID
        {
            get { return mailID; }
            set { mailID = value; }
        }

        public virtual string Title
        {
            get { return title; }
            set { title = value; }
        }

        public virtual string Body
        {
            get { return body; }
            set { body = value; }
        }

        public virtual string FromAddress
        {
            get { return fromAddress; }
            set { fromAddress = value; }
        }

        public virtual string ToAddress
        {
            get { return toAddress; }
            set { toAddress = value; }
        }

        public virtual string CCAddress
        {
            get { return ccAddress; }
            set { ccAddress = value; }
        }

        public virtual int HTMLFormat
        {
            get { return htmlFormat; }
            set { htmlFormat = value; }
        }

        public virtual DateTime SenderDate
        {
            get { return senderDate; }
            set { senderDate = value; }
        }

        public virtual int Contain
        {
            get { return contain; }
            set { contain = value; }
        }

        public virtual int AttachmentFlag
        {
            get { return attachmentFlag; }
            set { attachmentFlag = value; }
        }

        public virtual int ReaderFlag
        {
            get { return readerFlag; }
            set { readerFlag = value; }
        }

        public virtual int FolderID
        {
            get { return folderID; }
            set { folderID = value; }
        }

        public virtual string UserCode
        {
            get { return userCode; }
            set { userCode = value; }
        }
    }
}