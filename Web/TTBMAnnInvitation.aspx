<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTBMAnnInvitation.aspx.cs" Inherits="TTBMAnnInvitation" %>

<%@ Register Assembly="NickLee.Web.UI" Namespace="NickLee.Web.UI" TagPrefix="NickLee" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Assembly="Brettle.Web.NeatUpload" Namespace="Brettle.Web.NeatUpload" TagPrefix="Upload" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link id="mainCss" href="css/bluelightmain.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript">
        function SelectAllDiv(item) {
            var thecheckbox = document.getElementsByTagName("input");
            for (i = 0; i < thecheckbox.length; i++) {
                if (thecheckbox[i].type == "checkbox") {
                    if (thecheckbox[i].id == "Checkbox1") {
                        thecheckbox[i].checked = item.checked;
                    }
                    else {
                        if (thecheckbox[i].id == "cbSend" || thecheckbox[i].id == "Checkbox2" || thecheckbox[i].id == "cbSend_Email") {
                        }
                        else {
                            thecheckbox[i].checked = item.checked;
                        }
                    }
                }
            }
        }
        function ReSelectDiv(item) {
            var thecheckbox = document.getElementsByTagName("input");
            for (i = 0; i < thecheckbox.length; i++) {
                if (thecheckbox[i].type == "checkbox") {
                    if (thecheckbox[i].id == "Checkbox2") {
                        thecheckbox[i].checked = item.checked;
                    }
                    else {
                        if (thecheckbox[i].id == "cbSend" || thecheckbox[i].id == "Checkbox1" || thecheckbox[i].id == "cbSend_Email") {
                        }
                        else {
                            if (thecheckbox[i].checked) {
                                thecheckbox[i].checked = false;
                            }
                            else {
                                thecheckbox[i].checked = true;
                            }
                        }
                    }
                }
            }
        }
    </script>
    <script src="js/jquery-1.7.2.min.js" type="text/javascript"></script>
    <script src="js/allAHandler.js" type="text/javascript"></script>
    <script language="javascript" type="text/javascript">
        $(function () {
            if (top.location != self.location) { } else { CloseWebPage(); }

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
                        <table cellpadding="0" cellspacing="0" width="100%" align="center" class="bian">
                            <tr>
                                <td height="31" class="page_topbj" colspan="2">
                                    <table width="96%" border="0" align="center" cellpadding="0" cellspacing="0">
                                        <tr>
                                            <td align="left">
                                                <table width="345" border="0" align="left" cellpadding="0" cellspacing="0">
                                                    <tr>
                                                        <td width="29">
                                                            <%--<img src="Logo/main_top_l.jpg" alt="" width="29" height="31" />--%>
                                                        </td>
                                                        <td align="center" background="ImagesSkin/main_top_bj.jpg" class="titlezi">
                                                            <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,ZhaoBiaoYaoQingHan%>"></asp:Label>
                                                        </td>
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
                                    <table cellpadding="2" cellspacing="0" class="formBgStyle" width="75%">
                                        <tr>
                                            <td align="center">
                                                <asp:Label ID="Label18" runat="server" Text="<%$ Resources:lang,YaoQingHanXinXi%>"></asp:Label>：<asp:TextBox ID="TextBox1" runat="server" Width="120px"></asp:TextBox>
                                           
                                                <asp:Label ID="Label19" runat="server" Text="<%$ Resources:lang,ZhaoBiaoFangAnXinXi%>"></asp:Label>：<asp:TextBox ID="TextBox2" runat="server" Width="120px"></asp:TextBox>
                                          
                                                <asp:Label ID="Label20" runat="server" Text="<%$ Resources:lang,BianZhiRiQi%>"></asp:Label>：<asp:TextBox ID="TextBox3" runat="server" Width="100px" ReadOnly="false"></asp:TextBox>
                                                <cc1:CalendarExtender ID="CalendarExtender5" runat="server" Format="yyyy-MM-dd" TargetControlID="TextBox3">
                                                </cc1:CalendarExtender>
                                                <asp:Label ID="Label21" runat="server" Text="<%$ Resources:lang,Zhi%>"></asp:Label><asp:TextBox ID="TextBox4" runat="server" Width="100px" ReadOnly="false"></asp:TextBox>
                                                <cc1:CalendarExtender ID="CalendarExtender6" runat="server" Format="yyyy-MM-dd" TargetControlID="TextBox4">
                                                </cc1:CalendarExtender>
                                            
                                                <asp:Button ID="BT_Query" runat="server" CssClass="inpu" OnClick="BT_Query_Click" Text="<%$ Resources:lang,ChaXun%>" />
                                            </td>
                                        </tr>
                                    </table>
                                    <table cellpadding="2" cellspacing="0" class="formBgStyle" width="100%">
                                        <tr>
                                            <td align="right" class="formItemBgStyle" style="padding: 5px 5px 5px 5px;">
                                                <asp:Button ID="BT_Create" runat="server" Text="<%$ Resources:lang,New%>" CssClass="inpuYello" OnClick="BT_Create_Click" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="center" class="formItemBgStyle">
                                                <table width="100%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                                    <tr>
                                                        <td>
                                                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                <tr>

                                                                    <td width="5%" align="center">
                                                                        <strong>
                                                                            <asp:Label ID="Label54" runat="server" Text="<%$ Resources:lang,BianJi %>" /></strong>
                                                                    </td>
                                                                    <td width="5%" align="center">
                                                                        <strong>
                                                                            <asp:Label ID="Label67" runat="server" Text="<%$ Resources:lang,ShanChu %>" /></strong>
                                                                    </td>
                                                                    <td width="5%" align="center">
                                                                        <strong>
                                                                            <asp:Label ID="Label23" runat="server" Text="<%$ Resources:lang,BianHao%>"></asp:Label></strong>
                                                                    </td>
                                                                    <td width="15%" align="center">
                                                                        <strong>
                                                                            <asp:Label ID="Label24" runat="server" Text="<%$ Resources:lang,MingCheng%>"></asp:Label></strong>
                                                                    </td>
                                                                    <td width="15%" align="center">
                                                                        <strong>
                                                                            <asp:Label ID="Label25" runat="server" Text="<%$ Resources:lang,ZhaoBiaoFangAn%>"></asp:Label></strong>
                                                                    </td>
                                                                    <td width="10%" align="center">
                                                                        <strong>
                                                                            <asp:Label ID="Label26" runat="server" Text="<%$ Resources:lang,ZhaoBiaoFangShi%>"></asp:Label></strong>
                                                                    </td>
                                                                    <td width="10%" align="center">
                                                                        <strong>
                                                                            <asp:Label ID="Label27" runat="server" Text="<%$ Resources:lang,BianZhiRen%>"></asp:Label></strong>
                                                                    </td>
                                                                    <td width="10%" align="center">
                                                                        <strong>
                                                                            <asp:Label ID="Label28" runat="server" Text="<%$ Resources:lang,BianZhiRiQi%>"></asp:Label></strong>
                                                                    </td>
                                                                    <td width="25%" align="center">
                                                                        <strong>
                                                                            <asp:Label ID="Label29" runat="server" Text="<%$ Resources:lang,YaoQingHanNeiRong%>"></asp:Label></strong>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                </table>
                                                <asp:DataGrid ID="DataGrid2" runat="server" AutoGenerateColumns="False" Height="1px"
                                                    OnItemCommand="DataGrid2_ItemCommand" Width="100%" CellPadding="4" ForeColor="#333333"
                                                    GridLines="None" ShowHeader="false" AllowPaging="true" PageSize="25" OnPageIndexChanged="DataGrid2_PageIndexChanged">

                                                    <ItemStyle CssClass="itemStyle" />
                                                    <HeaderStyle HorizontalAlign="Center" BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                    <Columns>
                                                        <asp:ButtonColumn ButtonType="LinkButton" CommandName="Update" Text="&lt;div&gt;&lt;img src=ImagesSkin/Update.png border=0 alt='修改' /&gt;&lt;/div&gt;">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                        </asp:ButtonColumn>
                                                        <asp:TemplateColumn HeaderText="Delete">
                                                            <ItemTemplate>
                                                                <asp:LinkButton ID="LBT_Delete" CommandName="Delete" runat="server" OnClientClick="return confirm(getDeleteMsgByLangCode())" Text="&lt;div&gt;&lt;img src=ImagesSkin/Delete.png border=0 alt='删除' /&gt;&lt;/div&gt;"></asp:LinkButton>
                                                            </ItemTemplate>
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                        </asp:TemplateColumn>

                                                        <asp:BoundColumn DataField="ID" HeaderText="编号">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                        </asp:BoundColumn>
                                                        <asp:BoundColumn DataField="Name" HeaderText="名称">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="15%" />
                                                            <HeaderStyle BorderColor="#394f66" BorderStyle="Solid" BorderWidth="1px" Font-Bold="true"
                                                                HorizontalAlign="Center" />
                                                        </asp:BoundColumn>
                                                        <asp:BoundColumn DataField="BidPlanName" HeaderText="招标计划名称">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="15%" />
                                                            <HeaderStyle BorderColor="#394f66" BorderStyle="Solid" BorderWidth="1px" Font-Bold="true"
                                                                HorizontalAlign="Center" />
                                                        </asp:BoundColumn>
                                                        <asp:BoundColumn DataField="BidWay" HeaderText="招标方式">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                            <HeaderStyle BorderColor="#394f66" BorderStyle="Solid" BorderWidth="1px" Font-Bold="true"
                                                                HorizontalAlign="Center" />
                                                        </asp:BoundColumn>
                                                        <asp:BoundColumn DataField="EnterPer" HeaderText="编制人">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                            <HeaderStyle BorderColor="#394f66" BorderStyle="Solid" BorderWidth="1px" Font-Bold="true"
                                                                HorizontalAlign="Center" />
                                                        </asp:BoundColumn>
                                                        <asp:BoundColumn DataField="EnterDate" HeaderText="编制日期" DataFormatString="{0:yyyy-MM-dd}">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="10%" />
                                                            <HeaderStyle BorderColor="#394f66" BorderStyle="Solid" BorderWidth="1px" Font-Bold="true"
                                                                HorizontalAlign="Center" />
                                                        </asp:BoundColumn>
                                                        <asp:BoundColumn DataField="Remark" HeaderText="招标内容">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="25%" />
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
                    </div>


                    <div class="layui-layer layui-layer-iframe" id="popwindow"
                        style="z-index: 9999; width: 900px; height: 530px; position: absolute; overflow: hidden; display: none; border-radius: 10px;">
                        <div class="layui-layer-title" style="background: #e7e7e8;" id="popwindow_title">
                            <asp:Label ID="Label112" runat="server" Text="&lt;div&gt;&lt;img src=ImagesSkin/Update.png border=0 width=30px height=30px alt='BusinessForm' /&gt;&lt;/div&gt;"></asp:Label>
                        </div>
                        <div id="popwindow_content" class="layui-layer-content" style="overflow: auto; padding: 0px 5px 0px 5px; text-align: left;">
                            <table>
                                <tr>
                                    <td width="75%">
                                        <table cellpadding="2" cellspacing="0" class="formBgStyle" width="98%">
                                            <tr>
                                                <td align="right" style="width: 150px" class="formItemBgStyle">
                                                    <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,MingCheng%>"></asp:Label>：
                                                </td>
                                                <td colspan="3" align="left" class="formItemBgStyle">
                                                    <asp:Label ID="LB_ID" runat="server"></asp:Label><asp:TextBox ID="TB_Name" runat="server" CssClass="shuru" Width="90%"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr style="color: #000000">
                                                <td align="right" style="width: 150px; height: 30px" class="formItemBgStyle">
                                                    <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,ZhaoBiaoFangAn%>"></asp:Label>：</td>
                                                <td align="left" class="formItemBgStyle">
                                                    <asp:DropDownList ID="DL_BidPlanID" runat="server" DataTextField="Name" DataValueField="ID" AutoPostBack="True" OnSelectedIndexChanged="DL_BidPlanID_SelectedIndexChanged">
                                                    </asp:DropDownList>
                                                </td>
                                                <td align="right" class="formItemBgStyle" style="height: 30px">
                                                    <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,ZhaoBiaoFangShi%>"></asp:Label>：</td>
                                                <td align="left" class="formItemBgStyle" style="height: 30px">
                                                    <asp:DropDownList ID="DL_BidWay" runat="server">
                                                        <asp:ListItem Value="邀请招标" Text="<%$ Resources:lang,YaoQingZhaoBiao%>" />
                                                        <asp:ListItem Value="公开招标" Text="<%$ Resources:lang,GongKaiZhaoBiao%>" />
                                                        <asp:ListItem Value="议标" Text="<%$ Resources:lang,YiBiao%>" />
                                                        <asp:ListItem Value="其他" Text="<%$ Resources:lang,QiTa%>" />
                                                    </asp:DropDownList>
                                                </td>
                                            </tr>
                                            <tr style="color: #000000">
                                                <td align="right" class="formItemBgStyle" style="width: 150px; height: 30px">
                                                    <asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,BianZhiRen%>"></asp:Label>：</td>
                                                <td align="left" class="formItemBgStyle">
                                                    <asp:TextBox ID="TB_EnterPer" runat="server" CssClass="shuru"></asp:TextBox>
                                                </td>
                                                <td align="right" class="formItemBgStyle" style="height: 30px">
                                                    <asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,BianZhiBuMen%>"></asp:Label>：</td>
                                                <td align="left" class="formItemBgStyle" style="height: 30px">
                                                    <asp:TextBox ID="TB_EnterUnit" runat="server" CssClass="shuru"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr style="color: #000000">
                                                <td align="right" class="formItemBgStyle" style="width: 150px; height: 30px">
                                                    <asp:Label ID="Label8" runat="server" Text="<%$ Resources:lang,BianZhiRiQi%>"></asp:Label>：</td>
                                                <td align="left" class="formItemBgStyle">
                                                    <asp:TextBox ID="DLC_EnterDate" runat="server" ReadOnly="false" CssClass="shuru"></asp:TextBox>
                                                    <cc1:CalendarExtender ID="CalendarExtender3" runat="server" Format="yyyy-MM-dd" TargetControlID="DLC_EnterDate">
                                                    </cc1:CalendarExtender>
                                                </td>
                                                <td align="right" class="formItemBgStyle" style="height: 30px">
                                                    <asp:Label ID="Label9" runat="server" Text="<%$ Resources:lang,TongZhi%>"></asp:Label>：</td>
                                                <td align="left" class="formItemBgStyle" style="height: 30px">
                                                    <asp:CheckBox ID="cbSend" runat="server" Text="<%$ Resources:lang,FaSongDuanXin%>" />
                                                    &nbsp;<asp:CheckBox ID="cbSend_Email" runat="server" Text="<%$ Resources:lang,FaSongYouJian%>" />
                                                </td>
                                            </tr>
                                            <tr style="color: #000000">
                                                <td align="right" class="formItemBgStyle" style="width: 150px; height: 30px">
                                                    <asp:Label ID="Label10" runat="server" Text="<%$ Resources:lang,FuJiaDuanXinTongZhiRen%>"></asp:Label>：</td>
                                                <td align="left" class="formItemBgStyle" colspan="3">
                                                    <asp:TextBox ID="TB_LSPhoneList" runat="server" CssClass="shuru" Width="70%"></asp:TextBox>
                                                    <asp:Label ID="Label37" runat="server" Text="<%$ Resources:lang,SRSJHMDGYGK%>"></asp:Label></td>
                                            </tr>
                                            <tr style="color: #000000">
                                                <td align="right" class="formItemBgStyle" style="width: 150px; height: 30px">
                                                    <asp:Label ID="Label11" runat="server" Text="<%$ Resources:lang,DuanXinTongZhiNeiRong%>"></asp:Label>：</td>
                                                <td align="left" class="formItemBgStyle" colspan="3">
                                                    <asp:TextBox ID="TB_PhoneRemark" runat="server" CssClass="shuru" Height="40px" TextMode="MultiLine" Width="90%"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr style="color: #000000">
                                                <td align="right" class="formItemBgStyle" style="width: 150px; height: 30px">
                                                    <asp:Label ID="Label12" runat="server" Text="<%$ Resources:lang,YouJianTongZhiNeiRong%>"></asp:Label>：</td>
                                                <td align="left" class="formItemBgStyle" colspan="3">
                                                    <asp:TextBox ID="TB_EmailRemark" runat="server" CssClass="shuru" Height="40px" TextMode="MultiLine" Width="90%"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr style="color: #000000">
                                                <td align="right" class="formItemBgStyle" style="width: 150px; height: 30px">
                                                    <asp:Label ID="Label13" runat="server" Text="<%$ Resources:lang,ZhaoBiaoDuiXiang%>"></asp:Label>：</td>
                                                <td align="left" class="formItemBgStyle" colspan="3" style="height: 30px">
                                                    <asp:TextBox ID="TB_BidObjects" runat="server" Width="80%" Enabled="False" CssClass="shuru"></asp:TextBox>
                                                    <asp:Label ID="Label14" runat="server" Text="<%$ Resources:lang,XuanZeYouBianDeChengBaoShang%>"></asp:Label></td>
                                            </tr>
                                            <tr style="color: #000000">
                                                <td align="right" class="formItemBgStyle" style="width: 150px; height: 30px">
                                                    <asp:Label ID="Label15" runat="server" Text="<%$ Resources:lang,YaoQingHanNeiRong%>"></asp:Label>： </td>
                                                <td align="left" class="formItemBgStyle" style="height: 30px" colspan="3">
                                                    <asp:TextBox ID="TB_Remark" runat="server" CssClass="shuru" Height="40px" TextMode="MultiLine" Width="90%"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr style="color: #000000">
                                                <td align="right" class="formItemBgStyle" style="width: 150px; height: 30px">
                                                    <asp:Label ID="Label16" runat="server" Text="<%$ Resources:lang,ChengBaoShangXiangYingShuoMing%>"></asp:Label>：</td>
                                                <td align="left" class="formItemBgStyle" colspan="3" style="height: 30px">
                                                    <asp:TextBox ID="TB_ResRemark" runat="server" CssClass="shuru" Height="40px" TextMode="MultiLine" Width="90%"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr style="color: #000000">
                                                <td colspan="2" align="right" class="formItemBgStyle">

                                                    <asp:HyperLink ID="HL_MakeProject" runat="server"></asp:HyperLink>
                                                </td>
                                            </tr>
                                        </table>
                                        &nbsp;<asp:Label ID="lbl_SupplierId" runat="server" Visible="False"></asp:Label>
                                        <asp:Label ID="lbl_sql" runat="server" Visible="False"></asp:Label>

                                    </td>

                                    <td align="center" style="padding-top: 5px;">
                                        <table cellpadding="2" cellspacing="0" class="formBgStyle" width="98%">
                                            <tr>
                                                <td align="left">&nbsp;&nbsp;&nbsp;<asp:Label ID="Label34" runat="server" Text="<%$ Resources:lang,GongYingShang%>"></asp:Label>：<asp:TextBox ID="txt_SupplierInfo" runat="server" Width="120px"></asp:TextBox>
                                                </td>
                                                <td>
                                                    <asp:Button ID="Button1" runat="server" CssClass="inpu" Text="<%$ Resources:lang,ChaXun%>" OnClick="Button1_Click" />
                                                </td>
                                            </tr>
                                        </table>
                                        <table cellpadding="2" cellspacing="0" class="formBgStyle" width="100%">
                                            <tr>
                                                <td style="text-align: left" class="formItemBgStyle">&nbsp;<asp:Label ID="Label30" runat="server" Text="<%$ Resources:lang,ChengBaoShangLieBiao%>"></asp:Label>：</td>
                                                <td style="text-align: center" class="formItemBgStyle">
                                                    <input id="Checkbox1" type="checkbox" onclick="SelectAllDiv(this);" /><asp:Label ID="Label35" runat="server" Text="<%$ Resources:lang,QuanXuan%>"></asp:Label><%--<a href="javascript:void(0);" title="全选" onclick="SelectAllDiv();" class="auto-style1">--%><%--</a>--%>|
                                                    <input id="Checkbox2" type="checkbox" onclick="ReSelectDiv(this);" /><%--<a href="javascript:void(0);" title="反选" onclick="ReSelectDiv();" class="auto-style1"> --%><asp:Label ID="Label36" runat="server" Text="<%$ Resources:lang,FanXuan%>"></asp:Label><%--</a>--%></td>
                                                <td style="text-align: center" class="formItemBgStyle">
                                                    <asp:Button ID="btnConfirmUp" runat="server" CssClass="inpu" OnClick="btnConfirm_Click" Text="<%$ Resources:lang,QueRen%>" /></td>
                                            </tr>
                                            <tr>
                                                <td align="center" class="formItemBgStyle" colspan="3">
                                                    <table width="100%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                                        <tr>
                                                            <td>
                                                                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                    <tr>
                                                                        <td width="10%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="Label31" runat="server" Text="<%$ Resources:lang,XuanZe%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="20%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="Label32" runat="server" Text="<%$ Resources:lang,QiYeBianMa%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="70%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="Label33" runat="server" Text="<%$ Resources:lang,QiYeMingCheng%>"></asp:Label></strong>
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                    <asp:DataGrid ID="DataGrid1" runat="server" AutoGenerateColumns="False" Height="1px" Width="100%" CellPadding="4" ForeColor="#333333" GridLines="None" ShowHeader="false">

                                                        <ItemStyle CssClass="itemStyle" />
                                                        <HeaderStyle HorizontalAlign="Center" BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                        <Columns>
                                                            <asp:TemplateColumn HeaderText="选择">
                                                                <ItemTemplate>
                                                                    <asp:CheckBox runat="server" ID="cbSelect" />
                                                                    <asp:HiddenField runat="server" ID="hfID" Value='<%# Eval("ID")%>' />
                                                                    <asp:HiddenField runat="server" ID="hfName" Value='<%# Eval("Name")%>' />
                                                                    <asp:HiddenField runat="server" ID="HfPhoneNumber" Value='<%# Eval("PhoneNum")%>' />
                                                                </ItemTemplate>
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                <HeaderStyle BorderColor="#394f66" BorderStyle="Solid" BorderWidth="1px" Font-Bold="true"
                                                                    HorizontalAlign="Center" />
                                                            </asp:TemplateColumn>
                                                            <asp:BoundColumn DataField="Code" HeaderText="企业编码">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="20%" />
                                                                <HeaderStyle BorderColor="#394f66" BorderStyle="Solid" BorderWidth="1px" Font-Bold="true"
                                                                    HorizontalAlign="Center" />
                                                            </asp:BoundColumn>
                                                            <asp:HyperLinkColumn DataNavigateUrlField="ID" DataNavigateUrlFormatString="TTBMSupplierInfoView.aspx?SupplierID={0}" DataTextField="Name" HeaderText="企业名称" Target="_blank">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="70%" />
                                                                <HeaderStyle BorderColor="#394f66" BorderStyle="Solid" BorderWidth="1px" Font-Bold="true" HorizontalAlign="Center" />
                                                            </asp:HyperLinkColumn>
                                                        </Columns>
                                                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                        <EditItemStyle BackColor="#2461BF" />
                                                        <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                        <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />
                                                    </asp:DataGrid>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            </table>

                        </div>
                        <div id="popwindow_footer0001" class="layui-layer-btn" style="border-top: 1px solid #ccc;">
                            <asp:LinkButton ID="BT_New" runat="server" class="layui-layer-btn notTab" OnClick="BT_New_Click" Text="<%$ Resources:lang,BaoCun%>"></asp:LinkButton><a class="layui-layer-btn notTab" onclick="return popClose();"><asp:Label ID="Label49" runat="server" Text="<%$ Resources:lang,GuanBi%>" /></a>
                        </div>
                        <span class="layui-layer-setwin"><a onclick="return popClose();" class="layui-layer-ico layui-layer-close layui-layer-close1 notTab" href="javascript:;"></a></span>
                    </div>

                    <div class="layui-layer-shade" id="popwindow_shade" style="z-index: 9998; background-color: #000; opacity: 0.3; filter: alpha(opacity=30); display: none;"></div>



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
