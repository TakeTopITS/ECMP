using System;

namespace ProjectMgt.Model
{
    /// <summary>
    /// 合格工评通知单
    /// </summary>
    public class WPQMQuaAssessNotice
    {
        public WPQMQuaAssessNotice()
        {
        }

        public virtual int ID { get; set; }

        /// <summary>
        /// 焊接工艺评定编码
        /// </summary>
        public virtual string WeldProCode { get; set; }

        /// <summary>
        /// 通知单发送人
        /// </summary>
        public virtual string NoteSender { get; set; }

        /// <summary>
        /// 通知单审核人
        /// </summary>
        public virtual string NoteReviewer { get; set; }

        /// <summary>
        /// 通知单接收人
        /// </summary>
        public virtual string NoteRecipient { get; set; }

        /// <summary>
        /// 通知单发送时间
        /// </summary>
        public virtual DateTime NoteSentTime { get; set; }

        /// <summary>
        /// 结论
        /// </summary>
        public virtual string Conclusion { get; set; }

        /// <summary>
        /// 创建者编码
        /// </summary>
        public virtual string EnterCode { get; set; }
    }
}