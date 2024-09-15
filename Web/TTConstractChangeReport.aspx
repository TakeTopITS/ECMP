<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTConstractChangeReport.aspx.cs" Inherits="TTConstractChangeReport" %>

<%@ Register Assembly="NickLee.Web.UI" Namespace="NickLee.Web.UI" TagPrefix="NickLee" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link id="mainCss" href="css/bluelightmain.css" rel="stylesheet" type="text/css" />

    <style type="text/css">
        #topNav {
            /*background-color:#096;*/
            z-index: 999;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            /*_position: absolute; /* for IE6 */ */
            /*_top: expression(documentElement.scrollTop + documentElement.clientHeight-this.offsetHeight); /* for IE6 */
            overflow: visible;
        }

        #bottomNav {
            /*background-color:#096;*/
            z-index: -2;
            position: relative;
            top: 225px;
            left: 0;
            width: 100%;
            /*_position: absolute; /* for IE6 */ */
            /*_top: expression(documentElement.scrollTop + documentElement.clientHeight-this.offsetHeight); /* for IE6 */
            overflow: visible;
        }
    </style>

    <script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="js/allAHandler.js"></script>
    <script type="text/javascript" language="javascript">
        $(function () {
            if (top.location != self.location) { } else { CloseWebPage(); }



        });

        function preview() {
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
            <%--  <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="True" EnableScriptLocalization="True">--%>
            <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="True" EnableScriptLocalization="True">
            </asp:ScriptManager>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <%--   <div id="topNav">--%>

                    <table cellpadding="3" cellspacing="0" class="formBgStyle" style="width: 900px;">
                        <tr>
                            <td style="width: 10%; text-align: right;" class="formItemBgStyle">
                                <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,HeTongHao%>"></asp:Label>：
                            </td>
                            <td width="20%" class="formItemBgStyle">
                                <asp:TextBox ID="TB_ConstractCode" runat="server" Width="99%"></asp:TextBox>
                            </td>
                            <td style="width: 10%; text-align: right;" class="formItemBgStyle">
                                <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,HeTongMingCheng%>"></asp:Label>：
                            </td>
                            <td align="center" class="formItemBgStyle" colspan="7">
                                <asp:TextBox ID="TB_ConstractName" runat="server" Width="99%"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td style="text-align: right;" class="formItemBgStyle">
                                <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,XiangMuMingCheng%>"></asp:Label>：
                            </td>
                            <td class="formItemBgStyle"  align="left">

                                <asp:TextBox ID="TB_ProjectName" runat="server" Width="99%"></asp:TextBox>

                            </td>

                            <td style="text-align: right;" class="formItemBgStyle">
                                <asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,KaiShiShiJian%>"></asp:Label>：
                            </td>
                            <td class="formItemBgStyle" align="left">
                                <asp:TextBox ID="DLC_StartTime" ReadOnly="false" runat="server" Width="139px"></asp:TextBox>
                                <ajaxToolkit:CalendarExtender Format="yyyy-MM-dd" ID="CalendarExtender2" runat="server" TargetControlID="DLC_StartTime">
                                </ajaxToolkit:CalendarExtender>
                            </td>
                            <td style="text-align: right;" class="formItemBgStyle">
                                <asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,JieShuShiJian%>"></asp:Label>：
                            </td>
                            <td class="formItemBgStyle" align="left">

                                <asp:TextBox ID="DLC_EndTime" ReadOnly="false" runat="server" Width="139px"></asp:TextBox>
                                <ajaxToolkit:CalendarExtender Format="yyyy-MM-dd" ID="CalendarExtender1" runat="server" TargetControlID="DLC_EndTime">
                                </ajaxToolkit:CalendarExtender>

                            </td>
                            <td class="formItemBgStyle" align="left">
                                <asp:Button ID="BT_Find" runat="server" CssClass="inpu" OnClick="BT_Find_Click" Text="<%$ Resources:lang,ChaXun%>" />
                            </td>
                           <td class="formItemBgStyle" align="left">
                               <a href="#" onclick="preview()">
                                <img src="ImagesSkin/print.gif" alt="打印" border="0" />
                            </a></td>
                        </tr>
                    </table>
                    <br />
                    <!--startprint1-->
                    <table width="1200px" cellpadding="0" cellspacing="0">
                        <tr>
                            <td colspan="5" style="width: 1200px; height: 80px; font-size: xx-large;" align="center">
                                <br />
                                <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,HeTongBianGengBaoBiao%>"></asp:Label>
                                <br />
                            </td>
                        </tr>
                    </table>
                    <table width="1200px" cellpadding="0" cellspacing="0">
                        <tr>
                            <td align="left">
                                <asp:Label ID="Label3" Text="<%$ Resources:lang,ZongFengShu%>" runat="server"></asp:Label>
                                :
                                <asp:Label ID="LB_CopyNumber" runat="server"></asp:Label>
                                &nbsp;&nbsp;&nbsp;<asp:Label ID="Label8" runat="server" Text="<%$ Resources:lang,BianGengZongE%>"></asp:Label>:
                                <asp:Label ID="LB_TotalChangeAmount" runat="server"></asp:Label>
                            </td>
                            <td style="text-align: right;">
                                <%-- <asp:Label ID="Label22" runat="server" Text="<%$ Resources:lang,YingShouZongE%>"></asp:Label>：<asp:Label ID="LB_ReceivablesAmount" runat="server"></asp:Label>
                                &nbsp;
                                <asp:Label ID="Label23" runat="server" Text="<%$ Resources:lang,ShiShouZongE%>"></asp:Label>：<asp:Label ID="LB_ReceiverAmount" runat="server"></asp:Label>

                                &nbsp;
                                <asp:Label ID="Label24" runat="server" Text="<%$ Resources:lang,WeiShouZongE%>"></asp:Label>：<asp:Label ID="LB_UNReceiveAmount" runat="server"></asp:Label>--%>

                                <asp:Label ID="LB_PrintTime" runat="server"></asp:Label>
                            </td>
                        </tr>
                    </table>
                    <%--<table width="1200px" cellpadding="0" cellspacing="0">
                        <tr>
                            <td>
                                <table width="100%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                    <tr>
                                        <td width="7">
                                            <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" /></td>
                                        <td>
                                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                <tr>
                                                    <td width="5%" align="center">
                                                        <strong>
                                                            <asp:Label ID="Label11" runat="server" Text="<%$ Resources:lang,BianHao%>"></asp:Label></strong>
                                                    </td>
                                                    <td width="8%" align="center">
                                                        <strong>
                                                            <asp:Label ID="Label12" runat="server" Text="<%$ Resources:lang,HeTongDaiMa%>"></asp:Label></strong>
                                                    </td>
                                                    <td width="12%" align="center">
                                                        <strong>
                                                            <asp:Label ID="Label13" runat="server" Text="<%$ Resources:lang,HeTongMingCheng%>"></asp:Label></strong>
                                                    </td>
                                                    <td width="8%" align="center">
                                                        <strong>
                                                            <asp:Label ID="Label14" runat="server" Text="所属项目"></asp:Label></strong>
                                                    </td>
                                                    <td width="8%" align="center">
                                                        <strong>
                                                            <asp:Label ID="Label15" runat="server" Text="所属部门"></asp:Label></strong>
                                                    </td>
                                                    <td width="7%" align="center">
                                                        <strong>
                                                            <asp:Label ID="Label16" runat="server" Text="变更内容"></asp:Label></strong>
                                                    </td>
                                                    <td width="7%" align="center">
                                                        <strong>
                                                            <asp:Label ID="Label17" runat="server" Text="变更方"></asp:Label></strong>
                                                    </td>
                                                    <td width="9%" align="center">
                                                        <strong>
                                                            <asp:Label ID="Label18" runat="server" Text="变更后金额"></asp:Label></strong>
                                                    </td>
                                                    <td width="10%" align="center">
                                                        <strong>
                                                            <asp:Label ID="Label19" runat="server" Text="合同金额"></asp:Label></strong>
                                                    </td>
                                                    <td width="8%" align="center">
                                                        <strong>
                                                            <asp:Label ID="Label20" runat="server" Text="甲方单位"></asp:Label></strong>
                                                    </td>
                                                    <td width="8%" align="center">
                                                        <strong>
                                                            <asp:Label ID="Label21" runat="server" Text="乙方单位"></asp:Label></strong>
                                                    </td>
                                                    <td width="8%" align="center">
                                                        <strong>
                                                            <asp:Label ID="Label25" runat="server" Text="变更额度"></asp:Label></strong>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                        <td width="6" align="right">
                                            <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" /></td>
                                    </tr>
                                </table>

                            </td>
                        </tr>
                    </table>--%>
                    <%--  </div>
                    <br />
                 
                    <div id="bottomNav">--%>
                    <table width="1200px" cellpadding="0" cellspacing="0">
                        <tr>
                            <td>
                                <asp:DataGrid ID="DataGrid1" runat="server" AutoGenerateColumns="False" ShowHeader="true"
                                    Height="1px" Width="100%"
                                    CellPadding="4" ForeColor="#333333" GridLines="Both">
                                    <Columns>
                                        <asp:BoundColumn DataField="ID" HeaderText="<%$ Resources:lang,BianHao%>" HeaderStyle-HorizontalAlign="Center">
                                            <ItemStyle HorizontalAlign="Center" Width="5%" />
                                        </asp:BoundColumn>
                                        <asp:BoundColumn DataField="ConstractCode" HeaderText="<%$ Resources:lang,HeTongDaiMa%>" HeaderStyle-HorizontalAlign="Center">
                                            <ItemStyle HorizontalAlign="Center" Width="8%" />
                                        </asp:BoundColumn>
                                        <asp:BoundColumn DataField="ConstractName" HeaderText="<%$ Resources:lang,HeTongMingCheng%>" HeaderStyle-HorizontalAlign="Center">
                                            <ItemStyle HorizontalAlign="Left" Width="12%" />
                                        </asp:BoundColumn>
                                        <asp:BoundColumn DataField="ProjectName" HeaderText="<%$ Resources:lang,SuoShuXiangMu%>" HeaderStyle-HorizontalAlign="Center">
                                            <ItemStyle HorizontalAlign="Left" Width="8%" />
                                        </asp:BoundColumn>
                                        <asp:BoundColumn DataField="DepartName" HeaderText="<%$ Resources:lang,SuoShuBuMen%>" HeaderStyle-HorizontalAlign="Center">
                                            <ItemStyle HorizontalAlign="center" Width="8%" />
                                        </asp:BoundColumn>
                                        <asp:BoundColumn DataField="ChangeContent" HeaderText="<%$ Resources:lang,BianGengNeiRong%>" HeaderStyle-HorizontalAlign="Center">
                                            <ItemStyle HorizontalAlign="Left" Width="7%" />
                                        </asp:BoundColumn>
                                        <asp:BoundColumn DataField="ChangeType" HeaderText="<%$ Resources:lang,BianGengFang%>" HeaderStyle-HorizontalAlign="Center">
                                            <ItemStyle HorizontalAlign="Left" Width="7%" />
                                        </asp:BoundColumn>
                                        <asp:BoundColumn DataField="AfterChangeAmount" HeaderText="<%$ Resources:lang,BianGengHaoJinE%>" HeaderStyle-HorizontalAlign="Center">
                                            <ItemStyle HorizontalAlign="Center" Width="9%" />
                                        </asp:BoundColumn>
                                        <asp:BoundColumn DataField="Amount" HeaderText="<%$ Resources:lang,HeTongJinE%>" HeaderStyle-HorizontalAlign="Center">
                                            <ItemStyle HorizontalAlign="Center" Width="10%" />
                                        </asp:BoundColumn>
                                        <asp:BoundColumn DataField="PartA" HeaderText="<%$ Resources:lang,JiaFang%>" HeaderStyle-HorizontalAlign="Center">
                                            <ItemStyle HorizontalAlign="Left" Width="8%" />
                                        </asp:BoundColumn>
                                        <asp:BoundColumn DataField="PartB" HeaderText="<%$ Resources:lang,YiFang%>" HeaderStyle-HorizontalAlign="Center">
                                            <ItemStyle HorizontalAlign="Left" Width="8%" />
                                        </asp:BoundColumn>
                                        <asp:BoundColumn DataField="ChangeBalance" HeaderText="<%$ Resources:lang,BianGengEDu%>" HeaderStyle-HorizontalAlign="Center">
                                            <ItemStyle HorizontalAlign="Center" Width="8%" />
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


                    <asp:Label ID="LB_UserCode" runat="server"
                        Visible="False"></asp:Label>
                    <asp:Label ID="LB_UserName" runat="server"
                        Visible="False"></asp:Label>
                    <asp:Label ID="LB_Sql" runat="server" Visible="False"></asp:Label>
                    <asp:Label ID="LB_DepartString" runat="server" Visible="False"></asp:Label>

                    <!--endprint1-->
                    <%--  </div>--%>
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
