using System; using System.Resources;
using System.Collections.Generic;

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

public partial class TTAllSMSSendReport : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string strHQL;
        IList lst;
        int i;

        string strDepartString;

        string strUserName;
        string strUserCode = Session["UserCode"].ToString();

        //this.Title = "短信发送报表";

        LB_UserCode.Text = strUserCode;
        strUserName = Session["UserName"].ToString();
        LB_UserName.Text = strUserName;

        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "clickA", "aHandler();", true);
        if (Page.IsPostBack != true)
        {
            DLC_StartTime.Text = DateTime.Now.ToString("yyyy-MM-dd");
            DLC_EndTime.Text = DateTime.Now.ToString("yyyy-MM-dd");

            strDepartString = TakeTopCore.CoreShareClass.InitialDepartmentStringByAuthorityAsset(strUserCode);

            strHQL = "from SmsSend as smsSend ";
            //strHQL += " Where smsSend.Mobile in (Select projectMember.MobilePhone From ProjectMember as projectMember Where projectMember.DepartCode in " + strDepartString + ")"; ;
            strHQL += " Order by smsSend.ID DESC";
            SmsSendBLL smsSendBLL = new SmsSendBLL();
            lst = smsSendBLL.GetAllSmsSends(strHQL);
            DataGrid1.DataSource = lst;
            DataGrid1.DataBind();

            LB_Sql.Text = strHQL;


            LB_PageIndex.Text = "1";
            LB_TotalPageNumber.Text = DataGrid1.PageCount.ToString();
        }
    }

    protected void BT_Find_Click(object sender, EventArgs e)
    {
        string strHQL;
        IList lst;
        int i;

        DataGrid1.CurrentPageIndex = 0;

        string strUserCode = LB_UserCode.Text.Trim();
        string strDepartString;

        string strStartTime = DateTime.Parse(DLC_StartTime.Text).ToString("yyyyMMdd");
        string strEndTime = DateTime.Parse(DLC_EndTime.Text).ToString("yyyyMMdd");

        string strMobileCode = TB_MobileCode.Text.Trim();
        string strRTXCode = TB_RTXCode.Text.Trim();


        strDepartString = TakeTopCore.CoreShareClass.InitialDepartmentStringByAuthoritySuperUser(strUserCode);

        strMobileCode = "%" + strMobileCode + "%";
        strRTXCode = "%" + strRTXCode + "%";

        strHQL = "from SmsSend as smsSend where ";
        strHQL += " smsSend.Mobile Like " + "'" + strMobileCode + "'";
        strHQL += " and smsSend.UserRTXCode Like " + "'" + strRTXCode + "'";
        strHQL += " and to_char(smsSend.SendTime,'yyyymmdd')  >= " + "'" + strStartTime + "'" + "  and to_char(smsSend.SendTime,'yyyymmdd') <= " + "'" + strEndTime + "'";
        //strHQL += " and smsSend.Mobile in (Select projectMember.MobilePhone From ProjectMember as projectMember Where projectMember.DepartCode in " + strDepartString + ")"; ;
        strHQL += " Order by smsSend.ID DESC";
        SmsSendBLL smsSendBLL = new SmsSendBLL();
        lst = smsSendBLL.GetAllSmsSends(strHQL);
        DataGrid1.DataSource = lst;
        DataGrid1.DataBind();

        LB_Sql.Text = strHQL;
    }

    protected void DataGrid1_PageIndexChanged(object sender, DataGridPageChangedEventArgs e)
    {
        DataGrid1.CurrentPageIndex = e.NewPageIndex;
        string strHQL = LB_Sql.Text;

        SmsSendBLL smsSendBLL = new SmsSendBLL();
        IList lst = smsSendBLL.GetAllSmsSends(strHQL);

        DataGrid1.DataSource = lst;
        DataGrid1.DataBind();

        LB_PageIndex.Text = (e.NewPageIndex + 1).ToString();
    }

}
