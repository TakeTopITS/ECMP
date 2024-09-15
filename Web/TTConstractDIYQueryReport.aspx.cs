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

public partial class TTConstractDIYQueryReport : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string strHQL;

        string strUserCode = Session["UserCode"].ToString();


        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "clickParentA", " aHandler();", true);
        if (Page.IsPostBack != true)
        {
            strHQL = @"SELECT     ConstractCode  合同代码
		  ,ConstractName  合同名称
		  ,Type   总类
		  ,ConstractClass  小类
		  ,Amount  金额
		  ,Currency  币别
		  ,ReAndPayType  收付款方式
		  ,StartDate  开始时间
		  ,EndDate  结束时间
		  ,MainContent  主要内容
		  ,Exception  异常情况
		  ,PartA  甲方
		  ,PartAOperator  甲方负责人
		  ,PartB  乙方
		  ,PartBOperator  乙方负责人
		  ,SignDate  签订日期
		  ,Status  状态
		  ,RecordTime  记录时间
		  ,RecorderCode  记录人代码
		  ,RecorderName  记录人名称
          ,F_GetConstractRelatedProjectName(ConstractCode)  关联项目
          ,F_GetConstractRelatedSales(ConstractCode)  业务员		  
		FROM T_Constract
		Where    
          to_char(SignDate,'yyyymmdd') > '20150191'            
		  AND  Amount > 1000
          AND  ConstractName Like '%%'
		  Order By SignDate DESC ,Amount ASC";

            TB_SQLCode.Text = strHQL;

            LB_PrintTime.Text = DateTime.Now.ToString("yyyy-MM-dd HH:SS");
        }
    }

    protected void BT_Find_Click(object sender, EventArgs e)
    {
        string strHQL;

        if (string.IsNullOrEmpty(TB_SQLCode.Text.Trim()) || TB_SQLCode.Text.Trim() == "")
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZJGSQLYJBNWKJC + "')", true);
            TB_SQLCode.Focus();
            return;
        }
        if (!(TB_SQLCode.Text.Trim().ToLower().Contains("select") && TB_SQLCode.Text.Trim().ToLower().Contains("from") ))
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZJGCSQLYJYWJC + "')", true);
            TB_SQLCode.Focus();
            return;
        }
        if (TB_SQLCode.Text.Trim().ToLower().Contains("create ") || TB_SQLCode.Text.Trim().ToLower().Contains("execute ") || TB_SQLCode.Text.Trim().ToLower().Contains("delete ") || TB_SQLCode.Text.Trim().ToLower().Contains("update") || TB_SQLCode.Text.Trim().ToLower().Contains("drop ")
            || TB_SQLCode.Text.Trim().ToLower().Contains("insert ") || TB_SQLCode.Text.Trim().ToLower().Contains("alter "))
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZJGCSQLYJYWJC + "')", true);
            TB_SQLCode.Focus();
            return;
        }

        try
        {
            strHQL = TB_SQLCode.Text.Trim();
            DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_Sql");
            DataGrid1.DataSource = ds;
            DataGrid1.DataBind();

            LB_CopyNumber.Text = ds.Tables[0].Rows.Count.ToString();
   

            //DataGrid1.Items[0].Cells[0].Width =  72;
            DataGrid1.Items[0].Cells[1].Width = 180;
            for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
                DataGrid1.Items[i].Cells[1].HorizontalAlign = HorizontalAlign.Left;
            }
            //DataGrid1.Items[0].Cells[2].Width = 24;
            //DataGrid1.Items[0].Cells[3].Width = 24;
            //DataGrid1.Items[0].Cells[4].Width = 72;
            //DataGrid1.Items[0].Cells[5].Width = 24;
            //DataGrid1.Items[0].Cells[6].Width = 24;
            //DataGrid1.Items[0].Cells[7].Width = 48;
            //DataGrid1.Items[0].Cells[8].Width = 48;
            DataGrid1.Items[0].Cells[9].Width = 240;
            for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
                DataGrid1.Items[i].Cells[9].HorizontalAlign = HorizontalAlign.Left;
            }

            DataGrid1.Items[0].Cells[10].Width = 240;
            for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
                DataGrid1.Items[i].Cells[10].HorizontalAlign = HorizontalAlign.Left;
            }
            //DataGrid1.Items[0].Cells[11].Width = 94;
            //DataGrid1.Items[0].Cells[12].Width = 24;
            DataGrid1.Items[0].Cells[13].Width = 100;
         
            //DataGrid1.Items[0].Cells[14].Width = 24;
            //DataGrid1.Items[0].Cells[15].Width = 60;
            //DataGrid1.Items[0].Cells[16].Width = 24;
            //DataGrid1.Items[0].Cells[17].Width = 60;
            //DataGrid1.Items[0].Cells[18].Width = 60;
            //DataGrid1.Items[0].Cells[19].Width = 24;
            //DataGrid1.Items[0].Cells[20].Width = 72;
            //DataGrid1.Items[0].Cells[21].Width = 24;
        }
        catch(Exception ex)
        { 
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZJGCSQLYJYWJC + "')", true);
        }

        LB_PrintTime.Text = DateTime.Now.ToString("yyyy-MM-dd HH:SS");
    }

    protected void BT_ExportToExcel_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            try
            {
                Random a = new Random();
                string fileName = "合同查询报表" + DateTime.Now.ToString("yyyy-MM-dd-HH-mm-ss") + "-" + a.Next(100, 999) + ".xls";

                string strHQL = TB_SQLCode.Text.Trim();

                MSExcelHandler.DataTableToExcel(strHQL, fileName);
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZJGDCDSJYWJC + "')", true);
            }
        }
    }

    protected void CountAmount(DataSet ds)
    {
        int i;
        decimal deTotalAmount = 0;

        for (i = 0; i < ds.Tables[0].Rows.Count; i++)
        {
            deTotalAmount += decimal.Parse(ds.Tables[0].Rows[i]["Amount"].ToString());

        }

        //LB_TotalAmount.Text = deTotalAmount.ToString();
    }
}
