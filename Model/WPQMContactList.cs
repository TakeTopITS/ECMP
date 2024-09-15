using System;

namespace ProjectMgt.Model
{
    /// <summary>
    /// 联络单
    /// </summary>
    public class WPQMContactList
    {
        public WPQMContactList()
        {
        }

        public virtual int ID { get; set; }

        /// <summary>
        /// 焊接工艺评定编码
        /// </summary>
        public virtual string WeldProCode { get; set; }

        /// <summary>
        /// 联络单委托人
        /// </summary>
        public virtual string ContactClient { get; set; }

        /// <summary>
        /// 联络单委托日期
        /// </summary>
        public virtual DateTime CommissionedDate { get; set; }

        /// <summary>
        /// 组对形式
        /// </summary>
        public virtual string GroupForm { get; set; }

        /// <summary>
        /// 外观检验
        /// </summary>
        public virtual string VisualInspection { get; set; }

        /// <summary>
        /// 机械性能要求
        /// </summary>
        public virtual string MechanicalPerReq { get; set; }

        /// <summary>
        /// 机械化程度
        /// </summary>
        public virtual string MechanizationDegree { get; set; }

        /// <summary>
        /// 执行标准
        /// </summary>
        public virtual string ExecutionStandard { get; set; }

        /// <summary>
        /// 其他性能要求
        /// </summary>
        public virtual string OtherPerReq { get; set; }

        /// <summary>
        /// 联络单备注
        /// </summary>
        public virtual string ContactNote { get; set; }

        /// <summary>
        /// 联络单联系人及电话
        /// </summary>
        public virtual string ContactPersonTel { get; set; }

        /// <summary>
        /// 任务发送单位
        /// </summary>
        public virtual string TaskSendUnit { get; set; }

        /// <summary>
        /// 任务接收单位
        /// </summary>
        public virtual string TaskReceiveUnit { get; set; }

        /// <summary>
        /// 任务发送单位联系人
        /// </summary>
        public virtual string SendPerson { get; set; }

        /// <summary>
        /// 任务接收单位联系人
        /// </summary>
        public virtual string ReceivePerson { get; set; }

        /// <summary>
        /// 联络单日期
        /// </summary>
        public virtual DateTime ContactDate { get; set; }

        /// <summary>
        /// 创建者编码
        /// </summary>
        public virtual string EnterCode { get; set; }
    }
}