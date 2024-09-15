using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class DeviceNotificationInfoBLL
    {
        public void AddDeviceNotificationInfo(DeviceNotificationInfo deviceNotificationInfo)
        {
            DeviceNotificationInfoDAL dal = new DeviceNotificationInfoDAL();
            dal.AddDeviceNotificationInfo(deviceNotificationInfo);
        }

        public void UpdateDeviceNotificationInfo(DeviceNotificationInfo deviceNotificationInfo, int ID)
        {
            DeviceNotificationInfoDAL dal = new DeviceNotificationInfoDAL();
            dal.UpdateDeviceNotificationInfo(deviceNotificationInfo, ID);
        }

        public void DeleteDeviceNotificationInfo(DeviceNotificationInfo deviceNotificationInfo)
        {
            DeviceNotificationInfoDAL dal = new DeviceNotificationInfoDAL();
            dal.DeleteDeviceNotificationInfo(deviceNotificationInfo);
        }

        public IList GetAllDeviceNotificationInfos(string strHQL)
        {
            DeviceNotificationInfoDAL dal = new DeviceNotificationInfoDAL();
            return dal.GetAllDeviceNotificationInfos(strHQL);
        }
    }
}