using System;

namespace ProjectMgt.Model
{
    /// <summary>
    /// 项目成员人力计划标准
    /// </summary>
    public class ProjectMemberScheduleBase
    {
        public ProjectMemberScheduleBase()
        {
        }

        public virtual int ID { get; set; }

        /// <summary>
        /// 项目ID
        /// </summary>
        public virtual int ProjectID { get; set; }

        /// <summary>
        /// 工种
        /// </summary>
        public virtual string WorkType { get; set; }

        /// <summary>
        /// 年月
        /// </summary>
        public virtual DateTime YearMonth { get; set; }

        /// <summary>
        /// 工时基础
        /// </summary>
        public virtual decimal NumberAll { get; set; }

        /// <summary>
        /// 备注说明
        /// </summary>
        public virtual string Remark { get; set; }

        /// <summary>
        /// 创建者编码
        /// </summary>
        public virtual string EnterCode { get; set; }

        /// <summary>
        /// 周数
        /// </summary>
        public virtual int WeekNum { get; set; }

        /// <summary>
        /// 人力子组
        /// </summary>
        public virtual string HumanSubgroups { get; set; }
    }
}