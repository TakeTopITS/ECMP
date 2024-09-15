using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class CameraInfoDAL
    {
        private EntityControl control;

        public CameraInfoDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddCameraInfo(CameraInfo cameraInfo)
        {
            control.AddEntity(cameraInfo);
        }

        public void UpdateCameraInfo(CameraInfo cameraInfo, int ID)
        {
            control.UpdateEntity(cameraInfo, ID);
        }

        public void DeleteCameraInfo(CameraInfo cameraInfo)
        {
            control.DeleteEntity(cameraInfo);
        }

        public IList GetAllCameraInfos(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}