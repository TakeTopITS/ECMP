using System; using System.Resources;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using ProjectMgt.BLL;
using ProjectMgt.Model;
using System.Collections;

public partial class TTCarWeekFunction : System.Web.UI.Page
{
    string strUserCode, strUserName;

    protected void Page_Load(object sender, EventArgs e)
    {
        strUserCode = Session["UserCode"] == null ? "" : Session["UserCode"].ToString().Trim();
        //strUserName = ShareClass.GetUserName(strUserCode);

        if (!IsPostBack)
        {
            LoadWeekTree();
        }
    }

    private void LoadWeekTree()
    {
        string strCheckWeekHQL = string.Empty;
        strCheckWeekHQL = "from CarCheckWeek as carCheckWeek where CustomerCode = '" + strUserCode + "' order by CreateTime desc";
        CarCheckWeekBLL checkWeekBLL = new CarCheckWeekBLL();
        IList listCheckWeek = checkWeekBLL.GetAllCarCheckWeeks(strCheckWeekHQL);
        TV_Weeks.Nodes.Clear();
        TreeNode Node = new TreeNode();
        Node.Text = "全部";
        Node.Value = "all|all";
        if (listCheckWeek != null && listCheckWeek.Count > 0)
        {
            for (int i = 0; i < listCheckWeek.Count; i++)
            {
                CarCheckWeek checkWeek = (CarCheckWeek)listCheckWeek[i];

                TreeNode NodeChild = new TreeNode();
                NodeChild.Text = checkWeek.WeekName;
                string strWeekCode = checkWeek.WeekCode;
                NodeChild.Value = "checkWeekName|" + strWeekCode;
                //周检计划表
                TreeNode NodeWeekPlan = new TreeNode();
                NodeWeekPlan.Text = "周检计划表";
                NodeWeekPlan.Value = "checkWeekPlan|" + strWeekCode;

                CustomModuleBLL customModuleBLL1 = new CustomModuleBLL();
                string strCustomModuleSql1 = "from CustomModule as customModule where CustomType = 'checkWeekPlan'";
                IList customModuleList1 = customModuleBLL1.GetAllCustomModules(strCustomModuleSql1);
                if (customModuleList1 != null && customModuleList1.Count > 0)
                {
                    if (customModuleList1.Count > 1)
                    {
                        for (int j = 0; j < customModuleList1.Count; j++)
                        {
                            CustomModule customModule = (CustomModule)customModuleList1[j];

                            TreeNode NodeProductChild = new TreeNode();
                            NodeProductChild.Text = customModule.TemName;
                            NodeProductChild.Value = "child|" + strWeekCode + "|" + customModule.IdentifyString;
                            NodeWeekPlan.ChildNodes.Add(NodeProductChild);
                        }

                    }
                }
                NodeChild.ChildNodes.Add(NodeWeekPlan);
                //周检问题表
                TreeNode NodeWeekProblem = new TreeNode();
                NodeWeekProblem.Text = "周检问题表";
                NodeWeekProblem.Value = "checkWeekProblem|" + strWeekCode;

                CustomModuleBLL customModuleBLL2 = new CustomModuleBLL();
                string strCustomModuleSql2 = "from CustomModule as customModule where CustomType = 'checkWeekProblem'";
                IList customModuleList2 = customModuleBLL2.GetAllCustomModules(strCustomModuleSql2);
                if (customModuleList2 != null && customModuleList2.Count > 0)
                {
                    if (customModuleList2.Count > 1)
                    {
                        for (int j = 0; j < customModuleList2.Count; j++)
                        {
                            CustomModule customModule = (CustomModule)customModuleList2[j];

                            TreeNode NodeProductChild = new TreeNode();
                            NodeProductChild.Text = customModule.TemName;
                            NodeProductChild.Value = "child|" + strWeekCode + "|" + customModule.IdentifyString;
                            NodeWeekProblem.ChildNodes.Add(NodeProductChild);
                        }

                    }
                }
                NodeChild.ChildNodes.Add(NodeWeekProblem);
                //会议讲评记录
                TreeNode NodeWeekRecord = new TreeNode();
                NodeWeekRecord.Text = "会议讲评记录";
                NodeWeekRecord.Value = "checkWeekRecord|" + strWeekCode;

                CustomModuleBLL customModuleBLL3 = new CustomModuleBLL();
                string strCustomModuleSql3 = "from CustomModule as customModule where CustomType = 'checkWeekRecord'";
                IList customModuleList3 = customModuleBLL3.GetAllCustomModules(strCustomModuleSql3);
                if (customModuleList3 != null && customModuleList3.Count > 0)
                {
                    if (customModuleList3.Count > 1)
                    {
                        for (int j = 0; j < customModuleList3.Count; j++)
                        {
                            CustomModule customModule = (CustomModule)customModuleList3[j];

                            TreeNode NodeProductChild = new TreeNode();
                            NodeProductChild.Text = customModule.TemName;
                            NodeProductChild.Value = "child|" + strWeekCode + "|" + customModule.IdentifyString;
                            NodeWeekRecord.ChildNodes.Add(NodeProductChild);
                        }

                    }
                }
                NodeChild.ChildNodes.Add(NodeWeekRecord);
                //问题整改通知单
                TreeNode NodeWeekNotice = new TreeNode();
                NodeWeekNotice.Text = "问题整改通知单";
                NodeWeekNotice.Value = "checkWeekNotice|" + strWeekCode;

                CustomModuleBLL customModuleBLL4 = new CustomModuleBLL();
                string strCustomModuleSql4 = "from CustomModule as customModule where CustomType = 'checkWeekRecord'";
                IList customModuleList4 = customModuleBLL4.GetAllCustomModules(strCustomModuleSql4);
                if (customModuleList4 != null && customModuleList4.Count > 0)
                {
                    if (customModuleList4.Count > 1)
                    {
                        for (int j = 0; j < customModuleList4.Count; j++)
                        {
                            CustomModule customModule = (CustomModule)customModuleList4[j];

                            TreeNode NodeProductChild = new TreeNode();
                            NodeProductChild.Text = customModule.TemName;
                            NodeProductChild.Value = "child|" + strWeekCode + "|" + customModule.IdentifyString;
                            NodeWeekNotice.ChildNodes.Add(NodeProductChild);
                        }

                    }
                }
                NodeChild.ChildNodes.Add(NodeWeekNotice);
                //问题汇总
                TreeNode NodeWeekTotal = new TreeNode();
                NodeWeekTotal.Text = "问题汇总";
                NodeWeekTotal.Value = "checkWeekTotal|" + strWeekCode;

                CustomModuleBLL customModuleBLL5 = new CustomModuleBLL();
                string strCustomModuleSql5 = "from CustomModule as customModule where CustomType = 'checkWeekTotal'";
                IList customModuleList5 = customModuleBLL5.GetAllCustomModules(strCustomModuleSql5);
                if (customModuleList5 != null && customModuleList5.Count > 0)
                {
                    if (customModuleList5.Count > 1)
                    {
                        for (int j = 0; j < customModuleList5.Count; j++)
                        {
                            CustomModule customModule = (CustomModule)customModuleList5[j];

                            TreeNode NodeProductChild = new TreeNode();
                            NodeProductChild.Text = customModule.TemName;
                            NodeProductChild.Value = "child|" + strWeekCode + "|" + customModule.IdentifyString;
                            NodeWeekTotal.ChildNodes.Add(NodeProductChild);
                        }

                    }
                }
                NodeChild.ChildNodes.Add(NodeWeekTotal);
                Node.ChildNodes.Add(NodeChild);
            }
        }
        Node.ExpandAll();
        TV_Weeks.Nodes.Add(Node);
    }



