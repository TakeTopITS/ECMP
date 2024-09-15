<%@ WebHandler Language="C#" Class="OperateProMatchHandler" %>

using System; using System.Resources;
using System.Web;

using ProjectMgt.BLL;
using ProjectMgt.Model;
using System.Collections;

public class OperateProMatchHandler : IHttpHandler {
    
    public void ProcessRequest (HttpContext context) 
    {
        string strResult = string.Empty;
        try
        {
            string strProductID = string.Empty;
            string strMatchID = string.Empty;
            string strProductPrice = string.Empty;
            string strProMatchID = string.Empty;

            strProMatchID = context.Request.Form["proMatchID"];
            strProductPrice = context.Request.Form["productPrice"];

            if (!string.IsNullOrEmpty(strProMatchID))
            {
                string[] arrProMatch = strProMatchID.Split('|');
                strProductID = arrProMatch[1];
                strMatchID = arrProMatch[0];
                
                int intProductID = 0;
                int.TryParse(strProductID, out intProductID);
                int intMatchID = 0;
                int.TryParse(strMatchID, out intMatchID);
                decimal decimalProductPrice = 0;
                decimal.TryParse(strProductPrice, out decimalProductPrice);

                DWProMatchBLL dWProMatchBLL = new DWProMatchBLL();
                string strDWProMatchHQL = string.Format("from DWProMatch as dWProMatch where ProductID = {0} and MatchID = {1}", intProductID, intMatchID);
                IList lstDWProMatch = dWProMatchBLL.GetAllDWProMatchs(strDWProMatchHQL);
                if (lstDWProMatch != null && lstDWProMatch.Count > 0)
                {
                    //更新最新的价格
                    DWProMatch dWProMatch = (DWProMatch)lstDWProMatch[0];

                    dWProMatch.ProductPrice = decimalProductPrice;

                    dWProMatchBLL.UpdateDWProMatch(dWProMatch, dWProMatch.ID);
                }
                else
                {
                    //增加新的价格
                    DWProMatch dWProMatch = new DWProMatch();

                    dWProMatch.ProductID = intProductID;
                    dWProMatch.MatchID = intMatchID;
                    dWProMatch.ProductPrice = decimalProductPrice;

                    dWProMatchBLL.AddDWProMatch(dWProMatch);
                }

                strResult = "succ";
            }
            else
            {
                strResult = "empty";
            }
        }
        catch (Exception ex)
        {
            strResult = "fail";
        }
        
        context.Response.ContentType = "text/plain";
        context.Response.Write(strResult);
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}