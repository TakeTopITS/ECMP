using System;

namespace ProjectMgt.Model
{
    public class BookBorrowRecord
    {
        public BookBorrowRecord()
        {
        }

        private int id;
        private int bookinfoid;
        private string barcode;
        private string bookname;
        private string referenceno;
        private int bookclassificationid;
        private string bookclassificationname;
        private int bookpublishersid;
        private string bookpublishersname;
        private int bookusenum;
        private string version;
        private string status;
        private string borrowcode;
        private string borrowname;
        private DateTime borrowDate;
        private DateTime backDate;
        private int readertypeid;
        private string readertypename;
        private int certificateid;
        private string certificatename;
        private string certificateno;
        private string remark;
        private DateTime realbackdate;
        private decimal bookrent;

        public virtual DateTime RealBackDate
        {
            get { return realbackdate; }
            set { realbackdate = value; }
        }

        public virtual DateTime BackDate
        {
            get { return backDate; }
            set { backDate = value; }
        }

        public virtual DateTime BorrowDate
        {
            get { return borrowDate; }
            set { borrowDate = value; }
        }

        public virtual decimal BookRent
        {
            get { return bookrent; }
            set { bookrent = value; }
        }

        public virtual int ReaderTypeId
        {
            get { return readertypeid; }
            set { readertypeid = value; }
        }

        public virtual int BookUseNum
        {
            get { return bookusenum; }
            set { bookusenum = value; }
        }

        public virtual int CertificateId
        {
            get { return certificateid; }
            set { certificateid = value; }
        }

        public virtual int BookClassificationId
        {
            get { return bookclassificationid; }
            set { bookclassificationid = value; }
        }

        public virtual int BookPublishersId
        {
            get { return bookpublishersid; }
            set { bookpublishersid = value; }
        }

        public virtual int BookInfoId
        {
            get { return bookinfoid; }
            set { bookinfoid = value; }
        }

        public virtual string BarCode
        {
            get { return barcode; }
            set { barcode = value; }
        }

        public virtual string BookName
        {
            get { return bookname; }
            set { bookname = value; }
        }

        public virtual string ReferenceNo
        {
            get { return referenceno; }
            set { referenceno = value; }
        }

        public virtual string BookClassificationName
        {
            get { return bookclassificationname; }
            set { bookclassificationname = value; }
        }

        public virtual string ReaderTypeName
        {
            get { return readertypename; }
            set { readertypename = value; }
        }

        public virtual string BookPublishersName
        {
            get { return bookpublishersname; }
            set { bookpublishersname = value; }
        }

        public virtual string CertificateName
        {
            get { return certificatename; }
            set { certificatename = value; }
        }

        public virtual string CertificateNo
        {
            get { return certificateno; }
            set { certificateno = value; }
        }

        public virtual string Version
        {
            get { return version; }
            set { version = value; }
        }

        public virtual string Status
        {
            get { return status; }
            set { status = value; }
        }

        public virtual string Remark
        {
            get { return remark; }
            set { remark = value; }
        }

        public virtual string BorrowCode
        {
            get { return borrowcode; }
            set { borrowcode = value; }
        }

        public virtual string BorrowName
        {
            get { return borrowname; }
            set { borrowname = value; }
        }

        public virtual int ID
        {
            get { return id; }
            set { id = value; }
        }
    }
}