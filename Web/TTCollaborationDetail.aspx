<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTCollaborationDetail.aspx.cs"
    Inherits="TTCollaborationDetail" %>

<%@ Register Assembly="Brettle.Web.NeatUpload" Namespace="Brettle.Web.NeatUpload"
    TagPrefix="Upload" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc2" %>
<%@ Register
    TagPrefix="customEditors"
    Namespace="AjaxControlToolkit.HTMLEditor.Samples" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link id="mainCss" href="css/bluelightmain.css" rel="stylesheet" type="text/css" />
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
                    <table style="width: 100%" cellpadding="0" cellspacing="0" align="center">
                        <tr>
                            <td height="31" class="page_topbj">
                                <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td align="left">
                                            <table width="345" border="0" align="left" cellpadding="0" cellspacing="0">
                                                <tr>
                                                    <td width="29">
                                                        <%--<img src="Logo/main_top_l.jpg" alt="" width="29" height="31" />--%>
                                                    </td>
                                                    <td align="center" background="ImagesSkin/main_top_bj.jpg" class="titlezi">
                                                        <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,XieZuoChuLi%>"></asp:Label>
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
                                <table width="100%" cellpadding="5" cellspacing="0">
                                    <tr>
                                        <td style="width: 100%; padding-top: 5px; text-align: left; vertical-align: top;">
                                            <cc2:TabContainer CssClass="ajax_tab_menu" ID="TabContainer1" runat="server" ActiveTabIndex="0" Width="100%">
                                                <cc2:TabPanel ID="TabPanel1" runat="server" HeaderText="发送信息" TabIndex="0" BorderWidth="0">
                                                    <HeaderTemplate>
                                                        <asp:Label ID="Label18" runat="server" Text="<%$ Resources:lang,FaSongXinXi%>"></asp:Label>
                                                    </HeaderTemplate>
                                                    <ContentTemplate>
                                                        <table style="width: 100%;" cellpadding="2" cellspacing="0" class="formBgStyle">
                                                            <tr>
                                                                <td width="85px" style="text-align: Right;" class="formItemBgStyle">
                                                                    <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,MingCheng%>"></asp:Label>： </td>
                                                                <td style="text-align: left; overflow-y: auto;" class="formItemBgStyle">
                                                                    <asp:Label ID="LB_CollaborationName" runat="server"></asp:Label>
                                                                    <div id="mess_box" style="width: 100%; height: 100px; overflow: auto;">
                                                                        <asp:DataList ID="DataList1" runat="server" CellPadding="4" ForeColor="#333333" Width="100%">
                                                                            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                                                            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                                                            <ItemStyle CssClass="itemStyle" />
                                                                            <ItemTemplate>
                                                                                <table style="width: 100%; table-layout: fixed;">
                                                                                    <tr>
                                                                                        <td style="width: 100%;"><%# DataBinder.Eval(Container.DataItem, "Comment")%></td>
                                                                                    </tr>
                                                                                </table>
                                                                            </ItemTemplate>
                                                                            <SelectedItemStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                                                        </asp:DataList>
                                                                    </div>
                                                                </td>
                                                            </tr>

                                                            <tr>
                                                                <td style="text-align: Right;" class="formItemBgStyle">
                                                                    <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,CanYuRenYuan%>"></asp:Label>： </td>
                                                                <td style="text-align: left;" class="formItemBgStyle">
                                                                    <table width="100%">
                                                                        <tr>
                                                                            <td width="80%" align="left">
                                                                                <asp:Repeater ID="RP_Attendant" runat="server">
                                                                                    <ItemTemplate>
                                                                                        <asp:Button ID="BT_UserName" runat="server" CssClass="inpuRepeat" Text='<%# DataBinder.Eval(Container.DataItem,"UserName") %>' />
                                                                                    </ItemTemplate>
                                                                                </asp:Repeater>
                                                                            </td>
                                                                            <td align="left">
                                                                                <asp:HyperLink ID="HL_CollaborationToTask" runat="server" Enabled="False" NavigateUrl="~/CollaborationToTask" Text="<%$ Resources:lang,ZhuanChengRenWu%>"
                                                                                    Target="_blank">
                                                                                </asp:HyperLink>
                                                                            </td>
                                                                        </tr>
                                                                    </table>
                                                                </td>
                                                            </tr>

                                                            <tr>
                                                                <td style="text-align: Right;" class="formItemBgStyle">
                                                                    <asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,WoDeYiJian%>"></asp:Label>： </td>
                                                                <td align="left" class="formItemBgStyle">
                                                                    <CKEditor:CKEditorControl runat="server" ID="HTEditor1" Toolbar="TextColor|BGColor|Bold|Font|FontSize|Image" Style="width: 90%;" Height="120px" Visible="False" />
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td class="formItemBgStyle"></td>
                                                                <td style="text-align: left;" class="formItemBgStyle">
                                                                    <table width="90%">
                                                                        <tr>
                                                                            <td width="20%" align="left">
                                                                                <asp:Button ID="BT_AddLog" CssClass="inpu" runat="server" Text="<%$ Resources:lang,FaSong%>" OnClick="BT_AddLog_Click" />
                                                                            </td>
                                                                            <td align="left">
                                                                         <asp:Button ID="BT_Close" runat="server" CssClass="inpuClose" ToolTip ="<%$ Resources:lang,GuanBi%>"  Visible="false" OnClick="BT_Close_Click" />
                                                                                &nbsp;
                                                                         <asp:Button ID="BT_Active" runat="server" CssClass="inpuActive" ToolTip ="<%$ Resources:lang,JiHuo%>" OnClick="BT_Active_Click" Visible="false" />
                                                                            </td>
                                                                            <td>&nbsp;</td>
                                                                        </tr>
                                                                    </table>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td style="text-align: Right;" class="formItemBgStyle">
                                                                    <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,ChuangJianZhe%>"></asp:Label>： </td>
                                                                <td style="text-align: left;" class="formItemBgStyle">
                                                                    <asp:Label ID="LB_Creator" runat="server" Text="<%$ Resources:lang,ChuangJianShiJian%>"></asp:Label>：
                                                                    <asp:Label ID="LB_CreateTime" runat="server" Text="<%$ Resources:lang,ZhuangTai%>"></asp:Label>：
                                                                    <asp:Label ID="LB_Status" runat="server"></asp:Label>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </ContentTemplate>
                                                </cc2:TabPanel>
                                                <cc2:TabPanel ID="TabPanel2" runat="server" HeaderText="上传文件" TabIndex="1" BorderWidth="0">
                                                    <HeaderTemplate>
                                                        <asp:Label ID="Label19" runat="server" Text="<%$ Resources:lang, ShangChuanWenJian%>"></asp:Label>
                                                    </HeaderTemplate>
                                                    <ContentTemplate>
                                                        <table background="ImagesSkin/main_n_bj.jpg" border="0" cellpadding="0" cellspacing="0"
                                                            width="98%">
                                                            <tr>
                                                                <td width="7">
                                                                    <img height="26" src="ImagesSkin/main_n_l.jpg" width="7" /></td>
                                                                <td>
                                                                    <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                                        <tr>
                                                                            <td align="center" width="9%"><strong>
                                                                                <asp:Label ID="Label8" runat="server" Text="<%$ Resources:lang,XuHao%>"></asp:Label></strong> </td>
                                                                            <td align="center" width="12%"><strong>
                                                                                <asp:Label ID="Label9" runat="server" Text="<%$ Resources:lang,LeiXing%>"></asp:Label></strong> </td>
                                                                            <td align="center" width="29%"><strong>
                                                                                <asp:Label ID="Label10" runat="server" Text="<%$ Resources:lang,WenJianMing%>"></asp:Label></strong> </td>
                                                                            <td align="center" width="13%"><strong>
                                                                                <asp:Label ID="Label11" runat="server" Text="<%$ Resources:lang,ZuoZhe%>"></asp:Label></strong> </td>
                                                                            <td align="center" width="13%"><strong>
                                                                                <asp:Label ID="Label12" runat="server" Text="<%$ Resources:lang,ShangChuanZhe%>"></asp:Label></strong> </td>
                                                                            <td align="center" width="18%"><strong>
                                                                                <asp:Label ID="Label13" runat="server" Text="<%$ Resources:lang,ShangChuanShiJian%>"></asp:Label></strong> </td>
                                                                        </tr>
                                                                    </table>
                                                                </td>
                                                                <td align="right" width="6">
                                                                    <img alt="" height="26" src="ImagesSkin/main_n_r.jpg" width="6" /></td>
                                                            </tr>
                                                        </table>
                                                        <asp:DataGrid ID="DataGrid1" runat="server" AutoGenerateColumns="False" CellPadding="4"
                                                            ForeColor="#333333" GridLines="None" Height="1px" Width="98%" ShowHeader="False">
                                                            <Columns>
                                                                <asp:BoundColumn DataField="DocID" HeaderText="序号">
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="9%" />
                                                                </asp:BoundColumn>
                                                                <asp:BoundColumn DataField="DocType" HeaderText="类型">
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="12%" />
                                                                </asp:BoundColumn>
                                                                <asp:HyperLinkColumn DataNavigateUrlField="Address" DataNavigateUrlFormatString="{0}"
                                                                    DataTextField="DocName" HeaderText="文件名" Target="_blank">
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="29%" />
                                                                </asp:HyperLinkColumn>
                                                                <asp:BoundColumn DataField="Author" HeaderText="作者">
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="13%" />
                                                                </asp:BoundColumn>
                                                                <asp:BoundColumn DataField="UploadManName" HeaderText="上传者">
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="13%" />
                                                                </asp:BoundColumn>
                                                                <asp:BoundColumn DataField="UploadTime" HeaderText="上传时间">
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="18%" />
                                                                </asp:BoundColumn>
                                                                <asp:BoundColumn DataField="Address" Visible="False"></asp:BoundColumn>
                                                            </Columns>
                                                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                            <EditItemStyle BackColor="#2461BF" />
                                                            <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                            <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />

                                                            <ItemStyle CssClass="itemStyle" />
                                                        </asp:DataGrid><br />
                                                        <table cellpadding="2" cellspacing="0" class="formBgStyle" style="width: 98%">
                                                            <tr>
                                                                <td class="formItemBgStyle" style="width: 100%; text-align: left;"><span><strong>
                                                                    <asp:Label ID="Label14" runat="server" Text="<%$ Resources:lang,WenJianShangChuan%>"></asp:Label>：</strong> </span>
                                                                    <asp:Label ID="LB_Sql" runat="server" Visible="False"></asp:Label></td>
                                                            </tr>
                                                            <tr>
                                                                <td class="formItemBgStyle" style="width: 100%; height: 25px; text-align: left;">
                                                                    <asp:Label ID="Label17" runat="server" Text="<%$ Resources:lang,LeiXing%>"></asp:Label>：<asp:DropDownList ID="DL_DocType" runat="server" DataTextField="Type" DataValueField="ID"
                                                                        Width="166px">
                                                                    </asp:DropDownList>
                                                                    <asp:Label ID="Label15" runat="server" Text="<%$ Resources:lang,QuanXian%>"></asp:Label>：<asp:DropDownList ID="DL_Visible" runat="server" CssClass="DDList" >
                                                                        <asp:ListItem Value="全体" Text="<%$ Resources:lang,QuanTi%>" />
                                                                        <asp:ListItem Value="个人" Text="<%$ Resources:lang,GeRen%>" />
                                                                    </asp:DropDownList>
                                                                    <asp:Label ID="Label16" runat="server" Text="<%$ Resources:lang,ZuoZhe%>"></asp:Label>：<asp:TextBox ID="TB_Author" runat="server" Width="74px"></asp:TextBox></td>
                                                            </tr>
                                                            <tr>
                                                                <td class="formItemBgStyle" style="width: 100%; text-align: left;">
                                                                    <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
                                                                        <ContentTemplate>
                                                                            <div>
                                                                                <Upload:InputFile ID="AttachFile" runat="server" Width="300px" />
                                                                                <br />
                                                                                <asp:Button ID="BtnUP" runat="server" OnClick="BtnUP_Click" Text="<%$ Resources:lang,ShangChuan%>" /><br />
                                                                                <div id="ProgressBar">
                                                                                    <Upload:ProgressBar ID="ProgressBar1" runat="server" Height="100px" Width="500px"></Upload:ProgressBar>
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
                                                        <table>
                                                            <tr>
                                                                <td style="width: 98%; height: 1px; text-align: left">
                                                                    <asp:Label ID="LB_UserCode" runat="server" Visible="False"></asp:Label><asp:Label ID="LB_UserName" runat="server" Visible="False"></asp:Label><asp:Label ID="LB_CoID" runat="server" Visible="False"></asp:Label></td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <br />
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </ContentTemplate>
                                                </cc2:TabPanel>
                                            </cc2:TabContainer>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
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
    </center>
</body>
<script type="text/javascript" language="javascript">var cssDirectory = '<%=Session["CssDirectory"] %>'; var oLink = document.getElementById('mainCss'); oLink.href = 'css/' + cssDirectory + '/' + 'bluelightmain.css';</script></html>
