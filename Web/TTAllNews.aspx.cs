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


using NickLee.Views.Web.UI;
using NickLee.Views.Windows.Forms.Printing;

using ProjectMgt.Model;
using ProjectMgt.DAL;
using ProjectMgt.BLL;

public partial class TTAllNews : System.Web.UI.Page
{
    string strUserCode;

    protected void Page_Load(object sender, EventArgs e)
    {
        string strHQL, strID;
        IList lst;

        strUserCode = Session["UserCode"].ToString();

        ProjectMemberBLL projectMemberBLL = new ProjectMemberBLL();
        Label1.Text = ShareClass.GetPageTitle(this.GetType().BaseType.Name + ".aspx"); bool blVisible = TakeTopSecurity.TakeTopLicense.GetAuthobility(this.GetType().BaseType.Name + ".aspx", strUserCode);  //Label1.Text = ShareClass.GetPageTitle(this.GetType().BaseType.Name + ".aspx"); bool blVisible = TakeTopSecurity.TakeTopLicense.GetAuthobility(this.GetType().BaseType.Name + ".aspx","查看所有新闻", strUserCode);
        if (blVisible == false)
        {
            Response.Redirect("TTDisplayErrors.aspx");
            return;
        }

        //this.Title = "查看所有新闻";

         if (Page.IsPostBack != true)
        {
            string strDepartString = TakeTopCore.CoreShareClass.InitialDepartmentStringByAuthoritySuperUser(strUserCode);
            LB_DepartString.Text = strDepartString;

            strHQL = "from HeadLine as headLine  ";
            strHQL += " where headLine.RelatedDepartCode in " + strDepartString;
            strHQL += " Order by headLine.ID DESC";
            HeadLineBLL headLineBLL = new HeadLineBLL();
            lst = headLineBLL.GetAllHeadLines(strHQL);

            LoadHeadLine();

            if (lst.Count > 0)
            {
                HeadLine headLine = (HeadLine)lst[0];

                strID = headLine.ID.ToString();
                LB_ID.Text = strID;
                LB_Title.Text = headLine.Title.Trim();

                strHQL = "Select * From T_HeadLine Where ID = " + strID;
                DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_HeadLine");

                DataList1.DataSource = ds;
                DataList1.DataBind();
            }
        }
    }

    protected void BT_Find_Click(object sender, EventArgs e)
    {
        string strHQL;
        IList lst;

        string strDepartString = LB_DepartString.Text.Trim();
        string strTitle, strContent;

        strTitle = TB_NewsTitle.Text.Trim();
        strTitle = "%" + strTitle + "%";

        strContent = TB_NewsContent.Text.Trim();
        strContent = "%" + strContent + "%";

        strHQL = "from HeadLine as headLine  where ";
        strHQL += " headLine.Title like " + "'" + strTitle + "'";
        strHQL += " and headLine.Content like " + "'" + strContent + "'";
        strHQL += " and headLine.RelatedDepartCode in " + strDepartString;
        strHQL += " Order by headLine.ID DESC";
        HeadLineBLL headLineBLL = new HeadLineBLL();
        lst = headLineBLL.GetAllHeadLines(strHQL);

        LLB_News.DataSource = lst;
        LLB_News.DataBind();
    }

    protected void LoadHeadLine()
    {
        string strHQL;
        IList lst;

        string strDepartString = LB_DepartString.Text.Trim();

        strHQL = "from HeadLine as headLine ";
        strHQL += " where headLine.RelatedDepartCode in " + strDepartString;
        strHQL += " Order by headLine.ID DESC";
        HeadLineBLL headLineBLL = new HeadLineBLL();
        lst = headLineBLL.GetAllHeadLines(strHQL);

        LLB_News.DataSource = lst;
        LLB_News.DataBind();
    }

    protected void LLB_News_SelectedIndexChanged(object sender, EventArgs e)
    {
        string strID, strHQL;
        IList lst;

        strID = LLB_News.SelectedValue.Trim();

        strHQL = "from HeadLine as headLine where headLine.ID = " + strID;
        HeadLineBLL headLineBLL = new HeadLineBLL();
        lst = headLineBLL.GetAllHeadLines(strHQL);

        HeadLine headLine = (HeadLine)lst[0];
        LB_Title.Text = headLine.Title.Trim();
        LB_ID.Text = strID;

        strHQL = "Select * From T_HeadLine Where ID = " + strID;
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_HeadLine");

        DataList1.DataSource = ds;
        DataList1.DataBind();

        strHQL = "Select Distinct A.UserCode,B.UserName From T_NewsRelatedUser A,T_ProjectMember B Where A.UserCode = B.UserCode and A.NewsID = " + strID;
        ds = ShareClass.GetDataSetFromSql(strHQL, "T_NewsRelatedUser");

        Repeater1.DataSource = ds;
        Repeater1.DataBind();
    }
   
}
