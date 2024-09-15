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
using System.Web.Mail;

using ProjectMgt.Model;
using ProjectMgt.DAL;
using ProjectMgt.BLL;

public partial class TTWorkFlowStepBusinessMember : System.Web.UI.Page
{
    //加上关联RelatedID,RelatedType,RelatedCode TODO:CAOJIAN(曹健)
    string strRelatedType, strRelatedID, strRelatedCode;
    string strUserCode, strUserName;
    string strWFIdentifyString, strWFTemName, strStepID;

    protected void Page_Load(object sender, EventArgs e)
    {
        string strHQL;
        IList lst;

        string strDepartCode, strPosition;

        strUserCode = Session["UserCode"].ToString();
        strUserName = ShareClass.GetUserName(strUserCode);

        strWFIdentifyString = Request.QueryString["IdentifyString"];
        strStepID = Request.QueryString["StepID"];

        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "clickA", "aHandler();", true);
        if (Page.IsPostBack != true)
        {
            LB_DepartString.Text = TakeTopCore.CoreShareClass.InitialDepartmentTreeByAuthority(Resources.lang.ZZJGT,TreeView4, strUserCode);

            strDepartCode = ShareClass.GetDepartCodeFromUserCode(strUserCode);
            strPosition = ShareClass.GetUserDuty(strUserCode);

            TakeTopCore.CoreShareClass.InitialDepartmentTreeByAuthority(Resources.lang.ZZJGT,TreeView4, strUserCode);
            strHQL = "from ProjectMember as projectMember where projectMember.DepartCode = " + "'" + strDepartCode + "'";
            ProjectMemberBLL projectMemberBLL = new ProjectMemberBLL();
            lst = projectMemberBLL.GetAllProjectMembers(strHQL);
            DataGrid4.DataSource = lst;
            DataGrid4.DataBind();

            LoadWorkFlowStepBusinessUser(strWFTemName, strStepID);

            try
            {
                string strStepName, strWLID, strWLName;
                WorkFlow workFlow;
                WorkFlowStep workFlowStep;

                workFlowStep = ShareClass.GetWorkFlowStep(strStepID);
                strStepName = workFlowStep.StepName.Trim();
                strWLID = workFlowStep.WLID.ToString();

                workFlow = GetWorkFlow(strWLID);
                strWLName = workFlow.WLName.Trim();

                TB_Message.Text = Resources.lang.GongZuoLiuShenQing + "：" + strWLID + " " + strWLName + "," + Resources.lang.BuZhou + "：" + strStepID + " " + strStepName;
            }
            catch
            {

            }
        }
    }

    protected void TreeView4_SelectedNodeChanged(object sender, EventArgs e)
    {
        string strDepartCode;


        TreeNode treeNode = new TreeNode();
        treeNode = TreeView4.SelectedNode;

        if (treeNode.Target != "0")
        {
            strDepartCode = treeNode.Target.Trim();

            ShareClass.LoadUserByDepartCodeForDataGrid(strDepartCode, DataGrid4);
        }
    }

    protected void RP_Attendant_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        if (e.CommandName != "Page")
        {
            string strHQL;

            string strSelectedUserCode = ((Button)e.Item.FindControl("BT_UserCode")).Text.Trim();

            strHQL = "Delete From T_WorkFlowStepBusinessMember Where StepID = " + strStepID + " And UserCode = " + "'" + strSelectedUserCode + "'";
            strHQL += " and CreatorCode = " + "'" + strUserCode + "'";
            ShareClass.RunSqlCommand(strHQL);

            LoadWorkFlowStepBusinessUser(strWFTemName, strStepID);
        }
    }

    protected void DataGrid4_ItemCommand(object sender, DataGridCommandEventArgs e)
    {
        string strMemberCode = ((Button)e.Item.FindControl("BT_UserCode")).Text;
        string strMemberName = ((Button)e.Item.FindControl("BT_UserName")).Text;

        string strHQL = "Select * From T_WorkFlowStepBusinessMember Where UserCode = " + "'" + strMemberCode + "'" + " and CreatorCode = " + "'" + strUserCode + "'" + " and StepID = " + strStepID;
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_WorkFlowStepBusinessMember");
        if (ds.Tables[0].Rows.Count > 0)
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZCCYYCZBNZFZJ + "')", true);
        }
        else
        {
            strHQL = "Insert Into T_WorkFlowStepBusinessMember(StepID,UserCode,UserName,CreatorCode) Values(" + strStepID + "," + "'" + strMemberCode + "'" + "," + "'" + strMemberName + "'" + "," + "'" + strUserCode + "'" + ")";
            ShareClass.RunSqlCommand(strHQL);

            LoadWorkFlowStepBusinessUser(strWFTemName, strStepID);
        }
    }

    protected void BT_Send_Click(object sender, EventArgs e)
    {
        string strHQL;
        string strMsg,strDepartString, strUserCode, strReceiverCode;
      

        strUserCode = Session["UserCode"].ToString();
        strDepartString = LB_DepartString.Text.Trim();

        strHQL = "Select UserCode From T_WorkFlowStepBusinessMember Where StepID = " + strStepID + " and CreatorCode = " + "'" + strUserCode + "'";
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_ProjectMember");

        Msg msg = new Msg();

        for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
        {
            strReceiverCode = ds.Tables[0].Rows[0][0].ToString();
            strMsg = TB_Message.Text.Trim();

            //发送信息
            msg.SendMSM("Message",strReceiverCode, strMsg, strUserCode);
        }
        

        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZDXFSWB + "')", true);
    }

    
    protected WorkFlow GetWorkFlow(string strWLID)
    {
        string strHQL;
        IList lst;

        strHQL = "from WorkFlow as workFlow where workFlow.WLID = " + strWLID;
        WorkFlowBLL workFlowBLL = new WorkFlowBLL();
        lst = workFlowBLL.GetAllWorkFlows(strHQL);
        WorkFlow workFlow = (WorkFlow)lst[0];

        return workFlow;

    }


    protected void LoadWorkFlowStepBusinessUser(string strWFTemName, string strStepID)
    {
        string strHQL;

        strHQL = "Select * From T_WorkFlowStepBusinessMember Where StepID = " + strStepID;
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_WorkFlowStepBusinessMember");

        RP_Attendant.DataSource = ds;
        RP_Attendant.DataBind();
    }

}
