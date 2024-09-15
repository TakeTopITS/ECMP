<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTSystemDataManageForImplementationBeginner.aspx.cs" Inherits="TTSystemDataManageForImplementationBeginner" %>


<%@ Register Assembly="NickLee.Web.UI" Namespace="NickLee.Web.UI" TagPrefix="NickLee" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link id="mainCss" href="css/bluelightmain.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        #AboveDiv {
            min-width: 1100px;
            width: expression (document.body.clientWidth <= 1100? "1100px" : "auto" ));
        }
    </style>
    <script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="js/allAHandler.js"></script>
    <script type="text/javascript" language="javascript">
        $(function () {

            if (top.location != self.location) { } else { CloseWebPage(); }

        });

    </script>

</head>
<body>

    <center>
        <form id="form1" runat="server">
            <%--  <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="True" EnableScriptLocalization="True">--%>
            <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="True" EnableScriptLocalization="True">
            </asp:ScriptManager>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <div id="AboveDiv">
                        <table id="AboveTable" cellpadding="0" width="100%" cellspacing="0" class="bian">
                            <tr>
                                <td height="31" class="page_topbj">
                                    <table width="96%" border="0" align="center" cellpadding="0" cellspacing="0">
                                        <tr>
                                            <td align="left">
                                                <table width="345" border="0" align="left" cellpadding="0" cellspacing="0">
                                                    <tr>
                                                        <td width="29">
                                                            <%--<img src="Logo/main_top_l.jpg" alt="" width="29" height="31" />--%>
                                                        </td>
                                                        <td align="center" background="ImagesSkin/main_top_bj.jpg" class="titlezi">
                                                            <asp:Label ID="Label1" runat="server" Text="系统数据实施开始阶段管理"></asp:Label>
                                                        </td>
                                                        <td width="5">
                                                            <%-- <img src="ImagesSkin/main_top_r.jpg" width="5" height="31" />--%>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <table cellpadding="0" cellspacing="0" width="100%">
                                        <tr>
                                            <td style="border-right: solid 1px #D8D8D8; padding: 5px 5px 5px 5px;" align="center"
                                                valign="top">
                                                <table style="width: 98%;" cellpadding="3" cellspacing="0" class="formBgStyle">
                                                    <tr>
                                                        <td style="border-right: solid 1px #D8D8D8; padding: 5px 5px 5px 5px;" align="center"
                                                            valign="top">
                                                            <table style="width: 98%;" border="1" cellpadding="3" cellspacing="0" class="formBgStyle">
                                                                <tr>
                                                                    <td colspan="2" style="padding: 5px 0px 0px 5px" class="formItemBgStyle" valign="top" align="left">
                                                                        <asp:Label ID="Label44" runat="server" Text="删除基础数据"></asp:Label>（<span style="color: red;">
                                                                            <asp:Label ID="Label45" runat="server" Text="只能系统实施开始阶段进行操作，操作之前请先备份数据库，相关数据正确后，请点击【禁用】按钮，禁用功能只能操作一次，禁用后，不能再操作相关功能"></asp:Label></span> ）：
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td colspan="2" align="left" class="formItemBgStyle">

                                                                        <table>
                                                                            <tr>
                                                                                <%--  <td style="text-align: right;">
                                                                                    <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,MiMa%>"></asp:Label>：</td>
                                                                                <td style="width: 300px; text-align: left; padding-top: 3px;">
                                                                                    <asp:TextBox ID="TB_Password" runat="server" Width="99%" TextMode="Password"></asp:TextBox>
                                                                                </td>--%>
                                                                                <td align="center" style="width: 300px">
                                                                                    <asp:Button ID="BT_BackupDB" runat="server" CssClass="inpuLong" Text="备份数据库" OnClick="BT_BackupDB_Click" />
                                                                                </td>
                                                                            </tr>
                                                                        </table>

                                                                    </td>

                                                                </tr>
                                                                <tr>
                                                                    <td class="formItemBgStyle" style="text-align: left; width: 70%; height: 25px;">
                                                                        <asp:Button ID="BT_ClearDepartmentData" runat="server" CssClass="inpuLong" OnClick="BT_ClearDepartmentData_Click" OnClientClick="return confirm(getDeleteMsgByLangCode())" Text="清除组织架构" Visible="false" />
                                                                        &nbsp;&nbsp;
                                                                        <asp:Button ID="BT_ClearUserData" runat="server" CssClass="inpuLong" OnClick="BT_ClearUserData_Click" OnClientClick="return confirm(getDeleteMsgByLangCode())" Text="清除员工档案" Visible="false" />
                                                                        &nbsp;&nbsp;
                                                                        <asp:Button ID="BT_ClearItemData" runat="server" CssClass="inpuLongest" OnClick="BT_ClearItemData_Click" OnClientClick="return confirm(getDeleteMsgByLangCode())" Text="清除物料或资产主数据" Visible="false" />
                                                                        &nbsp;&nbsp;
                                                                        <asp:Button ID="BT_ClearMaterialData" runat="server" CssClass="inpuLong" OnClick="BT_ClearMaterialData_Click" OnClientClick="return confirm(getDeleteMsgByLangCode())" Text="清除物料业务数据" Visible="false" />
                                                                        &nbsp;&nbsp;
                                                                        <asp:Button ID="BT_ClearAssetData" runat="server" CssClass="inpuLong" OnClick="BT_ClearAssetData_Click" OnClientClick="return confirm(getDeleteMsgByLangCode())" Text="清除资产业务数据" Visible="false" />
                                                                        &nbsp;&nbsp;
                                                                        <asp:Button ID="BT_ClearCustomerData" runat="server" CssClass="inpuLong" OnClick="BT_ClearCustomerData_Click" OnClientClick="return confirm(getDeleteMsgByLangCode())" Text="清除客户档案" Visible="false" />
                                                                        <br />
                                                                        <br />
                                                                        <asp:Button ID="BT_ClearVendorData" runat="server" CssClass="inpuLong" OnClick="BT_ClearVendorData_Click" OnClientClick="return confirm(getDeleteMsgByLangCode())" Text="清除供应商档案" Visible="false" />
                                                                        &nbsp;&nbsp;
                                                                        <asp:Button ID="BT_ClearProjectData" runat="server" CssClass="inpuLongest" OnClientClick="return confirm(getDeleteMsgByLangCode())" Text="清除已删除项目的相关数据" OnClick="BT_ClearProjectData_Click" Visible="false" />
                                                                        &nbsp;&nbsp; 
                                                                        <asp:Button ID="BT_ClearWorkflowData" runat="server" CssClass="inpuLongest" OnClientClick="return confirm(getDeleteMsgByLangCode())" Text="清除已删除流程模板的流程" OnClick="BT_ClearWorkflowData_Click" Visible="false" />
                                                                    </td>
                                                                    <td class="formItemBgStyle" style="text-align: left; vertical-align: middle; height: 25px;">
                                                                        <asp:Button ID="BT_ForbitClear" runat="server" CssClass="inpuLong" OnClick="BT_ForbitClear_Click" OnClientClick="return confirm('禁用功能只能操作一次，您确定要禁用前面功能吗？')" Text="禁用前面功能" />
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                            <br />
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
            <div style="position: absolute; left: 50%; top: 50%;">
                <asp:UpdateProgress ID="TakeTopUp" runat="server" AssociatedUpdatePanelID="UpdatePanel1">
                    <ProgressTemplate>
                        <img src="Images/Processing.gif" alt="Loading,please wait..." />
                    </ProgressTemplate>
                </asp:UpdateProgress>
            </div>
        </form>
    </center>
</body>
<script type="text/javascript" language="javascript">var cssDirectory = '<%=Session["CssDirectory"] %>'; var oLink = document.getElementById('mainCss'); oLink.href = 'css/' + cssDirectory + '/' + 'bluelightmain.css';</script>
</html>
