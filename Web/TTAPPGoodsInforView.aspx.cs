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

public partial class TTAPPGoodsInforView : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string strHQL;
        IList lst;

        string strUserName;
        string strUserCode = Session["UserCode"].ToString();


        string strGoodsID = Request.QueryString["GoodsID"];
        string strGoodsCode = Request.QueryString["GoodsCode"];

        strUserCode = Session["UserCode"].ToString();
        strUserName = Session["UserName"].ToString();
        LB_UserCode.Text = strUserCode;
        LB_UserName.Text = strUserName;

        if (Page.IsPostBack != true)
        {
            if (strGoodsID != null)
            {
                strHQL = "from Goods as goods where goods.ID = " + strGoodsID;
            }
            else
            {
                strHQL = "from Goods as goods where goods.GoodsCode = " + "'" + strGoodsCode + "'";
            }

            GoodsBLL goodsBLL = new GoodsBLL();
            lst = goodsBLL.GetAllGoodss(strHQL);

            Goods goods = (Goods)lst[0];

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
