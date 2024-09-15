using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class CameraListDAL
    {
        private EntityControl control;

        public CameraListDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddCameraList(CameraList cameraList)
        {
            control.AddEntity(cameraList);
        }

        public void UpdateCameraList(CameraList cameraList, int ID)
        {
            control.UpdateEntity(cameraList, ID);
        }

        public void DeleteCameraList(CameraList cameraList)
        {
            control.DeleteEntity(cameraList);
        }

        public IList GetAllCameraLists(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}