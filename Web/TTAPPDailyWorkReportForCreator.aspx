<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTAPPDailyWorkReportForCreator.aspx.cs" Inherits="TTAPPDailyWorkReportForCreator" %>

<meta name="viewport" content="width=device-width; initial-scale=1.0; maximum-scale=1.0; minimum-scale=0.1; user-scalable=1" />

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link id="mainCss" href="css/bluelightmain.css" rel="stylesheet" type="text/css" />
    <link id="flxappCss" href="css/flxapp.css" rel="stylesheet" type="text/css" />

    <script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>

    <style type="text/css">
        #AboveDiv {
            max-width: 1024px;
            width: expression (document.body.clientWidth >= 1024? "1024px" : "auto" ));
            min-width: 277px;
            width: expression (document.body.clientWidth <= 277? "277px" : "auto" ));
        }
    </style>

    <script type="text/javascript">
        function preview() {
            bdhtml = window.document.body.innerHTML;
            sprnstr = "<!--startprint-->";
            eprnstr = "<!--endprint-->";
            prnhtml = bdhtml.substr(bdhtml.indexOf(sprnstr) + 18);
            prnhtml = prnhtml.substring(0, prnhtml.indexOf(eprnstr));
            window.document.body.innerHTML = prnhtml;
            window.print();
            document.body.innerHTML = bdhtml;
            return false;
        }

        function setValue(m_strValue) {
            if (m_strValue != null && m_strValue != undefined) {
                txtReturnValue.value = m_strValue;
            }
        }
    </script>
    <script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="js/allAHandler.js"></script>
    <script type="text/javascript" language="javascript">
        $(function () {



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

                    <table id="AboveTable" cellpadding="0" width="100%" cellspacing="0" class="bian">
                        <tr>
                            <td>
                                <table cellpadding="0" cellspacing="0" border="0" width="100%">
                                    <tr>
                                        <td height="31" class="page_topbj">
                                            <table width="96%" border="0" align="center" cellpadding="0" cellspacing="0">
                                                <tr>
                                                    <td align="left">
                                                        <%--<a href="TTAppProject.aspx" onclick="javascript:document.getElementById('IMG_Waiting').style.display = 'block';">--%>
                                                        <a href="javascript:window.history.go(-1)" target="_top" onclick="javascript:document.getElementById('IMG_Waiting').style.display = 'block';">
                                                            <table width="245" border="0" align="left" cellpadding="0" cellspacing="0">
                                                                <tr>
                                                                    <td width="29">
                                                                        <img src="ImagesSkin/return.png" alt="" />
                                                                    </td>
                                                                    <td align="center" background="ImagesSkin/main_top_bj.jpg" class="titleziAPP">
                                                                        <asp:Label runat="server" Text="<%$ Resources:lang,Back%>" />
                                                                    </td>
                                                                    <td width="5">
                                                                        <%-- <img src="ImagesSkin/main_top_r.jpg" width="5" height="31" />--%>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                            <img id="IMG_Waiting" src="Images/Processing.gif" alt="请稍候，处理中..." style="display: none;" />
                                                        </a>
                                                    </td>
                                                    <td align="left" style="padding-top: 3px;">
                                                        <asp:ImageButton ID="IB_ProPlanGanttNew" CssClass="inpu" ImageUrl="ImagesSkin/plan.png" Width="32px" Height="32px" runat="server" OnClick="IB_ProPlanGanttNew_Click"></asp:ImageButton>

                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <!--startprint-->

                                            <table width="100%">
                                                <tr>
                                                   <td style="padding-left:10px;">
                                                        <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,XiangMu%>"></asp:Label>:
                                                            <asp:Label ID="LB_ProjectID" runat="server"></asp:Label>
                                                        <asp:Label ID="LB_ProjectName" runat="server"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                   <td style="padding-left:10px;">
                                                        <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,GongShi2%>"></asp:Label>: 
                                                            <asp:Label ID="LB_ConfirmManHour" runat="server"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="center">

                                                        <asp:DataList ID="DataList1" runat="server" CellPadding="0" DataKeyField="WorkID"
                                                            ShowHeader="false" Width="100%" BorderWidth="0">
                                                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                            <ItemTemplate>

                                                                <div class="napbox">
                                                                    <div class="npbx">
                                                                        <div class="cline"></div>

                                                                        <table cellpadding="4" cellspacing="0" width="100%">
                                                                            <tr>
                                                                                <td colspan="2" align="left" style="color: Blue; font-style: italic; font-size: 10pt">
                                                                                    <%#DataBinder .Eval (Container .DataItem ,"WorkID") %>
                                                                                    <%#DataBinder .Eval (Container .DataItem ,"UserName") %>
                                                                                    <%#DataBinder .Eval (Container .DataItem ,"WorkDate","{0:yyyy/MM/dd}") %>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td align="center" valign="top" style="width: 8%; padding-left: 5px" class="tdLeft">
                                                                                    <span style="font-size: 10pt">
                                                                                        <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,MeiRiZongJie%>"></asp:Label></span>
                                                                                </td>
                                                                                <td valign="top" style="text-align: left; padding-left: 5px"
                                                                                    class="tdLeft">
                                                                                    <span style="font-size: 9pt"><%#DataBinder .Eval (Container .DataItem ,"DailySummary") %></span></td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td align="center" valign="top" style="width: 8%; padding-left: 5px" class="tdLeft">
                                                                                    <span style="font-size: 10pt">
                                                                                        <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,ChengGuo%>"></asp:Label></span>
                                                                                </td>
                                                                                <td class="tdLeft" style="text-align: left; padding-left: 5px" valign="top">
                                                                                    <span style="font-size: 9pt"><%#DataBinder .Eval (Container .DataItem ,"Achievement") %></span>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td align="center" valign="top" style="width: 8%; padding-left: 5px" class="tdLeft">
                                                                                    <span style="font-size: 10pt">
                                                                                        <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,DiZhi%>"></asp:Label></span>
                                                                                </td>
                                                                                <td valign="top" style="text-align: left; padding-left: 5px"
                                                                                    class="tdLeft"><span style="font-size: 9pt"><%#DataBinder .Eval (Container .DataItem ,"Address") %></span></td>
                                                                            </tr>
                                                                        </table>


                                                                    </div>
                                                                </div>
                                                                </div>
                                                            </ItemTemplate>

                                                            <ItemStyle />
                                                            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                        </asp:DataList>

                                                    </td>
                                                </tr>
                                            </table>
                                            <!--endprint-->



                                        </td>
                                    </tr>
                                </table>
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
<script type="text/javascript" language="javascript">var cssDirectory = '<%=Session["CssDirectory"] %>'; var oLink = document.getElementById('mainCss'); oLink.href = 'css/' + cssDirectory + '/' + 'bluelightmain.css';</script>
</html>
