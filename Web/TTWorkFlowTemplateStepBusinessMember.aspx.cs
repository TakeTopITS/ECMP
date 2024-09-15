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

public partial class TTWorkFlowTemplateStepBusinessMember : System.Web.UI.Page
{
    //加上关联RelatedID,RelatedType,RelatedCode TODO:CAOJIAN(曹健)
    string strRelatedType, strRelatedID, strRelatedCode;
    string strUserCode, strUserName;
    string strWFIdentifyString, strWFTemName, strStepGUID, strStepID, strStepSortNumber;

    protected void Page_Load(object sender, EventArgs e)
    {
        string strHQL;
        IList lst;

        string strDepartCode, strPosition, strMakeUserCode;

        strUserCode = Session["UserCode"].ToString();
        strUserName = ShareClass.GetUserName(strUserCode);

        strWFIdentifyString = Request.QueryString["IdentifyString"];
        strStepGUID = Request.QueryString["StepGUID"];

        strHQL = "Select TemName,WFDefinition,CreatorCode From T_WorkFlowTemplate Where IdentifyString = " + "'" + strWFIdentifyString + "'";
        DataSet ds = new DataSet();
        ds = ShareClass.GetDataSetFromSql(strHQL, "T_WorkFlowTemplate");
        strWFTemName = ds.Tables[0].Rows[0][0].ToString().Trim();
        strMakeUserCode = ds.Tables[0].Rows[0][2].ToString().Trim();

        strHQL = "Select StepID,GUID,SortNumber From T_WorkFlowTStep Where GUID = " + "'" + strStepGUID + "'";
        DataSet ds2 = ShareClass.GetDataSetFromSql(strHQL, "T_WorkFlowTStep");
        strStepID = ds2.Tables[0].Rows[0]["StepID"].ToString();
        strStepSortNumber = ds2.Tables[0].Rows[0]["SortNumber"].ToString();

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

            LoadWorkFlowTemplateStepBusinessUser(strWFTemName,strStepID);

            if (Session["SuperWFAdmin"].ToString() == "YES" | strUserCode == strMakeUserCode)
            {
                DataGrid4.Enabled = true;
            }
            else
            {
                DataGrid4.Enabled = false;
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

            for (int i = 0; i < RP_Attendant.Items.Count; i++)
            {
                ((Button)RP_Attendant.Items[i].FindControl("BT_UserName")).ForeColor = Color.Black;
            }
           ((Button)e.Item.FindControl("BT_UserName")).ForeColor = Color.Red;

            if (e.CommandName == "Delete")
            {
                strHQL = "Delete From T_WorkFlowTemplateStepBusinessMember Where TemName = " + "'" + strWFTemName + "'" + " and StepID = " + strStepID + " And UserCode = " + "'" + strSelectedUserCode + "'";
                ShareClass.RunSqlCommand(strHQL);
            }

            if (e.CommandName == "Save")
            {
                string strAgreeNotice, strRefuseNotice, strAgreeBackNotice, strCancelNotice, strCheckingNotice, strSigningNotice,strReviewNotice;

                if (((CheckBox)e.Item.FindControl("CB_AgreeNotice")).Checked)
                {
                    strAgreeNotice = "YES";
                }
                else
                {
                    strAgreeNotice = "NO";
                }
                if (((CheckBox)e.Item.FindControl("CB_RefuseNotice")).Checked)
                {
                    strRefuseNotice = "YES";
                }
                else
                {
                    strRefuseNotice = "NO";
                }

                if (((CheckBox)e.Item.FindControl("CB_CancelNotice")).Checked)
                {
                    strCancelNotice = "YES";
                }
                else
                {
                    strCancelNotice = "NO";
                }
                if (((CheckBox)e.Item.FindControl("CB_AgreeBackNotice")).Checked)
                {
                    strAgreeBackNotice = "YES";
                }
                else
                {
                    strAgreeBackNotice = "NO";
                }
                if (((CheckBox)e.Item.FindControl("CB_CheckingNotice")).Checked)
                {
                    strCheckingNotice = "YES";
                }
                else
                {
                    strCheckingNotice = "NO";
                }
                if (((CheckBox)e.Item.FindControl("CB_SigningNotice")).Checked)
                {
                    strSigningNotice = "YES";
                }
                else
                {
                    strSigningNotice = "NO";
                }
                if (((CheckBox)e.Item.FindControl("CB_ReviewNotice")).Checked)
                {
                    strReviewNotice = "YES";
                }
                else
                {
                    strReviewNotice = "NO";
                }

                try
                {
                    strHQL = "Update T_WorkFlowTemplateStepBusinessMember Set AgreeNotice = '" + strAgreeNotice + "',RefuseNotice = '" + strRefuseNotice + "',CancelNotice='" + strCancelNotice  + "',AgreeBackNotice = '" + strAgreeBackNotice + "',CheckingNotice = '" + strCheckingNotice + "',ReviewNotice='" + strReviewNotice + "',SigningNotice='" + strSigningNotice + "'";
                    strHQL += " Where TemName = " + "'" + strWFTemName + "'" + " and StepID = " + strStepID + " And UserCode = " + "'" + strSelectedUserCode + "'";
                    ShareClass.RunSqlCommand(strHQL);

                    ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZBCCG + "')", true);
                }
                catch
                {
                    ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZBCSB + "')", true);
                }
            }

