using System;

namespace ProjectMgt.Model
{
    /// <summary>
    /// 合同洽谈
    /// </summary>
    public class BMContractDiscuss
    {
        public BMContractDiscuss()
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

        private string name;

        /// <summary>
        /// 合同洽谈名称
        /// </summary>
        public virtual string Name
        {
            get { return name; }
            set { name = value; }
        }

        private string discussFileName;

        /// <summary>
        /// 洽谈文件名称
        /// </summary>
        public virtual string DiscussFileName
        {
            get { return discussFileName; }
            set { discussFileName = value; }
        }

        private string discussFilePath;

        /// <summary>
        /// 洽谈文件路径
        /// </summary>
        public virtual string DiscussFilePath
        {
            get { return discussFilePath; }
            set { discussFilePath = value; }
        }

        private string pointSummary;

        /// <summary>
        /// 要点纪要
        /// </summary>
        public virtual string PointSummary
        {
            get { return pointSummary; }
            set { pointSummary = value; }
        }

        private string enterPer;

        /// <summary>
        /// 编制人
        /// </summary>
        public virtual string EnterPer
        {
            get { return enterPer; }
            set { enterPer = value; }
        }

        private DateTime enterDate;

        /// <summary>
        /// 编制日期
        /// </summary>
        public virtual DateTime EnterDate
        {
            get { return enterDate; }
            set { enterDate = value; }
        }

        private DateTime reviewDate;

        /// <summary>
        /// 审批日期
        /// </summary>
        public virtual DateTime ReviewDate
        {
            get { return reviewDate; }
            set { reviewDate = value; }
        }

        private string enterUnit;

        /// <summary>
        /// 编制单位
        /// </summary>
        public virtual string EnterUnit
        {
            get { return enterUnit; }
            set { enterUnit = value; }
        }

        private string status;

        /// <summary>
        /// 状态 新建，合格，不合格
        /// </summary>
        public virtual string Status
        {
            get { return status; }
            set { status = value; }
        }

        private string supplierCode;

        /// <summary>
        /// 供应商编码
        /// </summary>
        public virtual string SupplierCode
        {
            get { return supplierCode; }
            set { supplierCode = value; }
        }

        private string supplierName;

        /// <summary>
        /// 供应商名称
        /// </summary>
        public virtual string SupplierName
        {
            get { return supplierName; }
            set { supplierName = value; }
        }

        private decimal contractPrice;

        /// <summary>
        /// 合同价
        /// </summary>
        public virtual decimal ContractPrice
        {
            get { return contractPrice; }
            set { contractPrice = value; }
        }

        private string reviewer;

        /// <summary>
        /// 审批人
        /// </summary>
        public virtual string Reviewer
        {
            get { return reviewer; }
            set { reviewer = value; }
        }

        private string reviewResult;

        /// <summary>
        /// 审批内容
        /// </summary>
        public virtual string ReviewResult
        {
            get { return reviewResult; }
            set { reviewResult = value; }
        }

        private string enterCode;

        /// <summary>
        /// 编制人编码
        /// </summary>
        public virtual string EnterCode
        {
            get { return enterCode; }
            set { enterCode = value; }
        }

        private int constractID;

        /// <summary>
        /// 关联合同管理中的合同ID
        /// </summary>
        public virtual int ConstractID
        {
            get { return constractID; }
            set { constractID = value; }
        }
    }
}