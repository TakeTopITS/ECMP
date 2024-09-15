using System; using System.Resources;
using System.Data;
using System.Configuration;
using System.Drawing;

using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

using ProjectMgt.Model;
using ProjectMgt.DAL;
using ProjectMgt.BLL;

public partial class TTAssetInforView : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string strHQL;
        IList lst;
      
        string strUserName;
        string strUserCode = Session["UserCode"].ToString();


        string strAssetID = Request.QueryString["AssetID"];
        string strAssetCode = Request.QueryString["AssetCode"];
      

        LB_UserCode.Text = strUserCode;
        strUserName = Session["UserName"].ToString();
        LB_UserName.Text = strUserName;

        if (Page.IsPostBack != true)
        {
            if (strAssetID != null)
            {
                strHQL = "from Asset as asset where asset.ID = " + strAssetID;
            }
            else
            {
                strHQL = "from Asset as asset where asset.AssetCode = " + "'" + strAssetCode + "'";
            }

            AssetBLL assetBLL = new AssetBLL();
            lst = assetBLL.GetAllAssets(strHQL);

            Asset asset = (Asset)lst[0];

            //this.Title = "资产：" + asset.AssetCode + " " + asset.AssetName + " 资料！";

            DataList1.DataSource = lst;
            DataList1.DataBind();
        }
    }

    protected string GetUserName(string strUserCode)
    {
        string strUserName, strHQL;

        strHQL = " from ProjectMember as projectMember where projectMember.UserCode = " + "'" + strUserCode + "'";
        ProjectMemberBLL projectMemberBLL = new ProjectMemberBLL();
        IList lst = projectMemberBLL.GetAllProjectMembers(strHQL);
        ProjectMember projectMember = (ProjectMember)lst[0];
        strUserName = projectMember.UserName;
        return strUserName.Trim();
    }
}
