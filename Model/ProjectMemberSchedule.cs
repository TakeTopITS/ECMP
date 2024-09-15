using System;

namespace ProjectMgt.Model
{
    /// <summary>
    /// 项目成员人力计划排定
    /// </summary>
    public class ProjectMemberSchedule
    {
        public ProjectMemberSchedule()
        {
        }

        public virtual int ID { get; set; }

        /// <summary>
        /// 项目ID
        /// </summary>
        public virtual int ProjectID { get; set; }

        /// <summary>
        /// 项目成员编码
        /// </summary>
        public virtual string UserCode { get; set; }

        /// <summary>
        /// 项目成员姓名
        /// </summary>
        public virtual string UserName { get; set; }

        /// <summary>
        /// 年月
        /// </summary>
        public virtual DateTime YearMonth { get; set; }

        /// <summary>
        /// 工时使用
        /// </summary>
        public virtual decimal NumberUsed { get; set; }

        /// <summary>
        /// 备注说明
        /// </summary>
        public virtual string Remark { get; set; }

        /// <summary>
        /// 工种
        /// </summary>
        public virtual string WorkType { get; set; }

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