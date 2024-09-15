<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTProjectRelatedReq.aspx.cs"
    Inherits="TTProjectRelatedReq" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link id="mainCss" href="css/bluelightmain.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        #AboveDiv {
            min-width: 980px;
            width: expression (document.body.clientWidth <= 980? "980px" : "auto" ));
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
                        <table id="AboveTable" cellpadding="0" width="100%" cellspacing="0" class="bian">
                            <tr>
                                <td height="31" class="page_topbj">
                                    <table width="96%" border="0" align="center" cellpadding="0" cellspacing="0">
                                        <tr>
                                            <td align="left" width="145">
                                                <table width="345" border="0" align="left" cellpadding="0" cellspacing="0">
                                                    <tr>
                                                        <td width="29">
                                                            <%--<img src="Logo/main_top_l.jpg" alt="" width="29" height="31" />--%>
                                                        </td>
                                                        <td align="center" background="ImagesSkin/main_top_bj.jpg" class="titlezi">
                                                            <asp:Label ID="LB_tiRelatedReq" runat="server" Text="<%$ Resources:lang,RelatedReq%>"></asp:Label>
                                                        </td>
                                                        <td width="5">
                                                            <%-- <img src="ImagesSkin/main_top_r.jpg" width="5" height="31" />--%>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                            <td align="left">
                                                <table>
                                                    <tr>
                                                        <td style="padding-top: 3px;">(
                                                        </td>
                                                        <td style="padding-top: 5px;">
                                                            <asp:Label ID="LB_tiReqType" runat="server" Text="<%$ Resources:lang,Type%>"></asp:Label>：
                                                        </td>
                                                        <td style="padding-top: 5px;">
                                                            <asp:DropDownList ID="DL_ReqType" runat="server" DataTextField="ReqType" DataValueField="ReqType">
                                                            </asp:DropDownList>
                                                        </td>
                                                        <td style="padding-top: 5px;">
                                                            <asp:Button ID="BT_Find" runat="server" Text="<%$ Resources:lang,Find%>" CssClass="inpu" OnClick="BT_Find_Click" />
                                                        </td>
                                                        <td>
                                                            <asp:Button ID="BT_AllReq" runat="server" CssClass="inpuLong" OnClick="BT_AllReq_Click" Text="<%$ Resources:lang,AllReq%>" />
                                                        </td>
                                                        <td style="padding-top: 3px;">)
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
                                    <table style="width: 100%;">
                                        <tr>
                                            <td>
                                                <table style="width: 98%; margin-top: 5px">
                                                    <tr>
                                                        <td style="text-align: left;">
                                                            <asp:Label ID="LB_ReqType" runat="server"></asp:Label>&nbsp;
                                                        <asp:Label ID="LB_tbReqList" runat="server" Text="<%$ Resources:lang,ReqList%>"></asp:Label>:
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
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
                                                                                        <asp:Label ID="LB_dgReqID" runat="server" Text="<%$ Resources:lang,ID%>"></asp:Label></strong>
                                                                                </td>
                                                                                <td width="40%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="LB_dgReqName" runat="server" Text="<%$ Resources:lang,Name%>"></asp:Label></strong>
                                                                                </td>
                                                                                <td width="10%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="LB_dgFinishDate" runat="server" Text="<%$ Resources:lang,FinishTime%>"></asp:Label></strong>
                                                                                </td>
                                                                                <td width="10%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="LB_dgCreateTime" runat="server" Text="<%$ Resources:lang,CreateTime%>"></asp:Label></strong>
                                                                                </td>
                                                                                <td width="10%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="LB_dgApplicant" runat="server" Text="<%$ Resources:lang,Applicant%>"></asp:Label></strong>
                                                                                </td>
                                                                                <td width="10%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="LB_dgSatus" runat="server" Text="<%$ Resources:lang,Status%>"></asp:Label></strong>
                                                                                </td>
                                                                                <td width="10%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="LB_dgToTask" runat="server" Text="<%$ Resources:lang,ToTask%>"></asp:Label></strong>
                                                                                </td>
                                                                                <td align="center">
                                                                                    <strong></strong>
                                                                                </td>
                                                                                <%--   <td width="10%" align="center">
                                                                                    <strong></strong>
                                                                                </td>--%>
                                                                            </tr>
                                                                        </table>
                                                                    </td>
                                                                    <td width="6" align="right">
                                                                        <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" />
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                            <asp:DataGrid ID="DataGrid2" runat="server" AutoGenerateColumns="False" Height="1px"
                                                                ShowHeader="False" OnItemCommand="DataGrid2_ItemCommand" Width="100%" CellPadding="4"
                                                                ForeColor="#333333" GridLines="None">
                                                                <Columns>
                                                                    <asp:BoundColumn DataField="ReqID" HeaderText="编号">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:HyperLinkColumn DataNavigateUrlField="ReqID" DataNavigateUrlFormatString="TTProRelatedReqView.aspx?ReqID={0}"
                                                                        DataTextField="ReqName" HeaderText="名称" Target="_blank">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="40%" />
                                                                    </asp:HyperLinkColumn>
                                                                    <asp:BoundColumn DataField="ReqFinishedDate" HeaderText="需求日期" DataFormatString="{0:yyyy/MM/dd}">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:BoundColumn DataField="MakeDate" HeaderText="立项日期" DataFormatString="{0:yyyy/MM/dd}">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:HyperLinkColumn DataNavigateUrlField="ApplicantCode" DataNavigateUrlFormatString="TTUserInforSimple.aspx?UserCode={0}"
                                                                        DataTextField="ApplicantName" HeaderText="申请人" Target="_blank">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                    </asp:HyperLinkColumn>
                                                                    <asp:TemplateColumn HeaderText="状态">
                                                                        <ItemTemplate>
                                                                            <%# ShareClass. GetStatusHomeNameByOtherStatus(Eval("Status").ToString()) %>
                                                                        </ItemTemplate>
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="10%" />
                                                                    </asp:TemplateColumn>


                                                                    <asp:TemplateColumn>
                                                                        <ItemTemplate>
                                                                            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%#String.Format("TTReqToTask.aspx?ReqID={0}&ProjectID={1}",DataBinder.Eval(Container.DataItem,"ReqID"),DataBinder.Eval(Container.DataItem,"ProjectID")) %>'
                                                                                Target="_blank">
                                                                                <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,ZhuanChengRenWu%>"></asp:Label>
                                                                            </asp:HyperLink>
                                                                        </ItemTemplate>
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                    </asp:TemplateColumn>

                                                                    <asp:TemplateColumn>
                                                                        <ItemTemplate>

                                                                            <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl='<%# DataBinder.Eval(Container, "DataItem.ReqID", "TTReqRelatedDoc.aspx?ReqID={0}") %>'
                                                                                Target="_blank"><img src ="ImagesSkin/Doc.gif" class="noBorder" /></asp:HyperLink>
                                                                        </ItemTemplate>

                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" />
                                                                    </asp:TemplateColumn>

                                                                    <%--        <asp:ButtonColumn CommandName="Delete" Text="&lt;div&gt;&lt;img src=ImagesSkin/icon_del.gif border=0 alt='删除' /&gt;&lt;/div&gt;">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                    </asp:ButtonColumn>--%>
                                                                </Columns>
                                                                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                                <EditItemStyle BackColor="#2461BF" />
                                                                <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                                <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />

                                                                <ItemStyle CssClass="itemStyle" />
                                                            </asp:DataGrid>

                                                            <asp:Label ID="LB_UserCode" runat="server" Visible="False"></asp:Label><asp:Label ID="LB_UserName" runat="server"
                                                                Visible="False"></asp:Label>
                                                            <asp:Label ID="LB_ProjectID" runat="server" Visible="False"></asp:Label>
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
<script type="text/javascript" language="javascript">var cssDirectory = '<%=Session["CssDirectory"] %>'; var oLink = document.getElementById('mainCss'); oLink.href = 'css/' + cssDirectory + '/' + 'bluelightmain.css';</script></html>
