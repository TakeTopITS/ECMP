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
using System.Linq;

using System.Xml.XPath;
using System.Xml.Xsl;
using System.Xml;
using System.Text;
using System.Collections.Generic;

using System.IO;

using ProjectMgt.Model;
using ProjectMgt.DAL;
using ProjectMgt.BLL;

public partial class TTWorkFlowDetailDataBackup : System.Web.UI.Page
{
    protected string uri = null;

    protected void Page_Load(object sender, EventArgs e)
    {
        string strID = Request.QueryString["ID"];
        string strStepID;

        string strWLID = Request.QueryString["WLID"];
        if (strWLID == "0")
        {
            return;
        }

        string strWLName, strTemName;
        string strHQL;

        string strUserCode;
        strUserCode = Session["UserCode"].ToString();

        string strXMLFile, strXMLFile1, strXMLFile2, strXMLFileName, strFieldList;
        string strXSNFile;
        string[] strUnVisibleField;
        int i;

        DataSet ds;

        if (Request.QueryString["ID"] != null)
        {
            strHQL = "Select * from T_WorkFlowStepDetailBackup where ID = " + strID;
            ds = ShareClass.GetDataSetFromSql(strHQL, "T_WorkFlowStepDetail");

            strStepID = ds.Tables [0].Rows[0]["StepID"].ToString().Trim();
            strWLID = ds.Tables[0].Rows[0]["WLID"].ToString().Trim();
        }
        else
        {
            strStepID = "0";
        }

        strHQL = "Select * from T_WorkFlowBackup where WLID = " + strWLID;
        ds = ShareClass.GetDataSetFromSql(strHQL, "T_WorkFlow");

        strWLName = ds.Tables[0].Rows[0]["WLName"].ToString().Trim();
        strXMLFile = ds.Tables[0].Rows[0]["XMLFile"].ToString().Trim(); 
        strTemName = ds.Tables[0].Rows[0]["TemName"].ToString().Trim(); 

        if (Page.IsPostBack != true)
        {
            XmlDocument docXml = new XmlDocument();

            try
            {
                strXMLFile = Server.MapPath(strXMLFile);

                docXml.Load(strXMLFile);
            }
            catch
            {
                Response.Write("------错误，此工作流数据文件不存在，不能审批，请检查！");
                return;
            }

            XmlNodeList xnl;
            XmlDocument document = new XmlDocument();

            document.PreserveWhitespace = true;
            document.Load(strXMLFile);

            XmlNamespaceManager nsmgr = new XmlNamespaceManager(document.NameTable);

            XPathNavigator ipFormNav = document.CreateNavigator();
            ipFormNav.MoveToFollowing(XPathNodeType.Element);

            foreach (KeyValuePair<string, string> ns in ipFormNav.GetNamespacesInScope(XmlNamespaceScope.All))
            {
                if (ns.Key == String.Empty)
                {
                    nsmgr.AddNamespace("def", ns.Value);
                }
                else
                {
                    nsmgr.AddNamespace(ns.Key, ns.Value);
                }
            }

            if (strID == null)
            {
                strXSNFile = ds.Tables[0].Rows[0]["XSNFile"].ToString().Trim(); 

                if (strXSNFile == null)
                {
                    strXSNFile = "";
                }

                if (strXSNFile != "")
                {
                    strXSNFile = ds.Tables[0].Rows[0]["XSNFile"].ToString().Trim(); ;
                    strXSNFile = Server.MapPath(strXSNFile);

                    Response.Redirect("TTWorkFlowInfoPathDataView.aspx?XSNFile=" + strXSNFile + "&XMLFile=" + strXMLFile + "&WLID=" + strWLID + "&StepID=" + strStepID + "&ID=0");
                }
                else
                {
                    Response.Redirect("TTWorkFlowCommonDataView.aspx?XMLFile=" + strXMLFile + "&TemName=" + strTemName + "&WLID=" + strWLID + "&StepID=" + strStepID);
                }
            }
            else
            {
                strFieldList = GetFieldList(strID);

                try
                {
                    if (strFieldList != "")
                    {
                        strUnVisibleField = strFieldList.Split(",".ToCharArray());

                        for (i = 0; i < strUnVisibleField.Length; i++)
                        {
                            if (strUnVisibleField[i] != "")
                            {
                                xnl = docXml.SelectNodes(strUnVisibleField[i], nsmgr);

                                foreach (XmlNode xnd in xnl)
                                {
                                    xnd.InnerText = "";
                                }
                            }
                        }

                        strXMLFileName = DateTime.Now.ToString("yyyyMMddHHMMssff") + ".xml";
                        strXMLFile1 = "Doc\\" + "XML" + "\\" + strXMLFileName;
                        strXMLFile2 = Server.MapPath(strXMLFile1);
                        docXml.Save(strXMLFile2);
                    }
                    else
                    {
                        strXMLFile2 = strXMLFile;
                    }

                    strXSNFile = ds.Tables[0].Rows[0]["XSNFile"].ToString().Trim();

                    if (strXSNFile == null)
                    {
                        strXSNFile = "";
                    }

                    if (strXSNFile != "")
                    {
                        strXSNFile = ds.Tables[0].Rows[0]["XSNFile"].ToString().Trim();
                        strXSNFile = Server.MapPath(strXSNFile);

                        Response.Redirect("TTWorkFlowInfoPathDataView.aspx?XSNFile=" + strXSNFile + "&XMLFile=" + strXMLFile2 + "&WLID=" + strWLID + "&StepID=" + strStepID + "&ID=" + strID);
                    }
                    else
                    {
                        Response.Redirect("TTWorkFlowCommonDataView.aspx?XMLFile=" + strXMLFile2 + "&TemName=" + strTemName + "&WLID=" + strWLID + "&StepID=" + strStepID);
                    }
                }
                catch
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "", "<script>alert('" + Resources.lang.ZZDKSPSJSBKNSXYGZLMBDBKSYDBDSCWJC + "');</script>");
                }
            }
        }
    }

    protected string IsAllowFullEdit(string strID)
    {
        string strHQL;
        IList lst;

        string strAllowFullEdit;

        strHQL = "Select * from T_WorkFlowStepDetailBackup where ID = " + strID;
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_WorkFlowStepDetail");

        if (ds.Tables [0].Rows.Count > 0)
        {
            strAllowFullEdit = ds.Tables [0].Rows[0]["AllowFullEdit"].ToString ().Trim();

            if (strAllowFullEdit == null)
            {
                strAllowFullEdit = "NO";
            }

            return strAllowFullEdit;
        }
        else
        {
            return "NO";
        }
    }

    protected string GetFieldList(string strID)
    {
        string strHQL, strFieldList;

        strHQL = "Select * from T_WorkFlowStepDetailBackup where ID = " + strID;
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_WorkFlowStepDetail");
        strFieldList = ds.Tables[0].Rows[0]["FieldList"].ToString().Trim();

        if (strFieldList == null)
        {
            strFieldList = "";
        }

        if (strFieldList != "")
        {
            strFieldList = ds.Tables[0].Rows[0]["FieldList"].ToString().Trim();
        }

        return strFieldList;
    }

    private void IterateXmlNodes(XmlElement xmlfatherElement)
    {
        XmlNodeList childList = xmlfatherElement.ChildNodes;
        foreach (XmlElement child in childList)
        {

            // childNode.Text =  child.Attributes[0].Value;

            IterateXmlNodes(child);
        }
    }
}
