using System;

namespace ProjectMgt.Model
{
    public class AssetMTRecord
    {
        public AssetMTRecord()
        {
        }

        private int id;
        private int assetID;
        private string assetCode;
        private string assetName;
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

        public virtual int AssetID
        {
            get { return assetID; }
            set { assetID = value; }
        }

        public virtual string AssetCode
        {
            get { return assetCode; }
            set { assetCode = value; }
        }

        public virtual string AssetName
        {
            get { return assetName; }
            set { assetName = value; }
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