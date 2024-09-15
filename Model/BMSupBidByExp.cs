namespace ProjectMgt.Model
{
    /// <summary>
    /// 专家评标意见
    /// </summary>
    public class BMSupBidByExp
    {
        public BMSupBidByExp()
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

        private int supplierBidID;

        /// <summary>
        /// 承包商投标ID
        /// </summary>
        public virtual int SupplierBidID
        {
            get { return supplierBidID; }
            set { supplierBidID = value; }
        }

        private string biddingContent;

        /// <summary>
        /// 投标内容
        /// </summary>
        public virtual string BiddingContent
        {
            get { return biddingContent; }
            set { biddingContent = value; }
        }

        private string exportResult;

        /// <summary>
        /// 专家评估意见
        /// </summary>
        public virtual string ExportResult
        {
            get { return exportResult; }
            set { exportResult = value; }
        }

        private string exportCode;

        /// <summary>
        /// 专家编码
        /// </summary>
        public virtual string ExportCode
        {
            get { return exportCode; }
            set { exportCode = value; }
        }
    }
}