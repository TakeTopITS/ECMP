using Aliyun.Acs.Core;
using Aliyun.Acs.Core.Exceptions;
using Aliyun.Acs.Core.Profile;
using Aliyun.Acs.Dysmsapi.Model.V20170525;

using System;

public static class MsgAliYunSMS
{
    //产品名称:云通信短信API产品,开发者无需替换
    private const String product = "Dysmsapi";

    //产品域名,开发者无需替换
    private const String domain = "dysmsapi.aliyuncs.com";

    // TODO 此处需要替换成开发者自己的AK(在阿里云访问控制台寻找)
    public static String accessKeyId = "yourAccessKeyId";

    public static String accessKeySecret = "yourAccessKeySecret";

    public static SendSmsResponse sendSmsToSingle(string strAccessKeyId, string strAccessKeySecret, string strSignName, string strToPhoneNumber, string strMsg)
    {
        IClientProfile profile = DefaultProfile.GetProfile("cn-hangzhou", strAccessKeyId, strAccessKeySecret);
        DefaultProfile.AddEndpoint("cn-hangzhou", "cn-hangzhou", product, domain);
        IAcsClient acsClient = new DefaultAcsClient(profile);
        SendSmsRequest request = new SendSmsRequest();
        SendSmsResponse response = null;
        try
        {
            //必填:待发送手机号。支持以逗号分隔的形式进行批量调用，批量上限为1000个手机号码,批量调用相对于单条调用及时性稍有延迟,验证码类型的短信推荐使用单条调用的方式
            request.PhoneNumbers = strToPhoneNumber;

            //必填:短信签名-可在短信控制台中找到
            request.SignName = strSignName;

            //必填:短信模板-可在短信控制台中找到
            request.TemplateCode = "SMS_1000000";

            //可选:模板中的变量替换JSON串,如模板内容为"亲爱的${name},您的验证码为${code}"时,此处的值为
            request.TemplateParam = "{\"" + strMsg + "\"}";

            //可选:outId为提供给业务方扩展字段,最终在短信回执消息中将此值带回给调用者
            request.OutId = "TakeTopITS";

            //请求失败这里会抛ClientException异常
            response = acsClient.GetAcsResponse(request);
        }
        catch (ServerException e)
        {
            Console.WriteLine(e.ErrorCode);
        }
        catch (ClientException e)
        {
            Console.WriteLine(e.ErrorCode);
        }

        return response;
    }

    public static SendBatchSmsResponse sendSmsToMore(string strAccessKeyId, string strAccessKeySecret)
    {
        IClientProfile profile = DefaultProfile.GetProfile("cn-hangzhou", strAccessKeyId, strAccessKeySecret);
        DefaultProfile.AddEndpoint("cn-hangzhou", "cn-hangzhou", product, domain);

        IAcsClient acsClient = new DefaultAcsClient(profile);
        SendBatchSmsRequest request = new SendBatchSmsRequest();
        //request.Protocol = ProtocolType.HTTPS;
        //request.TimeoutInMilliSeconds = 1;

        SendBatchSmsResponse response = null;
        try
        {
            //必填:待发送手机号。支持JSON格式的批量调用，批量上限为100个手机号码,批量调用相对于单条调用及时性稍有延迟,验证码类型的短信推荐使用单条调用的方式
            request.PhoneNumberJson = "[\"1500000000\",\"1500000001\"]";
            //必填:短信签名-支持不同的号码发送不同的短信签名
            request.SignNameJson = "[\"云通信\",\"云通信\"]";
            //必填:短信模板-可在短信控制台中找到
            request.TemplateCode = "SMS_1000000";
            //必填:模板中的变量替换JSON串,如模板内容为"亲爱的${name},您的验证码为${code}"时,此处的值为
            //友情提示:如果JSON中需要带换行符,请参照标准的JSON协议对换行符的要求,比如短信内容中包含\r\n的情况在JSON中需要表示成\\r\\n,否则会导致JSON在服务端解析失败
            request.TemplateParamJson = "[{\"name\":\"Tom\", \"code\":\"123\"},{\"name\":\"Jack\", \"code\":\"456\"}]";
            //可选-上行短信扩展码(扩展码字段控制在7位或以下，无特殊需求用户请忽略此字段)
            //request.SmsUpExtendCodeJson = "[\"90997\",\"90998\"]";

            //请求失败这里会抛ClientException异常
            response = acsClient.GetAcsResponse(request);
        }
        catch (ServerException e)
        {
            Console.Write(e.ErrorCode);
        }
        catch (ClientException e)
        {
            Console.Write(e.ErrorCode);
            Console.Write(e.Message);
        }
        return response;
    }

