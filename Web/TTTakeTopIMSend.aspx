<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTTakeTopIMSend.aspx.cs"
    EnableEventValidation="false" Inherits="TTTakeTopIMSend" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc2" %>
<%@ Register Assembly="Brettle.Web.NeatUpload" Namespace="Brettle.Web.NeatUpload"
    TagPrefix="Upload" %>

<%@ Register
    TagPrefix="customEditors"
    Namespace="AjaxControlToolkit.HTMLEditor.Samples" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link id="mainCss" href="css/bluelightmain.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        html {
            overflow-x: hidden;
            overflow-y: auto;
        }

        #form1 {
            text-align: left;
        }
    </style>
    
    <script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="js/allAHandler.js"></script>

</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="True" EnableScriptLocalization="True">
        </asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
                <table width="100%">
                    <tr>
                        <td style="padding-top: 2px;">
                            <cc2:TabContainer CssClass="ajax_tab_menu" ID="TabContainer1" runat="server" ActiveTabIndex="0"
                                Width="100%">
                                <cc2:TabPanel ID="TabPanel1" runat="server" HeaderText="发送信息" TabIndex="0" BorderWidth="0">
                                    <HeaderTemplate>
                                        <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,FaSongXinXi%>"></asp:Label>
                                    </HeaderTemplate>
                                    <ContentTemplate>
                                        <asp:Panel ID="Panel_CoName" runat="server" Style="width: 100%;" Visible="False">
                                            <table width="100%">
                                                <tr>
                                                    <td width="38px">
                                                        <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,ZhuTi%>"></asp:Label>：
                                                    </td>
                                                    <td align="right">
                                                        <asp:TextBox ID="TB_CollaborationName" runat="server" Style="width: 99%;"></asp:TextBox>
                                                    </td>
                                                </tr>
                                            </table>
                                        </asp:Panel>
                                        <asp:Panel ID="Panel_CoDetail" runat="server" Style="width: 100%;">
                                            <table width="100%">
                                                <tr>
                                                    <td align="right">
                                                        <CKEditor:CKEditorControl runat="server" ID="HTEditor1" Toolbar="TextColor|BGColor|Bold|Font|FontSize" Width="100%" Height="110px" Visible="False" />
                                                    </td>
                                                </tr>
                                            </table>
                                        </asp:Panel>
                                    </ContentTemplate>
                                </cc2:TabPanel>
                                <cc2:TabPanel ID="TabPanel2" runat="server" HeaderText="上传文件" TabIndex="1" BorderWidth="0">
                                    <HeaderTemplate>
                                        <asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,ShangChuanWenJian%>"></asp:Label>
                                    </HeaderTemplate>
                                    <ContentTemplate>
                                        <br />
                                        <table cellpadding="2" cellspacing="0" class="formBgStyle" style="width: 98%">
                                            <tr>
                                                <td class="formItemBgStyle" style="width: 100%; text-align: left;">
                                                    <span><strong>
                                                        <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,WenJianShangChuan%>"></asp:Label>：</strong>
                                                    </span>
                                                    <asp:Label ID="LB_Sql" runat="server" Visible="False"></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="formItemBgStyle" style="width: 100%; height: 25px; text-align: left;">
                                                    <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,LeiXing%>"></asp:Label>：<asp:DropDownList ID="DL_DocType" runat="server" DataTextField="Type" DataValueField="ID"
                                                        Width="166px">
                                                    </asp:DropDownList>
                                                    &#160;
                                                    <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,QuanXian%>"></asp:Label>：<asp:DropDownList ID="DL_Visible" runat="server" CssClass="DDList" Width="64px">
                                                        <asp:ListItem Value="全体" Text="<%$ Resources:lang,QuanTi%>" />
                                                        <asp:ListItem Value="个人" Text="<%$ Resources:lang,GeRen%>" />
                                                    </asp:DropDownList>
                                                    &#160;
                                                    <asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,ZuoZhe%>"></asp:Label>：<asp:TextBox ID="TB_Author" runat="server" Width="74px"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="formItemBgStyle" style="width: 100%; text-align: left;">
                                                    <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
                                                        <ContentTemplate>
                                                            <div>
                                                                <Upload:InputFile ID="AttachFile" runat="server" Width="300px" />
                                                                &nbsp;&nbsp;
                                                            <asp:Button ID="BtnUP" runat="server" OnClick="BtnUP_Click" Text="<%$ Resources:lang,ShangChuan%>" Enabled="false" /><br />
                                                                <div id="ProgressBar">
                                                                    <Upload:ProgressBar ID="ProgressBar1" runat="server" Height="100px" Width="500px">
                                                                    </Upload:ProgressBar>
                                                                </div>
                                                            </div>
                                                        </ContentTemplate>
                                                        <Triggers>
                                                            <asp:PostBackTrigger ControlID="BtnUP" />
                                                        </Triggers>
                                                    </asp:UpdatePanel>
                                                </td>
                                            </tr>
                                        </table>
                                        <br />
                                    </ContentTemplate>
                                </cc2:TabPanel>
                            </cc2:TabContainer>
                        </td>
                    </tr>
                    <tr>
                        <td style="border-top: solid 1px #D8D8D8; padding-top: 5px;">

                            <table width="100%">
                                <tr>
                                    <td align="left" width="40%" style="padding-left: 5px;">
                                        <asp:Button ID="BT_Send" CssClass="inpu" runat="server" Text="<%$ Resources:lang,FaSong%>" OnClick="BT_Send_Click" />

                                    </td>
                                    <td align="right" style="padding-right: 20px;">
                                        <asp:Button ID="BT_Close" runat="server" CssClass="inpuClose" ToolTip ="<%$ Resources:lang,GuanBi%>" Visible="false" OnClick="BT_Close_Click"   />
                                       
                                        &nbsp;
                                        <asp:Button ID="BT_Active" runat="server" CssClass="inpuActive" ToolTip ="<%$ Resources:lang,JiHuo%>" Visible="false" OnClick="BT_Active_Click"     />
                                       
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: left; display :none;">
                            <asp:Label ID="LB_UserCode" runat="server" Visible="False"></asp:Label><asp:Label
                                ID="LB_UserName" runat="server" Visible="False"></asp:Label><asp:Label ID="LB_CoID"
                                    Visible="False" runat="server"></asp:Label>
                            <asp:Label ID="LB_ChatterCode" runat="server" Visible="False"></asp:Label>
                            <asp:Label ID="LB_CreatorCode" runat="server" Visible="False"></asp:Label>
                            <asp:TextBox ID="TB_CoID" Text="0" runat="server" Style="visibility: hidden"></asp:TextBox>
                        </td>
                    </tr>
                </table>
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
</body>
<script type="text/javascript" language="javascript">var cssDirectory = '<%=Session["CssDirectory"] %>'; var oLink = document.getElementById('mainCss'); oLink.href = 'css/' + cssDirectory + '/' + 'bluelightmain.css';</script></html>
