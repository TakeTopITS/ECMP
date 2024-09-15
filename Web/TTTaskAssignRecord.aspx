<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTTaskAssignRecord.aspx.cs"
    Inherits="TTTaskAssignRecord" %>

<%@ Register Assembly="NickLee.Web.UI" Namespace="NickLee.Web.UI" TagPrefix="NickLee" %>
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

        function preview1() {
            bdhtml = window.document.body.innerHTML;
            sprnstr = "<!--startprint1-->";
            eprnstr = "<!--endprint1-->";
            prnhtml = bdhtml.substr(bdhtml.indexOf(sprnstr) + 18);
            prnhtml = prnhtml.substring(0, prnhtml.indexOf(eprnstr));
            window.document.body.innerHTML = prnhtml;
            window.print();
            document.body.innerHTML = bdhtml;
            return false;
        }
    </script>

</head>
<body>
    <form id="form1" runat="server">
        <%--  <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="True" EnableScriptLocalization="True">--%>
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
                                                    <%--<img src="Logo/main_top_l.jpg" alt="" width="29" height="31" />--%>
                                                </td>
                                                <td align="center" background="ImagesSkin/main_top_bj.jpg" class="titlezi">
                                                    <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,SuoYouFenPaiJiLu%>"></asp:Label>
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

                            <table width="100%">
                                <tr>
                                    <td width="" align="right">
                                        <a href="#" onclick="preview1()">
                                            <img src="ImagesSkin/print.gif" alt="打印" border="0" />
                                        </a>
                                    </td>
                                </tr>
                            </table>
                            <br />

                            <!--startprint1-->
                            <table style="width: 98%" align="center">
                                <tr>
                                    <td style="width: 100%; text-align: center; height: 44px;">
                                        <br />
                                        <asp:Label ID="LB_Title" runat="server" Font-Bold="False" Font-Size="16pt"
                                            Font-Names="Arial,宋体"></asp:Label>
                                        <br />

                                        (<asp:HyperLink ID="HL_BusinessForm" runat="server" Text="<%$ Resources:lang,XiangGuanYeWuDan%>"></asp:HyperLink>)

                                        <br />

                                        <br />
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center">
                                        <asp:DataList ID="DataList2" runat="server" Width="100%"
                                            DataKeyField="ID" CellPadding="0" ForeColor="#333333">
                                            <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                            <ItemTemplate>
                                                <table width="100%" cellpadding="4" cellspacing="0" class="bian">
                                                    <tr>
                                                        <td style="width: 10%; text-align: right;">
                                                            <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,JiLuBianHao%>"></asp:Label>：
                                                        </td>
                                                        <td style="width: 20%; text-align: left;">
                                                            <%# DataBinder.Eval(Container.DataItem,"ID") %>
                                                        </td>
                                                        <td style="width: 10%; text-align: right;">
                                                            <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,LuXianBianHao%>"></asp:Label>：
                                                        </td>
                                                        <td style="width: 20%; text-align: left;">
                                                            <%# DataBinder.Eval(Container.DataItem,"RouteNumber") %>
                                                        </td>
                                                        <td style="width: 20%; text-align: right;">
                                                            <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,ZhuangTai%>"></asp:Label>：
                                                        </td>
                                                        <td style="width: 20%; font-size: 10pt; text-align: left;">
                                                            <%# DataBinder.Eval(Container.DataItem,"Status") %>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="text-align: right;">
                                                            <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,GongZuoYaoQiu%>"></asp:Label>：
                                                        </td>
                                                        <td colspan="3" style="text-align: left">
                                                            <b>
                                                                <%# DataBinder.Eval(Container.DataItem,"Operation") %>
                                                            </b>
                                                        </td>
                                                        <td colspan="2" style="text-align: left">
                                                            <a onclick="popShowByURL('TTRelatedDIYBusinessForm.aspx?RelatedType=TaskRecord&RelatedID=<%# DataBinder.Eval(Container.DataItem,"ID") %>&IdentifyString=<%# ShareClass.GetWLTemplateIdentifyString( ShareClass. getBusinessFormTemName("TaskRecord",Eval("ID").ToString ()))%>'>, 800, 600,window.location);" href='TTRelatedDIYBusinessForm.aspx?RelatedType=TaskRecord&RelatedID=<%# DataBinder.Eval(Container.DataItem,"ID") %>&TemName=<%#ShareClass. getBusinessFormTemName("TaskRecord",Eval("ID").ToString ())%>'>
                                                                <asp:Label ID="Label15" runat="server" Text="<%$ Resources:lang,XiangGuanYeWuDan%>"></asp:Label>
                                                            </a>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="text-align: right;">
                                                            <asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,KaiShiShiJian%>"></asp:Label>：
                                                        </td>
                                                        <td style="text-align: left;">
                                                            <%# DataBinder.Eval(Container.DataItem,"BeginDate","{0:yyyy/MM/dd}") %>
                                                        </td>
                                                        <td style="text-align: right;">
                                                            <asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,JieShuShiJian%>"></asp:Label>：
                                                        </td>
                                                        <td style="text-align: left;">
                                                            <%# DataBinder.Eval(Container.DataItem, "EndDate", "{0:yyyy/MM/dd}")%>
                                                        </td>
                                                        <td style="text-align: right;">
                                                            <asp:Label ID="Label8" runat="server" Text="<%$ Resources:lang,FenPaiRen%>"></asp:Label>：
                                                        </td>
                                                        <td style="text-align: left; font-size: 10pt">
                                                            <%# DataBinder.Eval(Container.DataItem,"AssignManName") %>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="text-align: right;">
                                                            <asp:Label ID="Label9" runat="server" Text="<%$ Resources:lang,ShouLiRen%>"></asp:Label>：
                                                        </td>
                                                        <td style="text-align: left;">
                                                            <%# DataBinder.Eval(Container.DataItem,"OperatorCode") %>
                                                            <%# DataBinder.Eval(Container.DataItem,"OperatorName") %>
                                                        </td>
                                                        <td style="text-align: right;">
                                                            <asp:Label ID="Label10" runat="server" Text="<%$ Resources:lang,ShouLiRenShiJian%>"></asp:Label>：
                                                        </td>
                                                        <td style="text-align: left;">
                                                            <%# DataBinder.Eval(Container.DataItem,"OperationTime","{0:yyyy/MM/dd}") %>
                                                        </td>
                                                        <td style="text-align: right;">
                                                            <asp:Label ID="Label11" runat="server" Text="<%$ Resources:lang,QianJiLu%>"></asp:Label>：
                                                        </td>
                                                        <td style="text-align: left; font-size: 10pt">
                                                            <%# DataBinder.Eval(Container.DataItem,"PriorID") %>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="text-align: right;">
                                                            <asp:Label ID="Label12" runat="server" Text="<%$ Resources:lang,FeiYong%>"></asp:Label>：</td>
                                                        <td style="text-align: left;"><%# DataBinder.Eval(Container.DataItem,"Expense") %></td>
                                                        <td style="text-align: right;">
                                                            <asp:Label ID="Label13" runat="server" Text="<%$ Resources:lang,WanChengChengDu%>"></asp:Label>：</td>
                                                        <td style="text-align: left;"><%# DataBinder.Eval(Container.DataItem,"finishPercent") %>%</td>
                                                        <td style="text-align: right;">&nbsp;</td>
                                                        <td style="text-align: left; font-size: 10pt">&nbsp;</td>
                                                    </tr>
                                                    <tr>
                                                        <td style="text-align: right">
                                                            <asp:Label ID="Label14" runat="server" Text="<%$ Resources:lang,GongZuoRiZhi%>"></asp:Label>：
                                                        </td>
                                                        <td colspan="5" style="text-align: left">
                                                            <b><%# DataBinder.Eval(Container.DataItem,"OperatorContent") %> </b>
                                                        </td>

                                                    </tr>
                                                    <tr>
                                                        <td colspan="6" style="height: 13px; text-align: right"></td>
                                                    </tr>
                                                </table>
                                            </ItemTemplate>
                                            <ItemStyle CssClass="itemStyle" />
                                            <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                        </asp:DataList>
                                    </td>
                                </tr>
                            </table>
                            <br />
                            <table id="Table_Material" runat="server" style="width: 98%" align="center">
                                <tr>
                                    <td align="left">
                                        <asp:Label ID="Label37" runat="server" Text="<%$ Resources:lang,LingYongPeiJian%>"></asp:Label>： </td>
                                </tr>
                                <tr>
                                    <td>
                                        <table width="100%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                            <tr>
                                                <td width="7">
                                                    <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" /></td>
                                                <td>
                                                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                        <tr>
                                                            <td width="10%" align="center"><strong>
                                                                <asp:Label ID="Label38" runat="server" Text="<%$ Resources:lang,BianHao%>"></asp:Label></strong> </td>
                                                            <td width="20%" align="center"><strong>
                                                                <asp:Label ID="Label39" runat="server" Text="<%$ Resources:lang,ShangPinMing%>"></asp:Label></strong> </td>
                                                            <td width="10%" align="center"><strong>
                                                                <asp:Label ID="Label40" runat="server" Text="<%$ Resources:lang,XingHao%>"></asp:Label></strong> </td>
                                                            <td width="20%" align="center"><strong>
                                                                <asp:Label ID="Label41" runat="server" Text="<%$ Resources:lang,GuiGe%>"></asp:Label></strong> </td>
                                                            <td width="10%" align="center"><strong>
                                                                <asp:Label ID="Label42" runat="server" Text="<%$ Resources:lang,ShuLiang%>"></asp:Label></strong> </td>
                                                            <td width="10%" align="center"><strong>
                                                                <asp:Label ID="Label43" runat="server" Text="<%$ Resources:lang,DanWei%>"></asp:Label></strong> </td>
                                                            <td width="10%" align="center"><strong>
                                                                <asp:Label ID="Label44" runat="server" Text="<%$ Resources:lang,YiChuKu%>"></asp:Label></strong> </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                                <td width="6" align="right">
                                                    <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" /></td>
                                            </tr>
                                        </table>
                                        <asp:DataGrid runat="server" AutoGenerateColumns="False" ShowHeader="False"
                                            Height="30px" Width="100%" ID="DataGrid11">

                                            <Columns>
                                                <asp:BoundColumn DataField="ID" HeaderText="编号">
                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                </asp:BoundColumn>
                                                <asp:BoundColumn DataField="GoodsName" HeaderText="物料名">
                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="20%" />
                                                </asp:BoundColumn>
                                                <asp:BoundColumn DataField="ModelNumber" HeaderText="型号">
                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                </asp:BoundColumn>
                                                <asp:BoundColumn DataField="Spec" HeaderText="规格">
                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="20%" />
                                                </asp:BoundColumn>
                                                <asp:BoundColumn DataField="Number" HeaderText="数量">
                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                </asp:BoundColumn>
                                                <asp:BoundColumn DataField="Unit" HeaderText="单位">
                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                </asp:BoundColumn>
                                                <asp:BoundColumn DataField="CheckOutNumber" HeaderText="已出库">
                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                </asp:BoundColumn>
                                            </Columns>
                                            <ItemStyle CssClass="itemStyle"></ItemStyle>
                                            <PagerStyle HorizontalAlign="Center"></PagerStyle>
                                        </asp:DataGrid><asp:Label ID="Label16" runat="server"
                                            Visible="False"></asp:Label><asp:Label ID="Label2" runat="server" Visible="False"></asp:Label><asp:Label ID="Label3" runat="server"
                                                Visible="False"></asp:Label></td>
                                </tr>

                            </table>
                <!--endprint1-->
                <br />
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
    </center>
</body>
<script type="text/javascript" language="javascript">var cssDirectory = '<%=Session["CssDirectory"] %>'; var oLink = document.getElementById('mainCss'); oLink.href = 'css/' + cssDirectory + '/' + 'bluelightmain.css';</script></html>
