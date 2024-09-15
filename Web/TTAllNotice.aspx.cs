using System; using System.Resources;
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
using System.IO;


using ProjectMgt.Model;
using ProjectMgt.DAL;
using ProjectMgt.BLL;


public partial class TTAllNotice : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string strHQL;
        string strUserCode, strUserName;
        string strDepartCode;
        IList lst;

        strUserCode = Session["UserCode"].ToString();
        strUserName = Session["UserName"].ToString();
        strDepartCode = ShareClass.GetDepartCodeFromUserCode(strUserCode);

        LB_UserCode.Text = strUserCode;
        LB_UserName.Text = strUserName;

        ProjectMemberBLL projectMemberBLL = new ProjectMemberBLL();
        Label1.Text = ShareClass.GetPageTitle(this.GetType().BaseType.Name + ".aspx"); bool blVisible = TakeTopSecurity.TakeTopLicense.GetAuthobility(this.GetType().BaseType.Name + ".aspx", strUserCode);  //Label1.Text = ShareClass.GetPageTitle(this.GetType().BaseType.Name + ".aspx"); bool blVisible = TakeTopSecurity.TakeTopLicense.GetAuthobility(this.GetType().BaseType.Name + ".aspx","查看所有公告", strUserCode);

        if (blVisible == false)
        {
            Response.Redirect("TTDisplayErrors.aspx");
            return;
        }

        //this.Title = "查看所有公告";

        if (Page.IsPostBack == false)
        {
            string strDepartString = TakeTopCore.CoreShareClass.InitialDepartmentStringByAuthoritySuperUser(strUserCode);
            LB_DepartString.Text = strDepartString;

            strHQL = "Select DocID,DocType,DocName,Address,RelatedDepartName,UploadManCode,UploadManName,UploadTime From T_PublicNotice ";
            strHQL += " Where RelatedDepartCode in " + strDepartString;
            strHQL += " Order By DocID DESC";
            DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_PublicNotice");

            DataGrid1.DataSource = ds;
            DataGrid1.DataBind();          

            LB_Sql.Text = strHQL;
        }
    }


    protected void DataGrid1_ItemCommand(object sender, DataGridCommandEventArgs e)
    {
        string strHQL;
        string strDocID;
        string strUserName;

        if (e.CommandName != "Page")
        {
            try
            {
                strUserName = LB_UserName.Text.Trim();

                strDocID = ((Button)e.Item.FindControl("BT_DocID")).Text;

                for (int i = 0; i < DataGrid1.Items.Count; i++)
                {
                    DataGrid1.Items[i].ForeColor = Color.Black;
                }

                e.Item.ForeColor = Color.Red;


                strHQL = "Select Distinct A.UserCode,B.UserName From T_NoticeRelatedUser A,T_ProjectMember B Where A.UserCode = B.UserCode And A.NoticeID = " + strDocID;
                DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_NoticeRelatedUser");

                Repeater1.DataSource = ds;
                Repeater1.DataBind();
            }
            catch
            {

            }
        }
    }

    protected void DataGrid1_PageIndexChanged(object sender, DataGridPageChangedEventArgs e)
    {
        DataGrid1.CurrentPageIndex = e.NewPageIndex;

        string strHQL = LB_Sql.Text;

        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_PublicNotice");

        DataGrid1.DataSource = ds;
        DataGrid1.DataBind();        
    }
   
}
