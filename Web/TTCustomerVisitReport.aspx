<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTCustomerVisitReport.aspx.cs" Inherits="TTCustomerVisitReport" %>

<!DOCTYPE html>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
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

    <style type="text/css">
        .auto-style1 {
            width: 30%;
        }
    </style>

</head>
<body>
    <center>
        <form id="form1" runat="server">
            <%--  <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="True" EnableScriptLocalization="True">--%>
            <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="True" EnableScriptLocalization="True">
            </asp:ScriptManager>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <div>

                        <table style="width: 980px;">
                            <tr>
                                <td width="12%" style="text-align: right;">
                                    <asp:Label ID="Label17" runat="server" Text="经销商"></asp:Label>：</td>
                                <td align="left" width="25%">
                                    <asp:TextBox ID="TB_AgencyName" runat="server" Width="190px"></asp:TextBox>
                                </td>
                                <td style="text-align: right;" width="15%">
                                    <asp:Label ID="Label18" runat="server" Text="客户"></asp:Label>：</td>
                                <td align="left" class="auto-style1" colspan="3">
                                    <asp:TextBox ID="TB_CustomerName" runat="server" Width="99%"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td style="text-align: right;" width="12%">
                                    <asp:Label ID="Label19" runat="server" Text="联系人"></asp:Label>：</td>
                                <td align="left" width="25%">
                                    <asp:TextBox ID="TB_ContactName" runat="server" Width="190px"></asp:TextBox>
                                </td>
                                <td style="text-align: right;" width="12%">
                                    <asp:Label ID="Label1" runat="server" Text="联系方式"></asp:Label>：</td>
                                <td align="left" width="25%">
                                    <asp:TextBox ID="TB_ContactType" runat="server" Width="190px"></asp:TextBox>
                                </td>

                                <td style="text-align: right;" width="12%">
                                    <asp:Label ID="Label14" runat="server" Text="拜访方式"></asp:Label>：</td>
                                <td align="left" width="25%">
                                    <asp:DropDownList ID="DL_CustomerQuestionType" runat="server" CssClass="DDList" DataTextField="Type" DataValueField="Type">
                                    </asp:DropDownList>
                                </td>


                            </tr>
                            <tr>
                                <td style="text-align: right;" width="12%">
                                    <asp:Label ID="Label21" runat="server" Text="拜访时间从"></asp:Label>： </td>
                                <td align="left" width="25%">
                                    <asp:TextBox ID="DLC_VisitStartTime" runat="server" ReadOnly="false" Height="23px"></asp:TextBox>
                                    <ajaxToolkit:CalendarExtender ID="CalendarExtender3" runat="server" Format="yyyy-MM-dd" TargetControlID="DLC_VisitStartTime">
                                    </ajaxToolkit:CalendarExtender>
                                </td>
                                <td style="text-align: right;" width="12%">
                                    <asp:Label ID="Label13" runat="server" Text="到"></asp:Label>： </td>
                                <td align="left" width="25%">
                                    <asp:TextBox ID="DLC_VisitEndTime" runat="server" ReadOnly="false" Height="23px"></asp:TextBox>
                                    <ajaxToolkit:CalendarExtender ID="CalendarExtender1" runat="server" Format="yyyy-MM-dd" TargetControlID="DLC_VisitEndTime">
                                    </ajaxToolkit:CalendarExtender>
                                </td>
                                <td style="text-align: right;" width="12%">&nbsp;</td>
                                <td align="left" width="25%">&nbsp;</td>
                            </tr>
                            <tr>

                                <td style="text-align: right;" width="12%">
                                    <asp:Label ID="Label4" runat="server" Text="产品类型"></asp:Label>：</td>
                                <td align="left" width="25%">
                                    <asp:DropDownList ID="DL_IndustryType" runat="server" Width="120px" 
                                        DataTextField="Type" DataValueField="Type" >
                                    </asp:DropDownList>
                                </td>
                                <td style="text-align: right;">
                                    <asp:Label ID="Label23" runat="server" Text="受理人"></asp:Label>：
                                </td>
                                <td align="left">
                                    <asp:TextBox ID="TB_OperatorName" runat="server" Width="127px"></asp:TextBox>
                                </td>
                                <td style="text-align: right;">
                                    <asp:Label ID="Label8" runat="server" Text="是否商机"></asp:Label>：
                                </td>
                                <td align="left">
                                    <asp:DropDownList ID="DL_IsImportant" runat="server">
                                        <asp:ListItem Value="">--Select--</asp:ListItem>
                                        <asp:ListItem Value="NO">NO</asp:ListItem>
                                        <asp:ListItem Value="yes">YES</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                                </caption>
                            </tr>
                            <tr>

                                <td style="text-align: right;"></td>
                                <td align="left" colspan="2">
                                    <asp:Button ID="BT_Find" runat="server" CssClass="inpu" OnClick="BT_Find_Click" Text="<%$ Resources:lang,ChaXun%>" />
                                    &nbsp;<asp:Button ID="BT_Export" runat="server" CssClass="inpu" OnClick="BT_Export_Click" Text="<%$ Resources:lang,DaoChu%>" />
                                    &nbsp; </td>
                                <td><a href="#" onclick="preview1()">
                                    <img src="ImagesSkin/print.gif" alt="打印" border="0" /></a></td>
                            </tr>

                        </table>
                        <hr />
                        <!--startprint1-->
                        <table style="width: 99%;">
                            <tr>
                                <td style="width: 100%; height: 80px; font-size: xx-large; text-align: center;">
                                    <br />
                                    <asp:Label ID="LB_ReportName" runat="server" Text="客户拜访统计表"></asp:Label>
                                    <br />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="LB_DepartString" runat="server" Visible="false"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <table width="100%" border="0" cellpadding="0" align="center" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                        <tr>
                                            <td width="7">
                                                <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" />
                                            </td>
                                            <td>
                                                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                    <tr>

                                                        <td width="3%" align="center">
                                                            <strong>
                                                                <asp:Label ID="Label2" runat="server" Text="编号"></asp:Label></strong>
                                                        </td>
                                                        <td width="13%" align="center">
                                                            <strong>
                                                                <asp:Label ID="Label3" runat="server" Text="经销商"></asp:Label></strong>
                                                        </td>

                                                        <td width="13%" align="center">
                                                            <strong>
                                                                <asp:Label ID="Label25" runat="server" Text="客户"></asp:Label></strong>
                                                        </td>
                                                        <td width="9%" align="center">
                                                            <strong>
                                                                <asp:Label ID="Label5" runat="server" Text="联系人"></asp:Label></strong>
                                                        </td>
                                                        <td width="6%" align="center">
                                                            <strong>
                                                                <asp:Label ID="Label6" runat="server" Text="联系方式"></asp:Label></strong>
                                                        </td>
                                                        <td width="9%" align="center">
                                                            <strong>
                                                                <asp:Label ID="Label7" runat="server" Text="拜访时间"></asp:Label></strong>
                                                        </td>

                                                        <td width="8%" align="center">
                                                            <strong>
                                                                <asp:Label ID="Label9" runat="server" Text="拜访方式"></asp:Label></strong>
                                                        </td>
                                                        <td width="7%" align="center">
                                                            <strong>
                                                                <asp:Label ID="Label10" runat="server" Text="产品类型"></asp:Label></strong>
                                                        </td>
                                                        <td width="9%" align="center">
                                                            <strong>
                                                                <asp:Label ID="Label11" runat="server" Text="受理人"></asp:Label></strong>
                                                        </td>
                                                        <td width="5%" align="center">
                                                            <strong>
                                                                <asp:Label ID="Label12" runat="server" Text="是否商机"></asp:Label></strong>
                                                        </td>

                                                    </tr>
                                                </table>
                                            </td>
                                            <td width="6" align="right">
                                                <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" />
                                            </td>
                                        </tr>
                                    </table>
                                    <asp:DataGrid ID="DataGrid1" runat="server" AutoGenerateColumns="False"
                                        ShowHeader="false" Height="1px"
                                        Width="100%" CellPadding="4" ForeColor="#333333" GridLines="None">
                                        <Columns>

                                            <asp:BoundColumn DataField="ID" HeaderText="ID">
                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="3%" />
                                            </asp:BoundColumn>
                                            <asp:BoundColumn DataField="BelongAgencyName" HeaderText="经销商">
                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="13%" />
                                            </asp:BoundColumn>

                                            <asp:BoundColumn DataField="CustomerName" HeaderText="客户">
                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="13%" />
                                            </asp:BoundColumn>
                                            <asp:BoundColumn DataField="ContactPerson" HeaderText="联系人">
                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="9%" />
                                            </asp:BoundColumn>
                                            <asp:BoundColumn DataField="ContactType" HeaderText="联系方式">
                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="6%" />
                                            </asp:BoundColumn>
                                            <asp:BoundColumn DataField="SummitTime" HeaderText="拜访时间" DataFormatString="{0:yyyy/MM/dd}">
                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="9%" />
                                            </asp:BoundColumn>

                                            <asp:BoundColumn DataField="VisitType" HeaderText="拜访方式">
                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="8%" />
                                            </asp:BoundColumn>

                                            <asp:BoundColumn DataField="ProductType" HeaderText="产品类型">
                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="7%" />
                                            </asp:BoundColumn>

                                            <asp:BoundColumn DataField="OperatorName" HeaderText="受理人">
                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="9%" />
                                            </asp:BoundColumn>

                                            <asp:BoundColumn DataField="IsImportant" HeaderText="是否商机">
                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                            </asp:BoundColumn>

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
                        <!--endprint1-->
                    </div>
                </ContentTemplate>
                <Triggers>
                    <asp:PostBackTrigger ControlID="BT_Export" />
                </Triggers>
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
