using Newtonsoft.Json;

using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Xml;

/// <summary>
///     Summary description for XMLDBWorker
/// </summary>
public static class XmlDbWorker
{
    #region Query_Templates

    private const string DeleteFormDataById = @"DELETE FROM T_WorkFlowFormData
                                                     WHERE WLID = {0}";

    private const string InsertFormData = @"INSERT INTO T_WorkFlowFormData
                                                       (WLID
                                                       ,TemplateName
                                                       ,FieldName
                                                       ,ParentXPath
                                                       ,FieldXPath
                                                       ,FieldValue
                                                       ,FieldAttributes)
                                                 VALUES
                                                       ({0}
                                                       ,'{1}'
                                                       ,'{2}'
                                                       ,'{3}'
                                                       ,'{4}'
                                                       ,'{5}'
                                                       ,'{6}')";

    private const string SearchQueryBody = @"
                                            WITH MatchedWorkflowIDs (WLID)
                                            AS(
	                                            {0}
                                            ),
                                            CountedWorkflowIDs (WLID, Hits)
                                            AS(
	                                            SELECT WLID, COUNT(WLID) AS Hits
	                                            FROM MatchedWorkflowIDs
	                                            GROUP BY WLID
                                            )
                                            SELECT WLID
                                            FROM CountedWorkflowIDs
                                            WHERE Hits = {1}
                                            ";

    private const string FieldMatch = @"
                                        SELECT DISTINCT WLID
	                                    FROM T_WorkFlowFormData
	                                    WHERE TemplateName = '{0}' AND FieldName = '{1}' AND FieldValue LIKE '%{2}%'
                                       ";

    private const string QueryFieldsByWorkflowId = @"SELECT *
                                                          FROM T_WorkFlowFormData
                                                          WHERE WLID = {0}
                                                          ORDER BY ID";

    #endregion Query_Templates

    #region COMMON_DB_FUNC

    public static bool ClearFormDataById(int workflowId)
    {
        return HandleException(() => ClearFormDataByIdInternal(workflowId));
    }

    #endregion COMMON_DB_FUNC

    #region Public_Interface

    public static bool AddFormFromXml(string filePath, int workflowId, string templateName)
    {
        return HandleException(() => AddFormFromXmlInternal(filePath, workflowId, templateName));
    }

    public static List<int> Search(string templateName, List<WorkflowFormField> searchQueryItems)
    {
        if (searchQueryItems.Count == 0)
        {
            return new List<int>();
        }

        var query = GetSearchQuery(templateName, searchQueryItems);
        var result = ShareClass.GetDataSetFromSql(query, templateName);
        return result.Tables[templateName].AsEnumerable().Select(dataRow => dataRow.Field<int>("WLID")).ToList();
    }

    public static bool UpdateXmlFromDb(string filePath, int workflowId)
    {
        return HandleException(() => UpdateXmlFromDbInternal(filePath, workflowId));
    }

    #endregion Public_Interface

    #region Internal_Methods

    private static void ClearFormDataByIdInternal(int workflowId)
    {
        var query = string.Format(DeleteFormDataById, workflowId);

        ShareClass.RunSqlCommand(query);
    }

    private static void UpdateXmlFromDbInternal(string filePath, int workflowId)
    {
        var formFields = GetFormFieldsByWorkflowIdWithRelationship(workflowId);
        var xmlFields = GetAllXmlNodes(filePath);

        XmlNamespaceManager nsmgr;
        var document = LoadXmlWithNamespace(filePath, out nsmgr);

        var fieldsToBeRemoved = xmlFields.Where(f => formFields.Find(i => i.XPath == f.XPath) == null).ToList();

        foreach (var field in fieldsToBeRemoved)
        {
            var node = document.SelectSingleNode(field.XPath, nsmgr);
            var parentNode = document.SelectSingleNode(field.ParentXPath, nsmgr);
            if (node != null && parentNode != null) parentNode.RemoveChild(node);
        }

        xmlFields = GetAllXmlNodes(document);

        var fieldsToBeUpdated = formFields.Where(i => xmlFields.Where(f => f.XPath == i.XPath && (f.Value != i.Value || f.Attributes != i.Attributes)).ToList().Count == 1)
            .ToList();

        foreach (var field in fieldsToBeUpdated)
        {
            var node = document.SelectSingleNode(field.XPath, nsmgr) as XmlElement;
            if (node != null)
            {
                node.InnerText = field.Value;
                node.Attributes.RemoveAll();
                SetNodeAttrs(field, nsmgr, document, node);
            }
        }

        var fieldsToBeAdded = formFields.Where(f => xmlFields.Find(i => i.XPath == f.XPath) == null).ToList();

        foreach (var field in fieldsToBeAdded)
        {
            var parentNode = document.SelectSingleNode(field.ParentXPath, nsmgr);
            if (parentNode == null)
            {
                throw new Exception("Bad form structure.");
            }

            string prefix;
            string localName;

            SplitName(field.FieldName, out prefix, out localName);

            var newNode = document.CreateElement(prefix, localName, document.DocumentElement.NamespaceURI);

            newNode.InnerText = field.Value;
            if (!string.IsNullOrEmpty(field.Attributes))
            {
                SetNodeAttrs(field, nsmgr, document, newNode);
            }

            if (field.Previous != null)
            {
                var previousNode = document.SelectSingleNode(field.Previous.XPath, nsmgr);

                parentNode.InsertAfter(newNode, previousNode);
            }
            else if (field.Next != null)
            {
                var nextNode = document.SelectSingleNode(field.Next.XPath, nsmgr);
                parentNode.InsertBefore(newNode, nextNode);
            }
            else
            {
                parentNode.AppendChild(newNode);
            }
        }

        foreach (XmlElement el in document.SelectNodes("descendant::*[not(*) and not(normalize-space())]"))
        {
            if (el.HasAttribute("xml:space") && string.Equals(el.Attributes["xml:space"].Value, "preserve", StringComparison.OrdinalIgnoreCase))
            {
                continue;
            }

            el.IsEmpty = true;
        }

        document.Save(filePath);
    }

