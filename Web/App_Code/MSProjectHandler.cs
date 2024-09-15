using net.sf.mpxj;
using net.sf.mpxj.MpxjUtilities;
using net.sf.mpxj.reader;

using ProjectMgt.BLL;
using ProjectMgt.Model;

using System;
using System.Data;
using System.IO;

/// <summary>
/// ImportMSProjectToProjectPlan 的摘要说明
/// </summary>
public class MSProjectHandler
{
    public MSProjectHandler()
    {
        //
        // TODO: 在此处添加构造函数逻辑
        //
    }


    /// <summary>
    /// 导入MSProject文件
    /// </summary>
    /// <param name="filename">文件地址</param>
    /// <param name="projectId"></param>
    /// <param name="usercode"></param>
    /// <param name="dt1">任务列表</param>
    /// <param name="dt2">前置任务列表</param>
    /// <returns></returns>
    public static void ImportMPPFileToDataTable(string srcFile, string strProjectID, string strVerID, string strUserCode)
    {
        ProjectReader reader = ProjectReaderUtility.getProjectReader(srcFile);
        ProjectFile file = reader.read(srcFile);

        string strHQL;
        string[] strWBSList, strTaskIDList;

        int intPID;
        string strPlanID, strFromID, strToID, strConstrainType;
        string strUserName;

        strUserName = ShareClass.GetUserName(strUserCode);

        intPID = GetPIDForGantt(int.Parse(strProjectID), int.Parse(strVerID));


        //判断文件是否存在
        if (!File.Exists(srcFile))
        {
            // MessageState.SetMessageBox(MSG._FILE_NOT_EXIST, MessageType.Alert);
            return;
        }
        //检查是否是MS Project 文件
        string ext = Path.GetExtension(srcFile).ToLower();
        if (ext.IndexOf("mpp") == -1)
        {
            //MessageState.SetMessageBox(MSG._FILE_NOT_FIT, MessageType.Alert);
            return;
        }

        strHQL = "delete from T_PlanMember where PlanID in (Select ID From T_ImplePlan where ProjectID = " + strProjectID + " and VerID = " + strVerID + ")";
        ShareClass.RunSqlCommand(strHQL);
        strHQL = "delete from T_ImplePlan where ProjectID = " + strProjectID + " and VerID = " + strVerID;
        ShareClass.RunSqlCommand(strHQL);

        strWBSList = new string[10000];
        strTaskIDList = new string[10000];


        int intParentID = 0, intTaskID = 1, j = 0;
        int intParentIDGantt;

        WorkPlanBLL workPlanBLL = new WorkPlanBLL();
        WorkPlan workPlan = new WorkPlan();

        foreach (net.sf.mpxj.Task task in file.getTasks().ToIEnumerable())
        {
            if (task.getID().toString() == "0") //自动创建的节点，一般为文件名，不需要
            {
                continue;
            }

            if (task.getParentTask() != null && Convert.ToInt32(task.getOutlineLevel().toString()) > 1) //是否根节点，mpp文件必须只有一个根节点，否则会报错
            {
                intParentID = int.Parse(task.getParentTask().getID().toString());
            }

            intParentIDGantt = int.Parse(getPlanIDByBackupID(strProjectID, strVerID, intParentID.ToString()));
            //LogClass.WriteLogFile(intParentID.ToString());

            workPlan.WorkID = 0;
            workPlan.Type = "计划";
            workPlan.ProjectID = int.Parse(strProjectID);
            workPlan.VerID = int.Parse(strVerID);
            workPlan.FromProjectID = int.Parse(strProjectID);
            workPlan.FromProjectPlanVerID = int.Parse(strVerID);
            workPlan.Name = task.getName();

            workPlan.Budget = 0;
            workPlan.WorkHour = 0;

            workPlan.Resource = task.getResourceNames();

            if (task.getStart() != null)
            {
                workPlan.Start_Date = DateTime.Parse(task.getStart().ToDateTime().ToString());
            }
            else
            {
                workPlan.Start_Date = DateTime.Now;
            }

            if (task.getFinish() != null)
            {
                workPlan.End_Date = DateTime.Parse(task.getFinish().ToDateTime().ToString());
            }
            else
            {
                workPlan.End_Date = DateTime.Now;
            }

            workPlan.MakeDate = DateTime.Now;

            workPlan.PriorID = 0;
            workPlan.Status = "计划";
            workPlan.DefaultSchedule = 0;
            workPlan.DefaultCost = 0;

            workPlan.LockStatus = "No";
            //workPlan.SortNumber = int.Parse(task.getID().toString());

            workPlan.SortNumber = getTaskIndex(task.getOutlineNumber());

            workPlan.UpdateManCode = strUserCode;
            workPlan.CreatorCode = strUserCode;
            workPlan.UpdateTime = DateTime.Now;
            workPlan.PID = intPID;

            workPlan.Parent_ID = intParentIDGantt;



            try
            {
                workPlanBLL.AddWorkPlan(workPlan);
                strPlanID = ShareClass.GetMyCreatedMaxProPlanID(strProjectID, strVerID);

                //导入时，如果这个PROJECT文件没有负责人或联系人列，那么直接用当前用户代码和名称替代
                string strLeaderCode, strLeaderName;
                try
                {
                    strLeaderName = task.getContact();
                    strLeaderCode = ShareClass.GetUserCodeByUserName(strLeaderName);
                }
                catch (System.Exception err)
                {
                    strLeaderCode = strUserCode;
                    strLeaderName = strUserName;
                }

                if (strLeaderCode == "")
                {
                    strLeaderCode = strUserCode;
                    strLeaderName = strUserName;
                }

                try
                {
                    ShareClass.AddProjectMember(strProjectID, strLeaderCode, "项目成员", task.getName(), "处理中");
                }
                catch (System.Exception err)
                {
                    LogClass.WriteLogFile("Error page: " + err.Message.ToString() + "\n" + err.StackTrace);
                }

                strHQL = "Update T_ImplePlan Set ParentID = " + intParentID.ToString() + ",BackupID = " + task.getID() + ",LeaderCode = '" + strLeaderCode + "',Leader = '" + strLeaderName + "'";
                //strHQL += " ,BaseLine_Start_Date = Start_Date,BaseLine_End_Date = End_Date,Index = " + j.ToString();
                strHQL += " ,BaseLine_Start_Date = Start_Date,BaseLine_End_Date = End_Date";
                strHQL += " where ProjectID = " + strProjectID + " and VerID = " + strVerID + " and ID = " + strPlanID;
                ShareClass.RunSqlCommand(strHQL);


                /*前后置关系：如果任务1->2有关系，那么，在1-2中都会有TaskDependencies。其中1的from=自己，to=2；2的from=1，to=自己*/
                if (task.getPredecessors() != null && task.getPredecessors().isEmpty() == false)
                {
                    foreach (Relation relation in task.getPredecessors().ToIEnumerable())
                    {
                        strFromID = relation.getTargetTask().getID().toString();
                        strToID = relation.getSourceTask().getID().toString();
                        strConstrainType = relation.getType().getValue().ToString();

                        strFromID = getPlanIDByBackupID(strProjectID, strVerID, strFromID);
                        strToID = getPlanIDByBackupID(strProjectID, strVerID, strToID);

                        if (strToID != "0")
                        {
                            strHQL = String.Format(@"Insert Into dependency(pid,from_id,to_id,type)
                                 values({0},{1},{2},{3})", intPID, int.Parse(strFromID), int.Parse(strToID), int.Parse(strConstrainType));
                            ShareClass.RunSqlCommand(strHQL);
                        }
                    }
                }


                intTaskID = int.Parse(task.getID().ToString());
                strWBSList[j] = task.getWBS().Trim();
                strTaskIDList[j] = task.getID().ToString();
                j++;
            }
            catch (System.Exception err)
            {
                LogClass.WriteLogFile("Error page: " + err.Message.ToString() + "\n" + err.StackTrace);
            }
        }
    }

    //取得计划index
    public static int getTaskIndex(string str)
    {

        if (str.IndexOf(".") != -1)
        {
            int lastDotIndex = str.LastIndexOf(".");
            string subStr = str.Substring(lastDotIndex + 1);

            while (subStr.IndexOf(".") != -1)
            {
                lastDotIndex = subStr.LastIndexOf(".");
                subStr = subStr.Substring(lastDotIndex + 1);
            }

            return int.Parse(subStr);
        }
        else
        {
            return int.Parse(str);
        }

    }

    public static string getPlanIDByBackupID(string strProjectID, string strVerID, string strBackupID)
    {
        string strHQL;

        strHQL = "Select ID From T_ImplePlan Where ProjectID = " + strProjectID + " and VerID = " + strVerID + " and BackupID = " + strBackupID;
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_ImplePlan");

        if (ds.Tables[0].Rows.Count > 0)
        {
            return ds.Tables[0].Rows[0][0].ToString();
        }
        else
        {
            return "0";
        }
    }


    //取得GANTT图控件用的项目和计划版本号
    public static int GetPIDForGantt(int intProjectID, int intVerID)
    {
        string strVerID, strPID;

        if (intVerID < 10)
        {
            strVerID = "0" + intVerID.ToString();
        }
        else
        {
            strVerID = intVerID.ToString();
        }

        strPID = intProjectID.ToString() + strVerID;

        return int.Parse(strPID);
    }
}

