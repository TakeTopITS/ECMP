using System;

namespace ProjectMgt.Model
{
    /// <summary>
    /// 评标报告
    /// </summary>
    public class BMAssessBidReport
    {
        public BMAssessBidReport()
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

        private int assessBidRecordID;

        /// <summary>
        /// 评标记录ID
        /// </summary>
        public virtual int AssessBidRecordID
        {
            get { return assessBidRecordID; }
            set { assessBidRecordID = value; }
        }

        private string assessBidRecordName;

        /// <summary>
        /// 评标记录名称
        /// </summary>
        public virtual string AssessBidRecordName
        {
            get { return assessBidRecordName; }
            set { assessBidRecordName = value; }
        }

        private string assessSpeaker;

        /// <summary>
        /// 评标报告人
        /// </summary>
        public virtual string AssessSpeaker
        {
            get { return assessSpeaker; }
            set { assessSpeaker = value; }
        }

        private DateTime assessReportDate;

        /// <summary>
        /// 评标报告日期
        /// </summary>
        public virtual DateTime AssessReportDate
        {
            get { return assessReportDate; }
            set { assessReportDate = value; }
        }

        private string assessReportContent;

        /// <summary>
        /// 评标报告内容
        /// </summary>
        public virtual string AssessReportContent
        {
            get { return assessReportContent; }
            set { assessReportContent = value; }
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

        private DateTime reviewDate;

        /// <summary>
        /// 审批日期
        /// </summary>
        public virtual DateTime ReviewDate
        {
            get { return reviewDate; }
            set { reviewDate = value; }
        }

        private string reviewResult;

        /// <summary>
        /// 审批结果
        /// </summary>
        public virtual string ReviewResult
        {
            get { return reviewResult; }
            set { reviewResult = value; }
        }
    }
}