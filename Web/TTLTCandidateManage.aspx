<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTLTCandidateManage.aspx.cs" Inherits="TTLTCandidateManage" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link id="mainCss" href="css/bluelightmain.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        #AboveDiv {
            min-width: 1500px;
            width: expression (document.body.clientWidth <= 1500? "1500px" : "auto" ));
        }
    </style>

    <script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="js/allAHandler.js"></script>
    <script type="text/javascript" language="javascript">
        $(function () { if (top.location != self.location) { } else { CloseWebPage(); }

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
                                            <td align="left" width="175px">
                                                <table width="96%" border="0" align="left" cellpadding="0" cellspacing="0">
                                                    <tr>
                                                        <td width="29">
                                                            <%--<img src="Logo/main_top_l.jpg" alt="" width="29" height="31" />--%>
                                                        </td>
                                                        <td align="center" background="ImagesSkin/main_top_bj.jpg" class="titlezi">
                                                            <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,CandidateManagement%>"></asp:Label>
                                                        </td>
                                                        <td width="5">
                                                            <%--<img src="ImagesSkin/main_top_r.jpg" width="5" height="31" alt="" />--%>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                            <td align="left">
                                                <table>
                                                    <tr>

                                                        <td>
                                                            <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,XingMing%>"></asp:Label>：</td>
                                                        <td>
                                                            <asp:TextBox ID="TB_UserName" runat="server" Width="120px"></asp:TextBox>
                                                        </td>
                                                        <td>
                                                            <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,GongSi%>"></asp:Label>：</td>
                                                        <td>
                                                            <asp:TextBox ID="TB_Company" runat="server" Width="120px"></asp:TextBox>
                                                        </td>
                                                        <td>
                                                            <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,ZhiWu%>"></asp:Label>：</td>
                                                        <td>
                                                            <asp:TextBox ID="TB_CurrentDuty" runat="server" Width="120px"></asp:TextBox>
                                                        </td>
                                                        <td>
                                                            <asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,KeyWord%>"></asp:Label>：</td>
                                                        <td>
                                                            <asp:TextBox ID="TB_BriefKeyWord" runat="server" Width="250px"></asp:TextBox>
                                                        </td>
                                                        <td>
                                                            <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,ZhuangTai%>"></asp:Label>：</td>
                                                        <td>
                                                            <asp:DropDownList ID="DL_Status" runat="server">
                                                                <asp:ListItem Value="在职" Text="<%$ Resources:lang,ZaiZhi%>" />
                                                                <asp:ListItem Value="离职" Text="<%$ Resources:lang,LiZhi%>" />
                                                                <asp:ListItem Value="终止" Text="<%$ Resources:lang,ZhongZhi%>" />
                                                                <asp:ListItem />
                                                            </asp:DropDownList>
                                                        </td>
                                                        <td>
                                                            <asp:Button ID="BT_Find" runat="server" CssClass="inpu" OnClick="BT_Find_Click" Text="<%$ Resources:lang,ChaXun%>" />
                                                        </td>
                                                        <td>
                                                            <asp:Button ID="BT_ExportToExcel" runat="server" CssClass="inpu" Text="<%$ Resources:lang,DaoChuDaoExcel%>" OnClick="BT_ExportToExcel_Click" />
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                            <td></td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td valign="top">

                                    <table style="font-size: 10pt; width: 100%" cellpadding="0" cellspacing="0">
                                        <tr>
                                            <td align="center" valign="top">
                                                <table width="100%" cellpadding="0" cellspacing="0">
                                                    <tr>
                                                        <td style="width: 100%; padding: 5px 5px 5px 10px; text-align: left;" valign="top">
                                                            <asp:Label ID="LB_LTCandidateInformationOwner" runat="server"></asp:Label>
                                                            &nbsp;
                                                                    <asp:Label ID="LB_UserNumber" runat="server"></asp:Label>

                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="text-align: center; padding: 5px 5px 5px 5px;" valign="top">
                                                            <table width="100%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                                                <tr>
                                                                    <td width="7">
                                                                        <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" />
                                                                    </td>
                                                                    <td>
                                                                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                            <tr>

                                                                                <td width="8%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label8" runat="server" Text="<%$ Resources:lang,XingMing%>"></asp:Label></strong>
                                                                                </td>
                                                                                <td width="4%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label9" runat="server" Text="<%$ Resources:lang,XingBie%>"></asp:Label></strong>
                                                                                </td>
                                                                                <td width="4%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label10" runat="server" Text="<%$ Resources:lang,NianLing%>"></asp:Label></strong>
                                                                                </td>
                                                                                <td width="17%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,GongSi%>"></asp:Label></strong>
                                                                                </td>

                                                                                <td width="13%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label13" runat="server" Text="<%$ Resources:lang,ZhiWu%>"></asp:Label></strong>
                                                                                </td>

                                                                                <td width="8%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label15" runat="server" Text="<%$ Resources:lang,YiDongDianHua%>"></asp:Label></strong>
                                                                                </td>

                                                                                <td width="7%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label17" runat="server" Text="<%$ Resources:lang,JiaRuRiQi%>"></asp:Label></strong>
                                                                                </td>


                                                                                <td width="15%" align="center">
                                                                                    <strong></strong>
                                                                                </td>
                                                                                <td width="5%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label19" runat="server" Text="<%$ Resources:lang,ZhuangTai%>"></asp:Label></strong>
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
                                                                ShowHeader="false" Height="1px" OnPageIndexChanged="DataGrid1_PageIndexChanged"
                                                                PageSize="30" Width="100%" CellPadding="4" ForeColor="#333333" GridLines="None">
                                                                <Columns>

                                                                    <asp:HyperLinkColumn DataNavigateUrlField="UserName" DataNavigateUrlFormatString="TTLTCandidateInformationView.aspx?UserName={0}"
                                                                        DataTextField="UserName" HeaderText="姓名" Target="_blank">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                                    </asp:HyperLinkColumn>
                                                                    <asp:BoundColumn DataField="Gender" HeaderText="性别">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="4%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:BoundColumn DataField="Age" HeaderText="年龄">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="4%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:BoundColumn DataField="Company" HeaderText="公司">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="17%" />
                                                                    </asp:BoundColumn>

                                                                    <asp:BoundColumn DataField="CurrentDuty" HeaderText="职责">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="13%" />
                                                                    </asp:BoundColumn>

                                                                    <asp:BoundColumn DataField="MobilePhone" HeaderText="移动电话">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                                    </asp:BoundColumn>

                                                                    <asp:BoundColumn DataField="CreateTime" HeaderText="加入日期" DataFormatString="{0:yyyy/MM/dd}">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="7%" />
                                                                    </asp:BoundColumn>

                                                                    <asp:HyperLinkColumn DataNavigateUrlField="UserName" DataNavigateUrlFormatString="TTMakeCollaboration.aspx?RelatedType=CANDIDATE&RelatedCode={0}"
                                                                        Text="<%$ Resources:lang,CKJFBQTRXQHFQXZ%>" HeaderText="姓名" Target="_blank">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="15%" />
                                                                    </asp:HyperLinkColumn>

                                                                    <asp:TemplateColumn HeaderText="状态">
                                                                        <ItemTemplate>
                                                                            <%# ShareClass. GetStatusHomeNameByOtherStatus(Eval("Status").ToString()) %>
                                                                        </ItemTemplate>
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="5%" />
                                                                    </asp:TemplateColumn>
                                                                </Columns>

                                                                <ItemStyle CssClass="itemStyle" />
                                                                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                                <EditItemStyle BackColor="#2461BF" />
                                                                <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                                <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />
                                                            </asp:DataGrid>
                                                            <asp:Label ID="LB_Sql" runat="server" Visible="False"></asp:Label>
                                                            <asp:Label ID="LB_DepartString" runat="server" Visible="False"></asp:Label>
                                                            <asp:Label ID="LB_UserCode" runat="server" Font-Bold="False" Font-Size="9pt" Visible="False" Width="57px"></asp:Label>
                                                            <asp:Label ID="LB_UserName" runat="server" Font-Bold="False" Font-Size="9pt" Visible="False" Width="59px"></asp:Label>
                                                            <asp:Label ID="LB_DepartCode" runat="server" Visible="False"></asp:Label>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                            <td style="width: 220px; padding: 5px 0px 0px 5px; border-left: solid 1px #D8D8D8"
                                                valign="top" align="left">
                                                <asp:TreeView ID="TreeView1" runat="server" NodeWrap="True" OnSelectedNodeChanged="TreeView1_SelectedNodeChanged"
                                                    ShowLines="True" Width="220px">
                                                    <RootNodeStyle CssClass="rootNode" />
                                                    <NodeStyle CssClass="treeNode" />
                                                    <LeafNodeStyle CssClass="leafNode" />
                                                    <SelectedNodeStyle CssClass="selectNode" ForeColor ="Red" />
                                                </asp:TreeView>
                                            </td>
                                        </tr>
                                    </table>

                                </td>
                            </tr>
                        </table>
                    </div>
                </ContentTemplate>
                <Triggers>
                    <asp:PostBackTrigger ControlID="BT_ExportToExcel" />
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
<script type="text/javascript" language="javascript">var cssDirectory = '<%=Session["CssDirectory"] %>'; var oLink = document.getElementById('mainCss'); oLink.href = 'css/' + cssDirectory + '/' + 'bluelightmain.css';</script></html>