    private static void SetNodeAttrs(WorkflowFormField field, XmlNamespaceManager nsmgr, XmlDocument document,
        XmlElement node)
    {
        var attrs = JsonConvert.DeserializeObject<Dictionary<string, string>>(field.Attributes);
        var nsDefs = attrs.Keys.Where(k => k.StartsWith("xmlns:")).ToList();
        foreach (var nsDef in nsDefs)
        {
            var nsDefParts = nsDef.Split(':');
            if (!nsmgr.HasNamespace(nsDefParts[1]))
            {
                nsmgr.AddNamespace(nsDefParts[1], attrs[nsDef]);
            }
        }
        foreach (var attrsKey in attrs.Keys)
        {
            var keyNameParts = attrsKey.Split(':');
            if (keyNameParts.Length == 2 && !nsDefs.Contains(attrsKey))
            {
                var uri = nsmgr.LookupNamespace(keyNameParts[0]);
                var attr = document.CreateAttribute(keyNameParts[0], keyNameParts[1], uri);
                attr.Value = attrs[attrsKey];
                node.Attributes.SetNamedItem(attr);
            }
            else
            {
                node.SetAttribute(attrsKey, attrs[attrsKey]);
            }
        }
    }

    private static XmlDocument LoadXmlWithNamespace(string filePath, out XmlNamespaceManager nsmgr)
    {
        var document = new XmlDocument();
        document.PreserveWhitespace = true;

        document.Load(filePath);

        nsmgr = new XmlNamespaceManager(document.NameTable);

        if (document.DocumentElement.Attributes != null)
        {
            foreach (XmlAttribute attribute in document.DocumentElement.Attributes)
            {
                if (!attribute.Name.StartsWith("xmlns:")) continue;
                var ns = attribute.Name.Split(':')[1];
                nsmgr.AddNamespace(ns, attribute.Value);
            }
        }
        return document;
    }

    private static List<WorkflowFormField> GetFormFieldsByWorkflowIdWithRelationship(int workflowId)
    {
        var formFields = GetFormFieldsByWorkflowId(workflowId);
        var relationshipCache = new Dictionary<string, List<WorkflowFormField>>();
        for (var index = 0; index < formFields.Count; index++)
        {
            var current = formFields[index];
            if (string.IsNullOrEmpty(current.ParentXPath)) continue;

            if (!relationshipCache.ContainsKey(current.ParentXPath))
            {
                relationshipCache[current.ParentXPath] = formFields.Where(f => f.ParentXPath == current.ParentXPath).ToList();
            }
            var neighbors = relationshipCache[current.ParentXPath];
            var selfIndex = neighbors.FindIndex(f => f.XPath == current.XPath);
            current.Previous = selfIndex == 0 ? null : neighbors[selfIndex - 1];
            current.Next = selfIndex == neighbors.Count - 1 ? null : neighbors[selfIndex + 1];
        }
        return formFields;
    }

    private static void AddFormFromXmlInternal(string filePath, int workflowId, string templateName)
    {
        ClearFormDataById(workflowId);

        var allNodes = GetAllXmlNodes(filePath);
        foreach (var node in allNodes)
            InsertFormDataField(workflowId, templateName, node.FieldName, node.ParentXPath, node.XPath, node.Value, node.Attributes);
    }

    private static bool HandleException(Action action)
    {
        var successed = true;
        try
        {
            action();
        }
        catch (Exception ex)
        {
            successed = false;
        }
        return successed;
    }

