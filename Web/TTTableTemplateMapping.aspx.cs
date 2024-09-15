using System;
using System.Resources;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;

using ProjectMgt.BLL;
using ProjectMgt.Model;

public partial class TTTableTemplateMapping : System.Web.UI.Page
{
    public IList Lst_WFTemplate
    {
        get;
        set;
    }
    public IList Lst_Table
    {
        get;
        set;
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        string strHQL;
        IList lst;

        string strUserCode, strLangCode;

        strLangCode = Session["LangCode"].ToString();
        strUserCode = Session["UserCode"].ToString();

        ProjectMemberBLL projectMemberBLL = new ProjectMemberBLL();
        Label1.Text = ShareClass.GetPageTitle(this.GetType().BaseType.Name + ".aspx"); bool blVisible = TakeTopSecurity.TakeTopLicense.GetAuthobility(this.GetType().BaseType.Name + ".aspx", strUserCode);  //Label1.Text = ShareClass.GetPageTitle(this.GetType().BaseType.Name + ".aspx"); bool blVisible = TakeTopSecurity.TakeTopLicense.GetAuthobility(this.GetType().BaseType.Name + ".aspx", "表单节点映射表字段", strUserCode);
        if (blVisible == false)
        {
            Response.Redirect("TTDisplayErrors.aspx");
            return;
        }

        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "clickA", "aHandler();", true); 
        if (!IsPostBack)
        {
            HF_SelectThree.Value = "";
            HF_SelectTwo.Value = "";

            DL_WLType.Items.Insert(0, new ListItem("--Select--", "0"));
            DL_WLType_SelectedIndexChanged(null, null);

            LoadTableNameMappingList();

            TV_WFTemplate.Attributes.Add("onclick", "javascript:return false");
            TV_Table.Attributes.Add("onclick", "javascript:return false");
        }

