using System;

namespace ProjectMgt.Model
{
    public class U8KeyApply_YYUP
    {
        public U8KeyApply_YYUP()
        {
        }

        public virtual int ID { get; set; }
        public virtual string UserCode { get; set; }//用户名
        public virtual string UserName { get; set; }//姓名
        public virtual string DepartCode { get; set; }//部门
        public virtual string DepartName { get; set; }//部门名称
        public virtual string Sex { get; set; }//性别
        public virtual string Phone { get; set; }//电话
        public virtual string Email { get; set; }//邮箱
        public virtual string U8VersionID { get; set; }
        public virtual string U8Version { get; set; }//U8版本
        public virtual string ApplyReason { get; set; }//申请原因
        public virtual DateTime ApplyTime { get; set; }//申请时间
        public virtual string ApproveStatus { get; set; }//审批状态
        public virtual string DepartApproveTime { get; set; }//部门审批时间
        public virtual string DepartApproverCode { get; set; }//部门审批人
        public virtual string DepartApproverName { get; set; }//部门审批人
        public virtual string GroupApproverCode { get; set; }//集团审批人
        public virtual string GroupApproverName { get; set; }//集团审批人
        public virtual string GroupApproveTime { get; set; }//集团审批时间
        public virtual string AssignedAccount { get; set; }//已分配帐号
        public virtual string AssingedPassword { get; set; }//密码
        public virtual string EmailStatus { get; set; }//邮件发送状态
    }
}