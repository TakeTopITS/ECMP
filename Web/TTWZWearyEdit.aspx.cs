using ProjectMgt.BLL;
using ProjectMgt.Model;
using System; using System.Resources;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class TTWZWearyEdit : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
         string strUserCode = Session["UserCode"].ToString();if (!IsPostBack)
        {
            if (!string.IsNullOrEmpty(Request.QueryString["id"]))
            {
                string strWearyCode = Request.QueryString["id"].ToString();
                HF_WearyCode.Value = strWearyCode;

                BindWearyData(strWearyCode);
            }
        }
    }


    protected void btnOK_Click(object sender, EventArgs e)
    {
        try
        {
            WZWearyBLL wZWearyBLL = new WZWearyBLL();
            WZWeary wZWeary = new WZWeary();
            wZWeary.WearyCode = TXT_WearyCode.Text.Trim();
            wZWeary.StoreRoom = TXT_StoreRoom.Text.Trim();
            wZWeary.PlanTime = Convert.ToDateTime(TXT_PlanTime.Text.Trim());
            wZWeary.WearyTotalMoney = Convert.ToDecimal( TXT_WearyTotalMoney.Text.Trim());
            wZWeary.RowNumber = Convert.ToInt32( TXT_RowNumber.Text.Trim());
            wZWeary.WearyBalance = Convert.ToDecimal(TXT_WearyBalance.Text.Trim());
            wZWeary.OverNumber = Convert.ToInt32( TXT_OverNumber.Text.Trim());
            wZWeary.Remark = TXT_Remark.Text.Trim();
            wZWeary.Process = TXT_Process.Text.Trim();
            wZWeary.MainLeader = TXT_MainLeader.Text.Trim();
            wZWeary.Marker = TXT_Marker.Text.Trim();

            if (!string.IsNullOrEmpty(HF_WearyCode.Value))
            {
                //修改
                string strWearyCode = HF_WearyCode.Value;
                wZWearyBLL.UpdateWZWeary(wZWeary, strWearyCode);
            }
            else
            {
                //增加
                wZWearyBLL.AddWZWeary(wZWeary);
            }

            Response.Redirect("TTWZWearyList.aspx");
        }
        catch (Exception ex)
        { }
    }


    private void BindWearyData(string strWearyCode)
    {
        WZWearyBLL wZWearyBLL = new WZWearyBLL();
        string strWZWearySql = "from WZWeary as wZWeary where WearyCode = '" + strWearyCode + "'";
        IList listWZWeary = wZWearyBLL.GetAllWZWearys(strWZWearySql);
        if (listWZWeary != null && listWZWeary.Count > 0)
        {
            WZWeary wZWeary = (WZWeary)listWZWeary[0];
            TXT_WearyCode.Text = wZWeary.WearyCode;
            TXT_StoreRoom.Text = wZWeary.StoreRoom;
            TXT_PlanTime.Text = wZWeary.PlanTime.ToString();
            TXT_WearyTotalMoney.Text = wZWeary.WearyTotalMoney.ToString();
            TXT_RowNumber.Text = wZWeary.RowNumber.ToString();
            TXT_WearyBalance.Text = wZWeary.WearyBalance.ToString();
            TXT_OverNumber.Text = wZWeary.OverNumber.ToString();
            TXT_Remark.Text = wZWeary.Remark;
            TXT_Process.Text = wZWeary.Process;
            TXT_MainLeader.Text = wZWeary.MainLeader;
            TXT_Marker.Text = wZWeary.Marker;
        }
    }
}