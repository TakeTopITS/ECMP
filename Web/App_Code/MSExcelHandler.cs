using NPOI.HSSF.UserModel;
using NPOI.SS.UserModel;
using NPOI.XSSF.UserModel;

using System;
using System.Data;
using System.IO;
using System.Web;


/// <summary>
/// ImportFromExcelToDB 的摘要说明
/// </summary>
public class MSExcelHandler
{
    public MSExcelHandler()
    {
        //
        // TODO: 在此处添加构造函数逻辑
        //
    }

    /// <summary>
    /// 读取Excel[.xls](返回DataTable)
    /// </summary>
    /// <param name="path">Excel路径</param>
    /// <returns></returns>
    public static DataTable ReadExcelToDataTable(string path, string table)
    {
        DataTable dt = new DataTable();
        IWorkbook workbook;

        try
        {
            string fileExt = Path.GetExtension(path).ToLower();
            using (FileStream fs = new FileStream(path, FileMode.Open, FileAccess.Read))
            {
                //XSSFWorkbook 适用XLSX格式，HSSFWorkbook 适用XLS格式
                if (fileExt == ".xlsx") { workbook = new XSSFWorkbook(fs); } else if (fileExt == ".xls") { workbook = new HSSFWorkbook(fs); } else { workbook = null; }
                if (workbook == null) { return null; }
                ISheet sheet = workbook.GetSheetAt(0);

                int rfirst = sheet.FirstRowNum;
                int rlast = sheet.LastRowNum;
                IRow row = sheet.GetRow(rfirst);
                int cfirst = row.FirstCellNum;
                int clast = row.LastCellNum;
                for (int i = cfirst; i < clast; i++)
                {
                    if (row.GetCell(i) != null)
                        dt.Columns.Add(row.GetCell(i).StringCellValue, System.Type.GetType("System.String"));
                }
                row = null;
                for (int i = rfirst + 1; i <= rlast; i++)
                {
                    DataRow r = dt.NewRow();
                    IRow ir = sheet.GetRow(i);

                    for (int j = cfirst; j < clast; j++)
                    {
                        if (ir.GetCell(j) != null)
                        {
                            ////如果是公式Cell 
                            ////则仅读取其Cell单元格的显示值 而不是读取公式
                            //if (ir.GetCell(j).CellType == CellType.Formula)
                            //{
                            //    ir.GetCell(j).SetCellType(CellType.String);
                            //    r[j] = ir.GetCell(j).StringCellValue;
                            //}
                            //else
                            //{
                            //    r[j] = ir.GetCell(j).ToString();
                            //}

                            r[j] = getCellStringValueAllCase(ir.GetCell(j)).ToString();

                        }
                    }
                    dt.Rows.Add(r);
                    ir = null;
                    r = null;
                }
                sheet = null;
                workbook = null;
            }
            return dt;
        }
        catch
        {
            System.Windows.Forms.MessageBox.Show("Excel格式错误或者Excel正由另一进程在访问");
            return null;
        }
    }

    /// <summary>
    /// Datable导出成Excel
    /// </summary>
    /// <param name="dt"></param>
    /// <param name="file">导出路径(包括文件名与扩展名)</param>
    public static void DataTableToExcel(string strHQL, string file)
    {
        string path;
        path = HttpContext.Current.Server.MapPath("Doc") + "\\" + DateTime.Now.ToString("yyyyMM") + "\\" + HttpContext.Current.Session["UserCode"].ToString() + "\\Doc\\" + file;

        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_Excel");
        DataTable dt = ds.Tables[0];

        IWorkbook workbook;
        string fileExt = Path.GetExtension(path).ToLower();
        if (fileExt == ".xlsx") { workbook = new XSSFWorkbook(); } else if (fileExt == ".xls") { workbook = new HSSFWorkbook(); } else { workbook = null; }
        if (workbook == null) { return; }
        ISheet sheet = string.IsNullOrEmpty(dt.TableName) ? workbook.CreateSheet("Sheet1") : workbook.CreateSheet(dt.TableName);

        //表头  
        IRow row = sheet.CreateRow(0);
        for (int i = 0; i < dt.Columns.Count; i++)
        {
            ICell cell = row.CreateCell(i);
            cell.SetCellValue(dt.Columns[i].ColumnName);
        }

        //数据  
        for (int i = 0; i < dt.Rows.Count; i++)
        {
            IRow row1 = sheet.CreateRow(i + 1);
            for (int j = 0; j < dt.Columns.Count; j++)
            {
                ICell cell = row1.CreateCell(j);
                cell.SetCellValue(dt.Rows[i][j].ToString());
            }
        }

        //转为字节数组  
        MemoryStream stream = new MemoryStream();
        workbook.Write(stream);
        var buf = stream.ToArray();

        ////保存为Excel文件  
        //using (FileStream fs = new FileStream(path, FileMode.Create, FileAccess.Write))
        //{
        //    fs.Write(buf, 0, buf.Length);
        //    fs.Flush();
        //}

        //开始调用html页面下载窗
        HttpContext.Current.Response.ContentType = "application/octet-stream;";

        //通知浏览器下载文件而不是打开;对中文名称进行编码
        HttpContext.Current.Response.AddHeader("Content-Disposition", "attachment; filename=\"" + HttpUtility.UrlEncode(file, System.Text.Encoding.UTF8) + "\"");
        HttpContext.Current.Response.BinaryWrite(buf);
        HttpContext.Current.Response.Flush();
        HttpContext.Current.Response.End();
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
                            tempValue = cellValue.NumberValue.ToString();
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