using ProjectMgt.BLL;
using ProjectMgt.Model;

using System;
using System.Collections;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;

public partial class TTAddJSCodeToForm : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string strLangCode = Session["LangCode"].ToString();
        string strUserCode = Session["UserCode"].ToString();

        ProjectMemberBLL projectMemberBLL = new ProjectMemberBLL();
        Label1.Text = ShareClass.GetPageTitle(this.GetType().BaseType.Name + ".aspx"); bool blVisible = TakeTopSecurity.TakeTopLicense.GetAuthobility(this.GetType().BaseType.Name + ".aspx", strUserCode);  //Label1.Text = ShareClass.GetPageTitle(this.GetType().BaseType.Name + ".aspx"); bool blVisible = TakeTopSecurity.TakeTopLicense.GetAuthobility(this.GetType().BaseType.Name + ".aspx", "流程表单JS代码", strUserCode);
        if (blVisible == false)
        {
            Response.Redirect("TTDisplayErrors.aspx");
            return;
        }

        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "clickA", " aHandler();", true);
        if (Page.IsPostBack == false)
        {
            ShareClass.LoadWorkflowType(DL_WLType, strLangCode);

            DL_WLType_SelectedIndexChanged(null, null);
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

        string strTemName, strJSCode = "", strJSCode1 = "", strJSCode2 = "";

        strJSCode1 += @"
jQuery.noConflict();

//取得URL参数的值
function GetQueryValue(queryName) {
    var query = decodeURI(window.location.search.substring(1));
    var vars = query.split('&');
    for (var i = 0; i < vars.length; i++)
        {
            var pair = vars[i].split('=');
            if (pair[0] == queryName) { return pair[1]; }
        }
        return null;
    }

//供Jquery(document).ready调用的函数，发起工作流的页面会单独调用执行
var jqueryDocumentReady = function() {

    ////取得页面传入的参数值
    //var strRelatedID = GetQueryValue('RelatedID');
    //this.document.getElementById('元素ID').value = 111;
    ////通过代码改变的控件内容，必须调用此方法才能保存
    // TakeTopInfoPath_OnControlChange(null, document.getElementById('元素ID'));


    };

//初始化页面，写法可以参考本页顶部的示例（点击可打开示例页面）
jQuery(document).ready(jqueryDocumentReady);


";

        strJSCode2 += @"


//调用一般处理程序，保存表单数据到后台数据库
function saveWFFormDataToDatabase(intWLID)
{


    return;
}


";


        strTemName = DL_WFTemplate.SelectedValue.Trim();
        strHQL = "From WFTemplateRelatedJSCode as wfTemplateRelatedJSCode where TemName = " + "'" + strTemName + "'";
        WFTemplateRelatedJSCodeBLL wfTemplateRelatedJSCodeBLL = new WFTemplateRelatedJSCodeBLL();
        lst = wfTemplateRelatedJSCodeBLL.GetAllWFTemplateRelatedJSCodes(strHQL);
        if (lst.Count > 0)
        {
            WFTemplateRelatedJSCode wfTemplateRelatedJSCode = (WFTemplateRelatedJSCode)lst[0];


            if (wfTemplateRelatedJSCode.JSCode.Trim().IndexOf("jQuery(document).ready") < 0)
            {
                strJSCode += strJSCode1;
            }

            if (wfTemplateRelatedJSCode.JSCode.Trim().IndexOf("saveWFFormDataToDatabase") < 0)
            {
                strJSCode += strJSCode2;
            }

            if (wfTemplateRelatedJSCode.JSCode.Trim().IndexOf("jQuery(document).ready") >= 0)
            {
                TXT_JSCode.Value = wfTemplateRelatedJSCode.JSCode.Trim() + strJSCode;
            }
            else
            {
                TXT_JSCode.Value = strJSCode + wfTemplateRelatedJSCode.JSCode.Trim();
            }

            TXT_Comment.Value = wfTemplateRelatedJSCode.Comment.Trim();
            HF_ID.Value = wfTemplateRelatedJSCode.ID.ToString();
        }
        else
        {

            TXT_JSCode.Value = strJSCode1 + strJSCode2;
            TXT_Comment.Value = "";
            HF_ID.Value = "0";
        }

        //列出流程模板JS代码
        LoadWFTemJSCodeID(strTemName);
    }

    protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        if (e.CommandName != "Page")
        {
            string strHQL;
            IList lst;

            string strJSCodeID;


            for (int i = 0; i < Repeater1.Items.Count; i++)
            {
                ((Button)Repeater1.Items[i].FindControl("BT_WFTemJSCodeID")).ForeColor = Color.White;
            }
            ((Button)e.Item.FindControl("BT_WFTemJSCodeID")).ForeColor = Color.Red;

            strJSCodeID = ((Button)e.Item.FindControl("BT_WFTemJSCodeID")).Text.Trim();


            strHQL = "From WFTemplateRelatedJSCode as wfTemplateRelatedJSCode where ID = " + strJSCodeID;
            WFTemplateRelatedJSCodeBLL wfTemplateRelatedJSCodeBLL = new WFTemplateRelatedJSCodeBLL();
            lst = wfTemplateRelatedJSCodeBLL.GetAllWFTemplateRelatedJSCodes(strHQL);

            WFTemplateRelatedJSCode wfTemplateRelatedJSCode = (WFTemplateRelatedJSCode)lst[0];
            TXT_JSCode.Value = wfTemplateRelatedJSCode.JSCode.Trim();

            TXT_Comment.Value = wfTemplateRelatedJSCode.Comment.Trim();
            HF_ID.Value = strJSCodeID;

            if (Repeater1.Items.Count > 1)
            {
                BT_DeleteByID.Visible = true;
            }
            else
            {
                BT_DeleteByID.Visible = false;
            }
        }
    }

    protected void BT_DeleteByID_Click(object sender, EventArgs e)
    {
        string strHQL;

        if (Repeater1.Items.Count > 1)
        {
            if (HF_ID.Value != "0" & HF_ID.Value != "")
            {
                strHQL = "Delete From T_WFTemplateRelatedJSCode Where ID = " + HF_ID.Value;
                ShareClass.RunSqlCommand(strHQL);

                //列出流程模板JS代码
                LoadWFTemJSCodeID(DL_WFTemplate.SelectedValue.Trim());

                HF_ID.Value = "";

                BT_DeleteByID.Visible = false;
            }
            else
            {
                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('提示，请先选择要删除的JSCode的ID号！')", true);
            }
        }
    }

    protected void LoadWFTemJSCodeID(string strTemName)
    {
        string strHQL;

        strHQL = "Select ID From T_WFTemplateRelatedJSCode Where TemName = '" + strTemName + "' Order By ID ASC";
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_WFTemplateRelatedJSCode");

        Repeater1.DataSource = ds;
        Repeater1.DataBind();
    }

    protected void BT_SaveCode_Click(object sender, EventArgs e)
    {
        string result = string.Empty;

        try
        {
            string strJSCode = TXT_JSCode.Value;
            string strTemName = DL_WFTemplate.SelectedValue;
            string strComment = TXT_Comment.Value;
            int intID = int.Parse(HF_ID.Value);


            strJSCode = strJSCode.Replace("TAKETOP[PLUS]", "+");

            string CreatorCode = Session["UserCode"] == null ? "" : Session["UserCode"].ToString().Trim();
            string CreatorName = Session["UserName"] == null ? "" : Session["UserName"].ToString();
            DateTime CreateTime = DateTime.Now;
            string strCommanSql = string.Empty;

            if (intID == 0)
            {
                try
                {
                    WFTemplateRelatedJSCodeBLL wfTemplateRelatedJSCodeBLL = new WFTemplateRelatedJSCodeBLL();
                    WFTemplateRelatedJSCode wfTemplateRelatedJSCode = new WFTemplateRelatedJSCode();

                    wfTemplateRelatedJSCode.TemName = strTemName;
                    wfTemplateRelatedJSCode.JSCode = strJSCode;
                    wfTemplateRelatedJSCode.Comment = strComment;
                    wfTemplateRelatedJSCode.CreatorCode = CreatorCode;
                    wfTemplateRelatedJSCode.CreatorName = CreatorName;
                    wfTemplateRelatedJSCode.CreateTime = CreateTime;

                
                    wfTemplateRelatedJSCodeBLL.AddWFTemplateRelatedJSCode(wfTemplateRelatedJSCode);

                    HF_ID.Value = GetMyCreatedMaxWFTemplateRelatedJSCode(strTemName);

                    LogClass.WriteLogFile(HF_ID.Value);

                    ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZBCCG + "')", true);

                }
                catch (Exception ex)
                {
                    LogClass.WriteLogFile(ex.Message.ToString());
                    ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZBCSBJC + "')", true);
                }
            }
            else
            {
                try
                {
                    WFTemplateRelatedJSCodeBLL wfTemplateRelatedJSCodeBLL = new WFTemplateRelatedJSCodeBLL();
                    WFTemplateRelatedJSCode wfTemplateRelatedJSCode = new WFTemplateRelatedJSCode();

                    wfTemplateRelatedJSCode.TemName = strTemName;
                    wfTemplateRelatedJSCode.JSCode = strJSCode;
                    wfTemplateRelatedJSCode.Comment = strComment;
                    wfTemplateRelatedJSCode.CreatorCode = CreatorCode;
                    wfTemplateRelatedJSCode.CreatorName = CreatorName;
                    wfTemplateRelatedJSCode.CreateTime = CreateTime;

                    wfTemplateRelatedJSCodeBLL.UpdateWFTemplateRelatedJSCode(wfTemplateRelatedJSCode, intID);


                    ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZBCCG + "')", true);
                }
                catch (Exception ex)
                {
                    LogClass.WriteLogFile(ex.Message.ToString());
                    ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZBCSBJC + "')", true);
                }
            }
        }
        catch (Exception ex)
        {
            LogClass.WriteLogFile(ex.Message.ToString());
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZBCSBJC + "')", true);
        }
    }

    //取得用户创建的最大工作流模板代码ID号
    public static string GetMyCreatedMaxWFTemplateRelatedJSCode(string strTemName)
    {
        string strHQL;

        strHQL = "Select Max(ID) From  T_WFTemplateRelatedJSCode Where TemName = '" + strTemName + "'";
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_WFTStepRElatedTem");

        return ds.Tables[0].Rows[0][0].ToString();
    }

}