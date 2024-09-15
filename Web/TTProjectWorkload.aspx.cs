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

using TakeTopSecurity;

public partial class TTProjectWorkload : System.Web.UI.Page
{
    string strIsMobileDevice, strProjectID;
    string strLangCode;

    protected void Page_Load(object sender, EventArgs e)
    {
        string strHQL;
        string strUserCode, strUserName;

        strProjectID = Request.QueryString["ProjectID"];

        strLangCode = Session["LangCode"].ToString();
        strIsMobileDevice = Session["IsMobileDevice"].ToString();


        strUserCode = Session["UserCode"].ToString();
        strUserName = ShareClass.GetUserName(strUserCode);

        LB_UserCode.Text = strUserCode;
        LB_UserName.Text = strUserName;

        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "clickA", "aHandler();", true);
        if (Page.IsPostBack == false)
        {
            LoadWorkType(strProjectID);

            strHQL = "Select distinct WorkType From T_ProjectWorkload_JHKC";
            DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_ProjectWorkload_JHKC");
            DL_WorkType.DataSource = ds;
            DL_WorkType.DataBind();
            DL_WorkType.Items.Insert(0, new ListItem("--Select--", ""));
        }
    }

    protected void BT_Create_Click(object sender, EventArgs e)
    {
        LB_ID.Text = "";

        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','false') ", true);
    }


    protected void BT_New_Click(object sender, EventArgs e)
    {
        string strID;

        strID = LB_ID.Text.Trim();

        if (strID == "")
        {
            AddWorkType();
        }
        else
        {
            UpdateWorkType();
        }
    }

    protected void AddWorkType()
    {
        string strHQL;

        string strWorkType;
        decimal deDanJia, deGongZuoLiang;

        strWorkType = TB_WorkType.Text.Trim();
        deDanJia = NB_DanJia.Amount;
        deGongZuoLiang = NB_GongZuoLiang.Amount;

        if (strWorkType == "")
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('错误，类型不能为空！')", true);

            ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);
        }
        else
        {
            try
            {
                strHQL = "Insert Into T_ProjectWorkload_JHKC(ProjectID,WorkType,GongZuoLiang,DanJia) Values(" + strProjectID + ",'" + strWorkType + "'," + deGongZuoLiang.ToString() + "," + deDanJia.ToString() + ")";
                ShareClass.RunSqlCommand(strHQL);

                LB_ID.Text = GetMaxMyCreatedProjectWorkTypeID();

                LoadWorkType(strProjectID);

                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZBCCG + "')", true);
            }
            catch
            {
                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZBCSB + "')", true);

                ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);
            }
        }
    }

    protected void UpdateWorkType()
    {
        string strHQL;

        string strID, strWorkType;
        decimal deDanJia, deGongZuoLiang;

        strID = LB_ID.Text.Trim();
        strWorkType = TB_WorkType.Text.Trim();
        deDanJia = NB_DanJia.Amount;
        deGongZuoLiang = NB_GongZuoLiang.Amount;


        if (strWorkType == "")
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('错误，类型不能为空！')", true);

            ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);
        }
        else
        {
            try
            {
                strHQL = "Update T_ProjectWorkload_JHKC Set WorkType ='" + strWorkType + "',GongZuoLiang= " + deGongZuoLiang.ToString() + ",DanJia =" + deDanJia.ToString();
                strHQL += " Where ID = " + strID;

                LB_ID.Text = strHQL;
                ShareClass.RunSqlCommand(strHQL);

                LoadWorkType(strProjectID);

                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZBCCG + "')", true);
            }
            catch
            {
                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZBCSB + "')", true);

                ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);
            }
        }
    }

    protected void DataGrid2_ItemCommand(object sender, DataGridCommandEventArgs e)
    {
        string strHQL;
        string strID;

        if (e.CommandName != "Page")
        {
            strID = e.Item.Cells[2].Text.Trim();
            LB_ID.Text = strID;

            if (e.CommandName == "Update")
            {
                for (int i = 0; i < DataGrid2.Items.Count; i++)
                {
                    DataGrid2.Items[i].ForeColor = Color.Black;
                }
                e.Item.ForeColor = Color.Red;

                strHQL = "Select * From T_ProjectWorkload_JHKC  Where ID = " + strID;
                DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_ProjectWorkload_JHKC");

                TB_WorkType.Text = ds.Tables[0].Rows[0]["WorkType"].ToString();
                NB_DanJia.Amount = decimal.Parse(ds.Tables[0].Rows[0]["DanJia"].ToString());
                NB_GongZuoLiang.Amount = decimal.Parse(ds.Tables[0].Rows[0]["GongZuoLiang"].ToString());

                ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);
            }


            if (e.CommandName == "Delete")
            {
                try
                {
                    strHQL = "Delete From T_ProjectWorkload_JHKC Where ID = " + strID;
                    ShareClass.RunSqlCommand(strHQL);

                    LoadWorkType(strProjectID);

                    ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZSCCG + "')", true);
                }
                catch
                {
                    ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZSCSBJC + "')", true);
                }
            }
        }
    }

    protected void DL_WorkType_SelectedIndexChanged(object sender, EventArgs e)
    {
        string strWorkType;

        strWorkType = DL_WorkType.SelectedValue.Trim();

        TB_WorkType.Text = strWorkType;

        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);
    }

    protected string GetMaxMyCreatedProjectWorkTypeID()
    {
        string strHQL;

        strHQL = "Select Max(ID) From T_ProjectWorkload_JHKC";
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_ProjectWorkload_JHKC");

        return ds.Tables[0].Rows[0][0].ToString();
    }

    protected void LoadWorkType(string strProjectID)
    {
        string strHQL;

        strHQL = "Select * From T_ProjectWorkload_JHKC Where ProjectID = " + strProjectID;
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_ProjectWorkload_JHKC");
        DataGrid2.DataSource = ds;
        DataGrid2.DataBind();

        strHQL = "Select sum(GongZuoLiang * DanJia) From T_ProjectWorkload_JHKC Where ProjectID = " + strProjectID;
        ds = ShareClass.GetDataSetFromSql(strHQL, "T_ProjectWorkload_JHKC");

        LB_TotalAmount.Text = ds.Tables[0].Rows[0][0].ToString();
    }

}


