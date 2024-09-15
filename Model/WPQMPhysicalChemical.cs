using System;

namespace ProjectMgt.Model
{
    /// <summary>
    /// 理化
    /// </summary>
    public class WPQMPhysicalChemical
    {
        public WPQMPhysicalChemical()
        {
        }

        public virtual int ID { get; set; }

        /// <summary>
        /// 焊接工艺评定编码
        /// </summary>
        public virtual string WeldProCode { get; set; }

        /// <summary>
        /// 理化拉伸试样
        /// </summary>
        public virtual string PhysicalCheTensileSample { get; set; }

        /// <summary>
        /// 冷弯曲试样
        /// </summary>
        public virtual string ColdBendSpecimen { get; set; }

        /// <summary>
        /// d
        /// </summary>
        public virtual string DValue { get; set; }

        /// <summary>
        /// α
        /// </summary>
        public virtual string Value_1 { get; set; }

        /// <summary>
        /// 侧弯
        /// </summary>
        public virtual string LateralBending { get; set; }

        /// <summary>
        /// 常温冲击
        /// </summary>
        public virtual Decimal NormalTemShock { get; set; }

        /// <summary>
        /// 常温焊缝区冲击
        /// </summary>
        public virtual Decimal NormalTemWeldZoneShock { get; set; }

        /// <summary>
        /// 常温热影响区冲击
        /// </summary>
        public virtual Decimal NormalTemHeatZoneShock { get; set; }

        /// <summary>
        /// 常温母材区冲击
        /// </summary>
        public virtual Decimal NormalTemMetaAreaShock { get; set; }

        /// <summary>
        /// 低温冲击温度℃
        /// </summary>
        public virtual string LowTemperature { get; set; }

        /// <summary>
        /// 低温冲击
        /// </summary>
        public virtual Decimal LowTempImpact { get; set; }

        /// <summary>
        /// 低温焊缝区冲击
        /// </summary>
        public virtual Decimal LowTempWeldImpact { get; set; }

        /// <summary>
        /// 低温热影响区冲击
        /// </summary>
        public virtual Decimal LowTempWarmImpact { get; set; }

        /// <summary>
        /// 低温母材区冲击
        /// </summary>
        public virtual Decimal LowTempMetaImpact { get; set; }

        /// <summary>
        /// 晶间腐蚀试样
        /// </summary>
        public virtual string InterCorrosionSpecimen { get; set; }

        /// <summary>
        /// 晶间腐蚀执行标准
        /// </summary>
        public virtual string IntCorrSpeStandard { get; set; }

        /// <summary>
        /// 宏观金相试样
        /// </summary>
        public virtual string MacroMetalloSpecimen { get; set; }

        /// <summary>
        /// 宏观金相执行标准
        /// </summary>
        public virtual string MacMetSpeStandard { get; set; }

        /// <summary>
        /// 刻槽锤断试样
        /// </summary>
        public virtual string GrooveSample { get; set; }

        /// <summary>
        /// 刻槽锤断执行标准
        /// </summary>
        public virtual string GrooveSampleStandard { get; set; }

        /// <summary>
        /// 角焊缝厚度测定
        /// </summary>
        public virtual string FilletMeasure { get; set; }

        /// <summary>
        /// 角焊缝厚度测定执行标准
        /// </summary>
        public virtual string FilletMeasureStandard { get; set; }

        /// <summary>
        /// 化学成分分析实验内容及要求
        /// </summary>
        public virtual string ContentReq { get; set; }

        /// <summary>
        /// 化学成分分析执行标准
        /// </summary>
        public virtual string ContentStandard { get; set; }

        /// <summary>
        /// 理化检验备注
        /// </summary>
        public virtual string Remark { get; set; }

        /// <summary>
        /// 理化委托日期
        /// </summary>
        public virtual DateTime ClientTime { get; set; }

        /// <summary>
        /// 理化委托人
        /// </summary>
        public virtual string ChemicalClient { get; set; }

        /// <summary>
        /// 理化审核人
        /// </summary>
        public virtual string ChemicalReviewer { get; set; }

        /// <summary>
        /// 创建者编码
        /// </summary>
        public virtual string EnterCode { get; set; }
    }
}