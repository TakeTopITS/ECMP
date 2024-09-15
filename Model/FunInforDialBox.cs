using System;

namespace ProjectMgt.Model
{
    public class FunInforDialBox
    {
        public FunInforDialBox()
        {
        }

        private int id;
        private string inforName;
        private string sQLCode;
        private string status;
        private DateTime createTime;
        private string boxType;
        private string userType;
        private string isForceInfor;
        private string linkAddress;
        private string mobileLinkAddress;
        private string isSendMsg;
        private string isSendEmail;
        private int sortNumber;
        private string homeName;
        private string langCode;

        public virtual int ID
        {
            get { return id; }
            set { id = value; }
        }

        public virtual string InforName
        {
            get { return inforName; }
            set { inforName = value; }
        }

        public virtual string SQLCode
        {
            get { return sQLCode; }
            set { sQLCode = value; }
        }

        public virtual string Status
        {
            get { return status; }
            set { status = value; }
        }

        public virtual DateTime CreateTime
        {
            get { return createTime; }
            set { createTime = value; }
        }

        public virtual string BoxType
        {
            get { return boxType; }
            set { boxType = value; }
        }

        public virtual string UserType
        {
            get { return userType; }
            set { userType = value; }
        }

        public virtual string IsForceInfor
        {
            get { return isForceInfor; }
            set { isForceInfor = value; }
        }

        public virtual string LinkAddress
        {
            get { return linkAddress; }
            set { linkAddress = value; }
        }

        public virtual string MobileLinkAddress
        {
            get { return mobileLinkAddress; }
            set { mobileLinkAddress = value; }
        }

        public virtual string IsSendMsg
        {
            get { return isSendMsg; }
            set { isSendMsg = value; }
        }

        public virtual string IsSendEmail
        {
            get { return isSendEmail; }
            set { isSendEmail = value; }
        }

        public virtual int SortNumber
        {
            get { return sortNumber; }
            set { sortNumber = value; }
        }

        public virtual string HomeName
        {
            get { return homeName; }
            set { homeName = value; }
        }

        public virtual string LangCode
        {
            get { return langCode; }
            set { langCode = value; }
        }
    }
}