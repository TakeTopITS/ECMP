using System;

namespace ProjectMgt.Model
{
    /// <summary>
    /// 试样机械加工委托单
    /// </summary>
    public class WPQMSampleMechProOrder
    {
        public WPQMSampleMechProOrder()
        {
        }

        public virtual int ID { get; set; }

        /// <summary>
        /// 焊接工艺评定编码
        /// </summary>
        public virtual string WeldProCode { get; set; }

        /// <summary>
        /// 机加工拉伸试样
        /// </summary>
        public virtual string TensileTestSpecimen { get; set; }

        /// <summary>
        /// 机加工面弯
        /// </summary>
        public virtual string SurfaceBending { get; set; }

        /// <summary>
        /// 机加工背弯
        /// </summary>
        public virtual string CurvedBack { get; set; }

        /// <summary>
        /// 机加工侧弯
        /// </summary>
        public virtual string CurvedSide { get; set; }

        /// <summary>
        /// 焊缝区冲击
        /// </summary>
        public virtual string WeldZoneImpact { get; set; }

        /// <summary>
        /// 热影响区冲击
        /// </summary>
        public virtual string HeatAffectedZone { get; set; }

        /// <summary>
        /// 母材区冲击
        /// </summary>
        public virtual string MetalAreaImpact { get; set; }

        /// <summary>
        /// 晶间腐蚀试样
        /// </summary>
        public virtual string InterCorrosionSpecimen { get; set; }

        /// <summary>
        /// 宏观金相试样
        /// </summary>
        public virtual string MacroMetalloSpecimen { get; set; }

        /// <summary>
        /// 机加工日期
        /// </summary>
        public virtual DateTime MachiningDate { get; set; }

        /// <summary>
        /// 机加工说明
        /// </summary>
        public virtual string MachiningInstruction { get; set; }

        /// <summary>
        /// 机加工委托日期
        /// </summary>
        public virtual DateTime CommissionedDate { get; set; }

        /// <summary>
        /// 机加工委托人
        /// </summary>
        public virtual string MachiningPrincipal { get; set; }

        /// <summary>
        /// 机加工审核人
        /// </summary>
        public virtual string MachiningReviewer { get; set; }

        /// <summary>
        /// 创建者编码
        /// </summary>
        public virtual string EnterCode { get; set; }
    }
}