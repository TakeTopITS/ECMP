using System;

namespace ProjectMgt.Model
{
    /// <summary>
    /// 供应商评价分析
    /// </summary>
    public class BMSupplierAnaly
    {
        public BMSupplierAnaly()
        {
        }

        private int id;

        /// <summary>
        /// 自增ID
        /// </summary>
        public virtual int ID
        {
            get { return id; }
            set { id = value; }
        }

        private string supplierCode;

        /// <summary>
        /// 供应商编码
        /// </summary>
        public virtual string SupplierCode
        {
            get { return supplierCode; }
            set { supplierCode = value; }
        }

        private decimal point;

        /// <summary>
        /// 考核分
        /// </summary>
        public virtual decimal Point
        {
            get { return point; }
            set { point = value; }
        }

        private string remark;

        /// <summary>
        /// 评价分析
        /// </summary>
        public virtual string Remark
        {
            get { return remark; }
            set { remark = value; }
        }

        private DateTime createTime;

        /// <summary>
        /// 评价时间
        /// </summary>
        public virtual DateTime CreateTime
        {
            get { return createTime; }
            set { createTime = value; }
        }

        private string createrCode;

        /// <summary>
        /// 创建者编码
        /// </summary>
        public virtual string CreaterCode
        {
            get { return createrCode; }
            set { createrCode = value; }
        }

        private string createrName;

        /// <summary>
        /// 创建者名称
        /// </summary>
        public virtual string CreaterName
        {
            get { return createrName; }
            set { createrName = value; }
        }

        private string evaluateProject;

        /// <summary>
        /// 考核项目
        /// </summary>
        public virtual string EvaluateProject
        {
            get { return evaluateProject; }
            set { evaluateProject = value; }
        }

        private DateTime startTime;

        /// <summary>
        /// 考核开始期
        /// </summary>
        public virtual DateTime StartTime
        {
            get { return startTime; }
            set { startTime = value; }
        }

        private DateTime endTime;

        /// <summary>
        /// 考核结束期
        /// </summary>
        public virtual DateTime EndTime
        {
            get { return endTime; }
            set { endTime = value; }
        }

        private decimal basePoint;

        /// <summary>
        /// 标准分
        /// </summary>
        public virtual decimal BasePoint
        {
            get { return basePoint; }
            set { basePoint = value; }
        }
    }
}