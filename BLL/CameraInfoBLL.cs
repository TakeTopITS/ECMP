using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class CameraInfoBLL
    {
        public void AddCameraInfo(CameraInfo cameraInfo)
        {
            CameraInfoDAL dal = new CameraInfoDAL();
            dal.AddCameraInfo(cameraInfo);
        }

        public void UpdateCameraInfo(CameraInfo cameraInfo, int ID)
        {
            CameraInfoDAL dal = new CameraInfoDAL();
            dal.UpdateCameraInfo(cameraInfo, ID);
        }

        public void DeleteCameraInfo(CameraInfo cameraInfo)
        {
            CameraInfoDAL dal = new CameraInfoDAL();
            dal.DeleteCameraInfo(cameraInfo);
        }

        public IList GetAllCameraInfos(string strHQL)
        {
            CameraInfoDAL dal = new CameraInfoDAL();
            return dal.GetAllCameraInfos(strHQL);
        }
    }
}