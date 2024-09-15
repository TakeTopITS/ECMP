using System;

namespace ProjectMgt.Model
{
    public class DataBaseUpgrate
    {
        public DataBaseUpgrate()
        {
        }

        private int id;
        private string sQLText;
        private string isSucess;
        private DateTime updateTime;

        public virtual int ID
        {
            get { return id; }
            set { id = value; }
        }

        public virtual string SQLText
        {
            get { return sQLText; }
            set { sQLText = value; }
        }

        public virtual string IsSucess
        {
            get { return isSucess; }
            set { isSucess = value; }
        }

        public virtual DateTime UpdateTime
        {
            get { return updateTime; }
            set { updateTime = value; }
        }
    }
}