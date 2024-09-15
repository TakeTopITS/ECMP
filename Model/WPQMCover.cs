using System;

namespace ProjectMgt.Model
{
    /// <summary>
    /// 封面
    /// </summary>
    public class WPQMCover
    {
        public WPQMCover()
        {
        }

        public virtual int ID { get; set; }

        /// <summary>
        /// 焊接工艺评定编码
        /// </summary>
        public virtual string WeldProCode { get; set; }

        /// <summary>
        /// 封面说明
        /// </summary>
        public virtual string CoverRemark { get; set; }

        /// <summary>
        /// 封面日期
        /// </summary>
        public virtual DateTime CoverDate { get; set; }

        /// <summary>
        /// 创建者编码
        /// </summary>
        public virtual string EnterCode { get; set; }
    }
}