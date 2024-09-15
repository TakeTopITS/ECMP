using System;

namespace ProjectMgt.Model
{
    public class U9Problem_YYUP
    {
        public U9Problem_YYUP()
        {
        }

        public virtual int ID { get; set; }
        public virtual string ProblemCode { get; set; }//问题号
        public virtual string DepartCode { get; set; }//部门
        public virtual string DepartName { get; set; }//部门名称
        public virtual int ProjectMainID { get; set; }//主项目ID
        public virtual string ProjectMainName { get; set; }//主项目名称
        public virtual string IsCheck { get; set; }//是否验收
        public virtual string CustomName { get; set; }//客户名称
        public virtual string CustomStatus { get; set; }//客户状态
        public virtual string SampleCustom { get; set; }//样板客户
        public virtual string CompanyNature { get; set; }//企业性质
        public virtual string Regional { get; set; }//大区
        public virtual string ChildCompany { get; set; }//分公司
        public virtual string MainDegree { get; set; }//重要程度
        public virtual DateTime PlanStartTime { get; set; }//预计开始时间
        public virtual DateTime PlanEndTime { get; set; }//预计结束时间
        public virtual string ProductID { get; set; }//产品
        public virtual string Product { get; set; }//产品
        public virtual string SubordinateIndustry { get; set; }//所属行业
        public virtual string ProjectMangerCode { get; set; }//项目经理
        public virtual string ProjectMangerName { get; set; }//项目经理
        public virtual string Phone { get; set; }//电话
        public virtual string Email { get; set; }//电子邮件
        public virtual string StrStatus { get; set; }//状态
        public virtual DateTime CreateTime { get; set; }//提交时间
        public virtual string UserCode { get; set; }    //提交人
        public virtual string UserName { get; set; }
        public virtual string ProblemGuid { get; set; }//
        public virtual string ReturnValue { get; set; }//接口返回值
        public virtual string CustomerServiceCode { get; set; }//客户识别码
        public virtual string CustomerServicePass { get; set; }//客户服务识别密码

        public virtual string ProblemTitle { get; set; }//问题标题
        public virtual string EmergencyDegreeID { get; set; }//紧急程度ID
        public virtual string EmergencyDegree { get; set; }//紧急程度
        public virtual string ProblemAttributeID { get; set; }//问题属性ID
        public virtual string ProblemAttribute { get; set; }//问题属性
        public virtual string ProductLineID { get; set; }//产品线ID
        public virtual string ProductLine { get; set; }//产品线
        public virtual string ProblemModuleID { get; set; }//问题模块ID
        public virtual string ProblemModule { get; set; }//问题模块
        public virtual string ProductVersionID { get; set; }//产品版本ID
        public virtual string ProductVersion { get; set; }//产品版本
        public virtual string DatabaseTypeID { get; set; }//数据库类型ID
        public virtual string DatabaseType { get; set; }//数据库类型
        public virtual string ContactCode { get; set; }//联系人代码
        public virtual string ContactName { get; set; }//联系人
        public virtual string ContactPhone { get; set; }//联系电话
        public virtual string ContactEmail { get; set; }//电子邮件
        public virtual string ProblemDesc { get; set; }//问题描述
        public virtual string ProblemFileName { get; set; }//问题附件
        public virtual string ProblemFileUrl { get; set; }//问题附件URL
        public virtual string ApproveMark { get; set; }//审批标志
    }
}