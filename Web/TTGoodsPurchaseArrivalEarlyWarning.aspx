<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTGoodsPurchaseArrivalEarlyWarning.aspx.cs" Inherits="TTGoodsPurchaseArrivalEarlyWarning" %>

<%@ Register Assembly="NickLee.Web.UI" Namespace="NickLee.Web.UI" TagPrefix="NickLee" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>

    <style type="text/css">
        #AboveDiv {
            min-width: 1200px;
            width: expression (document.body.clientWidth <= 1200? "1200px" : "auto" ));
        }

        .auto-style1 {
            width: 45%;
        }
    </style>

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
                                                            <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,CaiGouDaoHuoYuJing%>"></asp:Label>
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
                                    <table style="width: 100%;">
                                        <tr>
                                            <td style="width: 100%; text-align: left;">
                                                <table style="width: 98%;">
                                                    <tr>
                                                        <td style="text-align: right;" width="12%">
                                                            <asp:Label ID="Label25" runat="server" Text="<%$ Resources:lang,GongYingShangMingCheng%>"></asp:Label>：</td>
                                                        <td align="left" width="25%">
                                                            <asp:TextBox ID="TB_VendorName" runat="server" Width="99%"></asp:TextBox>
                                                        </td>
                                                        <td style="text-align: left;" colspan="3">
                                                            <asp:DropDownList ID="DL_VendorList" runat="server" AutoPostBack="true" DataTextField="VendorName" DataValueField="VendorCode" OnSelectedIndexChanged="DL_VendorList_SelectedIndexChanged">
                                                            </asp:DropDownList>
                                                        </td>

                                                    </tr>
                                                    <tr>
                                                        <td style="text-align: right;" width="12%">
                                                            <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,DaiMa%>"></asp:Label>
                                                            ：</td>
                                                        <td align="left" width="25%">
                                                            <asp:TextBox ID="TB_GoodsCode" runat="server" Width="190px"></asp:TextBox>
                                                        </td>
                                                        <td style="text-align: right;" width="15%">
                                                            <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,MingCheng%>"></asp:Label>
                                                            ：</td>
                                                        <td align="left" width="20%">
                                                            <asp:TextBox ID="TB_GoodsName" runat="server" Width="99%"></asp:TextBox>
                                                        </td>
                                                        <td align="right" width="5%">&nbsp;</td>
                                                    </tr>
                                                    <tr>
                                                        <td style="text-align: right;" width="12%">
                                                            <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,XingHao%>"></asp:Label>：</td>
                                                        <td align="left" width="25%">
                                                            <asp:TextBox ID="TB_ModelNumber" runat="server" Width="190px"></asp:TextBox>
                                                        </td>
                                                        <td style="text-align: right;" width="15%">
                                                            <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,GuiGe%>"></asp:Label>：</td>
                                                        <td align="left" colspan="2">
                                                            <asp:TextBox ID="TB_Spec" runat="server" Width="99%"></asp:TextBox>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="text-align: right;" width="10%">
                                                            <asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,KaiShiShiJian%>"></asp:Label>： </td>
                                                        <td>
                                                            <asp:TextBox ID="DLC_StartTime" runat="server" ReadOnly="false"></asp:TextBox>
                                                            <ajaxToolkit:CalendarExtender ID="CalendarExtender2" runat="server" Format="yyyy-MM-dd" TargetControlID="DLC_StartTime">
                                                            </ajaxToolkit:CalendarExtender>
                                                        </td>
                                                        <td style="text-align: right;" width="10%">
                                                            <asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,JieShuShiJian%>"></asp:Label>： </td>
                                                        <td>
                                                            <asp:TextBox ID="DLC_EndTime" runat="server" ReadOnly="false"></asp:TextBox>
                                                            <ajaxToolkit:CalendarExtender ID="CalendarExtender1" runat="server" Format="yyyy-MM-dd" TargetControlID="DLC_EndTime">
                                                            </ajaxToolkit:CalendarExtender>
                                                        </td>
                                                        <td>
                                                            <a href="#" onclick="preview1()">
                                                                <img src="ImagesSkin/print.gif" alt="打印" border="0" />
                                                            </a>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="text-align: right;">
                                                            <asp:Label ID="Label8" runat="server" Text="<%$ Resources:lang,ShenQingRen%>"></asp:Label>： </td>
                                                        <td align="left">
                                                            <asp:TextBox ID="TB_Applicant" runat="server" Width="100px"></asp:TextBox>
                                                        </td>
                                                        <td style="text-align: right;" width="12%">
                                                            <asp:Label ID="Label23" runat="server" Text="<%$ Resources:lang,DanHao%>"></asp:Label>:</td>
                                                        <td align="left" colspan="2">
                                                            <asp:TextBox ID="TB_GPOName" runat="server" Width="150px"></asp:TextBox>
                                                            <asp:Button ID="BT_Find" runat="server" CssClass="inpu" OnClick="BT_Find_Click" Text="<%$ Resources:lang,ChaXun%>" />
                                                            <asp:Label ID="LB_UserCode" runat="server" Visible="False"></asp:Label>
                                                            <asp:Label ID="LB_UserName" runat="server" Visible="False"></asp:Label>
                                                            <asp:Label ID="LB_Sql" runat="server" Visible="False"></asp:Label>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width: 100%; padding: 5px 5px 5px 5px;">
                                                <!--startprint1-->
                                                <table align="center" background="ImagesSkin/main_n_bj.jpg" border="0" cellpadding="0" cellspacing="0" width="100%">
                                                    <tr>
                                                        <td width="7">
                                                            <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" />
                                                        </td>
                                                        <td>
                                                            <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                                <tr>
                                                                    <td align="center" width="4%"><strong>
                                                                        <asp:Label ID="Label10" runat="server" Text="<%$ Resources:lang,BianHao%>"></asp:Label></strong> </td>
                                                                    <td align="center" width="5%"><strong>
                                                                        <asp:Label ID="Label9" runat="server" Text="<%$ Resources:lang,DanHao%>"></asp:Label>
                                                                    </strong></td>
                                                                    <td align="center" width="8%"><strong>
                                                                        <asp:Label ID="Label30" runat="server" Text="<%$ Resources:lang,GongYingShang%>"></asp:Label></strong> </td>
                                                                    <td align="center" width="8%"><strong>
                                                                        <asp:Label ID="Label11" runat="server" Text="<%$ Resources:lang,YaoQiuDaoHuoShiJian%>"></asp:Label></strong> </td>

                                                                    <td align="center" width="8%"><strong>
                                                                        <asp:Label ID="Label13" runat="server" Text="<%$ Resources:lang,DaiMa%>"></asp:Label></strong> </td>
                                                                    <td align="center" width="10%"><strong>
                                                                        <asp:Label ID="Label14" runat="server" Text="<%$ Resources:lang,MingCheng%>"></asp:Label></strong> </td>
                                                                    <td align="center" width="8%"><strong>
                                                                        <asp:Label ID="Label12" runat="server" Text="<%$ Resources:lang,XingHao%>"></asp:Label></strong> </td>
                                                                    <td align="center" width="13%"><strong>
                                                                        <asp:Label ID="Label24" runat="server" Text="<%$ Resources:lang,GuiGe%>"></asp:Label></strong> </td>
                                                                    <td align="center" width="8%"><strong>
                                                                        <asp:Label ID="Label15" runat="server" Text="<%$ Resources:lang,ShuLiang%>"></asp:Label></strong> </td>
                                                                    <td align="center" width="5%"><strong>
                                                                        <asp:Label ID="Label16" runat="server" Text="<%$ Resources:lang,YiRuKu%>"></asp:Label></strong> </td>
                                                                    <td align="center" width="5%"><strong>
                                                                        <asp:Label ID="Label17" runat="server" Text="<%$ Resources:lang,DanWei%>"></asp:Label></strong> </td>
                                                                    <td align="center" width="5%"><strong>
                                                                        <asp:Label ID="Label18" runat="server" Text="<%$ Resources:lang,ShenQingRen%>"></asp:Label></strong> </td>

                                                                    <td width="8%" align="center">
                                                                        <strong>
                                                                            <asp:Label ID="Label19" runat="server" Text="<%$ Resources:lang,CaiGouShiJian%>"></asp:Label></strong>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                        <td align="right" width="6">
                                                            <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" />
                                                        </td>
                                                    </tr>
                                                </table>
                                                <asp:DataGrid ID="DataGrid1" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" Height="1px" ShowHeader="false" Width="100%">
                                                    <Columns>
                                                        <asp:BoundColumn DataField="ID" HeaderText="编号">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="4%" />
                                                        </asp:BoundColumn>
                                                        <asp:TemplateColumn HeaderText="打印">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                            <ItemTemplate>
                                                                <a href='TTGoodsPurchaseOrderView.aspx?POID=<%# DataBinder.Eval(Container.DataItem,"POID") %>' target="_blank">
                                                                    <%# DataBinder.Eval(Container.DataItem,"GPOName") %>  </a>
                                                            </ItemTemplate>
                                                        </asp:TemplateColumn>
                                                        <asp:BoundColumn DataField="Supplier" HeaderText="供应商">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="8%" />
                                                        </asp:BoundColumn>
                                                        <asp:BoundColumn DataField="ArrivalTime" DataFormatString="{0:yyyy/MM/dd}" HeaderText="到货时间">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                        </asp:BoundColumn>

                                                        <asp:BoundColumn DataField="GoodsCode" HeaderText="代码">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="8%" />
                                                        </asp:BoundColumn>
                                                        <asp:BoundColumn DataField="GoodsName" HeaderText="名称">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="10%" />
                                                        </asp:BoundColumn>
                                                        <asp:BoundColumn DataField="ModelNumber" HeaderText="型号">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                        </asp:BoundColumn>
                                                        <asp:BoundColumn DataField="Spec" HeaderText="规格">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="13%" />
                                                        </asp:BoundColumn>
                                                        <asp:BoundColumn DataField="Number" HeaderText="数量">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                        </asp:BoundColumn>
                                                        <asp:BoundColumn DataField="CheckInNumber" HeaderText="入库">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                        </asp:BoundColumn>
                                                        <asp:BoundColumn DataField="Unit" HeaderText="单位">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                        </asp:BoundColumn>
                                                        <asp:HyperLinkColumn DataNavigateUrlField="ApplicantCode" DataNavigateUrlFormatString="TTUserInforSimple.aspx?UserCode={0}" DataTextField="ApplicantName" HeaderText="申请人" Target="_blank">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                        </asp:HyperLinkColumn>

                                                        <asp:BoundColumn DataField="PurTime" HeaderText="采购时间" DataFormatString="{0:yyyy/MM/dd}">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                        </asp:BoundColumn>
                                                    </Columns>

                                                    <ItemStyle CssClass="itemStyle" />
                                                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                    <EditItemStyle BackColor="#2461BF" />
                                                    <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />

                                                </asp:DataGrid>
                                                <!--endprint1-->

                                            </td>
                                        </tr>
                                        <tr style="display: none;">
                                            <td style="text-align: Center;">
                                                <asp:Label ID="Label20" runat="server" Text="<%$ Resources:lang,Di%>"></asp:Label>：<asp:Label ID="LB_PageIndex" runat="server"></asp:Label>
                                                &nbsp;<asp:Label ID="Label21" runat="server" Text="<%$ Resources:lang,YeGong%>"></asp:Label>
                                                <asp:Label ID="LB_TotalPageNumber" runat="server"></asp:Label>
                                                &nbsp;<asp:Label ID="Label22" runat="server" Text="<%$ Resources:lang,Ye%>"></asp:Label>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                        <br />
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
