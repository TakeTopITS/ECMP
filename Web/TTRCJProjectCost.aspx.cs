using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections;
using System.Data;
using System.IO;
using System.Data.OleDb;

using ProjectMgt.BLL;
using ProjectMgt.Model;
using System.Text;

public partial class TTRCJProjectCost : System.Web.UI.Page
{
    private int ProjectId = 0;
    private string UserCode = "";

    protected void Page_Load(object sender, EventArgs e)
    {
        ProjectId = Convert.ToInt32(Request.QueryString["ProjectID"]);
        UserCode = Convert.ToString(Session["UserCode"]);

        if (!IsPostBack)
        {
            try
            {
                //获得基准信息类型列表
                RCJShareClass.InitPerformanceType(DDL_PerformanceType,this.lb_ShowMessage1);
                DDL_PerformanceType.SelectedIndex = 0;
                DDL_SubItem.Items.Add(" ");
                GetAllSubItemList(ProjectId, DDL_PerformanceType.Text);
                //汇总绩效信息
                CalculateSummaryPerformance();
                CalculateTotalCostPerformance();
                //显示汇总信息
                InitSummaryPerformanceInfo();

                //获取基准信息表信息
                InitPerformanceBenchmar(DDL_PerformanceType.SelectedValue);
                if(GridView1.Rows.Count > 0)
                    GridView1.SelectedIndex = 0;

                DisplayAdjustDetails();
            }
            catch (Exception exp)
            {
                lb_ShowMessage1.Text = "错误提示：操作出现异常： " + exp.Message;
            }
        }
    }

    private void InitPerformanceBenchmar(string typeid)
    {
        try
        {
            DateTime dtNow = DateTime.Now;
            StringBuilder sql = new StringBuilder("select * from V_RCJProjectCostPerformanceBenchmar where projectid=");
            sql.Append(ProjectId.ToString());
            sql.Append(" and ItemType=");
            sql.Append(typeid);
            sql.Append(" and ((ProjectYear=");
            sql.Append(dtNow.Year);
            sql.Append(" and ProjectMonth=");
            sql.Append(dtNow.Month);
            sql.Append(" and IfSplit=1) or IfSplit=0) ");
            if (TB_ItemNo.Text.Trim().Length > 0)
            {
                sql.Append(" and itemno=");
                sql.Append(TB_ItemNo.Text);
            }
            if (TB_ItemName.Text.Trim().Length > 0)
            {
                sql.Append(" and ItemName like '%");
                sql.Append(TB_ItemName.Text);
                sql.Append("%'");
            }
            if (TB_ItemContent.Text.Trim().Length > 0)
            {
                sql.Append(" and ItemContent like '%");
                sql.Append(TB_ItemContent.Text);
                sql.Append("%'");
            }
            if (TB_BeginTime.Text.Trim().Length > 0)
            {
                sql.Append(" and BeginTime >= '");
                sql.Append(TB_BeginTime.Text);
                sql.Append("'");
            }
            if (TB_EndTime.Text.Trim().Length > 0)
            {
                sql.Append(" and BeginTime <= '");
                sql.Append(TB_EndTime.Text);
                sql.Append("'");
            }
            if (DDL_SubItem.SelectedIndex > 0)
            {
                sql.Append(" and SubItem = '");
                sql.Append(DDL_SubItem.Text);
                sql.Append("'");
            }

            sql.Append(" order by itemno,subitem");


            DataSet ds = ShareClass.GetDataSetFromSql(sql.ToString(), "V_RCJProjectCostPerformanceBenchmar");

            GridView1.DataSource = ds;
            GridView1.DataBind();
        }
        catch (Exception exp)
        {
            lb_ShowMessage1.Text = "错误提示：查询操作出现异常： " + exp.Message;
        }
    }

    private string GetYearMonthString()
    {
        DateTime dtnow = DateTime.Now;

        string yearstr = string.Format("{0:D2}", dtnow.Year);
        string monstr = string.Format("{0:D2}", dtnow.Month);

        return yearstr + monstr;
    }

    private void CalculateSummaryPerformance()
    {
        try
        {
            DateTime dtNow = DateTime.Now;

            StringBuilder sql = new StringBuilder("exec Pro_TotalCostPerformance ");
            sql.Append(ProjectId.ToString());
            sql.Append(" , ");
            sql.Append(dtNow.Year);
            sql.Append(" , ");
            sql.Append(dtNow.Month);

            ShareClass.RunSqlCommand(sql.ToString());
        }
        catch (Exception exp)
        {
            lb_ShowMessage1.Text = "错误提示：操作出现异常： " + exp.Message;
        }
    }

