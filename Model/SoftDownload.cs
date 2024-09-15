using System;

namespace ProjectMgt.Model
{
    public class SoftDownload
    {
        public SoftDownload()
        {
        }

        private int id;
        private string softName;
        private string versionNumber;
        private string savePath;
        private DateTime uploadTime;

        public virtual int ID
        {
            get { return id; }
            set { id = value; }
        }

        public virtual string SoftName
        {
            get { return softName; }
            set { softName = value; }
        }

        public virtual string VersionNumber
        {
            get { return versionNumber; }
            set { versionNumber = value; }
        }

        public virtual string SavePath
        {
            get { return savePath; }
            set { savePath = value; }
        }

        public virtual DateTime UploadTime
        {
            get { return uploadTime; }
            set { uploadTime = value; }
        }
    }
}