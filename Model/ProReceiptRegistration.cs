using System;

namespace ProjectMgt.Model
{
    /// <summary>
    /// 收文登记表
    /// </summary>
    public class ProReceiptRegistration
    {
        public ProReceiptRegistration()
        {
        }

        private int id;
        private int projectID;
        private string documentNo;
        private string fileName;
        private string creator;
        private DateTime createDate;
        private string filePath;
        private string dispatchDepartment;
        private string fileWay;
        private string destroyPeople;
        private DateTime destructionDate;
        private int archiveIdentification;
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

        public virtual int ProjectID
        {
            get { return projectID; }
            set { projectID = value; }
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

        public virtual string Creator
        {
            get { return creator; }
            set { creator = value; }
        }

        public virtual DateTime CreateDate
        {
            get { return createDate; }
            set { createDate = value; }
        }

        public virtual string FilePath
        {
            get { return filePath; }
            set { filePath = value; }
        }

        public virtual string DispatchDepartment
        {
            get { return dispatchDepartment; }
            set { dispatchDepartment = value; }
        }

        public virtual string FileWay
        {
            get { return fileWay; }
            set { fileWay = value; }
        }

        public virtual string DestroyPeople
        {
            get { return destroyPeople; }
            set { destroyPeople = value; }
        }

        public virtual DateTime DestructionDate
        {
            get { return destructionDate; }
            set { destructionDate = value; }
        }

        public virtual int ArchiveIdentification
        {
            get { return archiveIdentification; }
            set { archiveIdentification = value; }
        }
    }
}