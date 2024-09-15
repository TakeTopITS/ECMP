<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTProjDocumentControl.aspx.cs" Inherits="TTProjDocumentControl" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Assembly="Brettle.Web.NeatUpload" Namespace="Brettle.Web.NeatUpload" TagPrefix="Upload" %>
<%@ Register Assembly="NickLee.Web.UI" Namespace="NickLee.Web.UI" TagPrefix="NickLee" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link id="mainCss" href="css/bluelightmain.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .auto-style1 {
            background-color: #F6FAFD;
            background-repeat: no-repeat;
            width: 14%;
        }

        .auto-style2 {
            background-color: #F6FAFD;
            background-repeat: no-repeat;
            width: 10%;
        }

        .auto-style3 {
            background-color: #F6FAFD;
            background-repeat: no-repeat;
            height: 2px;
            width: 10%;
        }

        .auto-style4 {
            font-size: large;
        }
    </style>
    <script src="js/jquery-1.7.2.min.js" type="text/javascript"></script>
    <script src="js/allAHandler.js" type="text/javascript"></script>
    <script language="javascript" type="text/javascript">
        $(function () {
            if (top.location != self.location) { } else { CloseWebPage(); }

        });
    </script>
</head>
<body>
    <center>
        <form id="form1" runat="server">
            <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="True" EnableScriptLocalization="True">
            </asp:ScriptManager>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <table cellpadding="0" cellspacing="0" width="100%" class="bian">
                        <tr>
                            <td height="31" class="page_topbj">
                                <table width="96%" border="0" align="center" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td align="left">
                                            <table width="345" border="0" align="left" cellpadding="0" cellspacing="0">
                                                <tr>
                                                    <td width="29">
                                                        <%--<img src="Logo/main_top_l.jpg" alt="" width="29" height="31" />--%></td>
                                                    <td align="center" background="ImagesSkin/main_top_bj.jpg" class="titlezi">
                                                        <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,XiangMuWenKong%>"></asp:Label>
                                                    </td>
                                                    <td width="5">
                                                        <%--<img src="ImagesSkin/main_top_r.jpg" width="5" height="31" alt="" />--%></td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td style="text-align: center;">
                                <table align="center" width="98%">
                                    <tr>
                                        <td align="left" style="padding: 10px 5px 5px 5px;">
                                            <cc1:TabContainer CssClass="ajax_tab_menu" ID="TabContainer1" runat="server" ActiveTabIndex="0" Width="98%">
                                                <cc1:TabPanel ID="TabPanel1" runat="server" HeaderText="文控类型">
                                                    <ContentTemplate>
                                                        <table width="98%" style="margin-top: 5px">
                                                            <tr>
                                                                <td valign="top" style="width: 230px; text-align: left; padding: 5px 5px 0px 5px; border-right: solid 1px #D8D8D8; vertical-align: top;"
                                                                    rowspan="2">
                                                                    <asp:TreeView ID="TreeView1" runat="server" Font-Bold="False" Font-Names="宋体" Font-Size="10pt"
                                                                        NodeWrap="True" OnSelectedNodeChanged="TreeView1_SelectedNodeChanged" ShowLines="True"
                                                                        Width="220px">
                                                                        <RootNodeStyle CssClass="rootNode" />
                                                                        <NodeStyle CssClass="treeNode" />
                                                                        <LeafNodeStyle CssClass="leafNode" />
                                                                        <SelectedNodeStyle CssClass="selectNode" ForeColor="Red" />
                                                                    </asp:TreeView>
                                                                    <div style="width: 100%; text-align: left; padding-top: 20px;">
                                                                        ---<asp:ImageButton ID="BT_EditDocType" runat="server" ImageUrl="ImagesSkin/Update.png" OnClick="BT_EditDocType_Click" />------
                                                                    </div>
                                                                </td>
                                                                <td style="height: 24px; text-align: left;">
                                                                    <asp:Label ID="LB_FindCondition" runat="server" Font-Bold="False" Font-Size="9pt"></asp:Label>
                                                                    <asp:Label ID="lbl_sql1" runat="server" Visible="False"></asp:Label>
                                                                    <asp:Label ID="lbl_sql2" runat="server" Visible="False"></asp:Label>
                                                                    <asp:Label ID="lbl_sql3" runat="server" Visible="False"></asp:Label>
                                                                    <asp:Label ID="lbl_sql4" runat="server" Visible="False"></asp:Label>
                                                                    <asp:Label ID="lbl_ParamaValue" runat="server" Text="0" Visible="False"></asp:Label>
                                                                    <asp:Label ID="LB_UserCode" runat="server" Visible="False"></asp:Label>
                                                                    <asp:Label ID="LB_UserName" runat="server" Visible="False"></asp:Label>
                                                                    <asp:Label ID="LB_ReqID" runat="server" Visible="False"></asp:Label>
                                                                    <asp:Label ID="lbl_TreeViewName" runat="server" Visible="False"></asp:Label>
                                                                </td>
                                                            </tr>

                                                            <tr>
                                                                <td valign="top" style="height: 24px; text-align: center;">


                                                                    <asp:Panel ID="Panel_ProGraphRegistration" runat="server">
                                                                        <div style="width: 100%; text-align: right; padding-bottom: 5px;">
                                                                            <table width="100%">
                                                                                <tr>
                                                                                    <td style="text-align: right; height: 2px;">
                                                                                        <asp:Label ID="Label57" runat="server" Text="<%$ Resources:lang,JianSuoXinXi%>"></asp:Label>：</td>
                                                                                    <td style="text-align: left; height: 2px;">
                                                                                        <asp:TextBox ID="TB_GraphInfo" runat="server" CssClass="shuru" Width="400px"></asp:TextBox>
                                                                                        <asp:Button ID="BT_Check" runat="server" CssClass="inpu" Text="<%$ Resources:lang,ChaXun%>" OnClick="BT_Check_Click" />
                                                                                    </td>
                                                                                    <td>&nbsp;</td>
                                                                                    <td style="text-align: right;">
                                                                                        <asp:Button ID="BT_CreateGraphRegistration" runat="server" Text="<%$ Resources:lang,New%>" CssClass="inpuYello" OnClick="BT_CreateGraphRegistration_Click" />
                                                                                    </td>
                                                                                </tr>
                                                                            </table>

                                                                        </div>
                                                                        <table width="100%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                                                            <tr>
                                                                                <td>
                                                                                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                                        <tr>
                                                                                            <td width="5%" align="center">
                                                                                                <strong>
                                                                                                    <asp:Label ID="Label25" runat="server" Text="<%$ Resources:lang,BianJi %>" /></strong>
                                                                                            </td>
                                                                                            <td width="5%" align="center">
                                                                                                <strong>
                                                                                                    <asp:Label ID="Label92" runat="server" Text="<%$ Resources:lang,ShanChu %>" /></strong>
                                                                                            </td>
                                                                                            <td width="3%" align="center">
                                                                                                <strong>
                                                                                                    <asp:Label ID="Label93" runat="server" Text="<%$ Resources:lang,XuHao%>"></asp:Label></strong>
                                                                                            </td>
                                                                                            <td width="8%" align="center">
                                                                                                <strong>
                                                                                                    <asp:Label ID="Label21" runat="server" Text="<%$ Resources:lang,TuCeHao%>"></asp:Label></strong>
                                                                                            </td>
                                                                                            <td width="8%" align="center">
                                                                                                <strong>
                                                                                                    <asp:Label ID="Label22" runat="server" Text="<%$ Resources:lang,DangAnHao%>"></asp:Label></strong>
                                                                                            </td>
                                                                                            <td width="15%" align="center">
                                                                                                <strong>
                                                                                                    <asp:Label ID="Label23" runat="server" Text="<%$ Resources:lang,MingCheng%>"></asp:Label></strong>
                                                                                            </td>
                                                                                            <td width="12%" align="center">
                                                                                                <strong>
                                                                                                    <asp:Label ID="Label24" runat="server" Text="<%$ Resources:lang,ShouTuRiQi%>"></asp:Label></strong>
                                                                                            </td>

                                                                                            <td width="7%" align="center">
                                                                                                <strong>
                                                                                                    <asp:Label ID="Label26" runat="server" Text="<%$ Resources:lang,FenShu1%>"></asp:Label></strong>
                                                                                            </td>
                                                                                            <td width="7%" align="center">
                                                                                                <strong>
                                                                                                    <asp:Label ID="Label27" runat="server" Text="<%$ Resources:lang,BiaoFen%>"></asp:Label></strong>
                                                                                            </td>
                                                                                            <td width="7%" align="center">
                                                                                                <strong>
                                                                                                    <asp:Label ID="Label28" runat="server" Text="<%$ Resources:lang,TuFen%>"></asp:Label></strong>
                                                                                            </td>
                                                                                            <td width="10%" align="center">
                                                                                                <strong>
                                                                                                    <asp:Label ID="Label29" runat="server" Text="<%$ Resources:lang,DianZiBan%>"></asp:Label></strong>
                                                                                            </td>
                                                                                            <td width="11%" align="center">
                                                                                                <strong>
                                                                                                    <asp:Label ID="Label30" runat="server" Text="<%$ Resources:lang,BeiZhu%>"></asp:Label></strong>
                                                                                            </td>
                                                                                            <td width="8%" align="center"></td>
                                                                                        </tr>
                                                                                    </table>
                                                                                </td>
                                                                            </tr>
                                                                        </table>
                                                                        <asp:DataGrid ID="DataGrid3" runat="server" AllowPaging="True"
                                                                            AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333"
                                                                            GridLines="None" Height="1px" OnItemCommand="DataGrid3_ItemCommand" ShowHeader="False"
                                                                            OnPageIndexChanged="DataGrid3_PageIndexChanged" Width="100%" OnItemDataBound="DataGrid3_ItemDataBound">
                                                                            <Columns>
                                                                                <asp:ButtonColumn ButtonType="LinkButton" CommandName="Update" Text="&lt;div&gt;&lt;img src=ImagesSkin/Update.png border=0 alt='修改' /&gt;&lt;/div&gt;">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                                </asp:ButtonColumn>
                                                                                <asp:TemplateColumn HeaderText="Delete">
                                                                                    <ItemTemplate>
                                                                                        <asp:LinkButton ID="LBT_Delete" CommandName="Delete" runat="server" OnClientClick="return confirm(getDeleteMsgByLangCode())" Text="&lt;div&gt;&lt;img src=ImagesSkin/Delete.png border=0 alt='删除' /&gt;&lt;/div&gt;"></asp:LinkButton>
                                                                                    </ItemTemplate>
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                                </asp:TemplateColumn>
                                                                                <asp:BoundColumn DataField="ID" HeaderText="ID">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                                </asp:BoundColumn>

                                                                                <asp:BoundColumn DataField="GraphNo" HeaderText="图册号">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                                                </asp:BoundColumn>
                                                                                <asp:BoundColumn DataField="FileNo" HeaderText="档案号">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                                                </asp:BoundColumn>
                                                                                <asp:BoundColumn DataField="FileName" HeaderText="名称">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="15%" />
                                                                                </asp:BoundColumn>
                                                                                <asp:BoundColumn DataField="FigureDate" HeaderText="收图日期" DataFormatString="{0:yyyy-MM-dd}">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="12%" />
                                                                                </asp:BoundColumn>

                                                                                <asp:BoundColumn DataField="FileNum" HeaderText="份数">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="7%" />
                                                                                </asp:BoundColumn>
                                                                                <asp:BoundColumn DataField="TableNum" HeaderText="表/份">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="7%" />
                                                                                </asp:BoundColumn>
                                                                                <asp:BoundColumn DataField="FigureNum" HeaderText="图/份">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="7%" />
                                                                                </asp:BoundColumn>
                                                                                <asp:BoundColumn DataField="Creator" HeaderText="上传者" Visible="False">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                                </asp:BoundColumn>
                                                                                <asp:HyperLinkColumn DataNavigateUrlField="FilePath"
                                                                                    DataNavigateUrlFormatString="{0}" DataTextField="FileName" HeaderText="电子版"
                                                                                    Target="_blank">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="10%" />
                                                                                </asp:HyperLinkColumn>
                                                                                <asp:BoundColumn DataField="Remark" HeaderText="备注">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="11%" />
                                                                                </asp:BoundColumn>
                                                                                <asp:TemplateColumn>
                                                                                    <HeaderTemplate>
                                                                                    </HeaderTemplate>
                                                                                    <ItemTemplate>
                                                                                        <asp:Button ID="BT_ActiveGraph" runat="server" CssClass="inpu" CommandName="Active" Text="<%$ Resources:lang,GuiDang%>" />
                                                                                        <asp:HiddenField runat="server" ID="hfArchiveGraph" Value='<%#Eval("ArchiveIdentification")%>' />
                                                                                    </ItemTemplate>
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                                                </asp:TemplateColumn>
                                                                            </Columns>
                                                                            <EditItemStyle BackColor="#2461BF" />
                                                                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                                            <ItemStyle CssClass="itemStyle" />
                                                                            <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />
                                                                            <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                                        </asp:DataGrid>
                                                                    </asp:Panel>


                                                                    <asp:Panel ID="Panel_ProSendFigureRegistration" runat="server">
                                                                        <div style="width: 100%; text-align: right; padding-bottom: 5px;">

                                                                            <asp:Button ID="BT_CreateSendFigureRegistration" runat="server" Text="<%$ Resources:lang,New%>" CssClass="inpuYello" OnClick="BT_CreateSendFigureRegistration_Click" />
                                                                        </div>
                                                                        <table width="100%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                                                            <tr>
                                                                                <td>
                                                                                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                                        <tr>
                                                                                            <td width="5%" align="center">
                                                                                                <strong>
                                                                                                    <asp:Label ID="Label35" runat="server" Text="<%$ Resources:lang,BianJi %>" /></strong>
                                                                                            </td>
                                                                                            <td width="5%" align="center">
                                                                                                <strong>
                                                                                                    <asp:Label ID="Label94" runat="server" Text="<%$ Resources:lang,ShanChu %>" /></strong>
                                                                                            </td>
                                                                                            <td width="3%" align="center">
                                                                                                <strong>
                                                                                                    <asp:Label ID="Label95" runat="server" Text="<%$ Resources:lang,XuHao%>"></asp:Label></strong>
                                                                                            </td>
                                                                                            <td width="10%" align="center">
                                                                                                <strong>
                                                                                                    <asp:Label ID="Label32" runat="server" Text="<%$ Resources:lang,DangAnHao%>"></asp:Label></strong>
                                                                                            </td>
                                                                                            <td width="18%" align="center">
                                                                                                <strong>
                                                                                                    <asp:Label ID="Label33" runat="server" Text="<%$ Resources:lang,MingCheng%>"></asp:Label></strong>
                                                                                            </td>
                                                                                            <td width="12%" align="center">
                                                                                                <strong>
                                                                                                    <asp:Label ID="Label34" runat="server" Text="<%$ Resources:lang,FaTuRiQi%>"></asp:Label></strong>
                                                                                            </td>

                                                                                            <td width="7%" align="center">
                                                                                                <strong>
                                                                                                    <asp:Label ID="Label36" runat="server" Text="<%$ Resources:lang,FenShu1%>"></asp:Label></strong>
                                                                                            </td>
                                                                                            <td width="7%" align="center">
                                                                                                <strong>
                                                                                                    <asp:Label ID="Label37" runat="server" Text="<%$ Resources:lang,BiaoFen%>"></asp:Label></strong>
                                                                                            </td>
                                                                                            <td width="7%" align="center">
                                                                                                <strong>
                                                                                                    <asp:Label ID="Label38" runat="server" Text="<%$ Resources:lang,TuFen%>"></asp:Label></strong>
                                                                                            </td>
                                                                                            <td width="10%" align="center">
                                                                                                <strong>
                                                                                                    <asp:Label ID="Label39" runat="server" Text="<%$ Resources:lang,QianShouRen%>"></asp:Label></strong>
                                                                                            </td>
                                                                                            <td width="12%" align="center">
                                                                                                <strong>
                                                                                                    <asp:Label ID="Label40" runat="server" Text="<%$ Resources:lang,DianZiBan%>"></asp:Label></strong>
                                                                                            </td>
                                                                                            <td width="10%" align="center">
                                                                                                <strong>
                                                                                                    <asp:Label ID="Label41" runat="server" Text="<%$ Resources:lang,HuiShou%>"></asp:Label></strong>
                                                                                            </td>
                                                                                        </tr>
                                                                                    </table>
                                                                                </td>
                                                                            </tr>
                                                                        </table>
                                                                        <asp:DataGrid ID="DataGrid5" runat="server" AllowPaging="True"
                                                                            AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333"
                                                                            GridLines="None" Height="1px" OnItemCommand="DataGrid5_ItemCommand" ShowHeader="False"
                                                                            OnPageIndexChanged="DataGrid5_PageIndexChanged" Width="100%" OnItemDataBound="DataGrid5_ItemDataBound">

                                                                            <Columns>
                                                                                <asp:ButtonColumn ButtonType="LinkButton" CommandName="Update" Text="&lt;div&gt;&lt;img src=ImagesSkin/Update.png border=0 alt='修改' /&gt;&lt;/div&gt;">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                                </asp:ButtonColumn>
                                                                                <asp:TemplateColumn HeaderText="Delete">
                                                                                    <ItemTemplate>
                                                                                        <asp:LinkButton ID="LBT_Delete" CommandName="Delete" runat="server" OnClientClick="return confirm(getDeleteMsgByLangCode())" Text="&lt;div&gt;&lt;img src=ImagesSkin/Delete.png border=0 alt='删除' /&gt;&lt;/div&gt;"></asp:LinkButton>
                                                                                    </ItemTemplate>
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                                </asp:TemplateColumn>
                                                                                <asp:BoundColumn DataField="ID" HeaderText="ID">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                                </asp:BoundColumn>

                                                                                <asp:BoundColumn DataField="FileNo" HeaderText="档案号">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                                </asp:BoundColumn>
                                                                                <asp:BoundColumn DataField="FileName" HeaderText="名称">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="18%" />
                                                                                </asp:BoundColumn>
                                                                                <asp:BoundColumn DataField="IssueDate" HeaderText="发图日期" DataFormatString="{0:yyyy-MM-dd}">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="12%" />
                                                                                </asp:BoundColumn>

                                                                                <asp:BoundColumn DataField="FileNum" HeaderText="份数">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="7%" />
                                                                                </asp:BoundColumn>
                                                                                <asp:BoundColumn DataField="TableNum" HeaderText="表/份">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="7%" />
                                                                                </asp:BoundColumn>
                                                                                <asp:BoundColumn DataField="FigureNum" HeaderText="图/份">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="7%" />
                                                                                </asp:BoundColumn>
                                                                                <asp:BoundColumn DataField="Recipients" HeaderText="签收人">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                                </asp:BoundColumn>
                                                                                <asp:HyperLinkColumn DataNavigateUrlField="FilePath"
                                                                                    DataNavigateUrlFormatString="{0}" DataTextField="FileName" HeaderText="电子版"
                                                                                    Target="_blank">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="12%" />
                                                                                </asp:HyperLinkColumn>
                                                                                <asp:TemplateColumn>
                                                                                    <HeaderTemplate>
                                                                                    </HeaderTemplate>
                                                                                    <ItemTemplate>
                                                                                        <asp:Button ID="BT_Review" runat="server" CssClass="inpu" CommandName="Review" Text="<%$ Resources:lang,HuiShou%>" />
                                                                                        <asp:HiddenField runat="server" ID="hfBackPer" Value='<%#Eval("BackPer").ToString()%>' />
                                                                                    </ItemTemplate>
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                                </asp:TemplateColumn>
                                                                            </Columns>
                                                                            <EditItemStyle BackColor="#2461BF" />
                                                                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                                            <ItemStyle CssClass="itemStyle" />
                                                                            <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />
                                                                            <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                                        </asp:DataGrid>
                                                                    </asp:Panel>


                                                                    <asp:Panel ID="Panel_ProReceiptRegistration" runat="server">

                                                                        <div style="width: 100%; text-align: right; padding-bottom: 5px;">

                                                                            <asp:Button ID="BT_CreateReceiptRegistration" runat="server" Text="<%$ Resources:lang,New%>" CssClass="inpuYello" OnClick="BT_CreateReceiptRegistration_Click" />
                                                                        </div>
                                                                        <table width="100%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                                                            <tr>
                                                                                <td>
                                                                                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                                        <tr>
                                                                                            <td width="5%" align="center">
                                                                                                <strong>
                                                                                                    <asp:Label ID="Label88" runat="server" Text="<%$ Resources:lang,BianJi %>" /></strong>
                                                                                            </td>
                                                                                            <td width="5%" align="center">
                                                                                                <strong>
                                                                                                    <asp:Label ID="Label89" runat="server" Text="<%$ Resources:lang,ShanChu %>" /></strong>
                                                                                            </td>
                                                                                            <td width="3%" align="center">
                                                                                                <strong>
                                                                                                    <asp:Label ID="Label8" runat="server" Text="<%$ Resources:lang,XuHao%>"></asp:Label></strong>
                                                                                            </td>
                                                                                            <td width="12%" align="center">
                                                                                                <strong>
                                                                                                    <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,ShouWenRiQi%>"></asp:Label></strong>
                                                                                            </td>
                                                                                            <td width="10%" align="center">
                                                                                                <strong>
                                                                                                    <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,FaWenBuMen%>"></asp:Label></strong>
                                                                                            </td>
                                                                                            <td width="10%" align="center">
                                                                                                <strong>
                                                                                                    <asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,WenJianBianHao%>"></asp:Label></strong>
                                                                                            </td>
                                                                                            <td width="20%" align="center">
                                                                                                <strong>
                                                                                                    <asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,WenJianMingCheng%>"></asp:Label></strong>
                                                                                            </td>

                                                                                            <td width="10%" align="center">
                                                                                                <strong>
                                                                                                    <asp:Label ID="Label9" runat="server" Text="<%$ Resources:lang,WenJianQuXiang%>"></asp:Label></strong>
                                                                                            </td>
                                                                                            <td width="10%" align="center">
                                                                                                <strong>
                                                                                                    <asp:Label ID="Label10" runat="server" Text="<%$ Resources:lang,DianZiBan%>"></asp:Label></strong>
                                                                                            </td>
                                                                                            <td width="20%" align="center">
                                                                                                <strong>
                                                                                                    <asp:Label ID="Label11" runat="server" Text="<%$ Resources:lang,CaoZuo%>"></asp:Label>
                                                                                            </td>
                                                                                        </tr>
                                                                                    </table>
                                                                                </td>
                                                                            </tr>
                                                                        </table>
                                                                        <asp:DataGrid ID="DataGrid1" runat="server" AllowPaging="True"
                                                                            AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333"
                                                                            GridLines="None" Height="1px" OnItemCommand="DataGrid1_ItemCommand" ShowHeader="False"
                                                                            OnPageIndexChanged="DataGrid1_PageIndexChanged" Width="100%" OnItemDataBound="DataGrid1_ItemDataBound">
                                                                            <Columns>
                                                                                <asp:ButtonColumn ButtonType="LinkButton" CommandName="Update" Text="&lt;div&gt;&lt;img src=ImagesSkin/Update.png border=0 alt='修改' /&gt;&lt;/div&gt;">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                                </asp:ButtonColumn>
                                                                                <asp:TemplateColumn HeaderText="Delete">
                                                                                    <ItemTemplate>
                                                                                        <asp:LinkButton ID="LBT_Delete" CommandName="Delete" runat="server" OnClientClick="return confirm(getDeleteMsgByLangCode())" Text="&lt;div&gt;&lt;img src=ImagesSkin/Delete.png border=0 alt='删除' /&gt;&lt;/div&gt;"></asp:LinkButton>
                                                                                    </ItemTemplate>
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                                </asp:TemplateColumn>
                                                                                <asp:BoundColumn DataField="ID" HeaderText="ID">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                                </asp:BoundColumn>
                                                                                <asp:BoundColumn DataField="CreateDate" HeaderText="收文日期" DataFormatString="{0:yyyy-MM-dd}">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="12%" />
                                                                                </asp:BoundColumn>
                                                                                <asp:BoundColumn DataField="DispatchDepartment" HeaderText="发文部门">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="10%" />
                                                                                </asp:BoundColumn>
                                                                                <asp:BoundColumn DataField="DocumentNo" HeaderText="文件编号">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                                </asp:BoundColumn>
                                                                                <asp:BoundColumn DataField="FileName" HeaderText="文件名称">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="20%" />
                                                                                </asp:BoundColumn>

                                                                                <asp:BoundColumn DataField="Creator" HeaderText="收文人" Visible="False">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                                </asp:BoundColumn>
                                                                                <asp:BoundColumn DataField="FileWay" HeaderText="文件去向">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="10%" />
                                                                                </asp:BoundColumn>
                                                                                <asp:HyperLinkColumn DataNavigateUrlField="FilePath"
                                                                                    DataNavigateUrlFormatString="{0}" DataTextField="FileName" HeaderText="电子版"
                                                                                    Target="_blank">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="10%" />
                                                                                </asp:HyperLinkColumn>
                                                                                <asp:TemplateColumn>
                                                                                    <HeaderTemplate>
                                                                                    </HeaderTemplate>
                                                                                    <ItemTemplate>
                                                                                        <asp:Button ID="BT_Review" runat="server" CssClass="inpu" CommandName="Review" Text="<%$ Resources:lang,XiaoHui%>" />
                                                                                        <asp:Button ID="BT_ActiveFile" runat="server" CssClass="inpu" CommandName="Active" Text="<%$ Resources:lang,GuiDang%>" />
                                                                                        <asp:HiddenField runat="server" ID="hfDestroyPeople" Value='<%#Eval("DestroyPeople").ToString()%>' />
                                                                                        <asp:HiddenField runat="server" ID="hfArchive" Value='<%#Eval("ArchiveIdentification")%>' />
                                                                                    </ItemTemplate>
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="20%" />
                                                                                </asp:TemplateColumn>
                                                                            </Columns>
                                                                            <EditItemStyle BackColor="#2461BF" />
                                                                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                                            <ItemStyle CssClass="itemStyle" />
                                                                            <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />
                                                                            <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                                        </asp:DataGrid>

                                                                    </asp:Panel>


                                                                    <asp:Panel ID="Panel_ProIssueRegistration" runat="server">

                                                                        <div style="width: 100%; text-align: right; padding-bottom: 5px;">

                                                                            <asp:Button ID="BT_CreateIssueRegistration" runat="server" Text="<%$ Resources:lang,New%>" CssClass="inpuYello" OnClick="BT_CreateIssueRegistration_Click" />
                                                                        </div>

                                                                        <table width="100%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                                                            <tr>
                                                                                <td>
                                                                                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                                        <tr>
                                                                                            <td width="5%" align="center">
                                                                                                <strong>
                                                                                                    <asp:Label ID="Label15" runat="server" Text="<%$ Resources:lang,BianJi %>" /></strong>
                                                                                            </td>
                                                                                            <td width="5%" align="center">
                                                                                                <strong>
                                                                                                    <asp:Label ID="Label90" runat="server" Text="<%$ Resources:lang,ShanChu %>" /></strong>
                                                                                            </td>
                                                                                            <td width="3%" align="center">
                                                                                                <strong>
                                                                                                    <asp:Label ID="Label91" runat="server" Text="<%$ Resources:lang,XuHao%>"></asp:Label></strong>
                                                                                            </td>
                                                                                            <td width="12%" align="center">
                                                                                                <strong>
                                                                                                    <asp:Label ID="Label12" runat="server" Text="<%$ Resources:lang,FaFangRiQi%>"></asp:Label></strong>
                                                                                            </td>
                                                                                            <td width="10%" align="center">
                                                                                                <strong>
                                                                                                    <asp:Label ID="Label13" runat="server" Text="<%$ Resources:lang,WenJianBianHao%>"></asp:Label></strong>
                                                                                            </td>
                                                                                            <td width="20%" align="center">
                                                                                                <strong>
                                                                                                    <asp:Label ID="Label14" runat="server" Text="<%$ Resources:lang,WenJianMingCheng%>"></asp:Label></strong>
                                                                                            </td>

                                                                                            <td width="10%" align="center">
                                                                                                <strong>
                                                                                                    <asp:Label ID="Label16" runat="server" Text="<%$ Resources:lang,LingQuBuMen%>"></asp:Label></strong>
                                                                                            </td>
                                                                                            <td width="8%" align="center">
                                                                                                <strong>
                                                                                                    <asp:Label ID="Label17" runat="server" Text="<%$ Resources:lang,FenShu1%>"></asp:Label></strong>
                                                                                            </td>
                                                                                            <td width="10%" align="center">
                                                                                                <strong>
                                                                                                    <asp:Label ID="Label18" runat="server" Text="<%$ Resources:lang,QianShouRen%>"></asp:Label></strong>
                                                                                            </td>
                                                                                            <td width="12%" align="center">
                                                                                                <strong>
                                                                                                    <asp:Label ID="Label19" runat="server" Text="<%$ Resources:lang,DianZiBan%>"></asp:Label></strong>
                                                                                            </td>
                                                                                            <td width="10%" align="center">
                                                                                                <strong>
                                                                                                    <asp:Label ID="Label20" runat="server" Text="<%$ Resources:lang,HuiShou%>"></asp:Label>
                                                                                            </td>
                                                                                        </tr>
                                                                                    </table>
                                                                                </td>
                                                                            </tr>
                                                                        </table>
                                                                        <asp:DataGrid ID="DataGrid2" runat="server" AllowPaging="True"
                                                                            AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333"
                                                                            GridLines="None" Height="1px" OnItemCommand="DataGrid2_ItemCommand" ShowHeader="False"
                                                                            OnPageIndexChanged="DataGrid2_PageIndexChanged" Width="100%" OnItemDataBound="DataGrid2_ItemDataBound">
                                                                            <Columns>
                                                                                <asp:ButtonColumn ButtonType="LinkButton" CommandName="Update" Text="&lt;div&gt;&lt;img src=ImagesSkin/Update.png border=0 alt='修改' /&gt;&lt;/div&gt;">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                                </asp:ButtonColumn>
                                                                                <asp:TemplateColumn HeaderText="Delete">
                                                                                    <ItemTemplate>
                                                                                        <asp:LinkButton ID="LBT_Delete" CommandName="Delete" runat="server" OnClientClick="return confirm(getDeleteMsgByLangCode())" Text="&lt;div&gt;&lt;img src=ImagesSkin/Delete.png border=0 alt='删除' /&gt;&lt;/div&gt;"></asp:LinkButton>
                                                                                    </ItemTemplate>
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                                </asp:TemplateColumn>
                                                                                <asp:BoundColumn DataField="ID" HeaderText="ID">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                                </asp:BoundColumn>
                                                                                <asp:BoundColumn DataField="IssuingDate" HeaderText="发放日期" DataFormatString="{0:yyyy-MM-dd}">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="12%" />
                                                                                </asp:BoundColumn>
                                                                                <asp:BoundColumn DataField="DocumentNo" HeaderText="文件编号">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                                </asp:BoundColumn>
                                                                                <asp:BoundColumn DataField="FileName" HeaderText="文件名称">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="20%" />
                                                                                </asp:BoundColumn>

                                                                                <asp:BoundColumn DataField="ReceivingDepartment" HeaderText="领取部门">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="10%" />
                                                                                </asp:BoundColumn>
                                                                                <asp:BoundColumn DataField="Attachments" HeaderText="份数">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                                                </asp:BoundColumn>
                                                                                <asp:BoundColumn DataField="Recipients" HeaderText="签收人">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="10%" />
                                                                                </asp:BoundColumn>
                                                                                <asp:HyperLinkColumn DataNavigateUrlField="FilePath"
                                                                                    DataNavigateUrlFormatString="{0}" DataTextField="FileName" HeaderText="电子版"
                                                                                    Target="_blank">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="12%" />
                                                                                </asp:HyperLinkColumn>
                                                                                <asp:TemplateColumn>
                                                                                    <HeaderTemplate>
                                                                                    </HeaderTemplate>
                                                                                    <ItemTemplate>
                                                                                        <asp:Button ID="BT_Review" runat="server" CssClass="inpu" CommandName="Review" Text="<%$ Resources:lang,HuiShou%>" />
                                                                                        <asp:HiddenField runat="server" ID="hfRecycling" Value='<%#Eval("Recycling").ToString()%>' />
                                                                                    </ItemTemplate>
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                                </asp:TemplateColumn>
                                                                            </Columns>
                                                                            <EditItemStyle BackColor="#2461BF" />
                                                                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                                            <ItemStyle CssClass="itemStyle" />
                                                                            <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />
                                                                            <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                                        </asp:DataGrid>
                                                                    </asp:Panel>

                                                                    <asp:Label ID="LB_ProReceiptRegistrationCount" runat="server"></asp:Label>
                                                                    <asp:Label ID="LB_ProIssueRegistrationCount" runat="server"></asp:Label>
                                                                    <asp:Label ID="LB_ProGraphRegistrationCount" runat="server"></asp:Label>
                                                                    <asp:Label ID="LB_ProSendFigureRegistrationCount" runat="server"></asp:Label>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td></td>
                                                                <td style="width: 100%; text-align: left"></td>
                                                            </tr>
                                                        </table>
                                                    </ContentTemplate>
                                                </cc1:TabPanel>
                                            </cc1:TabContainer>
                                        </td>
                                    </tr>
                                </table>

                                <br />
                            </td>
                        </tr>
                    </table>

                    <div class="layui-layer layui-layer-iframe" id="popwindowGraphRegistration"
                        style="z-index: 9999; width: 800px; height: 530px; position: absolute; overflow: hidden; display: none; border-radius: 10px;">
                        <div class="layui-layer-title" style="background: #e7e7e8;" id="popwindow_title">
                            <asp:Label ID="Label86" runat="server" Text="&lt;div&gt;&lt;img src=ImagesSkin/Update.png border=0 width=30px height=30px alt='BusinessForm' /&gt;&lt;/div&gt;"></asp:Label>
                        </div>
                        <div id="popwindow_content" class="layui-layer-content" style="text-align: left; overflow: auto; padding: 0px 5px 0px 5px;">


                            <table style="width: 100%;" cellpadding="2" cellspacing="0" class="formBgStyle">
                                <tr>
                                    <td style="width: 8%; text-align: right;" class="formItemBgStyle">
                                        <asp:Label ID="Label46" runat="server" Text="<%$ Resources:lang,LeiXing%>"></asp:Label>： </td>
                                    <td style="width: 20%; text-align: left;" class="formItemBgStyle">
                                        <asp:DropDownList ID="ddl_DocType" runat="server">
                                        </asp:DropDownList>
                                    </td>
                                    <td style="text-align: right;" class="auto-style1">
                                        <asp:Label ID="Label47" runat="server" Text="<%$ Resources:lang,DangAnHao%>"></asp:Label>：</td>
                                    <td style="text-align: left;" class="formItemBgStyle">
                                        <asp:TextBox ID="TB_FileNo" runat="server" Width="120px" CssClass="shuru"></asp:TextBox>
                                    </td>
                                    <td style="width: 10%; text-align: right;" class="formItemBgStyle">
                                        <asp:Label ID="Label48" runat="server" Text="<%$ Resources:lang,MingCheng%>"></asp:Label>：</td>
                                    <td style="text-align: left;" class="formItemBgStyle">
                                        <asp:TextBox ID="TB_FileName" runat="server" Width="150px" CssClass="shuru"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="formItemBgStyle" style="width: 8%; text-align: right;">
                                        <asp:Label ID="Label49" runat="server" Text="<%$ Resources:lang,TuCeHao%>"></asp:Label>：</td>
                                    <td class="formItemBgStyle" style="width: 20%; text-align: left;">
                                        <asp:TextBox ID="TB_GraphNo" runat="server" CssClass="shuru" Width="120px"></asp:TextBox>
                                    </td>
                                    <td class="auto-style1" style="text-align: right;">
                                        <asp:Label ID="Label50" runat="server" Text="<%$ Resources:lang,BeiZhuShuoMing%>"></asp:Label>：</td>
                                    <td class="formItemBgStyle" style="text-align: left;" colspan="3">
                                        <asp:TextBox ID="TB_Remark" runat="server" CssClass="shuru" Width="95%"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="formItemBgStyle" style="width: 8%; text-align: right;">
                                        <asp:Label ID="Label51" runat="server" Text="<%$ Resources:lang,FenShu1%>"></asp:Label>：</td>
                                    <td class="formItemBgStyle" style="width: 20%; text-align: left;">
                                        <NickLee:NumberBox ID="TB_FileNum" runat="server" CssClass="shuru" MaxAmount="1000000000000" MinAmount="-1000000000000" OnBlur="" OnFocus="" OnKeyPress="" PositiveColor="" Precision="0" Width="67px">0</NickLee:NumberBox>
                                    </td>
                                    <td class="auto-style1" style="text-align: right;">
                                        <asp:Label ID="Label52" runat="server" Text="<%$ Resources:lang,BiaoShuFen%>"></asp:Label>：</td>
                                    <td class="formItemBgStyle" style="text-align: left;">
                                        <NickLee:NumberBox ID="TB_TableNum" runat="server" CssClass="shuru" MaxAmount="1000000000000" MinAmount="-1000000000000" OnBlur="" OnFocus="" OnKeyPress="" PositiveColor="" Precision="0" Width="67px">0</NickLee:NumberBox>
                                    </td>
                                    <td class="formItemBgStyle" style="width: 10%; text-align: right;">
                                        <asp:Label ID="Label53" runat="server" Text="<%$ Resources:lang,TuShuFen%>"></asp:Label>：</td>
                                    <td class="formItemBgStyle" style="text-align: left;">
                                        <NickLee:NumberBox ID="NB_FigureNum" runat="server" CssClass="shuru" MaxAmount="1000000000000" MinAmount="-1000000000000" OnBlur="" OnFocus="" OnKeyPress="" PositiveColor="" Precision="0" Width="67px">0</NickLee:NumberBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td rowspan="2" style="text-align: right" class="formItemBgStyle">
                                        <asp:Label ID="Label54" runat="server" Text="<%$ Resources:lang,DianZiBan%>"></asp:Label>： </td>
                                    <td colspan="3" rowspan="2" style="text-align: left" class="formItemBgStyle">
                                        <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
                                            <ContentTemplate>
                                                <div>
                                                    <Upload:InputFile ID="AttachFile" runat="server" Width="360px" />
                                                    <br />
                                                    <div id="ProgressBar">
                                                        <Upload:ProgressBar ID="ProgressBar1" runat='server' Width="500px" Height="100px">
                                                        </Upload:ProgressBar>
                                                    </div>
                                                </div>
                                            </ContentTemplate>
                                            <Triggers>
                                                <asp:PostBackTrigger ControlID="BT_NewGraphRegistration" />
                                                <%--     <asp:PostBackTrigger ControlID="BT_Update" />
                                                <asp:PostBackTrigger ControlID="BT_Delete" />
                                                <asp:PostBackTrigger ControlID="BT_Active" />--%>
                                            </Triggers>
                                        </asp:UpdatePanel>

                                        <asp:HyperLink ID="HL_GraphRegistrationFile" runat="server"></asp:HyperLink>
                                    </td>
                                    <td style="text-align: right" class="formItemBgStyle">
                                        <asp:Label ID="Label55" runat="server" Text="<%$ Resources:lang,ShouTuRiQi%>"></asp:Label>：</td>
                                    <td style="text-align: left" class="formItemBgStyle">
                                        <asp:TextBox ID="DLC_FigureDate" runat="server" Width="100px" CssClass="shuru"></asp:TextBox>
                                        <ajaxToolkit:CalendarExtender ID="CalendarExtender2" runat="server" Enabled="True" Format="yyyy-MM-dd" TargetControlID="DLC_FigureDate">
                                        </ajaxToolkit:CalendarExtender>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="text-align: right" class="formItemBgStyle">
                                        <asp:Label ID="Label56" runat="server" Text="<%$ Resources:lang,ShangChuanZhe%>"></asp:Label>：</td>
                                    <td style="text-align: left" class="formItemBgStyle">
                                        <asp:TextBox ID="TB_Creator" runat="server" Width="120px" CssClass="shuru"></asp:TextBox>
                                    </td>
                                </tr>

                                <tr>
                                    <td class="formItemBgStyle" style="text-align: right; height: 2px;">&nbsp;</td>
                                    <td class="formItemBgStyle" colspan="5" style="text-align: left; height: 2px;">&nbsp;<asp:Button ID="BT_Active" runat="server" CssClass="inpu" Enabled="False" OnClick="BT_Active_Click" Text="<%$ Resources:lang,GuiDang%>" />
                                        <asp:Label ID="LB_GraphRegistrationID" runat="server" CssClass="shuru" Enabled="False" Visible="False"></asp:Label>
                                        <asp:TextBox ID="txtParentName" runat="server" Enabled="False" Visible="False"></asp:TextBox>
                                    </td>
                                </tr>
                            </table>


                        </div>

                        <div id="popwindow_footer" class="layui-layer-btn" style="border-top: 1px solid #ccc;">
                            <asp:LinkButton ID="BT_NewGraphRegistration" runat="server" class="layui-layer-btn notTab" OnClientClick="window.frames['IFrame_RelatedInformation'].document.getElementById('BT_SaveXMLFile').click()" OnClick="BT_NewGraphRegistration_Click" Text="<%$ Resources:lang,BaoCun%>"></asp:LinkButton><a class="layui-layer-btn notTab" onclick="return popClose();"><asp:Label ID="Label87" runat="server" Text="<%$ Resources:lang,GuanBi%>" /></a>
                        </div>
                        <span class="layui-layer-setwin"><a onclick="return popClose();" class="layui-layer-ico layui-layer-close layui-layer-close1 notTab" href="javascript:;"></a></span>
                    </div>

                    <div class="layui-layer layui-layer-iframe" id="popwindowSendFigureRegistration"
                        style="z-index: 9999; width: 800px; height: 530px; position: absolute; overflow: hidden; display: none; border-radius: 10px;">
                        <div class="layui-layer-title" style="background: #e7e7e8;" id="popwindow_title">
                            <asp:Label ID="Label31" runat="server" Text="&lt;div&gt;&lt;img src=ImagesSkin/Update.png border=0 width=30px height=30px alt='BusinessForm' /&gt;&lt;/div&gt;"></asp:Label>
                        </div>
                        <div id="popwindow_content" class="layui-layer-content" style="text-align: left; overflow: auto; padding: 0px 5px 0px 5px;">

                            <table style="width: 100%;" cellpadding="2" cellspacing="0" class="formBgStyle">
                                <tr>

                                    <td style="text-align: right;" class="auto-style1">
                                        <asp:Label ID="Label59" runat="server" Text="<%$ Resources:lang,DangAnMingCheng%>"></asp:Label>：</td>
                                    <td style="text-align: left;" class="auto-style2">
                                        <asp:DropDownList ID="ddl_FileNo" runat="server" DataValueField="FileNo" DataTextField="FileName" AutoPostBack="True" OnSelectedIndexChanged="ddl_FileNo_SelectedIndexChanged"></asp:DropDownList>
                                        <asp:Label ID="lbl_DocType" runat="server" Visible="False"></asp:Label>
                                    </td>
                                    <td style="width: 10%; text-align: right;" class="formItemBgStyle">
                                        <asp:Label ID="Label60" runat="server" Text="<%$ Resources:lang,QianShouRen%>"></asp:Label>：</td>
                                    <td colspan="3" style="text-align: left;" class="formItemBgStyle">
                                        <asp:TextBox ID="TB_Recipients" runat="server" Width="90%"></asp:TextBox>
                                        <asp:Label ID="LB_SendFigureRegistrationID" runat="server" Visible="false"></asp:Label>
                                    </td>

                                </tr>
                                <tr>
                                    <td class="auto-style2" style="text-align: right;">
                                        <asp:Label ID="Label61" runat="server" Text="<%$ Resources:lang,FenShu1%>"></asp:Label>：</td>
                                    <td class="formItemBgStyle" style="width: 20%; text-align: left;">
                                        <NickLee:NumberBox ID="NB_FileNum" runat="server" MaxAmount="1000000000000" MinAmount="-1000000000000" OnBlur="" OnFocus="" OnKeyPress="" PositiveColor="" Width="67px" Precision="0" CssClass="shuru">0</NickLee:NumberBox>
                                        <asp:Label ID="lbl_FileOld" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style1" style="text-align: right;">
                                        <asp:Label ID="Label62" runat="server" Text="<%$ Resources:lang,BiaoShuFen%>"></asp:Label>：</td>
                                    <td class="formItemBgStyle" style="text-align: left;">
                                        <NickLee:NumberBox ID="NB_TableNum" runat="server" MaxAmount="1000000000000" MinAmount="-1000000000000" OnBlur="" OnFocus="" OnKeyPress="" PositiveColor="" Width="67px" Precision="0" CssClass="shuru">0</NickLee:NumberBox>
                                        <asp:Label ID="lbl_TableOld" runat="server"></asp:Label>
                                    </td>
                                    <td class="formItemBgStyle" style="width: 10%; text-align: right;">
                                        <asp:Label ID="Label63" runat="server" Text="<%$ Resources:lang,TuShuFen%>"></asp:Label>：</td>
                                    <td class="formItemBgStyle" style="text-align: left;">
                                        <NickLee:NumberBox ID="NB_FigureNum1" runat="server" MaxAmount="1000000000000" MinAmount="-1000000000000" OnBlur="" OnFocus="" OnKeyPress="" PositiveColor="" Width="67px" Precision="0" CssClass="shuru">0</NickLee:NumberBox>
                                        <asp:Label ID="lbl_FigureOld" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style2" style="text-align: right;">
                                        <asp:Label ID="Label64" runat="server" Text="<%$ Resources:lang,FaFangRiQi%>"></asp:Label>：</td>
                                    <td class="formItemBgStyle" style="width: 20%; text-align: left;">
                                        <asp:TextBox ID="DLC_IssueDate" runat="server" CssClass="shuru" Width="100px"></asp:TextBox>
                                        <ajaxToolkit:CalendarExtender ID="CalendarExtender3" runat="server" Enabled="True" Format="yyyy-MM-dd" TargetControlID="DLC_IssueDate">
                                        </ajaxToolkit:CalendarExtender>
                                    </td>
                                    <td class="auto-style1" style="text-align: right;">
                                        <asp:Label ID="Label65" runat="server" Text="<%$ Resources:lang,QianFaRen%>"></asp:Label>：</td>
                                    <td class="formItemBgStyle" style="text-align: left;">
                                        <asp:TextBox ID="TB_Distribution" runat="server" CssClass="shuru"></asp:TextBox>
                                    </td>
                                    <td class="formItemBgStyle" style="width: 10%; text-align: right;">
                                        <asp:Label ID="Label66" runat="server" Text="<%$ Resources:lang,HuiShou%>"></asp:Label>：</td>
                                    <td class="formItemBgStyle" style="text-align: left;">
                                        <asp:DropDownList ID="ddl_IsBack" runat="server">
                                            <asp:ListItem Value="否" Text="<%$ Resources:lang,Fou%>" />
                                            <asp:ListItem Value="是" Text="<%$ Resources:lang,Shi%>" />
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td rowspan="1" style="text-align: right" class="auto-style2">
                                        <asp:Label ID="Label67" runat="server" Text="<%$ Resources:lang,DianZiBanLuJing%>"></asp:Label>： </td>
                                    <td colspan="5" rowspan="1" style="text-align: left" class="formItemBgStyle">
                                        <asp:Repeater ID="RP_SendGraph" runat="server">
                                            <ItemTemplate>
                                                <a href='<%# DataBinder.Eval(Container.DataItem,"FilePath") %>' target="_blank"></a>
                                            </ItemTemplate>
                                        </asp:Repeater>
                                        <asp:Label ID="lbl_FilePath" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td rowspan="1" style="text-align: right" class="auto-style2">
                                        <asp:Label ID="Label68" runat="server" Text="<%$ Resources:lang,FaTuJiHua%>"></asp:Label>： </td>
                                    <td colspan="5" rowspan="1" style="text-align: left" class="formItemBgStyle">
                                        <asp:TextBox ID="TB_FigurePlan" runat="server" Width="94%"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="text-align: right;" class="auto-style3">&nbsp;</td>
                                    <td colspan="5" style="text-align: left; height: 2px;" class="formItemBgStyle"></td>
                                </tr>
                            </table>
                        </div>

                        <div id="popwindow_footer" class="layui-layer-btn" style="border-top: 1px solid #ccc;">
                            <asp:LinkButton ID="LinkButton1" runat="server" class="layui-layer-btn notTab" OnClientClick="window.frames['IFrame_RelatedInformation'].document.getElementById('BT_SaveXMLFile').click()" OnClick="BT_NewSendFigureRegistration_Click" Text="<%$ Resources:lang,BaoCun%>"></asp:LinkButton><a class="layui-layer-btn notTab" onclick="return popClose();"><asp:Label ID="Label96" runat="server" Text="<%$ Resources:lang,GuanBi%>" /></a>
                        </div>
                        <span class="layui-layer-setwin"><a onclick="return popClose();" class="layui-layer-ico layui-layer-close layui-layer-close1 notTab" href="javascript:;"></a></span>
                    </div>


                    <div class="layui-layer layui-layer-iframe" id="popwindowReceiptRegistration"
                        style="z-index: 9999; width: 800px; height: 530px; position: absolute; overflow: hidden; display: none; border-radius: 10px;">
                        <div class="layui-layer-title" style="background: #e7e7e8;" id="popwindow_title">
                            <asp:Label ID="Label97" runat="server" Text="&lt;div&gt;&lt;img src=ImagesSkin/Update.png border=0 width=30px height=30px alt='BusinessForm' /&gt;&lt;/div&gt;"></asp:Label>
                        </div>
                        <div id="popwindow_content" class="layui-layer-content" style="text-align: left; overflow: auto; padding: 0px 5px 0px 5px;">

                            <table style="width: 100%;" cellpadding="2" cellspacing="0" class="formBgStyle">
                                <tr>
                                    <td style="width: 8%; text-align: right;" class="formItemBgStyle">
                                        <asp:Label ID="Label69" runat="server" Text="<%$ Resources:lang,LeiXing%>"></asp:Label>： </td>
                                    <td style="width: 20%; text-align: left;" class="formItemBgStyle">
                                        <asp:DropDownList ID="ddl_DocType1" runat="server">
                                        </asp:DropDownList>

                                        <asp:TextBox ID="LB_ReceiptRegistrationID" runat="server" Visible="false"></asp:TextBox>

                                    </td>
                                    <td style="text-align: right;" class="auto-style1">
                                        <asp:Label ID="Label70" runat="server" Text="<%$ Resources:lang,WenJianBianHao%>"></asp:Label>：</td>
                                    <td style="text-align: left;" class="formItemBgStyle">
                                        <asp:TextBox ID="TB_DocumentNo" runat="server" Width="120px" CssClass="shuru"></asp:TextBox>
                                    </td>
                                    <td style="width: 10%; text-align: right;" class="formItemBgStyle">
                                        <asp:Label ID="Label71" runat="server" Text="<%$ Resources:lang,WenJianMingCheng%>"></asp:Label>：</td>
                                    <td style="text-align: left;" class="formItemBgStyle">
                                        <asp:TextBox ID="TB_FileName1" runat="server" Width="150px" CssClass="shuru"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="formItemBgStyle" style="width: 8%; text-align: right;">
                                        <asp:Label ID="Label72" runat="server" Text="<%$ Resources:lang,FaWenBuMen%>"></asp:Label>：</td>
                                    <td class="formItemBgStyle" style="width: 20%; text-align: left;">
                                        <asp:TextBox ID="TB_DispatchDepartment" runat="server" CssClass="shuru" Width="120px"></asp:TextBox>
                                    </td>
                                    <td class="auto-style1" style="text-align: right;">
                                        <asp:Label ID="Label73" runat="server" Text="<%$ Resources:lang,FaWenQuXiang%>"></asp:Label>：</td>
                                    <td class="formItemBgStyle" style="text-align: left;">
                                        <asp:TextBox ID="TB_FileWay" runat="server" CssClass="shuru"></asp:TextBox>
                                    </td>
                                    <td class="formItemBgStyle" style="width: 10%; text-align: right;">
                                        <asp:Label ID="Label74" runat="server" Text="<%$ Resources:lang,XiaoHui%>"></asp:Label>：</td>
                                    <td class="formItemBgStyle" style="text-align: left;">
                                        <asp:DropDownList ID="ddl_IsDestroy" runat="server">
                                            <asp:ListItem Value="否" Text="<%$ Resources:lang,Fou%>" />
                                            <asp:ListItem Value="是" Text="<%$ Resources:lang,Shi%>" />
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td rowspan="2" style="text-align: right" class="formItemBgStyle">
                                        <asp:Label ID="Label75" runat="server" Text="<%$ Resources:lang,DianZiBan%>"></asp:Label>： </td>
                                    <td colspan="3" rowspan="2" style="text-align: left" class="formItemBgStyle">
                                        <asp:UpdatePanel ID="UpdatePanel3" runat="server" UpdateMode="Conditional">
                                            <ContentTemplate>
                                                <div>
                                                    <Upload:InputFile ID="AttachDocument" runat="server" Width="360px" />
                                                    <br />
                                                    <div id="Div1">
                                                        <Upload:ProgressBar ID="ProgressBar2" runat='server' Width="500px" Height="100px">
                                                        </Upload:ProgressBar>
                                                    </div>
                                                </div>
                                            </ContentTemplate>
                                            <Triggers>
                                                <asp:PostBackTrigger ControlID="BT_NewSendFigureRegistration" />
                                                <asp:PostBackTrigger ControlID="Button7" />
                                            </Triggers>
                                        </asp:UpdatePanel>
                                        <asp:HyperLink ID="HL_ReceiptRegistrationFile" runat="server"></asp:HyperLink>
                                    </td>
                                    <td style="text-align: right" class="formItemBgStyle">
                                        <asp:Label ID="Label76" runat="server" Text="<%$ Resources:lang,ShouWenRiQi%>"></asp:Label>：</td>
                                    <td style="text-align: left" class="formItemBgStyle">
                                        <asp:TextBox ID="DLC_CreateDate" runat="server" Width="100px" CssClass="shuru"></asp:TextBox>
                                        <ajaxToolkit:CalendarExtender ID="CalendarExtender1" runat="server" Format="yyyy-MM-dd" Enabled="True" TargetControlID="DLC_CreateDate">
                                        </ajaxToolkit:CalendarExtender>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="text-align: right" class="formItemBgStyle">
                                        <asp:Label ID="Label77" runat="server" Text="<%$ Resources:lang,ShouWenRen%>"></asp:Label>：</td>
                                    <td style="text-align: left" class="formItemBgStyle">
                                        <asp:TextBox ID="TB_Creator1" runat="server" Width="120px" CssClass="shuru"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="text-align: right; height: 2px;" class="formItemBgStyle">&nbsp;</td>
                                    <td colspan="5" style="text-align: left; height: 2px;" class="formItemBgStyle">
                                        <asp:Button ID="Button7" runat="server" CssClass="inpu"
                                            Text="<%$ Resources:lang,GuiDang%>" Enabled="False" OnClick="Button7_Click" />
                                    </td>
                                </tr>
                            </table>

                        </div>

                        <div id="popwindow_footer" class="layui-layer-btn" style="border-top: 1px solid #ccc;">
                            <asp:LinkButton ID="BT_NewSendFigureRegistration" runat="server" class="layui-layer-btn notTab" OnClientClick="window.frames['IFrame_RelatedInformation'].document.getElementById('BT_SaveXMLFile').click()" OnClick="BT_NewReceiptRegistration_Click" Text="<%$ Resources:lang,BaoCun%>"></asp:LinkButton><a class="layui-layer-btn notTab" onclick="return popClose();"><asp:Label ID="Label98" runat="server" Text="<%$ Resources:lang,GuanBi%>" /></a>
                        </div>
                        <span class="layui-layer-setwin"><a onclick="return popClose();" class="layui-layer-ico layui-layer-close layui-layer-close1 notTab" href="javascript:;"></a></span>
                    </div>


                    <div class="layui-layer layui-layer-iframe" id="popwindowIssueRegistration"
                        style="z-index: 9999; width: 800px; height: 530px; position: absolute; overflow: hidden; display: none; border-radius: 10px;">
                        <div class="layui-layer-title" style="background: #e7e7e8;" id="popwindow_title">
                            <asp:Label ID="Label99" runat="server" Text="&lt;div&gt;&lt;img src=ImagesSkin/Update.png border=0 width=30px height=30px alt='BusinessForm' /&gt;&lt;/div&gt;"></asp:Label>
                        </div>
                        <div id="popwindow_content" class="layui-layer-content" style="text-align: left; overflow: auto; padding: 0px 5px 0px 5px;">
                            <table style="width: 100%;" cellpadding="2" cellspacing="0" class="formBgStyle">
                                <tr>
                                    <td style="text-align: right;" class="auto-style1">
                                        <asp:Label ID="Label79" runat="server" Text="<%$ Resources:lang,WenJianMingCheng%>"></asp:Label>：</td>
                                    <td style="text-align: left;" class="auto-style2">
                                        <asp:DropDownList ID="ddl_DocumentNo" runat="server" DataValueField="DocumentNo" DataTextField="FileName" AutoPostBack="True" OnSelectedIndexChanged="ddl_DocumentNo_SelectedIndexChanged"></asp:DropDownList>
                                        <asp:Label ID="lbl_DocType1" runat="server" Visible="false"></asp:Label>
                                    </td>
                                    <td style="width: 10%; text-align: right;" class="formItemBgStyle">
                                        <asp:Label ID="Label80" runat="server" Text="<%$ Resources:lang,QianShouRen%>"></asp:Label>：</td>
                                    <td colspan="3" style="text-align: left;" class="formItemBgStyle">
                                        <asp:TextBox ID="TB_Recipients1" runat="server" Width="95%"></asp:TextBox>
                                        <asp:Label ID="LB_IssueRegistrationID" runat="server" Visible="false"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style2" style="text-align: right;">
                                        <asp:Label ID="Label81" runat="server" Text="<%$ Resources:lang,FenShu1%>"></asp:Label>：</td>
                                    <td class="formItemBgStyle" style="width: 20%; text-align: left;">
                                        <NickLee:NumberBox ID="NB_Attachments" runat="server" MaxAmount="1000000000000" MinAmount="-1000000000000" OnBlur="" OnFocus="" OnKeyPress="" PositiveColor="" Width="67px" Precision="0" CssClass="shuru">0</NickLee:NumberBox>
                                    </td>
                                    <td class="auto-style1" style="text-align: right;">
                                        <asp:Label ID="Label82" runat="server" Text="<%$ Resources:lang,LingQuBuMen%>"></asp:Label>：</td>
                                    <td class="formItemBgStyle" style="text-align: left;">
                                        <asp:TextBox ID="TB_ReceivingDepartment" runat="server" CssClass="shuru" Width="90%"></asp:TextBox>
                                    </td>
                                    <td class="formItemBgStyle" style="width: 10%; text-align: right;">
                                        <asp:Label ID="Label83" runat="server" Text="<%$ Resources:lang,HuiShou%>"></asp:Label>：</td>
                                    <td class="formItemBgStyle" style="text-align: left;">
                                        <asp:DropDownList ID="ddl_IsRecycle" runat="server">
                                            <asp:ListItem Value="否" Text="<%$ Resources:lang,Fou%>" />
                                            <asp:ListItem Value="是" Text="<%$ Resources:lang,Shi%>" />
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td rowspan="1" style="text-align: right" class="auto-style2">
                                        <asp:Label ID="Label84" runat="server" Text="<%$ Resources:lang,DianZiBanLuJing%>"></asp:Label>： </td>
                                    <td colspan="3" rowspan="1" style="text-align: left" class="formItemBgStyle">
                                        <asp:Repeater ID="RP_SendFile" runat="server">
                                            <ItemTemplate>
                                                <a href='<%# DataBinder.Eval(Container.DataItem,"FilePath") %>' target="_blank"></a>
                                            </ItemTemplate>
                                        </asp:Repeater>
                                        <asp:Label ID="lbl_FilePath1" runat="server"></asp:Label>
                                    </td>
                                    <td style="text-align: right" class="formItemBgStyle">
                                        <asp:Label ID="Label85" runat="server" Text="<%$ Resources:lang,FaFangRiQi%>"></asp:Label>：</td>
                                    <td style="text-align: left" class="formItemBgStyle">
                                        <asp:TextBox ID="DLC_IssuingDate" runat="server" Width="100px" CssClass="shuru"></asp:TextBox>
                                        <ajaxToolkit:CalendarExtender ID="CalendarExtender4" runat="server" Enabled="True" Format="yyyy-MM-dd" TargetControlID="DLC_IssuingDate">
                                        </ajaxToolkit:CalendarExtender>
                                    </td>
                                </tr>

                            </table>

                        </div>

                        <div id="popwindow_footer" class="layui-layer-btn" style="border-top: 1px solid #ccc;">
                            <asp:LinkButton ID="BT_NewIssueRegistration" runat="server" class="layui-layer-btn notTab" OnClientClick="window.frames['IFrame_RelatedInformation'].document.getElementById('BT_SaveXMLFile').click()" OnClick="BT_NewIssueRegistration_Click" Text="<%$ Resources:lang,BaoCun%>"></asp:LinkButton><a class="layui-layer-btn notTab" onclick="return popClose();"><asp:Label ID="Label100" runat="server" Text="<%$ Resources:lang,GuanBi%>" /></a>
                        </div>
                        <span class="layui-layer-setwin"><a onclick="return popClose();" class="layui-layer-ico layui-layer-close layui-layer-close1 notTab" href="javascript:;"></a></span>
                    </div>


                    <div class="layui-layer layui-layer-iframe" id="popwindowDocType"
                        style="z-index: 9999; width: 800px; height: 530px; position: absolute; overflow: hidden; display: none; border-radius: 10px;">
                        <div class="layui-layer-title" style="background: #e7e7e8;" id="popwindow_title">
                            <asp:Label ID="Label1" runat="server" Text="&lt;div&gt;&lt;img src=ImagesSkin/Update.png border=0 width=30px height=30px alt='BusinessForm' /&gt;&lt;/div&gt;"></asp:Label>
                        </div>
                        <div id="popwindow_content" class="layui-layer-content" style="text-align: center; overflow: auto; padding: 0px 5px 0px 5px;">

                            <table width="100%">
                                <tr>
                                    <td align="center">
                                        <table>
                                           
                                            <tr>
                                                <td style="text-align: right" class="formItemBgStyle">
                                                     <asp:Label ID="lbl_NewID" runat="server" Visible="False"></asp:Label><asp:Label ID="Label43" runat="server" Text="<%$ Resources:lang,FuJiMingCheng%>"></asp:Label>：</td>
                                                <td class="formItemBgStyle" style="text-align: left;">
                                                    <asp:DropDownList ID="ddl_ParentName" runat="server">
                                                    </asp:DropDownList>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="text-align: right" class="formItemBgStyle">
                                                    <asp:Label ID="Label44" runat="server" Text="<%$ Resources:lang,JieDianMingCheng%>"></asp:Label>：</td>
                                                <td class="formItemBgStyle" style="text-align: left;">
                                                    <asp:TextBox ID="txtClassificationName" runat="server" Width="100px"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="formItemBgStyle" style="text-align: right">
                                                    <asp:Label ID="Label45" runat="server" Text="<%$ Resources:lang,PaiXu%>"></asp:Label>：</td>
                                                <td class="formItemBgStyle" style="text-align: left;">
                                                    <asp:TextBox ID="txtSortNo" runat="server" ToolTip="大于或等于0的整数" Width="100px">0</asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="2" style="text-align: center" class="formItemBgStyle">
                                                    <asp:Button ID="BT_NewDocType" runat="server" Text="<%$ Resources:lang,XinJian%>" CssClass="inpu" Enabled="False" OnClick="BT_NewDocType_Click" />
                                                    &nbsp;&nbsp;<asp:Button ID="BT_UpdateDocType" runat="server" Enabled="False" CssClass="inpu" Text="<%$ Resources:lang,BaoCun%>" OnClick="BT_UpdateDocType_Click" />
                                                    &nbsp;&nbsp;<asp:Button ID="BT_DeleteDocType" runat="server" Enabled="False" CssClass="inpu" Text="<%$ Resources:lang,ShanChu%>" OnClick="BT_DeleteDocType_Click" /></td>
                                            </tr>
                                        </table>

                                    </td>
                                </tr>
                            </table>

                        </div>

                        <div id="popwindow_footer" class="layui-layer-btn" style="border-top: 1px solid #ccc;">
                            <a class="layui-layer-btn notTab" onclick="return popClose();">
                                <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,GuanBi%>" /></a>
                        </div>
                        <span class="layui-layer-setwin"><a onclick="return popClose();" class="layui-layer-ico layui-layer-close layui-layer-close1 notTab" href="javascript:;"></a></span>
                    </div>


                    <div class="layui-layer-shade" id="popwindow_shade" style="z-index: 9998; background-color: #000; opacity: 0.3; filter: alpha(opacity=30); display: none;"></div>




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
