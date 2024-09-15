using System;
using System.Resources;
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

public partial class TTGoodsInforView : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string strHQL;

        string strUserName;
        string strUserCode = Session["UserCode"].ToString();

        string strGoodsID = Request.QueryString["GoodsID"];
        string strGoodsCode = Request.QueryString["GoodsCode"];

        LB_UserCode.Text = strUserCode;
        strUserName = ShareClass.GetUserName(strUserCode);
        LB_UserName.Text = strUserName;

        if (Page.IsPostBack != true)
        {
            if (strGoodsID != null)
            {
                strHQL = "Select * from T_Goods as goods where goods.ID = " + strGoodsID + " limit 1";
            }
            else
            {
                strHQL = "Select * from T_Goods as goods where goods.GoodsCode = " + "'" + strGoodsCode + "' limit 1";
            }
            DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_Goods");
            DataList1.DataSource = ds;
            DataList1.DataBind();
        }
    }
}
