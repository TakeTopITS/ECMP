using System;
using System.Resources;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using ProjectMgt.BLL;
using ProjectMgt.Model;
using NPOI.SS.Formula.Functions;

public partial class TTAddWFTemplateStepJSCodeToForm : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string strLangCode = Session["LangCode"].ToString();
        string strUserCode = Session["UserCode"].ToString();

        ProjectMemberBLL projectMemberBLL = new ProjectMemberBLL();
        Label1.Text = ShareClass.GetPageTitle(this.GetType().BaseType.Name + ".aspx"); bool blVisible = TakeTopSecurity.TakeTopLicense.GetAuthobility(this.GetType().BaseType.Name + ".aspx", strUserCode);  //Label1.Text = ShareClass.GetPageTitle(this.GetType().BaseType.Name + ".aspx"); bool blVisible = TakeTopSecurity.TakeTopLicense.GetAuthobility(this.GetType().BaseType.Name + ".aspx", "流程步骤JS代码", strUserCode);
        if (blVisible == false)
        {
            Response.Redirect("TTDisplayErrors.aspx");
            return;
        }

        //ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "clickA", " aHandler();", true);
        if (Page.IsPostBack == false)
        {
            ShareClass.LoadWorkflowType(DL_WLType, strLangCode);

            DL_WLType_SelectedIndexChanged(null, null);

            //LBL_JSCODEDescription.Text = "编码说明：域规则：+：TAKETOP[PLUS]，-：TAKETOP[MINUS]";

            BindWebServicesData();
        }
    }

    protected void DL_WLType_SelectedIndexChanged(object sender, EventArgs e)
    {
        string strHQL, strWLType;

        strWLType = DL_WLType.SelectedValue.Trim();
        if (string.IsNullOrEmpty(strWLType))
        {
            return;
        }
        strHQL = "Select TemName From T_WorkFlowTemplate Where type = " + "'" + strWLType + "'" + " and Visible = 'YES' and Authority = '所有'";
        strHQL += " Order by SortNumber ASC";
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_WorkFlowTemplate");
        DL_WFTemplate.DataSource = ds;
        DL_WFTemplate.DataBind();

        DL_WFTemplate.Items.Add(new ListItem(""));

        DL_WFTemplate_SelectedIndexChanged(null, null);
    }

    protected void DL_WFTemplate_SelectedIndexChanged(object sender, EventArgs e)
    {
        string strHQL;
        IList lst;

        string strTemName;

        strTemName = DL_WFTemplate.SelectedValue.Trim();

        strHQL = "From WFTemplateRelatedJSCode as wfTemplateRelatedJSCode where TemName = " + "'" + strTemName + "'";
        WFTemplateRelatedJSCodeBLL wfTemplateRelatedJSCodeBLL = new WFTemplateRelatedJSCodeBLL();
        lst = wfTemplateRelatedJSCodeBLL.GetAllWFTemplateRelatedJSCodes(strHQL);

        string strWFStepHQL = string.Empty;
        strWFStepHQL = string.Format("from WorkFlowTStep as workFlowTStep where workFlowTStep.TemName = '{0}' Order By workFlowTStep.SortNumber ASC", strTemName);
        WorkFlowTStepBLL workFlowTStepBLL = new WorkFlowTStepBLL();
        IList lstWFStep = workFlowTStepBLL.GetAllWorkFlowTSteps(strWFStepHQL);
        LIB_WFStep.Items.Clear();
        if (lstWFStep != null && lstWFStep.Count > 0)
        {
            for (int i = 0; i < lstWFStep.Count; i++)
            {
                WorkFlowTStep workFlowTStep = (WorkFlowTStep)lstWFStep[i];
                LIB_WFStep.Items.Add(new ListItem(workFlowTStep.SortNumber + "." + workFlowTStep.StepName, workFlowTStep.SortNumber + "|" + workFlowTStep.StepName));
            }
        }

        if (lst.Count > 0)
        {
            WFTemplateRelatedJSCode wfTemplateRelatedJSCode = (WFTemplateRelatedJSCode)lst[0];
            TXT_JSCode.Value = wfTemplateRelatedJSCode.JSCode.Trim();
            TXT_Comment.Value = wfTemplateRelatedJSCode.Comment.Trim();
            LBL_Description.Text = strTemName + "-JSCode";


            //LIB_WFStep.DataSource = lstWFStep;
            //LIB_WFStep.DataBind();
        }
        else
        {
            TXT_JSCode.Value = "";
            TXT_Comment.Value = "";
            LBL_Description.Text = strTemName + "-JSCode";
            //LIB_WFStep.Items.Clear();
        }
    }

    protected void LIB_WFStep_SelectedIndexChanged(object sender, EventArgs e)
    {
        string strWFStepHQL;
        IList lstWFStep;

        string strTemName;
        int intSortNumber = 0;
        string strStepName;
        strTemName = DL_WFTemplate.SelectedValue.Trim();
        string strStepNumberName = LIB_WFStep.SelectedItem.Text;
        string[] ArrNumberName = strStepNumberName.Split('.');
        int.TryParse(ArrNumberName[0], out intSortNumber);
        strStepName = ArrNumberName[1];

        //strWFStepHQL = " from WFTemplateStepRelatedJSCode as wFTemplateStepRelatedJSCode where TemName = " + "'" + strTemName + "' and StepSortNumber = " + intSortNumber + "and StepName= '" + strStepName + "'";
        strWFStepHQL = " from WFTemplateStepRelatedJSCode as wFTemplateStepRelatedJSCode where TemName = " + "'" + strTemName + "' and StepSortNumber = " + intSortNumber;
        WFTemplateStepRelatedJSCodeBLL wFTemplateStepRelatedJSCodeBLL = new WFTemplateStepRelatedJSCodeBLL();
        lstWFStep = wFTemplateStepRelatedJSCodeBLL.GetAllWFTemplateStepRelatedJSCodes(strWFStepHQL);

        if (lstWFStep.Count > 0)
        {
            WFTemplateStepRelatedJSCode wFTemplateStepRelatedJSCode = (WFTemplateStepRelatedJSCode)lstWFStep[0];
      

            if (wFTemplateStepRelatedJSCode.JSCode.IndexOf("function setFormCommentControlValue") < 0)
            {
                wFTemplateStepRelatedJSCode.JSCode += @"

function setFormCommentControlValue(commentValue) 
{
    ////同步审批意见到表单的某意见栏
  
    ////给工作流表单页面某控件赋值,controlID是接受意见的元素ID
     //parent.frames['right'].setControlValue(controlID,commentValue);


}



 ";
            }


            if (wFTemplateStepRelatedJSCode.JSCode.IndexOf("function setControlValue(controlID,controlValue)") < 0)
            {
                wFTemplateStepRelatedJSCode.JSCode += @"

function setControlValue(controlID,controlValue)
{
  ////给步骤方法调用，给表单上某控件赋值
   //this.document.getElementById(controlID).value = controlValue;

 ////通过代码改变的控件内容，必须调用此方法才能保存
  // TakeTopInfoPath_OnControlChange(null, document.getElementById(controlID));


    return;
}



 ";
            }

            TXT_JSCode.Value = wFTemplateStepRelatedJSCode.JSCode.Trim();


            TXT_Comment.Value = wFTemplateStepRelatedJSCode.Comment.Trim();
            HF_ID.Value = wFTemplateStepRelatedJSCode.ID.ToString();
            LBL_Description.Text = strTemName + "-" + strStepName + "-JSCode";

            //Web Service方法
            string strWebServiceSql = string.Empty;
            WFTemplateStepRelatedWebServiceBLL wFTemplateStepRelatedWebServiceBLL = new WFTemplateStepRelatedWebServiceBLL();
            //strWebServiceSql = string.Format("from WFTemplateStepRelatedWebService as wFTemplateStepRelatedWebService where TemName = '{0}' and StepSortNumber = {1} and StepName = '{2}'", strTemName, intSortNumber, strStepName);
            strWebServiceSql = string.Format("from WFTemplateStepRelatedWebService as wFTemplateStepRelatedWebService where TemName = '{0}' and StepSortNumber = {1} ", strTemName, intSortNumber, strStepName);

            IList listWebService = wFTemplateStepRelatedWebServiceBLL.GetAllWFTemplateStepRelatedWebServices(strWebServiceSql);
            DL_WebService.Items.Clear();
            if (listWebService != null && listWebService.Count > 0)
            {
                for (int i = 0; i < listWebService.Count; i++)
                {
                    WFTemplateStepRelatedWebService wFTemplateStepRelatedWebService = (WFTemplateStepRelatedWebService)listWebService[i];
                    DL_WebService.Items.Add(new ListItem(wFTemplateStepRelatedWebService.WebServiceName + ":" + wFTemplateStepRelatedWebService.MethodName, wFTemplateStepRelatedWebService.WebServiceName + ":" + wFTemplateStepRelatedWebService.MethodName));
                }
            }
        }
        else
        {
            TXT_JSCode.Value = @"
function BeforeAgree()
{
    //批准之前执行，返回值为true,则执行批准动作
    //打开相关模块页面示例: 
    //弹出层方式: top.frames[0].frames[2].parent.frames['rightTabFrame'].popShowByURL('TTMakeConstract.aspx', '建立合同', 800, 600,window.location);
    //TAB页方式: top.frames[0].frames[2].parent.frames['rightTabFrame'].addTab('建立合同', 'TTMakeConstract.aspx', 'old');

    ////给工作流表单页面某控件赋值 
    //parent.frames['right'].setControlValue(controlID,controlValue);
 

    return true;
}
function BeforeRefuseAgree()
{
    //驳回终止之前执行，返回值为true,则执行驳回终止动作
    //打开相关模块页面示例:
    //弹出层方式: top.frames[0].frames[2].parent.frames['rightTabFrame'].popShowByURL('TTMakeConstract.aspx', '建立合同', 800, 600,window.location);
    //TAB页方式: top.frames[0].frames[2].parent.frames['rightTabFrame'].addTab('建立合同', 'TTMakeConstract.aspx', 'old');

    ////给工作流表单页面某控件赋值 
    //parent.frames['right'].setControlValue(controlID,controlValue);


    return true;
}
function BeforeCancelAgree()
{
    //撤消批准之前执行，返回值为true,则执行取消批准动作
    //打开相关模块页面示例:
    //弹出层方式: top.frames[0].frames[2].parent.frames['rightTabFrame'].popShowByURL('TTMakeConstract.aspx', '建立合同', 800, 600,window.location);
    //TAB页方式: top.frames[0].frames[2].parent.frames['rightTabFrame'].addTab('建立合同', 'TTMakeConstract.aspx', 'old');

    ////给工作流表单页面某控件赋值 
    //parent.frames['right'].setControlValue(controlID,controlValue);


     return true;
}
function BeforeBackPirorStep()
{
    //返回前面步骤之前执行，返回值为true,则执行返回前步动作
    //打开相关模块页面示例:
    //弹出层方式: top.frames[0].frames[2].parent.frames['rightTabFrame'].popShowByURL('TTMakeConstract.aspx', '建立合同', 800, 600,window.location);
    //TAB页方式: top.frames[0].frames[2].parent.frames['rightTabFrame'].addTab('建立合同', 'TTMakeConstract.aspx', 'old');

    ////给工作流表单页面某控件赋值 
    //parent.frames['right'].setControlValue(controlID,controlValue);



     return true;
}

function AfterAgree()
{
    //批准通过成功之后执行 
    //打开相关模块页面示例: 
    //弹出层方式: top.frames[0].frames[2].parent.frames['rightTabFrame'].popShowByURL('TTMakeConstract.aspx', '建立合同', 800, 600,window.location);
    //TAB页方式: top.frames[0].frames[2].parent.frames['rightTabFrame'].addTab('建立合同', 'TTMakeConstract.aspx', 'old');

    return true;
}
function AfterRefuseAgree()
{
    //驳回终止成功之后执行
    //打开相关模块页面示例:
    //弹出层方式: top.frames[0].frames[2].parent.frames['rightTabFrame'].popShowByURL('TTMakeConstract.aspx', '建立合同', 800, 600,window.location);
    //TAB页方式: top.frames[0].frames[2].parent.frames['rightTabFrame'].addTab('建立合同', 'TTMakeConstract.aspx', 'old');


     return true;
}
function AfterCancelAgree()
{
    //撤消批准成功之后执行
    //打开相关模块页面示例:
    //弹出层方式: top.frames[0].frames[2].parent.frames['rightTabFrame'].popShowByURL('TTMakeConstract.aspx', '建立合同', 800, 600,window.location);
    //TAB页方式: top.frames[0].frames[2].parent.frames['rightTabFrame'].addTab('建立合同', 'TTMakeConstract.aspx', 'old');


     return true;
}
function AfterBackPirorStep()
{
    //批准返回步骤成功之后执行
    //打开相关模块页面示例:
    //弹出层方式: top.frames[0].frames[2].parent.frames['rightTabFrame'].popShowByURL('TTMakeConstract.aspx', '建立合同', 800, 600,window.location);
    //TAB页方式: top.frames[0].frames[2].parent.frames['rightTabFrame'].addTab('建立合同', 'TTMakeConstract.aspx', 'old');


     return true;
}

function getRelatedData()
{
    //取得相关数据作审批参考
    //打开相关模块页面示例:
    //弹出层方式: top.frames[0].frames[2].parent.frames['rightTabFrame'].popShowByURL('TTMakeConstract.aspx', '建立合同', 800, 600,window.location);
    //TAB页方式: top.frames[0].frames[2].parent.frames['rightTabFrame'].addTab('建立合同', 'TTMakeConstract.aspx', 'old');


     return true;
}


function setFormCommentControlValue(commentValue) 
{
    ////同步审批意见到表单的某意见栏
  
    ////给工作流表单页面某控件赋值 
    //parent.frames['right'].setControlValue(controlID,commentValue);

}


function setControlValue(controlID,controlValue)
{
   ////给步骤方法调用，给表单上某控件赋值
   //this.document.getElementById(controlID).value = controlValue;

  ////通过代码改变的控件内容，必须调用此方法才能保存
   // TakeTopInfoPath_OnControlChange(null, document.getElementById(controlID));

    return;
}


function setWorkflowForm()
{
    //设置流程表单各种属性，如要在流程发起阶段执行代码，必须添加步序为0的步骤，代码写在此步上
    //隐藏元素示例代码（元素ID可在网页上此元素上按右键查看取得）
    //this.document.getElementById('元素ID').style.display = 'none';

    //var strRelatedID = GetQueryString('RelatedID');
    //this.document.getElementById('元素ID').value = 111;
    ////通过代码改变的控件内空，必须调用此方法才能保存
    // TakeTopInfoPath_OnControlChange(null, document.getElementById('元素ID'));

    try
    {
      //在这里运行代码


    }
    catch (err)
    {
      //在这里处理错误


    }

     return true;
}
";
            TXT_Comment.Value = "";
            HF_ID.Value = "0";
            LBL_Description.Text = strTemName + "-" + strStepName + "-JSCode";
            DL_WebService.Items.Clear();
        }
    }

    private void BindWebServicesData()
    {
        WebServiceBLL webServiceBLL = new WebServiceBLL();
        string strWebServiceSql = "from WebService as webService order by CreateTime desc";
        IList webServiceList = webServiceBLL.GetAllWebServices(strWebServiceSql);
        LIB_WebService.Items.Clear();
        if (webServiceList != null && webServiceList.Count > 0)
        {
            for (int i = 0; i < webServiceList.Count; i++)
            {
                WebService webService = (WebService)webServiceList[i];
                LIB_WebService.Items.Add(new ListItem(webService.WebServiceName + ":" + webService.MethodName, webService.Comment));
            }
        }

        //LIB_WebService.DataSource = webServiceList;
        //LIB_WebService.DataBind();
    }
}