    private static void InsertFormDataField(int workflowId, string templateName, string fieldName, string parentXPath,
        string xPath, string value, string attrs)
    {
        var query = string.Format(InsertFormData, workflowId, templateName, fieldName, parentXPath, xPath, value, attrs);

        ShareClass.RunSqlCommand(query);
    }

    private static List<WorkflowFormField> GetFormFieldsByWorkflowId(int workflowId)
    {
        var name = "WorkflowFields";
        var query = string.Format(QueryFieldsByWorkflowId, workflowId);
        var result = ShareClass.GetDataSetFromSql(query, name);
        return FromDataSetToList(result.Tables[name]);
    }

    private static string GetSearchQuery(string templateName, List<WorkflowFormField> queryItems)
    {
        var fieldMatchQuery = string.Join("UNION ALL\n", queryItems.Select(item => string.Format(FieldMatch, templateName, item.FieldName, item.Value)));
        return string.Format(SearchQueryBody, fieldMatchQuery, queryItems.Count);
    }

    private static List<WorkflowFormField> FromDataSetToList(DataTable dt)
    {
        return dt.AsEnumerable()
            .Select(dataRow => new WorkflowFormField
            {
                WLID = dataRow.Field<int>("WLID"),
                FieldName = dataRow.Field<string>("FieldName"),
                Value = dataRow.Field<string>("FieldValue"),
                ParentXPath = dataRow.Field<string>("ParentXPath"),
                XPath = dataRow.Field<string>("FieldXPath"),
                Attributes = dataRow.Field<string>("FieldAttributes")
            }).ToList();
    }

    #endregion Internal_Methods

    #region XML_Methods

    private static List<WorkflowFormField> GetAllXmlNodes(string filePath)
    {
        var document = new XmlDocument();
        document.Load(filePath);
        return GetAllXmlNodes(document);
    }

    private static List<WorkflowFormField> GetAllXmlNodes(XmlDocument document)
    {
        var allNodes = document.SelectNodes("//*");

        var list = new List<WorkflowFormField>();
        foreach (XmlElement node in allNodes)
        {
            var xpath = FindXPath(node);
            var parentXPath = FindXPath(node.ParentNode);
            var attrs = AttributesToJson(node);
            list.Add(new WorkflowFormField
            {
                FieldName = node.Name,
                ParentXPath = parentXPath,
                XPath = xpath,
                Value = node.ChildNodes.Count == 1 && node.FirstChild is XmlText ? node.InnerText : string.Empty,
                Attributes = attrs
            });
        }
        return list;
    }

    private static string AttributesToJson(XmlElement node)
    {
        var dictAttr = new Dictionary<string, string>();
        for (var i = 0; i < node.Attributes.Count; i++)
        {
            dictAttr[node.Attributes[i].Name] = node.Attributes[i].Value;
        }
        var attrs = JsonConvert.SerializeObject(dictAttr);
        return attrs;
    }

    private static string FindXPath(XmlNode node)
    {
        var builder = new StringBuilder();
        while (node != null)
            switch (node.NodeType)
            {
                case XmlNodeType.Attribute:
                    builder.Insert(0, "/@" + node.Name);
                    node = ((XmlAttribute)node).OwnerElement;
                    break;

                case XmlNodeType.Element:
                    var index = FindElementIndex((XmlElement)node);
                    builder.Insert(0, "/" + node.Name + "[" + index + "]");
                    node = node.ParentNode;
                    break;

                case XmlNodeType.Document:
                    return builder.ToString();

                default:
                    throw new ArgumentException("Only elements and attributes are supported");
            }
        throw new ArgumentException("Node was not in a document");
    }

    private static int FindElementIndex(XmlElement element)
    {
        var parentNode = element.ParentNode;
        if (parentNode is XmlDocument)
            return 1;
        var parent = (XmlElement)parentNode;
        var index = 1;
        foreach (XmlNode candidate in parent.ChildNodes)
            if (candidate is XmlElement && candidate.Name == element.Name)
            {
                if (candidate == element)
                    return index;
                index++;
            }
        throw new ArgumentException("Couldn't find element within parent");
    }

    private static void SplitName(string name, out string prefix, out string localName)
    {
        int length = name.IndexOf(':');
        if (-1 == length || length == 0 || name.Length - 1 == length)
        {
            prefix = string.Empty;
            localName = name;
        }
        else
        {
            prefix = name.Substring(0, length);
            localName = name.Substring(length + 1);
        }
    }

    #endregion XML_Methods
}

public class WorkflowFormField
{
    public int WLID { get; set; }
    public string FieldName { get; set; }
    public string Value { get; set; }
    public string ParentXPath { get; set; }
    public string XPath { get; set; }
    public string Attributes { get; set; }
    public WorkflowFormField Previous { get; set; }
    public WorkflowFormField Next { get; set; }
}