<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTConstractRelatedUser.aspx.cs" Inherits="TTConstractRelatedUser" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register Assembly="NickLee.Web.UI" Namespace="NickLee.Web.UI" TagPrefix="NickLee" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link id="mainCss" href="css/bluelightmain.css" rel="stylesheet" type="text/css" />
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
            <asp:ScriptManager ID="ScriptManager1" runat="server" >
            </asp:ScriptManager>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>

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
                                                        <asp:Label ID="Label22" runat="server" Text="<%$ Resources:lang,ZuJianTuanDui%>"></asp:Label>
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
                                <table style="width: 100%;" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td valign="top" width="170" style="padding: 5px 5px 0px 5px; border-right: solid 1px #D8D8D8">
                                            <table style="width: 100%;">
                                                <tr>
                                                    <td style="width: 100%">
                                                        <table width="100%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                                            <tr>
                                                                <td width="7">
                                                                    <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" /></td>
                                                                <td>
                                                                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                        <tr>

                                                                            <td align="center">
                                                                                <strong>
                                                                                    <asp:Label ID="Label23" runat="server" Text="<%$ Resources:lang,QingXianXuanZeBuMen%>"></asp:Label></strong>
                                                                            </td>
                                                                        </tr>
                                                                    </table>
                                                                </td>
                                                                <td width="6" align="right">
                                                                    <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" /></td>
                                                            </tr>
                                                        </table>
                                                        <asp:DataGrid ID="DataGrid3" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                                                            OnItemCommand="DataGrid3_ItemCommand" OnPageIndexChanged="DataGrid3_PageIndexChanged" ShowHeader="false"
                                                            Width="100%" CellPadding="4" ForeColor="#333333" GridLines="None">
                                                            
                                                            <ItemStyle CssClass="itemStyle" />
                                                            <Columns>
                                                                <asp:TemplateColumn HeaderText="请先选择部门：">
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" />
                                                                    <ItemTemplate>
                                                                        <asp:Button ID="BT_DepartCode" runat="server" Text='<%# DataBinder.Eval(Container.DataItem,"DepartCode") %>' CssClass="inpu" />
                                                                        <asp:Button ID="BT_DepartName" runat="server" Text='<%# DataBinder.Eval(Container.DataItem,"DepartName") %>' CssClass="inpu" />
                                                                    </ItemTemplate>
                                                                </asp:TemplateColumn>
                                                            </Columns>
                                                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                            <EditItemStyle BackColor="#2461BF" />
                                                            <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                            <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />
                                                        </asp:DataGrid>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="width: 100%; text-align: center">
                                                        <br />
                                                        <table width="100%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                                            <tr>
                                                                <td width="7">
                                                                    <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" /></td>
                                                                <td>
                                                                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                        <tr>

                                                                            <td align="center">
                                                                                <strong>
                                                                                    <asp:Label ID="Label24" runat="server" Text="<%$ Resources:lang,BuMenRenYuan%>"></asp:Label></strong>
                                                                            </td>
                                                                        </tr>
                                                                    </table>
                                                                </td>
                                                                <td width="6" align="right">
                                                                    <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" /></td>
                                                            </tr>
                                                        </table>
                                                        <asp:DataGrid ID="DataGrid4" runat="server" AutoGenerateColumns="False" OnItemCommand="DataGrid4_ItemCommand" ShowHeader="false"
                                                            Width="170px" CellPadding="4" ForeColor="#333333" GridLines="None">
                                                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                            <EditItemStyle BackColor="#2461BF" />
                                                            <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                            <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />
                                                            
                                                            <ItemStyle CssClass="itemStyle" />
                                                            <Columns>
                                                                <asp:TemplateColumn HeaderText="部门人员：">
                                                                    <ItemTemplate>
                                                                        <asp:Button ID="BT_UserCode" runat="server" Text='<%# DataBinder.Eval(Container.DataItem,"UserCode") %>' CssClass="inpu" />
                                                                        <asp:Button ID="BT_UserName" runat="server" Text='<%# DataBinder.Eval(Container.DataItem,"UserName") %>' CssClass="inpu" />
                                                                    </ItemTemplate>
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" />
                                                                </asp:TemplateColumn>
                                                            </Columns>
                                                        </asp:DataGrid>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                        <td valign="top">
                                            <table style="width: 98%; margin-top: 5px">
                                                <tr>
                                                    <td colspan="6">
                                                        <table width="98%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                                            <tr>
                                                                <td width="7">
                                                                    <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" /></td>
                                                                <td>
                                                                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                        <tr>

                                                                            <td width="8%" align="center">
                                                                                <strong>
                                                                                    <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,DaiMa%>"></asp:Label></strong>
                                                                            </td>
                                                                            <td width="22%" align="center">
                                                                                <strong>
                                                                                    <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,MingCheng%>"></asp:Label></strong>
                                                                            </td>
                                                                            <td width="10%" align="center">
                                                                                <strong>
                                                                                    <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,BuMen%>"></asp:Label></strong>
                                                                            </td>
                                                                            <td width="10%" align="center">
                                                                                <strong>
                                                                                    <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,JueSe%>"></asp:Label></strong>
                                                                            </td>
                                                                            <td width="10%" align="center">
                                                                                <strong>
                                                                                    <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,ShiXin%>"></asp:Label></strong>
                                                                            </td>
                                                                            <td width="12%" align="center">
                                                                                <strong>
                                                                                    <asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,JiaRuShiJian%>"></asp:Label></strong>
                                                                            </td>
                                                                            <td width="10%" align="center">
                                                                                <strong>
                                                                                    <asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,JueSeZu%>"></asp:Label></strong>
                                                                            </td>
                                                                            <td width="8%" align="center">
                                                                                <strong></strong>
                                                                            </td>
                                                                        </tr>
                                                                    </table>
                                                                </td>
                                                                <td width="6" align="right">
                                                                    <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" /></td>
                                                            </tr>
                                                        </table>
                                                        <asp:DataGrid ID="DataGrid2" runat="server" AutoGenerateColumns="False" Height="1px" ShowHeader="false"
                                                            OnItemCommand="DataGrid2_ItemCommand" Width="98%" OnPageIndexChanged="DataGrid2_PageIndexChanged"
                                                            CellPadding="4" ForeColor="#333333" GridLines="None">
                                                            <Columns>
                                                                <asp:BoundColumn DataField="UserCode" HeaderText="代码">
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                                </asp:BoundColumn>
                                                                <asp:BoundColumn DataField="UserName" HeaderText="名称">
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="22%" />
                                                                </asp:BoundColumn>
                                                                <asp:BoundColumn DataField="DepartName" HeaderText="部门">
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                </asp:BoundColumn>
                                                                <asp:BoundColumn DataField="Actor" HeaderText="角色">
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                </asp:BoundColumn>
                                                                <asp:BoundColumn DataField="UnitHourSalary" HeaderText="时薪">
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                                </asp:BoundColumn>
                                                                <asp:BoundColumn DataField="JoinDate" HeaderText="加入时间" DataFormatString="{0:yyyy/MM/dd}">
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="12%" />
                                                                </asp:BoundColumn>
                                                                <asp:BoundColumn DataField="ActorGroup" HeaderText="角色组">
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                </asp:BoundColumn>
                                                                <asp:TemplateColumn>
                                                                    <ItemTemplate>
                                                                        <asp:Button ID="BT_ID" runat="server" CssClass="inpu" Text='<%# DataBinder.Eval(Container.DataItem,"ID") %>' />
                                                                    </ItemTemplate>
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                                </asp:TemplateColumn>
                                                            </Columns>
                                                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                            <EditItemStyle BackColor="#2461BF" />
                                                            <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                            <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />
                                                            
                                                            <ItemStyle CssClass="itemStyle" />
                                                        </asp:DataGrid>
                                                        <asp:Label ID="LB_SqlGM" runat="server"  Visible="False" Font-Size="9pt"></asp:Label><asp:Label
                                                            ID="LB_ProjectID" runat="server" Font-Size="9pt"  Visible="False"
                                                            Font-Bold="False"></asp:Label>
                                                        <asp:Label ID="LB_UserCode" runat="server" Font-Bold="False" 
             Visible="False"></asp:Label>
                                                        <asp:Label ID="LB_UserName" runat="server" Font-Bold="False" Font-Size="9pt" 
             Visible="False"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td colspan="6" style="text-align: center;">
                                                        <table class="formBgStyle" width="98%" cellpadding="3" cellspacing="0">
                                                            <tr>
                                                                <td colspan="6" style="text-align: left" class="formItemBgStyle">
                                                                    <asp:Label ID="Label8" runat="server" Text="&lt;div&gt;&lt;img src=ImagesSkin/Update.png border=0 width=30px height=30px alt='BusinessForm' /&gt;&lt;/div&gt;"></asp:Label>：<asp:TextBox ID="TB_SMS" runat="server" Width="595px"></asp:TextBox>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td colspan="6" style="text-align: left" class="formItemBgStyle">
                                                                    <asp:Label ID="Label9" runat="server" Text="<%$ Resources:lang,TongZhiQuanBuXiangMuChengYuan%>"></asp:Label>：<asp:CheckBox ID="CB_Sms" runat="server" Text="<%$ Resources:lang,FaXinXi%>" Font-Size="10pt" />
                                                                    <asp:CheckBox ID="CB_Mail" runat="server" Text="<%$ Resources:lang,FaYouJian%>" Font-Size="10pt" />
                                                                    &nbsp;
                                                                <asp:Button ID="BT_SendMsg" runat="server" OnClick="BT_SendMsg_Click" Text="<%$ Resources:lang,FaSong%>"
                                                                    CssClass="inpu" Font-Size="10pt" />
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td style="width: 85px; height: 6px; text-align: right" class="formItemBgStyle"></td>
                                                                <td colspan="5" style="width: 100px; height: 6px; text-align: left;" class="formItemBgStyle">
                                                                    <asp:Label ID="LB_ID" runat="server"  Visible="False" Font-Size="10pt"></asp:Label>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td style="width: 85px; height: 5px; text-align: right;" class="formItemBgStyle">
                                                                    <asp:Label ID="Label10" runat="server" Text="<%$ Resources:lang,DaiMa%>"></asp:Label>：
                                                                </td>
                                                                <td style="width: 100px; height: 5px;" class="formItemBgStyle">
                                                                    <asp:Label ID="LB_RelatedUserCode" runat="server" Width="163px" Font-Size="10pt"
                                                                        Style="text-align: left"></asp:Label>
                                                                </td>
                                                                <td style="width: 97px; height: 5px; text-align: right;" class="formItemBgStyle">
                                                                    <asp:Label ID="Label11" runat="server" Text="<%$ Resources:lang,MingCheng%>"></asp:Label>：
                                                                </td>
                                                                <td colspan="2" style="height: 5px; text-align: left;" class="formItemBgStyle">
                                                                    <asp:Label ID="LB_RelatedUserName" runat="server" Font-Size="10pt"></asp:Label>
                                                                </td>
                                                                <td style="width: 100px; height: 5px;" class="formItemBgStyle"></td>
                                                            </tr>
                                                            <tr>
                                                                <td style="width: 85px; text-align: right;" class="formItemBgStyle">
                                                                    <asp:Label ID="Label12" runat="server" Text="<%$ Resources:lang,ShiXin%>"></asp:Label>：
                                                                </td>
                                                                <td style="width: 100px; text-align: left;" class="formItemBgStyle">
                                                                    <NickLee:NumberBox MaxAmount="1000000000000" MinAmount="-1000000000000" ID="NB_UnitHourSalary" runat="server" Width="83px">0.00</NickLee:NumberBox>
                                                                </td>
                                                                <td style="width: 97px; text-align: right;" class="formItemBgStyle">
                                                                    <asp:Label ID="Label13" runat="server" Text="<%$ Resources:lang,BuMen%>"></asp:Label>：
                                                                </td>
                                                                <td colspan="3" style="height: 5px; text-align: left;" class="formItemBgStyle">
                                                                    <asp:Label ID="LB_DepartCode" runat="server" Width="115px" Font-Size="10pt"></asp:Label>
                                                                    <asp:Label ID="LB_DepartName" runat="server" Font-Size="10pt" Height="16px" Width="124px"></asp:Label>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td style="width: 85px; text-align: right;" class="formItemBgStyle">
                                                                    <asp:Label ID="Label14" runat="server" Text="<%$ Resources:lang,JueSe%>"></asp:Label>：
                                                                </td>
                                                                <td style="width: 100px" class="formItemBgStyle">
                                                                    <asp:TextBox ID="TB_Actor" runat="server" Font-Size="10pt"></asp:TextBox>
                                                                </td>
                                                                <td style="width: 97px; text-align: right;" class="formItemBgStyle">
                                                                    <asp:Label ID="Label15" runat="server" Text="<%$ Resources:lang,JiaRuShiJian%>"></asp:Label>：
                                                                </td>
                                                                <td colspan="2" style="text-align: left" class="formItemBgStyle">

                                                                    <asp:TextBox ID="DLC_JoinDate" ReadOnly="false" runat="server"></asp:TextBox>
                                                                    <ajaxToolkit:CalendarExtender Format="yyyy-MM-dd" ID="CalendarExtender1"
                                                                        runat="server" TargetControlID="DLC_JoinDate">
                                                                    </ajaxToolkit:CalendarExtender>
                                                                </td>
                                                                <td style="width: 100px;" class="formItemBgStyle"></td>
                                                            </tr>
                                                            <tr>
                                                                <td style="width: 85px; text-align: right" class="formItemBgStyle">
                                                                    <asp:Label ID="Label16" runat="server" Text="<%$ Resources:lang,GongZuoNeiRong%>"></asp:Label>：
                                                                </td>
                                                                <td colspan="5" style="text-align: left;" class="formItemBgStyle">
                                                                    <asp:TextBox ID="TB_WorkDetail" runat="server" Height="50px" TextMode="MultiLine"
                                                                        Width="598px"></asp:TextBox>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td style="width: 85px; text-align: right;" class="formItemBgStyle">
                                                                    <asp:Label ID="Label17" runat="server" Text="<%$ Resources:lang,ZhuangTai%>"></asp:Label>：
                                                                </td>
                                                                <td colspan="5" style="text-align: left;" class="formItemBgStyle">
                                                                    <asp:DropDownList ID="DL_Status" runat="server" AutoPostBack="True">
                                                                        <asp:ListItem Value="计划" Text="<%$ Resources:lang,JiHua%>"/>
                                                                        <asp:ListItem Value="受理" Text="<%$ Resources:lang,ShouLi%>"/>
                                                                        <asp:ListItem Value="拒绝" Text="<%$ Resources:lang,JuJue%>"/>
                                                                        <asp:ListItem Value="处理中" Text="<%$ Resources:lang,HuoDong%>"/>
                                                                        <asp:ListItem Value="暂停" Text="<%$ Resources:lang,ZanTing%>"/>
                                                                        <asp:ListItem Value="终止" Text="<%$ Resources:lang,ZhongZhi%>"/>
                                                                    </asp:DropDownList>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td style="width: 85px; text-align: right;" class="formItemBgStyle"></td>
                                                                <td colspan="5" style="text-align: left;" class="formItemBgStyle">
                                                                    <asp:Button ID="BT_New" runat="server" OnClick="BT_New_Click" Text="<%$ Resources:lang,XinZeng%>" CssClass="inpu" />&nbsp;
                                                                <asp:Button ID="BT_Update" runat="server" Text="<%$ Resources:lang,BaoCun%>" OnClick="BT_Update_Click" Enabled="False"
                                                                    CssClass="inpu" />&nbsp;
                                                                <asp:Button ID="BT_Delete" runat="server" Text="<%$ Resources:lang,ShanChu%>" OnClick="BT_Delete_Click" OnClientClick="return confirm(getDeleteMsgByLangCode())" Enabled="False" 
                                                                    CssClass="inpu" />
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td style="text-align: left; height: 19px;" colspan="6" class="formItemBgStyle">
                                                                    <asp:Label ID="Label18" runat="server" Text="&lt;div&gt;&lt;img src=ImagesSkin/Update.png border=0 width=30px height=30px alt='BusinessForm' /&gt;&lt;/div&gt;"></asp:Label>:
                                                                <asp:TextBox ID="TB_PersonalSMS" runat="server" Width="600px"></asp:TextBox>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td colspan="6" style="height: 19px; text-align: left" class="formItemBgStyle">
                                                                    <asp:Label ID="Label19" runat="server" Text="<%$ Resources:lang,TongZhiCiChengYuan%>"></asp:Label>
                                                                <asp:CheckBox ID="CB_SendSMS" runat="server" Text="<%$ Resources:lang,FaXinXi%>" Font-Size="10pt" /><asp:CheckBox
                                                                    ID="CB_SendEMail" runat="server" Text="<%$ Resources:lang,FaYouJian%>" Font-Size="10pt" />
                                                                    <asp:Button ID="BT_PersonalSMS" runat="server" Text="<%$ Resources:lang,FaSong%>" Enabled="False" OnClick="BT_PersonalSMS_Click"
                                                                        CssClass="inpu" />
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td colspan="6" style="height: 9px; text-align: center;">
                                                        <table cellpadding="0" cellspacing="0" width="98%" align="center">
                                                            <tr>
                                                                <td align="left" style="padding-left: 20px; font-weight: bold; height: 24px; color: #394f66; background-image: url('ImagesSkin/titleBG.jpg')">
                                                                    <asp:Label ID="Label20" runat="server" Text="<%$ Resources:lang,JueSeZuLieBiao%>"></asp:Label>：
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <table width="100%" align="left">
                                                                        <tr>
                                                                            <td colspan="6" style="height: 12px; text-align: left">
                                                                                <asp:Repeater ID="Repeater1" runat="server" OnItemCommand="Repeater1_ItemCommand">
                                                                                    <ItemTemplate>
                                                                                        <asp:Button ID="BT_GroupName" runat="server" CssClass="inpuLong" Text='<%# DataBinder.Eval(Container.DataItem,"GroupName") %>' />
                                                                                    </ItemTemplate>
                                                                                </asp:Repeater>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td colspan="6" style="height: 10px; text-align: left">
                                                                                <asp:TextBox ID="TB_ActorGroup" runat="server" Width="219px"></asp:TextBox>
                                                                                <asp:Button ID="BT_CreateActorGroup" runat="server" OnClick="BT_CreateActorGroup_Click"
                                                                                    Text="<%$ Resources:lang,CJXJSZ%>" CssClass="inpuLong" />
                                                                                <asp:Label ID="LB_AddDelete" runat="server" Text="Add" Visible="False"></asp:Label>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td colspan="6" style="height: 20px; text-align: left">
                                                                                <asp:Label ID="Label21" runat="server" Text="<%$ Resources:lang,QZSMXZJSZM%>"></asp:Label>：<asp:Label ID="LB_ActorGroup" runat="server" Font-Underline="True"></asp:Label>，<asp:Label ID="Label25" runat="server" Text="<%$ Resources:lang,JSMDXMCY%>"></asp:Label><asp:Button
                                                                                ID="BT_TransferActorGroup" runat="server" Enabled="False" OnClick="BT_TransferActorGroup_Click"
                                                                                CssClass="inpuLong" Text="<%$ Resources:lang,ZWCJSZCY%>" />
                                                                            </td>
                                                                        </tr>
                                                                    </table>
                                                                    <br />
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
