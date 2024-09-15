using System;
using System.Web.UI;

public partial class TTCustomerRegisterFromWebSite_TakeTopSoft : System.Web.UI.Page
{
    string strSystemType,strWebSite;

    protected void Page_Load(object sender, EventArgs e)
    {
        strSystemType = Request.QueryString["SystemType"];

        strWebSite = Request.QueryString["WebSite"];
        if (strWebSite == null)
        {
            strWebSite = "";
        }

        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "clickA", "aHandler();", true);
        if (Page.IsPostBack == false)
        {
            if (strSystemType == "XMB")
            {
                LB_Product.Text = "泰顶项目宝";
            }

            if (strSystemType == "ECMP")
            {
                LB_Product.Text = "项目综合管理平台";
            }

            if (strSystemType == "GEPMP")
            {
                LB_Product.Text = "项目管理平台";
            }

            if (strSystemType == "RDPMP")
            {
                LB_Product.Text = "研发项目管理平台";
            }

            if (strSystemType == "GAPMP")
            {
                LB_Product.Text = "政务项目管理平台";
            }

            if (strSystemType == "ENPMP")
            {
                LB_Product.Text = "工程项目管理平台";
            }

            if (strSystemType == "SIMP")
            {
                LB_Product.Text = "系统集成项目管理平台";
            }

            if (strSystemType == "SOMP")
            {
                LB_Product.Text = "软件实施项目管理平台";
            }

            if (strSystemType == "ERP")
            {
                LB_Product.Text = "项目型ERP平台";
            }

            if (strSystemType == "CRM")
            {
                LB_Product.Text = "CRM平台";
            }

            if (strSystemType == "CMP")
            {
                LB_Product.Text = "协同OA平台";
            }
        }
    }

    protected void BT_Summit_Click(object sender, EventArgs e)
    {
        string strCompany, strUserIP, strUserPosition, strContactPerson, strPhoneNumber, strEMail, strAddress, strPostCode, strType, strQuestion;
        string strSQL;
        DateTime dtAnswerTime;
        string strTargetPage = "";

        strUserIP = Request.UserHostAddress.Trim();
        strUserPosition = ShareClass.GetIPinArea(strUserIP);
        strCompany = TB_Company.Text.Trim();
        strContactPerson = TB_ContactPerson.Text.Trim();
        strPhoneNumber = TB_PhoneNumber.Text.Trim();
        strEMail = TB_EMail.Text.Trim();
        strAddress = TB_Address.Text.Trim();
        strPostCode = TB_PostCode.Text.Trim();
        strType = LB_Product.Text.Trim();
        strQuestion = DL_Description.SelectedValue;
        dtAnswerTime = DateTime.Now.AddHours(24);

        if (strCompany == "" | strContactPerson == "" | strPhoneNumber == "" | strQuestion == "")
        {
            LB_Message.Text = "提交失败，带*号项不能为空，请检查！";
        }
        else
        {
            if (String.Compare(Request.Cookies["CheckCode"].Value, TB_CheckCode.Text, true) != 0)
            {
                TB_CheckCode.Text = "";

                LB_Message.Text = "提交失败，验证码错误，请检查！";
                return;
            }

            //推送信息给客服主管
            try
            {
                string strCSOperatorCode = ShareClass.GetWebSiteCustomerServiceOperatorCode(strWebSite);
                string strNofiInfo = "提示：公司: " + strCompany + " 的员工: " + strContactPerson + "( " + strPhoneNumber + " )" + " 提交了：" + strType + " 的试用信息，请关注！！！";
                Action action = new Action(delegate ()
                {
                    try
                    {
                        Msg msg = new Msg();
                        msg.SendMSM("Message", strCSOperatorCode, strNofiInfo, "ADMIN");
                    }
                    catch (Exception ex)
                    {
                    }
                });
                System.Threading.Tasks.Task.Factory.StartNew(action);
            }
            catch (Exception ex)
            {
                LB_Message.Text = ex.Message.ToString();
                return;
            }

            strSQL = " Insert into T_CustomerQuestion(Company,UserIP,UserPosition,ContactPerson,PhoneNumber,EMail,Address,PostCode,Type,Question,SummitTime,AnswerTime,Status,RecorderCode,OperatorCode,OperatorName,OperatorStatus,FromWebSite)";
            strSQL += " Values(" + "'" + strCompany + "'" + "," + "'" + strUserIP + "'" + "," + "'" + strUserPosition + "'" + "," + "'" + strContactPerson + "'" + "," + "'" + strPhoneNumber + "'" + "," + "'" + strEMail + "'" + "," + "'" + strAddress + "'" + "," + "'" + strPostCode + "'" + "," + "'" + strType + "'" + "," + "'" + strQuestion + "'" + "," + "now(),now()+'1 day'::interval," + "'新建'" + ",'','','',''," + "'" + strWebSite + "'" + ")";

            try
            {
                ShareClass.RunSqlCommandForNOOperateLog(strSQL);

                if (strSystemType == "XMB")
                {
                    strTargetPage = "https://www.taketopits.com/XMB/DefaultDemo.aspx";
                }

                if (strSystemType == "ECMP")
                {
                    strTargetPage = "https://www.taketopits.com/taketopECMP/DefaultDemo.aspx";
                }


                if (strSystemType == "ENPMP")
                {
                    strTargetPage = "https://www.taketopits.com/taketopPMPED/DefaultDemo.aspx";

                }

                if (strSystemType == "GEPMP")
                {
                    strTargetPage = "https://www.taketopits.com/taketopPMPGE/DefaultDemo.aspx";

                }

                if (strSystemType == "RDPMP")
                {
                    strTargetPage = "https://www.taketopits.com/taketopPMPRD/DefaultDemo.aspx";

                }

                if (strSystemType == "GAPMP")
                {
                    strTargetPage = "https://www.taketopits.com/taketopPMPGA/DefaultDemo.aspx";

                }

                if (strSystemType == "SIMP")
                {
                    strTargetPage = "https://www.taketopits.com/taketopSIMP/DefaultDemo.aspx";

                }

                if (strSystemType == "SOMP")
                {
                    strTargetPage = "https://www.taketopits.com/taketopSOMP/DefaultDemo.aspx";

                }

                if (strSystemType == "ERP")
                {
                    strTargetPage = "https://www.taketopits.com/taketopERP/DefaultDemo.aspx";

                }


                if (strSystemType == "CMP")
                {
                    strTargetPage = "https://www.taketopits.com/taketopCMP/DefaultDemo.aspx";

                }

                if (strSystemType == "CRM")
                {
                    strTargetPage = "https://www.taketopits.com/taketopCRM/DefaultDemo.aspx";

                }


                string strScript = "openMDIFrom('" + strTargetPage + "');";
                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", strScript, true);

            }
            catch
            {
                LB_Message.Text = "提交失败，请检查！";
            }
        }
    }
}