namespace ProjectMgt.Model
{
    /// <summary>
    /// 招标文件(附件形式)
    /// </summary>
    public class BMSupplierBidRecordFile
    {
        public BMSupplierBidRecordFile()
        {
        }

        private int id;

        /// <summary>
        /// 自增ID
        /// </summary>
        public virtual int ID
        {
            get { return id; }
            set { id = value; }
        }

        private int supplierBidRecordID;

        /// <summary>
        /// 招标计划ID
        /// </summary>
        public virtual int SupplierBidRecordID
        {
            get { return supplierBidRecordID; }
            set { supplierBidRecordID = value; }
        }

        private string fileName;

        /// <summary>
        /// 招标文件名称
        /// </summary>
        public virtual string FileName
        {
            get { return fileName; }
            set { fileName = value; }
        }

        private string filePath;

        /// <summary>
        /// 招标文件路径
        /// </summary>
        public virtual string FilePath
        {
            get { return filePath; }
            set { filePath = value; }
        }

        private string enterCode;

        /// <summary>
        /// 创建者编码
        /// </summary>
        public virtual string EnterCode
        {
            get { return enterCode; }
            set { enterCode = value; }
        }
    }
}