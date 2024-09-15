using System;

namespace ProjectMgt.Model
{
    public class AssetUserRecord
    {
        public AssetUserRecord()
        {
        }

        private int id;
        private int assetID;
        private string assetCode;
        private string userCode;
        private string userName;
        private string type;
        private DateTime beginUseTime;
        private DateTime endUseTime;
        private decimal number;
        private string position;

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

        public virtual string UserCode
        {
            get { return userCode; }
            set { userCode = value; }
        }

        public virtual string UserName
        {
            get { return userName; }
            set { userName = value; }
        }

        public virtual string Type
        {
            get { return type; }
            set { type = value; }
        }

        public virtual DateTime BeginUseTime
        {
            get { return beginUseTime; }
            set { beginUseTime = value; }
        }

        public virtual DateTime EndUseTime
        {
            get { return endUseTime; }
            set { endUseTime = value; }
        }

        public virtual decimal Number
        {
            get { return number; }
            set { number = value; }
        }

        public virtual string Position
        {
            get { return position; }
            set { position = value; }
        }
    }
}