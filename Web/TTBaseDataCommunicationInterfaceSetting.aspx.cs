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

using ProjectMgt.Model;
using ProjectMgt.DAL;
using ProjectMgt.BLL;

public partial class TTBaseDataCommunicationInterfaceSetting : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string strUserCode;

        strUserCode = Session["UserCode"].ToString();

        ProjectMemberBLL projectMemberBLL = new ProjectMemberBLL();
        Label1.Text = ShareClass.GetPageTitle(this.GetType().BaseType.Name + ".aspx"); bool blVisible = TakeTopSecurity.TakeTopLicense.GetAuthobility(this.GetType().BaseType.Name + ".aspx", strUserCode);  //Label1.Text = ShareClass.GetPageTitle(this.GetType().BaseType.Name + ".aspx"); bool blVisible = TakeTopSecurity.TakeTopLicense.GetAuthobility(this.GetType().BaseType.Name + ".aspx", "基础数据(外置)", strUserCode);
        if (blVisible == false)
        {
            Response.Redirect("TTDisplayErrors.aspx");
            return;
        }

        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "clickA", "aHandler();", true);
        if (Page.IsPostBack == false)
        {
            LoadWeiXinStand();//微信公众帐号

            LoadWeChatQYAccount();//微信企业号

            LoadSMSInterface();

            LoadRTXConfig();

            LoadSMSNetSegment();

            LoadMeetingSystem();
        }
    }

  
    protected void DataGrid20_ItemCommand(object sender, DataGridCommandEventArgs e)
    {
        string strID = ((Button)e.Item.FindControl("BT_ID")).Text.Trim();
        string strSPName = e.Item.Cells[1].Text.Trim();
        string strSPInterface = e.Item.Cells[2].Text.Trim();
        string strStatus = e.Item.Cells[3].Text.Trim();


        LB_SMSInterfaceID.Text = strID;
        TB_SPName.Text = strSPName;
        TB_SPInterface.Text = strSPInterface;
        DL_SPInterfaceSTatus.SelectedValue = strStatus;
    }
  
    protected void DataGrid25_ItemCommand(object sender, DataGridCommandEventArgs e)
    {
        string strID = ((Button)e.Item.FindControl("BT_ID")).Text.Trim();
        string strBeginSegment = e.Item.Cells[1].Text.Trim();
        string strEndSegment = e.Item.Cells[2].Text.Trim();

        LB_NetSegmentID.Text = strID;
        TB_BeginNetSegment.Text = strBeginSegment;
        TB_EndNetSegment.Text = strEndSegment;
    }

    protected void DataGrid31_ItemCommand(object sender, DataGridCommandEventArgs e)
    {
        string strServerIP = e.Item.Cells[1].Text.Trim();
        string strServerPort = e.Item.Cells[2].Text.Trim();
        string strWebSite = e.Item.Cells[3].Text.Trim();

        TB_RTXServerIP.Text = strServerIP;
        TB_RTXServerPort.Text = strServerPort;
        TB_RTXWebSite.Text = strWebSite;
    }

    protected void LoadSMSInterface()
    {
        string strHQL;
        IList lst;

        strHQL = "From SMSInterface as smsInterface Order By smsInterface.ID ASC";
        SMSInterfaceBLL smsInterfaceBLL = new SMSInterfaceBLL();
        lst = smsInterfaceBLL.GetAllSMSInterfaces(strHQL);

        DataGrid20.DataSource = lst;
        DataGrid20.DataBind();
    }

    protected void LoadSMSNetSegment()
    {
        string strHQL;
        IList lst;

        strHQL = "From SMSNetSegment as smsNetSegment Order By smsNetSegment.ID ASC";
        SMSNetSegmentBLL smsNetSegmentBLL = new SMSNetSegmentBLL();
        lst = smsNetSegmentBLL.GetAllSMSNetSegments(strHQL);

        DataGrid25.DataSource = lst;
        DataGrid25.DataBind();
    }

    protected void LoadRTXConfig()
    {
        string strHQL;
        IList lst;

        strHQL = "From RTXConfig as rtxConfig";
        RTXConfigBLL rtxConfigBLL = new RTXConfigBLL();
        lst = rtxConfigBLL.GetAllRTXConfigs(strHQL);

        DataGrid31.DataSource = lst;
        DataGrid31.DataBind();
    }

  
    protected void BT_AddSPInterface_Click(object sender, EventArgs e)
    {
        string strSPName, strSPInterface, strStatus;

        strSPName = TB_SPName.Text.Trim();
        strSPInterface = TB_SPInterface.Text.Trim();
        strStatus = DL_SPInterfaceSTatus.SelectedValue.Trim();

        SMSInterfaceBLL smsInterfaceBLL = new SMSInterfaceBLL();
        SMSInterface smsInterface = new SMSInterface();

        smsInterface.SPName = strSPName;
        smsInterface.SPInterface = strSPInterface;
        smsInterface.Status = strStatus;

        try
        {
            smsInterfaceBLL.AddSMSInterface(smsInterface);

            LoadSMSInterface();
        }
        catch
        {
        }
    }

    protected void BT_DeleteSPInterface_Click(object sender, EventArgs e)
    {
        string strID, strSPName, strSPInterface, strStatus;

        strID = LB_SMSInterfaceID.Text.Trim();
        strSPName = TB_SPName.Text.Trim();
        strSPInterface = TB_SPInterface.Text.Trim();
        strStatus = DL_SPInterfaceSTatus.SelectedValue.Trim();

        SMSInterfaceBLL smsInterfaceBLL = new SMSInterfaceBLL();
        SMSInterface smsInterface = new SMSInterface();

        smsInterface.ID = int.Parse(strID);
        smsInterface.SPName = strSPName;
        smsInterface.SPInterface = strSPInterface;
        smsInterface.Status = strStatus;

        try
        {
            smsInterfaceBLL.DeleteSMSInterface(smsInterface);

            LoadSMSInterface();
        }
        catch
        {
        }
    }

    protected void BT_AddNetSegment_Click(object sender, EventArgs e)
    {
        string strBeginSegment, strEndSegment;

        strBeginSegment = TB_BeginNetSegment.Text.Trim();
        strEndSegment = TB_EndNetSegment.Text.Trim();

        SMSNetSegmentBLL smsNetSegmentBLL = new SMSNetSegmentBLL();
        SMSNetSegment smsNetSegment = new SMSNetSegment();

        smsNetSegment.BeginSegment = strBeginSegment;
        smsNetSegment.EndSegment = strEndSegment;

        try
        {
            smsNetSegmentBLL.AddSMSNetSegment(smsNetSegment);

            LoadSMSNetSegment();
        }
        catch
        {
        }
    }

    protected void BT_DeleteNetSegment_Click(object sender, EventArgs e)
    {
        string strID, strBeginSegment, strEndSegment;

        strID = LB_NetSegmentID.Text.Trim();
        strBeginSegment = TB_BeginNetSegment.Text.Trim();
        strEndSegment = TB_EndNetSegment.Text.Trim();

        SMSNetSegmentBLL smsNetSegmentBLL = new SMSNetSegmentBLL();
        SMSNetSegment smsNetSegment = new SMSNetSegment();

        smsNetSegment.ID = int.Parse(strID);
        smsNetSegment.BeginSegment = strBeginSegment;
        smsNetSegment.EndSegment = strEndSegment;

        try
        {
            smsNetSegmentBLL.DeleteSMSNetSegment(smsNetSegment);

            LoadSMSNetSegment();
        }
        catch
        {
        }
    }


    protected void BT_AddRTX_Click(object sender, EventArgs e)
    {
        string strServerIP, strServerPort, strWebSite;

        strServerIP = TB_RTXServerIP.Text.Trim();
        strServerPort = TB_RTXServerPort.Text.Trim();
        strWebSite = TB_RTXWebSite.Text.Trim();

        RTXConfigBLL rtxConfigBLL = new RTXConfigBLL();
        RTXConfig rtxConfig = new RTXConfig();

        rtxConfig.ServerIP = strServerIP;
        rtxConfig.ServerPort = int.Parse(strServerPort);
        rtxConfig.WebSite = strWebSite;

        try
        {
            rtxConfigBLL.AddRTXConfig(rtxConfig);

            LoadRTXConfig();
        }
        catch
        {
        }
    }

    protected void BT_DeleteRTX_Click(object sender, EventArgs e)
    {
        string strServerIP, strServerPort, strWebSite;

        strServerIP = TB_RTXServerIP.Text.Trim();
        strServerPort = TB_RTXServerPort.Text.Trim();
        strWebSite = TB_RTXWebSite.Text.Trim();

        RTXConfigBLL rtxConfigBLL = new RTXConfigBLL();
        RTXConfig rtxConfig = new RTXConfig();

        rtxConfig.ServerIP = strServerIP;
        rtxConfig.ServerPort = int.Parse(strServerPort);
        rtxConfig.WebSite = strWebSite;

        try
        {
            rtxConfigBLL.DeleteRTXConfig(rtxConfig);

            LoadRTXConfig();
        }
        catch
        {
        }
    }

    protected int GetScheduleLimitedDays()
    {
        string strHQL;


        strHQL = "Select LimitedDays From T_ScheduleLimitedDays";

        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_ScheduleLimitedDays");

        if (ds.Tables[0].Rows.Count > 0)
        {
            return int.Parse(ds.Tables[0].Rows[0][0].ToString());
        }
        else
        {
            return 0;
        }

    }


    //判断输入的字符是否是数字
    private bool IsNumeric(string str)
    {
        System.Text.RegularExpressions.Regex reg1
            = new System.Text.RegularExpressions.Regex(@"^[-]?\d+[.]?\d*$");
        return reg1.IsMatch(str);
    }

    protected void BT_WeiXinStand_Click(object sender, EventArgs e)
    {
        string strHQL;

        if (TB_WeiXinNo.Text.Trim() == "")
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('公众号AppID不能为空！')", true);
            TB_WeiXinNo.Focus();

            return;
        }

        string strWeiXinNo, strPassWord, strStatus;

        strWeiXinNo = TB_WeiXinNo.Text.Trim();
        strPassWord = TB_PassWord.Text.Trim();

        strStatus = DL_WeiXinGZHStatus.SelectedValue.Trim();

        try
        {
            strHQL = "Delete From T_WeiXinStand";
            ShareClass.RunSqlCommand(strHQL);

            WeiXinStandBLL weiXinStandBLL = new WeiXinStandBLL();
            WeiXinStand weiXinStand = new WeiXinStand();
            weiXinStand.WeiXinNo = TB_WeiXinNo.Text.Trim();
            weiXinStand.PassWord = TB_PassWord.Text.Trim();

            weiXinStand.Status = DL_WeiXinGZHStatus.SelectedValue.Trim();
            try
            {
                weiXinStandBLL.AddWeiXinStand(weiXinStand);

                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZBCCG + "')", true);
            }
            catch
            {
                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZBCSBJC + "')", true);
            }

            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZBCCG + "')", true);
        }
        catch
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZBCSBJC + "')", true);
        }
    }

    protected void BT_WeChatQYSave_Click(object sender, EventArgs e)
    {
        if (TB_WeChatQYCorpID.Text.Trim() == "" || TB_WeChatQYApplicationID.Text.Trim() == "")
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('企业号CordID和应用ID不能为空！')", true);
            TB_WeChatQYCorpID.Focus();
            TB_WeChatQYApplicationID.Focus();
            return;
        }

        string strHQL;

        string strCorpID, strSecret, strAppID, strStatus;

        strCorpID = TB_WeChatQYCorpID.Text.Trim();
        strSecret = TB_WeChatQYSecret.Text.Trim();
        strAppID = TB_WeChatQYApplicationID.Text.Trim();
        strStatus = DL_WeiXinQYHStatus.SelectedValue.Trim();

        try
        {
            strHQL = "Delete From T_WeiXinQYStand";
            ShareClass.RunSqlCommand(strHQL);

            strHQL = "Insert Into T_WeiXinQYStand(CorpID,CorpSecret,AgentID,Status) values('" + strCorpID + "','" + strSecret + "','" + strAppID + "','" + strStatus + "')";
            ShareClass.RunSqlCommand(strHQL);

            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZBCCG + "')", true);
        }
        catch
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZBCSBJC + "')", true);
        }
    }


    protected void BT_MeetingSystem_Click(object sender, EventArgs e)
    {
        string strMeetingSystemURL = TXT_MeetingSystemURL.Text.Trim();
        string strMeetingURL = TXT_MeetingURL.Text.Trim();
        string strMeetingCount = TXT_MeetingCount.Text.Trim();
        if (!string.IsNullOrEmpty(strMeetingSystemURL))
        {
            try
            {
                int intMeetingCount = 0;
                int.TryParse(strMeetingCount, out intMeetingCount);

                string strMeetingSystemHQL = "select * from T_MeetingSystemURL";
                DataTable dtMeetingSystem = ShareClass.GetDataSetFromSql(strMeetingSystemHQL, "strMeetingSystemHQL").Tables[0];
                if (dtMeetingSystem != null && dtMeetingSystem.Rows.Count > 0)
                {
                    //修改
                    string strUpdateMeetingSystemHQL = string.Format("update T_MeetingSystemURL set MeetingSystemURL = '{0}',MeetingURL='{1}',MeetingCount={2}", strMeetingSystemURL, strMeetingURL, intMeetingCount);
                    ShareClass.RunSqlCommand(strUpdateMeetingSystemHQL);
                }
                else
                {
                    //增加
                    string strAddMeetingSystemHQL = string.Format("insert into T_MeetingSystemURL values('{0}','{1}',{2})", strMeetingSystemURL, strMeetingURL, intMeetingCount);
                    ShareClass.RunSqlCommand(strAddMeetingSystemHQL);
                }

                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZBCCG + "')", true);
            }
            catch
            {
                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZBCSBJC + "')", true);
            }
        }
        else
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZYSGXDBNWKQJC + "')", true);
        }
    }

    private void LoadMeetingSystem()
    {
        string strMeetingSystemHQL = "select MeetingSystemURL from T_MeetingSystemURL";
        DataTable dtMeetingSystem = ShareClass.GetDataSetFromSql(strMeetingSystemHQL, "strMeetingSystemHQL").Tables[0];
        if (dtMeetingSystem != null && dtMeetingSystem.Rows.Count > 0)
        {
            TXT_MeetingSystemURL.Text = dtMeetingSystem.Rows[0]["MeetingSystemURL"].ToString();
        }
    }

    protected void LoadWeiXinStand()
    {
        string strHQL = "Select * From T_WeiXinStand";
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_WeiXinStand");
        if (ds != null && ds.Tables[0].Rows.Count > 0)
        {
            TB_WeiXinNo.Text = ds.Tables[0].Rows[0]["WeiXinNo"].ToString().Trim();
            TB_PassWord.Text = ds.Tables[0].Rows[0]["PassWord"].ToString().Trim();
            //TB_TokenValue.Text = ds.Tables[0].Rows[0]["TokenValue"].ToString().Trim();
            DL_WeiXinGZHStatus.SelectedValue = ds.Tables[0].Rows[0]["Status"].ToString().Trim();
        }
        else
        {
            TB_WeiXinNo.Text = "";
            TB_PassWord.Text = "";
            //TB_TokenValue.Text = "";
            DL_WeiXinGZHStatus.SelectedValue = "NO";
        }
    }

    protected void LoadWeChatQYAccount()
    {
        string strHQL;

        strHQL = "Select CorpID,CorpSecret,AgentID,Status From T_WeiXinQYStand";
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_WeiXinQYStand");

        if (ds.Tables[0].Rows.Count > 0)
        {
            TB_WeChatQYCorpID.Text = ds.Tables[0].Rows[0][0].ToString().Trim();
            TB_WeChatQYSecret.Text = ds.Tables[0].Rows[0][1].ToString().Trim();
            TB_WeChatQYApplicationID.Text = ds.Tables[0].Rows[0][2].ToString().Trim();
            DL_WeiXinQYHStatus.SelectedValue = ds.Tables[0].Rows[0][3].ToString().Trim();
        }
        else
        {
            TB_WeChatQYCorpID.Text = "";
            TB_WeChatQYSecret.Text = "";
            TB_WeChatQYApplicationID.Text = "";
            DL_WeiXinQYHStatus.SelectedValue = "NO";
        }
    }


    protected bool IsWeiXinStand(string strWeiXinNo)
    {
        bool flag = false;
        string strHQL = "From WeiXinStand as weiXinStand Where weiXinStand.WeiXinNo='" + strWeiXinNo + "' ";
        WeiXinStandBLL weiXinStandBLL = new WeiXinStandBLL();
        IList lst = weiXinStandBLL.GetAllWeiXinStands(strHQL);
        if (lst != null && lst.Count > 0)
            flag = true;

        return flag;
    }

    protected string GetDayHourNumID()
    {
        string flag = "0";
        string strHQL = "From DayHourNum as dayHourNum Order By dayHourNum.ID Desc ";
        DayHourNumBLL dayHourNumBLL = new DayHourNumBLL();
        IList lst = dayHourNumBLL.GetAllDayHourNums(strHQL);
        if (lst.Count > 0 && lst != null)
        {
            DayHourNum dayHourNum = (DayHourNum)lst[0];
            flag = dayHourNum.ID.ToString();
        }
        return flag;
    }

}
