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


using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.IO;

using ProjectMgt.Model;
using ProjectMgt.DAL;
using ProjectMgt.BLL;

public partial class TTWorkFlowDetailMain : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string strID = Request.QueryString["ID"];
        string strStepID;

        string strWLID;
        string strWLName;
        string strHQL;
        IList lst;

        //设置是否自定义工作流模组模式
        Session["DIYWFModule"] = "NO";

        string strUserCode;
        strUserCode = Session["UserCode"].ToString();

        strHQL = "from WorkFlowStepDetail as workFlowStepDetail where workFlowStepDetail.ID = " + strID;
        WorkFlowStepDetailBLL workFlowStepDetailBLL = new WorkFlowStepDetailBLL();
        lst = workFlowStepDetailBLL.GetAllWorkFlowStepDetails(strHQL);
        WorkFlowStepDetail workFlowStepDetail = (WorkFlowStepDetail)lst[0];

        strStepID = workFlowStepDetail.StepID.ToString();
        strWLID = workFlowStepDetail.WLID.ToString().Trim();

        strHQL = "from WorkFlow as workFlow where workFlow.WLID = " + strWLID;
        WorkFlowBLL workFlowBLL = new WorkFlowBLL();
        lst = workFlowBLL.GetAllWorkFlows(strHQL);
        WorkFlow workFlow = (WorkFlow)lst[0];

        strWLName = workFlow.WLName.Trim();

        this.Title = Resources.lang.Workflow + ": " + strWLID + " " + strWLName + Resources.lang.ShenPi;

        //string strTemName;
        //string strCreatorCode;
        //string strCurrentStepSortNumber;
        //strTemName = workFlow.TemName.Trim();
        //strCreatorCode = workFlow.CreatorCode.Trim();
        //strCurrentStepSortNumber = ShareClass.GetWorkFlowCurrentStepSortNumber(strStepID).ToString();
        //string strWFStepJSCode;
        //string strFileName;
        ////附加工作流步骤用户自定义的JSCode到页面
        //strWFStepJSCode = AttachUserJSCodeFromWFTemplateStep(strTemName, strCurrentStepSortNumber, strCreatorCode);
        //strFileName = "WFStepJS" + strID + ".js";
        //WriteFile(strFileName, strWFStepJSCode);
    }


    //从工作流模板步骤上取JS代码附加到页面上
    public string AttachUserJSCodeFromWFTemplateStep(string strWFTemName, string strStepSortNumber, string strWFCreatorCode)
    {
        string strHQL;

        string strJSCode, strUserCode, strDepartCode, strWFCreatorDepartCode;

        strUserCode = HttpContext.Current.Session["UserCode"].ToString().Trim();
        strDepartCode = ShareClass.GetDepartCodeFromUserCode(strUserCode);

        strWFCreatorDepartCode = ShareClass.GetDepartCodeFromUserCode(strWFCreatorCode);

        strHQL = "Select JSCode From T_WFTemplateStepRelatedJSCode Where TemName = " + "'" + strWFTemName + "'" + " and StepSortNumber = " + strStepSortNumber;

        try
        {
            DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_WFTemplateStepRelatedJSCode");

            if (ds.Tables[0].Rows.Count > 0)
            {
                strJSCode = ds.Tables[0].Rows[0][0].ToString().Replace("[TAKETOPUSERCODE]", strUserCode);
                strJSCode = strJSCode.Replace("[TAKETOPUSERNAME]", ShareClass.GetUserName(strUserCode));
                strJSCode = strJSCode.Replace("[TAKETOPDEPARTCODE]", strDepartCode);
                strJSCode = strJSCode.Replace("[TAKETOPDEPARTNAME]", ShareClass.GetDepartName(strDepartCode));
                strJSCode = strJSCode.Replace("[TAKETOPWFCREATORCODE]", strWFCreatorCode);
                strJSCode = strJSCode.Replace("[TAKETOPWFCREATORNAME]", ShareClass.GetUserName(strWFCreatorCode));
                strJSCode = strJSCode.Replace("[TAKETOPWFCREATORDEPARTCODE]", strWFCreatorDepartCode);
                strJSCode = strJSCode.Replace("[TAKETOPWFCREATORDEPARTNAME]", ShareClass.GetDepartName(strWFCreatorDepartCode));

                return "<script type=\"text/javascript\">" + strJSCode + "</script>";
            }
            else
            {
                return "";
            }
        }
        catch
        {
            return "";
        }
    }

    public void WriteFile(string strFileName, string strContent)
    {
        string strFile;
        strFile = Server.MapPath("Doc") + "\\xml\\" + strFileName;

        FileInfo fi = new FileInfo(strFile);

        if (fi.Exists)
        {
            fi.Delete();
        }

        // 在当前目录创建一个文件myfile.txt，对该文件具有读写权限
        FileStream fsMyfile = new FileStream(strFile, FileMode.Create, FileAccess.ReadWrite);
        //写入
        StreamWriter swMyfile = new StreamWriter(fsMyfile);

        swMyfile.WriteLine(strContent);
        swMyfile.Flush();
    }
}
