<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTCarOilTypeRecord.aspx.cs" Inherits="TTCarOilTypeRecord" %>

<%@ Register Assembly="NickLee.Web.UI" Namespace="NickLee.Web.UI" TagPrefix="NickLee" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Assembly="Brettle.Web.NeatUpload" Namespace="Brettle.Web.NeatUpload" TagPrefix="Upload" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link id="mainCss" href="css/bluelightmain.css" rel="stylesheet" type="text/css" />
    <script src="js/jquery-1.7.2.min.js" type="text/javascript"></script>
    <script src="js/allAHandler.js" type="text/javascript"></script>
    <script language="javascript" type="text/javascript">
        $(function () { if (top.location != self.location) { } else { CloseWebPage(); }

        });
    </script>
    <script type="text/javascript">
        var disPostion = 0;
        function SaveScroll() {
            //disPostion = CarAssignListDivID.scrollTop;
        }

        function RestoreScroll() {
            //Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);
        }

        function EndRequestHandler(sender, args) {
            //CarAssignListDivID.scrollTop = disPostion;
        }
    </script>
</head>
<body>
    <center>
        <form id="form1" runat="server">
            <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="True" EnableScriptLocalization="True">
            </asp:ScriptManager>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <table id="AboveTable" cellpadding="0" width="100%" cellspacing="0" class="bian">
                        <tr>
                            <td height="31" class="page_topbj">
                                <table width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td align="left">
                                            <table width="345" border="0" align="left" cellpadding="0" cellspacing="0">
                                                <tr>
                                                    <td width="29">
                                                        <%--<img src="Logo/main_top_l.jpg" alt="" width="29" height="31" />--%>
                                                    </td>
                                                    <td align="center" background="ImagesSkin/main_top_bj.jpg" class="titlezi">
                                                        <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,CheLiangJiaYouJiLu%>"></asp:Label>
                                                    </td>
                                                    <td width="5">
                                                        <%--<img src="ImagesSkin/main_top_r.jpg" width="5" height="31" alt="" />--%>
                                                    </td>
                                                </tr>
                                            </table>
                                            <asp:Label ID="LB_UserCode" runat="server" Visible="false"></asp:Label>
                                            <asp:Label ID="LB_UserName" runat="server" Visible="false"></asp:Label>
                                            <asp:Label ID="LB_ID" runat="server" Visible="false"></asp:Label>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <table cellpadding="0" width="100%">
                                    <tr>
                                        <td valign="top" style="padding: 5px 5px 5px 5px;">
                                            <table width="100%">
                                                <tr>
                                                    <td width="400px" style="border-right: solid 1px #D8D8D8; padding: 5px 5px 5px 5px;">
                                                        <div id="CarAssignListDivID" style="width: 100%; height: 550px; overflow: auto;">
                                                            <table width="100%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                                                <tr>
                                                                    <td width="7">
                                                                        <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" alt="" />
                                                                    </td>
                                                                    <td>
                                                                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                            <tr>
                                                                                <td width="25%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,ChePaiHaoMa%>"></asp:Label></strong>
                                                                                </td>
                                                                                <td width="30%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,CheLiangMingCheng%>"></asp:Label></strong>
                                                                                </td>
                                                                                <td width="30%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,SuoShuBuMen%>"></asp:Label></strong>
                                                                                </td>
                                                                                <td width="15%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,ZhuangTai%>"></asp:Label></strong>
                                                                                </td>
                                                                            </tr>
                                                                        </table>
                                                                    </td>
                                                                    <td width="6" align="right">
                                                                        <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" />
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                            <asp:DataGrid ID="DataGrid1" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                                                                Height="1px" OnItemCommand="DataGrid1_ItemCommand" ShowHeader="False" PageSize="15"
                                                                OnPageIndexChanged="DataGrid1_PageIndexChanged" Width="100%" CellPadding="4"
                                                                ForeColor="#333333" GridLines="None">

                                                                <Columns>
                                                                    <asp:TemplateColumn HeaderText="车牌号">
                                                                        <ItemTemplate>
                                                                            <asp:Button ID="BT_CarCode" runat="server" CssClass="inpu" Text='<%# DataBinder.Eval(Container.DataItem,"CarCode").ToString().Trim() %>' />
                                                                        </ItemTemplate>
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="25%" />
                                                                    </asp:TemplateColumn>
                                                                    <asp:BoundColumn DataField="CarName" HeaderText="名称">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="30%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:BoundColumn DataField="BelongDepartCode" HeaderText="部门编码" Visible="false">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="1%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:BoundColumn DataField="BelongDepartName" HeaderText="所属部门">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="30%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:TemplateColumn HeaderText="状态">
                                                                        <ItemTemplate>
                                                                            <%# ShareClass. GetStatusHomeNameByOtherStatus(Eval("Status").ToString()) %>
                                                                        </ItemTemplate>
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="15%" />
                                                                    </asp:TemplateColumn>
                                                                </Columns>
                                                                <EditItemStyle BackColor="#2461BF" />
                                                                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                                <ItemStyle CssClass="itemStyle" />
                                                                <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />
                                                                <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                            </asp:DataGrid>
                                                        </div>
                                                    </td>
                                                    <td align="center">
                                                        <table border="1" style="width: 98%; border-collapse: collapse; margin: 0px auto;"
                                                            cellpadding="4" cellspacing="0">
                                                            <tr>
                                                                <td colspan="3" align="center" class="formItemBgStyle">
                                                                    <b>
                                                                        <asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,JiaYouJiLuDan%>"></asp:Label></b>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td colspan="2" align="center" class="formItemBgStyle">
                                                                    <table>
                                                                        <tr>
                                                                            <td align="right">
                                                                                <asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,ChePaiHaoMa%>"></asp:Label>：</td>
                                                                            <td colspan="1" align="left">
                                                                                <asp:Label ID="lbl_CarNo" runat="server"></asp:Label>
                                                                            </td>
                                                                            <td>
                                                                                <asp:Label ID="Label8" runat="server" Text="<%$ Resources:lang,SuoShuBuMen%>"></asp:Label>：</td>
                                                                            <td align="left">
                                                                                <asp:Label ID="lbl_DepartName" runat="server"></asp:Label>
                                                                            </td>
                                                                            <td align="right">
                                                                                <asp:Label ID="Label9" runat="server" Text="<%$ Resources:lang,YouLiao%>"></asp:Label>：</td>
                                                                            <td align="left">
                                                                                <asp:DropDownList ID="ddl_OilInformation" runat="server">
                                                                                </asp:DropDownList>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td align="right">
                                                                                <asp:Label ID="Label10" runat="server" Text="<%$ Resources:lang,JiaYouLiang%>"></asp:Label>： </td>
                                                                            <td>
                                                                                <NickLee:NumberBox ID="NB_OilVolume" runat="server" MaxAmount="1000000000000" MinAmount="-1000000000000" Width="80px">0.00</NickLee:NumberBox>
                                                                            </td>
                                                                            <td>
                                                                                <asp:Label ID="Label11" runat="server" Text="<%$ Resources:lang,DanJia%>"></asp:Label>：</td>
                                                                            <td>
                                                                                <NickLee:NumberBox ID="NB_OilPrice" runat="server" MaxAmount="1000000000000" MinAmount="-1000000000000" Width="80px">0.00</NickLee:NumberBox>
                                                                            </td>
                                                                            <td>
                                                                                <asp:Label ID="Label12" runat="server" Text="<%$ Resources:lang,JiaYouFei%>"></asp:Label>： </td>
                                                                            <td>
                                                                                <NickLee:NumberBox ID="NB_OilCharge" runat="server" MaxAmount="1000000000000" MinAmount="-1000000000000" Width="80px" Enabled="False">0.00</NickLee:NumberBox>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td colspan="6">
                                                                                <asp:Button ID="BT_UpdateDetail" runat="server" CssClass="inpu" OnClick="BT_UpdateDetail_Click" Text="<%$ Resources:lang,BaoCun%>" />
                                                                                <asp:Label ID="lbl_DepartCode" runat="server" Visible="False"></asp:Label>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td align="left" colspan="6">
                                                                                <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
                                                                                    <ContentTemplate>
                                                                                        <div>
                                                                                            <Upload:InputFile ID="FileUpload1" runat="server" Width="400px" />
                                                                                            <br />
                                                                                            <asp:Button ID="btn_ExcelToDataBase" runat="server" CssClass="inpu" Text="<%$ Resources:lang,DaoRuShuJu%>" OnClick="btn_ExcelToDataBase_Click" />
                                                                                            <div id="ProgressBar">
                                                                                                <Upload:ProgressBar ID="ProgressBar1" runat='server' Width="500px" Height="100px">
                                                                                                </Upload:ProgressBar>
                                                                                            </div>
                                                                                        </div>
                                                                                    </ContentTemplate>
                                                                                    <Triggers>
                                                                                        <asp:PostBackTrigger ControlID="btn_ExcelToDataBase" />
                                                                                    </Triggers>
                                                                                </asp:UpdatePanel>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td align="left" colspan="6">
                                                                                <asp:Label ID="Label13" runat="server" Text="<%$ Resources:lang,JYSJDRMBGS%>"></asp:Label>：<a href="Template/加油记录数据导入模版.rar"><asp:Label ID="Label14" runat="server" Text="<%$ Resources:lang,JYJLSJDRMB%>"></asp:Label></a></td>
                                                                        </tr>
                                                                    </table>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                        <br />
                                                        <table background="ImagesSkin/main_n_bj.jpg" border="0" cellpadding="0" cellspacing="0" width="100%">
                                                            <tr>
                                                                <td width="7">
                                                                    <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" alt="" />
                                                                </td>
                                                                <td>
                                                                    <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                                        <tr>
                                                                            <td align="center"><strong>
                                                                                <asp:Label ID="Label15" runat="server" Text="<%$ Resources:lang,ShiYouMingCheng%>"></asp:Label></strong></td>
                                                                            <td align="center"><strong>
                                                                                <asp:Label ID="Label16" runat="server" Text="<%$ Resources:lang,ShiYouXingHao%>"></asp:Label></strong></td>
                                                                            <td align="center"><strong>
                                                                                <asp:Label ID="Label17" runat="server" Text="<%$ Resources:lang,HaoYouShuLiang%>"></asp:Label></strong></td>
                                                                            <td align="center"><strong>
                                                                                <asp:Label ID="Label18" runat="server" Text="<%$ Resources:lang,YouDanJia%>"></asp:Label></strong></td>
                                                                            <td align="center"><strong>
                                                                                <asp:Label ID="Label19" runat="server" Text="<%$ Resources:lang,HaoYouJinE%>"></asp:Label></strong></td>
                                                                            <td width="10%"></td>
                                                                        </tr>
                                                                    </table>
                                                                </td>
                                                                <td align="right" width="6">
                                                                    <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" />
                                                                </td>
                                                            </tr>
                                                        </table>
                                                        <asp:DataGrid ID="DataGrid2" runat="server" AllowPaging="True" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" Height="1px" OnItemCommand="DataGrid2_ItemCommand" OnPageIndexChanged="DataGrid2_PageIndexChanged" PageSize="12" ShowHeader="False" Width="100%">
                                                            <Columns>
                                                                <asp:BoundColumn DataField="ID" HeaderText="序号" Visible="false">
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" />
                                                                </asp:BoundColumn>
                                                                <asp:BoundColumn DataField="OilName" HeaderText="石油名称">
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" />
                                                                </asp:BoundColumn>
                                                                <asp:BoundColumn DataField="Type" HeaderText="石油型号">
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" />
                                                                </asp:BoundColumn>
                                                                <asp:BoundColumn DataField="OilNum" HeaderText="耗油数量">
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" />
                                                                </asp:BoundColumn>
                                                                <asp:BoundColumn DataField="OilPrice" HeaderText="油单价">
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" />
                                                                </asp:BoundColumn>
                                                                <asp:BoundColumn DataField="OilMoney" HeaderText="耗油金额">
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" />
                                                                </asp:BoundColumn>
                                                                <asp:ButtonColumn CommandName="Delete" Text="&lt;div&gt;&lt;img src=ImagesSkin/icon_del.gif border=0 alt='删除' /&gt;&lt;/div&gt;">
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                </asp:ButtonColumn>
                                                            </Columns>

                                                            <ItemStyle CssClass="itemStyle" />
                                                            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                            <EditItemStyle BackColor="#2461BF" />
                                                            <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                            <PagerStyle />
                                                        </asp:DataGrid>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                </table>
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
