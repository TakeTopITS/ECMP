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
using System.Net;
using System.Xml;
using System.IO;
using System.Text;

using ProjectMgt.Model;
using ProjectMgt.DAL;
using ProjectMgt.BLL;

public partial class TTGetUserPosition : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string strHQL;
        string strUserCode = Session["UserCode"].ToString();
        int i = 0;
    }

    private string GetAddressByBAIDU(string lng, string lat)
    {
        try
        {
            //string url = @"http://api.map.baidu.com/geocoder/v2/?ak=wqBXfIN3HkpM1AHKWujjCdsi&location=" + lat + "," + lng + @"&output=xml&pois=1";
            string url = @"http://api.map.baidu.com/geocoder/v2/?ak=r3oHIq6zgkF3BU9cXlgIQuMu&location=" + lat + "," + lng + @"&output=xml&pois=1";

            WebRequest request = WebRequest.Create(url);
            request.Method = "POST";
            XmlDocument xmlDoc = new XmlDocument();
            string sendData = xmlDoc.InnerXml;
            byte[] byteArray = Encoding.Default.GetBytes(sendData);

            Stream dataStream = request.GetRequestStream();
            dataStream.Write(byteArray, 0, byteArray.Length);
            dataStream.Close();

            WebResponse response = request.GetResponse();
            dataStream = response.GetResponseStream();
            StreamReader reader = new StreamReader(dataStream, System.Text.Encoding.GetEncoding("utf-8"));
            string responseXml = reader.ReadToEnd();

            XmlDocument xml = new XmlDocument();
            xml.LoadXml(responseXml);
            string status = xml.DocumentElement.SelectSingleNode("status").InnerText;
            if (status == "0")
            {

                XmlNodeList nodes = xml.DocumentElement.GetElementsByTagName("formatted_address");
                if (nodes.Count > 0)
                {
                    return nodes[0].InnerText;
                }
                else
                    return "Can not get position information,error code 3";
            }
            else
            {
                return "Can not get position information,error code 1";
            }
        }
        catch (System.Exception ex)
        {
            return "Can not get position information,error code 2";
        }
    }

    private string GetAddressByGOOGLE(string lng, string lat)
    {
        try
        {
            //webclient客户端对象 
            WebClient client = new WebClient();
            string url = "http://maps.google.com/maps/api/geocode/xml?latlng=" + lng + "," + lat + "&language=zh-CN&sensor=false";//请求地址 
            client.Encoding = Encoding.UTF8;//编码格式 
            string responseTest = client.DownloadString(url);
            //下载xml响应数据 
            string address = "";//返回的地址 
            XmlDocument doc = new XmlDocument();
            //创建XML文档对象 
            if (!string.IsNullOrEmpty(responseTest))
            {
                doc.LoadXml(responseTest);//加载xml字符串 
                //查询状态信息 
                string xpath = @"GeocodeResponse/status";
                XmlNode node = doc.SelectSingleNode(xpath);
                string status = node.InnerText.ToString();
                if (status == "OK")
                {
                    //查询详细地址信息 
                    xpath = @"GeocodeResponse/result/formatted_address";
                    node = doc.SelectSingleNode(xpath);
                    address = node.InnerText.ToString();
                    //查询地区信息 
                    XmlNodeList nodeListAll = doc.SelectNodes("GeocodeResponse/result");

                    XmlNode idt = nodeListAll[0];
                    XmlNodeList idts = idt.SelectNodes("address_component[type='sublocality']");
                    //address_component[type='sublocality']表示筛选type='sublocality'的所有相关子节点； 
                    XmlNode idtst = idts[0];

                    string area = idtst.SelectSingleNode("short_name").InnerText;
                    address = address + "," + area;

                    return address;
                }
                else
                {
                    return "Can not get position information,error code 2";
                }
            }
            else
            {
                return "Can not get position information,error code 2";
            }
        }
        catch (System.Exception ex)
        {
            return "Can not get position information,error code 2";
        }
    }



}