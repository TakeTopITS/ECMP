using System;

namespace ProjectMgt.Model
{
    public class CarOilTypeRecord
    {
        public CarOilTypeRecord()
        {
        }

        private string carno;
        private int oiltypeid;
        private string depatcode;
        private decimal oilnum;
        private decimal oilprice;
        private decimal oilmoney;
        private DateTime createtime;
        private string oilname;
        private string type;
        private int id;

        public virtual DateTime CreateTime
        {
            get { return createtime; }
            set { createtime = value; }
        }

        public virtual decimal OilMoney
        {
            get { return oilmoney; }
            set { oilmoney = value; }
        }

        public virtual decimal OilPrice
        {
            get { return oilprice; }
            set { oilprice = value; }
        }

        public virtual decimal OilNum
        {
            get { return oilnum; }
            set { oilnum = value; }
        }

        public virtual string DepartCode
        {
            get { return depatcode; }
            set { depatcode = value; }
        }

        public virtual int OilTypeId
        {
            get { return oiltypeid; }
            set { oiltypeid = value; }
        }

        public virtual string CarNo
        {
            get { return carno; }
            set { carno = value; }
        }

        public virtual string OilName
        {
            get { return oilname; }
            set { oilname = value; }
        }

        public virtual string Type
        {
            get { return type; }
            set { type = value; }
        }

        public virtual int ID
        {
            get { return id; }
            set { id = value; }
        }
    }
}