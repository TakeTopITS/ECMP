using System;

namespace ProjectMgt.Model
{
    public class GoodsMTRecord
    {
        public GoodsMTRecord()
        {
        }

        private int id;
        private int goodsID;
        private string goodsCode;
        private string goodsName;
        private string mtManCode;
        private string mtManName;
        private string description;
        private string type;
        private DateTime mtTime;
        private Decimal cost;

        public virtual int ID
        {
            get { return id; }
            set { id = value; }
        }

        public virtual int GoodsID
        {
            get { return goodsID; }
            set { goodsID = value; }
        }

        public virtual string GoodsCode
        {
            get { return goodsCode; }
            set { goodsCode = value; }
        }

        public virtual string GoodsName
        {
            get { return goodsName; }
            set { goodsName = value; }
        }

        public virtual string MTManCode
        {
            get { return mtManCode; }
            set { mtManCode = value; }
        }

        public virtual string MTManName
        {
            get { return mtManName; }
            set { mtManName = value; }
        }

        public virtual string Description
        {
            get { return description; }
            set { description = value; }
        }

        public virtual string Type
        {
            get { return type; }
            set { type = value; }
        }

        public virtual DateTime MTTime
        {
            get { return mtTime; }
            set { mtTime = value; }
        }

        public virtual decimal Cost
        {
            get { return cost; }
            set { cost = value; }
        }
    }
}