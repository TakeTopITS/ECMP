<%@ Page Language="C#" AutoEventWireup="true" EnableEventValidation="false" CodeFile="TTAllReq.aspx.cs"
    Inherits="TTAllReq" %>

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
                                                            <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,ChaKanSuoYouXuQiu%>"></asp:Label>
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
                                <td valign="top" align="left" width="100%">
                                    <table cellpadding="0" cellspacing="0" width="100%">
                                        <tr>
                                            <td valign="top">
                                                <table width="100%" cellpadding="0" cellspacing="0">
                                                    <tr>
                                                        <td valign="top">
                                                            <table style="width: 100%; margin-top: 5px" cellpadding="0" cellspacing="0">
                                                                <tr>
                                                                    <td valign="top">
                                                                        <table cellpadding="0" cellspacing="0" width="100%">
                                                                            <tr>
                                                                                <td align="left" class="tdFullBorder" style="padding-left: 20px; font-weight: bold; height: 24px; color: #394f66; background-image: url('ImagesSkin/titleBG.jpg')">
                                                                                    <table class="NoBorderTable" style="width: 100%">
                                                                                        <tr>
                                                                                            <td style="background: #f0f0f0; text-align: left; width: 510px; height: 25px;" colspan="2">
                                                                                                <asp:Label ID="LB_MyQueryScope" runat="server" Text="<%$ Resources:lang,MyQueryScope%>"></asp:Label>:<asp:Label
                                                                                                    ID="LB_QueryScope" runat="server" Font-Names="Arial,宋体" Font-Size="9pt"></asp:Label>
                                                                                            </td>
                                                                                            <td style="background: #f0f0f0; text-align: right; width: 300px; height: 25px;" colspan="2">
                                                                                                <asp:Label ID="LB_Operator" runat="server" Text="<%$ Resources:lang,Operator%>" />:
                                                                                          <asp:Label ID="LB_UserCode" runat="server" Visible="False"></asp:Label>
                                                                                                &nbsp;
                                                                                            <asp:Label ID="LB_UserName" runat="server" Font-Size="9pt"></asp:Label>
                                                                                            </td>
                                                                                        </tr>
                                                                                    </table>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td valign="top">
                                                                                    <table width="100%" style="margin-top: 5px">
                                                                                        <tr>
                                                                                            <td style="width: 220px; padding: 5px 0px 0px 5px;" valign="top" align="left">
                                                                                                <asp:TreeView ID="TreeView1" runat="server" NodeWrap="True" OnSelectedNodeChanged="TreeView1_SelectedNodeChanged"
                                                                                                    ShowLines="True" Width="220px">
                                                                                                    <RootNodeStyle CssClass="rootNode" />
                                                                                                    <NodeStyle CssClass="treeNode" />
                                                                                                    <LeafNodeStyle CssClass="leafNode" />
                                                                                                    <SelectedNodeStyle CssClass="selectNode" ForeColor="Red" />
                                                                                                </asp:TreeView>
                                                                                            </td>
                                                                                            <td valign="top" width="165px" style="padding: 5px 5px 0px 5px; border-left: solid 1px #D8D8D8; border-right: solid 1px #D8D8D8;">
                                                                                                <table width="100%" cellpadding="0" cellspacing="0">
                                                                                                    <tr>
                                                                                                        <td style="text-align: center; height: 30px;">
                                                                                                            <asp:Button ID="BT_AllReq" runat="server" CssClass="inpuLong" OnClick="BT_AllReq_Click"
                                                                                                                Text="<%$ Resources:lang,ChaXunSuoYouXuQiu%>" />
                                                                                                        </td>
                                                                                                    </tr>
                                                                                                    <tr>
                                                                                                        <td style="height: 2px; text-align: left">
                                                                                                            <table width="100%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                                                                                                <tr>
                                                                                                                    <td width="7">
                                                                                                                        <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" />
                                                                                                                    </td>
                                                                                                                    <td>
                                                                                                                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                                                                            <tr>
                                                                                                                                <td width="5%" align="center">
                                                                                                                                    <strong>
                                                                                                                                        <asp:Label ID="Label8" runat="server" Text="<%$ Resources:lang,BuMenChengYuan%>"></asp:Label></strong>
                                                                                                                                </td>
                                                                                                                            </tr>
                                                                                                                        </table>
                                                                                                                    </td>
                                                                                                                    <td width="6" align="right">
                                                                                                                        <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" />
                                                                                                                    </td>
                                                                                                                </tr>
                                                                                                            </table>
                                                                                                            <asp:DataGrid ID="DataGrid1" runat="server" AutoGenerateColumns="False" OnItemCommand="DataGrid1_ItemCommand"
                                                                                                                ShowHeader="false" Width="100%" Height="1px" CellPadding="4" ForeColor="#333333"
                                                                                                                GridLines="None">

                                                                                                                <ItemStyle CssClass="itemBorder" />
                                                                                                                <Columns>
                                                                                                                    <asp:TemplateColumn HeaderText="部门成员：">
                                                                                                                        <ItemTemplate>
                                                                                                                            <asp:Button ID="BT_UserCode" runat="server" CssClass="inpu" Text='<%# DataBinder.Eval(Container.DataItem,"UserCode") %>'
                                                                                                                                Style="text-align: center" />
                                                                                                                            <asp:Button ID="BT_UserName" runat="server" CssClass="inpu" Text='<%# DataBinder.Eval(Container.DataItem,"UserName") %>'
                                                                                                                                Style="text-align: center" />
                                                                                                                        </ItemTemplate>
                                                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" />
                                                                                                                    </asp:TemplateColumn>
                                                                                                                </Columns>
                                                                                                                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                                                                                <EditItemStyle BackColor="#2461BF" />
                                                                                                                <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                                                                                <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />
                                                                                                            </asp:DataGrid>
                                                                                                            <br />
                                                                                                        </td>
                                                                                                    </tr>
                                                                                                    <tr>
                                                                                                        <td style="text-align: center; height: 1px;" valign="top">
                                                                                                            <table width="100%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                                                                                                <tr>
                                                                                                                    <td width="7">
                                                                                                                        <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" />
                                                                                                                    </td>
                                                                                                                    <td>
                                                                                                                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                                                                            <tr>
                                                                                                                                <td width="5%" align="center">
                                                                                                                                    <strong>
                                                                                                                                        <asp:Label ID="Label9" runat="server" Text="<%$ Resources:lang,XuQiuZhuangTai%>"></asp:Label></strong>
                                                                                                                                </td>
                                                                                                                            </tr>
                                                                                                                        </table>
                                                                                                                    </td>
                                                                                                                    <td width="6" align="right">
                                                                                                                        <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" />
                                                                                                                    </td>
                                                                                                                </tr>
                                                                                                            </table>
                                                                                                            <asp:DataGrid ID="DataGrid2" runat="server" AutoGenerateColumns="False" OnItemCommand="DataGrid2_ItemCommand"
                                                                                                                ShowHeader="false" Width="100%" Height="2px" CellPadding="4" ForeColor="#333333"
                                                                                                                GridLines="None">
                                                                                                                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                                                                                <EditItemStyle BackColor="#2461BF" />
                                                                                                                <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                                                                                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                                                                                                <Columns>
                                                                                                                    <asp:TemplateColumn HeaderText="需求状态：">
                                                                                                                        <ItemTemplate>
                                                                                                                            <asp:Button ID="BT_Status" runat="server" Text='<%# DataBinder.Eval(Container.DataItem,"Status") %>'
                                                                                                                                CssClass="inpuLong" Visible="false" />
                                                                                                                            <asp:Button ID="BT_HomeName" runat="server" Text='<%# DataBinder.Eval(Container.DataItem,"HomeName") %>'
                                                                                                                                CssClass="inpuLong" />
                                                                                                                        </ItemTemplate>
                                                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" />
                                                                                                                    </asp:TemplateColumn>
                                                                                                                </Columns>
                                                                                                                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" HorizontalAlign="Left" />
                                                                                                            </asp:DataGrid>&nbsp;
                                                                                                        </td>
                                                                                                    </tr>
                                                                                                    <tr>
                                                                                                        <td align="center">&nbsp;<asp:Label ID="LB_OperatorCode" runat="server"
                                                                                                            Visible="False" Width="47px"></asp:Label>
                                                                                                            <asp:Label ID="LB_OperatorName" runat="server"
                                                                                                                Visible="False" Width="96px"></asp:Label>
                                                                                                        </td>
                                                                                                    </tr>
                                                                                                    <tr>
                                                                                                        <td style="border-right: solid 1px #D8D8D8; text-align: left">
                                                                                                            <asp:Label ID="LB_DepartCode" runat="server" Font-Bold="True"
                                                                                                                Visible="False"></asp:Label>
                                                                                                            <asp:Label ID="LB_DepartName" runat="server"
                                                                                                                Visible="False"></asp:Label>
                                                                                                            <asp:Label ID="LB_DepartString" runat="server" Visible="False"></asp:Label>
                                                                                                        </td>
                                                                                                    </tr>
                                                                                                </table>
                                                                                            </td>


                                                                                            <td valign="top">
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
                                                                                                                            <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,BianHao%>"></asp:Label></strong>
                                                                                                                    </td>
                                                                                                                    <td width="35%" align="center">
                                                                                                                        <strong>
                                                                                                                            <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,XuQiuMingCheng%>"></asp:Label></strong>
                                                                                                                    </td>
                                                                                                                    <td width="15%" align="center">
                                                                                                                        <strong>
                                                                                                                            <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,YaoQiuWanChengShiJian%>"></asp:Label></strong>
                                                                                                                    </td>
                                                                                                                    <td width="13%" align="center">
                                                                                                                        <strong>
                                                                                                                            <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,ShenQingRen%>"></asp:Label></strong>
                                                                                                                    </td>
                                                                                                                    <td width="17%" align="center">
                                                                                                                        <strong>
                                                                                                                            <asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,ShenQingShiJian%>"></asp:Label></strong>
                                                                                                                    </td>
                                                                                                                    <td width="8%" align="center">
                                                                                                                        <strong>
                                                                                                                            <asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,ZhuangTai%>"></asp:Label></strong>
                                                                                                                    </td>
                                                                                                                    <td width="4%"></td>
                                                                                                                </tr>
                                                                                                            </table>
                                                                                                        </td>
                                                                                                        <td width="6" align="right">
                                                                                                            <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" />
                                                                                                        </td>
                                                                                                    </tr>
                                                                                                </table>
                                                                                                <asp:DataGrid ID="DataGrid3" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                                                                                                    ShowHeader="false" OnPageIndexChanged="DataGrid3_PageIndexChanged" Width="100%"
                                                                                                    PageSize="25" CellPadding="4" ForeColor="#333333" GridLines="None">
                                                                                                    <Columns>
                                                                                                        <asp:BoundColumn DataField="ReqID" HeaderText="编号">
                                                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                                                                        </asp:BoundColumn>
                                                                                                        <asp:HyperLinkColumn DataNavigateUrlField="ReqID" DataNavigateUrlFormatString="TTReqView.aspx?ReqID={0}"
                                                                                                            DataTextField="ReqName" HeaderText="需求名称" Target="_blank">
                                                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="35%" />
                                                                                                        </asp:HyperLinkColumn>
                                                                                                        <asp:BoundColumn DataField="ReqFinishedDate" DataFormatString="{0:yyyy-MM-dd}" HeaderText="要求完成时间">
                                                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="15%" />
                                                                                                        </asp:BoundColumn>
                                                                                                        <asp:HyperLinkColumn DataNavigateUrlField="ApplicantCode" DataNavigateUrlFormatString="TTUserInforSimple.aspx?UserCode={0}"
                                                                                                            DataTextField="ApplicantName" HeaderText="申请人" Target="_blank">
                                                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="13%" />
                                                                                                        </asp:HyperLinkColumn>
                                                                                                        <asp:BoundColumn DataField="MakeDate" HeaderText="申请时间">
                                                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="17%" />
                                                                                                        </asp:BoundColumn>
                                                                                                        <%-- <asp:BoundColumn DataField="Status" HeaderText="状态">
                                                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                                                                        </asp:BoundColumn>--%>
                                                                                                        <asp:TemplateColumn HeaderText="状态">
                                                                                                            <ItemTemplate>
                                                                                                                <%# ShareClass.GetStatusHomeNameByRequirementStatus(Eval("Status").ToString()) %>
                                                                                                            </ItemTemplate>
                                                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="8%" />
                                                                                                        </asp:TemplateColumn>
                                                                                                        <asp:TemplateColumn>
                                                                                                            <ItemTemplate>
                                                                                                                <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# DataBinder.Eval(Container, "DataItem.ReqID", "TTDocumentTreeView.aspx?RelatedType=Req&RelatedID={0}") %>'
                                                                                                                    Target="_blank"><img src="ImagesSkin/Doc.gif" alt ="Folder Icon" class="noBorder"/></asp:HyperLink>
                                                                                                            </ItemTemplate>
                                                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="4%" />
                                                                                                        </asp:TemplateColumn>
                                                                                                    </Columns>

                                                                                                    <ItemStyle CssClass="itemStyle" />
                                                                                                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                                                                    <EditItemStyle BackColor="#2461BF" />
                                                                                                    <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                                                                    <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />
                                                                                                </asp:DataGrid>
                                                                                                <asp:Label ID="LB_Sql" runat="server" Visible="False"></asp:Label>
                                                                                                <br />
                                                                                            </td>
                                                                                        </tr>
                                                                                    </table>
                                                                                </td>
                                                                            </tr>
                                                                        </table>
                                                                    </td>
                                                                </tr>
                                                            </table>
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
