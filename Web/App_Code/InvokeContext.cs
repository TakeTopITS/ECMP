using System;
using System.Reflection;
using System.ServiceModel;
using System.ServiceModel.Channels;

/// <summary>
/// 动态调用WCF的工具类库
/// </summary>
public class InvokeContext
{
    //ExecuteMethod<IService>("net.tcp://192.168.0.1:8001/mex", "Test", new object[] { "参数" });

    #region Wcf服务工厂

    public static object ExecuteMethod<T>(string pUrl, string pMethodName, params object[] pParams)
    {
        EndpointAddress address = new EndpointAddress(pUrl);
        Binding bindinginstance = null;
        NetTcpBinding ws = new NetTcpBinding();
        ws.MaxReceivedMessageSize = 20971520;
        ws.Security.Mode = SecurityMode.None;
        bindinginstance = ws;
        using (ChannelFactory<T> channel = new ChannelFactory<T>(bindinginstance, address))
        {
            T instance = channel.CreateChannel();
            using (instance as IDisposable)
            {
                try
                {
                    Type type = typeof(T);
                    MethodInfo mi = type.GetMethod(pMethodName);
                    return mi.Invoke(instance, pParams);
                }
                catch (TimeoutException)
                {
                    (instance as ICommunicationObject).Abort();
                    throw;
                }
                catch (CommunicationException)
                {
                    (instance as ICommunicationObject).Abort();
                    throw;
                }
                catch (Exception vErr)
                {
                    (instance as ICommunicationObject).Abort();
                    throw;
                }
            }
        }
    }

    #endregion Wcf服务工厂
}