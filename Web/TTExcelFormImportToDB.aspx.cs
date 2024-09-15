using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using java.nio.file;

using NPOI.HSSF.UserModel;
using NPOI.SS.UserModel;
using NPOI.XSSF.UserModel;

using ProjectMgt.BLL;
using ProjectMgt.Model;

public partial class TTExcelFormImportToDB : System.Web.UI.Page
{
    string strUserCode, strUserName;

    protected void Page_Load(object sender, EventArgs e)
    {
        strUserCode = Session["UserCode"].ToString();
        strUserName = Session["UserName"].ToString();

        ProjectMemberBLL projectMemberBLL = new ProjectMemberBLL();
        Label1.Text = ShareClass.GetPageTitle(this.GetType().BaseType.Name + ".aspx"); bool blVisible = TakeTopSecurity.TakeTopLicense.GetAuthobility(this.GetType().BaseType.Name + ".aspx", strUserCode);  //Label1.Text = ShareClass.GetPageTitle(this.GetType().BaseType.Name + ".aspx"); bool blVisible = TakeTopSecurity.TakeTopLicense.GetAuthobility(this.GetType().BaseType.Name + ".aspx", "资产登记入库", strUserCode);
        if (blVisible == false)
        {
            Response.Redirect("TTDisplayErrors.aspx");
            return;
        }

        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "clickA", "aHandler();", true);
        if (Page.IsPostBack != true)
        {
            LoadExcelFormData(strUserCode);

            LoadFormType(strUserCode);
        }
    }

    protected void BT_Find_Click(object sender, EventArgs e)
    {
        string strHQL = String.Format(@"select * from t_excelformdata 
                  where operatorcode = '{0}' and FormType like '%{1}%' and FormName Like '%{2}%' and RowCode Like '%{3}%' and FieldName Like '%{4}%' and FieldValue Like '%{5}%' and OperatorName Like '%{6}%'
                  order by OperateTime DESC, ID ASC limit 300", strUserCode, TB_FormType.Text.Trim(), TB_FormName.Text.Trim(), TB_RowCode.Text.Trim(), TB_FieldName.Text.Trim(), TB_FieldValue.Text.Trim(), TB_OperatorName.Text.Trim());
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_excelformdata");
        DataGrid1.DataSource = ds;
        DataGrid1.DataBind();

        LB_Sql.Text = strHQL;
    }

    protected void btn_ExcelToDB_Click(object sender, EventArgs e)
    {
        string strErrorUserCodeString = "";

        string strFormType;

        strFormType = TB_FormType.Text.Trim();

        if (strFormType == "")
        {
            LB_ErrorText.Text += "请输入表单类型！";
            return;
        }


        if (FileUpload_Training.HasFile == false)
        {
            LB_ErrorText.Text += Resources.lang.ZZJGZKYZEXCELWJ;
            return;
        }
        string IsXls = System.IO.Path.GetExtension(FileUpload_Training.FileName).ToString().ToLower();
        if (IsXls != ".xls" & IsXls != ".xlsx")
        {
            LB_ErrorText.Text += Resources.lang.ZZJGZKYZEXCELWJ;
            return;
        }
        string filename = FileUpload_Training.FileName.ToString();  //获取Execle文件名
        string newfilename = System.IO.Path.GetFileNameWithoutExtension(filename) + DateTime.Now.ToString("yyyyMMddHHmmssff") + IsXls;//新文件名称，带后缀
        string strDocSavePath = Server.MapPath("Doc") + "\\" + DateTime.Now.ToString("yyyyMM") + "\\" + strUserCode.Trim() + "\\Doc\\";
        FileInfo fi = new FileInfo(strDocSavePath + newfilename);
        if (fi.Exists)
        {
            LB_ErrorText.Text += Resources.lang.ZZEXCLEBDRSB;
        }
        else
        {
            FileUpload_Training.MoveTo(strDocSavePath + newfilename, Brettle.Web.NeatUpload.MoveToOptions.Overwrite);
            string strpath = strDocSavePath + newfilename;

            ExcelFormDataToDataTable(strpath);

            LoadExcelFormData(strUserCode);

            LoadFormType(strUserCode);

            if (strErrorUserCodeString == "")
            {
                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click555", "alert('" + Resources.lang.ZZEXCLEBDRBWC + "')", true);
            }
            else
            {
                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click666", "alert('" + Resources.lang.ZZEXCLEBDRJBWCDXMRYSJDRSBSTRERRORUSERCODESTRINGJC + "')", true);
            }
        }
    }

    protected void DL_FormType_SelectedIndexChanged(object sender, EventArgs e)
    {
        TB_FormType.Text = DL_FormType.SelectedValue.Trim();
    }

    protected void BT_Delete_Click(object sender, EventArgs e)
    {
        string strHQL;

        string strFormCode = TB_FormCode.Text.Trim();

        strHQL = string.Format(@"delete from t_excelformdata where formcode = '{0}' and OperatorCode = '{1}'", strFormCode, strUserCode);
        ShareClass.RunSqlCommand(strHQL);

        LoadExcelFormData(strUserCode);
    }


    protected void DataGrid1_PageIndexChanged(object sender, DataGridPageChangedEventArgs e)
    {
        DataGrid1.CurrentPageIndex = e.NewPageIndex;

        string query = LB_Sql.Text;

        var result = ShareClass.GetDataSetFromSql(query, "T_ExcelFormData");
        DataGrid1.DataSource = result;
        DataGrid1.DataBind();
    }

    protected void LoadExcelFormData(string strUserCode)
    {
        string strHQL = String.Format(@"select * from t_excelformdata 
                  where operatorcode = '{0}'
                  order by OperateTime DESC, ID ASC limit 300", strUserCode);
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_excelformdata");
        DataGrid1.DataSource = ds;
        DataGrid1.DataBind();

        LB_Sql.Text = strHQL;
    }

    protected void LoadFormType(string strUserCode)
    {
        string strHQL = String.Format(@"select distinct FormType from t_excelformdata 
                  where operatorcode = '{0}'", strUserCode);

        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_excelformdata");
        DL_FormType.DataSource = ds;
        DL_FormType.DataBind();

        DL_FormType.Items.Insert(0, new ListItem("--Select--", ""));
    }


    /// <summary>
    /// 读取Excel[.xls](返回DataTable)
    /// </summary>
    /// <param name="path">Excel路径</param>
    /// <returns></returns>
    public void ExcelFormDataToDataTable(string path)
    {
        DataTable dt = new DataTable();
        IWorkbook workbook;

        try
        {
            string fileExt = System.IO.Path.GetExtension(path).ToLower();
            using (FileStream fs = new FileStream(path, FileMode.Open, FileAccess.Read))
            {
                //XSSFWorkbook 适用XLSX格式，HSSFWorkbook 适用XLS格式
                if (fileExt == ".xlsx") { workbook = new XSSFWorkbook(fs); } else if (fileExt == ".xls") { workbook = new HSSFWorkbook(fs); } else { workbook = null; }
                if (workbook == null) { return; }
                ISheet sheet = workbook.GetSheetAt(0);

                int rfirst = sheet.FirstRowNum;
                int rlast = sheet.LastRowNum;

                IRow row = sheet.GetRow(rfirst);
                int cfirst = row.FirstCellNum;
                int clast = row.LastCellNum;

                string strFormType, strFormName, strFormCode, strRowCode, strFieldName, strFieldValue;

                strFormType = TB_FormType.Text.Trim();
                strFormName = row.GetCell(0).ToString();
                strFormCode = strFormName + DateTime.Now.ToString("yyyyMMddHHMMssff");

                IRow fristRow = sheet.GetRow(rfirst + 1);

                string strOperateTime = DateTime.Now.ToString();

                for (int i = rfirst + 2; i <= rlast; i++)
                {
                    strRowCode = DateTime.Now.ToString("yyyyMMddHHMMssff") + i.ToString();

                    for (int j = 0; j < clast; j++)
                    {
                        strFieldName = fristRow.GetCell(j).ToString();

                        strFieldValue = getCellStringValueAllCase(sheet.GetRow(i).GetCell(j)).ToString();

                        //strFieldValue = sheet.GetRow(i).GetCell(j).ToString();

                        AddFieldValue(strFormType, strFormCode, strFormName, strRowCode, strFieldName, strFieldValue, strOperateTime);
                    }
                }

                sheet = null;
                workbook = null;
            }
        }
        catch (Exception err)
        {
            LB_ErrorText.Text = "Excel格式错误或者Excel正由另一进程在访问" + err.Message.ToString();
        }
    }

    protected void AddFieldValue(string strFormType, string strFormCode, string strFormName, string strRowCode, string strFieldName, string strFieldValue, string strOPerateime)
    {
        string strHQL;

        strHQL = string.Format(@"Insert Into T_ExcelFormData(FormType,FormCode,FormName,RowCode,FieldName,FieldValue,OperatorCode,OperatorName,OPerateTime)
          values('{0}','{1}','{2}','{3}','{4}','{5}','{6}','{7}',cast('{8}' as timestamp))", strFormType, strFormCode, strFormName, strRowCode, strFieldName, strFieldValue, strUserCode, strUserName, strOPerateime);
        ShareClass.RunSqlCommand(strHQL);
    }

    private static string getCellStringValueAllCase(NPOI.SS.UserModel.ICell tCell)
    {
        string tempValue = "";
        switch (tCell.CellType)
        {
            case NPOI.SS.UserModel.CellType.Blank:
                break;
            case NPOI.SS.UserModel.CellType.Boolean:
                tempValue = tCell.BooleanCellValue.ToString();
                break;
            case NPOI.SS.UserModel.CellType.Error:
                break;
            case NPOI.SS.UserModel.CellType.Formula:

                ICellStyle icstyle = tCell.CellStyle;
                if (icstyle.GetDataFormatString().EndsWith("%"))
                {
                    tempValue = tCell.NumericCellValue.ToString("0.00%");
                }
                else
                {
                    NPOI.SS.UserModel.IFormulaEvaluator fe = NPOI.SS.UserModel.WorkbookFactory.CreateFormulaEvaluator(tCell.Sheet.Workbook);
                    var cellValue = fe.Evaluate(tCell);
                    switch (cellValue.CellType)
                    {
                        case NPOI.SS.UserModel.CellType.Blank:
                            break;
                        case NPOI.SS.UserModel.CellType.Boolean:
                            tempValue = cellValue.BooleanValue.ToString();
                            break;
                        case NPOI.SS.UserModel.CellType.Error:
                            break;
                        case NPOI.SS.UserModel.CellType.Formula:
                            break;
                        case NPOI.SS.UserModel.CellType.Numeric:
                            tempValue = cellValue.NumberValue.ToString("0.00");
                            break;
                        case NPOI.SS.UserModel.CellType.String:
                            tempValue = cellValue.StringValue.ToString();
                            break;
                        case NPOI.SS.UserModel.CellType.Unknown:
                            break;


                        default:
                            break;
                    }
                }
                break;
            case NPOI.SS.UserModel.CellType.Numeric:

                ICellStyle icstyle1 = tCell.CellStyle;
                if (icstyle1.GetDataFormatString().EndsWith("%"))
                {
                    tempValue = tCell.NumericCellValue.ToString("0.00%");
                }
                else
                {
                    if (NPOI.SS.UserModel.DateUtil.IsCellDateFormatted(tCell))
                    {
                        tempValue = tCell.DateCellValue.ToString("yyyy-MM-dd");
                    }
                    else
                    {
                        tempValue = tCell.NumericCellValue.ToString();
                    }
                }
                break;
            case NPOI.SS.UserModel.CellType.String:
                tempValue = tCell.StringCellValue.Trim();
                break;
            case NPOI.SS.UserModel.CellType.Unknown:
                break;
            default:
                break;
        }
        return tempValue;
    }



}