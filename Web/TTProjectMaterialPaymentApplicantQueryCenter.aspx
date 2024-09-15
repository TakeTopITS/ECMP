<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTProjectMaterialPaymentApplicantQueryCenter.aspx.cs" Inherits="TTProjectMaterialPaymentApplicantQueryCenter" %>

<%@ Register Assembly="NickLee.Web.UI" Namespace="NickLee.Web.UI" TagPrefix="NickLee" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link id="mainCss" href="css/bluelightmain.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        /*#AboveDiv {
            min-width: 1200px;
            width: expression (document.body.clientWidth <= 1200? "1200px" : "auto" ));
        }*/
    </style>
    <script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="js/allAHandler.js"></script>
    <script type="text/javascript" src="js/layer/layer/layer.js"></script>
    <script type="text/javascript" src="js/popwindow.js"></script>
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
                                                            <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,WuZiCaiGouFuKuanChaXun%>"></asp:Label>
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
                                <td align="right" style="padding: 5px 5px 0px 5px;">
                                    <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
                                        <tr>
                                            <td align="center" style="padding-top: 4px;">
                                                <table>
                                                    <tr>
                                                        <td>
                                                            <asp:Label ID="Label66" runat="server" Text="<%$ Resources:lang,DanHao%>"></asp:Label></td>
                                                        <td>
                                                            <asp:TextBox ID="TB_AOCode" Width="100px" runat="server"></asp:TextBox>
                                                        </td>
                                                        <td>
                                                            <asp:Button ID="Button1" runat="server" CssClass="inpu" OnClick="BT_FindAOCode_Click" Text="<%$ Resources:lang,ChaXun%>" />
                                                        </td>
                                                        <td>
                                                            <asp:Label ID="Label62" runat="server" Text="<%$ Resources:lang,ShenQingRen%>"></asp:Label>
                                                        </td>
                                                        <td>
                                                            <asp:TextBox ID="TB_ApplicantName" Width="100px" runat="server"></asp:TextBox>
                                                        </td>
                                                        <td>
                                                            <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,XiangMu%>"></asp:Label>
                                                        </td>
                                                        <td>
                                                            <asp:TextBox ID="TB_ProjectName" Width="120px" runat="server"></asp:TextBox>
                                                        </td>
                                                        <td>
                                                            <asp:Label ID="Label65" runat="server" Text="<%$ Resources:lang,HeTongQianYueFang%>"></asp:Label>
                                                        </td>
                                                        <td>
                                                            <asp:TextBox ID="TB_SupplierName" runat="server" Width="120px"></asp:TextBox>
                                                        </td>
                                                        <td>
                                                            <asp:Label ID="Label63" runat="server" Text="<%$ Resources:lang,Cong%>"></asp:Label>
                                                        </td>
                                                        <td style="width: 120px;" align="left">
                                                            <asp:TextBox ID="DLC_StartTime" ReadOnly="false" runat="server" Width="90px"></asp:TextBox>
                                                            <ajaxToolkit:CalendarExtender Format="yyyy-MM-dd" ID="CalendarExtender1" runat="server" TargetControlID="DLC_StartTime">
                                                            </ajaxToolkit:CalendarExtender>
                                                        </td>
                                                        <td>
                                                            <asp:Label ID="Label64" runat="server" Text="<%$ Resources:lang,Dao%>"></asp:Label>
                                                        </td>
                                                        <td style="width: 120px;" align="left">
                                                            <asp:TextBox ID="DLC_EndTime" ReadOnly="false" runat="server" Width="90px"></asp:TextBox>
                                                            <ajaxToolkit:CalendarExtender Format="yyyy-MM-dd" ID="CalendarExtender4" runat="server" TargetControlID="DLC_EndTime">
                                                            </ajaxToolkit:CalendarExtender>
                                                        </td>
                                                        <td>
                                                            <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,ZhuangTai%>"></asp:Label>
                                                        </td>
                                                        <td>
                                                            <asp:DropDownList ID="DL_Status" runat="server">
                                                                <asp:ListItem Value="" Text="<%$ Resources:lang,SuoYou%>"></asp:ListItem>
                                                                <asp:ListItem Value="已记账" Text="<%$ Resources:lang,YiJiZhang%>" />
                                                                <asp:ListItem Value="新建" Text="<%$ Resources:lang,XinJian%>" />
                                                                <asp:ListItem Value="处理中" Text="<%$ Resources:lang,ShenPiZhong%>" />
                                                                <asp:ListItem Value="完成" Text="<%$ Resources:lang,WanCheng%>" />
                                                            </asp:DropDownList>

                                                        </td>
                                                        <td>
                                                            <asp:Button ID="BT_Find" runat="server" CssClass="inpu" OnClick="BT_Find_Click"
                                                                Text="<%$ Resources:lang,ChaXun%>" />
                                                        </td>

                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right" style="padding: 5px 5px 0px 5px;">
                                                <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
                                                    <tr>
                                                        <td align="center" style="padding-top: 4px;">
                                                            <table>
                                                                <tr>
                                                                    <td>
                                                                        <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,ZongJinE%>"></asp:Label>：

                                                                    </td>
                                                                    <td>
                                                                        <asp:Label ID="LB_TotalAmount" runat="server"></asp:Label>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="padding: 5px 5px 5px 5px;">
                                                            <table background="ImagesSkin/main_n_bj.jpg" border="0" cellpadding="0" cellspacing="0"
                                                                width="100%">
                                                                <tr>
                                                                    <td width="7">
                                                                        <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" />
                                                                    </td>
                                                                    <td>
                                                                        <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                                            <tr>

                                                                                <td align="center" width="5%">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label16" runat="server" Text="<%$ Resources:lang,BianHao%>"></asp:Label></strong>
                                                                                </td>
                                                                                <td align="center" width="10%">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label17" runat="server" Text="<%$ Resources:lang,DanHao%>"></asp:Label></strong>
                                                                                </td>

                                                                                <td align="center" width="15%">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label20" runat="server" Text="<%$ Resources:lang,XiangMu%>"></asp:Label></strong>
                                                                                </td>

                                                                                <td align="center" width="10%">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label18" runat="server" Text="<%$ Resources:lang,BenChiQingKuanJinE%>"></asp:Label></strong>
                                                                                </td>
                                                                                <td align="center" width="10%">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label19" runat="server" Text="<%$ Resources:lang,BiBie%>"></asp:Label></strong>
                                                                                </td>
                                                                                <td align="center" width="10%">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label167" runat="server" Text="<%$ Resources:lang,HeTongQianYueFang%>"></asp:Label></strong>
                                                                                </td>
                                                                                <td align="center" width="10%">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label171" runat="server" Text="<%$ Resources:lang,ChuangJianZhe%>"></asp:Label></strong>
                                                                                </td>
                                                                                <td align="center" width="10%">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label170" runat="server" Text="<%$ Resources:lang,CaiGouShiJian%>"></asp:Label></strong>
                                                                                </td>

                                                                                <td align="center" width="5%">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label21" runat="server" Text="<%$ Resources:lang,ZhuangTai%>"></asp:Label></strong>
                                                                                </td>

                                                                                <td align="center">&nbsp;</td>
                                                                            </tr>
                                                                        </table>
                                                                    </td>
                                                                    <td align="right" width="6">
                                                                        <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" />
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                            <asp:DataGrid ID="DataGrid5" runat="server" AutoGenerateColumns="False"
                                                                CellPadding="4" ForeColor="#333333" GridLines="None" Height="1px" ShowHeader="false" Width="100%">
                                                                <Columns>
                                                                    <asp:BoundColumn DataField="AOID" HeaderText="AOID">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:BoundColumn DataField="AOName" HeaderText="名称">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="10%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:BoundColumn DataField="ProjectName" HeaderText="名称">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="15%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:BoundColumn DataField="CurrentTotalPaymentAmount" HeaderText="总金额">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:BoundColumn DataField="CurrencyType" HeaderText="币别">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:BoundColumn DataField="PartA" HeaderText="合同签约方">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:HyperLinkColumn DataNavigateUrlField="UserCode" DataNavigateUrlFormatString="TTUserInforView.aspx?UserCode={0}"
                                                                        DataTextField="UserName" HeaderText="姓名" Target="_blank">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                    </asp:HyperLinkColumn>
                                                                    <asp:BoundColumn DataField="CreateTime" DataFormatString="{0:yyyy/MM/dd}" HeaderText="创建时间">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:TemplateColumn HeaderText="状态">
                                                                        <ItemTemplate>
                                                                            <%# ShareClass. GetStatusHomeNameByOtherStatus(Eval("Status").ToString()) %>
                                                                        </ItemTemplate>
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="5%" />
                                                                    </asp:TemplateColumn>

                                                                    <asp:TemplateColumn HeaderText="打印">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" />
                                                                        <ItemTemplate>
                                                                            <a href='TTProjectMaterialPaymentApplicantView.aspx?AOID=<%# DataBinder.Eval(Container.DataItem,"AOID") %>' target="_blank">
                                                                                <img src="ImagesSkin/print.gif" alt="打印" border="0" /></a>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateColumn>
                                                                </Columns>

                                                                <ItemStyle CssClass="itemStyle" />
                                                                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                                <EditItemStyle BackColor="#2461BF" />
                                                                <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                                <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />
                                                            </asp:DataGrid>
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

                    <asp:Label ID="LB_UserCode" runat="server" Visible="False"></asp:Label>
                    <asp:Label ID="LB_UserName" runat="server" Visible="False"></asp:Label>
                    <asp:Label ID="LB_DepartString" runat="server" Visible="False"></asp:Label>
                    <asp:Label ID="LB_Sql5" runat="server" Visible="False"></asp:Label>
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
