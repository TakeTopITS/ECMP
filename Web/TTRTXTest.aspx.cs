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

using RTXSAPILib;
using RTXClient;

public partial class TTRTXTest : System.Web.UI.Page
{
    RTXSAPILib.RTXSAPIRootObj RootObj;  //声明一个根对象
    protected void Page_Load(object sender, EventArgs e)
    {
        string strUserCode = Session["UserCode"].ToString();

        try
        {
            RootObj = new RTXSAPIRootObj();     //创建根对象
            RootObj.ServerIP = txtSvrIP.Text; //设置服务器IP
            RootObj.ServerPort = Convert.ToInt16(txtSvrPort.Text); //设置服务器端口
        }
        catch
        {
            Response.Write("创建RTX服务失败，请检查！");
        }

    }
    protected void Button1_Click(object sender, EventArgs e)
    {//发送信息
        try
        {
            RootObj.SendNotify(txtReceivers.Text, txtMsgTitle.Text, Convert.ToInt32(txtTime.Text), txtMsgContent.Text); //获取版本信息

            txtResult.Text = "发送成功！";
        }
        catch
        {
            txtResult.Text = "发送失败！";
        }
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        //查询状态
        try
        {
            txtResult.Text = RootObj.QueryUserState(txtUserName.Text); //获取用户状态
        }
        catch 
        {
            txtResult.Text = "获取用户状态失败！";
        }
    }
   
    protected void Button4_Click(object sender, EventArgs e)
    {
        try
        {
            txtResult.Text = RootObj.GetVersion(); //获取版本信息
            
        }
        catch 
        {
            txtResult.Text = "获取版本信息失败！";
        }
    }
    protected void Button5_Click(object sender, EventArgs e)
    {
        try
        {
            txtResult.Text = RootObj.GetUserRightList(txtUserName.Text); //获取用户权限列表
        }
        catch 
        {
            txtResult.Text = "获取用户权限信息失败！";
        }
    }
}
