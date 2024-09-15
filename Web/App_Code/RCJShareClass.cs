using Npgsql;

using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Text;
using System.Web.UI.WebControls;

/// <summary>
/// RCJShareClass 的摘要说明
/// </summary>
public class RCJShareClass
{
    private const double eps = 1e-7;

    public RCJShareClass()
    {
        //
        // TODO: 在此处添加构造函数逻辑
        //
    }

    public static bool isNumberString(String text)
    {
        if (text.Trim().Length == 0 || ShareClass.CheckIsNumber(text) == false || Convert.ToDouble(text) < (0.0))
            return false;
        return true;
    }

    public static int getMinAdjustID(int projectID, int typeid, int itemno)
    {
        string str = string.Format("{0}{1}{2:00}{3:00}", projectID, typeid, itemno, 1);

        return int.Parse(str);
    }

    public static bool InitPerformanceType(DropDownList ddl_type, Label lb_ShowMessage)
    {
        try
        {
            StringBuilder sb = new StringBuilder(" SELECT * from T_RCJProjectCostPreformanceType");

            DataSet res = ShareClass.GetDataSetFromSqlNOOperateLog(sb.ToString(), "T_RCJProjectCostPreformanceType");

            ddl_type.DataSource = res;
            ddl_type.DataTextField = "TypeName";
            ddl_type.DataValueField = "TypeCode";
            ddl_type.DataBind();
        }
        catch (Exception exp)
        {
            lb_ShowMessage.ForeColor = System.Drawing.Color.Red;
            lb_ShowMessage.Text = "错误提示：加载绩效基准类型信息出错：" + exp.Message;
            return false;
        }

        return true;
    }

    public static bool FloatIsEqual(double a, double b)
    {
        if (Math.Abs(a - b) > eps)
            return false;

        return true;
    }

    public static bool FloatGT(double a, double b)
    {
        if ((a - b) > eps)
            return true;

        return false;
    }

    public static bool IsDate(string StrSource)
    {
        try
        {
            String[] subs = StrSource.Split(' ');
            String[] date = subs[0].Split('/');

            if (date.Length < 3)
                return false;

            int year = Convert.ToInt32(date[0]);
            if (year < 1900 || year > 2100)
            {
                return false;
            }
            int month = Convert.ToInt32(date[1]);
            if (month < 1 || month > 12)
                return false;

            int day = Convert.ToInt32(date[2]);
            if (day < 1 || day > 31)
                return false;

            if ((month == 4 || month == 6 || month == 9 || month == 11) && (day < 1 || day > 30))
                return false;

            if (month == 2)
            {
                if (((year % 4 == 0 && year % 100 != 0) || year % 400 == 0))
                {
                    if (day < 1 || day > 29)
                        return false;
                }
                else
                {
                    if (day < 1 || day > 28)
                        return false;
                }
            }

            if (subs.Length > 1)
            {
                String[] time = subs[1].Split(':');
                if (time.Length < 3)
                    return false;

                int hour = Convert.ToInt32(time[0]);
                if (hour < 0 || hour > 23)
                    return false;

                int min = Convert.ToInt32(time[1]);
                if (min < 0 || min > 59)
                    return false;

                int sec = Convert.ToInt32(time[2]);
                if (sec < 0 || sec > 59)
                    return false;
            }
        }
        catch (Exception exp)
        {
            return false;
        }

        return true;
    }

    public static bool CheckTheItemNumber(int projectid, int typeid, int itemno, int ajustid, String itemNumber)
    {
        try
        {
            List<NpgsqlParameter> para = new List<NpgsqlParameter>();
            para.Add(new NpgsqlParameter("@mpid", projectid.ToString()));
            para.Add(new NpgsqlParameter("@typeid", typeid));
            para.Add(new NpgsqlParameter("@itemno", itemno));
            para.Add(new NpgsqlParameter("@adjustid", ajustid));
            NpgsqlParameter spbcwp = new NpgsqlParameter("@bcwp", "0.0");
            spbcwp.DbType = DbType.Double;
            spbcwp.Direction = ParameterDirection.InputOutput;
            para.Add(spbcwp);
            NpgsqlParameter spcount = new NpgsqlParameter("@itemcount", "0.0");
            spcount.Direction = ParameterDirection.InputOutput;
            spcount.DbType = DbType.Double;
            para.Add(spcount);

            Hashtable htReturn = new Hashtable();
            htReturn.Add("@bcwp", "");
            htReturn.Add("@itemcount", "");
            ShareClass.RunSQLProcedure("Pro_RCJGetBCWPAndItemCount", para, ref htReturn);

            double bcwp = Convert.ToDouble(htReturn["@bcwp"].ToString());
            double count = Convert.ToDouble(htReturn["@itemcount"].ToString());

            if (RCJShareClass.FloatIsEqual(bcwp, 0.0) == true)
            {
                return true;
            }

            if (RCJShareClass.FloatGT(count, Convert.ToDouble(itemNumber)) == true)
            {
                return false;
            }
        }
        catch (Exception exp)
        {
            return false;
        }

        return true;
    }
}