    private void CalculateTotalCostPerformance()
    {
        try
        {
            StringBuilder sql = new StringBuilder("exec Pro_SumTotalCostPerformance ");
            sql.Append(ProjectId.ToString());

            ShareClass.RunSqlCommand(sql.ToString());
        }
        catch (Exception exp)
        {
            lb_ShowMessage1.Text = "错误提示：操作出现异常： " + exp.Message;
        }
    }

    private void InitSummaryPerformanceInfo()
    {
        StringBuilder sb = new StringBuilder(" SELECT * from T_RCJProjectTotalSummaryPerformance  where projectid=");
        sb.Append(ProjectId.ToString());

        DataSet res = ShareClass.GetDataSetFromSqlNOOperateLog(sb.ToString(), "T_RCJProjectTotalSummaryPerformance");

        if (res.Tables["T_RCJProjectTotalSummaryPerformance"].Rows.Count == 0)
        {
            lb_ShowMessage1.Text = "结果提示：还没有项目收支绩效汇总信息出来！";
            return;
        }

        //查询到记录，进行显示
        tbProjectNo.Text = ProjectId.ToString();
        tbProjectSTCV.Text = string.IsNullOrEmpty(res.Tables[0].Rows[0]["ProjectSTCV"].ToString())?"0.00":String.Format("{0:N2}", Convert.ToDouble( res.Tables[0].Rows[0]["ProjectSTCV"].ToString()));
        tbProjectBCWS.Text = string.IsNullOrEmpty(res.Tables[0].Rows[0]["ProjectBCWS"].ToString())?"0.00":String.Format("{0:N2}", Convert.ToDouble(res.Tables[0].Rows[0]["ProjectBCWS"].ToString()));
        tbProjectBCWP.Text = string.IsNullOrEmpty(res.Tables[0].Rows[0]["ProjectBCWP"].ToString()) ? "0.00" : String.Format("{0:N2}", Convert.ToDouble(res.Tables[0].Rows[0]["ProjectBCWP"].ToString()));
        tbProjectBCRWP.Text = string.IsNullOrEmpty(res.Tables[0].Rows[0]["ProjectBCRWP"].ToString()) ? "0.00" : String.Format("{0:N2}", Convert.ToDouble(res.Tables[0].Rows[0]["ProjectBCRWP"].ToString()));
        tbProjectPBCWP.Text = string.IsNullOrEmpty(res.Tables[0].Rows[0]["ProjectPBCWP"].ToString()) ? "0.00" : String.Format("{0:N2}", Convert.ToDouble(res.Tables[0].Rows[0]["ProjectPBCWP"].ToString())); 
        tbProjectRV.Text = string.IsNullOrEmpty(res.Tables[0].Rows[0]["ProjectRV"].ToString()) ? "0.00" : String.Format("{0:N2}", Convert.ToDouble(res.Tables[0].Rows[0]["ProjectRV"].ToString()));
        tbProjectACWP.Text = string.IsNullOrEmpty(res.Tables[0].Rows[0]["ProjectACWP"].ToString()) ? "0.00" : String.Format("{0:N2}", Convert.ToDouble(res.Tables[0].Rows[0]["ProjectACWP"].ToString()));
        tbProjectPL.Text = string.IsNullOrEmpty(res.Tables[0].Rows[0]["ProjectPL"].ToString()) ? "0.00" : String.Format("{0:N2}", Convert.ToDouble(res.Tables[0].Rows[0]["ProjectPL"].ToString()));
        tbProjectTotalSpending.Text = string.IsNullOrEmpty(res.Tables[0].Rows[0]["ProjectTotalSpending"].ToString()) ? "0.00" : String.Format("{0:N2}", Convert.ToDouble(res.Tables[0].Rows[0]["ProjectTotalSpending"].ToString()));
        tbProjectTotalIncome.Text = string.IsNullOrEmpty(res.Tables[0].Rows[0]["ProjectTotalIncome"].ToString()) ? "0.00" : String.Format("{0:N2}", Convert.ToDouble(res.Tables[0].Rows[0]["ProjectTotalIncome"].ToString()));
        tbProjectIncomeDifference.Text = string.IsNullOrEmpty(res.Tables[0].Rows[0]["ProjectIncomeDifference"].ToString()) ? "0.00" : String.Format("{0:N2}", Convert.ToDouble(res.Tables[0].Rows[0]["ProjectIncomeDifference"].ToString()));
        tbProjectRP.Text = string.IsNullOrEmpty(res.Tables[0].Rows[0]["ProjectRP"].ToString()) ? "0.00%" : Convert.ToDouble(res.Tables[0].Rows[0]["ProjectRP"]).ToString("p2");
        tbProjectContractReceived.Text = string.IsNullOrEmpty(res.Tables[0].Rows[0]["ProjectContractReceived"].ToString()) ? "0.00" : String.Format("{0:N2}", Convert.ToDouble(res.Tables[0].Rows[0]["ProjectContractReceived"].ToString()));
        tbProjectCPB.Text = string.IsNullOrEmpty(res.Tables[0].Rows[0]["ProjectCPB"].ToString()) ? "0.00" : String.Format("{0:N2}", Convert.ToDouble(res.Tables[0].Rows[0]["ProjectCPB"].ToString())) ;
        tbProjectCFI.Text = string.IsNullOrEmpty(res.Tables[0].Rows[0]["ProjectCFI"].ToString()) ? "0.00%" : Convert.ToDouble(res.Tables[0].Rows[0]["ProjectCFI"]).ToString("p2");
        tbProjectEAV.Text = string.IsNullOrEmpty(res.Tables[0].Rows[0]["ProjectEAV"].ToString()) ? "0.00" : String.Format("{0:N2}", Convert.ToDouble(res.Tables[0].Rows[0]["ProjectEAV"].ToString()));
        tbProjectAI.Text = string.IsNullOrEmpty(res.Tables[0].Rows[0]["ProjectAI"].ToString()) ? "0.00%" : Convert.ToDouble(res.Tables[0].Rows[0]["ProjectAI"]).ToString("p2");
        tbProjectBVI.Text = string.IsNullOrEmpty(res.Tables[0].Rows[0]["ProjectBVI"].ToString()) ? "0.00%" : Convert.ToDouble(res.Tables[0].Rows[0]["ProjectBVI"]).ToString("p2");
        tbProjectRVI.Text = string.IsNullOrEmpty(res.Tables[0].Rows[0]["ProjectRVI"].ToString()) ? "0.00%" : Convert.ToDouble(res.Tables[0].Rows[0]["ProjectRVI"]).ToString("p2");
        tbProjectBV.Text = string.IsNullOrEmpty(res.Tables[0].Rows[0]["ProjectBV"].ToString()) ? "0.00" : String.Format("{0:N2}", Convert.ToDouble(res.Tables[0].Rows[0]["ProjectBV"].ToString()));
        tbProjectSV.Text = string.IsNullOrEmpty(res.Tables[0].Rows[0]["ProjectSV"].ToString()) ? "0.00" : String.Format("{0:N2}", Convert.ToDouble(res.Tables[0].Rows[0]["ProjectSV"].ToString()));
        tbProjectSPI.Text = string.IsNullOrEmpty(res.Tables[0].Rows[0]["ProjectSPI"].ToString()) ? "0.00%" : Convert.ToDouble(res.Tables[0].Rows[0]["ProjectSPI"]).ToString("p2");
    }

