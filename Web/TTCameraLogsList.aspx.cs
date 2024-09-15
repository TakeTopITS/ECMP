
using System;
using System.Resources;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

using ProjectMgt.BLL;


public partial class TTCameraLogsList : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
         string strUserCode = Session["UserCode"].ToString();

        ProjectMemberBLL projectMemberBLL = new ProjectMemberBLL();
        Label1.Text = ShareClass.GetPageTitle(this.GetType().BaseType.Name + ".aspx"); bool blVisible = TakeTopSecurity.TakeTopLicense.GetAuthobility(this.GetType().BaseType.Name + ".aspx", strUserCode);
        if (blVisible == false)
        {
            Response.Redirect("TTDisplayErrors.aspx");
            return;
        }

        if (!IsPostBack)
        {
            BindCameraLogData();
        }
    }

    private void BindCameraLogData()
    {
        CameraLogBLL cameraLogBLL = new CameraLogBLL();
        string strCameraSql = "Select B.Area,B.ProjectDepartment,A.ServerIP,A.CreatorName,A.CreateTime From T_CameraLog A, T_CameraList B";
        strCameraSql += " Where A.CameraID = B.ID";
        strCameraSql += " Order By A.CreateTime DESC";
        DataSet ds = ShareClass.GetDataSetFromSql(strCameraSql, "T_Camera");

        DG_CameraLogList.DataSource = ds;
        DG_CameraLogList.DataBind();
    }
}