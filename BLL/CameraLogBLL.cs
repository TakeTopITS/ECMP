using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class CameraLogBLL
    {
        public void AddCameraLog(CameraLog cameraLog)
        {
            CameraLogDAL dal = new CameraLogDAL();
            dal.AddCameraLog(cameraLog);
        }

        public void UpdateCameraLog(CameraLog cameraLog, int ID)
        {
            CameraLogDAL dal = new CameraLogDAL();
            dal.UpdateCameraLog(cameraLog, ID);
        }

        public void DeleteCameraLog(CameraLog cameraLog)
        {
            CameraLogDAL dal = new CameraLogDAL();
            dal.DeleteCameraLog(cameraLog);
        }

        public IList GetAllCameraLogs(string strHQL)
        {
            CameraLogDAL dal = new CameraLogDAL();
            return dal.GetAllCameraLogs(strHQL);
        }
    }
}