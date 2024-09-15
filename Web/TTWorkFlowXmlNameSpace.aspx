<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTWorkFlowXmlNameSpace.aspx.cs"
    Inherits="TTWorkFlowXmlNameSpace" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link id="mainCss" href="css/bluelightmain.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/jquery-1.7.2.min.js"></script><script type="text/javascript" src="js/allAHandler.js"></script><script type="text/javascript" language="javascript">$(function () {if (top.location != self.location) { } else { CloseWebPage(); }});</script></head>
<body>
    <center>
        <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="True" EnableScriptLocalization="True">
        </asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
            
                <table width="789" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                    <tr>
                                        <td width="7"><img src="ImagesSkin/main_n_l.jpg" width="7" height="26" /></td>
                                        <td>
                                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                <tr>
                                                    <td width="10%" align="center">
                                                        <strong>
                                                            <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,XuHao%>"></asp:Label></strong>
                                                    </td>
                                                    
                                                    <td width="20%" align="center">
                                                        <strong>
                                                            <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,MingMingKongJian%>"></asp:Label></strong>
                                                    </td>
                                                    <td width="60%" align="center">
                                                        <strong>
                                                            <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,Zhi%>"></asp:Label> </strong>
                                                    </td>
                                                    <td width="10%" align="center">
                                                        <strong></strong>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                        <td width="6" align="right"><img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" /></td>
                                    </tr>
                                </table>
                <asp:DataGrid ID="DataGrid1" runat="server" AutoGenerateColumns="False" Height="1px" ShowHeader="false"
                    OnItemCommand="DataGrid1_ItemCommand" Width="789px" >
                    <ItemStyle CssClass="itemStyle" />
                    <Columns>
                        <asp:BoundColumn DataField="ID" HeaderText="ÐòºÅ">
                           <ItemStyle  CssClass="itemBorder"  HorizontalAlign="Center"  Width="10%" />
                        </asp:BoundColumn>
                        <asp:BoundColumn DataField="XmlNameSpaceName" HeaderText="ÃüÃû¿Õ¼ä">
                            <ItemStyle  CssClass="itemBorder"  HorizontalAlign="Center"  Width="20%" />
                        </asp:BoundColumn>
                        <asp:BoundColumn DataField="XmlNameSpaceValue" HeaderText="Öµ">
                            <ItemStyle  CssClass="itemBorder"  HorizontalAlign="Left"  Width="60%" />
                        </asp:BoundColumn>
                        <asp:TemplateColumn>
                            <ItemTemplate>
                                <asp:Button ID="BT_ID" runat="server" CssClass="inpu" Text='<%# DataBinder.Eval(Container.DataItem,"ID") %>' />
                            </ItemTemplate>
                            <ItemStyle  CssClass="itemBorder"  HorizontalAlign="Center"  Width="10%" />
                        </asp:TemplateColumn>
                    </Columns>
                    <HeaderStyle />
                </asp:DataGrid>&nbsp;
                <asp:Label ID="LB_UserCode" runat="server" Visible="False"></asp:Label>
                <asp:Label ID="LB_MakeUserCode" runat="server" Visible="False"></asp:Label>
                <asp:Label ID="LB_TemName" runat="server" Visible="False"></asp:Label>
                <table class="formBgStyle" cellpadding="3" cellspacing="0" style="width: 789px; text-align: left;">
                    <tr>
                        <td style="height: 24px; text-align: right" class="formItemBgStyle">
                            <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,BianHao%>"></asp:Label> 
                        </td>
                        <td style="width: 100px; height: 24px; text-align: left" class="formItemBgStyle">
                            <asp:Label ID="LB_ID" runat="server"></asp:Label>
                        </td>
                        <td style="font-size: 10pt; width: 100px; height: 24px; text-align: right" class="formItemBgStyle">
                            <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,MingMingKongJian%>"></asp:Label> 
                        </td>
                        <td style="width: 600px; height: 24px" class="formItemBgStyle">
                            &nbsp;<asp:TextBox ID="TB_NameSpace" runat="server" Width="289px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr style="font-size: 12pt">
                        <td style="text-align: right" class="formItemBgStyle">
                            <span style="font-size: 10pt">
                                <asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,ShuXing%>"></asp:Label> </span>
                        </td>
                        <td colspan="3" style="text-align: left" class="formItemBgStyle">
                            <asp:TextBox ID="TB_Attribute" runat="server" Height="19px" Width="679px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 80px; height: 17px" class="formItemBgStyle">
                        </td>
                        <td colspan="3" style="height: 17px" class="formItemBgStyle">
                            <asp:Button ID="BT_Add" runat="server" CssClass="inpu"  Enabled="False" OnClick="BT_Add_Click" Text="<%$ Resources:lang,XinZeng%>" />
                            &nbsp;<asp:Button ID="BT_Update" runat="server" CssClass="inpu"  Enabled="False" OnClick="BT_Update_Click"
                                Text="<%$ Resources:lang,BaoCun%>" />
                            &nbsp;<asp:Button ID="BT_Delete" runat="server" CssClass="inpu"  Enabled="False" OnClick="BT_Delete_Click" OnClientClick="return confirm(getDeleteMsgByLangCode())"
                                Text="<%$ Resources:lang,ShanChu%>" />
                        </td>
                    </tr>
                </table>
            </ContentTemplate>
        </asp:UpdatePanel>
        <div style="position: absolute; left: 50%; top: 50%;">
            <asp:UpdateProgress ID="TakeTopUp" runat="server" AssociatedUpdatePanelID="UpdatePanel1">
                <ProgressTemplate>
                    <img src="Images/Processing.gif" alt="Loading,please wait..." /></ProgressTemplate>
            </asp:UpdateProgress>
        </div>
        </form>
    </center>
</body>
<script type="text/javascript" language="javascript">var cssDirectory = '<%=Session["CssDirectory"] %>'; var oLink = document.getElementById('mainCss'); oLink.href = 'css/' + cssDirectory + '/' + 'bluelightmain.css';</script></html>
