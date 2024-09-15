using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class CameraListBLL
    {
        public void AddCameraList(CameraList cameraList)
        {
            CameraListDAL dal = new CameraListDAL();
            dal.AddCameraList(cameraList);
        }

        public void UpdateCameraList(CameraList cameraList, int ID)
        {
            CameraListDAL dal = new CameraListDAL();
            dal.UpdateCameraList(cameraList, ID);
        }

        public void DeleteCameraList(CameraList cameraList)
        {
            CameraListDAL dal = new CameraListDAL();
            dal.DeleteCameraList(cameraList);
        }

        public IList GetAllCameraLists(string strHQL)
        {
            CameraListDAL dal = new CameraListDAL();
            return dal.GetAllCameraLists(strHQL);
        }
    }
}