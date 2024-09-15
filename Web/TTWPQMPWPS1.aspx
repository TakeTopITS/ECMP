<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTWPQMPWPS1.aspx.cs" Inherits="TTWPQMPWPS1" %>

<%@ Register Assembly="NickLee.Web.UI" Namespace="NickLee.Web.UI" TagPrefix="NickLee" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Assembly="Brettle.Web.NeatUpload" Namespace="Brettle.Web.NeatUpload" TagPrefix="Upload" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>PWPS-1管理</title>
    <link id="mainCss" href="css/bluelightmain.css" rel="stylesheet" type="text/css" />
    <script src="js/jquery-1.7.2.min.js" type="text/javascript"></script>
    <script src="js/allAHandler.js" type="text/javascript"></script>
    <script language="javascript" type="text/javascript">
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
                    <table cellpadding="0" cellspacing="0" width="100%" align="center" class="bian">
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
                                                        <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,PWPS1GungLi%>"></asp:Label> </td>
                                                    <td width="5">
                                                        <%--<img src="ImagesSkin/main_top_r.jpg" width="5" height="31" alt="" />--%>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td align="center" style="padding-top: 5px;">
                                <table cellpadding="2" cellspacing="0" class="formBgStyle" width="100%">
                                    <tr>
                                        <td align="right" style="width: 150px" class="formItemBgStyle">
                                            <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,HanJieGongYiPingDing%>"></asp:Label> 
                                        </td>
                                        <td align="left" class="formItemBgStyle">
                                            <asp:DropDownList ID="DL_WeldProCode" runat="server" AutoPostBack="True" DataTextField="Code" DataValueField="Code" OnSelectedIndexChanged="DL_WeldProCode_SelectedIndexChanged">
                                            </asp:DropDownList>
                                        </td>
                                        <td align="right" class="formItemBgStyle">
                                            <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,DanWeiMingChen%>"></asp:Label> 
                                        </td>
                                        <td align="left" class="formItemBgStyle">
                                            <asp:TextBox ID="TB_EntityName" runat="server" CssClass="shuru"></asp:TextBox>
                                        </td>
                                        <td align="right" class="formItemBgStyle">
                                            <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,RiQi%>"></asp:Label> </td>
                                        <td align="left" class="formItemBgStyle">
                                            <asp:TextBox ID="TB_PWPS1DateTime" runat="server" CssClass="shuru" ReadOnly="false"></asp:TextBox>
                                            <cc1:CalendarExtender ID="CalendarExtender2" runat="server" Format="yyyy-MM-dd" TargetControlID="TB_PWPS1DateTime">
                                            </cc1:CalendarExtender>
                                        </td>
                                        <td align="right" class="formItemBgStyle">
                                            <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,LeiBieHao%>"></asp:Label></td>
                                        <td align="left" class="formItemBgStyle">
                                            <asp:TextBox ID="TB_PWPSCategory" runat="server" CssClass="shuru"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right" class="formItemBgStyle" style="width: 150px">
                                            <asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,YuLeiBieHao%>"></asp:Label></td>
                                        <td align="left" class="formItemBgStyle">
                                            <asp:TextBox ID="TB_PWPSAndCategory" runat="server" CssClass="shuru"></asp:TextBox>
                                        </td>
                                        <td align="right" class="formItemBgStyle">
                                            <asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,BiaoZhunHao%>"></asp:Label></td>
                                        <td align="left" class="formItemBgStyle">
                                            <asp:TextBox ID="TB_PWPSStandardNo" runat="server" CssClass="shuru"></asp:TextBox>
                                        </td>
                                        <td align="right" class="formItemBgStyle">
                                            <asp:Label ID="Label8" runat="server" Text="<%$ Resources:lang,YuBiaoZHunHao%>"></asp:Label></td>
                                        <td align="left" class="formItemBgStyle">
                                            <asp:TextBox ID="TB_PWPSAndStandardNo" runat="server" CssClass="shuru"></asp:TextBox>
                                        </td>
                                        <td align="right" class="formItemBgStyle">
                                            <asp:Label ID="Label9" runat="server" Text="<%$ Resources:lang,DuiJieHanFengMuCaiHouDu%>"></asp:Label></td>
                                        <td align="left" class="formItemBgStyle">
                                            <asp:TextBox ID="TB_ButtWeldMateThicknessRange" runat="server" CssClass="shuru"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right" class="formItemBgStyle" style="width: 150px">
                                            <asp:Label ID="Label10" runat="server" Text="<%$ Resources:lang,JiaoHanFengMuCaiHouDu%>"></asp:Label> </td>
                                        <td align="left" class="formItemBgStyle">
                                            <asp:TextBox ID="TB_FilletWeldMateThicknessRange" runat="server" CssClass="shuru"></asp:TextBox>
                                        </td>
                                        <td align="right" class="formItemBgStyle">
                                            <asp:Label ID="Label11" runat="server" Text="<%$ Resources:lang,DuiJieHanFeng%>"></asp:Label></td>
                                        <td align="left" class="formItemBgStyle">
                                            <asp:TextBox ID="TB_ButtWeldOtherInfo" runat="server" CssClass="shuru"></asp:TextBox>
                                        </td>
                                        <td align="right" class="formItemBgStyle">
                                            <asp:Label ID="Label12" runat="server" Text="<%$ Resources:lang,JiaoHanFeng%>"></asp:Label></td>
                                        <td align="left" class="formItemBgStyle">
                                            <asp:TextBox ID="TB_FilletWeld" runat="server" CssClass="shuru"></asp:TextBox>
                                        </td>
                                        <td align="right" class="formItemBgStyle">
                                            <asp:Label ID="Label13" runat="server" Text="<%$ Resources:lang,MuCaiQiTa%>"></asp:Label> </td>
                                        <td align="left" class="formItemBgStyle">
                                            <asp:TextBox ID="TB_PWPSMetalOther" runat="server" CssClass="shuru"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right" class="formItemBgStyle" style="width: 150px">
                                            <asp:Label ID="Label14" runat="server" Text="<%$ Resources:lang,HanTiaoCaiJianHao%>"></asp:Label></td>
                                        <td align="left" class="formItemBgStyle">
                                            <asp:TextBox ID="TB_ElectInspection" runat="server" CssClass="shuru"></asp:TextBox>
                                        </td>
                                        <td align="right" class="formItemBgStyle">
                                            <asp:Label ID="Label15" runat="server" Text="<%$ Resources:lang,HanSiCaiJianHao%>"></asp:Label></td>
                                        <td align="left" class="formItemBgStyle">
                                            <asp:TextBox ID="TB_WireInspection" runat="server" CssClass="shuru"></asp:TextBox>
                                        </td>
                                        <td align="right" class="formItemBgStyle">
                                            <asp:Label ID="Label16" runat="server" Text="<%$ Resources:lang,HanJiCaiJianHao%>"></asp:Label></td>
                                        <td align="left" class="formItemBgStyle">
                                            <asp:TextBox ID="TB_FluxInspection" runat="server" CssClass="shuru"></asp:TextBox>
                                        </td>
                                        <td align="right" class="formItemBgStyle">
                                            <asp:Label ID="Label17" runat="server" Text="<%$ Resources:lang,DuiJieHanFengJingShuHouDu%>"></asp:Label></td>
                                        <td align="left" class="formItemBgStyle">
                                            <asp:TextBox ID="TB_ButtWeldMetaThickRange" runat="server" CssClass="shuru"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right" class="formItemBgStyle" style="width: 150px">
                                            <asp:Label ID="Label18" runat="server" Text="<%$ Resources:lang,HanTiaoBiaoZhun%>"></asp:Label></td>
                                        <td align="left" class="formItemBgStyle" colspan="3">
                                            <asp:TextBox ID="TB_ElectStandard" runat="server" CssClass="shuru" Width="98%"></asp:TextBox>
                                        </td>
                                        <td align="right" class="formItemBgStyle">
                                            <asp:Label ID="Label19" runat="server" Text="<%$ Resources:lang,JiXieHuaChengDu%>"></asp:Label></td>
                                        <td align="left" class="formItemBgStyle" colspan="3">
                                            <asp:TextBox ID="TB_MechanizationDegree" runat="server" Width="95%"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right" class="formItemBgStyle" style="width: 150px">
                                            <asp:Label ID="Label20" runat="server" Text="<%$ Resources:lang,HanSiBiaoZhun%>"></asp:Label></td>
                                        <td align="left" class="formItemBgStyle" colspan="3">
                                            <asp:TextBox ID="TB_WireStandard" runat="server" CssClass="shuru" Width="98%"></asp:TextBox>
                                        </td>
                                        <td align="right" class="formItemBgStyle" rowspan="2" style="vertical-align: middle">
                                            <asp:Label ID="Label21" runat="server" Text="<%$ Resources:lang,HanJieJieTouJianTu%>"></asp:Label></td>
                                        <td align="left" class="formItemBgStyle" colspan="3" rowspan="2">
                                            <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
                                            <ContentTemplate>
                                                <div>
                                                    <Upload:InputFile ID="AttachFile" runat="server" Width="500px" />
                                                    <br />
                                                    <div id="ProgressBar">
                                                        <Upload:ProgressBar ID="ProgressBar1" runat="server" Height="100px" Width="500px">
                                                        </Upload:ProgressBar>
                                                    </div>
                                                </div>
                                            </ContentTemplate>
                                            <Triggers>
                                                <asp:PostBackTrigger ControlID="BT_Add" />
                                                <asp:PostBackTrigger ControlID="BT_Update" />
                                                <asp:PostBackTrigger ControlID="BT_Delete" />
                                            </Triggers>
                                            </asp:UpdatePanel>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right" class="formItemBgStyle" style="width: 150px">
                                            <asp:Label ID="Label22" runat="server" Text="<%$ Resources:lang,HanJiBiaoZhun%>"></asp:Label></td>
                                        <td align="left" class="formItemBgStyle" colspan="3">
                                            <asp:TextBox ID="TB_FluxStandard" runat="server" CssClass="shuru" Width="98%"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right" class="formItemBgStyle" style="width: 150px">
                                            <asp:Label ID="Label23" runat="server" Text="<%$ Resources:lang,BeiZhuShuoMing%>"></asp:Label></td>
                                        <td align="left" class="formItemBgStyle" colspan="3">
                                            <asp:TextBox ID="TB_PWPSDescr" runat="server" CssClass="shuru" Width="98%"></asp:TextBox>
                                        </td>
                                        <td align="right" class="formItemBgStyle">
                                            <asp:Label ID="Label24" runat="server" Text="<%$ Resources:lang,HanJieJieTouQiTa%>"></asp:Label></td>
                                        <td align="left" class="formItemBgStyle" colspan="3">
                                            <asp:TextBox ID="TB_WeldedJointOther" runat="server" Width="95%"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right" class="formItemBgStyle" style="width: 150px">
                                            <asp:Label ID="Label25" runat="server" Text="<%$ Resources:lang,JiaoHanFengJingShuHouDu%>"></asp:Label></td>
                                        <td align="left" class="formItemBgStyle">
                                            <asp:TextBox ID="TB_FilletWeldMetaThickRange" runat="server" CssClass="shuru"></asp:TextBox>
                                        </td>
                                        <td align="right" class="formItemBgStyle">
                                            <asp:Label ID="Label26" runat="server" Text="<%$ Resources:lang,HuaXueChengFengC%>"></asp:Label> </td>
                                        <td align="left" class="formItemBgStyle">
                                            <asp:TextBox ID="TB_C" runat="server" CssClass="shuru"></asp:TextBox>
                                        </td>
                                        <td align="right" class="formItemBgStyle">
                                            <asp:Label ID="Label27" runat="server" Text="<%$ Resources:lang,HuaXueChengFengMn%>"></asp:Label> </td>
                                        <td align="left" class="formItemBgStyle">
                                            <asp:TextBox ID="TB_Mn" runat="server" CssClass="shuru"></asp:TextBox>
                                        </td>
                                        <td align="right" class="formItemBgStyle">
                                            <asp:Label ID="Label28" runat="server" Text="<%$ Resources:lang,HuaXueChengFengSi%>"></asp:Label> </td>
                                        <td align="left" class="formItemBgStyle">
                                            <asp:TextBox ID="TB_Si" runat="server" CssClass="shuru"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right" class="formItemBgStyle" style="width: 150px">
                                            <asp:Label ID="Label29" runat="server" Text="<%$ Resources:lang,HuaChengFengS%>"></asp:Label> </td>
                                        <td align="left" class="formItemBgStyle">
                                            <asp:TextBox ID="TB_S" runat="server" CssClass="shuru"></asp:TextBox>
                                        </td>
                                        <td align="right" class="formItemBgStyle">
                                            <asp:Label ID="Label30" runat="server" Text="<%$ Resources:lang,HuaXueChengFengP%>"></asp:Label> </td>
                                        <td align="left" class="formItemBgStyle">
                                            <asp:TextBox ID="TB_P" runat="server" CssClass="shuru"></asp:TextBox>
                                        </td>
                                        <td align="right" class="formItemBgStyle">
                                            <asp:Label ID="Label31" runat="server" Text="<%$ Resources:lang,HuaXueChengFengCr%>"></asp:Label> </td>
                                        <td align="left" class="formItemBgStyle">
                                            <asp:TextBox ID="TB_Cr" runat="server" CssClass="shuru"></asp:TextBox>
                                        </td>
                                        <td align="right" class="formItemBgStyle">
                                            <asp:Label ID="Label32" runat="server" Text="<%$ Resources:lang,HuaXueChengFengNi%>"></asp:Label> </td>
                                        <td align="left" class="formItemBgStyle">
                                            <asp:TextBox ID="TB_Ni" runat="server" CssClass="shuru"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right" class="formItemBgStyle" style="width: 150px">
                                            <asp:Label ID="Label33" runat="server" Text="<%$ Resources:lang,HuaXueChengFengNo%>"></asp:Label> </td>
                                        <td align="left" class="formItemBgStyle">
                                            <asp:TextBox ID="TB_Mo" runat="server" CssClass="shuru"></asp:TextBox>
                                        </td>
                                        <td align="right" class="formItemBgStyle">
                                            <asp:Label ID="Label34" runat="server" Text="<%$ Resources:lang,HuaXueChengFengCu%>"></asp:Label> </td>
                                        <td align="left" class="formItemBgStyle">
                                            <asp:TextBox ID="TB_Cu" runat="server" CssClass="shuru"></asp:TextBox>
                                        </td>
                                        <td align="right" class="formItemBgStyle">
                                            <asp:Label ID="Label35" runat="server" Text="<%$ Resources:lang,HuaXueChengFengTi%>"></asp:Label>  </td>
                                        <td align="left" class="formItemBgStyle">
                                            <asp:TextBox ID="TB_Ti" runat="server" CssClass="shuru"></asp:TextBox>
                                        </td>
                                        <td align="right" class="formItemBgStyle">
                                            <asp:Label ID="Label36" runat="server" Text="<%$ Resources:lang,HuaXueChengFengNb%>"></asp:Label> </td>
                                        <td align="left" class="formItemBgStyle">
                                            <asp:TextBox ID="TB_Nb" runat="server" CssClass="shuru"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right" style="width: 150px;" class="formItemBgStyle">
                                            <asp:Label ID="lbl_sql" runat="server" Visible="False"></asp:Label>
                                        </td>
                                        <td align="left" class="formItemBgStyle" colspan="7">
                                            <asp:Button ID="BT_Add" runat="server" OnClick="BT_Add_Click" CssClass="inpu" Text="<%$ Resources:lang,XinZeng%>" />&nbsp;
                                        <asp:Button ID="BT_Update" runat="server" OnClick="BT_Update_Click" CssClass="inpu"
                                            Text="<%$ Resources:lang,BaoCun%>" Enabled="False" />
                                            &nbsp;
                                        <asp:Button ID="BT_Delete" runat="server" OnClick="BT_Delete_Click" OnClientClick="return confirm(getDeleteMsgByLangCode())" CssClass="inpu"
                                            Text="<%$ Resources:lang,ShanChu%>" Enabled="False" />
                                            <asp:Label ID="lbl_ID" runat="server" Visible="False"></asp:Label>
                                            <asp:Label ID="lbl_Path" runat="server" Visible="False"></asp:Label>
                                        </td>
                                    </tr>
                                </table>
                                <br />
                                <table cellpadding="2" cellspacing="0" class="formBgStyle" width="90%">
                                    <tr>
                                        <td align="left">
                                            <asp:Label ID="Label37" runat="server" Text="<%$ Resources:lang,PWPS1XinXi%>"></asp:Label> <asp:TextBox ID="TextBox1" runat="server" Width="120px"></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:Button ID="BT_Query" runat="server" CssClass="inpu" OnClick="BT_Query_Click" Text="<%$ Resources:lang,ChaXun%>" />
                                        </td>
                                    </tr>
                                </table>
                                <table cellpadding="2" cellspacing="0" class="formBgStyle" width="95%">
                                    <tr>
                                        <td align="center" style="text-align: left" class="formItemBgStyle">&nbsp;&nbsp;&nbsp; <asp:Label ID="Label39" runat="server" Text="<%$ Resources:lang,PWPSGuanLiLieBiao%>"></asp:Label>：</td>
                                    </tr>
                                    <tr>
                                        <td align="center" class="formItemBgStyle">
                                            <table width="98%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                                <tr>
                                                    <td>
                                                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                            <tr>
                                                                <td width="10%" align="center">
                                                                    <strong>
                                                                        <asp:Label ID="Label38" runat="server" Text="<%$ Resources:lang,BianHao%>"></asp:Label> </strong></td>
                                                                <td width="10%" align="center">
                                                                    <strong>
                                                                        <asp:Label ID="Label40" runat="server" Text="<%$ Resources:lang,HanJieGongYiPingDing%>"></asp:Label> </strong></td>
                                                                <td width="10%" align="center">
                                                                    <strong>
                                                                        <asp:Label ID="Label41" runat="server" Text="<%$ Resources:lang,DanWeiMingChen%>"></asp:Label> </strong></td>
                                                                <td width="10%" align="center">
                                                                    <strong>
                                                                        <asp:Label ID="Label42" runat="server" Text="<%$ Resources:lang,RiQi%>"></asp:Label> </strong></td>
                                                                <td width="10%" align="center">
                                                                    <strong>
                                                                        <asp:Label ID="Label43" runat="server" Text="<%$ Resources:lang,YuLeiBiehao%>"></asp:Label> </strong></td>
                                                                <td width="10%" align="center">
                                                                    <strong>
                                                                        <asp:Label ID="Label44" runat="server" Text="<%$ Resources:lang,YuBiaoZhunHao%>"></asp:Label> </strong></td>
                                                                <td width="14%" align="center">
                                                                    <strong>
                                                                        <asp:Label ID="Label45" runat="server" Text="<%$ Resources:lang,MuCaiQiTa%>"></asp:Label> </strong></td>
                                                                <td width="10%" align="center">
                                                                    <strong>
                                                                        <asp:Label ID="Label46" runat="server" Text="<%$ Resources:lang,HanJieJieTouJianTu%>"></asp:Label> </strong></td>
                                                                <td width="16%" align="center">
                                                                    <strong>
                                                                        <asp:Label ID="Label47" runat="server" Text="<%$ Resources:lang,BeiZhuShuoMing%>"></asp:Label>   </strong></td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                </tr>
                                            </table>
                                            <asp:DataGrid ID="DataGrid2" runat="server" AutoGenerateColumns="False" Height="1px"
                                                OnItemCommand="DataGrid2_ItemCommand" Width="98%" CellPadding="4" ForeColor="#333333"
                                                GridLines="None" ShowHeader="false" AllowPaging="true" PageSize="10" OnPageIndexChanged="DataGrid2_PageIndexChanged">
                                                
                                                <ItemStyle CssClass="itemStyle" />
                                                <HeaderStyle HorizontalAlign="Center" BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                <Columns>
                                                    <asp:TemplateColumn HeaderText="编号">
                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                        <ItemTemplate>
                                                            <asp:Button ID="BT_ID" runat="server" CssClass="inpu" Text='<%# DataBinder.Eval(Container.DataItem,"ID") %>' />
                                                        </ItemTemplate>
                                                        <HeaderStyle BorderColor="#394f66" BorderStyle="Solid" BorderWidth="1px" Font-Bold="true"
                                                            HorizontalAlign="Center" />
                                                    </asp:TemplateColumn>
                                                    <asp:BoundColumn DataField="WeldProCode" HeaderText="焊接工艺评定">
                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="10%" />
                                                        <HeaderStyle BorderColor="#394f66" BorderStyle="Solid" BorderWidth="1px" Font-Bold="true"
                                                            HorizontalAlign="Center" />
                                                    </asp:BoundColumn>
                                                    <asp:BoundColumn DataField="EntityName" HeaderText="单位名称">
                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="10%" />
                                                        <HeaderStyle BorderColor="#394f66" BorderStyle="Solid" BorderWidth="1px" Font-Bold="true"
                                                            HorizontalAlign="Center" />
                                                    </asp:BoundColumn>
                                                    <asp:BoundColumn DataField="PWPS1DateTime" HeaderText="日期" DataFormatString="{0:yyyy-MM-dd}">
                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="10%" />
                                                        <HeaderStyle BorderColor="#394f66" BorderStyle="Solid" BorderWidth="1px" Font-Bold="true"
                                                            HorizontalAlign="Center" />
                                                    </asp:BoundColumn>
                                                    <asp:BoundColumn DataField="PWPSAndCategory" HeaderText="与类别号">
                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="10%" />
                                                        <HeaderStyle BorderColor="#394f66" BorderStyle="Solid" BorderWidth="1px" Font-Bold="true"
                                                            HorizontalAlign="Center" />
                                                    </asp:BoundColumn>
                                                    <asp:BoundColumn DataField="PWPSAndStandardNo" HeaderText="与标准号">
                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="10%" />
                                                        <HeaderStyle BorderColor="#394f66" BorderStyle="Solid" BorderWidth="1px" Font-Bold="true"
                                                            HorizontalAlign="Center" />
                                                    </asp:BoundColumn>
                                                    <asp:BoundColumn DataField="PWPSMetalOther" HeaderText="母材其他">
                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="14%" />
                                                        <HeaderStyle BorderColor="#394f66" BorderStyle="Solid" BorderWidth="1px" Font-Bold="true"
                                                            HorizontalAlign="Center" />
                                                    </asp:BoundColumn>
                                                    <asp:HyperLinkColumn DataNavigateUrlField="WeldedJointDiagram" DataNavigateUrlFormatString="{0}" DataTextField="WeldProCode" HeaderText="焊接接头简图" Target="_blank">
                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="10%" />
                                                    </asp:HyperLinkColumn>
                                                    <asp:BoundColumn DataField="PWPSDescr" HeaderText="备注说明">
                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="16%" />
                                                        <HeaderStyle BorderColor="#394f66" BorderStyle="Solid" BorderWidth="1px" Font-Bold="true"
                                                            HorizontalAlign="Center" />
                                                    </asp:BoundColumn>
                                                </Columns>
                                                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                <EditItemStyle BackColor="#2461BF" />
                                                <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />
                                            </asp:DataGrid>
                                        </td>
                                    </tr>
                                </table>
                                <br />
                                <asp:TextBox ID="TB_DepartString" runat="server" Style="visibility: hidden"></asp:TextBox>
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
