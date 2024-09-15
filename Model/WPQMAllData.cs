namespace ProjectMgt.Model
{
    /// <summary>
    /// 焊接工艺评定管理-基础数据
    /// </summary>
    public class WPQMAllData
    {
        public WPQMAllData()
        {
        }

        private int id;
        private string code;
        private string description;
        private string type;

        /// <summary>
        /// 自增ID
        /// </summary>
        public virtual int ID
        {
            get { return id; }
            set { id = value; }
        }

        /// <summary>
        /// 编码
        /// </summary>
        public virtual string Code
        {
            get { return code; }
            set { code = value; }
        }

        /// <summary>
        /// 描述
        /// </summary>
        public virtual string Description
        {
            get { return description; }
            set { description = value; }
        }

        /// <summary>
        /// 数据类型 1、焊接方法 2、适用类别 3、焊后热处理方法 4、母材钢号 5、母材规格 6、母材类别 7、焊材类别(焊丝、焊条、焊剂金属类别) 8、焊丝型号 9、焊条型号 10、焊剂型号
        /// 11、焊丝牌号 12、焊条牌号 13、焊剂牌号 14、焊丝规格 15、焊条规格 16、焊剂规格 17、焊接方向 18、冷却方法
        /// </summary>
        public virtual string Type
        {
            get { return type; }
            set { type = value; }
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