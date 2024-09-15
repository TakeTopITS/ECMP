using System;
using System.Resources;
using System.Drawing;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Collections.Generic;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.IO;

using System.Security.Cryptography;
using System.Security.Permissions;
using System.Data.SqlClient;

using System.ComponentModel;
using System.Web.SessionState;
using System.Drawing.Imaging;

using ZedGraph;
using ZedGraph.Web;

using ProjectMgt.Model;
using ProjectMgt.DAL;
using ProjectMgt.BLL;


public partial class TTAPPNews : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string strUserCode, strUserName;

        strUserCode = Session["UserCode"].ToString();
        strUserName = Session["UserName"].ToString();

        LB_UserCode.Text = strUserCode;
        LB_UserName.Text = strUserName;

        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "clickA", "SetDataGridTrClickLink();", true);
        if (Page.IsPostBack != true)
        {
            LoadHeadLine(strUserCode);
        }
    }

    protected void DataGrid1_PageIndexChanged(object sender, DataGridPageChangedEventArgs e)
    {
        DataGrid1.CurrentPageIndex = e.NewPageIndex;

        string strHQL;
        string strUserCode, strDepartCode, strNewsID;

        strUserCode = LB_UserCode.Text.Trim();
        strDepartCode = ShareClass.GetDepartCodeFromUserCode(strUserCode);

        strHQL = LB_Sql1.Text;
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_HeadLine");

        DataGrid1.DataSource = ds;
        DataGrid1.DataBind();

        for (int i = 0; i < DataGrid1.Items.Count; i++)
        {
            strNewsID = ds.Tables[0].Rows[i]["ID"].ToString();

            if (checkNewsIsReaded(strUserCode, strNewsID) > 0)
            {
                DataGrid1.Items[i].ForeColor = Color.Black;
            }
            else
            {
                DataGrid1.Items[i].ForeColor = Color.Red;
            }
        }
    }

    protected void LoadHeadLine(string strUserCode)
    {
        string strHQL;
        string strDepartCode, strNewsID;

        string strUserType = ShareClass.GetUserType(strUserCode);
        if (strUserType == "OUTER")
        {
            strUserType = "外部";
        }
        else
        {
            strUserType = "内部";
        }

        strDepartCode = ShareClass.GetDepartCodeFromUserCode(strUserCode);

        strHQL = "Select ID,Title,Content,RelatedDepartName,PublisherCode,PublisherName,PublishTime,'*' as Mark From T_HeadLine ";
        strHQL += " Where (RelatedDepartCode in (select ParentDepartCode from F_GetParentDepartCode(" + "'" + strDepartCode + "'" + "))  or RelatedDepartCode = '" + strDepartCode + "')";
        strHQL += " And Type = " + "'" + strUserType + "'" + " and Status = '发布' Order By ID DESC";
        DataSet ds = ShareClass.GetDataSetFromSqlNOOperateLog(strHQL, "T_HeadLine");

        DataGrid1.DataSource = ds;
        DataGrid1.DataBind();

        for (int i = 0; i < DataGrid1.Items.Count; i++)
        {
            strNewsID = ds.Tables[0].Rows[i]["ID"].ToString();

            if (checkNewsIsReaded(strUserCode, strNewsID) > 0)
            {
                DataGrid1.Items[i].ForeColor = Color.Black;
            }
            else
            {
                DataGrid1.Items[i].ForeColor = Color.Red;
            }
        }

        LB_Sql1.Text = strHQL;
    }

    protected int checkNewsIsReaded(string strUserCode, string strNewsID)
    {
        string strHQL;

        strHQL = " Select * From T_NewsRelatedUser Where NewsID = " + strNewsID + " and UserCode  = '" + strUserCode + "'";

        DataSet ds = ShareClass.GetDataSetFromSqlNOOperateLog(strHQL, "T_HeadLine");

        return ds.Tables[0].Rows.Count;
    }

}