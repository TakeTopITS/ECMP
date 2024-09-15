namespace ProjectMgt.Model
{
    /// <summary>
    /// 热处理工艺卡
    /// </summary>
    public class WPQMHeatTreatProCard
    {
        public WPQMHeatTreatProCard()
        {
        }

        public virtual int ID { get; set; }

        /// <summary>
        /// 焊接工艺评定编码
        /// </summary>
        public virtual string WeldProCode { get; set; }

        /// <summary>
        /// 热处理炉型号
        /// </summary>
        public virtual string HeatTreFurnModel { get; set; }

        /// <summary>
        /// 入炉温度(理论)
        /// </summary>
        public virtual string BoilingTemp { get; set; }

        /// <summary>
        /// 升温速度(理论)
        /// </summary>
        public virtual string HeatingSpeed { get; set; }

        /// <summary>
        /// 降温速度(理论)
        /// </summary>
        public virtual string CoolingSpeed { get; set; }

        /// <summary>
        /// 热处理工艺卡备注
        /// </summary>
        public virtual string Remark { get; set; }

        /// <summary>
        /// 创建者编码
        /// </summary>
        public virtual string EnterCode { get; set; }
    }
}