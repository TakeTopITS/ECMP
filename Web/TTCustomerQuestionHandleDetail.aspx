<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTCustomerQuestionHandleDetail.aspx.cs"
    Inherits="TTCustomerQuestionHandleDetail" %>

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
                                                        <td style="text-align: Left;" colspan="2">
                                                            <cc2:TabContainer CssClass="ajax_tab_menu" ID="TabContainer2" runat="server" ActiveTabIndex="0" Width="100%">
                                                                <cc2:TabPanel ID="TabPanel3" runat="server" HeaderText="需求信息" TabIndex="0">
                                                                    <HeaderTemplate>
                                                                        <asp:Label ID="Label8" runat="server" Text="<%$ Resources:lang,FuWuXingXi%>"></asp:Label>
                                                                    </HeaderTemplate>
                                                                    <ContentTemplate>
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
                                                                                                            <asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,KeHuMingCheng%>"></asp:Label></strong>
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
                                                                    </ContentTemplate>
                                                                </cc2:TabPanel>
                                                                <cc2:TabPanel ID="TabPanel4" runat="server" HeaderText="商机信息" TabIndex="0">
                                                                    <HeaderTemplate>
                                                                        <asp:Label ID="Label15" runat="server" Text="<%$ Resources:lang,SHANGJIXINXI%>"></asp:Label>
                                                                    </HeaderTemplate>
                                                                    <ContentTemplate>
                                                                        <table width="100%">
                                                                            <tr>
                                                                                <td>
                                                                                    <asp:DataList ID="DataList1" runat="server" CellPadding="0" ForeColor="#333333" Height="1px"
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
                                                                                                                <td width="10%" align="center">
                                                                                                                    <strong>
                                                                                                                        <asp:Label ID="Label52" runat="server" Text="<%$ Resources:lang,BianHao%>"></asp:Label></strong>
                                                                                                                </td>
                                                                                                                <td width="20%" align="center">
                                                                                                                    <strong>
                                                                                                                        <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,SHANGJIMINGCHENG%>"></asp:Label></strong>
                                                                                                                </td>
                                                                                                                <td width="8%" align="center">
                                                                                                                    <strong>
                                                                                                                        <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,YIQICHENGJIAOSHIJIAN%>"></asp:Label></strong>
                                                                                                                </td>
                                                                                                                <td width="10%" align="center">
                                                                                                                    <strong>
                                                                                                                        <asp:Label ID="Label51" runat="server" Text="<%$ Resources:lang,KeHuMingCheng%>"></asp:Label></strong>
                                                                                                                </td>
                                                                                                                <td width="8%" align="center">
                                                                                                                    <strong>
                                                                                                                        <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,KeHuJingLi%>"></asp:Label></strong>
                                                                                                                </td>
                                                                                                                <td width="10%" align="center">
                                                                                                                    <strong>
                                                                                                                        <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,YIQICHENGJIAOJINGE%>"></asp:Label></strong>
                                                                                                                </td>
                                                                                                                <td width="10%" align="center">
                                                                                                                    <strong>
                                                                                                                        <asp:Label ID="Label53" runat="server" Text="<%$ Resources:lang,ShangJiJieDuan%>"></asp:Label></strong>
                                                                                                                </td>
                                                                                                                <td width="6%" align="center">
                                                                                                                    <strong>
                                                                                                                        <asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,YingLu%>"></asp:Label></strong>
                                                                                                                </td>
                                                                                                                <td width="10%" align="center">
                                                                                                                    <strong>
                                                                                                                        <asp:Label ID="Label54" runat="server" Text="<%$ Resources:lang,KeHuShangJiJieDuan%>"></asp:Label></strong>
                                                                                                                </td>
                                                                                                                <td align="center">
                                                                                                                    <strong>
                                                                                                                        <asp:Label ID="Label10" runat="server" Text="<%$ Resources:lang,SHANGJIDAILI%>"></asp:Label></strong>
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
                                                                                                    <td class="tdLeft" style="width: 10%; text-align: center;">
                                                                                                        <%#DataBinder .Eval (Container .DataItem ,"ID") %>
                                                                                                    </td>
                                                                                                    <td class="tdLeft" style="width: 20%; padding-left: 5px; text-align: Left;">
                                                                                                        <%#DataBinder .Eval (Container .DataItem,"BusinessName") %>
                                                                                                    </td>
                                                                                                    <td class="tdLeft" style="width: 8%; padding-left: 5px; text-align: center;">
                                                                                                        <%#DataBinder.Eval(Container.DataItem, "ExpectedTime", "{0:yyyy/MM/dd}")%>
                                                                                                    </td>
                                                                                                    <td class="tdLeft" style="width: 10%; text-align: center;">
                                                                                                        <%#DataBinder .Eval (Container .DataItem,"CustomerName") %>
                                                                                                    </td>
                                                                                                    <td class="tdLeft" style="width: 8%; text-align: center;">
                                                                                                        <%#DataBinder .Eval (Container .DataItem,"CustomerManager") %>
                                                                                                    </td>
                                                                                                    <td class="tdLeft" style="width: 10%; text-align: center;">
                                                                                                        <%#DataBinder .Eval (Container .DataItem,"ExpectedEarnings") %>
                                                                                                    </td>
                                                                                                    <td class="tdLeft" style="width: 10%; text-align: center;">
                                                                                                        <%#DataBinder .Eval (Container .DataItem,"Stage") %>
                                                                                                    </td>
                                                                                                    <td class="tdLeft" style="width: 6%; text-align: center;">
                                                                                                        <%#DataBinder .Eval (Container .DataItem,"Possibility") %>%
                                                                                                    </td>
                                                                                                    <td class="tdLeft" style="width: 10%; text-align: center;">
                                                                                                        <%#DataBinder .Eval (Container .DataItem,"CustomerStage") %>
                                                                                                    </td>
                                                                                                    <td class="tdLeft" style="text-align: center;">
                                                                                                        <%#DataBinder .Eval (Container .DataItem,"AgencyName") %>
                                                                                                    </td>
                                                                                                </tr>
                                                                                                <tr>
                                                                                                    <td class="tdLeft" style="width: 10%; text-align: center;">
                                                                                                        <asp:Label ID="Label39" runat="server" Text="<%$ Resources:lang,SHANGJILAIYUAN%>"></asp:Label>
                                                                                                    </td>
                                                                                                    <td class="tdRight" colspan="9" style="text-align: left; padding-left: 5px">

                                                                                                        <%#DataBinder .Eval (Container .DataItem,"BusinessSource") %>
                                                                                                    </td>
                                                                                                </tr>
                                                                                                <tr>
                                                                                                    <td class="tdLeft" style="width: 10%; text-align: center;">
                                                                                                        <asp:Label ID="Label41" runat="server" Text="<%$ Resources:lang,CHENGGONGGANJIANYINGSHU%>"></asp:Label>
                                                                                                    </td>
                                                                                                    <td class="tdRight" colspan="9" style="text-align: left; padding-left: 5px">

                                                                                                        <%#DataBinder .Eval (Container .DataItem,"SucessKeyReason") %>
                                                                                                    </td>
                                                                                                </tr>
                                                                                                <tr>
                                                                                                    <td class="tdLeft" style="width: 10%; text-align: center;">
                                                                                                        <asp:Label ID="Label50" runat="server" Text="<%$ Resources:lang,SHIBAIGANJIANYINGSHU%>"></asp:Label>
                                                                                                    </td>
                                                                                                    <td class="tdRight" colspan="9" style="text-align: left; padding-left: 5px">

                                                                                                        <%#DataBinder .Eval (Container .DataItem,"FailedKeyReason") %>
                                                                                                    </td>
                                                                                                </tr>
                                                                                            </table>
                                                                                        </ItemTemplate>
                                                                                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />

                                                                                        <ItemStyle CssClass="itemStyle" />
                                                                                    </asp:DataList>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td align="right">

                                                                                    <table border="0" cellpadding="0" cellspacing="0">
                                                                                        <tr>
                                                                                            <td class="formItemBgStyle" style="text-align: right;">
                                                                                                <asp:Label ID="Label55" runat="server" Text="<%$ Resources:lang,ShangJiJieDuan %>"></asp:Label>：
                                                                                            </td>
                                                                                            <td class="formItemBgStyle" align="left">
                                                                                                <asp:DropDownList ID="DL_Stage" runat="server" CssClass="DDList" AutoPostBack="True" DataTextField="Stage" DataValueField="Stage" OnSelectedIndexChanged="DL_Stage_SelectedIndexChanged">
                                                                                                </asp:DropDownList>
                                                                                            </td>
                                                                                            <td class="formItemBgStyle" style="text-align: right;">&nbsp;
                                                                                                <asp:Label ID="Label11" runat="server" Text="<%$ Resources:lang,KENENGXING %>"></asp:Label>：
                                                                                            </td>
                                                                                            <td class="formItemBgStyle" style="text-align: left;">
                                                                                                <NickLee:NumberBox ID="NB_Possibility" runat="server" MaxAmount="1000000000000" MinAmount="-1000000000000" Precision="0" Width="50px" OnBlur="" OnFocus="" OnKeyPress="" PositiveColor="">0</NickLee:NumberBox>
                                                                                                %
                                                                                            </td>
                                                                                            <td class="formItemBgStyle" style="text-align: right;">&nbsp;&nbsp; &nbsp;<asp:Label ID="Label35" runat="server" Text="客户商机阶段"></asp:Label>：
                                                                                            </td>
                                                                                            <td class="formItemBgStyle" align="left">
                                                                                                <asp:DropDownList ID="DL_CustomerStage" runat="server" CssClass="DDList" DataTextField="Stage" DataValueField="Stage">
                                                                                                </asp:DropDownList>
                                                                                            </td>
                                                                                            <td class="formItemBgStyle" style="text-align: left;">&nbsp;
                                                                                                <asp:Button ID="BT_SaveBusinessStage" runat="server" CssClass="inpu"
                                                                                                    Text="<%$ Resources:lang,BaoCun %>" OnClick="BT_SaveBusinessStage_Click" />
                                                                                            </td>
                                                                                        </tr>
                                                                                    </table>
                                                                                </td>
                                                                            </tr>
                                                                        </table>

                                                                    </ContentTemplate>
                                                                </cc2:TabPanel>

                                                            </cc2:TabContainer>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="2" align="left" style="font-weight: bold; height: 24px; color: #394f66; background-image: url('ImagesSkin/titleBG.jpg')">

                                                            <table width="100%">
                                                                <tr>
                                                                    <td align="left">
                                                                        <table>
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
                                                                                    <asp:DropDownList ID="DL_Operator" runat="server" DataTextField="UserName" DataValueField="UserCode" >
                                                                                    </asp:DropDownList>
                                                                                </td>
                                                                                <td style="padding-top: -5px;">
                                                                                    <asp:Button ID="BT_TransferOperator" runat="server" CssClass="inpuLong" OnClick="BT_TransferOperator_Click" Text="<%$ Resources:lang,ZhiDingWeiShouLiRen%>" />
                                                                                </td>
                                                                            </tr>
                                                                        </table>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td align="right">
                                                                        <table>
                                                                            <tr>
                                                                                <td style="padding-left: 5px;">

                                                                                    <asp:HyperLink ID="HL_RelatedDoc" runat="server" NavigateUrl="TTCollaborationRelatedDoc.aspx" Text="<%$ Resources:lang,XiangGuanWenJian%>"
                                                                                        Target="_blank">
                                                                                    </asp:HyperLink>
                                                                                </td>
                                                                                <td>
                                                                                    <asp:HyperLink ID="HL_Expense" runat="server" NavigateUrl="TTProExpense.aspx" Text="<%$ Resources:lang,FeiYongMingXiYuBaoXiao%>" Target="_blank"></asp:HyperLink>
                                                                                </td>
                                                                                <td style="padding-left: 5px;">

                                                                                    <asp:HyperLink ID="HL_ResoveResultReview"
                                                                                        runat="server" NavigateUrl="TTCustomerQuestionResultReviewWF.aspx" Text="<%$ Resources:lang,TiJiaoPingShen%>" Target="_blank">                                                                         
                                                                                    </asp:HyperLink>
                                                                                </td>

                                                                                <td style="padding-left: 5px;">
                                                                                    <asp:HyperLink ID="HL_QuestionToCustomer" Text="<%$ Resources:lang,ZhuanChengKeHuHuoGuanLianKeHu%>" runat="server" Target="_blank"></asp:HyperLink>

                                                                                </td>
                                                                            </tr>
                                                                        </table>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="2" align="right">
                                                            <br />
                                                            <asp:Button ID="BT_Create" runat="server" Text="<%$ Resources:lang,New%>" CssClass="inpuYello" OnClick="BT_Create_Click" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="2" align="left">
                                                            <cc2:TabContainer CssClass="ajax_tab_menu" ID="TabContainer1" runat="server" ActiveTabIndex="0" Width="100%">
                                                                <cc2:TabPanel ID="TabPanel1" runat="server" HeaderText="协作日志" TabIndex="0">
                                                                    <HeaderTemplate>
                                                                        <asp:Label ID="Label26" runat="server" Text="<%$ Resources:lang,KeFuJiLu%>"></asp:Label>
                                                                    </HeaderTemplate>
                                                                    <ContentTemplate>
                                                                        <asp:DataList ID="DataList3" runat="server" CellPadding="0" ForeColor="#333333" OnItemCommand="DataList3_ItemCommand"
                                                                            Height="1px" Width="100%">

                                                                            <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />

                                                                            <HeaderTemplate>

                                                                                <table width="100%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">

                                                                                    <tr>

                                                                                        <td width="7">

                                                                                            <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" />
                                                                                        </td>

                                                                                        <td>

                                                                                            <table width="100%" border="0" cellspacing="0" cellpadding="0">

                                                                                                <tr>

                                                                                                    <td width="5%" align="center">

                                                                                                        <strong></strong>
                                                                                                    </td>

                                                                                                    <td width="10%" align="center">

                                                                                                        <strong>
                                                                                                            <asp:Label ID="Label27" runat="server" Text="<%$ Resources:lang,BianHao%>"></asp:Label></strong>
                                                                                                    </td>

                                                                                                    <td width="10%" align="center">

                                                                                                        <strong>
                                                                                                            <asp:Label ID="Label28" runat="server" Text="<%$ Resources:lang,LianXiRen%>"></asp:Label></strong>
                                                                                                    </td>

                                                                                                    <td width="10%" align="center">

                                                                                                        <strong>
                                                                                                            <asp:Label ID="Label29" runat="server" Text="<%$ Resources:lang,LianXiFangShi%>"></asp:Label></strong>
                                                                                                    </td>

                                                                                                    <td width="10%" align="center">

                                                                                                        <strong>
                                                                                                            <asp:Label ID="Label30" runat="server" Text="<%$ Resources:lang,FuWuFangFa%>"></asp:Label></strong>
                                                                                                    </td>

                                                                                                    <td width="15%" align="center">

                                                                                                        <strong>
                                                                                                            <asp:Label ID="Label31" runat="server" Text="<%$ Resources:lang,ChuLiShiJian%>"></asp:Label></strong>
                                                                                                    </td>

                                                                                                    <td width="10%" align="center">

                                                                                                        <strong>
                                                                                                            <asp:Label ID="Label32" runat="server" Text="<%$ Resources:lang,YongShiChangDu%>"></asp:Label></strong>
                                                                                                    </td>

                                                                                                    <td width="10%" align="center">

                                                                                                        <strong>
                                                                                                            <asp:Label ID="Label33" runat="server" Text="<%$ Resources:lang,ZhuangTai%>"></asp:Label></strong>
                                                                                                    </td>

                                                                                                    <td width="10%" align="center">

                                                                                                        <strong>
                                                                                                            <asp:Label ID="Label34" runat="server" Text="<%$ Resources:lang,ShouLiRen%>"></asp:Label></strong>
                                                                                                    </td>
                                                                                                </tr>
                                                                                            </table>
                                                                                        </td>

                                                                                        <td width="6" align="right">

                                                                                            <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" /></td>
                                                                                    </tr>
                                                                                </table>
                                                                            </HeaderTemplate>

                                                                            <ItemTemplate>

                                                                                <table cellpadding="4" cellspacing="0" width="100%">

                                                                                    <tr>
                                                                                        <td class="tdLeft" style="width: 5%; text-align: center;">

                                                                                            <asp:LinkButton ID="LinkButton1" runat="server" Text="&lt;div&gt;&lt;img src=ImagesSkin/Update.png border=0 alt='修改' /&gt;&lt;/div&gt;" CssClass="inpu" CommandName="Update" />
                                                                                        </td>

                                                                                        <%-- <td class="tdLeft" style="width: 5%; text-align: center;">

                                                                                            <asp:LinkButton ID="LinkButton2" CommandName="Delete" runat="server" OnClientClick="return confirm(getDeleteMsgByLangCode())" Text="&lt;div&gt;&lt;img src=ImagesSkin/Delete.png border=0 alt='删除' /&gt;&lt;/div&gt;"/>
                                                                                        </td>--%>

                                                                                        <td class="tdLeft" style="width: 10%; text-align: center;">

                                                                                            <asp:Label ID="BT_ID" runat="server" Text=' <%#DataBinder .Eval (Container .DataItem ,"ID") %> ' />

                                                                                        </td>

                                                                                        <td class="tdLeft" style="width: 10%; padding-left: 5px; text-align: left;">

                                                                                            <%#DataBinder.Eval(Container.DataItem, "CustomerAcceptor")%>
                                                                                        </td>

                                                                                        <td class="tdLeft" style="width: 10%; text-align: center;">

                                                                                            <%#DataBinder.Eval(Container.DataItem, "AcceptorContactWay")%>
                                                                                        </td>

                                                                                        <td class="tdLeft" style="width: 10%; text-align: center;">

                                                                                            <%#DataBinder.Eval(Container.DataItem, "HandleWay")%>
                                                                                        </td>

                                                                                        <td class="tdLeft" style="width: 15%; text-align: center;">

                                                                                            <%#DataBinder.Eval(Container.DataItem, "HandleTime","{0:yyyy/MM/dd hh:MM:ss}")%>
                                                                                        </td>

                                                                                        <td class="tdLeft" style="width: 10%; text-align: center;">

                                                                                            <%#DataBinder .Eval (Container .DataItem ,"UsedTime") %>

                                                                                            <%#DataBinder .Eval (Container .DataItem ,"TimeUnit") %>
                                                                                        </td>

                                                                                        <td class="tdLeft" style="width: 10%; text-align: center;">

                                                                                            <%#DataBinder .Eval (Container .DataItem ,"HandleStatus") %>
                                                                                        </td>

                                                                                        <td class="tdRight" style="width: 10%; text-align: center;">

                                                                                            <%#DataBinder .Eval (Container .DataItem ,"OperatorName") %>
                                                                                        </td>
                                                                                    </tr>

                                                                                    <tr>

                                                                                        <td class="tdLeft" style="width: 5%; text-align: center; font-size: 10pt;">
                                                                                            <asp:Label ID="Label35" runat="server" Text="<%$ Resources:lang,KeFangYiJian%>"></asp:Label>
                                                                                        </td>

                                                                                        <td class="tdRight" colspan="10" style="width: 95%; text-align: left; padding-left: 5px">

                                                                                            <%#DataBinder.Eval(Container.DataItem, "CustomerComment")%>
                                                                                        </td>
                                                                                    </tr>

                                                                                    <tr>

                                                                                        <td class="tdLeft" style="width: 5%; text-align: center; font-size: 10pt;">
                                                                                            <asp:Label ID="Label36" runat="server" Text="<%$ Resources:lang,ChuLiNeiRong%>"></asp:Label>
                                                                                        </td>

                                                                                        <td class="tdRight" colspan="10" style="width: 95%; text-align: left; padding-left: 5px">

                                                                                            <%#DataBinder.Eval(Container.DataItem, "HandleDetail")%>
                                                                                        </td>
                                                                                    </tr>

                                                                                    <tr>

                                                                                        <td class="tdLeft" style="width: 5%; text-align: center; font-size: 10pt;">
                                                                                            <asp:Label ID="Label37" runat="server" Text="<%$ Resources:lang,XiaCiFuWuShiJian%>"></asp:Label>
                                                                                        </td>

                                                                                        <td class="tdRight" style="text-align: left; padding-left: 5px">

                                                                                            <%#DataBinder.Eval(Container.DataItem, "NextServiceTime")%>
                                                                                        </td>

                                                                                        <td class="tdLeft" style="text-align: center; font-size: 10pt;">
                                                                                            <asp:Label ID="Label38" runat="server" Text="<%$ Resources:lang,TiQianTongZhiTianShu%>"></asp:Label>
                                                                                        </td>

                                                                                        <td class="tdRight" colspan="6" style="text-align: left; padding-left: 5px">

                                                                                            <%#DataBinder.Eval(Container.DataItem, "PreDays")%>
                                                                                        </td>
                                                                                    </tr>
                                                                                </table>
                                                                            </ItemTemplate>

                                                                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />

                                                                            <ItemStyle CssClass="itemStyle" />
                                                                        </asp:DataList><table cellpadding="5" cellspacing="0" border="0" width="100%">
                                                                            <tr>
                                                                                <td colspan="11" class="tdTopLine"></td>
                                                                            </tr>
                                                                        </table>
                                                                    </ContentTemplate>
                                                                </cc2:TabPanel>
                                                                <cc2:TabPanel ID="TabPanel2" runat="server" HeaderText="客服文件" TabIndex="1">
                                                                       <HeaderTemplate>
                                                                        <asp:Label ID="Label40" runat="server" Text="<%$ Resources:lang,KeFuWenJian%>"></asp:Label>
                                                                    </HeaderTemplate>
                                                                    <ContentTemplate>
                                                                        <table width="100%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
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

                    <div class="layui-layer layui-layer-iframe" id="popDetailWindow"
                        style="z-index: 9999; width: 800px; height: 330px; position: absolute; overflow: hidden; display: none; border-radius: 10px;">
                        <div class="layui-layer-title" style="background: #e7e7e8;" id="popwindow_title">
                            <asp:Label ID="Label6" runat="server" Text="&lt;div&gt;&lt;img src=ImagesSkin/Update.png border=0 width=30px height=30px alt='BusinessForm' /&gt;&lt;/div&gt;"></asp:Label>
                        </div>
                        <div id="popwindow_content" class="layui-layer-content" style="overflow: auto; padding: 0px 5px 0px 5px;">

                            <table style="width: 100%; padding: 5px 0px 0px 5px" cellpadding="0" cellspacing="0">
                                <%-- <tr>
                                    <td style="width: 8%; text-align: right;" class="formItemBgStyle">
                                        <asp:Label ID="Label15" runat="server" Text="<%$ Resources:lang,BianHao%>"></asp:Label>
                                        ：</td>
                                    <td colspan="5" style="width: 90%; text-align: left;" class="formItemBgStyle">
                                      
                                    </td>
                                </tr>--%>
                                <tr>
                                    <td style="width: 8%; text-align: right;" class="formItemBgStyle">
                                        <asp:Label ID="LB_ID" runat="server" Visible="false"></asp:Label>
                                        <asp:Label ID="Label16" runat="server" Text="<%$ Resources:lang,KeHuYiJian%>"></asp:Label>：
                                    </td>
                                    <td colspan="5" style="text-align: left;" class="formItemBgStyle">
                                        <CKEditor:CKEditorControl ID="HE_CustomerComment" runat="server" Width="99%" Height="80px" Visible="false" />
                                        <CKEditor:CKEditorControl ID="HT_CustomerComment" runat="server" Width="99%" Height="80px" Visible="False" />
                                    </td>
                                </tr>
                                <tr>
                                    <td style="text-align: right;" class="formItemBgStyle">
                                        <asp:Label ID="Label17" runat="server" Text="<%$ Resources:lang,ChuLiFangShi%>"></asp:Label>：
                                    </td>
                                    <td style="text-align: left;" class="formItemBgStyle">
                                        <asp:TextBox ID="TB_HandleWay" runat="server" Width="200"></asp:TextBox>
                                        <asp:DropDownList ID="DL_HandleWay" runat="server"   AutoPostBack="true" OnSelectedIndexChanged="DL_ContactWay_SelectedIndexChanged">
                                            <asp:ListItem Value="" Text="<%$ Resources:lang,QingXuanZe%>" />
                                            <asp:ListItem Value="电话" Text="<%$ Resources:lang,DianHua%>" />
                                            <asp:ListItem Value="IM" Text="<%$ Resources:lang,IM%>" />
                                            <asp:ListItem Value="远程控制" Text="<%$ Resources:lang,YuanChengKongZhi%>" />
                                            <asp:ListItem Value="EMail" Text="<%$ Resources:lang,EMail%>" />
                                            <asp:ListItem Value="上门拜访" Text="<%$ Resources:lang,ShangMenBaiFang%>" />
                                            <asp:ListItem Value="其它方式" Text="<%$ Resources:lang,QiTaFangShi%>" />
                                        </asp:DropDownList>
                                    </td>
                                    <td style="text-align: right;" class="formItemBgStyle">
                                        <asp:Label ID="Label18" runat="server" Text="<%$ Resources:lang,ChuLiZhuangTai%>"></asp:Label>：
                                    </td>
                                    <td style="text-align: left;" class="formItemBgStyle">
                                        <asp:DropDownList ID="DL_HandleStatus" runat="server" >
                                            <asp:ListItem Value="处理中" Text="<%$ Resources:lang,ChuLiZhong%>" />
                                            <asp:ListItem Value="评审中" Text="<%$ Resources:lang,PingShenZhong%>" />
                                            <asp:ListItem Value="挂起" Text="<%$ Resources:lang,GuaQi%>" />
                                            <asp:ListItem Value="完成" Text="<%$ Resources:lang,WanCheng%>" />
                                            <asp:ListItem Value="取消" Text="<%$ Resources:lang,QuXiao%>" />
                                        </asp:DropDownList>
                                    </td>
                                    <td style="text-align: right;" class="formItemBgStyle">
                                        <asp:Label ID="Label19" runat="server" Text="<%$ Resources:lang,YongShi%>"></asp:Label>：
                                    </td>
                                    <td style="text-align: left;" class="formItemBgStyle">
                                        <NickLee:NumberBox MaxAmount="1000000000000" MinAmount="-1000000000000" ID="NB_UsedTime" runat="server" Width="53px" Amount="1">1.00</NickLee:NumberBox>
                                        <asp:DropDownList ID="DL_TimeUnit" runat="server"  >
                                            <asp:ListItem Value="分钟" Text="<%$ Resources:lang,FenZhong%>" />
                                            <asp:ListItem Value="小时" Text="<%$ Resources:lang,XiaoShi%>" />
                                            <asp:ListItem Value="天" Text="<%$ Resources:lang,Tian%>" />
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="text-align: right;" class="formItemBgStyle">
                                        <asp:Label ID="Label20" runat="server" Text="<%$ Resources:lang,LianLuoRen%>"></asp:Label>：
                                    </td>
                                    <td style="text-align: left;" class="formItemBgStyle">
                                        <asp:TextBox ID="TB_CustomerAcceptor" runat="server"></asp:TextBox>
                                    </td>
                                    <td style="text-align: right;" class="formItemBgStyle">
                                        <asp:Label ID="Label21" runat="server" Text="<%$ Resources:lang,LianXiFangFa%>"></asp:Label>：
                                    </td>
                                    <td style="text-align: left;" colspan="3" class="formItemBgStyle">
                                        <asp:TextBox ID="TB_AcceptorContactWay" runat="server" Width="90%"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="text-align: right;" class="formItemBgStyle">
                                        <asp:Label ID="Label22" runat="server" Text="<%$ Resources:lang,ChuLiNeiRong%>"></asp:Label>：
                                    </td>
                                    <td colspan="5" style="text-align: left;" class="formItemBgStyle">
                                        <CKEditor:CKEditorControl ID="HE_HandleDetail" runat="server" Width="90%" Height="80px" Visible="false" />
                                        <CKEditor:CKEditorControl ID="HT_HandleDetail" runat="server" Width="90%" Height="80px" Visible="False" />
                                    </td>
                                </tr>
                                <tr>
                                    <td style="text-align: right;" class="formItemBgStyle">
                                        <asp:Label ID="Label23" runat="server" Text="<%$ Resources:lang,XiaCiFuWuShiJian%>"></asp:Label>：
                                    </td>
                                    <td style="text-align: left;" class="formItemBgStyle">
                                        <asp:TextBox ID="DLC_NextServiceTime" ReadOnly="false" runat="server"></asp:TextBox>
                                        <ajaxToolkit:CalendarExtender Format="yyyy-MM-dd" ID="CalendarExtender1" runat="server" TargetControlID="DLC_NextServiceTime">
                                        </ajaxToolkit:CalendarExtender>
                                    </td>
                                    <td style="text-align: right;" class="formItemBgStyle">
                                        <asp:Label ID="Label24" runat="server" Text="<%$ Resources:lang,TiQianTongZhiTianShu%>"></asp:Label>：
                                    </td>
                                    <td style="text-align: left;" colspan="3" class="formItemBgStyle">
                                        <NickLee:NumberBox ID="NB_PreDays" runat="server" MaxAmount="1000000000000" MinAmount="-1000000000000" Width="53px" Precision="0">0</NickLee:NumberBox>
                                        <asp:Label ID="Label25" runat="server" Text="<%$ Resources:lang,Tian%>"></asp:Label>

                                    </td>
                                </tr>
                            </table>
                        </div>

                        <div id="popwindow_footer" class="layui-layer-btn" style="border-top: 1px solid #ccc;">
                            <asp:LinkButton ID="BT_New" runat="server" class="layui-layer-btn notTab" OnClick="BT_New_Click" Text="<%$ Resources:lang,BaoCun%>"></asp:LinkButton><a class="layui-layer-btn notTab" onclick="return popClose();"><asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,GuanBi%>" /></a>
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
<script type="text/javascript" language="javascript">var cssDirectory = '<%=Session["CssDirectory"] %>'; var oLink = document.getElementById('mainCss'); oLink.href = 'css/' + cssDirectory + '/' + 'bluelightmain.css';</script></html>
