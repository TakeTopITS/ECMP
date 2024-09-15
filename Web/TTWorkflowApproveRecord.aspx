<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTWorkflowApproveRecord.aspx.cs"
    Inherits="TTWorkflowApproveRecord" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link id="mainCss" href="css/bluelightmain.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="js/allAHandler.js"></script>
    <script type="text/javascript" language="javascript">
        $(function () {

            aHandler();

            var MustInFrame = '<%=Session["MustInFrame"].ToString() %>'.trim();
            if (MustInFrame == 'YES') {
                if (top.location != self.location) { } else { CloseWebPage(); }
            }

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
    <center>
        <form id="form1" runat="server">

                 <table cellpadding="0" cellspacing="0" width="100%" class="bian">
                <tr>
                    <td height="31" class="page_topbj">
                        <table width="96%" border="0" align="center" cellpadding="0" cellspacing="0">
                            <tr>
                                <td align="left">
                                    <table width="245" border="0" align="left" cellpadding="0" cellspacing="0">
                                        <tr>
                                            <td width="29">
                                                <%--<img src="Logo/main_top_l.jpg" alt="" width="29" height="31" />--%>
                                            </td>
                                            <td align="center" background="ImagesSkin/main_top_bj.jpg" class="titleziAPP">
                                                <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,ShenHeJiLu%>"></asp:Label>
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

                        <table width="100%">
                            <tr>
                                <td align ="center">
                                    <h3>
                                        <asp:Label ID="LB_WorkFlow" runat="server"></asp:Label></h3>
                                </td>
                            </tr>
                            <tr>
                                <td align="center">
                                   <asp:DataList ID="DataList1" runat="server" CellPadding="4" ForeColor="#333333" Width="800px">
                                        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                        <ItemStyle CssClass="itemStyle" />
                                        <SelectedItemStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                        <ItemTemplate>
                                            <table style="width: 100%; table-layout: fixed;">
                                                <tr>
                                                    <td align="left" style="color: Blue; font-style: italic; text-decoration: none; width: 300px;">
                                                       <b>  <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,BuZhou%>"></asp:Label>: <%# DataBinder.Eval(Container.DataItem,"SortNumber") %>&nbsp;<%# DataBinder.Eval(Container.DataItem,"StepName") %> </b> </td>
                                                    <td align="left" style="width: 35%; color: Blue; font-style: italic; text-decoration: none;">
                                                        <a href='TTUserInforSimple.aspx?UserCode=<%# DataBinder.Eval(Container.DataItem,"OperatorCode") %>' target="_blank" style="text-decoration: none;"><%# DataBinder.Eval(Container.DataItem,"OperatorName") %></a>&nbsp;&nbsp;<%# DataBinder.Eval(Container.DataItem,"CheckingTime") %></td>
                                                    <td align="left" style="color: Blue; font-style: italic; text-decoration: none;">

                                                        <a href='TTWorkFlowViewMain.aspx?WLID=<%# ShareClass.GetParentWorklowID(Eval("WLID").ToString()) %>' target="top.frames[0].frames[2].parent.frames['rightTabFrame']" style="text-decoration: none;">
                                                            <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,GuanlianHuLiuCheng%>"></asp:Label>:<%# ShareClass.GetParentWorklowID(Eval("WLID").ToString()) %></a></td>
                                                    <td align="left" style="color: Blue; font-style: italic; text-decoration: none;">
                                                        <a on href='TTWorkFlowViewMain.aspx?WLID=<%# ShareClass.GetChildWorklowIDByStepID(Eval("WLID").ToString(),Eval("StepID").ToString()) %>' target="top.frames[0].frames[2].parent.frames['rightTabFrame']" style="text-decoration: none;">
                                                            <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,GuanLianZiLiuCheng%>"></asp:Label>:<%# ShareClass.GetParentWorklowID(Eval("WLID").ToString()) %></a>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td colspan="4" style="text-overflow: ellipsis; word-break: keep-all; overflow: hidden;">
                                                        <%# DataBinder.Eval(Container.DataItem,"Operation") %>: <%# DataBinder.Eval(Container.DataItem,"OperatorCommand") %>
                                                    </td>
                                                </tr>
                                             <%--   <tr>
                                                    <td colspan="4" style="text-overflow: ellipsis; word-break: keep-all; overflow: hidden;"><a href='<%# DataBinder.Eval(Container.DataItem,"XMLFile") %> '>主表数据</a> &nbsp;&nbsp;&nbsp;&nbsp;<a href='<%# DataBinder.Eval(Container.DataItem,"DetailXMLFile") %> '>明细表数据</a>
                                                    </td>
                                                </tr>--%>
                                            </table>
                                            <br />
                                            <br />
                                        </ItemTemplate>
                                        <ItemStyle CssClass="itemStyle" />
                                        <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                    </asp:DataList>
                                </td>
                            </tr>
                            <tr>
                                <td style="text-align: right;">
                                    <asp:Label ID="LB_UserName" runat="server"
                                        Visible="False"></asp:Label>
                                    <asp:Label ID="LB_UserCode" runat="server"
                                        Visible="False"></asp:Label>
                                </td>
                            </tr>
                        </table>

                          <!--endprint1-->
                    </td>
                </tr>
            </table>
        </form>
    </center>
</body>
<script type="text/javascript" language="javascript">var cssDirectory = '<%=Session["CssDirectory"] %>'; var oLink = document.getElementById('mainCss'); oLink.href = 'css/' + cssDirectory + '/' + 'bluelightmain.css';</script></html>
