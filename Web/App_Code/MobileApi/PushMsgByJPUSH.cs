using cn.jpush.api;
using cn.jpush.api.push.mode;
using cn.jpush.api.push.notification;

using System;

/// <summary>
/// Summary description for PushMsgByJPUSH
/// </summary>
public class PushMsgByJPUSH
{
    public PushMsgByJPUSH()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    public static String TITLE = "Test from C# v3 sdk";
    public static String ALERT = "Test from  C# v3 sdk - alert";
    public static String MSG_CONTENT = "Test from C# v3 sdk - msgContent";
    public static String REGISTRATION_ID = "0900e8d85ef";
    public static String TAG = "tag_api";

    //极光推送
    public static void SendSMSByJPUSH(string strUserCode, string strMessage)
    {
        string app_Key = "36dcc8a968eef4a9ded23571";	//必填，例如466f7032ac604e02fb7bda89
        string master_Secret = "ce5a43c617f79d7efbc0597f";//必填，每个应用都对应一个masterSecret

        JPushClient client = new JPushClient(app_Key, master_Secret);
        PushPayload payload = PushObject_all_alias_alert(strUserCode, strMessage);
        //try
        //{
        var result = client.SendPush(payload);
        ////由于统计数据并非非是即时的,所以等待一小段时间再执行下面的获取结果方法
        //System.Threading.Thread.Sleep(10000);
        ///*如需查询上次推送结果执行下面的代码*/
        //var apiResult = client.getReceivedApi(result.msg_id.ToString());
        //var apiResultv3 = client.getReceivedApi_v3(result.msg_id.ToString());
        ///*如需查询某个messageid的推送结果执行下面的代码*/
        //var queryResultWithV2 = client.getReceivedApi("1739302794");
        //var querResultWithV3 = client.getReceivedApi_v3("1739302794");
        //}
        //catch (APIRequestException e)
        //{
        //}
    }

    public static PushPayload PushObject_all_alias_alert(string strUserCode, string strMessage)
    {
        PushPayload pushPayload = new PushPayload();
        pushPayload.platform = Platform.android();
        pushPayload.audience = Audience.s_alias(strUserCode);
        pushPayload.notification = new Notification().setAlert(strMessage);
        pushPayload.ResetOptionsTimeToLive(86400);
        return pushPayload;
    }

    public static PushPayload PushObject_All_All_Alert()
    {
        PushPayload pushPayload = new PushPayload();
        pushPayload.platform = Platform.all();
        pushPayload.audience = Audience.all();
        pushPayload.notification = new Notification().setAlert(ALERT);
        return pushPayload;
    }

    public static PushPayload PushObject_Android_Tag_AlertWithTitle()
    {
        PushPayload pushPayload = new PushPayload();

        pushPayload.platform = Platform.android();
        pushPayload.audience = Audience.s_tag("tag1");
        pushPayload.notification = Notification.android(ALERT, TITLE);

        return pushPayload;
    }

    public static PushPayload PushObject_android_and_ios()
    {
        PushPayload pushPayload = new PushPayload();
        pushPayload.platform = Platform.android_ios();
        var audience = Audience.s_tag("tag1");
        pushPayload.audience = audience;
        var notification = new Notification().setAlert("alert content");
        notification.AndroidNotification = new AndroidNotification().setTitle("Android Title");
        notification.IosNotification = new IosNotification();
        notification.IosNotification.incrBadge(1);
        notification.IosNotification.AddExtra("extra_key", "extra_value");

        pushPayload.notification = notification.Check();

        return pushPayload;
    }

    public static PushPayload PushObject_ios_tagAnd_alertWithExtrasAndMessage()
    {
        PushPayload pushPayload = new PushPayload();
        pushPayload.platform = Platform.android_ios();
        pushPayload.audience = Audience.s_tag_and("tag1", "tag_all");
        var notification = new Notification();
        notification.IosNotification = new IosNotification().setAlert(ALERT).setBadge(5).setSound("happy").AddExtra("from", "JPush");

        pushPayload.notification = notification;
        pushPayload.message = Message.content(MSG_CONTENT);
        return pushPayload;
    }

    public static PushPayload PushObject_ios_audienceMore_messageWithExtras()
    {
        var pushPayload = new PushPayload();
        pushPayload.platform = Platform.android_ios();
        pushPayload.audience = Audience.s_tag("tag1", "tag2");
        pushPayload.message = Message.content(MSG_CONTENT).AddExtras("from", "JPush");
        return pushPayload;
    }
}