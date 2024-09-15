using System;

namespace ProjectMgt.Model
{
    /// <summary>
    /// 管板预焊接附加工艺评定报告
    /// </summary>
    public class WPQMWeldAddProReport
    {
        public WPQMWeldAddProReport()
        {
        }

        public virtual int ID { get; set; }

        /// <summary>
        /// 焊接工艺评定编码
        /// </summary>
        public virtual string WeldProCode { get; set; }

        /// <summary>
        /// 手工焊时立焊的焊接方向
        /// </summary>
        public virtual string VerticalWeldingDirection { get; set; }

        /// <summary>
        /// 桥孔宽度
        /// </summary>
        public virtual string SpanWidth { get; set; }

        /// <summary>
        /// 角焊缝厚度
        /// </summary>
        public virtual string FilletWeldThick { get; set; }

        /// <summary>
        /// 焊接电流值
        /// </summary>
        public virtual string WeldingCurrent { get; set; }

        /// <summary>
        /// 预置金属衬套
        /// </summary>
        public virtual string MetalLiner { get; set; }

        /// <summary>
        /// 预置金属衬套的形状和尺寸
        /// </summary>
        public virtual string MetalLinerShapeSize { get; set; }

        /// <summary>
        /// 换热管与管板的连接方式
        /// </summary>
        public virtual string ConnectingWay { get; set; }

        /// <summary>
        /// 换热管与管板焊接接头的清理方法
        /// </summary>
        public virtual string CleaningMethod { get; set; }

        /// <summary>
        /// 焊后热处理方法
        /// </summary>
        public virtual string AfterHot { get; set; }

        /// <summary>
        /// 外观检查结果
        /// </summary>
        public virtual string AppInspectionResult { get; set; }

        /// <summary>
        /// 外观检查报告编号
        /// </summary>
        public virtual string AppInsRepNumber { get; set; }

        /// <summary>
        /// 渗透检验报告编号
        /// </summary>
        public virtual string PenInsRepNumber { get; set; }

        /// <summary>
        /// 渗透检验接头编号
        /// </summary>
        public virtual string PenInsJointNumber { get; set; }

        /// <summary>
        /// 金相检验报告编号
        /// </summary>
        public virtual string MetaInsRepNumber { get; set; }

        /// <summary>
        /// 金相检验面编号（有无裂纹、未熔合）
        /// </summary>
        public virtual string MetaFaceNumber_CIF { get; set; }

        /// <summary>
        /// 金相检验面编号（角焊缝厚度）
        /// </summary>
        public virtual string MetaFaceNumber_FWT { get; set; }

        /// <summary>
        /// 金相检验面编号（是否焊透）
        /// </summary>
        public virtual string MetaFaceNumber_PEN { get; set; }

        /// <summary>
        /// 结论
        /// </summary>
        public virtual string Conclusion { get; set; }

        /// <summary>
        /// 评定结果
        /// </summary>
        public virtual string EvaluationResult { get; set; }

        /// <summary>
        /// 焊工姓名
        /// </summary>
        public virtual string WelderName { get; set; }

        /// <summary>
        /// 焊工代码
        /// </summary>
        public virtual string WelderCode { get; set; }

        /// <summary>
        /// 施焊日期
        /// </summary>
        public virtual DateTime WeldingDate { get; set; }

        /// <summary>
        /// 创建者编码
        /// </summary>
        public virtual string EnterCode { get; set; }
    }
}