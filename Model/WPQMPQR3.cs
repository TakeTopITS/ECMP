using System;

namespace ProjectMgt.Model
{
    /// <summary>
    /// PQR3
    /// </summary>
    public class WPQMPQR3
    {
        public WPQMPQR3()
        {
        }

        public virtual int ID { get; set; }

        /// <summary>
        /// 焊接工艺评定编码
        /// </summary>
        public virtual string WeldProCode { get; set; }

        /// <summary>
        /// 金相检验（角焊缝）根部
        /// </summary>
        public virtual string MetallographicRoot { get; set; }

        /// <summary>
        /// 金相检验（角焊缝）焊缝
        /// </summary>
        public virtual string MetallographicWeld { get; set; }

        /// <summary>
        /// 金相检验（角焊缝）焊缝、热影响区
        /// </summary>
        public virtual string MetallographicZone { get; set; }

        /// <summary>
        /// 检验截面I焊脚差
        /// </summary>
        public virtual string InsSecIPoor { get; set; }

        /// <summary>
        /// 检验截面II焊脚差
        /// </summary>
        public virtual string InsSecIIPoor { get; set; }

        /// <summary>
        /// 检验截面III焊脚差
        /// </summary>
        public virtual string InsSecIIIPoor { get; set; }

        /// <summary>
        /// 检验截面IⅤ焊脚差
        /// </summary>
        public virtual string InsSecIVPoor { get; set; }

        /// <summary>
        /// 检验截面Ⅴ焊脚差
        /// </summary>
        public virtual string InsSecVPoor { get; set; }

        /// <summary>
        /// RT检验结果
        /// </summary>
        public virtual string RTInsResult { get; set; }

        /// <summary>
        /// RT报告编号
        /// </summary>
        public virtual string RTRepNumber { get; set; }

        /// <summary>
        /// MT检验结果
        /// </summary>
        public virtual string MTInsResult { get; set; }

        /// <summary>
        /// MT报告编号
        /// </summary>
        public virtual string MTRepNumber { get; set; }

        /// <summary>
        /// UT检验结果
        /// </summary>
        public virtual string UTInsResult { get; set; }

        /// <summary>
        /// UT报告编号
        /// </summary>
        public virtual string UTRepNumber { get; set; }

        /// <summary>
        /// PT检验结果
        /// </summary>
        public virtual string PTInsResult { get; set; }

        /// <summary>
        /// PT报告编号
        /// </summary>
        public virtual string PTRepNumber { get; set; }

        /// <summary>
        /// 化学成分试验报告编号
        /// </summary>
        public virtual string CheComTestRepNumber { get; set; }

        /// <summary>
        /// 化学成分C
        /// </summary>
        public virtual string CheComp_C { get; set; }

        /// <summary>
        /// 化学成分Si
        /// </summary>
        public virtual string CheComp_Si { get; set; }

        /// <summary>
        /// 化学成分Mn
        /// </summary>
        public virtual string CheComp_Mn { get; set; }

        /// <summary>
        /// 化学成分P
        /// </summary>
        public virtual string CheComp_P { get; set; }

        /// <summary>
        /// 化学成分S
        /// </summary>
        public virtual string CheComp_S { get; set; }

        /// <summary>
        /// 化学成分Cr
        /// </summary>
        public virtual string CheComp_Cr { get; set; }

        /// <summary>
        /// 化学成分Ni
        /// </summary>
        public virtual string CheComp_Ni { get; set; }

        /// <summary>
        /// 化学成分Mo
        /// </summary>
        public virtual string CheComp_Mo { get; set; }

        /// <summary>
        /// 化学成分Cu
        /// </summary>
        public virtual string CheComp_Cu { get; set; }

        /// <summary>
        /// 化学成分Ti
        /// </summary>
        public virtual string CheComp_Ti { get; set; }

        /// <summary>
        /// 化学成分Nb
        /// </summary>
        public virtual string CheComp_Nb { get; set; }

        /// <summary>
        /// 化学成分测定表面至基材表面的距离(mm)
        /// </summary>
        public virtual string SurfaceDistance { get; set; }

        /// <summary>
        /// 附加说明
        /// </summary>
        public virtual string AdditionalIns { get; set; }

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
        public virtual string WeldName { get; set; }

        /// <summary>
        /// 焊工代码
        /// </summary>
        public virtual string WeldCode { get; set; }

        /// <summary>
        /// 施焊日期
        /// </summary>
        public virtual DateTime UpDateTime { get; set; }

        /// <summary>
        /// 创建者编码
        /// </summary>
        public virtual string EnterCode { get; set; }
    }
}