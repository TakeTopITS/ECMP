using System;
using System.Resources;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ProjectMgt.BLL;

public partial class TTMakeBookManageOut : System.Web.UI.Page
{
    string strUserCode;

    protected void Page_Load(object sender, EventArgs e)
    {
        string strDepartString;
        strUserCode = Session["UserCode"].ToString();

        ProjectMemberBLL projectMemberBLL = new ProjectMemberBLL();
        Label1.Text = ShareClass.GetPageTitle(this.GetType().BaseType.Name + ".aspx"); bool blVisible = TakeTopSecurity.TakeTopLicense.GetAuthobility(this.GetType().BaseType.Name + ".aspx", strUserCode);  //bool blVisible = TakeTopSecurity.TakeTopLicense.GetAuthobility(this.GetType().BaseType.Name + ".aspx", "标准与图书管理", strUserCode);
        if (blVisible == false)
        {
            Response.Redirect("TTDisplayErrors.aspx");
            return;
        }

        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "clickA", "aHandler();", true);
        if (Page.IsPostBack != true)
        {
            strDepartString = TakeTopCore.CoreShareClass.InitialDepartmentTreeByAuthority(Resources.lang.ZZJGT,TreeView1, strUserCode);
            LB_DepartString.Text = strDepartString;

            BindDDLOther();
            LoadBookList(txt_BarCode.Text.Trim(), txt_BookName.Text.Trim(), txt_ReferenceNo.Text.Trim(), txt_Author.Text.Trim(), ddl_BookClassificationId.SelectedValue.Trim(), ddl_BookPublishersId.SelectedValue.Trim(), "");
            LoadBookBorrowRecord();
        }
    }

    protected void BindDDLOther()
    {
        string strHQL = "from BookPublishers as bookPublishers Order by bookPublishers.ID ASC";
        BookPublishersBLL bookPublishersBLL = new BookPublishersBLL();
        IList lst = bookPublishersBLL.GetAllBookPublishers(strHQL);
        ddl_BookPublishersId.DataSource = lst;
        ddl_BookPublishersId.DataBind();
        ddl_BookPublishersId.Items.Insert(0, new ListItem("--Select--", "0"));

        strHQL = "from BookClassification as bookClassification Order by bookClassification.ID ASC";
        BookClassificationBLL bookClassificationBLL = new BookClassificationBLL();
        lst = bookClassificationBLL.GetAllBookClassification(strHQL);
        ddl_BookClassificationId.DataSource = lst;
        ddl_BookClassificationId.DataBind();
        ddl_BookClassificationId.Items.Insert(0, new ListItem("--Select--", "0"));
    }

    protected void LoadBookList(string strBarCode, string strBookName, string strReferenceNo, string strAuthor, string strBookClassificationId, string strBookPublishersId, string strBelongDepartCode)
    {
        string strHQL = " Select *,(Case when BookType='标准' then BookImage else '' end) BookImageNew From T_BookInformation Where 1=1 ";
        if (!string.IsNullOrEmpty(strBarCode.Trim()))
        {
            strHQL += " and BarCode like '%" + strBarCode.Trim() + "%' ";
        }
        if (!string.IsNullOrEmpty(strBookName.Trim()))
        {
            strHQL += " and BookName like '%" + strBookName.Trim() + "%' ";
        }
        if (!string.IsNullOrEmpty(strReferenceNo.Trim()))
        {
            strHQL += " and ReferenceNo like '%" + strReferenceNo.Trim() + "%' ";
        }
        if (!string.IsNullOrEmpty(strBelongDepartCode))
        {
            strHQL += " and DepartCode like '%" + strBelongDepartCode.Trim() + "%' ";
        }
        if (!string.IsNullOrEmpty(strAuthor.Trim()))
        {
            strHQL += " and Author like '%" + strAuthor.Trim() + "%' ";
        }
        if (!strBookClassificationId.Trim().Equals("0"))
        {
            strHQL += " and BookClassificationId = '" + strBookClassificationId.Trim() + "' ";
        }
        if (!strBookPublishersId.Trim().Equals("0"))
        {
            strHQL += " and BookPublishersId = '" + strBookPublishersId.Trim() + "' ";
        }
        if (DropDownList1.SelectedValue.Trim().Equals("0"))
        {
            strHQL += " Order By ID ASC ";
        }
        else if (DropDownList1.SelectedValue.Trim().Equals("1"))//图书
        {
            strHQL += " and BookType='图书' Order By ReferenceNo ASC ";
        }
        else//标准
        {
            strHQL += " and BookType='标准' Order By BarCode ASC ";
        }
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_BookInformation");

        DataGrid1.CurrentPageIndex = 0;
        DataGrid1.DataSource = ds;
        DataGrid1.DataBind();
        lbl_sql.Text = strHQL;
    }

    protected void LoadBookBorrowRecord()
    {
        string strHQL = "Select A.*,(Case when B.BookType='标准' then B.BookImage else '' end) BookImageNew  From T_BookBorrowRecord As A,T_BookInformation As B Where A.BorrowCode='" + strUserCode.Trim() + "' and A.BookInfoId=B.ID Order By A.BarCode ASC ";
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_BookBorrowRecord");

        DataGrid2.CurrentPageIndex = 0;
        DataGrid2.DataSource = ds;
        DataGrid2.DataBind();
        lbl_sql2.Text = strHQL;
    }

    protected void TreeView1_SelectedNodeChanged(object sender, EventArgs e)
    {
        string strDepartCode, strDepartName;


        TreeNode treeNode = new TreeNode();
        treeNode = TreeView1.SelectedNode;

        if (treeNode.Target != "0")
        {
            strDepartCode = treeNode.Target.Trim();
            strDepartName = ShareClass.GetDepartName(strDepartCode);

            TB_BelongDepartCode.Text = strDepartCode;
            LB_BelongDepartName.Text = strDepartName;
        }
    }

    protected void BT_Query_Click(object sender, EventArgs e)
    {
        LoadBookList(txt_BarCode.Text.Trim(), txt_BookName.Text.Trim(), txt_ReferenceNo.Text.Trim(), txt_Author.Text.Trim(), ddl_BookClassificationId.SelectedValue.Trim(), ddl_BookPublishersId.SelectedValue.Trim(), TB_BelongDepartCode.Text.Trim());
        LoadBookBorrowRecord();
    }

    protected void DataGrid2_PageIndexChanged(object source, DataGridPageChangedEventArgs e)
    {
        string strHQL = lbl_sql2.Text.Trim();
        DataGrid2.CurrentPageIndex = e.NewPageIndex;
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_BookBorrowRecord");

        DataGrid2.DataSource = ds;
        DataGrid2.DataBind();
    }

    protected void DataGrid1_PageIndexChanged(object source, DataGridPageChangedEventArgs e)
    {
        string strHQL = lbl_sql.Text.Trim();
        DataGrid1.CurrentPageIndex = e.NewPageIndex;
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_BookInformation");

        DataGrid1.DataSource = ds;
        DataGrid1.DataBind();
    }
}