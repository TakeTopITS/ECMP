using System;

namespace ProjectMgt.Model
{
    /// <summary>
    /// PWPS1
    /// </summary>
    public class WPQMPWPS1
    {
        public WPQMPWPS1()
        {
        }

        public virtual int ID { get; set; }

        /// <summary>
        /// 焊接工艺评定编码
        /// </summary>
        public virtual string WeldProCode { get; set; }

        /// <summary>
        /// 单位名称
        /// </summary>
        public virtual string EntityName { get; set; }

        /// <summary>
        /// PWPS日期
        /// </summary>
        public virtual DateTime PWPS1DateTime { get; set; }

        /// <summary>
        /// 机械化程度
        /// </summary>
        public virtual string MechanizationDegree { get; set; }

        /// <summary>
        /// PWPS焊接接头其他
        /// </summary>
        public virtual string WeldedJointOther { get; set; }

        /// <summary>
        /// PWPS焊接接头简图路径
        /// </summary>
        public virtual string WeldedJointDiagram { get; set; }

        /// <summary>
        /// PWPS类别号
        /// </summary>
        public virtual string PWPSCategory { get; set; }

        /// <summary>
        /// PWPS与类别号
        /// </summary>
        public virtual string PWPSAndCategory { get; set; }

        /// <summary>
        /// PWPS标准号
        /// </summary>
        public virtual string PWPSStandardNo { get; set; }

        /// <summary>
        /// PWPS与标准号
        /// </summary>
        public virtual string PWPSAndStandardNo { get; set; }

        /// <summary>
        /// 对接焊缝焊件母材厚度范围
        /// </summary>
        public virtual string ButtWeldMateThicknessRange { get; set; }

        /// <summary>
        /// 角焊缝焊件母材厚度范围
        /// </summary>
        public virtual string FilletWeldMateThicknessRange { get; set; }

        /// <summary>
        /// 管子直径、壁厚范围：对接焊缝
        /// </summary>
        public virtual string ButtWeldOtherInfo { get; set; }

        /// <summary>
        /// 角焊缝
        /// </summary>
        public virtual string FilletWeld { get; set; }

        /// <summary>
        /// PWPS-1母材其他
        /// </summary>
        public virtual string PWPSMetalOther { get; set; }

        /// <summary>
        /// 焊条标准-焊材标准
        /// </summary>
        public virtual string ElectStandard { get; set; }

        /// <summary>
        /// 焊丝标准-焊材标准
        /// </summary>
        public virtual string WireStandard { get; set; }

        /// <summary>
        /// 焊剂标准-焊材标准
        /// </summary>
        public virtual string FluxStandard { get; set; }

        /// <summary>
        /// 焊条-材检号
        /// </summary>
        public virtual string ElectInspection { get; set; }

        /// <summary>
        /// 焊丝-材检号
        /// </summary>
        public virtual string WireInspection { get; set; }

        /// <summary>
        /// 焊剂-材检号
        /// </summary>
        public virtual string FluxInspection { get; set; }

        /// <summary>
        /// 对接焊缝焊件焊缝金属厚度范围
        /// </summary>
        public virtual string ButtWeldMetaThickRange { get; set; }

        /// <summary>
        /// 角焊缝焊件焊缝金属厚度范围
        /// </summary>
        public virtual string FilletWeldMetaThickRange { get; set; }

        /// <summary>
        /// C
        /// </summary>
        public virtual string C { get; set; }

        /// <summary>
        /// Mn
        /// </summary>
        public virtual string Mn { get; set; }

        /// <summary>
        /// Si
        /// </summary>
        public virtual string Si { get; set; }

        /// <summary>
        /// S
        /// </summary>
        public virtual string S { get; set; }

        /// <summary>
        /// P
        /// </summary>
        public virtual string P { get; set; }

        /// <summary>
        /// Cr
        /// </summary>
        public virtual string Cr { get; set; }

        /// <summary>
        /// Ni
        /// </summary>
        public virtual string Ni { get; set; }

        /// <summary>
        /// Mo
        /// </summary>
        public virtual string Mo { get; set; }

        /// <summary>
        /// Cu
        /// </summary>
        public virtual string Cu { get; set; }

        /// <summary>
        /// Ti
        /// </summary>
        public virtual string Ti { get; set; }

        /// <summary>
        /// Nb
        /// </summary>
        public virtual string Nb { get; set; }

        /// <summary>
        /// PWPS-1备注说明
        /// </summary>
        public virtual string PWPSDescr { get; set; }

        /// <summary>
        /// 创建者编码
        /// </summary>
        public virtual string EnterCode { get; set; }
    }
}