    private void ShowCheckWeekInfo(string strWeekCode)
    {
        string strHQL;
        IList lst;

        strHQL = "from CarCheckWeek as carCheckWeek where carCheckWeek.WeekCode = '" + strWeekCode + "'";
        CarCheckWeekBLL checkWeekBLL = new CarCheckWeekBLL();
        lst = checkWeekBLL.GetAllCarCheckWeeks(strHQL);
        if (lst != null && lst.Count > 0)
        {
            CarCheckWeek checkWeek = (CarCheckWeek)lst[0];

            TXT_WeekCode.Text = checkWeek.WeekCode.Trim();
            TXT_WeekName.Text = checkWeek.WeekName.Trim();
            TXT_Ext1.Text = checkWeek.Ext1.Trim();
            TXT_Ext2.Text = checkWeek.Ext2.Trim();
            TXT_Ext3.Text = checkWeek.Ext3.Trim();
            TXT_Ext4.Text = checkWeek.Ext4.Trim();
            TXT_Ext5.Text = checkWeek.Ext5.Trim();
            TXT_Remark.Text = checkWeek.Remark.Trim();

            TXT_WeekCode.ReadOnly = true;
        }
        else
        {
            TXT_WeekCode.Text = "";
            TXT_WeekName.Text = "";
            TXT_Ext1.Text = "";
            TXT_Ext2.Text = "";
            TXT_Ext3.Text = "";
            TXT_Ext4.Text = "";
            TXT_Ext5.Text = "";
            TXT_Remark.Text = "";

            TXT_WeekCode.ReadOnly = false;
        }
    }


