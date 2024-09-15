using System;

namespace ProjectMgt.Model
{
    /// <summary>
    /// 机械加工委托单
    /// </summary>
    public class WPQMMechanicalProOrder
    {
        public WPQMMechanicalProOrder()
        {
        }

        public virtual int ID { get; set; }

        /// <summary>
        /// 焊接工艺评定编码
        /// </summary>
        public virtual string WeldProCode { get; set; }

        /// <summary>
        /// 机械加工委托试件数量
        /// </summary>
        public virtual string MacComSpeNumber { get; set; }

        /// <summary>
        /// 机械加工委托项目
        /// </summary>
        public virtual string MachiningProject { get; set; }

        /// <summary>
        /// 机械加工附图路径
        /// </summary>
        public virtual string MachiningDrawPath { get; set; }

        /// <summary>
        /// 机械加工说明
        /// </summary>
        public virtual string MachanicalProInstro { get; set; }

        /// <summary>
        /// 机械加工委托日期
        /// </summary>
        public virtual DateTime ProCommDate { get; set; }

        /// <summary>
        /// 创建者编码
        /// </summary>
        public virtual string EnterCode { get; set; }
    }
}