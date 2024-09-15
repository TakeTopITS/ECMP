namespace ProjectMgt.Model
{
    /// <summary>
    /// 焊接记录表
    /// </summary>
    public class WPQMWeldingRecord
    {
        public WPQMWeldingRecord()
        {
        }

        public virtual int ID { get; set; }

        /// <summary>
        /// 焊接工艺评定编码
        /// </summary>
        public virtual string WeldProCode { get; set; }

        /// <summary>
        /// 母材钢号
        /// </summary>
        public virtual string MaterialNo { get; set; }

        /// <summary>
        /// 母材规格
        /// </summary>
        public virtual string MaterialSpecification { get; set; }

        /// <summary>
        /// 类别组号
        /// </summary>
        public virtual string CategoryGroups { get; set; }

        /// <summary>
        /// 焊丝型号-牌号-规格
        /// </summary>
        public virtual string WireTypeBrandSpe { get; set; }

        /// <summary>
        /// 焊条型号-牌号-规格
        /// </summary>
        public virtual string ElecTypeBrandSpe { get; set; }

        /// <summary>
        /// 焊剂型号-牌号-规格
        /// </summary>
        public virtual string FluxTypeBrandSpe { get; set; }

        /// <summary>
        /// 焊材类别
        /// </summary>
        public virtual string WeldMaterialCategory { get; set; }

        /// <summary>
        /// 焊接位置
        /// </summary>
        public virtual string WeldingPosition { get; set; }

        /// <summary>
        /// 焊接方向
        /// </summary>
        public virtual string WeldingDirection { get; set; }

        /// <summary>
        /// 预热温度（℃）
        /// </summary>
        public virtual string PreheatingTemperature { get; set; }

        /// <summary>
        /// 道(层)间温度
        /// </summary>
        public virtual string LayerTemperature { get; set; }

        /// <summary>
        /// 加热方式
        /// </summary>
        public virtual string HeatingMode { get; set; }

        /// <summary>
        /// 测温方法
        /// </summary>
        public virtual string TempMeasureMethod { get; set; }

        /// <summary>
        /// 预热时间
        /// </summary>
        public virtual string WarmUpTime { get; set; }

        /// <summary>
        /// 焊接电流
        /// </summary>
        public virtual string WeldingCurrent { get; set; }

        /// <summary>
        /// 焊接电压
        /// </summary>
        public virtual string WeldingVoltage { get; set; }

        /// <summary>
        /// 焊接速度
        /// </summary>
        public virtual string WeldingSpeed { get; set; }

        /// <summary>
        /// 线能量
        /// </summary>
        public virtual string LineEnergy { get; set; }

        /// <summary>
        /// 后热温度
        /// </summary>
        public virtual string AfterHotTemp { get; set; }

        /// <summary>
        /// 后热时间
        /// </summary>
        public virtual string AfterHotTime { get; set; }

        /// <summary>
        /// 环境温度
        /// </summary>
        public virtual string EnvironmentTemperature { get; set; }

        /// <summary>
        /// 相对湿度
        /// </summary>
        public virtual string RelativeHumidity { get; set; }

        /// <summary>
        /// 焊前清理
        /// </summary>
        public virtual string CleanBefWelding { get; set; }

        /// <summary>
        /// 层(道)间清理
        /// </summary>
        public virtual string LayerClean { get; set; }

        /// <summary>
        /// 钨极类型
        /// </summary>
        public virtual string TunElecType { get; set; }

        /// <summary>
        /// 喷嘴直径
        /// </summary>
        public virtual string NozzleDiameter { get; set; }

        /// <summary>
        /// 钨极直径
        /// </summary>
        public virtual string TunElecDiameter { get; set; }

        /// <summary>
        /// 背面清根方法
        /// </summary>
        public virtual string BackClearRootMethod { get; set; }

        /// <summary>
        /// 焊丝送进速度
        /// </summary>
        public virtual string WireSpeed { get; set; }

        /// <summary>
        /// 保护气体种类
        /// </summary>
        public virtual string ProtectiveGas { get; set; }

        /// <summary>
        /// 保护气体混合比
        /// </summary>
        public virtual string ProGasMixRatio { get; set; }

        /// <summary>
        /// 保护气体流量
        /// </summary>
        public virtual string ShieldingGasFlowRate { get; set; }

        /// <summary>
        /// 尾部保护气体种类
        /// </summary>
        public virtual string TailProtectiveGas { get; set; }

        /// <summary>
        /// 尾部保护气体混合比
        /// </summary>
        public virtual string TailProtectiveGasMixRatio { get; set; }

        /// <summary>
        /// 尾部保护气体流量
        /// </summary>
        public virtual string TailGasFlowRate { get; set; }

        /// <summary>
        /// 背面保护气体种类
        /// </summary>
        public virtual string BackProtectiveGas { get; set; }

        /// <summary>
        /// 背面保护气体混合比
        /// </summary>
        public virtual string BackProtectiveGasMixRatio { get; set; }

        /// <summary>
        /// 背面保护气体流量
        /// </summary>
        public virtual string BackGasFlowRate { get; set; }

        /// <summary>
        /// 电流种类
        /// </summary>
        public virtual string CurrentType { get; set; }

        /// <summary>
        /// 导电嘴至工件距离
        /// </summary>
        public virtual string ConductiveMouthArtifacts { get; set; }

        /// <summary>
        /// 坡口简图路径
        /// </summary>
        public virtual string GrooveDiagramPath { get; set; }

        /// <summary>
        /// 施焊记录表图说明
        /// </summary>
        public virtual string WeldingFormDiagram { get; set; }

        /// <summary>
        /// 焊接方法
        /// </summary>
        public virtual string WeldingMethod { get; set; }

        /// <summary>
        /// 创建者编码
        /// </summary>
        public virtual string EnterCode { get; set; }
    }
}