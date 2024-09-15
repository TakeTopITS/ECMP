using System;

namespace ProjectMgt.Model
{
    public class U8Problem_YYUP
    {
        public U8Problem_YYUP()
        {
        }

        public virtual int ID { get; set; }
        public virtual string ProblemCode { get; set; }//问题号
        public virtual int ProjectMainID { get; set; }//主项目ID
        public virtual string ProjectMainName { get; set; }//主项目名称
        public virtual string ProjectChildName { get; set; }//子项目名称
        public virtual int ProjectChildID { get; set; }//子项目ID

        public virtual string ProductLineID { get; set; }//产品线
        public virtual string ProductLine { get; set; }//产品线
        public virtual string SoftwareSerialNumber { get; set; }//软件产品序列号
        public virtual string BranchCompany { get; set; }//分公司
        public virtual string ProductVersionID { get; set; }//产品版本
        public virtual string ProductVersion { get; set; }//产品版本
        public virtual string FieldID { get; set; }//领域
        public virtual string Field { get; set; }//领域
        public virtual string ProblemModuleID { get; set; }//问题模块ID
        public virtual string ProblemModule { get; set; }//问题模块
        public virtual string DatabaseTypeID { get; set; }//数据库类型
        public virtual string DatabaseType { get; set; }//数据库类型
        public virtual string EmergencyDegreeID { get; set; }//紧急程度
        public virtual string EmergencyDegree { get; set; }//紧急程度
        public virtual string ProblemAttributeID { get; set; }//问题属性
        public virtual string ProblemAttribute { get; set; }//问题属性
        public virtual string ProblemTag { get; set; }//问题标签
        public virtual string HopeSolveTime { get; set; }//期望解决时间
        public virtual string ProblemTitle { get; set; }//问题标题
        public virtual string ProblemDesc { get; set; }//问题描述
        public virtual string ProblemFileName { get; set; }//问题附件
        public virtual string ProblemFileUrl { get; set; }//问题附件URL
        public virtual string UserCode { get; set; }//提交人
        public virtual string UserName { get; set; }
        public virtual string Phone { get; set; }//联系电话
        public virtual string Email { get; set; }//邮件
        public virtual string StrStatus { get; set; }//状态
        public virtual DateTime CreateTime { get; set; }//提交时间
        public virtual string SecondManagerApproval { get; set; }//二线经理审批意见

        public virtual string ApproverCode { get; set; }        //审批人
        public virtual string ApproverName { get; set; }        //审批人名称

        public virtual string ApproveTime { get; set; }//审批时间
        public virtual string SupportSatisfaction { get; set; }//支持满意度情况

        public virtual string ProblemGuid { get; set; }
        public virtual string ReturnValue { get; set; }

        public virtual string CustomerServiceCode { get; set; }
        public virtual string CustomerServicePass { get; set; }
    }
}