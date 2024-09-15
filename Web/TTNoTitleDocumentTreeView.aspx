<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTNoTitleDocumentTreeView.aspx.cs" Inherits="TTNoTitleDocumentTreeView" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link id="mainCss" href="css/bluelightmain.css" rel="stylesheet" type="text/css" />

    <style type="text/css">
        #AboveDiv {
            min-width: 1100px;
            width: expression (document.body.clientWidth <= 1100? "1100px" : "auto" ));
        }
    </style>

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
                                                            <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,XiangGuanWenDangLiuLan%>"></asp:Label>
                                                        </td>
                                                        <td width="5">
                                                            <%-- <img src="ImagesSkin/main_top_r.jpg" width="5" height="31" />--%></td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <table width="100%" cellpadding="0" cellspacing="0">
                                        <tr>
                                            <td width="220px" align="left" valign="top" style="padding: 5px 5px 0px 5px; border-right: solid 1px #D8D8D8">
                                                <asp:TreeView ID="TreeView1" runat="server" Width="220px" Font-Bold="False" Font-Names="宋体" Font-Size="10pt" NodeWrap="True"
                                                    OnSelectedNodeChanged="TreeView1_SelectedNodeChanged" ShowLines="True">
                                                    <RootNodeStyle CssClass="rootNode" />
                                                    <NodeStyle CssClass="treeNode" />
                                                    <LeafNodeStyle CssClass="leafNode" />
                                                    <SelectedNodeStyle CssClass="selectNode" ForeColor="Red" />
                                                </asp:TreeView>
                                            </td>
                                            <td style="padding 10px 5px 10px 5px;">
                                                <table cellpadding="0" cellspacing="0" width="100%" style="margin-top: 5px">
                                                    <tr>
                                                        <td style="width: 100%; height: 1px; text-align: left; padding: 5px 5px 5px 5px;">
                                                            <asp:Label ID="LB_FindCondition" runat="server" Font-Bold="False"></asp:Label>
                                                            <asp:Label ID="LB_Sql" runat="server" Visible="False"></asp:Label>
                                                            <asp:Label ID="LB_UserCode" runat="server" Visible="False"></asp:Label>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="width: 100%; height: 1px; text-align: left; padding: 5px 5px 5px 5px;">
                                                            <table width="100%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                                                <tr>
                                                                    <td width="7">
                                                                        <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" /></td>
                                                                    <td>
                                                                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                            <tr>

                                                                                <td width="7%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,XuHao%>"></asp:Label></strong>
                                                                                </td>
                                                                                <%--<td width="10%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,DaLei%>"></asp:Label></strong>
                                                                                </td>--%>
                                                                                <td width="10%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,LeiXing%>"></asp:Label></strong>
                                                                                </td>
                                                                                <td width="27%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,WenJianMing%>"></asp:Label></strong>
                                                                                </td>
                                                                                <td width="23%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label9" runat="server" Text="<%$ Resources:lang,MustBeUploadDoc%>"></asp:Label></strong>
                                                                                </td>
                                                                                <td width="10%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,ShangChuanZhe%>"></asp:Label></strong>
                                                                                </td>
                                                                                <td width="15%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,ShangChuanShiJian%>"></asp:Label></strong>
                                                                                </td>
                                                                                <td width="8%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label8" runat="server" Text="<%$ Resources:lang,XiangGuan%>"></asp:Label></strong>
                                                                                </td>
                                                                            </tr>
                                                                        </table>
                                                                    </td>
                                                                    <td width="6" align="right">
                                                                        <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" /></td>
                                                                </tr>
                                                            </table>
                                                            <asp:DataGrid runat="server" AllowPaging="False" AutoGenerateColumns="False" CellPadding="4"
                                                                ShowHeader="False" GridLines="None" ForeColor="#333333" Height="1px" Width="100%"
                                                                ID="DataGrid1">
                                                                <Columns>
                                                                    <asp:BoundColumn DataField="DocID" HeaderText="序号">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="7%" />
                                                                    </asp:BoundColumn>
                                                                    <%--   <asp:BoundColumn DataField="RelatedType" HeaderText="大类">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                    </asp:BoundColumn>--%>
                                                                    <asp:BoundColumn DataField="DocType" HeaderText="类型">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:HyperLinkColumn DataNavigateUrlField="Address" DataNavigateUrlFormatString="{0}"
                                                                        DataTextField="DocName" HeaderText="文件名" Target="_blank">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="27%" />
                                                                    </asp:HyperLinkColumn>
                                                                    <%--  <asp:BoundColumn DataField="MustUploadDoc" HeaderText="必传文件">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="23%" />
                                                                    </asp:BoundColumn>--%>
                                                                    <asp:TemplateColumn HeaderText="必传文件">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="LB_NoUploadDoc" runat="server" Text='<%# GetMustBeUploadDoc(Eval("DocID").ToString()) %>'></asp:Label>
                                                                        </ItemTemplate>
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="23%" />
                                                                    </asp:TemplateColumn>
                                                                    <asp:HyperLinkColumn DataNavigateUrlField="UploadManCode" DataNavigateUrlFormatString="TTUserInforSimple.aspx?UserCode={0}"
                                                                        DataTextField="UploadManName" HeaderText="上传者" Target="_blank">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                    </asp:HyperLinkColumn>
                                                                    <asp:BoundColumn DataField="UploadTime" HeaderText="上传时间">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="15%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:BoundColumn DataField="Address" Visible="False"></asp:BoundColumn>
                                                                    <asp:HyperLinkColumn DataNavigateUrlField="DocID" DataNavigateUrlFormatString="TTRelatedFormView.aspx?Type=Doc&ID={0}"
                                                                        DataTextField="RelatedID" HeaderText="相关" Target="_blank">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                                    </asp:HyperLinkColumn>
                                                                </Columns>

                                                                <EditItemStyle BackColor="#2461BF"></EditItemStyle>
                                                                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White"></FooterStyle>
                                                                <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />
                                                                <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333"></SelectedItemStyle>
                                                            </asp:DataGrid>
                                                            <asp:Label ID="LB_Count" runat="server"></asp:Label>

                                                            &nbsp;&nbsp;
                                                           <asp:Label ID="LB_TotalCount" runat="server"></asp:Label>
                                                        </td>
                                                    </tr>

                                                    <tr>
                                                        <td style="width: 100%; height: 1px; text-align: left; padding: 5px 5px 5px 5px;"></td>
                                                    </tr>

                                                    <tr id="TR_UnUploadForMustDocList" runat="server" >
                                                        <td style="width: 100%; height: 1px; text-align: left; padding: 5px 5px 5px 5px;">

                                                            <asp:Label ID="Label12" runat="server" Text="<%$ Resources:lang,YCMCDWD%>"></asp:Label>：
                                                            <table width="100%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                                                <tr>
                                                                    <td width="7">
                                                                        <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" /></td>
                                                                    <td>
                                                                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                            <tr>

                                                                                <td width="7%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,XuHao%>"></asp:Label></strong>
                                                                                </td>
                                                                                <%--<td width="10%" align="center">
                                                                                  <strong>
                                                                                      <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,DaLei%>"></asp:Label></strong>
                                                                              </td>--%>
                                                                                <td width="10%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label10" runat="server" Text="<%$ Resources:lang,LeiXing%>"></asp:Label></strong>
                                                                                </td>
                                                                                <td width="27%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label11" runat="server" Text="<%$ Resources:lang,WenJianMing%>"></asp:Label></strong>
                                                                                </td>
                                                                                <%--  <td width="23%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label12" runat="server" Text="<%$ Resources:lang,MustBeUploadDoc%>"></asp:Label></strong>
                                                                                </td>--%>
                                                                                <td width="10%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label13" runat="server" Text="<%$ Resources:lang,ShangChuanZhe%>"></asp:Label></strong>
                                                                                </td>
                                                                                <td width="15%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label14" runat="server" Text="<%$ Resources:lang,ShangChuanShiJian%>"></asp:Label></strong>
                                                                                </td>
                                                                                <td width="8%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label15" runat="server" Text="<%$ Resources:lang,XiangGuan%>"></asp:Label></strong>
                                                                                </td>
                                                                            </tr>
                                                                        </table>
                                                                    </td>
                                                                    <td width="6" align="right">
                                                                        <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" /></td>
                                                                </tr>
                                                            </table>
                                                            <asp:DataGrid runat="server" AllowPaging="False" AutoGenerateColumns="False" CellPadding="4"
                                                                ShowHeader="False" GridLines="None" ForeColor="#333333" Height="1px" Width="100%"
                                                                ID="DataGrid2">
                                                                <Columns>
                                                                    <asp:BoundColumn DataField="DocID" HeaderText="序号">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="7%" />
                                                                    </asp:BoundColumn>
                                                                    <%--   <asp:BoundColumn DataField="RelatedType" HeaderText="大类">
                                                                          <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                      </asp:BoundColumn>--%>
                                                                    <asp:BoundColumn DataField="DocType" HeaderText="类型">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:HyperLinkColumn DataNavigateUrlField="Address" DataNavigateUrlFormatString="{0}"
                                                                        DataTextField="DocName" HeaderText="文件名" Target="_blank">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="27%" />
                                                                    </asp:HyperLinkColumn>
                                                                    <%--  <asp:BoundColumn DataField="MustUploadDoc" HeaderText="必传文件">
                                                                          <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="23%" />
                                                                      </asp:BoundColumn>--%>
                                                                    <%-- <asp:TemplateColumn HeaderText="必传文件">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="LB_NoUploadDoc" runat="server" Text='<%# GetMustBeUploadDoc(Eval("DocID").ToString()) %>'></asp:Label>
                                                                        </ItemTemplate>
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="23%" />
                                                                    </asp:TemplateColumn>--%>
                                                                    <asp:HyperLinkColumn DataNavigateUrlField="UploadManCode" DataNavigateUrlFormatString="TTUserInforSimple.aspx?UserCode={0}"
                                                                        DataTextField="UploadManName" HeaderText="上传者" Target="_blank">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                    </asp:HyperLinkColumn>
                                                                    <asp:BoundColumn DataField="UploadTime" HeaderText="上传时间">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="15%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:BoundColumn DataField="Address" Visible="False"></asp:BoundColumn>
                                                                    <asp:HyperLinkColumn DataNavigateUrlField="DocID" DataNavigateUrlFormatString="TTRelatedFormView.aspx?Type=Doc&ID={0}"
                                                                        DataTextField="RelatedID" HeaderText="相关" Target="_blank">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                                    </asp:HyperLinkColumn>
                                                                </Columns>

                                                                <EditItemStyle BackColor="#2461BF"></EditItemStyle>
                                                                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White"></FooterStyle>
                                                                <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />
                                                                <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333"></SelectedItemStyle>
                                                            </asp:DataGrid>

                                                            &nbsp;&nbsp;
                                                            <asp:Label ID="LB_UnUploadMustDocCount" runat="server"></asp:Label>：
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
<script type="text/javascript" language="javascript">var cssDirectory = '<%=Session["CssDirectory"] %>'; var oLink = document.getElementById('mainCss'); oLink.href = 'css/' + cssDirectory + '/' + 'bluelightmain.css';</script>
</html>
