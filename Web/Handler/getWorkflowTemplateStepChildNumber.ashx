<%@ WebHandler Language="C#" Class="getWorkflowTemplateStepChildNumber" %>

using System;
using System.Resources;
using System.Web;
using System.Collections;
using ProjectMgt.BLL;
using Newtonsoft.Json;
using System.Data;

public class getWorkflowTemplateStepChildNumber : IHttpHandler
{


    string result = "";

    public void ProcessRequest(HttpContext context)
    {
        ////获取一同发送过来的参数
        //string command = context.Request["cmd"];

        context.Response.ContentType = "text/plain";

        //用来传回去的内容
        //context.Response.Write("Hello World");

        Get_Data01(context);
    }

    public void Get_Data01(HttpContext context)
    {
        string strHQL;
        string strTStepID;

        string strGUID = context.Request["GUID"];

        HttpContext.Current.Response.ContentType = "text/plain";

        try
        {
            DataSet ds1,ds2;
            strHQL = "Select StepID from T_WorkFlowTStep where GUID = " + "'" + strGUID + "'";
            ds1 = ShareClass.GetDataSetFromSql(strHQL, "T_WorkFlowTStep");
            if (ds1.Tables[0].Rows.Count > 0)
            {
                strTStepID = ds1.Tables[0].Rows[0][0].ToString();

                strHQL = "Select * From T_WFTStepRelatedTem Where RelatedStepID=" + strTStepID;
                ds2 = ShareClass.GetDataSetFromSql(strHQL, "T_WFTStepRelatedTem ");
                if (ds2.Tables[0].Rows.Count > 0)
                {
                    HttpContext.Current.Response.Write(ds2.Tables[0].Rows.Count.ToString());
                }
            }
        }
        catch (Exception err)
        {
            HttpContext.Current.Response.Write("0");
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
