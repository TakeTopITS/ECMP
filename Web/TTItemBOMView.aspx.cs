using System;
using System.Resources;
using System.Drawing;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;


using System.Data.SqlClient;

using NickLee.Views.Web.UI;
using NickLee.Views.Windows.Forms.Printing;

using ProjectMgt.Model;
using ProjectMgt.DAL;
using ProjectMgt.BLL;

public partial class TTItemBOMView : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string strHQL;
        string strItemCode, strRelatedType, strRelatedID;


        strItemCode = Request.QueryString["ItemCode"];
        strRelatedType  = Request.QueryString["RelatedType"];
        strRelatedID = Request.QueryString["RelatedID"];

        string strUserCode = Session["UserCode"].ToString();if (Page.IsPostBack != true)
        {
            LB_ProductName.Text = Resources.lang.ChanPing + Resources.lang.MingCheng + ":" + ShareClass.GetItemName(strRelatedType) + "                 " + Resources.lang.ChanPinBianHao + ":" + strRelatedType;

            strHQL = "Select ItemCode ,ItemName  ,Type ,ModelNumber,Specification ,Brand,Number ,Unit ,''as Comment From T_ItemRelatedOrderBomToExpendDetailData Where RelatedType = " + "'" + strRelatedType + "'" + " and RelatedID = " + strRelatedID;
            strHQL += " Order By OrderTime DESC";
            DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_ItemRelatedOrderBomToExpendDetailData");
            DataGrid1.DataSource = ds;
            DataGrid1.DataBind();
        }
    }
}


