using ProjectMgt.BLL;
using ProjectMgt.Model;
using System;
using System.Collections;
using System.Web;
using System.Data;

using TakeTopGantt;

public partial class TTWorkPlanOneStepTransferChildPlanToTask : System.Web.UI.Page
{
    int iLeader = 0;
    protected void Page_Load(object sender, EventArgs e)
    {
        string strCurrentUserCode = HttpContext.Current.Session["UserCode"].ToString().Trim();

        string strProjectID, strPlanVerID;
        string strPlanID = Request.QueryString["PlanID"];


        if (ShareClass.CheckUserCanControlProjectPlan(strPlanID, strCurrentUserCode) == false)
        {
            Response.Redirect("TTDisplayCustomErrorMessage.aspx?ErrorMsg='" + Resources.lang.ZZJGZYXMJLJHYJHCJRHLXZJHFZRCNJXZCZQJC + "'");
        }


        strProjectID = ShareClass.getProjectIDByPlanID(strPlanID);
        strPlanVerID = ShareClass.getProjectWorkPlanVerIDByPlanID(strPlanID);

        try
        {
            PlanTransferChildPlanToTask(strPlanID, strProjectID, strPlanVerID, strCurrentUserCode);

            if (iLeader > 0)
            {
                LB_Message.Text = Resources.lang.ZZZZJHZRWBFCGCGHYJHMYZDQMR;
            }
            else
            {
                LB_Message.Text = Resources.lang.ZZZZJHZRWCGWC;
            }
        }
        catch (Exception err)
        {
            LogClass.WriteLogFile("Error page: " + Request.Url.ToString() + "\n" + err.Message.ToString() + "\n" + err.StackTrace);

            LB_Message.Text = Resources.lang.ZZJGZJHZRWSBQJC;
        }
    }

    public void PlanTransferChildPlanToTask(string strPlanID, string strProjectID, string strPlanVerID, string strUserCode)
    {
        string strHQL;
        IList lst1;
        string strPlanName, strLeaderName;

        strHQL = "from WorkPlan as workPlan where workPlan.VerID = " + strPlanVerID + " and workPlan.ProjectID = " + strProjectID;
        strHQL += " and workPlan.ID = " + strPlanID;
        WorkPlanBLL workPlanBLL = new WorkPlanBLL();
        lst1 = workPlanBLL.GetAllWorkPlans(strHQL);
        if (lst1.Count == 0)
        {
            return;
        }
        WorkPlan workPlan = new WorkPlan();
        workPlan = (WorkPlan)lst1[0];

        strPlanID = workPlan.ID.ToString();
        strPlanName = workPlan.Name.Trim();

        strLeaderName = ShareClass.getProjectPlanLeaderName(strPlanID);

        if (strLeaderName != "")
        {
            //把计划转成任务
            CreatePlanTask(strPlanID, strProjectID, strPlanVerID);
        }
        else
        {
            iLeader++;
        }

        TransferChildPlanToTask(strProjectID, strPlanVerID, strPlanID, strUserCode);
    }

    public void TransferChildPlanToTask(string strProjectID, string strPlanVerID, string strParentIDGantt, string strUserCode)
    {
        string strHQL;
        IList lst1, lst2;
        string strPlanID, strLeaderName;
        string strUserName = ShareClass.GetUserName(strUserCode);

        WorkPlanBLL workPlanBLL = new WorkPlanBLL();
        WorkPlan workPlan = new WorkPlan();

        strHQL = "from WorkPlan as workPlan where workPlan.ProjectID = " + strProjectID + " and workPlan.VerID = " + strPlanVerID + " and workPlan.Parent_ID =" + strParentIDGantt + " and workPlan.Parent_ID > 0 order by workPlan.SortNumber ASC, workPlan.Start_Date ASC";
        lst1 = workPlanBLL.GetAllWorkPlans(strHQL);
        for (int i = 0; i < lst1.Count; i++)
        {
            workPlan = (WorkPlan)lst1[i];

            strPlanID = workPlan.ID.ToString();

            strLeaderName = ShareClass.getProjectPlanLeaderName(strPlanID);
            if (strLeaderName != "" & CheckPlanIsNotParentPlan(strPlanID) == true)
            {
                //把计划转成任务
                CreatePlanTask(strPlanID, strProjectID, strPlanVerID);
            }
            else
            {
                iLeader++;
            }

            strHQL = "from WorkPlan as workPlan where workPlan.ProjectID = " + strProjectID + " and workPlan.Parent_ID = " + strPlanID + " order by workPlan.SortNumber ASC, workPlan.Start_Date ASC";
            lst2 = workPlanBLL.GetAllWorkPlans(strHQL);
            if (lst2.Count > 0)
            {
                TransferChildPlanToTask(strProjectID, strPlanVerID, strPlanID, strUserCode);
            }
        }
    }

