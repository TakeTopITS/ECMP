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

using System.Text;
using System.IO;
using System.Web.Mail;

using System.Data.SqlClient;

using ProjectMgt.Model;
using ProjectMgt.DAL;
using ProjectMgt.BLL;


public partial class TTSystemExchangeRunning : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string strUserCode = Session["UserCode"].ToString();

        ProjectMemberBLL projectMemberBLL = new ProjectMemberBLL();
        Label1.Text = ShareClass.GetPageTitle(this.GetType().BaseType.Name + ".aspx"); bool blVisible = TakeTopSecurity.TakeTopLicense.GetAuthobility(this.GetType().BaseType.Name + ".aspx", strUserCode);  //Label1.Text = ShareClass.GetPageTitle(this.GetType().BaseType.Name + ".aspx"); bool blVisible = TakeTopSecurity.TakeTopLicense.GetAuthobility(this.GetType().BaseType.Name + ".aspx", "数据交换服务启动", strUserCode);
        if (blVisible == false)
        {
            Response.Redirect("TTDisplayErrors.aspx");
            return;
        }

        int intIntervalTime;

        intIntervalTime = int.Parse((NB_IntervalTime.Amount * 1000).ToString());
        Timer1.Interval = intIntervalTime;

        if (Page.IsPostBack == false)
        {
            ConnectAndLoginDBServer();

            LoadSystemExchangeRecord();
        }
    }

    protected void Timer1_Tick(object sender, EventArgs e)
    {
        string strHQL;

        string strSqlOrderString, strDBServerName;

        strHQL = "Select SqlOrderString,DBServerName From T_SystemExchangeOrder Where Status = '在用' Order By ID DESC";
        DataSet ds = ShareClass.GetDataSetFromSqlNOOperateLog(strHQL, "T_SystemExchangeOrder");

        for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
        {
            strSqlOrderString = ds.Tables[0].Rows[i][0].ToString();
            strDBServerName = ds.Tables[0].Rows[i][1].ToString();

            try
            {
                ShareClass.RunSqlCommandForNOOperateLog(strSqlOrderString);

                strHQL = "Insert into T_SystemExchangeRecord(DBServerName,SqlOrderString,Runtime) values (" + "'" + strDBServerName + "'" + "," + "'" + strSqlOrderString + "'" + ",now())";
                ShareClass.RunSqlCommandForNOOperateLog(strHQL);

                LoadSystemExchangeRecord();
            }
            catch
            {
            }
        }
    }

    protected void ConnectAndLoginDBServer()
    {
        string strHQL;

        string strDBServerName, strConnectString, strLoginString;
        string strDropLoginString, strDropServerString;

        strHQL = "Select DBServerName, ConnectString,LoginString From T_SystemExchangeDBServer Where Status = '在用'";
        DataSet ds = ShareClass.GetDataSetFromSqlNOOperateLog(strHQL, "T_SystemExchangeDBServer");

        for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
        {
            strDBServerName = ds.Tables[0].Rows[i][0].ToString().Trim();
            strConnectString = ds.Tables[0].Rows[i][1].ToString().Trim();
            strLoginString = ds.Tables[0].Rows[i][2].ToString().Trim();

            strDropLoginString = "Exec sp_droplinkedsrvlogin " + strDBServerName + ",Null";
            strDropServerString = "Exec sp_dropserver " + strDBServerName;

            try
            {
                ShareClass.RunSqlCommand(strDropLoginString);
                ShareClass.RunSqlCommand(strDropServerString);

                ShareClass.RunSqlCommandForNOOperateLog(strConnectString);
                ShareClass.RunSqlCommandForNOOperateLog(strLoginString);
            }
            catch
            {
            }
        }
    }

    protected void LoadSystemExchangeRecord()
    {
        string strHQL;

        strHQL = "Select ID,DBServerName,SqlOrderString,RunTime,IdentifyString,ExportDataFile From T_SystemExchangeRecord";
        strHQL += " Order By ID DESC limit 30";
  
        DataSet ds = ShareClass.GetDataSetFromSqlNOOperateLog(strHQL, "T_SystemExchangeRecord");

        DataList1.DataSource = ds;
        DataList1.DataBind();
    }

}