using System;

namespace ProjectMgt.Model
{
    public class GoodsAdjustRecord
    {
        public GoodsAdjustRecord()
        {
        }

        private int id;
        private int checkInID;
        private int goodsID;
        private string goodsCode;
        private string goodsName;
        private decimal number;
        private string unitName;
        private string type;
        private string modelNumber;
        private string spec;
        private string position;
        private string ip;
        private string ownerCode;
        private string ownerName;
        private decimal price;
        private DateTime buyTime;
        private string manufacturer;
        private string memo;
        private string status;
        private string adjusterCode;
        private string adjusterName;
        private DateTime adjustTime;

        public virtual int ID
        {
            get { return id; }
            set { id = value; }
        }

        public virtual int CheckInID
        {
            get { return checkInID; }
            set { checkInID = value; }
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

        public virtual decimal Number
        {
            get { return number; }
            set { number = value; }
        }

        public virtual string UnitName
        {
            get { return unitName; }
            set { unitName = value; }
        }

        public virtual string Type
        {
            get { return type; }
            set { type = value; }
        }

        public virtual string ModelNumber
        {
            get { return modelNumber; }
            set { modelNumber = value; }
        }

        public virtual string Spec
        {
            get { return spec; }
            set { spec = value; }
        }

        public virtual string Position
        {
            get { return position; }
            set { position = value; }
        }

        public virtual string WHPosition
        {
            get; set;
        }

        public virtual string IP
        {
            get { return ip; }
            set { ip = value; }
        }

        public virtual string OwnerCode
        {
            get { return ownerCode; }
            set { ownerCode = value; }
        }

        public virtual string OwnerName
        {
            get { return ownerName; }
            set { ownerName = value; }
        }

        public virtual decimal Price
        {
            get { return price; }
            set { price = value; }
        }

        public virtual DateTime BuyTime
        {
            get { return buyTime; }
            set { buyTime = value; }
        }

        public virtual string Manufacturer
        {
            get { return manufacturer; }
            set { manufacturer = value; }
        }

        public virtual string Memo
        {
            get { return memo; }
            set { memo = value; }
        }

        public virtual string Status
        {
            get { return status; }
            set { status = value; }
        }

        public virtual string AdjusterCode
        {
            get { return adjusterCode; }
            set { adjusterCode = value; }
        }

        public virtual string AdjusterName
        {
            get { return adjusterName; }
            set { adjusterName = value; }
        }

        public virtual DateTime AdjustTime
        {
            get { return adjustTime; }
            set { adjustTime = value; }
        }
    }
}