namespace ProjectMgt.Model
{
    /// <summary>
    /// 管板预焊接工艺规程
    /// </summary>
    public class WPQMWeldProcedureSpe
    {
        public WPQMWeldProcedureSpe()
        {
        }

        public virtual int ID { get; set; }

        /// <summary>
        /// 焊接工艺评定编码
        /// </summary>
        public virtual string WeldProCode { get; set; }

        /// <summary>
        /// 焊接类型
        /// </summary>
        public virtual string WeldingType { get; set; }

        /// <summary>
        /// 接头简图路径
        /// </summary>
        public virtual string WeldedJointDiagram { get; set; }

        /// <summary>
        /// 焊接工艺程序
        /// </summary>
        public virtual string WeldingProcess { get; set; }

        /// <summary>
        /// 图号
        /// </summary>
        public virtual string FigureNumber { get; set; }

        /// <summary>
        /// 接头编号
        /// </summary>
        public virtual string JointNumber { get; set; }

        /// <summary>
        /// 焊工持证项目
        /// </summary>
        public virtual string HolderWeldProject { get; set; }

        /// <summary>
        /// 焊缝金属厚度
        /// </summary>
        public virtual string WeldMetalThickness { get; set; }

        /// <summary>
        /// 焊接位置
        /// </summary>
        public virtual string WeldingPosition { get; set; }

        /// <summary>
        /// 施焊技术
        /// </summary>
        public virtual string WeldingTechnology { get; set; }

        /// <summary>
        /// 预热温度（℃）
        /// </summary>
        public virtual string PreheatingTemperature { get; set; }

        /// <summary>
        /// 层(道)间温度（℃）
        /// </summary>
        public virtual string LayerTemperature { get; set; }

        /// <summary>
        /// 焊后热处理种类
        /// </summary>
        public virtual string AfterWeldingClass { get; set; }

        /// <summary>
        /// 焊后热处理方法
        /// </summary>
        public virtual string AfterHot { get; set; }

        /// <summary>
        /// 钨极直径（mm）
        /// </summary>
        public virtual string TunElecDiameter { get; set; }

        /// <summary>
        /// 喷嘴直径（mm）
        /// </summary>
        public virtual string NozzleDiameter { get; set; }

        /// <summary>
        /// 脉冲频率（Hz）
        /// </summary>
        public virtual string PulseFrequency { get; set; }

        /// <summary>
        /// 脉宽比（﹪）
        /// </summary>
        public virtual string PulseWidth { get; set; }

        /// <summary>
        /// 气体成分
        /// </summary>
        public virtual string GasComposition { get; set; }

        /// <summary>
        /// 气体流量正面
        /// </summary>
        public virtual string GasFlowFront { get; set; }

        /// <summary>
        /// 气体流量反面
        /// </summary>
        public virtual string GasFlowReverse { get; set; }

        /// <summary>
        /// 层(道)
        /// </summary>
        public virtual string Layer { get; set; }

        /// <summary>
        /// 焊接电流极性
        /// </summary>
        public virtual string Polarity { get; set; }

        /// <summary>
        /// 焊接电流
        /// </summary>
        public virtual string WeldingCurrent { get; set; }

        /// <summary>
        /// 电弧电压（V）
        /// </summary>
        public virtual string ArcVoltage { get; set; }

        /// <summary>
        /// 焊接速度（cm∕min）
        /// </summary>
        public virtual string WeldingSpeed { get; set; }

        /// <summary>
        /// 线能量（KJ∕cm）
        /// </summary>
        public virtual string LineEnergy { get; set; }

        /// <summary>
        /// 创建者编码
        /// </summary>
        public virtual string EnterCode { get; set; }
    }
}