    //查看绩效明细
    protected void btnGetAllPerformanceList_Click(object sender, EventArgs e)
    {
        StringBuilder sb = new StringBuilder("TTRCJProjectSummaryPerformance.aspx?projectid=");
        sb.Append(ProjectId.ToString());
        Response.Redirect(sb.ToString());
    }

    //录入基准信息
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        Session["UserCode"] = UserCode; 
        StringBuilder sb = new StringBuilder("TTRCJProjectCostPerformanceList.aspx?projectid=");
        sb.Append(ProjectId.ToString());
        Response.Redirect(sb.ToString());
    }

    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        GridView1.SelectedIndex = -1;
        InitPerformanceBenchmar(DDL_PerformanceType.SelectedValue);
    }

    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (GridView1.SelectedIndex == -1)
        {
            return;
        }

        DisplayAdjustDetails();
    }

    private void DisplayAdjustDetails()
    {
        if (GridView1.SelectedIndex == -1)
            return;

        try
        {
            StringBuilder sb = new StringBuilder(" SELECT * from T_RCJProjectAdjustPriceList where projectid=");
            sb.Append(ProjectId.ToString());
            sb.Append(" and itemtype=");
            sb.Append(DDL_PerformanceType.SelectedValue);
            sb.Append(" and itemno=");
            sb.Append(GridView1.Rows[GridView1.SelectedIndex].Cells[2].Text);
            sb.Append(" order by adjustid");

            DataSet res = ShareClass.GetDataSetFromSqlNOOperateLog(sb.ToString(), "T_RCJProjectAdjustPriceList");

            GridView2.DataSource = res;
            GridView2.DataBind();
        }
        catch (Exception exp)
        {
            lb_ShowMessage1.ForeColor = System.Drawing.Color.Red;
            lb_ShowMessage1.Text = "错误提示：查询该子项的价格调整信息列表出错：" + exp.Message;
            return;
        }
    }

    //导出成本绩效数据到EXCEL文件
    protected void Button1_Click(object sender, EventArgs e)
    {
        try
        {
            //根据导出模板生成临时文件
            string filePath = Server.MapPath("~/Template/" + Guid.NewGuid().ToString() + ".xls");
            File.Copy(Server.MapPath("~/Template/绩效汇总数据导出模板.xls"), filePath);

            //导出绩效基准数据
            ExportCostRecordToExcel(filePath, "绩效汇总数据.xls");

            //导出实际工作量数据
            //ExportWorkRecordToExcel(filePath, "绩效汇总数据.xls");

            //文件保存到本地
            Response.ContentType = "application/ms-excel";
            Response.AppendHeader("Content-Disposition", "attachment;filename=绩效汇总数据.xls");
            Response.BinaryWrite(File.ReadAllBytes(filePath));

            File.Delete(filePath);

            lb_ShowMessage1.ForeColor = System.Drawing.Color.Green;
            lb_ShowMessage1.Text = "操作提示： 绩效汇总数据导入到Excel文件成功!";
        }
        catch (Exception exp)
        {
            lb_ShowMessage1.ForeColor = System.Drawing.Color.Red;
            lb_ShowMessage1.Text = "错误提示：绩效汇总数据导入到Excel文件出错：" + exp.Message;
            return;
        }
    }

    private void ExportWorkRecordToExcel(string strMidFile, string strLocalFile)
    { 
        try
        {
            //查询获取记录列表
            RCJProjectCostPerformanceBenchmarBLL cpbBLL = new RCJProjectCostPerformanceBenchmarBLL();
            StringBuilder strSql = new StringBuilder("select * From  V_RCJProjectWorkDetails where projectid=");
            strSql.Append(ProjectId.ToString());
            strSql.Append(" order by itemtype,itemno ");

            DataSet res = ShareClass.GetDataSetFromSqlNOOperateLog(strSql.ToString(), "V_RCJProjectWorkDetails"); ;

            //写入记录到文件中
            string strCon = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + strMidFile + ";Extended Properties='Excel 8.0;HDR=YES;IMEX=0'";
            OleDbConnection ExcelConn = new OleDbConnection(strCon);
            using (ExcelConn)
            {
                ExcelConn.Open();

                for (int i = 0; i < res.Tables[0].Rows.Count; i++)
                {
                    StringBuilder sbcom = new StringBuilder("insert into [实际工作列表$] values('");

                    sbcom.Append(res.Tables[0].Rows[i]["TypeName"].ToString());
                    sbcom.Append("',");
                    sbcom.Append(res.Tables[0].Rows[i]["ItemNo"].ToString());
                    sbcom.Append(",'");
                    sbcom.Append(res.Tables[0].Rows[i]["ItemName"].ToString());
                    sbcom.Append("','");
                    sbcom.Append(res.Tables[0].Rows[i]["WorkMonth"].ToString());
                    sbcom.Append("',");
                    sbcom.Append(res.Tables[0].Rows[i]["Worknum"].ToString());
                    sbcom.Append(",'");
                    sbcom.Append(res.Tables[0].Rows[i]["Inputer"].ToString());
                    sbcom.Append("','");
                    sbcom.Append(res.Tables[0].Rows[i]["OperTime"].ToString());
                    sbcom.Append("','");
                    sbcom.Append(res.Tables[0].Rows[i]["WorkConfirm"].ToString() == "0" ? "否" : "是");
                    sbcom.Append("','");
                    sbcom.Append(res.Tables[0].Rows[i]["Confirmer"].ToString());
                    sbcom.Append("','");
                    sbcom.Append(res.Tables[0].Rows[i]["ConfirmTime"].ToString());
                    sbcom.Append("')");

                    OleDbCommand cmd = new OleDbCommand(sbcom.ToString(), ExcelConn);

                    int linenum = cmd.ExecuteNonQuery();
                }

                ExcelConn.Close();
            }
        }
        catch (Exception exp)
        {
            lb_ShowMessage1.ForeColor = System.Drawing.Color.Red;
            lb_ShowMessage1.Text = "错误提示： 绩效实际工作数据导入到Excel文件失败!" + exp.Message;
        }
    }

    private String getExportTableName(string typeName)
    {
        return "[" + typeName + "$]";
    }

    private void ExportCostRecordToExcel(string strMidFile, string strLocalFile)
    {
        try
        {
            //查询获取记录列表
            RCJProjectCostPerformanceBenchmarBLL cpbBLL = new RCJProjectCostPerformanceBenchmarBLL();
            StringBuilder strSql = new StringBuilder("select * From  V_RCJProjectCostPerformanceBenchmar where projectid=");
            strSql.Append(ProjectId.ToString());
            strSql.Append(" order by TypeName,ItemNo");

            DataSet res = ShareClass.GetDataSetFromSqlNOOperateLog(strSql.ToString(), "V_RCJProjectCostPerformanceBenchmar"); ;

            //写入记录到文件中
            string strCon = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + strMidFile + ";Extended Properties='Excel 8.0;HDR=YES;IMEX=0'";
            OleDbConnection ExcelConn = new OleDbConnection(strCon);
            using (ExcelConn)
            {
                ExcelConn.Open();

                for (int i = 0; i < res.Tables[0].Rows.Count; i++)
                {
                    String tableName = getExportTableName(res.Tables[0].Rows[i]["TypeName"].ToString());
                    StringBuilder sbCom = new StringBuilder("insert into ");
                    sbCom.Append(tableName);
                    sbCom.Append(" values('");
                    sbCom.Append(res.Tables[0].Rows[i]["SubItem"].ToString());
                    sbCom.Append("',"); 
                    sbCom.Append(res.Tables[0].Rows[i]["ItemNo"].ToString());
                    sbCom.Append(",'");
                    sbCom.Append(res.Tables[0].Rows[i]["ItemName"].ToString() == "" ? "" : res.Tables[0].Rows[i]["ItemName"].ToString());
                    sbCom.Append("','");
                    sbCom.Append(res.Tables[0].Rows[i]["ItemContent"].ToString() == "" ? "" : res.Tables[0].Rows[i]["ItemContent"].ToString());
                    sbCom.Append("','");
                    sbCom.Append(res.Tables[0].Rows[i]["ItemUnit"].ToString() == "" ? "" : res.Tables[0].Rows[i]["ItemUnit"].ToString());
                    sbCom.Append("',");
                    sbCom.Append(res.Tables[0].Rows[i]["ItemNum"].ToString() == "" ? "0" : res.Tables[0].Rows[i]["ItemNum"].ToString());
                    sbCom.Append(",");
                    //原定单价
                    sbCom.Append(res.Tables[0].Rows[i]["ItemPriceDevice"].ToString() == "" ? "0" : res.Tables[0].Rows[i]["ItemPriceDevice"].ToString());
                    sbCom.Append(",");
                    sbCom.Append(res.Tables[0].Rows[i]["ItemPriceMainMaterial"].ToString() == "" ? "0" : res.Tables[0].Rows[i]["ItemPriceMainMaterial"].ToString());
                    sbCom.Append(",");
                    sbCom.Append(res.Tables[0].Rows[i]["ItemPriceWage"].ToString() == "" ? "0" : res.Tables[0].Rows[i]["ItemPriceWage"].ToString());
                    sbCom.Append(",");
                    sbCom.Append(res.Tables[0].Rows[i]["ItemPriceMaterial"].ToString() == "" ? "0" : res.Tables[0].Rows[i]["ItemPriceMaterial"].ToString());
                    sbCom.Append(",");
                    sbCom.Append(res.Tables[0].Rows[i]["ItemPriceMachine"].ToString() == "" ? "0" : res.Tables[0].Rows[i]["ItemPriceMachine"].ToString());
                    sbCom.Append(",");
                    //预算合价
                    sbCom.Append(res.Tables[0].Rows[i]["ItemPriceDeviceBudget"].ToString() == "" ? "0" : res.Tables[0].Rows[i]["ItemPriceDeviceBudget"].ToString());
                    sbCom.Append(",");
                    sbCom.Append(res.Tables[0].Rows[i]["ItemPriceMainMaterialBudget"].ToString() == "" ? "0" : res.Tables[0].Rows[i]["ItemPriceMainMaterialBudget"].ToString());
                    sbCom.Append(",");
                    sbCom.Append(res.Tables[0].Rows[i]["ItemPriceWageBudget"].ToString() == "" ? "0" : res.Tables[0].Rows[i]["ItemPriceWageBudget"].ToString());
                    sbCom.Append(",");
                    sbCom.Append(res.Tables[0].Rows[i]["ItemPriceMaterialBudget"].ToString() == "" ? "0" : res.Tables[0].Rows[i]["ItemPriceMaterialBudget"].ToString());
                    sbCom.Append(",");
                    sbCom.Append(res.Tables[0].Rows[i]["ItemPriceMachineBudget"].ToString() == "" ? "0" : res.Tables[0].Rows[i]["ItemPriceMachineBudget"].ToString());
                    sbCom.Append(",");
                    sbCom.Append(res.Tables[0].Rows[i]["ItemPricePurchaseFee"].ToString() == "" ? "0" : res.Tables[0].Rows[i]["ItemPricePurchaseFee"].ToString());
                    sbCom.Append(","); 
                    sbCom.Append(res.Tables[0].Rows[i]["ItemPricePurchaseFeeBudget"].ToString() == "" ? "0" : res.Tables[0].Rows[i]["ItemPricePurchaseFeeBudget"].ToString());
                    sbCom.Append(",");
                    sbCom.Append(res.Tables[0].Rows[i]["ItemComprehensiveFeeBudget"].ToString() == "" ? "0" : res.Tables[0].Rows[i]["ItemComprehensiveFeeBudget"].ToString());
                    sbCom.Append(",");
                    sbCom.Append(res.Tables[0].Rows[i]["ItemTaxesBudget"].ToString() == "" ? "0" : res.Tables[0].Rows[i]["ItemTaxesBudget"].ToString());
                    sbCom.Append(",");
                    sbCom.Append(res.Tables[0].Rows[i]["BCWS"].ToString() == "" ? "0" : res.Tables[0].Rows[i]["BCWS"].ToString());
                    sbCom.Append(",");
                    //调整价格
                    sbCom.Append(res.Tables[0].Rows[i]["ItemPriceDeviceAdjust"].ToString() == "" ? "0" : res.Tables[0].Rows[i]["ItemPriceDeviceAdjust"].ToString());
                    sbCom.Append(",");
                    sbCom.Append(res.Tables[0].Rows[i]["ItemPriceMainMaterialAdjust"].ToString() == "" ? "0" : res.Tables[0].Rows[i]["ItemPriceMainMaterialAdjust"].ToString());
                    sbCom.Append(",");
                    sbCom.Append(res.Tables[0].Rows[i]["ItemPriceWageAdjust"].ToString() == "" ? "0" : res.Tables[0].Rows[i]["ItemPriceWageAdjust"].ToString());
                    sbCom.Append(",");
                    sbCom.Append(res.Tables[0].Rows[i]["ItemPriceMaterialAdjust"].ToString() == "" ? "0" : res.Tables[0].Rows[i]["ItemPriceMaterialAdjust"].ToString());
                    sbCom.Append(",");
                    sbCom.Append(res.Tables[0].Rows[i]["ItemPriceMachineAdjust"].ToString() == "" ? "0" : res.Tables[0].Rows[i]["ItemPriceMachineAdjust"].ToString());
                    sbCom.Append(","); 
                    //工作量
                    sbCom.Append(res.Tables[0].Rows[i]["TotalWork"].ToString() == "" ? "0" : res.Tables[0].Rows[i]["TotalWork"].ToString());
                    sbCom.Append(",");
                    sbCom.Append(res.Tables[0].Rows[i]["TotalConfirmWork"].ToString() == "" ? "0" : res.Tables[0].Rows[i]["TotalConfirmWork"].ToString());
                    sbCom.Append(",");
                    //实际合价
                    sbCom.Append(res.Tables[0].Rows[i]["ItemPriceDeviceActual"].ToString() == "" ? "0" : res.Tables[0].Rows[i]["ItemPriceDeviceActual"].ToString());
                    sbCom.Append(",");
                    sbCom.Append(res.Tables[0].Rows[i]["ItemPriceMainMaterialActual"].ToString() == "" ? "0" : res.Tables[0].Rows[i]["ItemPriceMainMaterialActual"].ToString());
                    sbCom.Append(",");
                    sbCom.Append(res.Tables[0].Rows[i]["ItemPriceWageActual"].ToString() == "" ? "0" : res.Tables[0].Rows[i]["ItemPriceWageActual"].ToString());
                    sbCom.Append(",");
                    sbCom.Append(res.Tables[0].Rows[i]["ItemPriceMaterialActual"].ToString() == "" ? "0" : res.Tables[0].Rows[i]["ItemPriceMaterialActual"].ToString());
                    sbCom.Append(",");
                    sbCom.Append(res.Tables[0].Rows[i]["ItemPriceMachineActual"].ToString() == "" ? "0" : res.Tables[0].Rows[i]["ItemPriceMachineActual"].ToString());
                    sbCom.Append(",");
                    sbCom.Append(res.Tables[0].Rows[i]["itemComprehensiveFeeActual"].ToString() == "" ? "0" : res.Tables[0].Rows[i]["itemComprehensiveFeeActual"].ToString());
                    sbCom.Append(",");
                    sbCom.Append(res.Tables[0].Rows[i]["ItemTaxesActual"].ToString() == "" ? "0" : res.Tables[0].Rows[i]["ItemTaxesActual"].ToString());
                    sbCom.Append(",");
                    sbCom.Append(res.Tables[0].Rows[i]["ItemPriceTotalActual"].ToString() == "" ? "0" : res.Tables[0].Rows[i]["ItemPriceTotalActual"].ToString());
                    sbCom.Append(",");
                    //各个指标
                    sbCom.Append(res.Tables[0].Rows[i]["ProjectPlanCompleteBalance"].ToString() == "" ? "0" : res.Tables[0].Rows[i]["ProjectPlanCompleteBalance"].ToString());
                    sbCom.Append(",");
                    sbCom.Append(res.Tables[0].Rows[i]["ProjectBCRWP"].ToString() == "" ? "0" : res.Tables[0].Rows[i]["ProjectBCRWP"].ToString());
                    sbCom.Append(",");
                    sbCom.Append(res.Tables[0].Rows[i]["ProjectAI"].ToString() == "" ? "0" : res.Tables[0].Rows[i]["ProjectAI"].ToString());
                    sbCom.Append(",");
                    sbCom.Append(res.Tables[0].Rows[i]["ProjectEAV"].ToString() == "" ? "0" : res.Tables[0].Rows[i]["ProjectEAV"].ToString());
                    sbCom.Append(",");
                    sbCom.Append(res.Tables[0].Rows[i]["ProjectPBCWP"].ToString() == "" ? "0" : res.Tables[0].Rows[i]["ProjectPBCWP"].ToString());
                    sbCom.Append(",");
                    sbCom.Append(res.Tables[0].Rows[i]["ProjectRV"].ToString() == "" ? "0" : res.Tables[0].Rows[i]["ProjectRV"].ToString());
                    sbCom.Append(",");
                    sbCom.Append(res.Tables[0].Rows[i]["ProjectRVI"].ToString() == "" ? "0" : res.Tables[0].Rows[i]["ProjectRVI"].ToString());
                    sbCom.Append(",'");
                    sbCom.Append(res.Tables[0].Rows[i]["Name"].ToString() == "" ? "" : res.Tables[0].Rows[i]["Name"].ToString());
                    sbCom.Append("','");
                    sbCom.Append(res.Tables[0].Rows[i]["BeginTime"].ToString() == "" ? "" : res.Tables[0].Rows[i]["BeginTime"].ToString());
                    sbCom.Append("','");
                    sbCom.Append(res.Tables[0].Rows[i]["EndTime"].ToString() == "" ? "" : res.Tables[0].Rows[i]["EndTime"].ToString());
                    sbCom.Append("','");
                    sbCom.Append(res.Tables[0].Rows[i]["Memo"].ToString() == "" ? "" : res.Tables[0].Rows[i]["Memo"].ToString()); 
                    sbCom.Append("')");

                    OleDbCommand cmd = new OleDbCommand(sbCom.ToString(), ExcelConn);

                    int linenum = cmd.ExecuteNonQuery();
                }

                ExcelConn.Close();
            }

        }
        catch (Exception exp)
        {
            lb_ShowMessage1.ForeColor = System.Drawing.Color.Red;
            lb_ShowMessage1.Text = "错误提示： 绩效汇总数据导入到Excel文件失败!"+exp.Message;
        }
    }


    protected void DDL_PerformanceType_SelectedIndexChanged(object sender, EventArgs e)
    {
        lb_ShowMessage1.Text = "";

        InitPerformanceBenchmar(DDL_PerformanceType.SelectedValue);

        if (GridView1.Rows.Count > 0)
        {
            GridView1.SelectedIndex = 0;
        }
    }

    protected void GridView1_RowCommand1(object sender, GridViewCommandEventArgs e)
    {
        int idx = Convert.ToInt32(e.CommandArgument);
        if (e.CommandName == "AdjustPrice")
        {
            //选择行填入最新价格
            Session["UserCode"] = UserCode;
            StringBuilder sb = new StringBuilder("TTRCJProjectAdjustPrice.aspx?projectid=");
            sb.Append(ProjectId.ToString());
            sb.Append("&itemtype=");
            sb.Append(DDL_PerformanceType.SelectedValue);
            sb.Append("&itemno=");
            sb.Append(GridView1.Rows[idx].Cells[2].Text);
            sb.Append("&itemname=");
            sb.Append(GridView1.Rows[idx].Cells[3].Text);

            Response.Redirect(sb.ToString());
        }
    }
    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            //鼠标经过时，行背景色变 
            e.Row.Attributes.Add("onmouseover", "this.style.backgroundColor='#A9A9A9'");
            //鼠标移出时，行背景色变 
            e.Row.Attributes.Add("onmouseout", "this.style.backgroundColor='#FFFFFF'");

            Label lbl1 = (Label)e.Row.FindControl("Label1");
            if ("是" == lbl1.Text)
                e.Row.ForeColor = System.Drawing.Color.Crimson;
            else
                e.Row.ForeColor = System.Drawing.Color.Blue;
        } 
    }
    protected void GridView2_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            //鼠标经过时，行背景色变 
            e.Row.Attributes.Add("onmouseover", "this.style.backgroundColor='#A9A9A9'");
            //鼠标移出时，行背景色变 
            e.Row.Attributes.Add("onmouseout", "this.style.backgroundColor='#FFFFFF'");

            int cellid = 22;
            e.Row.Cells[cellid].ToolTip = e.Row.Cells[cellid].Text;
            if (e.Row.Cells[cellid].Text.Length > 10)
                e.Row.Cells[cellid].Text = e.Row.Cells[cellid].Text.Substring(0, 10);
        }
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        try
        {
            StringBuilder sql = new StringBuilder("exec Pro_ClearRCJAllData ");

            ShareClass.RunSqlCommand(sql.ToString());

            lb_ShowMessage1.Text = "成功清除所有测试数据，请刷新重试。";
        }
        catch (Exception exp)
        {
            lb_ShowMessage1.Text = "错误提示：清除所有测试数据操作出现异常： " + exp.Message;
        }
    }
    protected void GridView2_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        int idx = Convert.ToInt32(e.CommandArgument);
        if (e.CommandName == "ActualWorks")
        {
            //选择行填入实际工作
            Session["UserCode"] = UserCode;
            StringBuilder sb = new StringBuilder("TTRCJProjectWorkDetails.aspx?projectid=");
            sb.Append(ProjectId.ToString());
            sb.Append("&itemtype=");
            sb.Append(DDL_PerformanceType.SelectedValue);
            sb.Append("&itemno=");
            sb.Append(GridView1.Rows[GridView1.SelectedIndex].Cells[2].Text);
            sb.Append("&adjustid=");
            sb.Append(GridView2.Rows[idx].Cells[1].Text);
            sb.Append("&itemname=");
            sb.Append(GridView1.Rows[GridView1.SelectedIndex].Cells[3].Text);
            sb.Append("&itemnum=");
            sb.Append(GridView2.Rows[idx].Cells[3].Text);
            sb.Append("&itemContent=");
            sb.Append(GridView1.Rows[GridView1.SelectedIndex].Cells[4].Text);
            sb.Append("&Budget=");//预算合价
            sb.Append(GridView1.Rows[GridView1.SelectedIndex].Cells[16].Text);

            Response.Redirect(sb.ToString());
        }
    }

    protected void BT_Calendar1_Click(object sender, EventArgs e)
    {
        if (TB_BeginTime.Text.Trim().Length == 0)
        {
            Calendar1.VisibleDate = DateTime.Now;
            Calendar1.SelectedDate = DateTime.Now;
        }
        else
        {
            Calendar1.VisibleDate = Convert.ToDateTime(TB_BeginTime.Text);
            Calendar1.SelectedDate = Convert.ToDateTime(TB_BeginTime.Text);
        }


        Calendar2.Visible = false;
        Calendar1.Visible = true;
    }
    protected void Calendar1_SelectionChanged(object sender, EventArgs e)
    {
        TB_BeginTime.Text = Calendar1.SelectedDate.ToShortDateString();
        Calendar1.Visible = false;
    }
    protected void BT_Calendar2_Click(object sender, EventArgs e)
    {
        if (TB_EndTime.Text.Trim().Length == 0)
        {
            Calendar2.VisibleDate = DateTime.Now;
            Calendar2.SelectedDate = DateTime.Now;
        }
        else
        {
            Calendar2.VisibleDate = Convert.ToDateTime(TB_EndTime.Text);
            Calendar2.SelectedDate = Convert.ToDateTime(TB_EndTime.Text);
        }

        Calendar2.Visible = true;
        Calendar1.Visible = false;
    }

    protected void Calendar2_SelectionChanged(object sender, EventArgs e)
    {
        TB_EndTime.Text = Calendar2.SelectedDate.ToShortDateString();
        Calendar2.Visible = false;
    }

    protected void bt_QueryByID_Click(object sender, EventArgs e)
    {
        Calendar2.Visible = false;
        Calendar1.Visible = false;
        //如果输入错误，或者为空，则显示所有记录
        InitPerformanceBenchmar(DDL_PerformanceType.SelectedValue);
    }

    private void GetAllSubItemList(int pid, string tid)
    {
        try
        {
            StringBuilder sql = new StringBuilder(" select distinct SubItem from T_RCJProjectCostPerformanceList where ProjectID =");
            sql.Append(pid.ToString());
            sql.Append(" and itemtype=");
            sql.Append(tid);

            DataSet ds = ShareClass.GetDataSetFromSql(sql.ToString(), "T_RCJProjectCostPerformanceList");

            
            for(int i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
                DDL_SubItem.Items.Add( ds.Tables[0].Rows[i]["SubItem"].ToString() );
            }
        }
        catch (Exception exp)
        {
            lb_ShowMessage1.Text = "错误提示：获取年列表操作出现异常： " + exp.Message;
        }
    }
}