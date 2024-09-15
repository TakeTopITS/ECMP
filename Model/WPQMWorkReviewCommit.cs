namespace ProjectMgt.Model
{
    /// <summary>
    /// 工评任务书
    /// </summary>
    public class WPQMWorkReviewCommit
    {
        public WPQMWorkReviewCommit()
        {
        }

        public virtual int ID { get; set; }

        /// <summary>
        /// 焊接工艺评定编码
        /// </summary>
        public virtual string WeldProCode { get; set; }

        /// <summary>
        /// 评定用途
        /// </summary>
        public virtual string EvaluationPurposes { get; set; }

        /// <summary>
        /// 任务书衬垫厚度
        /// </summary>
        public virtual string SpecificationThickness { get; set; }

        /// <summary>
        /// 任务书直径
        /// </summary>
        public virtual string SpecificationDiameter { get; set; }

        /// <summary>
        /// 任务书衬垫
        /// </summary>
        public virtual string SpecificationPad { get; set; }

        /// <summary>
        /// 焊缝结构尺寸详图路径
        /// </summary>
        public virtual string DetailWeldSizePath { get; set; }

        /// <summary>
        /// α=°
        /// </summary>
        public virtual string Value_1 { get; set; }

        /// <summary>
        /// δ=
        /// </summary>
        public virtual string Value_2 { get; set; }

        /// <summary>
        /// b =
        /// </summary>
        public virtual string Value_3 { get; set; }

        /// <summary>
        /// p =
        /// </summary>
        public virtual string Value_4 { get; set; }

        /// <summary>
        /// H =
        /// </summary>
        public virtual string Value_5 { get; set; }

        /// <summary>
        /// β=°
        /// </summary>
        public virtual string Value_6 { get; set; }

        /// <summary>
        /// R=
        /// </summary>
        public virtual string Value_7 { get; set; }

        /// <summary>
        /// 任务书其它
        /// </summary>
        public virtual string SpecificationOther { get; set; }

        /// <summary>
        /// RT检测比例
        /// </summary>
        public virtual string RTInsProportion { get; set; }

        /// <summary>
        /// RT合格级别
        /// </summary>
        public virtual string RTQualifiedLevel { get; set; }

        /// <summary>
        /// RT评定标准
        /// </summary>
        public virtual string RTEvaluationCriteria { get; set; }

        /// <summary>
        /// MT检测比例
        /// </summary>
        public virtual string MTInsProportion { get; set; }

        /// <summary>
        /// MT合格级别
        /// </summary>
        public virtual string MTQualifiedLevel { get; set; }

        /// <summary>
        /// MT评定标准
        /// </summary>
        public virtual string MTEvaluationCriteria { get; set; }

        /// <summary>
        /// PT检测比例
        /// </summary>
        public virtual string PTInsProportion { get; set; }

        /// <summary>
        /// PT合格级别
        /// </summary>
        public virtual string PTQualifiedLevel { get; set; }

        /// <summary>
        /// PT评定标准
        /// </summary>
        public virtual string PTEvaluationCriteria { get; set; }

        /// <summary>
        /// UT检测比例
        /// </summary>
        public virtual string UTInsProportion { get; set; }

        /// <summary>
        /// UT合格级别
        /// </summary>
        public virtual string UTQualifiedLevel { get; set; }

        /// <summary>
        /// UT评定标准
        /// </summary>
        public virtual string UTEvaluationCriteria { get; set; }

        /// <summary>
        /// 任务书检验要求其它
        /// </summary>
        public virtual string SpecificationOtherReq { get; set; }

        /// <summary>
        /// 机械性能要求Rm
        /// </summary>
        public virtual string MechanicalPerReqRm { get; set; }

        /// <summary>
        /// 机械性能要求Rel
        /// </summary>
        public virtual string MechanicalPerReqRel { get; set; }

        /// <summary>
        /// 机械性能面弯
        /// </summary>
        public virtual string MechanicalPerBend { get; set; }

        /// <summary>
        /// 机械性能背弯
        /// </summary>
        public virtual string MechanicalPerBack { get; set; }

        /// <summary>
        /// 机械性能侧弯
        /// </summary>
        public virtual string MechanicalPerScol { get; set; }

        /// <summary>
        /// 冲击温度
        /// </summary>
        public virtual string ShockTemperature { get; set; }

        /// <summary>
        /// 冲击焊缝区
        /// </summary>
        public virtual string ImpactWeldZone { get; set; }

        /// <summary>
        /// 冲击热影响区
        /// </summary>
        public virtual string ImpactHeatZone { get; set; }

        /// <summary>
        /// 冲击母材区
        /// </summary>
        public virtual string ImpactMetalArea { get; set; }

        /// <summary>
        /// 硬度HRB
        /// </summary>
        public virtual string HardnessHRB { get; set; }

        /// <summary>
        /// 硬度HRC
        /// </summary>
        public virtual string HardnessHRC { get; set; }

        /// <summary>
        /// 硬度HV
        /// </summary>
        public virtual string HardnessHV { get; set; }

        /// <summary>
        /// 断口
        /// </summary>
        public virtual string Fracture { get; set; }

        /// <summary>
        /// 压扁
        /// </summary>
        public virtual string Flattening { get; set; }

        /// <summary>
        /// 锤断
        /// </summary>
        public virtual string HamBreak { get; set; }

        /// <summary>
        /// 化学成分C
        /// </summary>
        public virtual string ChemicalComp_C { get; set; }

        /// <summary>
        /// 化学成分Mn
        /// </summary>
        public virtual string ChemicalComp_Mn { get; set; }

        /// <summary>
        /// 化学成分Si
        /// </summary>
        public virtual string ChemicalComp_Si { get; set; }

        /// <summary>
        /// 化学成分S
        /// </summary>
        public virtual string ChemicalComp_S { get; set; }

        /// <summary>
        /// 化学成分P
        /// </summary>
        public virtual string ChemicalComp_P { get; set; }

        /// <summary>
        /// 化学成分Cr
        /// </summary>
        public virtual string ChemicalComp_Cr { get; set; }

        /// <summary>
        /// 化学成分Ni
        /// </summary>
        public virtual string ChemicalComp_Ni { get; set; }

        /// <summary>
        /// 化学成分Mo
        /// </summary>
        public virtual string ChemicalComp_Mo { get; set; }

        /// <summary>
        /// 化学成分V
        /// </summary>
        public virtual string ChemicalComp_V { get; set; }

        /// <summary>
        /// 化学成分Ti
        /// </summary>
        public virtual string ChemicalComp_Ti { get; set; }

        /// <summary>
        /// 化学成分Nb
        /// </summary>
        public virtual string ChemicalComp_Nb { get; set; }

        /// <summary>
        /// 晶间腐蚀试验
        /// </summary>
        public virtual string IntergranularCorrTest { get; set; }

        /// <summary>
        /// 金相
        /// </summary>
        public virtual string Metallographic { get; set; }

        /// <summary>
        /// 焊后热处理类别(PWHT)
        /// </summary>
        public virtual string AfterWeldingClass { get; set; }

        /// <summary>
        /// 焊后热处理温度
        /// </summary>
        public virtual string AfterWeldingTem { get; set; }

        /// <summary>
        /// 焊后热处理保温时间
        /// </summary>
        public virtual string AfterWeldingPreTime { get; set; }

        /// <summary>
        /// 冷却方法
        /// </summary>
        public virtual string CoolingMethod { get; set; }

        /// <summary>
        /// 任务书备注
        /// </summary>
        public virtual string Remark { get; set; }

        /// <summary>
        /// 创建者编码
        /// </summary>
        public virtual string EnterCode { get; set; }
    }
}