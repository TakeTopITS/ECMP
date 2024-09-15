using System; using System.Resources;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;
using Npgsql;

public partial class MailRenameFolder : System.Web.UI.Page
{
	int nFolderID = -1;
	protected void Page_Load(object sender,EventArgs e)
	{
        string strUserCode = Session["UserCode"].ToString();

        ///获取参数nFolderID的值
        if (Request.Params["FolderID"] != null)
		{
			if(Int32.TryParse(Request.Params["FolderID"].ToString(),out nFolderID) == false)
			{
				return;
			}
		}
		if(!Page.IsPostBack)
		{   ///显示文件夹的名称
			if(nFolderID > -1)
			{
				BindFolderData(nFolderID);
			}
		}
	}

	private void BindFolderData(int nFolderID)
	{
		IFolder folder = new Folder();
		NpgsqlDataReader dr = folder.GetSingleFolder(nFolderID);
		if(dr.Read())
		{
			Name.Text = dr["Name"].ToString();
		}
		dr.Close();
	}
	
	protected void NewBtn_Click(object sender,EventArgs e)
	{
		try
		{   ///定义对象
			IFolder folder = new Folder();
			///执行数据库操作
			folder.RenameFolder(nFolderID,Name.Text.Trim());
			Response.Write("<script>alert('" + "修改数据成功，请妥善保管好你的数据！" + "');</script>");
		}
		catch(Exception ex)
		{   ///跳转到异常错误处理页面
			Response.Redirect("TTErrorPage.aspx?ErrorMsg=" + ex.Message.Replace("<br>","").Replace("\n","")
				+ "&ErrorUrl=" + Request.Url.ToString().Replace("<br>","").Replace("\n",""));
		}
	}
	protected void ReturnBtn_Click(object sender,EventArgs e)
	{   ///返回到邮件列表页面
		Response.Redirect("~/TTMailDesktop.aspx");
	}	
}
