<%@ WebHandler Language="C#" Class="InsertReceiveAndPayAccount" %>

using System;
using System.Resources;
using System.Web;
using System.Web.UI;
using System.Collections;
using ProjectMgt.BLL;
using Newtonsoft.Json;
using System.Data;
using System.Web.SessionState;

using ProjectMgt.Model;
using ProjectMgt.DAL;

public class InsertReceiveAndPayAccount : IHttpHandler
{

    public void ProcessRequest(HttpContext context)
    {
        string result = runRequest(context);
        string jsonStr = JsonConvert.SerializeObject(result);

        context.Response.ContentType = "text/plain";
        context.Response.Write(jsonStr);
    }

    private string runRequest(HttpContext context)
    {
        string strHQL;

        string strReOrPay, strFromCode, strRelatedType, strRelatedID, strRelatedRecordID, strAccountCode, strAccountName, strCurrencyType, strOperatorCode, strOperatorName;
        string strPayMethod, strReAndPayer;
        string strRelatedProjectID;
        string strExpenseDecription, strAmount;

        strReOrPay = context.Request.Form["ReOrPay"];  // Payables or  Receivables
        strFromCode = context.Request.Form["FromCode"];  //时间戳
        strRelatedType = context.Request.Form["RelatedType"]; //关联类型，没有就用 Other
        strRelatedID = context.Request.Form["RelatedID"];   //没用就用 0

        strRelatedRecordID = context.Request.Form["RelatedRecordID"]; //没用就用 0
        strAccountCode = context.Request.Form["AccountCode"]; //会计科目代码
        strAccountName = context.Request.Form["AccountName"]; //会计科目名称

        strCurrencyType = context.Request.Form["CurrencyType"]; //币别类型

        strOperatorCode = context.Request.Form["OperatorCode"]; //操作者代码
        strOperatorName = context.Request.Form["OperatorName"]; //操作者名称

        strPayMethod = context.Request.Form["PayMethod"];  //付款方式，没有就用 转帐
        strReAndPayer = context.Request.Form["ReAndPayer"]; // 收款方 或 付款方

        strRelatedProjectID = context.Request.Form["RelatedProjectID"]; //关联项目ID，没用就用 0

        strExpenseDecription = context.Request.Form["ExpenseDecription"]; //费用用途或描述
        strAmount = context.Request.Form["Amount"]; //金额

        try
        {

            if (strReOrPay == "Payables")
            {
                strHQL = "Delete FRom T_constractPayableRecord Where PayableID in (Select ID From T_constractPayable Where FromCode = '" + strFromCode + "')";
                ShareClass.RunSqlCommand(strHQL);
                strHQL = "Delete From T_constractPayable Where FromCode = '" + strFromCode + "'";
                ShareClass.RunSqlCommand(strHQL);

                int intReAndPayalbeID = ShareClass.InsertReceivablesOrPayableByAccount("Payables", strFromCode, strRelatedType, strRelatedID, strRelatedRecordID, strAccountCode, strAccountName, decimal.Parse(strAmount), strCurrencyType, strReAndPayer, strOperatorCode, int.Parse(strRelatedProjectID));
                ShareClass.InsertReceivablesOrPayableRecord("Payables", intReAndPayalbeID, decimal.Parse(strAmount), strCurrencyType, strPayMethod, strReAndPayer, strOperatorCode, int.Parse(strRelatedProjectID));

                strHQL = "Update T_ConstractPayable Set OutOfPocketAccount = " + strAmount + ",UNPayAmount = 0,FromCode = '" + strFromCode + "' Where ID = " + intReAndPayalbeID.ToString();
                ShareClass.RunSqlCommand(strHQL);

                //把申报费用列入项目费用
                if (int.Parse(strRelatedProjectID) > 1)
                {
                    ShareClass.AddConstractPayAmountToProExpense(strRelatedProjectID, intReAndPayalbeID.ToString(), strAccountCode, strAccountName, strExpenseDecription, decimal.Parse(strAmount), strCurrencyType, strOperatorCode, strOperatorName);
                }
            }

            if (strReOrPay == "Receivables")
            {
                strHQL = "Delete FRom T_constractReceivablesRecord Where ReceivablesID in (Select ID From T_constractReceivables Where FromCode = '" + strFromCode + "')";
                ShareClass.RunSqlCommand(strHQL);
                strHQL = "Delete From T_constractReceivables Where FromCode = '" + strFromCode + "'";
                ShareClass.RunSqlCommand(strHQL);

                int intReAndPayalbeID = ShareClass.InsertReceivablesOrPayableByAccount("Receivables", strFromCode, strRelatedType, strRelatedID, strRelatedRecordID, strAccountCode, strAccountName, decimal.Parse(strAmount), strCurrencyType, strReAndPayer, strOperatorCode, int.Parse(strRelatedProjectID));
                ShareClass.InsertReceivablesOrPayableRecord("Receivables", intReAndPayalbeID, decimal.Parse(strAmount), strCurrencyType, strPayMethod, strReAndPayer, strOperatorCode, int.Parse(strRelatedProjectID));

                strHQL = "Update T_constractReceivables Set ReceiverAccount = " + strAmount + ",UNReceiveAmount = 0,FromCode = '" + strFromCode + "' Where ID = " + intReAndPayalbeID.ToString();
                ShareClass.RunSqlCommand(strHQL);
            }

            return "Sucessfully";

        }
        catch (Exception err)
        {
           return "failed, Error page: " + "\n" + err.Message.ToString() + "\n" + err.StackTrace;
        }
     
    }

    //保存用户操作日志到日志表
    public static void InsertUserOperateLog(string strHQL)
    {
        string strSQL;
        string strUserCode, strUserName, strUserIP;


        try
        {

            if (HttpContext.Current.Session["UserCode"] != null & HttpContext.Current.Session["UserName"] != null)
            {
                strUserCode = HttpContext.Current.Session["UserCode"].ToString().Trim();
                strUserName = HttpContext.Current.Session["UserName"].ToString();
                strUserIP = HttpContext.Current.Request.UserHostAddress.Trim();

                strHQL = strHQL.Replace("'", "''");

                new System.Threading.Thread(delegate ()
                {
                    try
                    {
                        strSQL = "Insert into T_UserOperateLog(UserCode,UserName,UserIP,OperateContent,OperateTime) ";
                        strSQL += " Values(" + "'" + strUserCode + "'" + "," + "'" + strUserName + "'" + "," + "'" + strUserIP + "'" + "," + "'" + strHQL + "'" + ",now())";

                        ShareClass.RunSqlCommandForNOOperateLog(strSQL);
                    }
                    catch
                    {
                    }
                }).Start();
            }

        }
        catch
        {
        }
    }


    public bool IsReusable
    {
        get
        {
            return false;
        }
    }

}