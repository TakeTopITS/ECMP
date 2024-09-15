namespace ProjectMgt.Model
{
    /// <summary>
    /// PQR-2
    /// </summary>
    public class WPQMPQR2
    {
        public WPQMPQR2()
        {
        }

        public virtual int ID { get; set; }

        /// <summary>
        /// 焊接工艺评定编码
        /// </summary>
        public virtual string WeldProCode { get; set; }

        /// <summary>
        /// 外观检查结论
        /// </summary>
        public virtual string AppInsConclusion { get; set; }

        /// <summary>
        /// 外观检查评定结果
        /// </summary>
        public virtual string AppInsEvaResults { get; set; }

        /// <summary>
        /// 拉伸试验报告编号
        /// </summary>
        public virtual string TensileTestReportNo { get; set; }

        /// <summary>
        /// 拉伸试样宽度(mm)
        /// </summary>
        public virtual string TenSpeWidth { get; set; }

        /// <summary>
        /// 拉伸试样厚度(mm)
        /// </summary>
        public virtual string TenSpeThickness { get; set; }

        /// <summary>
        /// 拉伸横截面积(m㎡)
        /// </summary>
        public virtual string TenSpeArea { get; set; }

        /// <summary>
        /// 拉伸断裂载荷(KN)
        /// </summary>
        public virtual string TenSpeBreLoad { get; set; }

        /// <summary>
        /// 拉伸剪切强度(MPa)
        /// </summary>
        public virtual string TenSpeSheStrength { get; set; }

        /// <summary>
        /// 拉伸断裂部位和特征
        /// </summary>
        public virtual string TenSpePartChara { get; set; }

        /// <summary>
        /// 弯曲试验报告编号
        /// </summary>
        public virtual string BendTestReportNo { get; set; }

        /// <summary>
        /// 弯曲试样类型
        /// </summary>
        public virtual string BendSpeType { get; set; }

        /// <summary>
        /// 弯曲试样厚度(mm)
        /// </summary>
        public virtual string BendSpeThickness { get; set; }

        /// <summary>
        /// 弯曲试样直径(mm)
        /// </summary>
        public virtual string BendSpeDiameter { get; set; }

        /// <summary>
        /// 弯曲弯曲角度
        /// </summary>
        public virtual string BendSpeAngle { get; set; }

        /// <summary>
        /// 弯曲试验结果
        /// </summary>
        public virtual string BendSpeResults { get; set; }

        /// <summary>
        /// 冲击实验报告编号
        /// </summary>
        public virtual string ImpactTestReportNo { get; set; }

        /// <summary>
        /// 冲击试样尺寸
        /// </summary>
        public virtual string ImpactSampSize { get; set; }

        /// <summary>
        /// 冲击缺口类型
        /// </summary>
        public virtual string ImpactSampType { get; set; }

        /// <summary>
        /// 冲击缺口位置
        /// </summary>
        public virtual string ImpactSampPosition { get; set; }

        /// <summary>
        /// 冲击试验温度（℃）
        /// </summary>
        public virtual string ImpactSampTemperature { get; set; }

        /// <summary>
        /// 冲击吸收功(J)
        /// </summary>
        public virtual string ImpactSampFunction { get; set; }

        /// <summary>
        /// 冲击侧向膨胀量(mm)
        /// </summary>
        public virtual string ImpactSampExpAmount { get; set; }

        /// <summary>
        /// 冲击备注
        /// </summary>
        public virtual string ImpactSampRemark { get; set; }

        /// <summary>
        /// 其他试验名称
        /// </summary>
        public virtual string OtherTestName { get; set; }

        /// <summary>
        /// 其他试验报告编号
        /// </summary>
        public virtual string OtherTestReportNo { get; set; }

        /// <summary>
        /// 其他试验试样尺寸
        /// </summary>
        public virtual string OtherTestSize { get; set; }

        /// <summary>
        /// 其他试验备注
        /// </summary>
        public virtual string OtherExpRemark { get; set; }

        /// <summary>
        /// 创建者编码
        /// </summary>
        public virtual string EnterCode { get; set; }
    }
}