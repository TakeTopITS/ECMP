using System;
using System.Timers;


/// <summary>
/// WatchService 的摘要说明
/// </summary>
public class WatchService
{
    private static System.Timers.Timer updateDataTimer;

    public static void StartWatchService()
    {
        updateDataTimer = new System.Timers.Timer();
        //定时器
        updateDataTimer.Interval = 1000 * 10;   //10秒执行一次
        updateDataTimer.Elapsed += new ElapsedEventHandler(TimeUpdateDataTimer_Elapsed);  //事件委托
        updateDataTimer.Enabled = true;
    }

    private static void TimeUpdateDataTimer_Elapsed(object sender, ElapsedEventArgs e)
    {
        //备份系统数据
        BackupSystemData();

        //推送系统信息
        SendUNSendMessage();
    }

    public static void BackupSystemData()
    {
        //需要的操作写在这个方法中
        try
        {
            string strBackupWeekDayString, strCurrentTime;
            string strWeekDay = Convert.ToInt32(DateTime.Now.DayOfWeek).ToString();

            strBackupWeekDayString = "2,4,6"; //周日，周三，周六执行，晚上两点执行
            strCurrentTime = DateTime.Now.Hour.ToString();

            if (strBackupWeekDayString.IndexOf(strWeekDay) >= 0 & strCurrentTime == "2")
            {
                ShareClass.AutoBackupDataBySystem();
            }
        }
        catch (Exception err)
        {
            LogClass.WriteLogFile("Error page: " + "\n" + err.Message.ToString() + "\n" + err.StackTrace);
        }
    }

    public static void SendUNSendMessage()
    {
        try
        {
            string strCurrentTime, strSendMessagesHourString;

            strSendMessagesHourString = "8,12,18"; //周日，周三，周六执行，晚上两点执行
            strCurrentTime = DateTime.Now.Hour.ToString();

            if (strSendMessagesHourString.IndexOf(strCurrentTime) >= 0)
            {
                //推送末推送的消息
                if (ShareClass.SystemLatestLoginUser == "")
                {
                    ShareClass.SystemLatestLoginUser = "Timer";

                    Msg msg = new Msg();
                    try
                    {
                        msg.SendUNSentSMSBySP();
                    }
                    catch
                    {
                    }

                    ShareClass.SystemLatestLoginUser = "";
                }
            }
        }
        catch (Exception err)
        {
            LogClass.WriteLogFile("Error page: " + "\n" + err.Message.ToString() + "\n" + err.StackTrace);
        }
    }
}