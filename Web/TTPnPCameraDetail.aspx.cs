using System;
using System.Resources;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using ProjectMgt.BLL;
using ProjectMgt.Model;

public partial class TTPnPCameraDetail : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string strUserCode = Session["UserCode"].ToString();
        string strUserName = ShareClass.GetUserName(strUserCode);

        ProjectMemberBLL projectMemberBLL = new ProjectMemberBLL();
        Label1.Text = ShareClass.GetPageTitle(this.GetType().BaseType.Name + ".aspx"); bool blVisible = TakeTopSecurity.TakeTopLicense.GetAuthobility(this.GetType().BaseType.Name + ".aspx", strUserCode);  //bool blVisible = TakeTopSecurity.TakeTopLicense.GetAuthobility(this.GetType().BaseType.Name + ".aspx", "库存管理", strUserCode);
        if (blVisible == false)
        {
            Response.Redirect("TTDisplayErrors.aspx");
            return;
        }

        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "clickA", "aHandler();", true); if (!IsPostBack)
        {
            TakeTopCore.CoreShareClass.InitialAllDepartmentTree( Resources.lang.ZZJGT,TV_DepartMent);
            string strDepartString = TakeTopCore.CoreShareClass.InitialDepartmentTreeByAuthoritySuperUser(Resources.lang.ZZJGT,TV_Organization, strUserCode);
        }
    }

    private void DataBindCameraInfo(string strForeignID, string strType)
    {
        string strCameraInfoHQL = string.Format(@"select TypeName = (case when i.CameraType = 1 then '组织架构部'
			                    when i.CameraType = 2 then '项目部'
			                    end )
                                ,DPName = (case when i.CameraType = 1 then d.DepartName
			                                when i.CameraType = 2 then p.ProjectName
			                                end )
                                ,i.CameraName,i.ServerIP,i.CameraUserName,
                                i.CameraPass,i.CreatorName,i.CreateTime,i.ID,i.CameraType from T_CameraInfo i 
                                left join T_Department d on i.ForeignID = d.DepartCode and i.CameraType = 1
                                left join T_Project p on i.ForeignID = cast( p.ProjectID as varchar(50)) and i.CameraType = 2
                                where i.ForeignID = '{0}'
                                order by i.CreateTime desc", strForeignID);
        DataTable dtCameraInfo = ShareClass.GetDataSetFromSql(strCameraInfoHQL, "strCameraInfoHQL").Tables[0];
        if (strType == "depart")
        {


            DG_Department.DataSource = dtCameraInfo;
            DG_Department.DataBind();
        }
        else
        {

            DG_Organization.DataSource = dtCameraInfo;
            DG_Organization.DataBind();
        }
    }

    protected void TV_DepartMent_SelectedNodeChanged(object sender, EventArgs e)
    {
        string selectAreaNode = TV_DepartMent.SelectedNode.Value;
        if (!string.IsNullOrEmpty(selectAreaNode))
        {
            string strForeignID = TV_DepartMent.SelectedNode.Target;
            DataBindCameraInfo(strForeignID, "depart");
        }
    }


    protected void TV_Organization_SelectedNodeChanged(object sender, EventArgs e)
    {
        string selectAreaNode = TV_Organization.SelectedNode.Value;
        if (!string.IsNullOrEmpty(selectAreaNode))
        {
            string strForeignID = TV_Organization.SelectedNode.Target;
            DataBindCameraInfo(strForeignID, "organization");
        }
    }
}