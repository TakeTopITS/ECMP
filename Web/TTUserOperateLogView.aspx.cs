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


using ProjectMgt.Model;
using ProjectMgt.DAL;
using ProjectMgt.BLL;

public partial class TTUserOperateLogView : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string strUserCode, strUserName;
        string strHQL;
        string strOperateTime;

        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "clickA", "aHandler();", true);
        if (Page.IsPostBack == false)
        {
            try
            {
                strUserCode = Request.QueryString["UserCode"].Trim();
                strUserName = ShareClass.GetUserName(strUserCode);

                strOperateTime = Request.QueryString["OperateTime"].Trim();

                LB_ReportName.Text = Resources.lang.ChengYuan + "： " + strUserCode + " " + strUserName + " " + Resources.lang.CaoZuoRiZhiBaoBiao;

                DLC_BeginDate.Text = DateTime.Now.ToString("yyyy-MM-dd");
                DLC_EndDate.Text = DateTime.Now.ToString("yyyy-MM-dd");

                LB_UserCode.Text = strUserCode;
                LB_UserName.Text = strUserName;

                DLC_BeginDate.Text = DateTime.Parse(strOperateTime).ToString("yyyy-MM-dd");
                DLC_EndDate.Text = DateTime.Parse(strOperateTime).ToString("yyyy-MM-dd");

                strHQL = "Select ID,UserCode,UserName,UserIP,OperateContent,OperateTime From T_UserOperateLog Where UserCode = " + "'" + strUserCode + "'";
                strHQL += " and to_char( OperateTime,'yyyymmdd') = " + "'" + DateTime.Parse(DLC_BeginDate.Text).ToString("yyyyMMdd") + "'";
                strHQL += " Order By ID DESC";
                DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_UserOperateLog");

                DataList1.DataSource = ds;
                DataList1.DataBind();

                LB_QueryScope.Text = Resources.lang.ShiJian + DateTime.Parse(DLC_BeginDate.Text).ToString("yyyyMMdd");
            }
            catch
            {

            }
        }
    }

    protected void BT_AllLog_Click(object sender, EventArgs e)
    {
        string strUserCode;
        string strHQL;


        strUserCode = LB_UserCode.Text.Trim();

        strHQL = "Select ID,UserCode,UserName,UserIP,OperateContent,OperateTime From T_UserOperateLog Where UserCode = " + "'" + strUserCode + "'";
        strHQL += " Order By ID DESC";
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_UserOperateLog");

        DataList1.DataSource = ds;
        DataList1.DataBind();

        LB_QueryScope.Text = Resources.lang.ZZSJSy;
    }


    protected void BT_DateFind_Click(object sender, EventArgs e)
    {
        string strHQL, strUserCode, strStartDate, strEndDate;

        strUserCode = LB_UserCode.Text.Trim();

        strStartDate = DateTime.Parse(DLC_BeginDate.Text).ToString("yyyyMMdd");
        strEndDate = DateTime.Parse(DLC_EndDate.Text).ToString("yyyyMMdd");


        strHQL = "Select ID,UserCode,UserName,UserIP,OperateContent,OperateTime From T_UserOperateLog Where UserCode = " + "'" + strUserCode + "'";
        strHQL += " and to_char( OperateTime,'yyyymmdd') >= " + "'" + strStartDate + "'" + " and to_char( OperateTime,'yyyymmdd') <= " + "'" + strEndDate + "'";
        strHQL += " Order By ID DESC";

        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_UserOperateLog");

        DataList1.DataSource = ds;
        DataList1.DataBind();


        LB_QueryScope.Text = Resources.lang.KaiShiRiQi + ":" + strStartDate + Resources.lang.JieShuRiQi + ":" + strEndDate;
    }

}
