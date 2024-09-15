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

using ProjectMgt.Model;
using ProjectMgt.DAL;
using ProjectMgt.BLL;

public partial class TTConstractCassificationAccountReport : System.Web.UI.Page
{
    string strLikeUserCode;

    protected void Page_Load(object sender, EventArgs e)
    {
        string strHQL;
        string strDepartString;

        string strUserName;
        string strUserCode = Session["UserCode"].ToString();

        strLikeUserCode = "%" + strUserCode + "%";

        //this.Title = "合同收款情况表";

        LB_UserCode.Text = strUserCode;
        strUserName = Session["UserName"].ToString();
        LB_UserName.Text = strUserName;

        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "clickParentA", " aHandler();", true);
        if (Page.IsPostBack != true)
        {
            DLC_StartTime.Text = DateTime.Now.ToString("yyyy-MM-dd");
            DLC_EndTime.Text = DateTime.Now.ToString("yyyy-MM-dd");


            strHQL = "from ConstractType as constractType Order by constractType.SortNumber ASC";
            ConstractTypeBLL constractTypeBLL = new ConstractTypeBLL();
            IList lst = constractTypeBLL.GetAllConstractTypes(strHQL);
            DL_ConstractType.DataSource = lst;
            DL_ConstractType.DataBind();
            DL_ConstractType.Items.Insert(0, new ListItem("--Select--", ""));

            strDepartString = TakeTopCore.CoreShareClass.InitialDepartmentStringByAuthoritySuperUser(strUserCode);
            LB_DepartString.Text = strDepartString;

            //strHQL = "Select * From V_ConstractCassificationAccountReport Where 1=1 ";
            //strHQL += " and ((DepartCode in " + strDepartString + ") or (ConstractCode in (Select ConstractCode From T_ConstractRelatedUser Where UserCode like  " + "'" + strLikeUserCode + "'" + ")))";
            //strHQL += " Order by SignDate DESC";

            //DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "V_ConstractChangeRecord");
            //DataGrid1.DataSource = ds;
            //DataGrid1.DataBind();
            //LB_Sql.Text = strHQL;

            //LB_CopyNumber.Text = ds.Tables[0].Rows.Count.ToString();
            //CountAmount(ds);

            LB_PrintTime.Text = DateTime.Now.ToString("yyyy-MM-dd HH:SS");
        }
    }

    protected void BT_Find_Click(object sender, EventArgs e)
    {
        string strHQL;
        string strStartTime, strEndTime;
        string strConstractCode, strConstractName, strBigType;

        string strDepartString;

        strStartTime = DLC_StartTime.Text.Replace("-", "");
        strEndTime = DLC_EndTime.Text.Replace("-", "");

        strDepartString = LB_DepartString.Text.Trim();

        strBigType = DL_ConstractType.SelectedValue.Trim();
        strBigType = "%" + strBigType + "%";

        strConstractCode = TB_ConstractCode.Text.Trim();
        strConstractCode = "%" + strConstractCode + "%";

        strConstractName = TB_ConstractName.Text.Trim();
        strConstractName = "%" + strConstractName + "%";

        strHQL = "Select * From V_ConstractCassificationAccountReport Where 1=1 ";
        strHQL += " and ((DepartCode in " + strDepartString + ") or (ConstractCode in (Select ConstractCode From T_ConstractRelatedUser Where UserCode like  " + "'" + strLikeUserCode + "'" + ")))";
        strHQL += " and  ConstractCode like  " + "'" + strConstractCode + "'";
        strHQL += " and  ConstractName like  " + "'" + strConstractName + "'";
        strHQL += " and  Type Like " + "'" + strBigType + "'";
        if (!string.IsNullOrEmpty(strStartTime))
        {
            strHQL += " and StartDate >= " + "'" + strStartTime + "'";
        }
        if (!string.IsNullOrEmpty(strEndTime))
        {
            strHQL += " and EndDate <=" + "'" + strEndTime + "'";
        }

        strHQL += " Order by SignDate DESC";

        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "V_ConatractChangeReport");


        DataGrid1.DataSource = ds;
        DataGrid1.DataBind();

        CountAmount(ds);

        LB_Sql.Text = strHQL;

        LB_CopyNumber.Text = ds.Tables[0].Rows.Count.ToString();
        LB_PrintTime.Text = DateTime.Now.ToString("yyyy-MM-dd HH:SS");
    }
    

    protected void DL_ConstractType_SelectedIndexChanged(object sender, EventArgs e)
    {
        LB_ConstractType.Text = DL_ConstractType.SelectedValue.Trim();
    }

    protected void DataGrid1_PageIndexChanged(object sender, DataGridPageChangedEventArgs e)
    {
        string strHQL = LB_Sql.Text.Trim();

        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "V_ConstractCassificationAccountReport");

        DataGrid1.DataSource = ds;
        DataGrid1.DataBind();
    }

    protected void CountAmount(DataSet ds)
    {
        int i;
        decimal deTotalAmount = 0;

        for (i = 0; i < ds.Tables[0].Rows.Count; i++)
        {
            deTotalAmount += decimal.Parse(ds.Tables[0].Rows[i]["Amount"].ToString());
      
        }

        LB_TotalAmount.Text = deTotalAmount.ToString();
    }


}
