using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class DeviceNotificationInfoDAL
    {
        private EntityControl control;

        public DeviceNotificationInfoDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddDeviceNotificationInfo(DeviceNotificationInfo deviceNotificationInfo)
        {
            control.AddEntity(deviceNotificationInfo);
        }

        public void UpdateDeviceNotificationInfo(DeviceNotificationInfo deviceNotificationInfo, int ID)
        {
            control.UpdateEntity(deviceNotificationInfo, ID);
        }

        public void DeleteDeviceNotificationInfo(DeviceNotificationInfo deviceNotificationInfo)
        {
            control.DeleteEntity(deviceNotificationInfo);
        }

        public IList GetAllDeviceNotificationInfos(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}