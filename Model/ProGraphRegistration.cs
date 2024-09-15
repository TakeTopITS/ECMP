using System;

namespace ProjectMgt.Model
{
    /// <summary>
    /// 收图登记表
    /// </summary>
    public class ProGraphRegistration
    {
        public ProGraphRegistration()
        {
        }

        private int id;
        private int projectID;
        private string fileNo;
        private string fileName;
        private DateTime figureDate;
        private int fileNum;
        private int tableNum;
        private int figureNum;
        private string filePath;
        private string creator;
        private int archiveIdentification;
        private string docType;
        private string graphNo;
        private string remark;

        public virtual string GraphNo
        {
            get { return graphNo; }
            set { graphNo = value; }
        }

        public virtual string Remark
        {
            get { return remark; }
            set { remark = value; }
        }

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

        public virtual string FileNo
        {
            get { return fileNo; }
            set { fileNo = value; }
        }

        public virtual string FileName
        {
            get { return fileName; }
            set { fileName = value; }
        }

        public virtual DateTime FigureDate
        {
            get { return figureDate; }
            set { figureDate = value; }
        }

        public virtual int FileNum
        {
            get { return fileNum; }
            set { fileNum = value; }
        }

        public virtual int TableNum
        {
            get { return tableNum; }
            set { tableNum = value; }
        }

        public virtual int FigureNum
        {
            get { return figureNum; }
            set { figureNum = value; }
        }

        public virtual string FilePath
        {
            get { return filePath; }
            set { filePath = value; }
        }

        public virtual string Creator
        {
            get { return creator; }
            set { creator = value; }
        }

        public virtual int ArchiveIdentification
        {
            get { return archiveIdentification; }
            set { archiveIdentification = value; }
        }
    }
}