            LoadWorkFlowTemplateStepBusinessUser(strWFTemName, strStepID);
        }
    }

    protected void DataGrid4_ItemCommand(object sender, DataGridCommandEventArgs e)
    {
        string struserCode = ((Button)e.Item.FindControl("BT_UserCode")).Text;
        string struserName = ((Button)e.Item.FindControl("BT_UserName")).Text;

        string strHQL = "Select * From T_WorkFlowTemplateStepBusinessMember Where UserCode = " + "'" + struserCode + "'" + " and TemName = " + "'" + strWFTemName + "'" + " and StepID = " + strStepID;
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_WorkFlowTemplateStepBusinessMember");
        if (ds.Tables[0].Rows.Count > 0)
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZCCYYCZBNZFZJ + "')", true);
        }
        else
        {
            strHQL = "Insert Into T_WorkFlowTemplateStepBusinessMember(TemName,StepID,StepSortNumber,UserCode,UserName) Values(" + "'" + strWFTemName + "'" + "," + strStepID  + "," + strStepSortNumber + "," + "'" + struserCode + "'" + "," + "'" + struserName + "'" + ")";
            ShareClass.RunSqlCommand(strHQL);

            LoadWorkFlowTemplateStepBusinessUser(strWFTemName, strStepID);
        }
    }

    protected void LoadWorkFlowTemplateStepBusinessUser(string strWFTemName,string strStepID)
    {
        string strHQL;

        strHQL = "Select * From T_WorkFlowTemplateStepBusinessMember Where TemName = " + "'" + strWFTemName + "'" + " and StepID = " + strStepID;
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_WorkFlowTemplateStepBusinessMember");

        RP_Attendant.DataSource = ds;
        RP_Attendant.DataBind();

        for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
        {
            if (ds.Tables[0].Rows[i]["AgreeNotice"].ToString().Trim() == "YES")
            {
                ((CheckBox)RP_Attendant.Items[i].FindControl("CB_AgreeNotice")).Checked = true;
            }
            else
            {
                ((CheckBox)RP_Attendant.Items[i].FindControl("CB_AgreeNotice")).Checked = false;
            }

            if (ds.Tables[0].Rows[i]["RefuseNotice"].ToString().Trim() == "YES")
            {
                ((CheckBox)RP_Attendant.Items[i].FindControl("CB_RefuseNotice")).Checked = true;
            }
            else
            {
                ((CheckBox)RP_Attendant.Items[i].FindControl("CB_RefuseNotice")).Checked = false;
            }

            if (ds.Tables[0].Rows[i]["AgreeBackNotice"].ToString().Trim() == "YES")
            {
                ((CheckBox)RP_Attendant.Items[i].FindControl("CB_AgreeBackNotice")).Checked = true;
            }
            else
            {
                ((CheckBox)RP_Attendant.Items[i].FindControl("CB_AgreeBackNotice")).Checked = false;
            }
            
            if (ds.Tables[0].Rows[i]["CancelNotice"].ToString().Trim() == "YES")
            {
                ((CheckBox)RP_Attendant.Items[i].FindControl("CB_CancelNotice")).Checked = true;
            }
            else
            {
                ((CheckBox)RP_Attendant.Items[i].FindControl("CB_CancelNotice")).Checked = false;
            }

            if (ds.Tables[0].Rows[i]["CheckingNotice"].ToString().Trim() == "YES")
            {
                ((CheckBox)RP_Attendant.Items[i].FindControl("CB_CheckingNotice")).Checked = true;
            }
            else
            {
                ((CheckBox)RP_Attendant.Items[i].FindControl("CB_CheckingNotice")).Checked = false;
            }

            if (ds.Tables[0].Rows[i]["ReviewNotice"].ToString().Trim() == "YES")
            {
                ((CheckBox)RP_Attendant.Items[i].FindControl("CB_ReviewNotice")).Checked = true;
            }
            else
            {
                ((CheckBox)RP_Attendant.Items[i].FindControl("CB_ReviewNotice")).Checked = false;
            }

            if (ds.Tables[0].Rows[i]["SigningNotice"].ToString().Trim() == "YES")
            {
                ((CheckBox)RP_Attendant.Items[i].FindControl("CB_SigningNotice")).Checked = true;
            }
            else
            {
                ((CheckBox)RP_Attendant.Items[i].FindControl("CB_SigningNotice")).Checked = false;
            }

        }
    }

}
