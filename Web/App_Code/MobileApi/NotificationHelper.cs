using ProjectMgt.BLL;
using ProjectMgt.Model;

using PushSharp;
using PushSharp.Apple;
using PushSharp.Core;

using System;
using System.Collections;
using System.Data;
using System.IO;

/// <summary>
/// Summary description for NotificationHelper
/// </summary>
public class NotificationHelper
{
    /// <summary>
    /// 收集iphone设备推送token信息
    /// </summary>
    public static void CollectNotificationInfo(string userCode, String deviceToken, String deviceType)
    {
        if (!String.IsNullOrWhiteSpace(deviceToken))
        {
            DeviceNotificationInfoBLL logic = new DeviceNotificationInfoBLL();
            DeviceNotificationInfo entity = new DeviceNotificationInfo();
            entity.UserCode = userCode;
            entity.DeviceToken = deviceToken;
            entity.DeviceType = Convert.ToInt32(deviceType);

            String hql = String.Format("from DeviceNotificationInfo where UserCode = '{0}' and DeviceType={1}", entity.UserCode, entity.DeviceType);
            IList oldDatas = logic.GetAllDeviceNotificationInfos(hql);

            if (oldDatas != null)
            {
                foreach (DeviceNotificationInfo oldItem in oldDatas)
                {
                    logic.DeleteDeviceNotificationInfo(oldItem);
                }
            }

            logic.AddDeviceNotificationInfo(entity);
        }
    }

    public NotificationHelper()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    private static byte[] _appleCert = null;

    public static void ApplePush(string userCode, string msg, int count)
    {
        ////因证书原因，暂时不可以用
        //return;

        //DeviceType = 0 => ios
        String strHQL = string.Format(@"select DeviceToken from T_DeviceNotificationInfo
                            where UserCode='{0}' and DeviceType={1}", userCode, 0);
        DataTable dtDeviceNotificationInfo = ShareClass.GetDataSetFromSql(strHQL, "T_DeviceNotificationInfo").Tables[0];
        DataView dvDeviceNotificationInfo = new DataView(dtDeviceNotificationInfo);
        string strDeviceToken = null;
        foreach (DataRowView row in dvDeviceNotificationInfo)
        {
            strDeviceToken = ShareClass.ObjectToString(row["DeviceToken"]);
        }

        if (string.IsNullOrWhiteSpace(strDeviceToken))
        {
            return;
        }

        //Create our push services broker
        var push = new PushBroker();

        //Wire up the events for all the services that the broker registers
        push.OnNotificationSent += NotificationSent;
        push.OnChannelException += ChannelException;
        push.OnServiceException += ServiceException;
        push.OnNotificationFailed += NotificationFailed;
        push.OnDeviceSubscriptionExpired += DeviceSubscriptionExpired;
        push.OnDeviceSubscriptionChanged += DeviceSubscriptionChanged;
        push.OnChannelCreated += ChannelCreated;
        push.OnChannelDestroyed += ChannelDestroyed;

        //-------------------------
        // APPLE NOTIFICATIONS
        //-------------------------
        //Configure and start Apple APNS
        // IMPORTANT: Make sure you use the right Push certificate.  Apple allows you to generate one for connecting to Sandbox,
        //   and one for connecting to Production.  You must use the right one, to match the provisioning profile you build your
        //   app with!
        //var appleCert = File.ReadAllBytes(Path.Combine(AppDomain.CurrentDomain.BaseDirectory, "../../../Resources/PushSharp.Apns.Sandbox.p12"));
        //var appleCert = File.ReadAllBytes(Path.Combine(AppDomain.CurrentDomain.BaseDirectory, "../../../Resources/PushSharp.Apns.Production.p12"));

        if (_appleCert == null)
        {
            _appleCert = File.ReadAllBytes(Path.Combine(AppDomain.CurrentDomain.BaseDirectory, "./Resources/PushCertificates.p12"));
        }

        //IMPORTANT: If you are using a Development provisioning Profile, you must use the Sandbox push notification server
        //  (so you would leave the first arg in the ctor of ApplePushChannelSettings as 'false')
        //  If you are using an AdHoc or AppStore provisioning profile, you must use the Production push notification server
        //  (so you would change the first arg in the ctor of ApplePushChannelSettings to 'true')
        push.RegisterAppleService(new ApplePushChannelSettings(_appleCert, "12345678")); //Extension method
                                                                                         //Fluent construction of an iOS notification
                                                                                         //IMPORTANT: For iOS you MUST MUST MUST use your own DeviceToken here that gets generated within your iOS app itself when the Application Delegate
                                                                                         //  for registered for remote notifications is called, and the device token is passed back to you

        //push.QueueNotification(new AppleNotification()
        //    //.ForDeviceToken("50ee63e65cfeaa5d2afab5fe3c57ca39f0660a0441166b8ae78ec9a797d0beeb")
        //                           .ForDeviceToken("790224ab1b3287b81aa417a4dcbc3b95e1d5a5bcbde01624c29abb769c506755")
        //                           .WithAlert("...Hello World...!")
        //                           .WithBadge(7)
        //                           .WithSound("sound.caf"));

        push.QueueNotification(new AppleNotification()
                           .ForDeviceToken(strDeviceToken.Trim())
                           .WithAlert(msg.Trim())
                           .WithBadge(count)
                           .WithSound("sound.caf"));

        //Console.WriteLine("Waiting for Queue to Finish...");

        //Stop and wait for the queues to drains
        push.StopAllServices();

        //Console.WriteLine("Queue Finished, press return to exit...");
        //Console.ReadLine();
    }

    public static void ApplePushToOne(string strUserCode, string strNofiInfo, int total)
    {
        Action action = new Action(delegate ()
        {
            try
            {
                //信息推送接口
                NotificationHelper.ApplePush(strUserCode, strNofiInfo, total);
            }
            catch (Exception ex)
            {
            }
        });
        System.Threading.Tasks.Task.Factory.StartNew(action);
    }

    private static void DeviceSubscriptionChanged(object sender, string oldSubscriptionId, string newSubscriptionId, INotification notification)
    {
        //Currently this event will only ever happen for Android GCM
        //Console.WriteLine("Device Registration Changed:  Old-> " + oldSubscriptionId + "  New-> " + newSubscriptionId + " -> " + notification);
    }

    private static void NotificationSent(object sender, INotification notification)
    {
        //Console.WriteLine("Sent: " + sender + " -> " + notification);
    }

    private static void NotificationFailed(object sender, INotification notification, Exception notificationFailureException)
    {
        //Console.WriteLine("Failure: " + sender + " -> " + notificationFailureException.Message + " -> " + notification);
    }

    private static void ChannelException(object sender, IPushChannel channel, Exception exception)
    {
        //Console.WriteLine("Channel Exception: " + sender + " -> " + exception);
    }

    private static void ServiceException(object sender, Exception exception)
    {
        //Console.WriteLine("Channel Exception: " + sender + " -> " + exception);
    }

    private static void DeviceSubscriptionExpired(object sender, string expiredDeviceSubscriptionId, DateTime timestamp, INotification notification)
    {
        //Console.WriteLine("Device Subscription Expired: " + sender + " -> " + expiredDeviceSubscriptionId);
    }

    private static void ChannelDestroyed(object sender)
    {
        //Console.WriteLine("Channel Destroyed for: " + sender);
    }

    private static void ChannelCreated(object sender, IPushChannel pushChannel)
    {
        //Console.WriteLine("Channel Created for: " + sender);
    }
}