    public void CreatePlanTask(string strPlanID, string strProjectID, string strPlanVerID)
    {
        string strHQL2 = "", strHQL3 = "";

        string strCurrentUserCode = Session["UserCode"].ToString();
        string strCurrentUserName = ShareClass.GetUserName(strCurrentUserCode);

        decimal deRequireNumber, dePrice;
        string strUnitName;

        string strHQL1;
        strHQL1 = "Select RequireNumber,FinishedNumber,UnitName,Price From T_ImplePlan Where ID = " + strPlanID;
        DataSet ds1 = ShareClass.GetDataSetFromSql(strHQL1, "T_ImplePlan");
        deRequireNumber = decimal.Parse(ds1.Tables[0].Rows[0]["RequireNumber"].ToString()) - decimal.Parse(ds1.Tables[0].Rows[0]["FinishedNumber"].ToString());
        strUnitName = ds1.Tables[0].Rows[0]["UnitName"].ToString();
        dePrice = decimal.Parse(ds1.Tables[0].Rows[0]["Price"].ToString());


        try
        {
            strHQL2 = "Insert Into T_ProjectTask(PlanID,ProjectID,Type,Task,Budget,Expense,ManHour,RealManHour,BeginDate,EndDate,MakeManCode,MakeManName,MakeDate,Status,FinishPercent,Priority,IsPlanMainTask,RequireNumber,FinishedNumber,UnitName,Price)";
            strHQL2 += " SELECT ID ,ProjectID ,'Plan',Name,Budget,0,WorkHour,0 ,start_date,end_date,'" + strCurrentUserCode + "','" + strCurrentUserName + "',now(),'处理中',0,'Normal','NO'," + deRequireNumber.ToString() + ",0,'" + strUnitName + "'," + dePrice.ToString();
            strHQL2 += " From  T_ImplePlan Where ProjectID = " + strProjectID + " and VerID = " + strPlanVerID + " and ID = " + strPlanID;
            strHQL2 += " and ID Not In (Select PlanID From T_ProjectTask)";
            ShareClass.RunSqlCommand(strHQL2);

            strHQL3 = "Insert Into T_TaskAssignRecord(TaskID,Task,Type,OperatorCode,OperatorName,OperatorContent,OperationTime,BeginDate,EndDate,AssignManCode,AssignManName,Content,Operation,PriorID,RouteNumber,MakeDate,Status,FinishedNumber,UnitName,MoveTime)";
            strHQL3 += " Select A.TaskID,A.Task,'Plan',B.LeaderCode,B.Leader,'',now(),A.BeginDate,A.EndDate,A.MakeManCode,A.MakeManName,'',A.Task,0,A.TaskID,now(),'计划',0,'" + strUnitName + "',now()";
            strHQL3 += " From T_ProjectTask A,T_ImplePlan B Where A.PlanID = B.ID and A.PlanID = " + strPlanID;
            strHQL3 += " and A.TaskID Not In (Select TaskID From T_TaskAssignRecord)";
            ShareClass.RunSqlCommand(strHQL3);
        }
        catch (Exception err)
        {
            LB_Message.Text = err.Message.ToString();
        }
    }

    //检查计划是不是父计划
    protected bool CheckPlanIsNotParentPlan(string strPlanID)
    {
        string strHQL;

        strHQL = "Select * From T_ImplePlan Where ID = " + strPlanID + " and ID not In (Select Parent_ID From T_ImplePlan)";
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_ImplePlan");
        if (ds.Tables[0].Rows.Count > 0)
        {
            return true;
        }
        else
        {
            return false;
        }
    }

    protected string GetUserCodeByPlanLeaderName(string strPlanID, string strLeaderName)
    {
        string strHQL;

        strHQL = "Select COALESCE(LeaderCode,'') From T_ImplePlan Where Plan = " + strPlanID + " and  LeaderName = '" + strLeaderName + "'";
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_ImplePlan");
        if (ds.Tables[0].Rows.Count > 0)
        {
            return ds.Tables[0].Rows[0][0].ToString().Trim();
        }
        else
        {
            return "";
        }
    }
}