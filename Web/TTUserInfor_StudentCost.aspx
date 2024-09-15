<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTUserInfor_StudentCost.aspx.cs" Inherits="TTUserInfor_StudentCost" %>

<%@ Register Assembly="NickLee.Web.UI" Namespace="NickLee.Web.UI" TagPrefix="NickLee" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Assembly="NickLee.Web.UI" Namespace="NickLee.Web.UI" TagPrefix="NickLee" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>学生收费</title>
    <link id="mainCss" href="css/bluelightmain.css" rel="stylesheet" type="text/css" />

    <script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="js/allAHandler.js"></script>
    <script type="text/javascript" src="js/layer/layer/layer.js"></script>
    <script type="text/javascript" src="js/popwindow.js"></script>
    <script type="text/javascript" language="javascript">
        $(function () { if (top.location != self.location) { } else { CloseWebPage(); }
            
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
                    <table id="AboveTable" cellpadding="0" width="100%" cellspacing="0">
                        <tr>
                            <td>
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
                                                                <td align="center" background="ImagesSkin/main_top_bj.jpg" class="titlezi">
                                                                    <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,BanJiShouFei%>"></asp:Label>
                                                                </td>
                                                                <td width="5">
                                                                    <%--<img src="ImagesSkin/main_top_r.jpg" width="5" height="31" alt="" />--%>
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

                                                    <td align="left" style="width: 20%">
                                                        <table class="formBgStyle" style="width: 98%; text-align: left;" cellpadding="3"
                                                            cellspacing="0">
                                                            <tr>
                                                                <td style="width: 25%; text-align: right" class="formItemBgStyle">
                                                                    <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,NianJi%>"></asp:Label>
                                                                </td>
                                                                <td class="formItemBgStyle">
                                                                    <asp:DropDownList ID="DDL_ProjectMemberGrade" runat="server" AutoPostBack="true" OnSelectedIndexChanged="DDL_ProjectMemberGrade_SelectedIndexChanged"></asp:DropDownList>
                                                                </td>

                                                            </tr>
                                                            <tr>
                                                                <td style="text-align: right" class="formItemBgStyle">
                                                                    <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,BanJi%>"></asp:Label>
                                                                </td>
                                                                <td class="formItemBgStyle">
                                                                    <asp:DropDownList ID="DDL_ProjectMemberClass" runat="server"></asp:DropDownList>
                                                                    <%--<br>
                                                                    <asp:Button ID="BT_Find" runat="server" CssClass="inpu" OnClick="BT_Find_Click" Text="查 询" />--%>
                                                                    
                                                                </td>
                                                            </tr>


                                                            <tr>
                                                                <td class="formItemBgStyle" colspan="3" style="text-align: center">
                                                                    <asp:Button ID="BT_Add" runat="server" OnClick="BT_Add_Click" CssClass="inpu" Text="<%$ Resources:lang,ShengChengShouFei%>" />
                                                            </tr>
                                                        </table>
                                                        <br />
                                                    </td>
                                                    <td>
                                                        <table width="100%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                                            <tr>
                                                                <td align="left" class="formItemBgStyle">
                                                                    <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,XueShengMingChen%>"></asp:Label>：<asp:TextBox ID="txt_Name" runat="server" Width="80px"></asp:TextBox>
                                                                </td>
                                                                <td align="left" class="formItemBgStyle" style="vertical-align: middle; text-align: center">
                                                                    <asp:Button ID="BT_Query" runat="server" CssClass="inpu" Text="<%$ Resources:lang,ChaXun%>" OnClick="BT_Query_Click" />
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td colspan="2">
                                                                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                        <tr>
                                                                            <td width="5%" align="center">
                                                                                <strong>
                                                                                    <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,XuHao%>"></asp:Label></strong>
                                                                            </td>
                                                                            <td width="15%" align="center">
                                                                                <strong>
                                                                                    <asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,XingMing%>"></asp:Label></strong>
                                                                            </td>
                                                                            <td width="15%" align="center">
                                                                                <strong>
                                                                                    <asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,BaoJiaoFei%>"></asp:Label></strong>
                                                                            </td>
                                                                            <td width="15%" align="center">
                                                                                <strong>
                                                                                    <asp:Label ID="Label8" runat="server" Text="<%$ Resources:lang,SanSiFei%>"></asp:Label></strong>
                                                                            </td>
                                                                            <td width="15%" align="center">
                                                                                <strong>
                                                                                    <asp:Label ID="Label9" runat="server" Text="<%$ Resources:lang,TuoGuanFei%>"></asp:Label></strong>
                                                                            </td>
                                                                            <td width="15%" align="center">
                                                                                <strong>
                                                                                    <asp:Label ID="Label10" runat="server" Text="<%$ Resources:lang,WaiChuHuoDongFei%>"></asp:Label></strong>
                                                                            </td>
                                                                            <td width="15%" align="center">
                                                                                <strong>
                                                                                    <asp:Label ID="Label11" runat="server" Text="<%$ Resources:lang,DaiShouDaiZhiShengHuoYongPingFei%>"></asp:Label></strong>
                                                                            </td>
                                                                        </tr>
                                                                    </table>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                        <asp:DataGrid ID="DataGrid1" runat="server" AutoGenerateColumns="False"
                                                            Width="100%" AllowPaging="false" PageSize="10"
                                                            ShowHeader="false" CellPadding="1" ForeColor="#333333" GridLines="None">
                                                            <Columns>
                                                                <%--<asp:BoundColumn DataField="ID" HeaderText="序号">
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                </asp:BoundColumn>--%>
                                                                <asp:TemplateColumn>
                                                                    <HeaderTemplate>
                                                                        <asp:Label ID="Label12" runat="server" Text="<%$ Resources:lang,XuHao%>"></asp:Label>
                                                                    </HeaderTemplate>
                                                                    <ItemTemplate>
                                                                        <%# Container.ItemIndex + 1%>
                                                                    </ItemTemplate>
                                                                </asp:TemplateColumn>
                                                                <asp:TemplateColumn HeaderText="姓名">
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="15%" />
                                                                    <ItemTemplate>
                                                                        <asp:Button ID="BT_SupplierID" runat="server" CssClass="inpu" Text='<%# DataBinder.Eval(Container.DataItem,"UserName") %>' />
                                                                    </ItemTemplate>
                                                                </asp:TemplateColumn>
                                                                <asp:BoundColumn DataField="WangFeePerSemester" HeaderText="保教费">
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="15%" />
                                                                </asp:BoundColumn>
                                                                <asp:BoundColumn DataField="Meals" HeaderText="膳费">
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="15%" />
                                                                </asp:BoundColumn>
                                                                <asp:BoundColumn DataField="CustodyAfterClass" HeaderText="托管费">
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="15%" />
                                                                </asp:BoundColumn>
                                                                <asp:BoundColumn DataField="ActivityCost" HeaderText="外出活动费用">
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="15%" />
                                                                </asp:BoundColumn>
                                                                <asp:BoundColumn DataField="ReplaceCosts" HeaderText="代收代支生活用品费">
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="15%" />
                                                                </asp:BoundColumn>
                                                            </Columns>
                                                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                            <EditItemStyle BackColor="#2461BF" />
                                                            <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                            <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />
                                                            
                                                            <ItemStyle CssClass="itemStyle" />
                                                        </asp:DataGrid>
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


                     <asp:Label ID="LB_DepartString" runat="server" Visible ="false"  ></asp:Label>
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
