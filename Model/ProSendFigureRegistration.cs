using System;

namespace ProjectMgt.Model
{
    /// <summary>
    /// 发图登记表
    /// </summary>
    public class ProSendFigureRegistration
    {
        public ProSendFigureRegistration()
        {
        }

        private int id;
        private string fileNo;
        private string fileName;
        private DateTime issueDate;
        private string recipients;
        private string distribution;
        private string figurePlan;
        private int fileNum;
        private int tableNum;
        private int figureNum;
        private string filePath;
        private string backPer;
        private DateTime backTime;
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

        public virtual DateTime IssueDate
        {
            get { return issueDate; }
            set { issueDate = value; }
        }

        public virtual string Recipients
        {
            get { return recipients; }
            set { recipients = value; }
        }

        public virtual string Distribution
        {
            get { return distribution; }
            set { distribution = value; }
        }

        public virtual string FigurePlan
        {
            get { return figurePlan; }
            set { figurePlan = value; }
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

        public virtual string BackPer
        {
            get { return backPer; }
            set { backPer = value; }
        }

        public virtual DateTime BackTime
        {
            get { return backTime; }
            set { backTime = value; }
        }
    }
}