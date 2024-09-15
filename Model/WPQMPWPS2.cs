namespace ProjectMgt.Model
{
    /// <summary>
    /// PWPS2
    /// </summary>
    public class WPQMPWPS2
    {
        public WPQMPWPS2()
        {
        }

        public virtual int ID { get; set; }

        /// <summary>
        /// 焊接工艺评定编码
        /// </summary>
        public virtual string WeldProCode { get; set; }

        /// <summary>
        /// 角焊缝位置
        /// </summary>
        public virtual string FilletWeldPosition { get; set; }

        /// <summary>
        /// 立焊的焊接方向
        /// </summary>
        public virtual string VerticalWeldingDirection { get; set; }

        /// <summary>
        /// 电流种类
        /// </summary>
        public virtual string CurrentType { get; set; }

        /// <summary>
        /// 极性
        /// </summary>
        public virtual string Polarity { get; set; }

        /// <summary>
        /// 焊接电流范围
        /// </summary>
        public virtual string WeldCurrentRange { get; set; }

        /// <summary>
        /// 电弧电压
        /// </summary>
        public virtual string ArcVoltage { get; set; }

        /// <summary>
        /// 焊接速度
        /// </summary>
        public virtual string WeldingSpeed { get; set; }

        /// <summary>
        /// 焊道/焊层
        /// </summary>
        public virtual string BeadWeldingLayer { get; set; }

        /// <summary>
        /// 电流种类与特性
        /// </summary>
        public virtual string CurrentTypeChara { get; set; }

        /// <summary>
        /// 焊接电流
        /// </summary>
        public virtual string WeldingCurrent { get; set; }

        /// <summary>
        /// 线能量
        /// </summary>
        public virtual string LineEnergy { get; set; }

        /// <summary>
        /// 摆动类型 摆动焊或不摆动焊
        /// </summary>
        public virtual string SwingType { get; set; }

        /// <summary>
        /// 摆动参数
        /// </summary>
        public virtual string OscillationParameters { get; set; }

        /// <summary>
        /// 道焊类型 单道焊、多道焊
        /// </summary>
        public virtual string PassWeldingType { get; set; }

        /// <summary>
        /// 丝焊类型 单丝焊、多丝焊
        /// </summary>
        public virtual string WireWeldingType { get; set; }

        /// <summary>
        /// 导电嘴至工件距离(mm)
        /// </summary>
        public virtual string ConductiveMouthWork { get; set; }

        /// <summary>
        /// 锤击
        /// </summary>
        public virtual string Hammer { get; set; }

        /// <summary>
        /// 创建者编码
        /// </summary>
        public virtual string EnterCode { get; set; }
    }
}