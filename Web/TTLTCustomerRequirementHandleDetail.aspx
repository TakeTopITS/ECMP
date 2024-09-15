<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTLTCustomerRequirementHandleDetail.aspx.cs" Inherits="TTLTCustomerRequirementHandleDetail" %>

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
        $(function () { if (top.location != self.location) { } else { CloseWebPage(); }

            

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
                                                                        <%-- <img src="ImagesSkin/main_top_r.jpg" width="5" height="31" />--%></td>
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
                                                                            <td width="7">
                                                                                <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" /></td>
                                                                            <td>
                                                                                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                                    <tr>
                                                                                        <td width="5%" align="center">
                                                                                            <strong>
                                                                                                <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,BianHao%>"></asp:Label></strong>
                                                                                        </td>
                                                                                        <td width="10%" align="center">
                                                                                            <strong>
                                                                                                <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,FuWuLeiXing%>"></asp:Label></strong>
                                                                                        </td>
                                                                                        <td width="5%" align="center">
                                                                                            <strong>
                                                                                                <asp:Label ID="Label51" runat="server" Text="<%$ Resources:lang,CYHSJ%>"></asp:Label></strong>
                                                                                        </td>
                                                                                        <td width="10%" align="center">
                                                                                            <strong>
                                                                                                <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,LianXiRen%>"></asp:Label></strong>
                                                                                        </td>
                                                                                        <td width="10%" align="center">
                                                                                            <strong>
                                                                                                <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,YaoQiuDaFuShiJian%>"></asp:Label></strong>
                                                                                        </td>
                                                                                        <td width="13%" align="center">
                                                                                            <strong>
                                                                                                <asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,DanWeiMingCheng%>"></asp:Label></strong>
                                                                                        </td>
                                                                                        <td width="10%" align="center">
                                                                                            <strong>
                                                                                                <asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,LianXiFangFa%>"></asp:Label></strong>
                                                                                        </td>
                                                                                        <td width="10%" align="center">
                                                                                            <strong>
                                                                                                <asp:Label ID="Label13" runat="server" Text="<%$ Resources:lang,EMail%>"></asp:Label></strong>
                                                                                        </td>

                                                                                        <td width="10%" align="center">
                                                                                            <strong>
                                                                                                <asp:Label ID="Label9" runat="server" Text="<%$ Resources:lang,TiJiaoShiJian%>"></asp:Label></strong>
                                                                                        </td>
                                                                                        <td width="5%" align="center">
                                                                                            <strong>
                                                                                                <asp:Label ID="Label10" runat="server" Text="<%$ Resources:lang,ZhuangTai%>"></asp:Label></strong>
                                                                                        </td>
                                                                                        <td width="7%" align="center">
                                                                                            <strong>
                                                                                                <asp:Label ID="Label11" runat="server" Text="<%$ Resources:lang,ShouLiRen%>"></asp:Label></strong>
                                                                                        </td>
                                                                                        <td width="5%" align="center">
                                                                                            <strong>
                                                                                                <asp:Label ID="Label12" runat="server" Text="<%$ Resources:lang,JiLuRen%>"></asp:Label></strong>
                                                                                        </td>
                                                                                    </tr>
                                                                                </table>
                                                                            </td>
                                                                            <td width="7" align="right">
                                                                                <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" /></td>
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
                                                                                <%#DataBinder .Eval (Container .DataItem,"Type") %>
                                                                            </td>
                                                                            <td class="tdLeft" style="width: 5%; padding-left: 5px; text-align: center;">
                                                                                <%#DataBinder .Eval (Container .DataItem,"IsImportant") %>
                                                                            </td>
                                                                            <td class="tdLeft" style="width: 10%; text-align: center;">
                                                                                <%#DataBinder .Eval (Container .DataItem,"ContactPerson") %>
                                                                            </td>
                                                                            <td class="tdLeft" style="width: 10%; text-align: center;">
                                                                                <%#DataBinder.Eval(Container.DataItem, "AnswerTime", "{0:yyyy/MM/dd}")%>
                                                                            </td>
                                                                            <td class="tdLeft" style="width: 13%; text-align: center;">
                                                                                <%#DataBinder .Eval (Container .DataItem,"Company") %>
                                                                            </td>
                                                                            <td class="tdLeft" style="width: 10%; text-align: center;">
                                                                                <%#DataBinder .Eval (Container .DataItem,"PhoneNumber") %>
                                                                            </td>
                                                                            <td class="tdLeft" style="width: 10%; text-align: center;">
                                                                                <%#DataBinder .Eval (Container .DataItem,"EMail") %>
                                                                            </td>

                                                                            <td class="tdLeft" style="width: 10%; text-align: center;">
                                                                                <%#DataBinder.Eval(Container.DataItem, "SummitTime", "{0:yyyy/MM/dd hh:MM:ss}")%>
                                                                            </td>
                                                                            <td class="tdLeft" style="width: 5%; text-align: center;">
                                                                                <%#DataBinder .Eval (Container .DataItem, "Status") %>
                                                                            </td>
                                                                            <td class="tdRight" style="width: 7%; text-align: center;">
                                                                                <%#DataBinder .Eval (Container .DataItem, "OperatorName") %>
                                                                            </td>
                                                                            <td class="tdRight" style="width: 5%; text-align: center;">
                                                                                <%#DataBinder .Eval (Container .DataItem, "RecorderCode") %>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td class="tdLeft" style="width: 5%; text-align: center; font-size: 10pt;">
                                                                                <asp:Label ID="Label14" runat="server" Text="<%$ Resources:lang,WenTi%>"></asp:Label>
                                                                            </td>
                                                                            <td class="tdRight" colspan="7" style="width: 95%; text-align: left; padding-left: 5px">

                                                                                <%#DataBinder .Eval (Container .DataItem,"Question") %>
                                                                            </td>
                                                                            <td class="tdLeft" style="text-align: Center;">
                                                                                <%#DataBinder .Eval (Container .DataItem, "UserIP") %>
                                                                            </td>
                                                                            <td class="tdRight" colspan="3" style="text-align: Left;">
                                                                                <%#DataBinder .Eval (Container .DataItem, "UserPosition") %>
                                                                            </td>
                                                                        </tr>
                                                                    </table>
                                                                </ItemTemplate>
                                                                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                                
                                                                <ItemStyle CssClass="itemStyle" />
                                                            </asp:DataList>
                                                            <table cellpadding="5" cellspacing="0" border="0" width="100%">
                                                                <tr>
                                                                    <td colspan="11" class="tdTopLine"></td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="2" align="left" style="font-weight: bold; height: 24px; color: #394f66; background-image: url('ImagesSkin/titleBG.jpg')">

                                                            <table width="98%">
                                                                <tr>
                                                                    <td>
                                                                        <asp:Label ID="Label48" runat="server" Text="<%$ Resources:lang,FuWuChuLiXiJie%>"></asp:Label>
                                                                        ：</td>
                                                                    <td>
                                                                        <asp:Button ID="BT_Accept" runat="server" CssClass="inpu" OnClick="BT_Accept_Click"
                                                                            Text="<%$ Resources:lang,ShouLi%>" />
                                                                    </td>
                                                                    <td>
                                                                        <asp:Button ID="BT_Exit" runat="server" CssClass="inpu" OnClick="BT_Exit_Click" Text="<%$ Resources:lang,TuiChuShouLi%>" />
                                                                    </td>
                                                                    <td>
                                                                        <asp:Label ID="Label51" runat="server" Text="<%$ Resources:lang,CYHSJ%>"></asp:Label>
                                                                        ：</td>
                                                                    <td>
                                                                        <asp:DropDownList ID="DL_IsImportant" runat="server" AutoPostBack="true" OnSelectedIndexChanged="DL_IsImportant_SelectedIndexChanged">
                                                                            <asp:ListItem>NO</asp:ListItem>
                                                                            <asp:ListItem>YES</asp:ListItem>
                                                                        </asp:DropDownList>
                                                                    </td>
                                                                    <td>
                                                                        <asp:Button ID="BT_Finish" runat="server" CssClass="inpu" OnClick="BT_Finish_Click" Text="<%$ Resources:lang,WanCheng%>" />
                                                                    </td>
                                                                    <td>
                                                                        <asp:Button ID="BT_DeleteQuestion" runat="server" CssClass="inpu" OnClick="BT_DeleteQuestion_Click" OnClientClick="return confirm(getDeleteMsgByLangCode())" Text="<%$ Resources:lang,ShanChu%>" />
                                                                    </td>
                                                                    <td>
                                                                        <asp:Label ID="Label49" runat="server" Text="<%$ Resources:lang,ZhiJieChengYuan%>"></asp:Label>
                                                                        ：</td>
                                                                    <td>
                                                                        <asp:DropDownList ID="DL_Operator" runat="server" DataTextField="UserName" DataValueField="UserCode">
                                                                        </asp:DropDownList>
                                                                    </td>
                                                                    <td>
                                                                        <asp:Button ID="BT_TransferOperator" runat="server" CssClass="inpuLong" OnClick="BT_TransferOperator_Click" Text="<%$ Resources:lang,ZhiDingWeiShouLiRen%>" />
                                                                    </td>
                                                                    <td>
                                                                        <asp:HyperLink ID="HL_QuestionToCustomer" runat="server" Target="_blank">--&gt;<asp:Label ID="Label50" runat="server" Text="<%$ Resources:lang,ZhuanChengKeHuHuoGuanLianKeHu%>"></asp:Label></asp:HyperLink>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>

                                                    <tr>
                                                        <td colspan="2" align="left" valign="top">
                                                            <cc2:TabContainer CssClass="ajax_tab_menu" ID="TabContainer2" runat="server" ActiveTabIndex="0" Width="100%">
                                                                <cc2:TabPanel ID="TabPanel3" runat="server" TabIndex="0">
                                                                    <HeaderTemplate>
                                                                        <asp:Label ID="Label8" runat="server" Text="<%$ Resources:lang,XuQiuChuLi%>"></asp:Label>
                                                                    </HeaderTemplate>
                                                                    <ContentTemplate>
                                                                        <table width="98%">
                                                                            <tr>
                                                                                <td align="left" valign="top">
                                                                                    <table style="width: 100%; padding: 5px 0px 0px 5px" cellpadding="3" cellspacing="0" class="formBgStyle">
                                                                                        <tr>
                                                                                            <td style="width: 7%; text-align: right;" class="formItemBgStyle">
                                                                                                <asp:Label ID="Label15" runat="server" Text="<%$ Resources:lang,BianHao %>"></asp:Label>：</td>
                                                                                            <td colspan="5" style="width: 90%; text-align: left;" class="formItemBgStyle">
                                                                                                <asp:Label ID="LB_ID" runat="server"></asp:Label></td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td style="text-align: right;" class="formItemBgStyle">
                                                                                                <asp:Label ID="Label16" runat="server" Text="<%$ Resources:lang,KeHuYiJian %>"></asp:Label>： </td>
                                                                                            <td colspan="5" style="text-align: left;" class="formItemBgStyle">
                                                                                                <CKEditor:CKEditorControl ID="HE_CustomerComment" runat="server" Width="99%" Height="80px" Visible="False" /><CKEditor:CKEditorControl ID="HT_CustomerComment" runat="server" Width="99%" Height="80px" Visible="False" />
                                                                                            </td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td style="text-align: right;" class="formItemBgStyle">
                                                                                                <asp:Label ID="Label17" runat="server" Text="<%$ Resources:lang,ChuLiFangShi %>"></asp:Label>： </td>
                                                                                            <td style="text-align: left;" class="formItemBgStyle">
                                                                                                <asp:TextBox ID="TB_HandleWay" runat="server" Width="200px"></asp:TextBox><asp:DropDownList ID="DL_HandleWay" runat="server" Height="19px" Width="117px" AutoPostBack="True" OnSelectedIndexChanged="DL_ContactWay_SelectedIndexChanged">
                                                                                                    <asp:ListItem Text="<%$ Resources:lang,QingXuanZe %>" />
                                                                                                    <asp:ListItem Value="电话" />
                                                                                                    <asp:ListItem Value="IM" />
                                                                                                    <asp:ListItem Value="远程控制" />
                                                                                                    <asp:ListItem Value="EMail" />
                                                                                                    <asp:ListItem Value="上门拜访" />
                                                                                                    <asp:ListItem Value="其它方式" />
                                                                                                </asp:DropDownList></td>
                                                                                            <td style="text-align: right;" class="formItemBgStyle">
                                                                                                <asp:Label ID="Label18" runat="server" Text="<%$ Resources:lang,ChuLiZhuangTai %>"></asp:Label>： </td>
                                                                                            <td style="text-align: left;" class="formItemBgStyle">
                                                                                                <asp:DropDownList ID="DL_HandleStatus" runat="server" Height="19px">
                                                                                                    <asp:ListItem Value="处理中" />
                                                                                                    <asp:ListItem Value="评审中" />
                                                                                                    <asp:ListItem Value="挂起" />
                                                                                                    <asp:ListItem Value="完成" />
                                                                                                    <asp:ListItem Value="取消" />
                                                                                                </asp:DropDownList></td>
                                                                                            <td style="text-align: right;" class="formItemBgStyle">
                                                                                                <asp:Label ID="Label19" runat="server" Text="<%$ Resources:lang,YongShi %>"></asp:Label>： </td>
                                                                                            <td style="text-align: left;" class="formItemBgStyle">
                                                                                                <NickLee:NumberBox MaxAmount="1000000000000" MinAmount="-1000000000000" ID="NB_UsedTime" runat="server" Width="53px" Amount="1" OnBlur="" OnFocus="" OnKeyPress="" PositiveColor="">1.00</NickLee:NumberBox><asp:DropDownList ID="DL_TimeUnit" runat="server" Height="19px">
                                                                                                    <asp:ListItem Value="分钟" />
                                                                                                    <asp:ListItem Value="小时" />
                                                                                                    <asp:ListItem Value="天" />
                                                                                                </asp:DropDownList></td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td style="text-align: right;" class="formItemBgStyle">
                                                                                                <asp:Label ID="Label20" runat="server" Text="<%$ Resources:lang,LianLuoRen %>"></asp:Label>： </td>
                                                                                            <td style="text-align: left;" class="formItemBgStyle">
                                                                                                <asp:TextBox ID="TB_CustomerAcceptor" runat="server"></asp:TextBox></td>
                                                                                            <td style="text-align: right;" class="formItemBgStyle">
                                                                                                <asp:Label ID="Label21" runat="server" Text="<%$ Resources:lang,LianXiFangFa %>"></asp:Label>： </td>
                                                                                            <td style="text-align: left;" colspan="3" class="formItemBgStyle">
                                                                                                <asp:TextBox ID="TB_AcceptorContactWay" runat="server" Width="90%"></asp:TextBox></td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td style="text-align: right;" class="formItemBgStyle">
                                                                                                <asp:Label ID="Label22" runat="server" Text="<%$ Resources:lang,ChuLiNeiRong %>"></asp:Label>： </td>
                                                                                            <td colspan="5" style="text-align: left;" class="formItemBgStyle">
                                                                                                <CKEditor:CKEditorControl ID="HE_HandleDetail" runat="server" Width="90%" Height="80px" Visible="False" /><CKEditor:CKEditorControl ID="HT_HandleDetail" runat="server" Width="90%" Height="80px" Visible="False" />
                                                                                            </td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td style="text-align: right;" class="formItemBgStyle">
                                                                                                <asp:Label ID="Label23" runat="server" Text="<%$ Resources:lang,XiaCiFuWuShiJian %>"></asp:Label>： </td>
                                                                                            <td style="text-align: left;" class="formItemBgStyle">
                                                                                                <asp:TextBox ID="DLC_NextServiceTime" runat="server"></asp:TextBox><ajaxToolkit:CalendarExtender Format="yyyy-MM-dd" ID="CalendarExtender1" runat="server" TargetControlID="DLC_NextServiceTime" Enabled="True"></ajaxToolkit:CalendarExtender>
                                                                                            </td>
                                                                                            <td style="text-align: right;" class="formItemBgStyle">
                                                                                                <asp:Label ID="Label24" runat="server" Text="<%$ Resources:lang,TiQianTongZhiTianShu %>"></asp:Label>： </td>
                                                                                            <td style="text-align: left;" colspan="3" class="formItemBgStyle">
                                                                                                <NickLee:NumberBox ID="NB_PreDays" runat="server" MaxAmount="1000000000000" MinAmount="-1000000000000" Width="53px" Precision="0" OnBlur="" OnFocus="" OnKeyPress="" PositiveColor="">0</NickLee:NumberBox><asp:Label ID="Label25" runat="server" Text="<%$ Resources:lang,Tian %>"></asp:Label></td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td style="text-align: right;" class="formItemBgStyle"></td>
                                                                                            <td colspan="5" style="text-align: left;" class="formItemBgStyle">
                                                                                                <asp:Button ID="BT_Add" CssClass="inpu" runat="server" Text="<%$ Resources:lang,XinJian %>" OnClick="BT_Add_Click" /><asp:Button ID="BT_Update" runat="server" CssClass="inpu" Enabled="False"
                                                                                                    OnClick="BT_Update_Click" Text="<%$ Resources:lang,BaoCun %>" /><asp:Button ID="BT_Delete" runat="server" CssClass="inpu" Enabled="False" OnClick="BT_Delete_Click" OnClientClick="return confirm(getDeleteMsgByLangCode())"
                                                                                                        Text="<%$ Resources:lang,ShanChu %>" /><asp:HyperLink ID="HL_RelatedDoc" runat="server" NavigateUrl="TTCollaborationRelatedDoc.aspx"
                                                                                                            Target="_blank"><asp:Label ID="Label39" runat="server" Text="<%$ Resources:lang,XiangGuanWenJian %>"></asp:Label>
</asp:HyperLink><asp:HyperLink ID="HL_Expense" runat="server" NavigateUrl="TTProExpense.aspx" Target="_blank">
                                                                                                            ---><asp:Label ID="Label40" runat="server" Text="<%$ Resources:lang,FeiYongMingXiYuBaoXiao %>"></asp:Label>
</asp:HyperLink><asp:HyperLink ID="HL_ResoveResultReview"
                                                                                                            runat="server" NavigateUrl="TTCustomerQuestionResultReviewWF.aspx" Target="_blank">
                                                                                                            ---><asp:Label ID="Label41" runat="server" Text="<%$ Resources:lang,TiJiaoPingShen %>"></asp:Label>
</asp:HyperLink><br />
                                                                                            </td>
                                                                                        </tr>
                                                                                    </table>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td align="left">
                                                                                    <cc2:TabContainer CssClass="ajax_tab_menu" ID="TabContainer1" runat="server" ActiveTabIndex="0" Width="100%">
                                                                                        <cc2:TabPanel ID="TabPanel1" runat="server" HeaderText="协作日志">
                                                                                            <HeaderTemplate>
                                                                                                <asp:Label ID="Label26" runat="server" Text="<%$ Resources:lang,KeFuJiLu%>"></asp:Label>
                                                                                            </HeaderTemplate>
                                                                                            <ContentTemplate>
                                                                                                <asp:DataList ID="DataList3" runat="server" CellPadding="0" ForeColor="#333333" Height="1px" OnItemCommand="DataList3_ItemCommand" Width="100%">
                                                                                                    
                                                                                                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                                                                    <HeaderTemplate>
                                                                                                        <table background="ImagesSkin/main_n_bj.jpg" border="0" cellpadding="0" cellspacing="0" width="100%">
                                                                                                            <tr>
                                                                                                                <td width="7">
                                                                                                                    <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" />
                                                                                                                </td>
                                                                                                                <td>
                                                                                                                    <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                                                                                        <tr>
                                                                                                                            <td align="center" width="5%"><strong>
                                                                                                                                <asp:Label ID="Label27" runat="server" Text="<%$ Resources:lang,BianHao%>"></asp:Label>
                                                                                                                            </strong></td>
                                                                                                                            <td align="center" width="10%"><strong>
                                                                                                                                <asp:Label ID="Label28" runat="server" Text="<%$ Resources:lang,LianXiRen%>"></asp:Label>
                                                                                                                            </strong></td>
                                                                                                                            <td align="center" width="20%"><strong>
                                                                                                                                <asp:Label ID="Label29" runat="server" Text="<%$ Resources:lang,LianXiFangShi%>"></asp:Label>
                                                                                                                            </strong></td>
                                                                                                                            <td align="center" width="15%"><strong>
                                                                                                                                <asp:Label ID="Label30" runat="server" Text="<%$ Resources:lang,FuWuFangFa%>"></asp:Label>
                                                                                                                            </strong></td>
                                                                                                                            <td align="center" width="20%"><strong>
                                                                                                                                <asp:Label ID="Label31" runat="server" Text="<%$ Resources:lang,ChuLiShiJian%>"></asp:Label>
                                                                                                                            </strong></td>
                                                                                                                            <td align="center" width="10%"><strong>
                                                                                                                                <asp:Label ID="Label32" runat="server" Text="<%$ Resources:lang,YongShiChangDu%>"></asp:Label>
                                                                                                                            </strong></td>
                                                                                                                            <td align="center" width="10%"><strong>
                                                                                                                                <asp:Label ID="Label33" runat="server" Text="<%$ Resources:lang,ZhuangTai%>"></asp:Label>
                                                                                                                            </strong></td>
                                                                                                                            <td align="center" width="10%"><strong>
                                                                                                                                <asp:Label ID="Label34" runat="server" Text="<%$ Resources:lang,ShouLiRen%>"></asp:Label>
                                                                                                                            </strong></td>
                                                                                                                        </tr>
                                                                                                                    </table>
                                                                                                                </td>
                                                                                                                <td align="right" width="6">
                                                                                                                    <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" />
                                                                                                                </td>
                                                                                                            </tr>
                                                                                                        </table>
                                                                                                    </HeaderTemplate>
                                                                                                    <ItemStyle CssClass="itemStyle" />
                                                                                                    <ItemTemplate>
                                                                                                        <table cellpadding="4" cellspacing="0" width="100%">
                                                                                                            <tr>
                                                                                                                <td class="tdLeft" style="width: 5%; text-align: center;">
                                                                                                                    <asp:Button ID="BT_ID0" runat="server" CommandName="Update" CssClass="inpu" Text=' <%#DataBinder .Eval (Container .DataItem ,"ID") %> ' />
                                                                                                                </td>
                                                                                                                <td class="tdLeft" style="width: 10%; padding-left: 5px; text-align: left;"><%#DataBinder.Eval(Container.DataItem, "CustomerAcceptor")%></td>
                                                                                                                <td class="tdLeft" style="width: 20%; text-align: center;"><%#DataBinder.Eval(Container.DataItem, "AcceptorContactWay")%></td>
                                                                                                                <td class="tdLeft" style="width: 15%; text-align: center;"><%#DataBinder.Eval(Container.DataItem, "HandleWay")%></td>
                                                                                                                <td class="tdLeft" style="width: 20%; text-align: center;"><%#DataBinder.Eval(Container.DataItem, "HandleTime","{0:yyyy/MM/dd hh:MM:ss}")%></td>
                                                                                                                <td class="tdLeft" style="width: 10%; text-align: center;"><%#DataBinder .Eval (Container .DataItem ,"UsedTime") %><%#DataBinder .Eval (Container .DataItem ,"TimeUnit") %></td>
                                                                                                                <td class="tdLeft" style="width: 10%; text-align: center;"><%#DataBinder .Eval (Container .DataItem ,"HandleStatus") %></td>
                                                                                                                <td class="tdRight" style="width: 10%; text-align: center;"><%#DataBinder .Eval (Container .DataItem ,"OperatorName") %></td>
                                                                                                            </tr>
                                                                                                            <tr>
                                                                                                                <td class="tdLeft" style="width: 5%; text-align: center; font-size: 10pt;">
                                                                                                                    <asp:Label ID="Label35" runat="server" Text="<%$ Resources:lang,KeFangYiJian%>"></asp:Label>
                                                                                                                </td>
                                                                                                                <td class="tdRight" colspan="7" style="width: 95%; text-align: left; padding-left: 5px"><%#DataBinder.Eval(Container.DataItem, "CustomerComment")%></td>
                                                                                                            </tr>
                                                                                                            <tr>
                                                                                                                <td class="tdLeft" style="width: 5%; text-align: center; font-size: 10pt;">
                                                                                                                    <asp:Label ID="Label36" runat="server" Text="<%$ Resources:lang,ChuLiNeiRong%>"></asp:Label>
                                                                                                                </td>
                                                                                                                <td class="tdRight" colspan="7" style="width: 95%; text-align: left; padding-left: 5px"><%#DataBinder.Eval(Container.DataItem, "HandleDetail")%></td>
                                                                                                            </tr>
                                                                                                            <tr>
                                                                                                                <td class="tdLeft" style="width: 5%; text-align: center; font-size: 10pt;">
                                                                                                                    <asp:Label ID="Label37" runat="server" Text="<%$ Resources:lang,XiaCiFuWuShiJian%>"></asp:Label>
                                                                                                                </td>
                                                                                                                <td class="tdRight" style="width: 10%; text-align: left; padding-left: 5px"><%#DataBinder.Eval(Container.DataItem, "NextServiceTime")%></td>
                                                                                                                <td class="tdLeft" style="width: 20%; text-align: center; font-size: 10pt;">
                                                                                                                    <asp:Label ID="Label38" runat="server" Text="<%$ Resources:lang,TiQianTongZhiTianShu%>"></asp:Label>
                                                                                                                </td>
                                                                                                                <td class="tdRight" colspan="6" style="text-align: left; padding-left: 5px"><%#DataBinder.Eval(Container.DataItem, "PreDays")%></td>
                                                                                                            </tr>
                                                                                                        </table>
                                                                                                    </ItemTemplate>
                                                                                                    <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
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
                                                                                                <table width="98%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                                                                                    <tr>
                                                                                                        <td width="7">
                                                                                                            <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" /></td>
                                                                                                        <td>
                                                                                                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                                                                <tr>
                                                                                                                    <td width="10%" align="center"><strong>
                                                                                                                        <asp:Label ID="Label42" runat="server" Text="<%$ Resources:lang,XuHao%>"></asp:Label></strong></td>
                                                                                                                    <td width="15%" align="center"><strong>
                                                                                                                        <asp:Label ID="Label43" runat="server" Text="<%$ Resources:lang,LeiXing%>"></asp:Label></strong></td>
                                                                                                                    <td width="35%" align="center"><strong>
                                                                                                                        <asp:Label ID="Label44" runat="server" Text="<%$ Resources:lang,WenJianMing%>"></asp:Label></strong></td>
                                                                                                                    <td width="15%" align="center"><strong>
                                                                                                                        <asp:Label ID="Label45" runat="server" Text="<%$ Resources:lang,ZuoZhe%>"></asp:Label></strong></td>
                                                                                                                    <td width="15%" align="center"><strong>
                                                                                                                        <asp:Label ID="Label46" runat="server" Text="<%$ Resources:lang,ShangChuanZhe%>"></asp:Label></strong></td>
                                                                                                                    <td width="20%" align="center"><strong>
                                                                                                                        <asp:Label ID="Label47" runat="server" Text="<%$ Resources:lang,ShangChuanShiJian%>"></asp:Label></strong></td>
                                                                                                                </tr>
                                                                                                            </table>
                                                                                                        </td>
                                                                                                        <td width="6" align="right">
                                                                                                            <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" /></td>
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
                                                                                    </cc2:TabContainer></td>
                                                                            </tr>
                                                                        </table>
                                                                    </ContentTemplate>
                                                                </cc2:TabPanel>
                                                                <cc2:TabPanel ID="TabPanel4" runat="server" TabIndex="1">
                                                                    <HeaderTemplate>
                                                                        <asp:Label ID="Label52" runat="server" Text="<%$ Resources:lang,HouXuanRen%>"></asp:Label>
                                                                    </HeaderTemplate>
                                                                    <ContentTemplate>
                                                                        <table style="width: 98%; padding: 5px 0px 0px 5px" cellpadding="3" cellspacing="0" class="formBgStyle">
                                                                            <tr>
                                                                                <td width="200px" align="left" valign="top" class="formItemBgStyle">
                                                                                    <table width="98%">
                                                                                        <tr>
                                                                                            <td width="200px" align="left" valign="top">
                                                                                                <table width="100%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                                                                                    <tr>
                                                                                                        <td width="7">
                                                                                                            <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" /></td>
                                                                                                        <td>
                                                                                                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                                                                <tr>
                                                                                                                    <td width="95%" align="center"><strong>
                                                                                                                        <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,Candidate %>"></asp:Label></strong></td>
                                                                                                                    <td width="5%" align="center"><strong></strong></td>
                                                                                                                </tr>
                                                                                                            </table>
                                                                                                        </td>
                                                                                                        <td width="6" align="right">
                                                                                                            <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" /></td>
                                                                                                    </tr>
                                                                                                </table>
                                                                                                <asp:DataGrid ID="DataGrid2" runat="server" AutoGenerateColumns="False" OnItemCommand="DataGrid2_ItemCommand" 
                                                                                                    Width="100%" Height="1px" CellPadding="4" ForeColor="#333333" GridLines="None"
                                                                                                    ShowHeader="False">
                                                                                                    
                                                                                                    <Columns>
                                                                                                        <asp:TemplateColumn HeaderText="部门人员：">
                                                                                                            <ItemTemplate>
                                                                                                                <asp:Button ID="BT_ID" runat="server" Text='<%# DataBinder.Eval(Container.DataItem,"ID") %>'
                                                                                                                    CssClass="inpu" /><asp:Button ID="BT_UserName" runat="server" Text='<%# DataBinder.Eval(Container.DataItem,"UserName") %>'
                                                                                                                        CssClass="inpu" />
                                                                                                            </ItemTemplate>
                                                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" />
                                                                                                        </asp:TemplateColumn>
                                                                                                        <asp:TemplateColumn>
                                                                                                            <ItemTemplate>
                                                                                                                <asp:HyperLink ID="HL_CandidateInformationView" runat="server" NavigateUrl='<%# DataBinder.Eval(Container, "DataItem.UserName", "TTLTCandidateInformationView.aspx?UserName={0}") %>'
                                                                                                                    Target="_blank"><img src="ImagesSkin/dian.gif" class="noBorder"/></asp:HyperLink>
                                                                                                            </ItemTemplate>
                                                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" />
                                                                                                        </asp:TemplateColumn>
                                                                                                    </Columns>
                                                                                                    <EditItemStyle BackColor="#2461BF" />
                                                                                                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                                                                    <ItemStyle CssClass="itemStyle" />
                                                                                                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                                                                                    <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                                                                </asp:DataGrid></td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td width="200px" align="center" valign="top">
                                                                                                <br />
                                                                                                <asp:TextBox ID="TB_CandidateName" runat="server"></asp:TextBox><asp:Button ID="BT_AddCandidate" runat="server" Text="<%$ Resources:lang,XinZeng %>"
                                                                                                    CssClass="inpu" OnClick="BT_AddCandidate_Click" />&#160;&#160;<asp:Button ID="BT_DeleteCandidate" runat="server" CssClass="inpu" Text="<%$ Resources:lang,ShanChu %>" OnClick="BT_DeleteCandidate_Click" OnClientClick="return confirm(getDeleteMsgByLangCode())" /></td>
                                                                                        </tr>
                                                                                    </table>
                                                                                </td>
                                                                                <td align="left" valign="top" class="formItemBgStyle">
                                                                                    <table>
                                                                                        <tr>
                                                                                            <td style="text-align: left;" class="formItemBgStyle">
                                                                                                <asp:Label ID="LB_CandidateName" runat="server"></asp:Label></td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td style="text-align: left;" class="formItemBgStyle">
                                                                                                <CKEditor:CKEditorControl ID="HE_ComunicationWithCandidateRecord" runat="server" Height ="150px" Width="99%" /></td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td style="text-align: left;" class="formItemBgStyle">
                                                                                                <asp:Button ID="BT_SengCandidateLog" runat="server" CssClass="inpu" Enabled="False" Text="<%$ Resources:lang,Send %>" OnClick="BT_SengCandidateLog_Click" /><br />
                                                                                            </td>
                                                                                        </tr>
                                                                                    </table>
                                                                                </td>
                                                                                <td width="600px" align="left" valign="top" class="formItemBgStyle">
                                                                                    <div id="DivID" style="width: 600px; height: 800px; overflow: auto;">
                                                                                        <asp:DataList ID="DataList1" runat="server" CellPadding="4" ForeColor="#333333" Width="98%">
                                                                                            
                                                                                            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                                                                            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                                                                            <ItemStyle CssClass="itemStyle" />
                                                                                            <ItemTemplate>
                                                                                                <table style="width: 100%; table-layout: fixed;">
                                                                                                    <tr>
                                                                                                        <td align="left" style="color: Blue; font-style: italic;">
                                                                                                            <%#DataBinder.Eval(Container.DataItem, "LogID")%>&nbsp;&nbsp;
                                                                      
                                                                            <%#DataBinder.Eval(Container.DataItem, "UserName")%></a> &nbsp;&nbsp;
                                                                        <%# DataBinder.Eval(Container.DataItem, "CreateTime")%>
                                                                                                        </td>
                                                                                                    </tr>
                                                                                                    <tr>
                                                                                                        <td style="text-overflow: ellipsis; word-break: break-all; word-wrap: break-word;">
                                                                                                            <%# DataBinder.Eval(Container.DataItem,"LogContent") %>
                                                                                                        </td>
                                                                                                    </tr>
                                                                                                </table>
                                                                                            </ItemTemplate>
                                                                                            <SelectedItemStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                                                                        </asp:DataList>
                                                                                    </div>
                                                                                </td>
                                                                            </tr>
                                                                        </table>
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
