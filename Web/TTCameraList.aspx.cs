using ProjectMgt.BLL;
using ProjectMgt.Model;
using System; using System.Resources;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class TTCameraList : System.Web.UI.Page
{
    public IList CameraListCollect
    {
        get;
        set;
    }


    protected void Page_Load(object sender, EventArgs e)
    {
         if (!IsPostBack)
        {

            CameraListBLL cameraListBLL = new CameraListBLL();
            string strCameraSql = "from CameraList as cameraList";
            CameraListCollect = cameraListBLL.GetAllCameraLists(strCameraSql);
        }
    }


    //private void InsertCameraLog()
    //{
    //    CameraLog cameraLog = new CameraLog();
    //    cameraLog.ServerIP = strIP;
    //    cameraLog.ServerPort = strServerPort;
    //    cameraLog.ServerChannel = strChannel;
    //    cameraLog.CameraName = strCameraName;
    //    cameraLog.CreatorCode = Session["UserCode"] == null ? "" : Session["UserCode"].ToString().Trim();
    //    cameraLog.CreatorName = Session["UserName"] == null ? "" : Session["UserName"].ToString();
    //    cameraLog.CreateTime = DateTime.Now;
    //    cameraLog.Description = "查看";
    //    CameraLogBLL cameraLogBLL = new CameraLogBLL();
    //    cameraLogBLL.AddCameraLog(cameraLog);
    //}
}