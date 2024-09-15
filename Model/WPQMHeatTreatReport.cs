using System;

namespace ProjectMgt.Model
{
    /// <summary>
    /// 热处理报告
    /// </summary>
    public class WPQMHeatTreatReport
    {
        public WPQMHeatTreatReport()
        {
        }

        public virtual int ID { get; set; }

        /// <summary>
        /// 焊接工艺评定编码
        /// </summary>
        public virtual string WeldProCode { get; set; }

        /// <summary>
        /// 热处理时间
        /// </summary>
        public virtual DateTime HeatTreatTime { get; set; }

        /// <summary>
        /// 入炉温度(实际)
        /// </summary>
        public virtual string BoilingTemp { get; set; }

        /// <summary>
        /// 升温速度(实际)
        /// </summary>
        public virtual string HeatingSpeed { get; set; }

        /// <summary>
        /// 降温速度(实际)
        /// </summary>
        public virtual string CoolingSpeed { get; set; }

        /// <summary>
        /// 冷却方法(实际)
        /// </summary>
        public virtual string CoolingMethod { get; set; }

        /// <summary>
        /// 热处理工艺卡备注
        /// </summary>
        public virtual string Remark { get; set; }

        /// <summary>
        /// 热处理温度时间曲线图路径
        /// </summary>
        public virtual string TimeCurvePath { get; set; }

        /// <summary>
        /// 热处理报告编制人
        /// </summary>
        public virtual string HeatTreatReporter { get; set; }

        /// <summary>
        /// 热处理报告操作人
        /// </summary>
        public virtual string HeatTreatRepOperation { get; set; }

        /// <summary>
        /// 热处理报告审核人
        /// </summary>
        public virtual string HeatTreatReportReviewer { get; set; }

        /// <summary>
        /// 创建者编码
        /// </summary>
        public virtual string EnterCode { get; set; }
    }
}