<%@ Application Language="C#" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<%@ Import Namespace="System.Collections" %>
<%@ Import Namespace="System.IO" %>
<%@ Import Namespace="System.Net" %>
<%@ Import Namespace="System.Threading" %>

<script RunAt="server">

    public System.Threading.Thread schedulerThread = null;

    void Application_Start(object sender, EventArgs e)
    {
        // Code that runs on application startup
        Application["user_sessions"] = 0;

        SchedulerConfiguration config = new SchedulerConfiguration(1000 * 480);
        config.Jobs.Add(new SampleJob());
        Scheduler scheduler = new Scheduler(config);
        System.Threading.ThreadStart myThreadStart = new System.Threading.ThreadStart(scheduler.Start);
        System.Threading.Thread schedulerThread = new System.Threading.Thread(myThreadStart);
        schedulerThread.Start();

        try
        {
            //初始化实体类，以加快后续的操作速度
            ShareClass.InitialNhibernateEntryClass();
        }
        catch (Exception err)
        {
            //LogClass.WriteLogFile(err.Message.ToString());
        }
    }

    void Application_End(object sender, EventArgs e)
    {
        if (null != schedulerThread)
        {
            schedulerThread.Abort();
        }

        try
        {
            //初始化实体类，以加快后续的操作速度
            ShareClass.InitialNhibernateEntryClass();
        }
        catch (Exception err)
        {
            //LogClass.WriteLogFile(err.Message.ToString());
        }
    }

    void Application_Error(object sender, EventArgs e)
    {
        // Code that runs when an unhandled error occurs
        try
        {
            string error;
            Exception objErr = Server.GetLastError().GetBaseException();
            error = "URL: " + Request.Url.ToString() + "\n";
            error += "Message " + objErr.Message + "\n";
            error += objErr.StackTrace + "\n";

            if (error.IndexOf("System.Web.HttpApplication.IExecutionStep.Execute()") < 0)
            {
                LogClass.WriteLogFile(error);
            }
        }
        catch (Exception err)
        {
            //LogClass.WriteLogFile(err.Message.ToString());
        }
    }

    void Session_Start(object sender, EventArgs e)
    {
        // Code that runs when a new session is started
        Application.Lock();
        Application["user_sessions"] = (int)Application["user_sessions"] + 1;
        Application.UnLock();
    }

    void Session_End(object sender, EventArgs e)
    {
        // Code that runs when a session ends. 
        // Note: The Session_End event is raised only when the sessionstate mode
        // is set to InProc in the Web.config file. If session mode is set to StateServer 
        // or SQLServer, the event is not raised.
        Application.Lock();
        Application["user_sessions"] = (int)Application["user_sessions"] - 1;
        Application.UnLock();
    }

    void Application_BeginRequest(Object sender, EventArgs e)
    {
        try
        {
            if (Request.Cookies["LangCode"] != null)
            {
                System.Threading.Thread.CurrentThread.CurrentCulture = System.Globalization.CultureInfo.CreateSpecificCulture(Request.Cookies["LangCode"].Value.ToString());
                System.Threading.Thread.CurrentThread.CurrentUICulture = new System.Globalization.CultureInfo(Request.Cookies["LangCode"].Value.ToString());
            }
        }
        catch (Exception err)
        {
            //LogClass.WriteLogFile(err.Message.ToString());
        }
    }


    public class SchedulerConfiguration
    {
        //时间间隔
        private int sleepInterval;
        //任务列表
        private ArrayList jobs = new ArrayList();

        public int SleepInterval { get { return sleepInterval; } }
        public ArrayList Jobs { get { return jobs; } }

        //调度配置类的构造函数
        public SchedulerConfiguration(int newSleepInterval)
        {
            sleepInterval = newSleepInterval;
        }
    }

    public interface ISchedulerJob
    {
        void Execute();
    }

    public class SampleJob : ISchedulerJob
    {
        public void Execute()
        {
            //执行定时器页
            ShareClass.ExecuteTakeTopTimer();
        }
    }

    public class Scheduler
    {
        private SchedulerConfiguration configuration = null;

        public Scheduler(SchedulerConfiguration config)
        {
            configuration = config;
        }

        public void Start()
        {
            while (true)
            {
                //执行每一个任务
                foreach (ISchedulerJob job in configuration.Jobs)
                {
                    ThreadStart myThreadDelegate = new ThreadStart(job.Execute);
                    Thread myThread = new Thread(myThreadDelegate);
                    myThread.Start();
                    Thread.Sleep(configuration.SleepInterval);
                }
            }
        }
    }


</script>
