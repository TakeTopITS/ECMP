using System;

namespace ProjectMgt.Model
{
    public class BookInformation
    {
        public BookInformation()
        {
        }

        private int id;
        private string barcode;
        private string bookname;
        private string referenceno;
        private int bookclassificationid;
        private string bookclassificationname;
        private string location;
        private int bookpublishersid;
        private string bookpublishersname;
        private string author;
        private string translator;
        private int booknum;
        private int bookusenum;
        private decimal price;
        private DateTime publicationDate;
        private int pagenum;
        private string version;
        private int usenum;
        private string status;
        private string source;
        private string donors;
        private string introduction;
        private string bookimage;
        private string createcode;
        private string createname;
        private DateTime createtime;
        private string departcode;
        private string departname;
        private string classificationCode;
        private string bookType;

        public virtual string ClassificationCode
        {
            get { return classificationCode; }
            set { classificationCode = value; }
        }

        public virtual string BookType
        {
            get { return bookType; }
            set { bookType = value; }
        }

        public virtual DateTime CreateTime
        {
            get { return createtime; }
            set { createtime = value; }
        }

        public virtual DateTime PublicationDate
        {
            get { return publicationDate; }
            set { publicationDate = value; }
        }

        public virtual decimal Price
        {
            get { return price; }
            set { price = value; }
        }

        public virtual int BookNum
        {
            get { return booknum; }
            set { booknum = value; }
        }

        public virtual int BookUseNum
        {
            get { return bookusenum; }
            set { bookusenum = value; }
        }

        public virtual int PageNum
        {
            get { return pagenum; }
            set { pagenum = value; }
        }

        public virtual int UseNum
        {
            get { return usenum; }
            set { usenum = value; }
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

        public virtual string Location
        {
            get { return location; }
            set { location = value; }
        }

        public virtual string BookPublishersName
        {
            get { return bookpublishersname; }
            set { bookpublishersname = value; }
        }

        public virtual string Author
        {
            get { return author; }
            set { author = value; }
        }

        public virtual string Translator
        {
            get { return translator; }
            set { translator = value; }
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

        public virtual string Source
        {
            get { return source; }
            set { source = value; }
        }

        public virtual string Donors
        {
            get { return donors; }
            set { donors = value; }
        }

        public virtual string Introduction
        {
            get { return introduction; }
            set { introduction = value; }
        }

        public virtual string BookImage
        {
            get { return bookimage; }
            set { bookimage = value; }
        }

        public virtual string CreateCode
        {
            get { return createcode; }
            set { createcode = value; }
        }

        public virtual string CreateName
        {
            get { return createname; }
            set { createname = value; }
        }

        public virtual string DepartCode
        {
            get { return departcode; }
            set { departcode = value; }
        }

        public virtual string DepartName
        {
            get { return departname; }
            set { departname = value; }
        }

        public virtual int ID
        {
            get { return id; }
            set { id = value; }
        }
    }
}