        //LoadAutoPostBack();
    }

    /// <summary>
    ///  类型
    /// </summary>
    protected void DL_WLType_SelectedIndexChanged(object sender, EventArgs e)
    {
        string strHQL, strWLType;

        strWLType = DL_WLType.SelectedValue.Trim();
        if (string.IsNullOrEmpty(strWLType))
        {
            return;
        }
        strHQL = "Select TemName,XSNFile From T_WorkFlowTemplate Where type = " + "'" + strWLType + "'" + " and Authority = '所有'";

        strHQL += " Order by CreateTime DESC";
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_WorkFlowTemplate");
        DL_WFTemplate.DataSource = ds;
        DL_WFTemplate.DataBind();


        DL_WFTemplate_SelectedIndexChanged(null, null);
    }


    /// <summary>
    ///  流程模板
    /// </summary>
    protected void DL_WFTemplate_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (!string.IsNullOrEmpty(DL_WFTemplate.SelectedValue))
        {
            string strXMLText = string.Empty;
            string sqlWorkFlow = string.Empty;
            sqlWorkFlow = string.Format("select WFXMLData from T_WorkFlow where TemName = '{0}' order by CreateTime desc limit 1", DL_WFTemplate.SelectedItem.Text);
            DataTable dt = ShareClass.GetDataSetFromSql(sqlWorkFlow, "T_XML").Tables[0];
            foreach (DataRow dr in dt.Rows)
            {
                strXMLText = dr["WFXMLData"].ToString();
            }
            TV_WFTemplate.Nodes.Clear();
            if (!string.IsNullOrEmpty(strXMLText))
            {
                AddTree(TV_WFTemplate, strXMLText, "Template");
                TV_WFTemplate.ExpandAll();
            }
            LoadExistMappingList();

            //把选中的去掉
            for (int i = 0; i < selectTableName.Items.Count; i++)
            {
                selectTableName.Items[i].Selected = false;
            }
        }
        else
        {
            TV_WFTemplate.Nodes.Clear();
            TV_Table.Nodes.Clear();
            //把选中的去掉
            for (int i = 0; i < selectTableName.Items.Count; i++)
            {
                selectTableName.Items[i].Selected = false;
            }
        }
        DL_Table_SelectedIndexChanged(null, null);
    }

    /// <summary>
    ///  已数据交互配对表
    /// </summary>
    protected void DL_Table_SelectedIndexChanged(object sender, EventArgs e)
    {
        selectTwo.Items.Clear();
        selectThree.Items.Clear();
        if (!string.IsNullOrEmpty(DL_WFTemplate.SelectedValue) && !string.IsNullOrEmpty(DL_Table.SelectedValue))
        {
            string sqlTableName = string.Empty;
            sqlTableName = string.Format("select * from {0} where 1= 2", DL_Table.SelectedValue);
            DataSet dsTableName = ShareClass.GetDataSetFromSql(sqlTableName, "T_XML");
            TV_Table.Nodes.Clear();
            if (dsTableName.Tables[0] != null)
            {
                foreach (DataColumn dc in dsTableName.Tables[0].Columns)
                {
                    TreeNode Node = new TreeNode();
                    Node.Text = "<label onclick=\"AddTableItem('" + dc.ColumnName + "','" + dc.ColumnName + "')\" />" + dc.ColumnName + "</label>";
                    TV_Table.Nodes.Add(Node);
                }
                TV_Table.ExpandAll();
            }

            //把流程模板的列，表格列显示出来
            string strTableTemplateHQL = string.Empty;
            TableTemplateMappingBLL tableTemplateMappingBLL = new TableTemplateMappingBLL();
            strTableTemplateHQL = string.Format("from TableTemplateMapping as tableTemplateMapping where TableName = '{0}' and WFTemplateName = '{1}'", DL_Table.SelectedValue, DL_WFTemplate.SelectedItem.Text);
            IList lst_TableTemplateName = tableTemplateMappingBLL.GetAllTableTemplateMappings(strTableTemplateHQL);

            if (lst_TableTemplateName != null && lst_TableTemplateName.Count > 0)
            {
                for (int i = 0; i < lst_TableTemplateName.Count; i++)
                {
                    TableTemplateMapping tableTemplateMapping = (TableTemplateMapping)lst_TableTemplateName[i];
                    string strTemplateField = tableTemplateMapping.WFTemplateXMLNodeName.Substring(tableTemplateMapping.WFTemplateXMLNodeName.LastIndexOf('/') + 1);
                    selectTwo.Items.Add(new ListItem(strTemplateField, tableTemplateMapping.WFTemplateXMLNodeName));
                    selectThree.Items.Add(new ListItem(tableTemplateMapping.TableXMLNodeName, tableTemplateMapping.TableXMLNodeName));

                }
                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "HelloWorld", "GetTwoScrollcode();GetThreeScrollcode();", true);
            }
        }
        else
        {
            DL_Table.Items.Clear();
            TV_Table.Nodes.Clear();
        }
    }

    /// <summary>
    ///  数据交互配对表
    /// </summary>
    protected void DL_TableName_SelectedIndexChanged(object sender, EventArgs e)
    {
        string strXMLText = string.Empty;
        if (!string.IsNullOrEmpty(selectTableName.SelectedValue))
        {
            string sqlTableName = string.Empty;
            sqlTableName = string.Format("select * from {0} where 1= 2", selectTableName.SelectedValue);
            DataSet dsTableName = ShareClass.GetDataSetFromSql(sqlTableName, "T_XML");
            TV_Table.Nodes.Clear();
            if (dsTableName.Tables[0] != null)
            {
                foreach (DataColumn dc in dsTableName.Tables[0].Columns)
                {
                    TreeNode Node = new TreeNode();
                    Node.Text = "<label onclick=\"AddTableItem('" + dc.ColumnName + "','" + dc.ColumnName + "')\" />" + dc.ColumnName + "</label>";
                    TV_Table.Nodes.Add(Node);
                }
                TV_Table.ExpandAll();
            }
            //ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "HelloWorld", "AddExistTableItem('" + selectTableName.SelectedValue + "','" + selectTableName.SelectedValue + "')", true);  
            ListItem liTable = new ListItem(selectTableName.SelectedValue, selectTableName.SelectedValue);
            if (!DL_Table.Items.Contains(liTable))
            {
                DL_Table.Items.Add(liTable);
                DL_Table.SelectedIndex = DL_Table.Items.Count - 1;
                DL_Table_SelectedIndexChanged(null, null);
            }
            else
            {
                DL_Table.SelectedValue = selectTableName.SelectedValue;
                DL_Table_SelectedIndexChanged(null, null);
            }
        }
    }

    /// <summary>
    ///  加载数据交互配对表
    /// </summary>
    private void LoadTableNameMappingList()
    {
        string strTableHQL = string.Empty;
        strTableHQL = "from TableNameMapping as tableNameMapping";
        TableNameMappingBLL tableNameMappingBLL = new TableNameMappingBLL();
        IList lst_TableName = tableNameMappingBLL.GetAllTableNameMappings(strTableHQL);

        selectTableName.DataSource = lst_TableName;
        selectTableName.DataBind();
        DL_TableName_SelectedIndexChanged(null, null);
    }

    /// <summary>
    /// 加载已数据交互配对表
    /// </summary>
    private void LoadExistMappingList()
    {
        if (!string.IsNullOrEmpty(DL_WFTemplate.SelectedValue))
        {
            string strExistTable = "select distinct TableName from T_TableTemplateMapping where WFTemplateName = '" + DL_WFTemplate.SelectedItem.Text + "'";
            DataTable dtExistTable = ShareClass.GetDataSetFromSql(strExistTable, "T_TableTemplateMapping").Tables[0];

            DL_Table.DataSource = dtExistTable;
            DL_Table.DataBind();
        }
    }

    private void LoadAutoPostBack()
    {
        string strHFSelectTwo = HF_SelectTwo.Value;
        string strHFSelectThree = HF_SelectThree.Value;
        if (!string.IsNullOrEmpty(strHFSelectTwo))
        {
            selectTwo.Items.Clear();
            string[] arrHFSelectTwo = strHFSelectTwo.Split(',');
            for (int i = 0; i < arrHFSelectTwo.Length; i++)
            {
                if (!string.IsNullOrEmpty(arrHFSelectTwo[i]))
                {
                    string[] arrChildSelectTwo = arrHFSelectTwo[i].Split('|');
                    ListItem liTwo = new ListItem(arrChildSelectTwo[1], arrChildSelectTwo[0]);
                    if (!selectTwo.Items.Contains(liTwo))
                    {
                        selectTwo.Items.Add(liTwo);
                    }
                    HF_SelectTwo.Value += arrChildSelectTwo[0] + "|" + arrChildSelectTwo[1] + ",";
                }
            }
        }
        if (!string.IsNullOrEmpty(strHFSelectThree))
        {
            selectThree.Items.Clear();
            string[] arrHFSelectThree = strHFSelectThree.Split(',');
            for (int i = 0; i < arrHFSelectThree.Length; i++)
            {
                if (!string.IsNullOrEmpty(arrHFSelectThree[i]))
                {
                    string[] arrChildSelectThree = arrHFSelectThree[i].Split('|');
                    ListItem liThree = new ListItem(arrChildSelectThree[1], arrChildSelectThree[0]);
                    if (!selectThree.Items.Contains(liThree))
                    {
                        selectThree.Items.Add(liThree);
                    }
                    HF_SelectThree.Value += arrChildSelectThree[0] + "|" + arrChildSelectThree[1] + ",";
                }
            }
        }
        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "HelloWorld", "GetTwoScrollcode();GetThreeScrollcode();", true);
    }

    public void InsertItemInSelect(string strSelectType)
    {
        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "HelloWorld", "<script>alert('aa');</script>", true);
        if (strSelectType == "two")
        {
            string strHFSelectTwo = HF_SelectTwo.Value;
            if (!string.IsNullOrEmpty(strHFSelectTwo))
            {
                string[] arrHFSelectTwo = strHFSelectTwo.Split('|');
                ListItem liTwo = new ListItem(arrHFSelectTwo[1], arrHFSelectTwo[0]);
                if (!selectTwo.Items.Contains(liTwo))
                {
                    selectTwo.Items.Add(liTwo);
                }
            }
        }
        else if (strSelectType == "three")
        {
            string strHFSelectThree = HF_SelectThree.Value;
            if (!string.IsNullOrEmpty(strHFSelectThree))
            {
                string[] arrHFSelectThree = strHFSelectThree.Split('|');
                ListItem liThree = new ListItem(arrHFSelectThree[1], arrHFSelectThree[0]);
                if (!selectThree.Items.Contains(liThree))
                {
                    selectThree.Items.Add(liThree);
                }
            }
        }
    }

    public void AddTree(TreeView tv, string xml, string SelectType)
    {
        XmlDocument dc = new XmlDocument();
        StringReader strReader = new StringReader(xml);
        XmlTextReader reader = new XmlTextReader(strReader);
        dc.Load(reader);
        XmlNodeList xnl = dc.SelectNodes("myFields");
        TreeNode Node = new TreeNode();
        string xmlAll = string.Empty;
        AddNodes(xnl, Node, SelectType, xmlAll);
        tv.Nodes.Add(Node);
    }
    public void AddNodes(XmlNodeList xmlnl, TreeNode pNode, string SelectType, string xmlAll)
    {
        foreach (XmlNode xl in xmlnl)
        {
            if (xl.NodeType == XmlNodeType.Element)
            {
                TreeNode Node = new TreeNode();
                #region 获得xml全路径
                if (!string.IsNullOrEmpty(xl.ParentNode.Name))
                {
                    if (xl.ParentNode.Name != "#document")
                    {
                        xmlAll = "";
                        xmlAll = "/" + xl.ParentNode.Name;
                    }
                    if (xl.ParentNode.ParentNode != null)
                    {
                        if (!string.IsNullOrEmpty(xl.ParentNode.ParentNode.Name))
                        {
                            if (xl.ParentNode.ParentNode.Name != "#document")
                            {
                                xmlAll = "";
                                xmlAll = "/" + xl.ParentNode.ParentNode.Name + "/" + xl.ParentNode.Name;
                            }
                            if (xl.ParentNode.ParentNode.ParentNode != null)
                            {
                                if (!string.IsNullOrEmpty(xl.ParentNode.ParentNode.ParentNode.Name))
                                {
                                    if (xl.ParentNode.ParentNode.ParentNode.Name != "#document")
                                    {
                                        xmlAll = "";
                                        xmlAll = "/" + xl.ParentNode.ParentNode.ParentNode.Name + "/" + xl.ParentNode.ParentNode.Name + "/" + xl.ParentNode.Name;
                                    }
                                    if (xl.ParentNode.ParentNode.ParentNode.ParentNode != null)
                                    {
                                        if (!string.IsNullOrEmpty(xl.ParentNode.ParentNode.ParentNode.ParentNode.Name))
                                        {
                                            if (xl.ParentNode.ParentNode.ParentNode.ParentNode.Name != "#document")
                                            {
                                                xmlAll = "";
                                                xmlAll = "/" + xl.ParentNode.ParentNode.ParentNode.ParentNode.Name + "/" + xl.ParentNode.ParentNode.ParentNode.Name + "/" + xl.ParentNode.ParentNode.Name + "/" + xl.ParentNode.Name;
                                            }
                                            if (xl.ParentNode.ParentNode.ParentNode.ParentNode.ParentNode != null)
                                            {
                                                if (!string.IsNullOrEmpty(xl.ParentNode.ParentNode.ParentNode.ParentNode.ParentNode.Name))
                                                {
                                                    if (xl.ParentNode.ParentNode.ParentNode.ParentNode.Name != "#document")
                                                    {
                                                        xmlAll = "";
                                                        xmlAll = "/" + xl.ParentNode.ParentNode.ParentNode.ParentNode.Name + "/" + xl.ParentNode.ParentNode.ParentNode.Name + "/" + xl.ParentNode.ParentNode.Name + "/" + xl.ParentNode.Name + "/" + xl.ParentNode.ParentNode.ParentNode.ParentNode.ParentNode.Name;
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
                #endregion
                if (SelectType.Equals("Template"))
                {
                    Node.Text = "<label onclick=\"AddTemplateItem('" + xmlAll + "/" + xl.Name + "','" + xl.Name + "')\" />" + xl.Name + "</label>";
                }
                else
                {
                    Node.Text = "<label onclick=\"AddTableItem('" + xmlAll + "/" + xl.Name + "','" + xl.Name + "')\" />" + xl.Name + "</label>";
                }

                pNode.ChildNodes.Add(Node);
                AddNodes(xl.ChildNodes, Node, SelectType, xmlAll);
            }
        }
    }


    //将DataSet转换为xml对象字符串
    public static string ConvertDataSetToXML(DataSet xmlDS)
    {
        MemoryStream stream = null;
        XmlTextWriter writer = null;

        try
        {
            stream = new MemoryStream();
            //从stream装载到XmlTextReader
            writer = new XmlTextWriter(stream, Encoding.Unicode);

            //用WriteXml方法写入文件.
            xmlDS.WriteXml(writer);
            int count = (int)stream.Length;
            byte[] arr = new byte[count];
            stream.Seek(0, SeekOrigin.Begin);
            stream.Read(arr, 0, count);

            UnicodeEncoding utf = new UnicodeEncoding();
            return utf.GetString(arr).Trim();
        }
        catch (System.Exception ex)
        {
            throw ex;
        }
        finally
        {
            if (writer != null)
                writer.Close();
        }
    }

    /// <summary>
    /// 把XML数据同步到表格当中
    /// </summary>
    /// <param name="xml">XML文件</param>
    /// <param name="strWFTemplateName">流程模板名称</param>
    /// <param name="strTableName">表名</param>
    public void XMLDataToTableData(Xml xml, string strWFTemplateName, string strTableName, DataSet ds)
    {

    }

    /// <summary>
    /// 把表格数据同步到XML当中
    /// </summary>
    /// <param name="xml">XML文件</param>
    /// <param name="strWFTemplateName">流程模板名称</param>
    /// <param name="strTableName">表名</param>
    public void TableDataToXMLData(Xml xml, string strWFTemplateName, string strTableName, DataSet ds)
    {

    }
}