    public static SendSmsResponse sendSms(string strAccessKeyId, string strAccessKeySecret)
    {
        IClientProfile profile = DefaultProfile.GetProfile("cn-hangzhou", strAccessKeyId, strAccessKeySecret);
        DefaultProfile.AddEndpoint("cn-hangzhou", "cn-hangzhou", product, domain);
        IAcsClient acsClient = new DefaultAcsClient(profile);
        SendSmsRequest request = new SendSmsRequest();
        SendSmsResponse response = null;
        try
        {
            //必填:待发送手机号。支持以逗号分隔的形式进行批量调用，批量上限为1000个手机号码,批量调用相对于单条调用及时性稍有延迟,验证码类型的短信推荐使用单条调用的方式
            request.PhoneNumbers = "15000000000";
            //必填:短信签名-可在短信控制台中找到
            request.SignName = "云通信";
            //必填:短信模板-可在短信控制台中找到
            request.TemplateCode = "SMS_1000000";
            //可选:模板中的变量替换JSON串,如模板内容为"亲爱的${name},您的验证码为${code}"时,此处的值为
            request.TemplateParam = "{\"customer\":\"123\"}";
            //可选:outId为提供给业务方扩展字段,最终在短信回执消息中将此值带回给调用者
            request.OutId = "yourOutId";
            //请求失败这里会抛ClientException异常
            response = acsClient.GetAcsResponse(request);
        }
        catch (ServerException e)
        {
            Console.WriteLine(e.ErrorCode);
        }
        catch (ClientException e)
        {
            Console.WriteLine(e.ErrorCode);
        }
        return response;
    }

    public static QuerySendDetailsResponse querySendDetails(String bizId, string strAccessKeyId, string strAccessKeySecret)
    {
        //初始化acsClient,暂不支持region化
        IClientProfile profile = DefaultProfile.GetProfile("cn-hangzhou", strAccessKeyId, strAccessKeySecret);
        DefaultProfile.AddEndpoint("cn-hangzhou", "cn-hangzhou", product, domain);
        IAcsClient acsClient = new DefaultAcsClient(profile);
        //组装请求对象
        QuerySendDetailsRequest request = new QuerySendDetailsRequest();
        //必填-号码
        request.PhoneNumber = "15000000000";
        //可选-流水号
        request.BizId = bizId;
        //必填-发送日期 支持30天内记录查询，格式yyyyMMdd
        request.SendDate = DateTime.Now.ToString("yyyyMMdd");
        //必填-页大小
        request.PageSize = 10;
        //必填-当前页码从1开始计数
        request.CurrentPage = 1;

        QuerySendDetailsResponse querySendDetailsResponse = null;
        try
        {
            querySendDetailsResponse = acsClient.GetAcsResponse(request);
        }
        catch (ServerException e)
        {
            Console.WriteLine(e.ErrorCode);
        }
        catch (ClientException e)
        {
            Console.WriteLine(e.ErrorCode);
        }
        return querySendDetailsResponse;
    }

    //static void Main(string[] args)
    //{
    //    SendSmsResponse reponse = sendSms();
    //    Console.Write("短信发送接口返回的结果----------------");
    //    Console.WriteLine("Code=" + reponse.Code);
    //    Console.WriteLine("Message=" + reponse.Message);
    //    Console.WriteLine("RequestId=" + reponse.RequestId);
    //    Console.WriteLine("BizId=" + reponse.BizId);
    //    Console.WriteLine();
    //    Thread.Sleep(3000);

    //    if (reponse.Code != null && reponse.Code == "OK")
    //    {
    //        QuerySendDetailsResponse queryReponse = querySendDetails(reponse.BizId);

    //        Console.WriteLine("短信明细查询接口返回数据----------------");
    //        Console.WriteLine("Code=" + queryReponse.Code);
    //        Console.WriteLine("Message=" + queryReponse.Message);
    //        foreach (QuerySendDetailsResponse.QuerySendDetails_SmsSendDetailDTO smsSendDetailDTO in queryReponse.SmsSendDetailDTOs)
    //        {
    //            Console.WriteLine("Content=" + smsSendDetailDTO.Content);
    //            Console.WriteLine("ErrCode=" + smsSendDetailDTO.ErrCode);
    //            Console.WriteLine("OutId=" + smsSendDetailDTO.OutId);
    //            Console.WriteLine("PhoneNum=" + smsSendDetailDTO.PhoneNum);
    //            Console.WriteLine("ReceiveDate=" + smsSendDetailDTO.ReceiveDate);
    //            Console.WriteLine("SendDate=" + smsSendDetailDTO.SendDate);
    //            Console.WriteLine("SendStatus=" + smsSendDetailDTO.SendStatus);
    //            Console.WriteLine("Template=" + smsSendDetailDTO.TemplateCode);
    //        }
    //    }
    //}
}