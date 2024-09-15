namespace ProjectMgt.Model
{
    /// <summary>
    /// PQR-1
    /// </summary>
    public class WPQMPQR1
    {
        public WPQMPQR1()
        {
        }

        public virtual int ID { get; set; }

        /// <summary>
        /// 焊接工艺评定编码
        /// </summary>
        public virtual string WeldProCode { get; set; }

        /// <summary>
        /// 焊接接头其他
        /// </summary>
        public virtual string WeldJointOther { get; set; }

        /// <summary>
        /// 母材其他
        /// </summary>
        public virtual string MetalOther { get; set; }

        /// <summary>
        /// 焊缝金属厚度
        /// </summary>
        public virtual string WeldMetalThick { get; set; }

        /// <summary>
        /// 填充金属其他
        /// </summary>
        public virtual string FillerMetalOther { get; set; }

        /// <summary>
        /// 焊接电流(A)
        /// </summary>
        public virtual string WeldingCurrent { get; set; }

        /// <summary>
        /// 电弧电压(V)
        /// </summary>
        public virtual string ArcVoltage { get; set; }

        /// <summary>
        /// 电特性其他
        /// </summary>
        public virtual string ElecCharaOther { get; set; }

        /// <summary>
        /// 焊接速度
        /// </summary>
        public virtual string WeldingSpeed { get; set; }

        /// <summary>
        /// 技术措施其他
        /// </summary>
        public virtual string SecurityMeasureOther { get; set; }

        /// <summary>
        /// 创建者编码
        /// </summary>
        public virtual string EnterCode { get; set; }
    }
}