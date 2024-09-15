<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTCustomerQuestionHandleDetail_YOUP.aspx.cs" Inherits="TTCustomerQuestionHandleDetail_YOUP" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register Assembly="NickLee.Web.UI" Namespace="NickLee.Web.UI" TagPrefix="NickLee" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc2" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link id="mainCss" href="css/bluelightmain.css" rel="stylesheet" type="text/css" />
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
            <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="True" EnableScriptLocalization="True">
            </asp:ScriptManager>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <div id="AboveDiv">
                        <table id="AboveTable" cellpadding="0" width="100%" cellspacing="0" class="bian">
                            <tr>
                                <td>

                                    <table cellpadding="0" cellspacing="0" border="0" width="100%">
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
                                                                        <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,KeHuFuWuChuLi%>"></asp:Label>
                                                                    </td>
                                                                    <td width="5">
                                                                        <%--<img src="ImagesSkin/main_top_r.jpg" width="5" height="31" alt="" />--%></td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="padding-top: 5px">
                                                <table width="98%">
                                                    <tr>
                                                        <td style="text-align: Right;" colspan="2">
                                                            <asp:DataList ID="DataList2" runat="server" CellPadding="0" ForeColor="#333333" Height="1px"
                                                                Width="100%">
                                                                <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                                <HeaderTemplate>
                                                                    <table width="100%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                                                        <tr>
                                                                            <td>
                                                                                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                                    <tr>
                                                                                        <td width="5%" align="center">
                                                                                            <strong>
                                                                                                <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,BianHao%>"></asp:Label></strong>
                                                                                        </td>
                                                                                        <td width="10%" align="center">
                                                                                            <strong>
                                                                                                <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,XingMing%>"></asp:Label></strong>
                                                                                        </td>
                                                                                        <td width="10%" align="center">
                                                                                            <strong>
                                                                                                <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,DianHuaYi%>"></asp:Label></strong>
                                                                                        </td>
                                                                                        <td width="10%" align="center">
                                                                                            <strong>
                                                                                                <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,ShenFenZhengHao%>"></asp:Label></strong>
                                                                                        </td>
                                                                                        <td width="13%" align="center">
                                                                                            <strong>
                                                                                                <asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,KeHuDengJi%>"></asp:Label></strong>
                                                                                        </td>
                                                                                        <td width="10%" align="center">
                                                                                            <strong>
                                                                                                <asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,KeHuLaiYuan%>"></asp:Label></strong>
                                                                                        </td>
                                                                                        <td width="10%" align="center">
                                                                                            <strong>
                                                                                                <asp:Label ID="Label8" runat="server" Text="<%$ Resources:lang,HangYeLeiXing%>"></asp:Label></strong>
                                                                                        </td>
                                                                                        <td width="5%" align="center">
                                                                                            <strong>
                                                                                                <asp:Label ID="Label9" runat="server" Text="<%$ Resources:lang,DianShu%>"></asp:Label></strong>
                                                                                        </td>
                                                                                        <td width="10%" align="center">
                                                                                            <strong>
                                                                                                <asp:Label ID="Label10" runat="server" Text="<%$ Resources:lang,ShouCiZiXun%>"></asp:Label></strong>
                                                                                        </td>
                                                                                        <td width="5%" align="center">
                                                                                            <strong>
                                                                                                <asp:Label ID="Label11" runat="server" Text="<%$ Resources:lang,XuQiuZiJin%>"></asp:Label></strong>
                                                                                        </td>
                                                                                    </tr>
                                                                                </table>
                                                                            </td>
                                                                        </tr>
                                                                    </table>
                                                                </HeaderTemplate>
                                                                <ItemTemplate>
                                                                    <table border="0" cellpadding="4" cellspacing="0" width="100%">
                                                                        <tr>
                                                                            <td class="tdLeft" style="width: 5%; text-align: center;">
                                                                                <%#DataBinder .Eval (Container .DataItem ,"ID") %>
                                                                            </td>
                                                                            <td class="tdLeft" style="width: 10%; padding-left: 5px; text-align: center;">
                                                                                <%#DataBinder .Eval (Container .DataItem,"Company") %>
                                                                            </td>
                                                                            <td class="tdLeft" style="width: 10%; text-align: center;">
                                                                                <%#DataBinder .Eval (Container .DataItem,"PhoneNumber") %>
                                                                            </td>
                                                                            <td class="tdLeft" style="width: 10%; text-align: center;">
                                                                                <%#DataBinder.Eval(Container.DataItem, "CustomerArea")%>
                                                                            </td>
                                                                            <td class="tdLeft" style="width: 13%; text-align: center;">
                                                                                <%#DataBinder .Eval (Container .DataItem,"OperatorName") %>
                                                                            </td>
                                                                            <td class="tdLeft" style="width: 10%; text-align: center;">
                                                                                <%#DataBinder .Eval (Container .DataItem,"Address") %>
                                                                            </td>
                                                                            <td class="tdLeft" style="width: 10%; text-align: center;">
                                                                                <%#DataBinder .Eval (Container .DataItem,"UserPosition") %>
                                                                            </td>
                                                                            <td class="tdLeft" style="width: 5%; text-align: center;">
                                                                                <%#DataBinder .Eval (Container .DataItem,"PostCode") %>
                                                                            </td>
                                                                            <td class="tdLeft" style="width: 10%; text-align: center;">
                                                                                <%#DataBinder.Eval(Container.DataItem, "SummitTime","{0:yyyy-MM-dd}")%>
                                                                            </td>
                                                                            <td class="tdLeft" style="width: 5%; text-align: center;">
                                                                                <%#DataBinder .Eval (Container .DataItem, "Type") %>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td class="tdLeft" style="width: 5%; text-align: center; font-size: 10pt;">
                                                                                <asp:Label ID="Label12" runat="server" Text="<%$ Resources:lang,JiBenZiLiao%>"></asp:Label>
                                                                            </td>
                                                                            <td class="tdRight" colspan="9" style="width: 95%; text-align: left; padding-left: 5px">
                                                                                <%#DataBinder .Eval (Container .DataItem,"Question") %>
                                                                            </td>
                                                                        </tr>
                                                                    </table>
                                                                </ItemTemplate>
                                                                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                                
                                                                <ItemStyle CssClass="itemStyle" />
                                                            </asp:DataList>
                                                            <asp:DataList ID="DataList1" runat="server" CellPadding="0" ForeColor="#333333" Height="1px"
                                                                Width="100%">
                                                                <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                                <HeaderTemplate>
                                                                    <table width="100%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                                                        <tr>
                                                                            <td>
                                                                                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                                    <tr>
                                                                                        <td width="5%" align="center">
                                                                                            <strong>
                                                                                                <asp:Label ID="Label13" runat="server" Text="<%$ Resources:lang,BianHao%>"></asp:Label></strong>
                                                                                        </td>
                                                                                        <td width="10%" align="center">
                                                                                            <strong>
                                                                                                <asp:Label ID="Label14" runat="server" Text="<%$ Resources:lang,XingMing%>"></asp:Label></strong>
                                                                                        </td>
                                                                                        <td width="13%" align="center">
                                                                                            <strong>
                                                                                                <asp:Label ID="Label15" runat="server" Text="<%$ Resources:lang,KeHuDengJi%>"></asp:Label></strong>
                                                                                        </td>
                                                                                        <td width="10%" align="center">
                                                                                            <strong>
                                                                                                <asp:Label ID="Label16" runat="server" Text="<%$ Resources:lang,KeHuLaiYuan%>"></asp:Label></strong>
                                                                                        </td>
                                                                                        <td width="10%" align="center">
                                                                                            <strong>
                                                                                                <asp:Label ID="Label17" runat="server" Text="<%$ Resources:lang,HangYeLeiXing%>"></asp:Label></strong>
                                                                                        </td>
                                                                                        <td width="5%" align="center">
                                                                                            <strong>
                                                                                                <asp:Label ID="Label18" runat="server" Text="<%$ Resources:lang,DianShu%>"></asp:Label></strong>
                                                                                        </td>
                                                                                        <td width="10%" align="center">
                                                                                            <strong>
                                                                                                <asp:Label ID="Label19" runat="server" Text="<%$ Resources:lang,ShouCiZiXun%>"></asp:Label></strong>
                                                                                        </td>
                                                                                        <td width="5%" align="center">
                                                                                            <strong>
                                                                                                <asp:Label ID="Label20" runat="server" Text="<%$ Resources:lang,XuQiuZiJin%>"></asp:Label></strong>
                                                                                        </td>
                                                                                    </tr>
                                                                                </table>
                                                                            </td>
                                                                        </tr>
                                                                    </table>
                                                                </HeaderTemplate>
                                                                <ItemTemplate>
                                                                    <table border="0" cellpadding="4" cellspacing="0" width="100%">
                                                                        <tr>
                                                                            <td class="tdLeft" style="width: 5%; text-align: center;">
                                                                                <%#DataBinder .Eval (Container .DataItem ,"ID") %>
                                                                            </td>
                                                                            <td class="tdLeft" style="width: 10%; padding-left: 5px; text-align: center;">
                                                                                <%#DataBinder .Eval (Container .DataItem,"Company") %>
                                                                            </td>
                                                                            <td class="tdLeft" style="width: 13%; text-align: center;">
                                                                                <%#DataBinder .Eval (Container .DataItem,"OperatorName") %>
                                                                            </td>
                                                                            <td class="tdLeft" style="width: 10%; text-align: center;">
                                                                                <%#DataBinder .Eval (Container .DataItem,"Address") %>
                                                                            </td>
                                                                            <td class="tdLeft" style="width: 10%; text-align: center;">
                                                                                <%#DataBinder .Eval (Container .DataItem,"UserPosition") %>
                                                                            </td>
                                                                            <td class="tdLeft" style="width: 5%; text-align: center;">
                                                                                <%#DataBinder .Eval (Container .DataItem,"PostCode") %>
                                                                            </td>
                                                                            <td class="tdLeft" style="width: 10%; text-align: center;">
                                                                                <%#DataBinder.Eval(Container.DataItem, "SummitTime","{0:yyyy-MM-dd}")%>
                                                                            </td>
                                                                            <td class="tdLeft" style="width: 5%; text-align: center;">
                                                                                <%#DataBinder .Eval (Container .DataItem, "Type") %>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td class="tdLeft" style="width: 5%; text-align: center; font-size: 10pt;">
                                                                                <asp:Label ID="Label21" runat="server" Text="<%$ Resources:lang,JiBenZiLiao%>"></asp:Label>
                                                                            </td>
                                                                            <td class="tdRight" colspan="9" style="width: 95%; text-align: left; padding-left: 5px">
                                                                                <%#DataBinder .Eval (Container .DataItem,"Question") %>
                                                                            </td>
                                                                        </tr>
                                                                    </table>
                                                                </ItemTemplate>
                                                                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                                
                                                                <ItemStyle CssClass="itemStyle" />
                                                            </asp:DataList>
                                                            <table cellpadding="5" cellspacing="0" border="0" width="100%">
                                                                <tr>
                                                                    <td colspan="10" class="tdTopLine"></td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="2" style="text-align: left; font-weight: bold; height: 24px; color: #394f66; background-image: url('ImagesSkin/titleBG.jpg')">
                                                            <b>
                                                                <asp:Label ID="Label83" runat="server" Text="<%$ Resources:lang,FuWuChuLiXiJie%>"></asp:Label>：</b><asp:Button ID="BT_Accept" runat="server" CssClass="inpu" OnClick="BT_Accept_Click"
                                                                Text="<%$ Resources:lang,ShouLi%>" />

                                                            <asp:Button ID="BT_Exit" runat="server" CssClass="inpu" OnClick="BT_Exit_Click"
                                                                Text="<%$ Resources:lang,TuiChuShouLi%>" />

                                                            <asp:Button ID="BT_Finish" runat="server" CssClass="inpu" OnClick="BT_Finish_Click"
                                                                Text="<%$ Resources:lang,WanCheng%>" />

                                                            <asp:Button ID="BT_DeleteQuestion" runat="server" CssClass="inpu" Text="<%$ Resources:lang,ShanChu%>" OnClick="BT_DeleteQuestion_Click" OnClientClick="return confirm(getDeleteMsgByLangCode())"/>

                                                            <asp:Label ID="Label84" runat="server" Text="<%$ Resources:lang,ZhiJieChengYuan%>"></asp:Label>：<asp:DropDownList ID="DL_Operator" DataTextField="UserName" DataValueField="UserCode" runat="server" >
                                                            </asp:DropDownList>

                                                            <asp:Button ID="BT_TransferOperator" runat="server" CssClass="inpuLong" Text="<%$ Resources:lang,ZhiDingWeiShouLiRen%>" OnClick="BT_TransferOperator_Click" />

                                                            <asp:HyperLink ID="HL_QuestionToCustomer" runat="server" Target="_blank">--><asp:Label ID="Label85" runat="server" Text="<%$ Resources:lang,ZhuanChengKeHuHuoGuanLianKeHu%>"></asp:Label></asp:HyperLink>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="2" align="left" valign="top">
                                                            <table style="width: 100%; padding: 5px 0px 0px 5px" cellpadding="3" cellspacing="0" class="formBgStyle">
                                                                <tr>
                                                                    <td style="width: 7%; text-align: right;" class="formItemBgStyle">
                                                                        <asp:Label ID="Label22" runat="server" Text="<%$ Resources:lang,BianHao%>"></asp:Label>：</td>
                                                                    <td colspan="5" style="width: 90%; text-align: left;" class="formItemBgStyle">
                                                                        <asp:Label ID="LB_ID" runat="server"></asp:Label>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td style="text-align: right;" class="formItemBgStyle">
                                                                        <asp:Label ID="Label23" runat="server" Text="<%$ Resources:lang,YeWuRenYuan%>"></asp:Label>：</td>
                                                                    <td style="text-align: left;" class="formItemBgStyle">
                                                                        <asp:TextBox ID="TB_HandleWay" runat="server"></asp:TextBox>
                                                                    </td>
                                                                    <td style="text-align: right;" class="formItemBgStyle">
                                                                        <asp:Label ID="Label24" runat="server" Text="<%$ Resources:lang,TuiJianYinHang%>"></asp:Label>：</td>
                                                                    <td style="text-align: left;" class="formItemBgStyle">
                                                                        <asp:TextBox ID="TB_AcceptorContactWay" runat="server"></asp:TextBox>
                                                                    </td>
                                                                    <td style="text-align: right;" class="formItemBgStyle">
                                                                        <asp:Label ID="Label25" runat="server" Text="<%$ Resources:lang,YiBanLiYinHang%>"></asp:Label>：</td>
                                                                    <td style="text-align: left;" class="formItemBgStyle">
                                                                        <asp:TextBox ID="HE_CustomerComment" runat="server" Width="150px"></asp:TextBox>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="formItemBgStyle" style="text-align: right;">
                                                                        <asp:Label ID="Label26" runat="server" Text="<%$ Resources:lang,JingBanRen%>"></asp:Label>：</td>
                                                                    <td class="formItemBgStyle" style="text-align: left;">
                                                                        <asp:TextBox ID="TB_CustomerAcceptor" runat="server"></asp:TextBox>
                                                                    </td>
                                                                    <td class="formItemBgStyle" style="text-align: right;">
                                                                        <asp:Label ID="Label27" runat="server" Text="<%$ Resources:lang,ShangMenShiJian%>"></asp:Label>：</td>
                                                                    <td class="formItemBgStyle" style="text-align: left;">
                                                                        <asp:TextBox ID="DLC_UpDoorDate" runat="server" ReadOnly="false"></asp:TextBox>
                                                                        <cc2:CalendarExtender ID="CalendarExtender2" runat="server" Enabled="True" Format="yyyy-MM-dd" TargetControlID="DLC_UpDoorDate">
                                                                        </cc2:CalendarExtender>
                                                                    </td>
                                                                    <td class="formItemBgStyle" style="text-align: right;">
                                                                        <asp:Label ID="Label28" runat="server" Text="<%$ Resources:lang,YiJiaoZhiYinHang%>"></asp:Label>：</td>
                                                                    <td class="formItemBgStyle" style="text-align: left;">
                                                                        <asp:TextBox ID="TB_ToBank" runat="server"></asp:TextBox>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="formItemBgStyle" style="text-align: right;">
                                                                        <asp:Label ID="Label29" runat="server" Text="<%$ Resources:lang,TiQianShenQingShiJian%>"></asp:Label>：</td>
                                                                    <td class="formItemBgStyle" style="text-align: left;">
                                                                        <asp:TextBox ID="DLC_SumApplyTime" runat="server" ReadOnly="false"></asp:TextBox>
                                                                        <cc2:CalendarExtender ID="CalendarExtender3" runat="server" Enabled="True" Format="yyyy-MM-dd" TargetControlID="DLC_SumApplyTime">
                                                                        </cc2:CalendarExtender>
                                                                    </td>
                                                                    <td class="formItemBgStyle" style="text-align: right;">
                                                                        <asp:Label ID="Label30" runat="server" Text="<%$ Resources:lang,BanLiQingKuang%>"></asp:Label>：</td>
                                                                    <td class="formItemBgStyle" style="text-align: left;">
                                                                        <asp:DropDownList ID="DL_DealSituation" runat="server" Height="19px">
                                                                            <asp:ListItem Value="处理中" Text="<%$ Resources:lang,ShenPiZhong%>"/>
                                                                            <asp:ListItem Value="拒绝" Text="<%$ Resources:lang,JuJue%>"/>
                                                                            <asp:ListItem Value="批款" Text="<%$ Resources:lang,PiKuan%>"/>
                                                                        </asp:DropDownList>
                                                                    </td>
                                                                    <td class="formItemBgStyle" style="text-align: right;">
                                                                        <asp:Label ID="Label31" runat="server" Text="<%$ Resources:lang,PiKuanShiJian%>"></asp:Label>：</td>
                                                                    <td class="formItemBgStyle" style="text-align: left;">
                                                                        <asp:TextBox ID="DLC_NewTime" runat="server" ReadOnly="false"></asp:TextBox>
                                                                        <cc2:CalendarExtender ID="CalendarExtender4" runat="server" Enabled="True" Format="yyyy-MM-dd" TargetControlID="DLC_NewTime">
                                                                        </cc2:CalendarExtender>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="formItemBgStyle" style="text-align: right;">
                                                                        <asp:Label ID="Label32" runat="server" Text="<%$ Resources:lang,PiKuanWan%>"></asp:Label>：</td>
                                                                    <td class="formItemBgStyle" style="text-align: left;">
                                                                        <asp:TextBox ID="TB_NewNum" runat="server"></asp:TextBox>
                                                                    </td>
                                                                    <td class="formItemBgStyle" style="text-align: right;">
                                                                        <asp:Label ID="Label33" runat="server" Text="<%$ Resources:lang,QianYue%>"></asp:Label>：</td>
                                                                    <td class="formItemBgStyle" style="text-align: left;">
                                                                        <asp:TextBox ID="TB_Signing" runat="server"></asp:TextBox>
                                                                    </td>
                                                                    <td class="formItemBgStyle" style="text-align: right;">
                                                                        <asp:Label ID="Label34" runat="server" Text="<%$ Resources:lang,FangKuan%>"></asp:Label>：</td>
                                                                    <td class="formItemBgStyle" style="text-align: left;">
                                                                        <asp:TextBox ID="TB_Lending" runat="server"></asp:TextBox>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="formItemBgStyle" style="text-align: right;">
                                                                        <asp:Label ID="Label35" runat="server" Text="<%$ Resources:lang,ShouKuanRiQi%>"></asp:Label>：</td>
                                                                    <td class="formItemBgStyle" style="text-align: left;">
                                                                        <asp:TextBox ID="DLC_CollectionTime" runat="server" ReadOnly="false"></asp:TextBox>
                                                                        <cc2:CalendarExtender ID="CalendarExtender5" runat="server" Enabled="True" Format="yyyy-MM-dd" TargetControlID="DLC_CollectionTime">
                                                                        </cc2:CalendarExtender>
                                                                    </td>
                                                                    <td class="formItemBgStyle" style="text-align: right;">
                                                                        <asp:Label ID="Label36" runat="server" Text="<%$ Resources:lang,ShouKuanRen%>"></asp:Label>：</td>
                                                                    <td class="formItemBgStyle" style="text-align: left;">
                                                                        <asp:TextBox ID="TB_CollectionPer" runat="server"></asp:TextBox>
                                                                    </td>
                                                                    <td class="formItemBgStyle" style="text-align: right;">
                                                                        <asp:Label ID="Label37" runat="server" Text="<%$ Resources:lang,FanDianRiQi%>"></asp:Label>：</td>
                                                                    <td class="formItemBgStyle" style="text-align: left;">
                                                                        <asp:TextBox ID="DLC_RebatesTime" runat="server" ReadOnly="false"></asp:TextBox>
                                                                        <cc2:CalendarExtender ID="CalendarExtender6" runat="server" Enabled="True" Format="yyyy-MM-dd" TargetControlID="DLC_RebatesTime">
                                                                        </cc2:CalendarExtender>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="formItemBgStyle" style="text-align: right;">
                                                                        <asp:Label ID="Label38" runat="server" Text="<%$ Resources:lang,FanDian%>"></asp:Label>： </td>
                                                                    <td class="formItemBgStyle" style="text-align: left;">
                                                                        <asp:TextBox ID="TB_Rebates" runat="server"></asp:TextBox>
                                                                    </td>
                                                                    <td class="formItemBgStyle" style="text-align: right;">
                                                                        <asp:Label ID="Label39" runat="server" Text="<%$ Resources:lang,ChuLiZhuangTai%>"></asp:Label>： </td>
                                                                    <td class="formItemBgStyle" style="text-align: left;">
                                                                        <asp:DropDownList ID="DL_HandleStatus" runat="server" Height="19px">
                                                                            <asp:ListItem Value="处理中" Text="<%$ Resources:lang,ChuLiZhong%>"/>
                                                                            <asp:ListItem Value="评审中" Text="<%$ Resources:lang,PingShenZhong%>"/>
                                                                            <asp:ListItem Value="挂起" Text="<%$ Resources:lang,GuaQi%>"/>
                                                                            <asp:ListItem Value="完成" Text="<%$ Resources:lang,WanCheng%>"/>
                                                                            <asp:ListItem Value="取消" Text="<%$ Resources:lang,QuXiao%>"/>
                                                                        </asp:DropDownList>
                                                                    </td>
                                                                    <td class="formItemBgStyle" style="text-align: right;">
                                                                        <asp:Label ID="Label40" runat="server" Text="<%$ Resources:lang,YongShi%>"></asp:Label>： </td>
                                                                    <td class="formItemBgStyle" style="text-align: left;">
                                                                        <NickLee:NumberBox ID="NB_UsedTime" runat="server" MaxAmount="1000000000000" MinAmount="-1000000000000" Width="53px" Amount="1">1.00</NickLee:NumberBox>
                                                                        <asp:DropDownList ID="DL_TimeUnit" runat="server" Height="19px">
                                                                            <asp:ListItem Value="分钟" Text="<%$ Resources:lang,FenZhong%>"/>
                                                                            <asp:ListItem Value="小时" Text="<%$ Resources:lang,XiaoShi%>"/>
                                                                            <asp:ListItem Value="天" Text="<%$ Resources:lang,Tian%>"/>
                                                                        </asp:DropDownList>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td style="text-align: right;" class="formItemBgStyle">
                                                                        <asp:Label ID="Label41" runat="server" Text="<%$ Resources:lang,ChuLiNeiRong%>"></asp:Label>： 
                                                                    </td>
                                                                    <td colspan="5" style="width: 90%; text-align: left;" class="formItemBgStyle">
                                                                        <CKEditor:CKEditorControl ID="HE_HandleDetail" runat="server" Width="90%" Height="100" Visible="false" />
                                                                        <CKEditor:CKEditorControl runat="server" ID="HT_HandleDetail" Width="90%" Height="100px" Visible="False" />
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td style="text-align: right;" class="formItemBgStyle">
                                                                        <asp:Label ID="Label42" runat="server" Text="<%$ Resources:lang,XiaCiFuWuShiJian%>"></asp:Label>：
                                                                    </td>
                                                                    <td style="text-align: left;" class="formItemBgStyle">
                                                                        <asp:TextBox ID="DLC_NextServiceTime" ReadOnly="false" runat="server"></asp:TextBox>
                                                                        <ajaxToolkit:CalendarExtender Format="yyyy-MM-dd" ID="CalendarExtender1" runat="server" TargetControlID="DLC_NextServiceTime">
                                                                        </ajaxToolkit:CalendarExtender>
                                                                    </td>
                                                                    <td style="text-align: right;" class="formItemBgStyle">
                                                                        <asp:Label ID="Label43" runat="server" Text="<%$ Resources:lang,TiQianTongZhiTianShu%>"></asp:Label>：
                                                                    </td>
                                                                    <td style="text-align: left;" colspan="3" class="formItemBgStyle">
                                                                        <NickLee:NumberBox ID="NB_PreDays" runat="server" MaxAmount="1000000000000" MinAmount="-1000000000000" Width="53px" Precision="0">0</NickLee:NumberBox>
                                                                        天</td>
                                                                </tr>
                                                                <tr>
                                                                    <td style="text-align: right;" class="formItemBgStyle"></td>
                                                                    <td colspan="5" style="text-align: left;" class="formItemBgStyle">
                                                                        <asp:Button ID="BT_Add" CssClass="inpu" runat="server" Text="<%$ Resources:lang,XinJian%>" OnClick="BT_Add_Click" />
                                                                        <asp:Button ID="BT_Update" runat="server" CssClass="inpu" Enabled="false"
                                                                            OnClick="BT_Update_Click" Text="<%$ Resources:lang,BaoCun%>" />

                                                                        <asp:Button ID="BT_Delete" runat="server" CssClass="inpu" Enabled="false" OnClick="BT_Delete_Click" OnClientClick="return confirm(getDeleteMsgByLangCode())"
                                                                            Text="<%$ Resources:lang,ShanChu%>" />

                                                                        &nbsp;   &nbsp;   &nbsp;   &nbsp;
                                                                        <asp:HyperLink ID="HL_RelatedDoc" runat="server" NavigateUrl="TTCollaborationRelatedDoc.aspx"
                                                                            Target="_blank">
                                                                            <asp:Label ID="Label86" runat="server" Text="<%$ Resources:lang,XiangGuanWenJian%>"></asp:Label></asp:HyperLink>

                                                                        &nbsp;

                                                                         <asp:HyperLink ID="HL_Expense" runat="server" NavigateUrl="TTProExpense.aspx" Target="_blank">---><asp:Label ID="Label44" runat="server" Text="<%$ Resources:lang,FeiYongMingXiYuBaoXiao%>"></asp:Label></asp:HyperLink>

                                                                        &nbsp;

                                                                        <asp:HyperLink ID="HL_ResoveResultReview"
                                                                            runat="server" NavigateUrl="TTCustomerQuestionResultReviewWF.aspx" Target="_blank">---><asp:Label ID="Label45" runat="server" Text="<%$ Resources:lang,TiJiaoPingShen%>"></asp:Label></asp:HyperLink>
                                                                        <br />
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="2" align="left">
                                                            <cc2:TabContainer CssClass="ajax_tab_menu" ID="TabContainer1" runat="server" ActiveTabIndex="0" Width="100%">
                                                                <cc2:TabPanel ID="TabPanel1" runat="server" HeaderText="协作日志" TabIndex="0">
                                                                    <HeaderTemplate>
                                                                        <asp:Label ID="Label46" runat="server" Text="<%$ Resources:lang,KeFuJiLu%>"></asp:Label></HeaderTemplate>
                                                                    <ContentTemplate>
                                                                        <asp:DataList ID="DataList3" runat="server" CellPadding="0" ForeColor="#333333" OnItemCommand="DataList3_ItemCommand"
                                                                            Height="1px" Width="100%">
                                                                            <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                                            <HeaderTemplate>
                                                                                <table width="100%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                                                                    <tr>
                                                                                        <td>
                                                                                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                                                <tr>
                                                                                                    <td width="5%" align="center">
                                                                                                        <strong>
                                                                                                            <asp:Label ID="Label47" runat="server" Text="<%$ Resources:lang,BianHao%>"></asp:Label></strong>
                                                                                                    </td>
                                                                                                    <td width="7%" align="center">
                                                                                                        <strong>
                                                                                                            <asp:Label ID="Label48" runat="server" Text="<%$ Resources:lang,FuWuRiQi%>"></asp:Label></strong>
                                                                                                    </td>
                                                                                                    <td width="5%" align="center">
                                                                                                        <strong>
                                                                                                            <asp:Label ID="Label49" runat="server" Text="<%$ Resources:lang,YeWuRenYuan%>"></asp:Label></strong>
                                                                                                    </td>
                                                                                                    <td width="5%" align="center">
                                                                                                        <strong>
                                                                                                            <asp:Label ID="Label50" runat="server" Text="<%$ Resources:lang,TuiJianYinHang%>"></asp:Label></strong>
                                                                                                    </td>
                                                                                                    <td width="7%" align="center">
                                                                                                        <strong>
                                                                                                            <asp:Label ID="Label51" runat="server" Text="<%$ Resources:lang,ShangMenShiJian%>"></asp:Label></strong>
                                                                                                    </td>
                                                                                                    <td width="8%" align="center">
                                                                                                        <strong>
                                                                                                            <asp:Label ID="Label52" runat="server" Text="<%$ Resources:lang,BanLiYinHang%>"></asp:Label></strong>
                                                                                                    </td>
                                                                                                    <td width="5%" align="center">
                                                                                                        <strong>
                                                                                                            <asp:Label ID="Label53" runat="server" Text="<%$ Resources:lang,JingBanRen%>"></asp:Label></strong>
                                                                                                    </td>
                                                                                                    <td width="7%" align="center">
                                                                                                        <strong>
                                                                                                            <asp:Label ID="Label54" runat="server" Text="<%$ Resources:lang,TiJiaoShiJian%>"></asp:Label></strong>
                                                                                                    </td>
                                                                                                    <td width="5%" align="center">
                                                                                                        <strong>
                                                                                                            <asp:Label ID="Label55" runat="server" Text="<%$ Resources:lang,BanLiQingKuang%>"></asp:Label></strong>
                                                                                                    </td>
                                                                                                    <td width="7%" align="center">
                                                                                                        <strong>
                                                                                                            <asp:Label ID="Label56" runat="server" Text="<%$ Resources:lang,PiKuanShiJian%>"></asp:Label></strong>
                                                                                                    </td>
                                                                                                    <td width="5%" align="center">
                                                                                                        <strong>
                                                                                                            <asp:Label ID="Label57" runat="server" Text="<%$ Resources:lang,PiKuanWan%>"></asp:Label></strong>
                                                                                                    </td>
                                                                                                    <td width="5%" align="center">
                                                                                                        <strong>
                                                                                                            <asp:Label ID="Label58" runat="server" Text="<%$ Resources:lang,QianYue%>"></asp:Label></strong>
                                                                                                    </td>
                                                                                                    <td width="5%" align="center">
                                                                                                        <strong>
                                                                                                            <asp:Label ID="Label59" runat="server" Text="<%$ Resources:lang,FangKuan%>"></asp:Label></strong>
                                                                                                    </td>
                                                                                                    <td width="7%" align="center">
                                                                                                        <strong>
                                                                                                            <asp:Label ID="Label60" runat="server" Text="<%$ Resources:lang,ShouKuanRiQi%>"></asp:Label></strong>
                                                                                                    </td>
                                                                                                    <td width="5%" align="center">
                                                                                                        <strong>
                                                                                                            <asp:Label ID="Label61" runat="server" Text="<%$ Resources:lang,ShouKuanRen%>"></asp:Label></strong>
                                                                                                    </td>
                                                                                                    <td width="7%" align="center">
                                                                                                        <strong>
                                                                                                            <asp:Label ID="Label62" runat="server" Text="<%$ Resources:lang,FanDianRiQi%>"></asp:Label></strong>
                                                                                                    </td>
                                                                                                    <td width="5%" align="center">
                                                                                                        <strong>
                                                                                                            <asp:Label ID="Label63" runat="server" Text="<%$ Resources:lang,FanDian%>"></asp:Label></strong>
                                                                                                    </td>
                                                                                                </tr>
                                                                                            </table>
                                                                                        </td>
                                                                                    </tr>
                                                                                </table>
                                                                            </HeaderTemplate>
                                                                            <ItemTemplate>
                                                                                <table cellpadding="4" cellspacing="0" width="100%">
                                                                                    <tr>
                                                                                        <td class="tdLeft" style="width: 5%; text-align: center;">
                                                                                            <asp:Button ID="BT_ID" runat="server" Text=' <%#DataBinder .Eval (Container .DataItem ,"ID") %> ' CssClass="inpu" CommandName="Update" Width="50px" />
                                                                                        </td>
                                                                                        <td class="tdLeft" style="width: 7%; text-align: center;">
                                                                                            <%#DataBinder.Eval(Container.DataItem, "HandleTime","{0:yyyy/MM/dd}")%>
                                                                                        </td>
                                                                                        <td class="tdLeft" style="width: 5%; padding-left: 5px; text-align: left;">
                                                                                            <%#DataBinder.Eval(Container.DataItem, "HandleWay")%>
                                                                                        </td>
                                                                                        <td class="tdLeft" style="width: 5%; text-align: center;">
                                                                                            <%#DataBinder.Eval(Container.DataItem, "AcceptorContactWay")%>
                                                                                        </td>
                                                                                        <td class="tdLeft" style="width: 7%; text-align: center;">
                                                                                            <%#DataBinder.Eval(Container.DataItem, "UpDoorDate","{0:yyyy/MM/dd}")%>
                                                                                        </td>
                                                                                        <td class="tdLeft" style="width: 8%; text-align: center;">
                                                                                            <%#DataBinder .Eval (Container .DataItem ,"CustomerComment") %>
                                                                                        </td>
                                                                                        <td class="tdLeft" style="width: 5%; text-align: center;">
                                                                                            <%#DataBinder .Eval (Container .DataItem ,"CustomerAcceptor") %>
                                                                                        </td>
                                                                                        <td class="tdRight" style="width: 7%; text-align: center;">
                                                                                            <%#DataBinder.Eval(Container.DataItem, "SumApplyTime","{0:yyyy/MM/dd}")%>
                                                                                        </td>

                                                                                        <td class="tdLeft" style="width: 5%; text-align: center;">
                                                                                            <%#DataBinder .Eval (Container .DataItem ,"DealSituation") %>
                                                                                        </td>
                                                                                        <td class="tdRight" style="width: 7%; text-align: center;">
                                                                                            <%#DataBinder.Eval(Container.DataItem, "NewTime","{0:yyyy/MM/dd}")%>
                                                                                        </td>
                                                                                        <td class="tdLeft" style="width: 5%; text-align: center;">
                                                                                            <%#DataBinder .Eval (Container .DataItem ,"NewNum") %>
                                                                                        </td>
                                                                                        <td class="tdLeft" style="width: 5%; text-align: center;">
                                                                                            <%#DataBinder .Eval (Container .DataItem ,"Signing") %>
                                                                                        </td>
                                                                                        <td class="tdLeft" style="width: 5%; text-align: center;">
                                                                                            <%#DataBinder .Eval (Container .DataItem ,"Lending") %>
                                                                                        </td>
                                                                                        <td class="tdRight" style="width: 7%; text-align: center;">
                                                                                            <%#DataBinder.Eval(Container.DataItem, "CollectionTime","{0:yyyy/MM/dd}")%>
                                                                                        </td>
                                                                                        <td class="tdLeft" style="width: 5%; text-align: center;">
                                                                                            <%#DataBinder .Eval (Container .DataItem ,"CollectionPer") %>
                                                                                        </td>
                                                                                        <td class="tdRight" style="width: 7%; text-align: center;">
                                                                                            <%#DataBinder.Eval(Container.DataItem, "RebatesTime","{0:yyyy/MM/dd}")%>
                                                                                        </td>
                                                                                        <td class="tdLeft" style="width: 5%; text-align: center;">
                                                                                            <%#DataBinder .Eval (Container .DataItem ,"Rebates") %>
                                                                                        </td>
                                                                                    </tr>
                                                                                </table>
                                                                            </ItemTemplate>
                                                                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                                            
                                                                            <ItemStyle CssClass="itemStyle" />
                                                                        </asp:DataList>
                                                                        <asp:DataList ID="DataList4" runat="server" CellPadding="0" ForeColor="#333333" OnItemCommand="DataList4_ItemCommand"
                                                                            Height="1px" Width="100%">
                                                                            <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                                            <HeaderTemplate>
                                                                                <table width="100%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                                                                    <tr>
                                                                                        <td>
                                                                                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                                                <tr>
                                                                                                    <td width="5%" align="center">
                                                                                                        <strong>
                                                                                                            <asp:Label ID="Label64" runat="server" Text="<%$ Resources:lang,BianHao%>"></asp:Label></strong>
                                                                                                    </td>
                                                                                                    <td width="7%" align="center">
                                                                                                        <strong>
                                                                                                            <asp:Label ID="Label65" runat="server" Text="<%$ Resources:lang,FuWuRiQi%>"></asp:Label></strong>
                                                                                                    </td>
                                                                                                    <td width="5%" align="center">
                                                                                                        <strong>
                                                                                                            <asp:Label ID="Label66" runat="server" Text="<%$ Resources:lang,YeWuRenYuan%>"></asp:Label></strong>
                                                                                                    </td>
                                                                                                    <td width="5%" align="center">
                                                                                                        <strong>
                                                                                                            <asp:Label ID="Label67" runat="server" Text="<%$ Resources:lang,TuiJianYinHang%>"></asp:Label></strong>
                                                                                                    </td>
                                                                                                    <td width="7%" align="center">
                                                                                                        <strong>
                                                                                                            <asp:Label ID="Label68" runat="server" Text="<%$ Resources:lang,ShangMenShiJian%>"></asp:Label></strong>
                                                                                                    </td>
                                                                                                    <td width="8%" align="center">
                                                                                                        <strong>
                                                                                                            <asp:Label ID="Label69" runat="server" Text="<%$ Resources:lang,BanLiYinHang%>"></asp:Label></strong>
                                                                                                    </td>
                                                                                                    <td width="5%" align="center">
                                                                                                        <strong>
                                                                                                            <asp:Label ID="Label70" runat="server" Text="<%$ Resources:lang,JingBanRen%>"></asp:Label></strong>
                                                                                                    </td>
                                                                                                    <td width="7%" align="center">
                                                                                                        <strong>
                                                                                                            <asp:Label ID="Label71" runat="server" Text="<%$ Resources:lang,TiJiaoShiJian%>"></asp:Label></strong>
                                                                                                    </td>
                                                                                                    <td width="5%" align="center">
                                                                                                        <strong>
                                                                                                            <asp:Label ID="Label72" runat="server" Text="<%$ Resources:lang,BanLiQingKuang%>"></asp:Label></strong>
                                                                                                    </td>
                                                                                                    <td width="7%" align="center">
                                                                                                        <strong>
                                                                                                            <asp:Label ID="Label73" runat="server" Text="<%$ Resources:lang,PiKuanShiJian%>"></asp:Label></strong>
                                                                                                    </td>
                                                                                                    <td width="5%" align="center">
                                                                                                        <strong>
                                                                                                            <asp:Label ID="Label74" runat="server" Text="<%$ Resources:lang,QianYue%>"></asp:Label></strong>
                                                                                                    </td>
                                                                                                    <td width="5%" align="center">
                                                                                                        <strong>
                                                                                                            <asp:Label ID="Label75" runat="server" Text="<%$ Resources:lang,FangKuan%>"></asp:Label></strong>
                                                                                                    </td>
                                                                                                    <td width="5%" align="center">
                                                                                                        <strong>
                                                                                                            <asp:Label ID="Label76" runat="server" Text="<%$ Resources:lang,ShouKuanRen%>"></asp:Label></strong>
                                                                                                    </td>
                                                                                                </tr>
                                                                                            </table>
                                                                                        </td>
                                                                                    </tr>
                                                                                </table>
                                                                            </HeaderTemplate>
                                                                            <ItemTemplate>
                                                                                <table cellpadding="4" cellspacing="0" width="100%">
                                                                                    <tr>
                                                                                        <td class="tdLeft" style="width: 5%; text-align: center;">
                                                                                            <asp:Button ID="BT_ID" runat="server" Text=' <%#DataBinder .Eval (Container .DataItem ,"ID") %> ' CssClass="inpu" CommandName="Update" Width="50px" />
                                                                                        </td>
                                                                                        <td class="tdLeft" style="width: 7%; text-align: center;">
                                                                                            <%#DataBinder.Eval(Container.DataItem, "HandleTime","{0:yyyy/MM/dd}")%>
                                                                                        </td>
                                                                                        <td class="tdLeft" style="width: 5%; padding-left: 5px; text-align: left;">
                                                                                            <%#DataBinder.Eval(Container.DataItem, "HandleWay")%>
                                                                                        </td>
                                                                                        <td class="tdLeft" style="width: 5%; text-align: center;">
                                                                                            <%#DataBinder.Eval(Container.DataItem, "AcceptorContactWay")%>
                                                                                        </td>
                                                                                        <td class="tdLeft" style="width: 7%; text-align: center;">
                                                                                            <%#DataBinder.Eval(Container.DataItem, "UpDoorDate","{0:yyyy/MM/dd}")%>
                                                                                        </td>
                                                                                        <td class="tdLeft" style="width: 8%; text-align: center;">
                                                                                            <%#DataBinder .Eval (Container .DataItem ,"CustomerComment") %>
                                                                                        </td>
                                                                                        <td class="tdLeft" style="width: 5%; text-align: center;">
                                                                                            <%#DataBinder .Eval (Container .DataItem ,"CustomerAcceptor") %>
                                                                                        </td>
                                                                                        <td class="tdRight" style="width: 7%; text-align: center;">
                                                                                            <%#DataBinder.Eval(Container.DataItem, "SumApplyTime","{0:yyyy/MM/dd}")%>
                                                                                        </td>
                                                                                        <td class="tdLeft" style="width: 5%; text-align: center;">
                                                                                            <%#DataBinder .Eval (Container .DataItem ,"DealSituation") %>
                                                                                        </td>
                                                                                        <td class="tdRight" style="width: 7%; text-align: center;">
                                                                                            <%#DataBinder.Eval(Container.DataItem, "NewTime","{0:yyyy/MM/dd}")%>
                                                                                        </td>
                                                                                        <td class="tdLeft" style="width: 5%; text-align: center;">
                                                                                            <%#DataBinder .Eval (Container .DataItem ,"Signing") %>
                                                                                        </td>
                                                                                        <td class="tdLeft" style="width: 5%; text-align: center;">
                                                                                            <%#DataBinder .Eval (Container .DataItem ,"Lending") %>
                                                                                        </td>
                                                                                        <td class="tdLeft" style="width: 5%; text-align: center;">
                                                                                            <%#DataBinder .Eval (Container .DataItem ,"CollectionPer") %>
                                                                                        </td>
                                                                                    </tr>
                                                                                </table>
                                                                            </ItemTemplate>
                                                                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                                            
                                                                            <ItemStyle CssClass="itemStyle" />
                                                                        </asp:DataList>
                                                                        <table cellpadding="5" cellspacing="0" border="0" width="100%">
                                                                            <tr>
                                                                                <td class="tdTopLine"></td>
                                                                            </tr>
                                                                        </table>
                                                                    </ContentTemplate>
                                                                </cc2:TabPanel>
                                                                <cc2:TabPanel ID="TabPanel2" runat="server" HeaderText="客服文件" TabIndex="1">
                                                                    <ContentTemplate>
                                                                        <table width="100%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                                                            <tr>
                                                                                <td>
                                                                                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                                        <tr>
                                                                                            <td width="10%" align="center"><strong>
                                                                                                <asp:Label ID="Label77" runat="server" Text="<%$ Resources:lang,XuHao%>"></asp:Label></strong></td>
                                                                                            <td width="15%" align="center"><strong>
                                                                                                <asp:Label ID="Label78" runat="server" Text="<%$ Resources:lang,LeiXing%>"></asp:Label></strong></td>
                                                                                            <td width="35%" align="center"><strong>
                                                                                                <asp:Label ID="Label79" runat="server" Text="<%$ Resources:lang,WenJianMing%>"></asp:Label></strong></td>
                                                                                            <td width="15%" align="center"><strong>
                                                                                                <asp:Label ID="Label80" runat="server" Text="<%$ Resources:lang,ZuoZhe%>"></asp:Label></strong></td>
                                                                                            <td width="15%" align="center"><strong>
                                                                                                <asp:Label ID="Label81" runat="server" Text="<%$ Resources:lang,ShangChuanZhe%>"></asp:Label></strong></td>
                                                                                            <td width="20%" align="center"><strong>
                                                                                                <asp:Label ID="Label82" runat="server" Text="<%$ Resources:lang,ShangChuanShiJian%>"></asp:Label></strong></td>
                                                                                        </tr>
                                                                                    </table>
                                                                                </td>
                                                                            </tr>
                                                                        </table>
                                                                        <asp:DataGrid ID="DataGrid1" runat="server"
                                                                            AutoGenerateColumns="False" ShowHeader="False"
                                                                            Height="1px" Width="100%" CellPadding="4" ForeColor="#333333"
                                                                            GridLines="None">
                                                                            <Columns>
                                                                                <asp:BoundColumn DataField="DocID" HeaderText="序号">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                                </asp:BoundColumn>
                                                                                <asp:BoundColumn DataField="DocType" HeaderText="类型">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="15%" />
                                                                                </asp:BoundColumn>
                                                                                <asp:HyperLinkColumn DataNavigateUrlField="Address" DataNavigateUrlFormatString="{0}"
                                                                                    DataTextField="DocName" HeaderText="文件名" Target="_blank">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="35%" />
                                                                                </asp:HyperLinkColumn>
                                                                                <asp:BoundColumn DataField="Author" HeaderText="作者">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="15%" />
                                                                                </asp:BoundColumn>
                                                                                <asp:BoundColumn DataField="UploadManName" HeaderText="上传者">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="15%" />
                                                                                </asp:BoundColumn>
                                                                                <asp:BoundColumn DataField="UploadTime" HeaderText="上传时间">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="20%" />
                                                                                </asp:BoundColumn>
                                                                                <asp:BoundColumn DataField="Address" Visible="False"></asp:BoundColumn>
                                                                            </Columns>
                                                                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                                            <EditItemStyle BackColor="#2461BF" />
                                                                            <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                                            <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />
                                                                            
                                                                            <ItemStyle CssClass="itemStyle" />
                                                                        </asp:DataGrid>
                                                                    </ContentTemplate>
                                                                </cc2:TabPanel>
                                                            </cc2:TabContainer>
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
