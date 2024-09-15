using System; using System.Resources;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using ProjectMgt.BLL;
using ProjectMgt.Model;
using System.Collections;
using System.Drawing;
using System.Data;
using System.Text;

public partial class TTWZSendPrintPage : System.Web.UI.Page
{
    string strUserCode,strUserName;

    protected void Page_Load(object sender, EventArgs e)
    {
        strUserCode = Session["UserCode"] == null ? "" : Session["UserCode"].ToString().Trim();
        strUserName = Session["UserName"] == null ? "" : Session["UserName"].ToString();

         if (!IsPostBack)
        {
            if (Request.QueryString["sendCode"] != null)
            {
                string strSendCodes = Request.QueryString["sendCode"];

                if (!string.IsNullOrEmpty(strSendCodes))
                {
                    string[] arrSendCode = strSendCodes.Split(',');
                    string strSends = string.Empty;
                    for (int i = 0; i < arrSendCode.Length; i++)
                    {
                        if (!string.IsNullOrEmpty(arrSendCode[i]))
                        {
                            strSends += "'" + arrSendCode[i] + "',";
                        }
                    }
                    strSends = strSends.EndsWith(",") ? strSends.TrimEnd(',') : strSends;
                    DataSendBinder(strSends);
                }
            }
        }
    }

    private void DataSendBinder(string strSendCodes)
    {
        string strSendHQL = string.Format(@"select s.*,o.Model,o.Grade,o.Criterion,o.ObjectName,o.Unit,n.UnitName,
                u.UserName as UpLeaderName,
                c.UserName as CheckerName,
                k.UserName as SafekeeperName,
                p.UserName as PurchaseEngineerName
                from T_WZSend s
                left join T_WZObject o on s.ObjectCode = o.ObjectCode
                left join T_WZSpan n on o.Unit  = n.ID
                left join T_ProjectMember u on s.UpLeader = u.UserCode
                left join T_ProjectMember c on s.Checker = c.UserCode
                left join T_ProjectMember k on s.Safekeeper = k.UserCode
                left join T_ProjectMember p on s.PurchaseEngineer = p.UserCode
                where s.SendCode in ({0})", strSendCodes);
        DataTable dtCollect = ShareClass.GetDataSetFromSql(strSendHQL, "Send").Tables[0];

        RT_Send.DataSource = dtCollect;
        RT_Send.DataBind();
    }



    protected void RT_Send_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.Item)
        {
            Literal ltMarker = (Literal)e.Item.FindControl("LT_Marker");
            ltMarker.Text = strUserName;
        }
    }
}