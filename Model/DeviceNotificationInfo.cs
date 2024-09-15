namespace ProjectMgt.Model
{
    public class DeviceNotificationInfo
    {
        public DeviceNotificationInfo()
        {
        }

        private int id;

        private string userCode;
        private int deviceType;
        private string deviceToken;

        public virtual int ID
        {
            get { return id; }
            set { id = value; }
        }

        public virtual string UserCode
        {
            get { return userCode; }
            set { userCode = value; }
        }

        public virtual int DeviceType
        {
            get { return deviceType; }
            set { deviceType = value; }
        }

        public virtual string DeviceToken
        {
            get { return deviceToken; }
            set { deviceToken = value; }
        }
    }
}