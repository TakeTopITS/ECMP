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


using NickLee.Views.Web.UI;
using NickLee.Views.Windows.Forms.Printing;


using ProjectMgt.Model;
using ProjectMgt.DAL;
using ProjectMgt.BLL;

public partial class TTWorkPlanRelatedTaskListView : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string strHQL;
        IList lst;


        string strPlanID = Request.QueryString["PlanID"];
        string strUserCode = Session["UserCode"].ToString();
        LB_UserCode.Text = strUserCode;

        if (ShareClass.CheckUserCanViewProjectPlan(strPlanID, strUserCode) == false)
        {
            Response.Redirect("TTDisplayCustomErrorMessage.aspx?ErrorMsg='" + Resources.lang.ZZJGZYXMJLJHYJHCJRHLXZJHFZRCNJXZCZQJC + "'");
        }

        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "clickA", "aHandler();", true);
        if (Page.IsPostBack != true)
        {
            strHQL = "from ProjectTask as projectTask where projectTask.PlanID = " + strPlanID + " Order by projectTask.TaskID DESC";
            ProjectTaskBLL projectTaskBLL = new ProjectTaskBLL();
            lst = projectTaskBLL.GetAllProjectTasks(strHQL);

            DataGrid1.DataSource = lst;
            DataGrid1.DataBind();

            SetProTaskColor();

            FinishPercentPicture1();

            LB_Sql.Text = strHQL;
        }
    }

    protected void SetProTaskColor()
    {
        int i;
        DateTime dtNowDate, dtFinishedDate;
        string strStatus;

        for (i = 0; i < DataGrid1.Items.Count; i++)
        {
            dtFinishedDate = DateTime.Parse(DataGrid1.Items[i].Cells[6].Text.Trim());
            dtNowDate = DateTime.Now;
            strStatus = DataGrid1.Items[i].Cells[4].Text.Trim();

            if (strStatus != "完成" | strStatus != "关闭")
            {
                if (dtFinishedDate < dtNowDate)
                {
                    DataGrid1.Items[i].ForeColor = Color.Red;
                }
            }
        }
    }

    protected void FinishPercentPicture1()
    {
        string strProjectID;
        double decFinishPercent;
        double deHeight;
        int intWidth;
        int i;


        for (i = 0; i < DataGrid1.Items.Count; i++)
        {
            strProjectID = DataGrid1.Items[i].Cells[0].Text.Trim();
            //decFinishPercent = double.Parse(DataGrid1.Items[i].Cells[4].Text.Trim());

            decFinishPercent = double.Parse((((System.Web.UI.WebControls.Label)DataGrid1.Items[i].FindControl("LB_FinishPercent")).Text));
            intWidth = int.Parse(decFinishPercent.ToString());

            if (intWidth > 25)
            {
                ((System.Web.UI.WebControls.Label)DataGrid1.Items[i].FindControl("LB_FinishPercent")).Width = Unit.Pixel(intWidth);
            }

            ((System.Web.UI.WebControls.Label)DataGrid1.Items[i].FindControl("LB_FinishPercent")).Text = intWidth.ToString() + "%";
        }
    }
}
