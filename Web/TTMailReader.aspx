<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTMailReader.aspx.cs" Inherits="TTMailReader" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link id="mainCss" href="css/bluelightmain.css" rel="stylesheet" type="text/css" />
</head>
<body style="margin-left: 2; margin-top: 2;">
    <form id="form1" runat="server" method="post">
        <table cellpadding="0" cellspacing="0" width="100%" class="bian">
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
                                        <td align="center" background="ImagesSkin/main_top_bj.jpg" class="titlezi">、
                                             <asp:Label ID="LB_RunInvolvedProject" runat="server" Text="<%$ Resources:lang,ChaKanYouJian%>" />
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
                <td valign="top" style="padding: 10px 5px 10px 5px;">
                    <table width="98%" cellpadding="3" cellspacing="0" class="formBgStyle">
                        <tr>
                            <td style="width: 69px" align="right" class="formItemBgStyle"></td>
                            <td align="left" class="formItemBgStyle"><asp:Button ID="RecieverBtn" runat="server" Text="<%$ Resources:lang,HuiHu%>" CssClass="inpu" OnClick="RecieverBtn_Click" />&nbsp;
                            <asp:Button ID="TransferBtn" runat="server" Text="<%$ Resources:lang,ZhuanFa%>" CssClass="inpu" OnClick="TransferBtn_Click" />&nbsp;&nbsp;
                            <asp:Button ID="ReturnBtn" runat="server" Text="<%$ Resources:lang,FanHui%>" CssClass="inpu" OnClick="ReturnBtn_Click"
                                CausesValidation="False" />
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 69px" align="right" class="formItemBgStyle">
                                <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,FaJianRen%>" />

                            </td>
                            <td align="left" class="formItemBgStyle">
                                <asp:TextBox ID="From" runat="server" Width="300px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td align="right" class="formItemBgStyle">
                                <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,ShouJianRen%>" />

                            </td>
                            <td align="left" class="formItemBgStyle">
                                <asp:TextBox ID="To" runat="server" Width="300px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td align="right" class="formItemBgStyle">
                                <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,ChaoSong%>" />

                            </td>
                            <td align="left" class="formItemBgStyle">
                                <asp:TextBox ID="CC" runat="server" Width="300px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td align="right" class="formItemBgStyle">
                                  <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,ZhuTi%>" />
                                </td> 
                            <td align="left" class="formItemBgStyle">
                                <asp:TextBox ID="Title" runat="server" Width="300px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td align="right" class="formItemBgStyle">
                                <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,YouJianGeShi%>" />
                            </td>
                            <td align="left" class="formItemBgStyle">
                                &nbsp;<input id="HtmlCB" type="checkbox"  runat ="server" />HTML</td>
                        </tr>
                        <tr>
                            <td align="right" class="formItemBgStyle">
                                <asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,NeiRong%>" />
                            </td>
                            <td align="left" class="formItemBgStyle">
                                <%--  <div id="mess_box" style="width: 100%; height: 550px; overflow: auto;">--%>
                                <asp:DataList ID="DataList1" runat="server" CellPadding="4" ForeColor="#333333" Width="100%">
                                    
                                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                    <ItemStyle CssClass="itemStyle" />
                                    <ItemTemplate>
                                        <table style="width: 100%; table-layout: fixed;">
                                            <tr>
                                                <td style="width: 100%;">
                                                    <%# DataBinder.Eval(Container.DataItem, "Body")%>
                                                </td>
                                            </tr>
                                        </table>
                                    </ItemTemplate>
                                    <SelectedItemStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                </asp:DataList>
                                <%-- </div>--%>
                                <br />
                            </td>
                        </tr>
                    </table>
                    <br />
                    <asp:Panel ID="Panel_Attachment" runat="server" Style="width: 100%;" Visible="False">
                        <table width="98%" cellpadding="3" cellspacing="0" class="formBgStyle">
                            <tr>
                                <td style="width: 69px;" align="right" valign="top" class="formItemBgStyle">
                                    <asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,YouJianFuJian%>" />
                                </td>
                                <td align="left" class="formItemBgStyle">
                                    <table width="90%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                        <tr>
                                            <td width="7">
                                                <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" />
                                            </td>
                                            <td>
                                                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                    <tr>
                                                        <td width="70%" align="center">
                                                            <strong>

                                                                <asp:Label ID="Label8" runat="server" Text="<%$ Resources:lang,WenJianMing%>" />
                                                            </strong>
                                                        </td>
                                                        <td width="15%" align="center">
                                                            <strong>
                                                                <asp:Label ID="Label9" runat="server" Text="<%$ Resources:lang,WenJianLeiXing%>" />

                                                            </strong>
                                                        </td>
                                                        <td width="15%" align="center">
                                                            <strong>
                                                                <asp:Label ID="Label10" runat="server" Text="<%$ Resources:lang,WenJianDaXiao%>" />

                                                            </strong>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                            <td width="6" align="right">
                                                <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" />
                                            </td>
                                        </tr>
                                    </table>
                                    <asp:GridView ID="AttachView" runat="server" AutoGenerateColumns="False" Width="90%"
                                        DataKeyNames="AttachmentID" ShowHeader="false" CellPadding="4" ForeColor="#333333"
                                        GridLines="None">
                                        <FooterStyle ForeColor="White" BackColor="#507CD1" Font-Bold="True"></FooterStyle>
                                        <SelectedRowStyle Font-Bold="True" ForeColor="#333333" BackColor="#D1DDF1" BorderColor="CornflowerBlue" />
                                        <RowStyle CssClass="itemStyle" />
                                        <Columns>
                                            <asp:TemplateField HeaderText="文件名称">
                                                <ItemTemplate>
                                                    <a href='<%#DataBinder.Eval(Container.DataItem,"Url") %>' target="_blank">
                                                        <%#DataBinder.Eval(Container.DataItem,"Name") %></a>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Left" CssClass="itemBorder" Width="70%" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="文件类型">
                                                <ItemTemplate>
                                                    <%# DataBinder.Eval(Container.DataItem,"Type") %>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Center" CssClass="itemBorder" Width="15%" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="文件大小">
                                                <ItemTemplate>
                                                    <%# (int)DataBinder.Eval(Container.DataItem,"Contain")/1024 %>KB
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Center" CssClass="itemBorder" Width="15%" />
                                            </asp:TemplateField>
                                        </Columns>
                                        <AlternatingRowStyle BorderColor="CornflowerBlue" BackColor="White" BorderStyle="Solid"
                                            BorderWidth="1px" />
                                        <PagerStyle HorizontalAlign="Center" />
                                        <EditRowStyle BorderColor="CornflowerBlue" BorderWidth="1px" BackColor="#2461BF" />
                                    </asp:GridView>
                                    <br />
                                </td>
                            </tr>
                        </table>
                        <br />
                    </asp:Panel>
                    <br />
                </td>
            </tr>
        </table>
    </form>
</body>
<script type="text/javascript" language="javascript">var cssDirectory = '<%=Session["CssDirectory"] %>'; var oLink = document.getElementById('mainCss'); oLink.href = 'css/' + cssDirectory + '/' + 'bluelightmain.css';</script></html>
