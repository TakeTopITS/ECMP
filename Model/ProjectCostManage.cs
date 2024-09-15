using System;

namespace ProjectMgt.Model
{
    /// <summary>
    /// 项目成本管理
    /// </summary>
    public class ProjectCostManage
    {
        public ProjectCostManage()
        {
        }

        private int id;
        private int projectID;
        private string code;
        private string name;
        private decimal quantities;
        private string unit;
        private decimal price;
        private decimal total;
        private string remark;
        private string type;
        private string creater;

        public virtual int ID
        {
            get { return id; }
            set { id = value; }
        }

        public virtual int ProjectID
        {
            get { return projectID; }
            set { projectID = value; }
        }

        public virtual string Code
        {
            get { return code; }
            set { code = value; }
        }

        public virtual string Name
        {
            get { return name; }
            set { name = value; }
        }

        public virtual decimal Quantities
        {
            get { return quantities; }
            set { quantities = value; }
        }

        public virtual string Unit
        {
            get { return unit; }
            set { unit = value; }
        }

        public virtual decimal Price
        {
            get { return price; }
            set { price = value; }
        }

        public virtual decimal Total
        {
            get { return total; }
            set { total = value; }
        }

        public virtual string Remark
        {
            get { return remark; }
            set { remark = value; }
        }

        public virtual string Type
        {
            get { return type; }
            set { type = value; }
        }

        public virtual string Creater
        {
            get { return creater; }
            set { creater = value; }
        }

        public virtual DateTime OccurrenceDate
        {
            get;
            set;
        }
    }
}