using System;

namespace ProjectMgt.Model
{
    public class Folders
    {
        public Folders()
        {
        }

        private int folderID;
        private string name;
        private int total;
        private int noReader;
        private int contain;
        private DateTime createDate;
        private int flag;
        private string ownerCode;
        private string keyWord;

        public virtual int FolderID
        {
            get { return folderID; }
            set { folderID = value; }
        }

        public virtual string Name
        {
            get { return name; }
            set { name = value; }
        }

        public virtual int Total
        {
            get { return total; }
            set { total = value; }
        }

        public virtual int NoReader
        {
            get { return noReader; }
            set { noReader = value; }
        }

        public virtual int Contain
        {
            get { return contain; }
            set { contain = value; }
        }

        public virtual DateTime CreateDate
        {
            get { return createDate; }
            set { createDate = value; }
        }

        public virtual int Flag
        {
            get { return flag; }
            set { flag = value; }
        }

        public virtual string OwnerCode
        {
            get { return ownerCode; }
            set { ownerCode = value; }
        }

        public virtual string KeyWord
        {
            get { return keyWord; }
            set { keyWord = value; }
        }
    }
}