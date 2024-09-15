using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class CameraLogDAL
    {
        private EntityControl control;

        public CameraLogDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddCameraLog(CameraLog cameraLog)
        {
            control.AddEntity(cameraLog);
        }

        public void UpdateCameraLog(CameraLog cameraLog, int ID)
        {
            control.UpdateEntity(cameraLog, ID);
        }

        public void DeleteCameraLog(CameraLog cameraLog)
        {
            control.DeleteEntity(cameraLog);
        }

        public IList GetAllCameraLogs(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}