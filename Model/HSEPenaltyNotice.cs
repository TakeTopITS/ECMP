using System;

namespace ProjectMgt.Model
{
    /// <summary>
    /// 处罚通知
    /// </summary>
    public class HSEPenaltyNotice
    {
        public HSEPenaltyNotice()
        {
        }

        private string code;
        private string name;
        private string rectificationCode;
        private string rectificationName;
        private string status;
        private string penaltyDepartCode;
        private decimal penaltyMoney;
        private string currency;
        private DateTime penaltyDate;
        private string penaltyRemark;
        private string measures;
        private string auditOpinion;
        private string auditDepartCode;
        private string auditor;
        private DateTime auditDate;
        private string verificationResults;

        /// <summary>
        /// 编码 HSEPNNX
        /// </summary>
        public virtual string Code
        {
            get { return code; }
            set { code = value; }
        }

        /// <summary>
        /// 名称
        /// </summary>
        public virtual string Name
        {
            get { return name; }
            set { name = value; }
        }

        /// <summary>
        /// 整改编码
        /// </summary>
        public virtual string RectificationCode
        {
            get { return rectificationCode; }
            set { rectificationCode = value; }
        }

        /// <summary>
        /// 整改名称
        /// </summary>
        public virtual string RectificationName
        {
            get { return rectificationName; }
            set { rectificationName = value; }
        }

        /// <summary>
        /// 状态 新建，完成  评审合格的则是完成状态，否则都是新建状态
        /// </summary>
        public virtual string Status
        {
            get { return status; }
            set { status = value; }
        }

        /// <summary>
        /// 处罚单位
        /// </summary>
        public virtual string PenaltyDepartCode
        {
            get { return penaltyDepartCode; }
            set { penaltyDepartCode = value; }
        }

        /// <summary>
        /// 处罚金额
        /// </summary>
        public virtual decimal PenaltyMoney
        {
            get { return penaltyMoney; }
            set { penaltyMoney = value; }
        }

        /// <summary>
        /// 币种
        /// </summary>
        public virtual string Currency
        {
            get { return currency; }
            set { currency = value; }
        }

        /// <summary>
        /// 处罚日期
        /// </summary>
        public virtual DateTime PenaltyDate
        {
            get { return penaltyDate; }
            set { penaltyDate = value; }
        }

        /// <summary>
        /// 处罚内容
        /// </summary>
        public virtual string PenaltyRemark
        {
            get { return penaltyRemark; }
            set { penaltyRemark = value; }
        }

        /// <summary>
        /// 解决措施
        /// </summary>
        public virtual string Measures
        {
            get { return measures; }
            set { measures = value; }
        }

        /// <summary>
        /// 评审意见
        /// </summary>
        public virtual string AuditOpinion
        {
            get { return auditOpinion; }
            set { auditOpinion = value; }
        }

        /// <summary>
        /// 评审部门
        /// </summary>
        public virtual string AuditDepartCode
        {
            get { return auditDepartCode; }
            set { auditDepartCode = value; }
        }

        /// <summary>
        /// 责任人
        /// </summary>
        public virtual string Auditor
        {
            get { return auditor; }
            set { auditor = value; }
        }

        /// <summary>
        /// 评审日期
        /// </summary>
        public virtual DateTime AuditDate
        {
            get { return auditDate; }
            set { auditDate = value; }
        }

        /// <summary>
        /// 验证结果
        /// </summary>
        public virtual string VerificationResults
        {
            get { return verificationResults; }
            set { verificationResults = value; }
        }

        private string enterCode;

        public virtual string EnterCode
        {
            get { return enterCode; }
            set { enterCode = value; }
        }
    }
}