<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTUserAttendanceRecordSAAS.aspx.cs" Inherits="TTUserAttendanceRecordSAAS" %>


<%@ Register Assembly="NickLee.Web.UI" Namespace="NickLee.Web.UI" TagPrefix="NickLee" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>项目成员资料</title>
    <link id="mainCss" href="css/bluelightmain.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        #AboveDiv {
            min-width: 1600px;
            width: expression (document.body.clientWidth <= 1600? "1600px" : "auto" ));
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
                                                            <%--<img src="Logo/main_top_l.jpg" alt="" width="29" height="31" />--%></td>
                                                        <td align="center" background="ImagesSkin/main_top_bj.jpg" class="titlezi">
                                                            <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,YuanGongChuQingJiLu%>"></asp:Label>
                                                        </td>
                                                        <td width="5">
                                                            <%-- <img src="ImagesSkin/main_top_r.jpg" width="5" height="31" />--%></td>
                                                    </tr>
                                                </table>
                                                <table>
                                                    <tr>
                                                        <td>
                                                            <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,KaoQingRiQi%>"></asp:Label></td>
                                                        <td>

                                                            <asp:TextBox ID="DLC_SelectedAttendanceDate" ReadOnly="false" runat="server"></asp:TextBox>
                                                            <ajaxToolkit:CalendarExtender Format="yyyy-MM-dd" ID="CalendarExtender3" runat="server" TargetControlID="DLC_SelectedAttendanceDate">
                                                            </ajaxToolkit:CalendarExtender>
                                                        </td>
                                                        
                                                    </tr>
                                                </table>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td valign="top">
                                    <table cellpadding="0" cellspacing="0" width="100%">
                                        <tr>
                                            <td align="center" style="width: 170px; border-right: solid 1px #D8D8D8; padding: 5px 0px 0px 5px"
                                                valign="top">
                                                <table style="width: 100%; text-align: left;">
                                                    <tr>
                                                        <td style="width: 100%; height: 14px; text-align: center">
                                                            <table width="100%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                                                <tr>
                                                                    <td width="7">
                                                                        <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" /></td>
                                                                    <td>
                                                                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                            <tr>
                                                                                <td align="center"><strong>
                                                                                    <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,ZhiJieChengYuan%>"></asp:Label></strong></td>
                                                                            </tr>
                                                                        </table>
                                                                    </td>
                                                                    <td width="6" align="right">
                                                                        <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" /></td>
                                                                </tr>
                                                            </table>
                                                            <asp:DataGrid ID="DataGrid2" runat="server" AutoGenerateColumns="False" ShowHeader="false" CellPadding="2" Font-Bold="true" ForeColor="#333333"
                                                                GridLines="None" OnItemCommand="DataGrid2_ItemCommand" Width="100%">
                                                                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                                <EditItemStyle BackColor="#2461BF" />
                                                                <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                                <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />

                                                                <ItemStyle CssClass="itemStyle" />
                                                                <Columns>
                                                                    <asp:TemplateColumn HeaderText="">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" />
                                                                        <ItemTemplate>
                                                                            <asp:Button ID="BT_UserCode" runat="server" CssClass="inpu" 
                                                                                Text='<%# DataBinder.Eval(Container.DataItem,"UserCode") %>' />
                                                                        </ItemTemplate>

                                                                    </asp:TemplateColumn>
                                                                    <asp:TemplateColumn HeaderText="">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" />
                                                                        <ItemTemplate>
                                                                            <asp:Button ID="BT_UserName" runat="server" CssClass="inpu" 
                                                                                Text='<%# DataBinder.Eval(Container.DataItem,"UserName") %>' />
                                                                        </ItemTemplate>

                                                                    </asp:TemplateColumn>
                                                                </Columns>
                                                            </asp:DataGrid>
                                                        </td>
                                                    </tr>
                                                </table>
                                                <asp:Label ID="LB_DepartCode" runat="server" Visible="False"></asp:Label>
                                                <br />
                                            </td>
                                            <td align="left" valign="top" style="padding: 5px 0px 5px 5px;">
                                                <table style="width: 100%; text-align: left;">
                                                    <tr>
                                                        <td>
                                                            <table width="98%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                                                <tr>
                                                                    <td width="7">
                                                                        <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" /></td>
                                                                    <td>
                                                                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                            <tr>
                                                                                <td width="6%" align="center">
                                                                                    <strong>ID</strong>
                                                                                </td>
                                                                                <td width="3%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label29" runat="server" Text="<%$ Resources:lang,XingMing%>"></asp:Label></strong>
                                                                                </td>
                                                                                 <td width="3%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label30" runat="server" Text="<%$ Resources:lang,ZhuGuan%>"></asp:Label></strong>
                                                                                </td>

                                                                                <td width="6%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,KaoQingRiQi%>"></asp:Label></strong>
                                                                                </td>

                                                                                <td width="8%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,ZaoBanShangBanShiJian%>"></asp:Label></strong>
                                                                                </td>

                                                                                <td width="8%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,ZaoBanXiaBanShiJian%>"></asp:Label></strong>
                                                                                </td>


                                                                                <td width="8%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,ZhongBanShangBanShiJian%>"></asp:Label></strong>
                                                                                </td>

                                                                                <td width="8%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label8" runat="server" Text="<%$ Resources:lang,ZhongBanXiaBanShiJian%>"></asp:Label></strong>
                                                                                </td>


                                                                                <td width="8%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label9" runat="server" Text="<%$ Resources:lang,WanBanShangBanShiJian%>"></asp:Label></strong>
                                                                                </td>

                                                                                <td width="8%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label10" runat="server" Text="<%$ Resources:lang,WanBanXiaBanShiJian%>"></asp:Label></strong>
                                                                                </td>


                                                                                <td width="8%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label11" runat="server" Text="<%$ Resources:lang,JiaBanShangBanShiJian%>"></asp:Label></strong>
                                                                                </td>

                                                                                <td width="8%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label12" runat="server" Text="<%$ Resources:lang,JiaBanXiaBanShiJian%>"></asp:Label></strong>
                                                                                </td>
                                                                                <td width="9%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label19" runat="server" Text="<%$ Resources:lang,YunXiZuiDaJuLi%>"></asp:Label></strong>(<asp:Label ID="Label28" runat="server" Text="<%$ Resources:lang,Mi%>"></asp:Label>)</td>

                                                                                <td width="5%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label13" runat="server" Text="<%$ Resources:lang,ChiDao%>"></asp:Label> </strong>(<asp:Label ID="Label26" runat="server" Text="<%$ Resources:lang,Minute%>"></asp:Label>)</td>
                                                                                <td width="5%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label14" runat="server" Text="<%$ Resources:lang,ZaoTui%>"></asp:Label></strong>(<asp:Label ID="Label27" runat="server" Text="<%$ Resources:lang,Minute%>"></asp:Label>)</td>
                                                                                <td align="center">
                                                                                    <strong>
                                                                                        </strong>
                                                                                </td>
                                                                            </tr>
                                                                        </table>
                                                                    </td>
                                                                    <td width="6" align="right">
                                                                        <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" /></td>
                                                                </tr>
                                                            </table>
                                                            <asp:DataGrid ID="DataGrid3" runat="server" AllowPaging="false" AutoGenerateColumns="false"
                                                                 ShowHeader="false" OnItemCommand="DataGrid3_ItemCommand"   Width="98%" CellPadding="4" ForeColor="#333333" GridLines="None">
                                                                <Columns>
                                                                    <asp:TemplateColumn HeaderText="ID">
                                                                        <ItemTemplate>
                                                                            <asp:Button ID="BT_ID" runat="server" CssClass="inpu" Text='<%# DataBinder.Eval(Container.DataItem,"ID") %>' />
                                                                        </ItemTemplate>
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                                                    </asp:TemplateColumn>
                                                                    <asp:BoundColumn DataField="UserName" HeaderText="姓名">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="3%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:BoundColumn DataField="LeaderName" HeaderText="主管">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="3%" />
                                                                    </asp:BoundColumn>

                                                                    <asp:BoundColumn DataField="AttendanceDate" DataFormatString="{0:yyyy/MM/dd}" HeaderText="考勤日期">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                                                    </asp:BoundColumn>

                                                                    <asp:TemplateColumn>
                                                                        <ItemTemplate>
                                                                            <%# Eval("MCheckIn").ToString().Trim () %>
                                                                            <br />
                                                                            <%# Eval("MCheckInAddress").ToString().Trim () %>
                                                                            <br />
                                                                            <%# Eval("MCheckInDistance").ToString().Trim () %> (m)
                                                                           
                                                                              <br />
                                                                            IsMust:<%# Eval("MCheckInIsMust").ToString().Trim () %>
                                                                        </ItemTemplate>
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                                    </asp:TemplateColumn>


                                                                    <asp:TemplateColumn>
                                                                        <ItemTemplate>
                                                                            <%# Eval("MCheckOut").ToString().Trim () %>
                                                                            <br />
                                                                            <%# Eval("MCheckOutAddress").ToString().Trim () %>
                                                                            <br />
                                                                            <%# Eval("MCheckOutDistance").ToString().Trim () %> (m)
                                                                           
                                                                              <br />
                                                                            IsMust:<%# Eval("MCheckOutIsMust").ToString().Trim () %>
                                                                        </ItemTemplate>
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                                    </asp:TemplateColumn>


                                                                    <asp:TemplateColumn>
                                                                        <ItemTemplate>
                                                                            <%# Eval("ACheckIn").ToString().Trim () %>
                                                                            <br />
                                                                            <%# Eval("ACheckInAddress").ToString().Trim () %>
                                                                            <br />
                                                                            <%# Eval("ACheckInDistance").ToString().Trim () %> (m)
                                                                            
                                                                              <br />
                                                                            IsMust:<%# Eval("ACheckInIsMust").ToString().Trim () %>
                                                                        </ItemTemplate>
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                                    </asp:TemplateColumn>

                                                                    <asp:TemplateColumn>
                                                                        <ItemTemplate>
                                                                            <%# Eval("ACheckOut").ToString().Trim () %>
                                                                            <br />
                                                                            <%# Eval("ACheckOutAddress").ToString().Trim () %>
                                                                            <br />
                                                                            <%# Eval("ACheckOutDistance").ToString().Trim () %> (m)
                                                                           
                                                                              <br />
                                                                            IsMust:<%# Eval("ACheckOutIsMust").ToString().Trim () %>
                                                                        </ItemTemplate>
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                                    </asp:TemplateColumn>

                                                                    <asp:TemplateColumn>
                                                                        <ItemTemplate>
                                                                            <%# Eval("NCheckIn").ToString().Trim () %>
                                                                            <br />
                                                                            <%# Eval("NCheckInAddress").ToString().Trim () %>
                                                                            <br />
                                                                            <%# Eval("NCheckInDistance").ToString().Trim () %> (m)
                                                                            
                                                                              <br />
                                                                            IsMust:<%# Eval("NCheckInIsMust").ToString().Trim () %>
                                                                        </ItemTemplate>
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                                    </asp:TemplateColumn>

                                                                    <asp:TemplateColumn>
                                                                        <ItemTemplate>
                                                                            <%# Eval("NCheckOut").ToString().Trim () %>
                                                                            <br />
                                                                            <%# Eval("NCheckOutAddress").ToString().Trim () %>
                                                                            <br />
                                                                            <%# Eval("NCheckOutDistance").ToString().Trim () %> (m)
                                                                            
                                                                              <br />
                                                                            IsMust:<%# Eval("NCheckOutIsMust").ToString().Trim () %>
                                                                        </ItemTemplate>
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                                    </asp:TemplateColumn>

                                                                    <asp:TemplateColumn>
                                                                        <ItemTemplate>
                                                                            <%# Eval("OCheckIn").ToString().Trim () %>
                                                                            <br />
                                                                            <%# Eval("OCheckInAddress").ToString().Trim () %>
                                                                            <br />

                                                                            <br />
                                                                            IsMust:<%# Eval("OCheckInIsMust").ToString().Trim () %>
                                                                        </ItemTemplate>
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                                    </asp:TemplateColumn>

                                                                    <asp:TemplateColumn>
                                                                        <ItemTemplate>
                                                                            <%# Eval("OCheckOut").ToString().Trim () %>
                                                                            <br />
                                                                            <%# Eval("OCheckOutAddress").ToString().Trim () %>
                                                                            <br />
                                                                            <%# Eval("OCheckOutDistance").ToString().Trim () %> (m)
                                                                           
                                                                              <br />
                                                                            IsMust:<%# Eval("OCheckOutIsMust").ToString().Trim () %>
                                                                        </ItemTemplate>
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                                    </asp:TemplateColumn>

                                                                    <asp:BoundColumn DataField="LargestDistance" HeaderText="允许最大距离">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="9%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:BoundColumn DataField="LateMinute" HeaderText="迟到分钟">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                    </asp:BoundColumn>

                                                                    <asp:BoundColumn DataField="EarlyMinute" HeaderText="早退分钟">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                    </asp:BoundColumn>

                                                                    <asp:TemplateColumn>
                                                                        <ItemTemplate>

                                                                            <a href='TTUserAttendancePosition.aspx?MemberUserCode= <%# Eval("UserCode").ToString().Trim () %> &AttendanceTime=<%# Eval("AttendanceDate").ToString().Trim () %>' target="_blank">
                                                                                <img id="IMG_GPS" src="ImagesSkin/GPS.jpg" width="20" height="20" /></a>

                                                                        </ItemTemplate>
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" />
                                                                    </asp:TemplateColumn>

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
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </div>

                      <div class="layui-layer layui-layer-iframe" id="popwindow"
                        style="z-index: 9999; width: 980px; height: 530px; position: absolute; overflow: hidden; display: none; border-radius: 10px;">
                        <div class="layui-layer-title" style="background: #e7e7e8;" id="popwindow_title">
                            <asp:Label ID="Label205" runat="server" Text="&lt;div&gt;&lt;img src=ImagesSkin/Update.png border=0 width=30px height=30px alt='BusinessForm' /&gt;&lt;/div&gt;"></asp:Label>
                        </div>
                        <div id="popwindow_content" class="layui-layer-content" style="overflow: auto; padding: 0px 5px 0px 5px;">

                            <table width="98%" cellpadding="3" cellspacing="0" class="formBgStyle">
                                <tr>
                                    <td align="left" class="formItemBgStyle">
                                        <table>
                                            <tr>
                                                <td>
                                                    <asp:Label ID="Label15" runat="server" Text="<%$ Resources:lang,Bianhao%>"></asp:Label></td>
                                                <td>
                                                    <asp:Label ID="LB_ID" runat="server"></asp:Label></td>
                                                <td>
                                                    <asp:Label ID="Label16" runat="server" Text="<%$ Resources:lang,YuanGongDaiMa%>"></asp:Label></td>
                                                <td>
                                                    <asp:Label ID="LB_UserCode" runat="server"></asp:Label>&nbsp; </td>
                                                <td>&nbsp;<asp:Label ID="Label17" runat="server" Text="<%$ Resources:lang,YuanGongMingChen%>"></asp:Label></td>
                                                <td>
                                                    <asp:Label ID="LB_UserName" runat="server"></asp:Label></td>
                                                <td></td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="left" class="formItemBgStyle">
                                        <table>
                                            <tr>
                                                <td>
                                                    <asp:Label ID="Label20" runat="server" Text="<%$ Resources:lang,Classes%>"></asp:Label>:
                                                </td>
                                                <td>
                                                    <asp:DropDownList ID="DL_ShiftType" runat="server" AutoPostBack="true"
                                                        OnSelectedIndexChanged="DL_ShiftType_SelectedIndexChanged"
                                                        Style="font-weight: normal; color: black">
                                                        <asp:ListItem Value="上午上班时间" Text="<%$ Resources:lang,ZaoBanShangBanShiJian%>" />
                                                        <asp:ListItem Value="上午下班时间" Text="<%$ Resources:lang,ZaoBanXiaBanShiJian%>" />
                                                        <asp:ListItem Value="下午上班时间" Text="<%$ Resources:lang,ZhongBanshangBanShiJian%>" />
                                                        <asp:ListItem Value="下午下班时间" Text="<%$ Resources:lang,ZhongBanXiaBanShiJian%>" />
                                                        <asp:ListItem Value="晚班上班时间" Text="<%$ Resources:lang,WanBanShangBanShiJian%>" />
                                                        <asp:ListItem Value="晚班下班时间" Text="<%$ Resources:lang,WanBanXiaBanShiJian%>" />
                                                        <asp:ListItem Value="午夜上班时间" Text="<%$ Resources:lang,JiaBanShangBanShiJian%>" />
                                                        <asp:ListItem Value="午夜下班时间" Text="<%$ Resources:lang,JiaBanXiaBanShiJian%>" />
                                                    </asp:DropDownList>
                                                </td>
                                                <td>
                                                    <asp:Label ID="Label18" runat="server" Text="<%$ Resources:lang,ChuQingShiJian%>"></asp:Label></td>
                                                <td>
                                                    <asp:TextBox ID="DLC_AttendanceDate" ReadOnly="false" runat="server"></asp:TextBox>
                                                    <ajaxToolkit:CalendarExtender Format="yyyy-MM-dd" ID="CalendarExtender4"
                                                        runat="server" TargetControlID="DLC_AttendanceDate">
                                                    </ajaxToolkit:CalendarExtender>
                                                </td>
                                                <td>
                                                    <asp:DropDownList ID="DL_Hour" runat="server">
                                                    </asp:DropDownList>
                                                    <asp:Label ID="Label21" runat="server" Text="<%$ Resources:lang,Hour%>"></asp:Label></td>
                                                <td>
                                                    <asp:DropDownList ID="DL_Minute" runat="server">
                                                    </asp:DropDownList>
                                                    <asp:Label ID="Label24" runat="server" Text="<%$ Resources:lang,Minute%>"></asp:Label>:
                                                                        <asp:Label ID="Label23" runat="server" Text="<%$ Resources:lang,JuLi%>"></asp:Label>
                                                    <NickLee:NumberBox ID="NB_Distance" runat="server" MaxAmount="1000000000000" MinAmount="0" Width="80px">0.00</NickLee:NumberBox>
                                                    <asp:Label ID="Label25" runat="server" Text="<%$ Resources:lang,Mi%>"></asp:Label>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>

                                <tr>
                                    <td style="text-align: Left;" class="formItemBgStyle">
                                        <asp:Button ID="BT_UpdateUserAttendanceRule" runat="server" CssClass="inpu"
                                            Enabled="False" OnClick="BT_UpdateUserAttendanceRule_Click" Text="<%$ Resources:lang,BaoCun%>" />
                                        &nbsp;<asp:Button ID="BT_DeleteUserAttendanceRule" runat="server" CssClass="inpu"
                                            Enabled="False" OnClick="BT_DeleteUserAttendanceRule_Click" OnClientClick="return confirm(getDeleteMsgByLangCode())" Text="<%$ Resources:lang,ShanChu%>" />
                                        <asp:Label ID="LB_Sql3" runat="server" Visible="false"></asp:Label>
                                    </td>
                                </tr>
                            </table>

                        </div>
                        <div id="popwindow_footer" class="layui-layer-btn" style="border-top: 1px solid #ccc;">
                           <a class="layui-layer-btn notTab" onclick="return popClose();"><asp:Label ID="Label206" runat="server" Text="<%$ Resources:lang,GuanBi%>" /></a>
                        </div>
                        <span class="layui-layer-setwin"><a onclick="return popClose();" class="layui-layer-ico layui-layer-close layui-layer-close1 notTab" href="javascript:;"></a></span>
                    </div>
                    <div class="layui-layer-shade" id="popwindow_shade" style="z-index: 9998; background-color: #000; opacity: 0.3; filter: alpha(opacity=30); display: none;"></div>

                    <asp:Label ID="LB_MemberCode" runat="server"  Visible ="false"></asp:Label>
                    <asp:Label ID="LB_MemberName" runat="server"  Visible ="false"></asp:Label>

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
