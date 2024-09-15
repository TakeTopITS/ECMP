using System;

namespace ProjectMgt.Model
{
    /// <summary>
    /// 合同编制
    /// </summary>
    public class BMContractPreparation
    {
        public BMContractPreparation()
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
        /// 合同编制名称
        /// </summary>
        public virtual string Name
        {
            get { return name; }
            set { name = value; }
        }

        private string partyA;

        /// <summary>
        /// 甲方
        /// </summary>
        public virtual string PartyA
        {
            get { return partyA; }
            set { partyA = value; }
        }

        private string partyAName;

        /// <summary>
        /// 甲方代表
        /// </summary>
        public virtual string PartyAName
        {
            get { return partyAName; }
            set { partyAName = value; }
        }

        public virtual string RelatedConstractCode
        {
            get; set;
        }

        public virtual string RelatedConstractName
        {
            get; set;
        }

        private string partyB;

        /// <summary>
        /// 乙方
        /// </summary>
        public virtual string PartyB
        {
            get { return partyB; }
            set { partyB = value; }
        }

        private string partyBName;

        /// <summary>
        /// 乙方代表
        /// </summary>
        public virtual string PartyBName
        {
            get { return partyBName; }
            set { partyBName = value; }
        }

        private DateTime signDate;

        /// <summary>
        /// 签署日期
        /// </summary>
        public virtual DateTime SignDate
        {
            get { return signDate; }
            set { signDate = value; }
        }

        private DateTime effectiveDate;

        /// <summary>
        /// 生效日期
        /// </summary>
        public virtual DateTime EffectiveDate
        {
            get { return effectiveDate; }
            set { effectiveDate = value; }
        }

        private int contractDiscussID;

        /// <summary>
        /// 合同洽谈ID
        /// </summary>
        public virtual int ContractDiscussID
        {
            get { return contractDiscussID; }
            set { contractDiscussID = value; }
        }

        private string contractDiscussName;

        /// <summary>
        /// 合同洽谈名称
        /// </summary>
        public virtual string ContractDiscussName
        {
            get { return contractDiscussName; }
            set { contractDiscussName = value; }
        }
    }
}