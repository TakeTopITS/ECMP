namespace ProjectMgt.Model
{
    /// <summary>
    /// 焊接工艺评定管理-焊接工艺评定数据
    /// </summary>
    public class WPQMWeldProQua
    {
        public WPQMWeldProQua()
        {
        }

        private string code;

        /// <summary>
        /// 焊接工艺评定编号 格式：PE2013120001
        /// </summary>
        public virtual string Code
        {
            get { return code; }
            set { code = value; }
        }

        private string applicableCategories;

        /// <summary>
        /// 适用类别
        /// </summary>
        public virtual string ApplicableCategories
        {
            get { return applicableCategories; }
            set { applicableCategories = value; }
        }

        private string materialNo;

        /// <summary>
        /// 母材材质
        /// </summary>
        public virtual string MaterialNo
        {
            get { return materialNo; }
            set { materialNo = value; }
        }

        private string materialSpecification;

        /// <summary>
        /// 母材规格
        /// </summary>
        public virtual string MaterialSpecification
        {
            get { return materialSpecification; }
            set { materialSpecification = value; }
        }

        private string weldmentThickness;

        /// <summary>
        /// 焊件厚度覆盖范围
        /// </summary>
        public virtual string WeldmentThickness
        {
            get { return weldmentThickness; }
            set { weldmentThickness = value; }
        }

        private string baseClass;

        /// <summary>
        /// 母材类别
        /// </summary>
        public virtual string BaseClass
        {
            get { return baseClass; }
            set { baseClass = value; }
        }

        private string groupForm;

        /// <summary>
        /// 组对形式
        /// </summary>
        public virtual string GroupForm
        {
            get { return groupForm; }
            set { groupForm = value; }
        }

        private string weldingMethod;

        /// <summary>
        /// 焊接方法
        /// </summary>
        public virtual string WeldingMethod
        {
            get { return weldingMethod; }
            set { weldingMethod = value; }
        }

        private string weldingPosition;

        /// <summary>
        /// 焊接位置
        /// </summary>
        public virtual string WeldingPosition
        {
            get { return weldingPosition; }
            set { weldingPosition = value; }
        }

        private string preheatingTemperature;

        /// <summary>
        /// 预热温度
        /// </summary>
        public virtual string PreheatingTemperature
        {
            get { return preheatingTemperature; }
            set { preheatingTemperature = value; }
        }

        private string layerTemperature;

        /// <summary>
        /// 层(道)间温度
        /// </summary>
        public virtual string LayerTemperature
        {
            get { return layerTemperature; }
            set { layerTemperature = value; }
        }

        private string afterHot;

        /// <summary>
        /// 焊后热处理方法
        /// </summary>
        public virtual string AfterHot
        {
            get { return afterHot; }
            set { afterHot = value; }
        }

        private string afterWeldingClass;

        /// <summary>
        /// 焊后热处理类别
        /// </summary>
        public virtual string AfterWeldingClass
        {
            get { return afterWeldingClass; }
            set { afterWeldingClass = value; }
        }

        private string afterWeldingTem;

        /// <summary>
        /// 焊后热处理温度
        /// </summary>
        public virtual string AfterWeldingTem
        {
            get { return afterWeldingTem; }
            set { afterWeldingTem = value; }
        }

        private string afterWeldingPreTime;

        /// <summary>
        /// 焊后热处理保持时间
        /// </summary>
        public virtual string AfterWeldingPreTime
        {
            get { return afterWeldingPreTime; }
            set { afterWeldingPreTime = value; }
        }

        private string wireTypeBrandSpe;

        /// <summary>
        /// 焊丝型号-牌号-规格
        /// </summary>
        public virtual string WireTypeBrandSpe
        {
            get { return wireTypeBrandSpe; }
            set { wireTypeBrandSpe = value; }
        }

        private string elecTypeBrandSpe;

        /// <summary>
        /// 焊条型号-牌号-规格
        /// </summary>
        public virtual string ElecTypeBrandSpe
        {
            get { return elecTypeBrandSpe; }
            set { elecTypeBrandSpe = value; }
        }

        private string fluxTypeBrandSpe;

        /// <summary>
        /// 焊剂型号-牌号-规格
        /// </summary>
        public virtual string FluxTypeBrandSpe
        {
            get { return fluxTypeBrandSpe; }
            set { fluxTypeBrandSpe = value; }
        }

        private string weldMaterialCategory;

        /// <summary>
        /// 焊材类别
        /// </summary>
        public virtual string WeldMaterialCategory
        {
            get { return weldMaterialCategory; }
            set { weldMaterialCategory = value; }
        }

        private string weldingCurrent;

        /// <summary>
        /// 焊接电流
        /// </summary>
        public virtual string WeldingCurrent
        {
            get { return weldingCurrent; }
            set { weldingCurrent = value; }
        }

        private string weldingVoltage;

        /// <summary>
        /// 焊接电压
        /// </summary>
        public virtual string WeldingVoltage
        {
            get { return weldingVoltage; }
            set { weldingVoltage = value; }
        }

        private string weldingSpeed;

        /// <summary>
        /// 焊接速度
        /// </summary>
        public virtual string WeldingSpeed
        {
            get { return weldingSpeed; }
            set { weldingSpeed = value; }
        }

        private string lineEnergy;

        /// <summary>
        /// 线能量
        /// </summary>
        public virtual string LineEnergy
        {
            get { return lineEnergy; }
            set { lineEnergy = value; }
        }

        private string protectiveGas;

        /// <summary>
        /// 保护气体种类
        /// </summary>
        public virtual string ProtectiveGas
        {
            get { return protectiveGas; }
            set { protectiveGas = value; }
        }

        private string proGasMixRatio;

        /// <summary>
        /// 保护气体混合比
        /// </summary>
        public virtual string ProGasMixRatio
        {
            get { return proGasMixRatio; }
            set { proGasMixRatio = value; }
        }

        private string shieldingGasFlowRate;

        /// <summary>
        /// 保护气体流量
        /// </summary>
        public virtual string ShieldingGasFlowRate
        {
            get { return shieldingGasFlowRate; }
            set { shieldingGasFlowRate = value; }
        }

        private string evaluationProject;

        /// <summary>
        /// 评定项目内容(拉伸、弯曲、冲击)
        /// </summary>
        public virtual string EvaluationProject
        {
            get { return evaluationProject; }
            set { evaluationProject = value; }
        }

        private string mechanicalPerReq;

        /// <summary>
        /// 机械性能要求
        /// </summary>
        public virtual string MechanicalPerReq
        {
            get { return mechanicalPerReq; }
            set { mechanicalPerReq = value; }
        }

        private string otherPerReq;

        /// <summary>
        /// 其他性能要求
        /// </summary>
        public virtual string OtherPerReq
        {
            get { return otherPerReq; }
            set { otherPerReq = value; }
        }

        private string grooveForm;

        /// <summary>
        /// 坡口形式
        /// </summary>
        public virtual string GrooveForm
        {
            get { return grooveForm; }
            set { grooveForm = value; }
        }

        private string nondestructiveTestReq;

        /// <summary>
        /// 无损检测要求
        /// </summary>
        public virtual string NondestructiveTestReq
        {
            get { return nondestructiveTestReq; }
            set { nondestructiveTestReq = value; }
        }

        private string afterHotTemp;

        /// <summary>
        /// 后热温度
        /// </summary>
        public virtual string AfterHotTemp
        {
            get { return afterHotTemp; }
            set { afterHotTemp = value; }
        }

        private string afterHotTime;

        /// <summary>
        /// 后热时间
        /// </summary>
        public virtual string AfterHotTime
        {
            get { return afterHotTime; }
            set { afterHotTime = value; }
        }

        private string swingType;

        /// <summary>
        /// 摆动类型 摆动焊或不摆动焊
        /// </summary>
        public virtual string SwingType
        {
            get { return swingType; }
            set { swingType = value; }
        }

        private string oscillationParameters;

        /// <summary>
        /// 摆动参数
        /// </summary>
        public virtual string OscillationParameters
        {
            get { return oscillationParameters; }
            set { oscillationParameters = value; }
        }

        private string coolingMethod;

        /// <summary>
        /// 冷却方法
        /// </summary>
        public virtual string CoolingMethod
        {
            get { return coolingMethod; }
            set { coolingMethod = value; }
        }

        private string heatingMode;

        /// <summary>
        /// 加热方式
        /// </summary>
        public virtual string HeatingMode
        {
            get { return heatingMode; }
            set { heatingMode = value; }
        }

        private string warmUpTime;

        /// <summary>
        /// 预热时间
        /// </summary>
        public virtual string WarmUpTime
        {
            get { return warmUpTime; }
            set { warmUpTime = value; }
        }

        private string tempMeasureMethod;

        /// <summary>
        /// 测温方法
        /// </summary>
        public virtual string TempMeasureMethod
        {
            get { return tempMeasureMethod; }
            set { tempMeasureMethod = value; }
        }

        private string tailProtectiveGas;

        /// <summary>
        /// 尾部保护气体种类
        /// </summary>
        public virtual string TailProtectiveGas
        {
            get { return tailProtectiveGas; }
            set { tailProtectiveGas = value; }
        }

        private string tailProtectiveGasMixRatio;

        /// <summary>
        /// 尾部保护气体混合比
        /// </summary>
        public virtual string TailProtectiveGasMixRatio
        {
            get { return tailProtectiveGasMixRatio; }
            set { tailProtectiveGasMixRatio = value; }
        }

        private string tailGasFlowRate;

        /// <summary>
        /// 尾部保护气体流量(L/min)
        /// </summary>
        public virtual string TailGasFlowRate
        {
            get { return tailGasFlowRate; }
            set { tailGasFlowRate = value; }
        }

        private string backProtectiveGas;

        /// <summary>
        /// 背面保护气体种类
        /// </summary>
        public virtual string BackProtectiveGas
        {
            get { return backProtectiveGas; }
            set { backProtectiveGas = value; }
        }

        private string backProtectiveGasMixRatio;

        /// <summary>
        /// 背面保护气体混合比
        /// </summary>
        public virtual string BackProtectiveGasMixRatio
        {
            get { return backProtectiveGasMixRatio; }
            set { backProtectiveGasMixRatio = value; }
        }

        private string backGasFlowRate;

        /// <summary>
        /// 背面保护气体流量(L/min)
        /// </summary>
        public virtual string BackGasFlowRate
        {
            get { return backGasFlowRate; }
            set { backGasFlowRate = value; }
        }

        private string nozzleDiameter;

        /// <summary>
        /// 喷嘴直径
        /// </summary>
        public virtual string NozzleDiameter
        {
            get { return nozzleDiameter; }
            set { nozzleDiameter = value; }
        }

        private string tunElecType;

        /// <summary>
        /// 钨极类型
        /// </summary>
        public virtual string TunElecType
        {
            get { return tunElecType; }
            set { tunElecType = value; }
        }

        private string tunElecDiameter;

        /// <summary>
        /// 钨极直径
        /// </summary>
        public virtual string TunElecDiameter
        {
            get { return tunElecDiameter; }
            set { tunElecDiameter = value; }
        }

        private string wireSpeed;

        /// <summary>
        /// 焊丝送进速度
        /// </summary>
        public virtual string WireSpeed
        {
            get { return wireSpeed; }
            set { wireSpeed = value; }
        }

        private string weldingArcType;

        /// <summary>
        /// 焊接电弧种类 喷射弧、短路弧
        /// </summary>
        public virtual string WeldingArcType
        {
            get { return weldingArcType; }
            set { weldingArcType = value; }
        }

        private string backClearRootMethod;

        /// <summary>
        /// 背面清根方法
        /// </summary>
        public virtual string BackClearRootMethod
        {
            get { return backClearRootMethod; }
            set { backClearRootMethod = value; }
        }

        private string cleanBefWelding;

        /// <summary>
        /// 焊前清理
        /// </summary>
        public virtual string CleanBefWelding
        {
            get { return cleanBefWelding; }
            set { cleanBefWelding = value; }
        }

        private string layerClean;

        /// <summary>
        /// 层(道)间清理
        /// </summary>
        public virtual string LayerClean
        {
            get { return layerClean; }
            set { layerClean = value; }
        }

        private string heatTreatmentMethod;

        /// <summary>
        /// 热处理方法
        /// </summary>
        public virtual string HeatTreatmentMethod
        {
            get { return heatTreatmentMethod; }
            set { heatTreatmentMethod = value; }
        }

        private string numberSpecimens;

        /// <summary>
        /// 试件数量
        /// </summary>
        public virtual string NumberSpecimens
        {
            get { return numberSpecimens; }
            set { numberSpecimens = value; }
        }

        private string heatTreFurnModel;

        /// <summary>
        /// 热处理炉型号
        /// </summary>
        public virtual string HeatTreFurnModel
        {
            get { return heatTreFurnModel; }
            set { heatTreFurnModel = value; }
        }

        private string boilingTemp;

        /// <summary>
        /// 入炉温度(理论)
        /// </summary>
        public virtual string BoilingTemp
        {
            get { return boilingTemp; }
            set { boilingTemp = value; }
        }

        private string heatingSpeed;

        /// <summary>
        /// 升温速度(理论)
        /// </summary>
        public virtual string HeatingSpeed
        {
            get { return heatingSpeed; }
            set { heatingSpeed = value; }
        }

        private string coolingSpeed;

        /// <summary>
        /// 降温速度(理论)
        /// </summary>
        public virtual string CoolingSpeed
        {
            get { return coolingSpeed; }
            set { coolingSpeed = value; }
        }

        private string padMaterialSpec;

        /// <summary>
        /// 衬垫(材料及规格)
        /// </summary>
        public virtual string PadMaterialSpec
        {
            get { return padMaterialSpec; }
            set { padMaterialSpec = value; }
        }

        private string value_1;

        /// <summary>
        /// α=°
        /// </summary>
        public virtual string Value_1
        {
            get { return value_1; }
            set { value_1 = value; }
        }

        private string value_2;

        /// <summary>
        /// δ=
        /// </summary>
        public virtual string Value_2
        {
            get { return value_2; }
            set { value_2 = value; }
        }

        private string value_3;

        /// <summary>
        /// b =
        /// </summary>
        public virtual string Value_3
        {
            get { return value_3; }
            set { value_3 = value; }
        }

        private string value_4;

        /// <summary>
        /// p =
        /// </summary>
        public virtual string Value_4
        {
            get { return value_4; }
            set { value_4 = value; }
        }

        private string value_5;

        /// <summary>
        /// H =
        /// </summary>
        public virtual string Value_5
        {
            get { return value_5; }
            set { value_5 = value; }
        }

        private string value_6;

        /// <summary>
        /// β=°
        /// </summary>
        public virtual string Value_6
        {
            get { return value_6; }
            set { value_6 = value; }
        }

        private string value_7;

        /// <summary>
        /// R =
        /// </summary>
        public virtual string Value_7
        {
            get { return value_7; }
            set { value_7 = value; }
        }

        private string categoryGroups;

        /// <summary>
        /// 类别组号
        /// </summary>
        public virtual string CategoryGroups
        {
            get { return categoryGroups; }
            set { categoryGroups = value; }
        }

        private string weldingDirection;

        /// <summary>
        /// 焊接方向
        /// </summary>
        public virtual string WeldingDirection
        {
            get { return weldingDirection; }
            set { weldingDirection = value; }
        }

        private string mechanizationDegree;

        /// <summary>
        /// 机械化程度
        /// </summary>
        public virtual string MechanizationDegree
        {
            get { return mechanizationDegree; }
            set { mechanizationDegree = value; }
        }

        private string weldedJointDiagram;

        /// <summary>
        /// 焊接接头简图路径
        /// </summary>
        public virtual string WeldedJointDiagram
        {
            get { return weldedJointDiagram; }
            set { weldedJointDiagram = value; }
        }

        private string pWPSStandardNo;

        /// <summary>
        /// PWPS标准号
        /// </summary>
        public virtual string PWPSStandardNo
        {
            get { return pWPSStandardNo; }
            set { pWPSStandardNo = value; }
        }

        private string specificationThickness;

        /// <summary>
        /// 任务书厚度
        /// </summary>
        public virtual string SpecificationThickness
        {
            get { return specificationThickness; }
            set { specificationThickness = value; }
        }

        private string specificationDiameter;

        /// <summary>
        /// 任务书直径
        /// </summary>
        public virtual string SpecificationDiameter
        {
            get { return specificationDiameter; }
            set { specificationDiameter = value; }
        }

        private string weldingMaterialStandard;

        /// <summary>
        /// 焊材标准
        /// </summary>
        public virtual string WeldingMaterialStandard
        {
            get { return weldingMaterialStandard; }
            set { weldingMaterialStandard = value; }
        }

        private string currentType;

        /// <summary>
        /// 电流种类
        /// </summary>
        public virtual string CurrentType
        {
            get { return currentType; }
            set { currentType = value; }
        }

        private string polarity;

        /// <summary>
        /// 极性
        /// </summary>
        public virtual string Polarity
        {
            get { return polarity; }
            set { polarity = value; }
        }

        private string passWeldingType;

        /// <summary>
        /// 道焊类型 单道焊、多道焊
        /// </summary>
        public virtual string PassWeldingType
        {
            get { return passWeldingType; }
            set { passWeldingType = value; }
        }

        private string wireWeldingType;

        /// <summary>
        /// 丝焊类型 单丝焊、多丝焊
        /// </summary>
        public virtual string WireWeldingType
        {
            get { return wireWeldingType; }
            set { wireWeldingType = value; }
        }

        private string filletWeldPosition;

        /// <summary>
        /// 角焊缝位置
        /// </summary>
        public virtual string FilletWeldPosition
        {
            get { return filletWeldPosition; }
            set { filletWeldPosition = value; }
        }

        private string verticalWeldingDirection;

        /// <summary>
        /// 立焊的焊接方向
        /// </summary>
        public virtual string VerticalWeldingDirection
        {
            get { return verticalWeldingDirection; }
            set { verticalWeldingDirection = value; }
        }

        private string entityName;

        /// <summary>
        /// 单位名称
        /// </summary>
        public virtual string EntityName
        {
            get { return entityName; }
            set { entityName = value; }
        }

        private string enterCode;

        /// <summary>
        /// 创建者编码
        /// </summary>
        public virtual string EnterCode
        {
            get { return enterCode; }
            set { enterCode = value; }
        }
    }
}