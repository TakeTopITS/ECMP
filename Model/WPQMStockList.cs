using System;

namespace ProjectMgt.Model
{
    /// <summary>
    /// 备料清单
    /// </summary>
    public class WPQMStockList
    {
        public WPQMStockList()
        {
        }

        public virtual int ID { get; set; }

        /// <summary>
        /// 焊接工艺评定编码
        /// </summary>
        public virtual string WeldProCode { get; set; }

        /// <summary>
        /// 备料单委托人
        /// </summary>
        public virtual string StockClient { get; set; }

        /// <summary>
        /// 备料单位
        /// </summary>
        public virtual string StockUnit { get; set; }

        /// <summary>
        /// 试件规格
        /// </summary>
        public virtual string SpecimenSpecification { get; set; }

        /// <summary>
        /// 试件数量
        /// </summary>
        public virtual string SpecimenNumber { get; set; }

        /// <summary>
        /// 试件备料备注
        /// </summary>
        public virtual string SpecimenPreparationNote { get; set; }

        /// <summary>
        /// 焊材数量
        /// </summary>
        public virtual string WeldMaterialQuantity { get; set; }

        /// <summary>
        /// 备料单委托日期
        /// </summary>
        public virtual DateTime StockEntrustDate { get; set; }

        /// <summary>
        /// 创建者编码
        /// </summary>
        public virtual string EnterCode { get; set; }
    }
}