    protected void BT_Add_Click(object sender, EventArgs e)
    {
        string strWeekCode, strWeekName, strExt1, strExt2, strExt3, strExt4, strExt5, strRemark;

        strWeekCode = TXT_WeekCode.Text.Trim();
        strWeekName = TXT_WeekName.Text.Trim();
        strExt1 = TXT_Ext1.Text.Trim();
        strExt2 = TXT_Ext2.Text.Trim();
        strExt3 = TXT_Ext3.Text.Trim();
        strExt4 = TXT_Ext4.Text.Trim();
        strExt5 = TXT_Ext5.Text.Trim();
        strRemark = TXT_Remark.Text.Trim();

        if (strWeekCode != "" | strWeekName != "")
        {
            CarCheckWeekBLL checkWeekBLL = new CarCheckWeekBLL();
            string strWeekHQL = "from CarCheckWeek as carCheckWeek where carCheckWeek.WeekCode = '" + strWeekCode + "'";
            IList lstWeek = checkWeekBLL.GetAllCarCheckWeeks(strWeekHQL);
            if (lstWeek.Count == 0)
            {

                CarCheckWeek checkWeek = new CarCheckWeek();

                checkWeek.WeekCode = strWeekCode;
                checkWeek.WeekName = strWeekName;
                checkWeek.Ext1 = strExt1;
                checkWeek.Ext2 = strExt2;
                checkWeek.Ext3 = strExt3;
                checkWeek.Ext4 = strExt4;
                checkWeek.Ext5 = strExt5;
                checkWeek.Remark = strRemark;
                checkWeek.CreateTime = DateTime.Now;
                checkWeek.CustomerCode = Session["UserCode"] == null ? "" : Session["UserCode"].ToString().Trim(); ;
                checkWeek.CustomerName = Session["UserName"] == null ? "" : Session["UserName"].ToString();

                try
                {
                    checkWeekBLL.AddCarCheckWeek(checkWeek);


                    LoadWeekTree();
                    ClientScript.RegisterStartupScript(this.GetType(), "", "<script>ShowDiv();</script>");
                }
                catch
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "", "<script>alert('新增出错，请检查！');ShowDiv();</script>");
                }
            }
            else {
                ClientScript.RegisterStartupScript(this.GetType(), "", "<script>alert('新增出错，周检代码已存在！');ShowDiv();</script>");
            }
        }
        else
        {
            ClientScript.RegisterStartupScript(this.GetType(), "", "<script>alert('客户代码和名称不能为空，请检查！');ShowDiv();</script>");
        }
    }


    protected void BT_Update_Click(object sender, EventArgs e)
    {
        string strHQL;
        IList lst;

        string strWeekCode, strWeekName, strExt1, strExt2, strExt3, strExt4, strExt5, strRemark;

        strWeekCode = TXT_WeekCode.Text.Trim();
        strWeekName = TXT_WeekName.Text.Trim();
        strExt1 = TXT_Ext1.Text.Trim();
        strExt2 = TXT_Ext2.Text.Trim();
        strExt3 = TXT_Ext3.Text.Trim();
        strExt4 = TXT_Ext4.Text.Trim();
        strExt5 = TXT_Ext5.Text.Trim();
        strRemark = TXT_Remark.Text.Trim();

        if (strWeekCode != "" | strWeekName != "")
        {
            strHQL = "from CarCheckWeek as carCheckWeek where carCheckWeek.WeekCode=" + "'" + strWeekCode + "'";
            CarCheckWeekBLL checkWeekBLL = new CarCheckWeekBLL();
            lst = checkWeekBLL.GetAllCarCheckWeeks(strHQL);
            if (lst != null && lst.Count > 0)
            {
                CarCheckWeek checkWeek = (CarCheckWeek)lst[0];

                checkWeek.WeekCode = strWeekCode;
                checkWeek.WeekName = strWeekName;
                checkWeek.Ext1 = strExt1;
                checkWeek.Ext2 = strExt2;
                checkWeek.Ext3 = strExt3;
                checkWeek.Ext4 = strExt4;
                checkWeek.Ext5 = strExt5;
                checkWeek.Remark = strRemark;

                try
                {
                    checkWeekBLL.UpdateCarCheckWeek(checkWeek, strWeekCode);

                    LoadWeekTree();
                    ClientScript.RegisterStartupScript(this.GetType(), "", "<script>alert('保存成功！');ShowDiv();</script>");
                }
                catch
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "", "<script>alert('修改出错，请检查！');ShowDiv();</script>");
                }
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "", "<script>alert('不能修改客户代码，只可以修改其它信息！');ShowDiv();</script>");
            }
        }
        else
        {
            ClientScript.RegisterStartupScript(this.GetType(), "", "<script>alert('供应商代码和名称不能为空，请检查！');ShowDiv();</script>");
        }
    }


    protected void TV_Weeks_SelectedNodeChanged(object sender, EventArgs e)
    {
        if (TV_Weeks.SelectedNode != null)
        {
            string strSelectNodeValue = TV_Weeks.SelectedNode.Value;
            string[] arrSelectNodeValue = strSelectNodeValue.Split('|');
            if (arrSelectNodeValue[0] == "all")
            {
                mainFrame.Attributes.Add("src", "");
                string strWeekCode = arrSelectNodeValue[1];
                BT_Update.Enabled = false;
                BT_Add.Enabled = true;
                ShowCheckWeekInfo("");
            }
            else if (arrSelectNodeValue[0] == "checkWeekName")
            {
                mainFrame.Attributes.Add("src", "");
                string strWeekCode = arrSelectNodeValue[1];
                BT_Update.Enabled = true;
                BT_Add.Enabled = false;
                ShowCheckWeekInfo(strWeekCode);
            }
            else if (arrSelectNodeValue[0] == "checkWeekPlan")
            {
                string strWeekCode = arrSelectNodeValue[1];
                BT_Update.Enabled = true;
                BT_Add.Enabled = false;
                ShowCheckWeekInfo(strWeekCode);

                string strTemName = string.Empty;
                string strIdentifyString = string.Empty;
                string strDuo = string.Empty;
                ReadCustomerModule("checkWeekPlan", out strTemName, out strIdentifyString, out strDuo);
                if (!string.IsNullOrEmpty(strTemName) && !string.IsNullOrEmpty(strIdentifyString) && !string.IsNullOrEmpty(strDuo))
                {
                    if (strDuo == "1")
                    {
                        mainFrame.Attributes.Add("src", "TTDIYModuleByWFFormRelatedOther.aspx?ModuleName=" + strTemName + "&TemIdentifyString=" + strIdentifyString + "&RelatedCode=" + strWeekCode);
                    }
                    else
                    {
                        HF_RelatedCode.Value = strWeekCode;
                        mainFrame.Attributes.Add("src", "");
                    }
                }
                else
                {
                    mainFrame.Attributes.Add("src", "");
                    ClientScript.RegisterStartupScript(this.GetType(), "", "<script>alert('未设定客户开发的模组！请先设定模组');ShowDiv();</script>");
                }
            }
            else if (arrSelectNodeValue[0] == "checkWeekProblem")
            {
                string strWeekCode = arrSelectNodeValue[1];
                BT_Update.Enabled = true;
                BT_Add.Enabled = false;
                ShowCheckWeekInfo(strWeekCode);

                string strTemName = string.Empty;
                string strIdentifyString = string.Empty;
                string strDuo = string.Empty;
                ReadCustomerModule("checkWeekProblem", out strTemName, out strIdentifyString, out strDuo);
                if (!string.IsNullOrEmpty(strTemName) && !string.IsNullOrEmpty(strIdentifyString) && !string.IsNullOrEmpty(strDuo))
                {
                    if (strDuo == "1")
                    {
                        mainFrame.Attributes.Add("src", "TTDIYModuleByWFFormRelatedOther.aspx?ModuleName=" + strTemName + "&TemIdentifyString=" + strIdentifyString + "&RelatedCode=" + strWeekCode);
                    }
                    else
                    {
                        HF_RelatedCode.Value = strWeekCode;
                        mainFrame.Attributes.Add("src", "");
                    }
                }
                else
                {
                    mainFrame.Attributes.Add("src", "");
                    ClientScript.RegisterStartupScript(this.GetType(), "", "<script>alert('未设定客户开发的模组！请先设定模组');ShowDiv();</script>");
                }
            }
            else if (arrSelectNodeValue[0] == "checkWeekRecord")
            {
                string strWeekCode = arrSelectNodeValue[1];
                BT_Update.Enabled = true;
                BT_Add.Enabled = false;
                ShowCheckWeekInfo(strWeekCode);

                string strTemName = string.Empty;
                string strIdentifyString = string.Empty;
                string strDuo = string.Empty;
                ReadCustomerModule("checkWeekRecord", out strTemName, out strIdentifyString, out strDuo);
                if (!string.IsNullOrEmpty(strTemName) && !string.IsNullOrEmpty(strIdentifyString) && !string.IsNullOrEmpty(strDuo))
                {
                    if (strDuo == "1")
                    {
                        mainFrame.Attributes.Add("src", "TTDIYModuleByWFFormRelatedOther.aspx?ModuleName=" + strTemName + "&TemIdentifyString=" + strIdentifyString + "&RelatedCode=" + strWeekCode);
                    }
                    else
                    {
                        HF_RelatedCode.Value = strWeekCode;
                        mainFrame.Attributes.Add("src", "");
                    }
                }
                else
                {
                    mainFrame.Attributes.Add("src", "");
                    ClientScript.RegisterStartupScript(this.GetType(), "", "<script>alert('未设定客户开发的模组！请先设定模组');ShowDiv();</script>");
                }
            }
            else if (arrSelectNodeValue[0] == "checkWeekNotice")
            {
                string strWeekCode = arrSelectNodeValue[1];
                BT_Update.Enabled = true;
                BT_Add.Enabled = false;
                ShowCheckWeekInfo(strWeekCode);

                string strTemName = string.Empty;
                string strIdentifyString = string.Empty;
                string strDuo = string.Empty;
                ReadCustomerModule("checkWeekNotice", out strTemName, out strIdentifyString, out strDuo);
                if (!string.IsNullOrEmpty(strTemName) && !string.IsNullOrEmpty(strIdentifyString) && !string.IsNullOrEmpty(strDuo))
                {
                    if (strDuo == "1")
                    {
                        mainFrame.Attributes.Add("src", "TTDIYModuleByWFFormRelatedOther.aspx?ModuleName=" + strTemName + "&TemIdentifyString=" + strIdentifyString + "&RelatedCode=" + strWeekCode);
                    }
                    else
                    {
                        HF_RelatedCode.Value = strWeekCode;
                        mainFrame.Attributes.Add("src", "");
                    }
                }
                else
                {
                    mainFrame.Attributes.Add("src", "");
                    ClientScript.RegisterStartupScript(this.GetType(), "", "<script>alert('未设定客户开发的模组！请先设定模组');ShowDiv();</script>");
                }
            }
            else if (arrSelectNodeValue[0] == "checkWeekTotal")
            {
                string strWeekCode = arrSelectNodeValue[1];
                BT_Update.Enabled = true;
                BT_Add.Enabled = false;
                ShowCheckWeekInfo(strWeekCode);

                string strTemName = string.Empty;
                string strIdentifyString = string.Empty;
                string strDuo = string.Empty;
                ReadCustomerModule("checkWeekTotal", out strTemName, out strIdentifyString, out strDuo);
                if (!string.IsNullOrEmpty(strTemName) && !string.IsNullOrEmpty(strIdentifyString) && !string.IsNullOrEmpty(strDuo))
                {
                    if (strDuo == "1")
                    {
                        mainFrame.Attributes.Add("src", "TTDIYModuleByWFFormRelatedOther.aspx?ModuleName=" + strTemName + "&TemIdentifyString=" + strIdentifyString + "&RelatedCode=" + strWeekCode);
                    }
                    else
                    {
                        HF_RelatedCode.Value = strWeekCode;
                        mainFrame.Attributes.Add("src", "");
                    }
                }
                else
                {
                    mainFrame.Attributes.Add("src", "");
                    ClientScript.RegisterStartupScript(this.GetType(), "", "<script>alert('未设定客户开发的模组！请先设定模组');ShowDiv();</script>");
                }
            }
            else if (arrSelectNodeValue[0] == "child")
            {
                string strTemName = string.Empty;
                string strIdentifyString = string.Empty;
                string strWeekCode = arrSelectNodeValue[1];
                strTemName = TV_Weeks.SelectedNode.Text;
                strIdentifyString = arrSelectNodeValue[2];

                if (!string.IsNullOrEmpty(strTemName) && !string.IsNullOrEmpty(strIdentifyString))
                {
                    mainFrame.Attributes.Add("src", "TTDIYModuleByWFFormRelatedOther.aspx?ModuleName=" + strTemName + "&TemIdentifyString=" + strIdentifyString + "&RelatedCode=" + strWeekCode);
                }
            }
        }
    }


    private void ReadCustomerModule(string strCustomerType, out string strTemName, out string strIdentifyString, out string strDuo)
    {
        CustomModuleBLL customModuleBLL = new CustomModuleBLL();
        string strCustomModuleSql = "from CustomModule as customModule where CustomType = '" + strCustomerType + "'";
        IList customModuleList = customModuleBLL.GetAllCustomModules(strCustomModuleSql);
        if (customModuleList != null && customModuleList.Count > 0)
        {
            if (customModuleList.Count == 1)
            {
                CustomModule customModule = (CustomModule)customModuleList[0];
                strTemName = customModule.TemName;
                strIdentifyString = customModule.IdentifyString;
                strDuo = "1";
            }
            else
            {
                strTemName = "2";
                strIdentifyString = "2";
                strDuo = "2";
            }
        }
        else
        {
            strTemName = "";
            strIdentifyString = "";
            strDuo = "";
        }
    }
}