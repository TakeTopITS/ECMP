<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTCustomerQuestionHandleRecordList.aspx.cs"
    Inherits="TTCustomerQuestionHandleRecordList" %>

<%--<meta name="viewport" content="width=device-width; initial-scale=1.0; maximum-scale=1.0; minimum-scale=0.1; user-scalable=1" />--%>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register Assembly="NickLee.Web.UI" Namespace="NickLee.Web.UI" TagPrefix="NickLee" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc2" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <style type="text/css">
        #AboveDiv {
            max-width: 1024px;
            width: expression (document.body.clientWidth >= 1024? "1024px" : "auto" ));
            min-width: 277px;
            width: expression (document.body.clientWidth <= 277? "277px" : "auto" ));
        }
    </style>
    <link id="mainCss" href="css/bluelightmain.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="js/allAHandler.js"></script>
    <script type="text/javascript" language="javascript">
        $(function () {
            //if (top.location != self.location) { } else { CloseWebPage(); }

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
                    <table cellpadding="0" cellspacing="0" border="0" width="100%" class="bian">
                        <tr>
                            <td height="31" class="page_topbj">
                                <table width="96%" border="0" align="center" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td align="left">
                                            <table width="300" border="0" align="left" cellpadding="0" cellspacing="0">
                                                <tr>
                                                    <td width="29">
                                                        <%--<img src="Logo/main_top_l.jpg" alt="" width="29" height="31" />--%></td>
                                                    <td align="center" background="ImagesSkin/main_top_bj.jpg" class="titlezi">
                                                        <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,KeHuFuWuChuLiJiLu%>"></asp:Label>
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
                                        <td style="text-align: Left;">
                                            <cc2:TabContainer ID="TabContainer2" runat="server" ActiveTabIndex="0" CssClass="ajax_tab_menu" Width="100%">
                                                <cc2:TabPanel ID="TabPanel3" runat="server" HeaderText="需求信息" TabIndex="0">
                                                    <HeaderTemplate>
                                                        <asp:Label ID="Label8" runat="server" Text="需求信息"></asp:Label>
                                                    </HeaderTemplate>
                                                    <ContentTemplate>
                                                        <asp:DataList ID="DataList2" runat="server" CellPadding="0" ForeColor="#333333" Height="1px" Width="100%">
                                                            <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
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
                                                                                        <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,BianHao%>"></asp:Label>
                                                                                        </strong></td>
                                                                                    <td align="center" width="10%"><strong>
                                                                                        <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,FuWuLeiXing%>"></asp:Label>
                                                                                        </strong></td>
                                                                                    <td align="center" width="5%"><strong>
                                                                                        <asp:Label ID="Label51" runat="server" Text="<%$ Resources:lang,CYHSJ%>"></asp:Label>
                                                                                        </strong></td>
                                                                                    <td align="center" width="10%"><strong>
                                                                                        <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,LianXiRen%>"></asp:Label>
                                                                                        </strong></td>
                                                                                    <td align="center" width="10%"><strong>
                                                                                        <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,YaoQiuDaFuShiJian%>"></asp:Label>
                                                                                        </strong></td>
                                                                                    <td align="center" width="13%"><strong>
                                                                                        <asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,KeHuMingCheng%>"></asp:Label>
                                                                                        </strong></td>
                                                                                    <td align="center" width="10%"><strong>
                                                                                        <asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,LianXiFangFa%>"></asp:Label>
                                                                                        </strong></td>
                                                                                    <td align="center" width="10%"><strong>
                                                                                        <asp:Label ID="Label13" runat="server" Text="<%$ Resources:lang,EMail%>"></asp:Label>
                                                                                        </strong></td>
                                                                                    <td align="center" width="10%"><strong>
                                                                                        <asp:Label ID="Label9" runat="server" Text="<%$ Resources:lang,TiJiaoShiJian%>"></asp:Label>
                                                                                        </strong></td>
                                                                                    <td align="center" width="5%"><strong>
                                                                                        <asp:Label ID="Label10" runat="server" Text="<%$ Resources:lang,ZhuangTai%>"></asp:Label>
                                                                                        </strong></td>
                                                                                    <td align="center" width="7%"><strong>
                                                                                        <asp:Label ID="Label11" runat="server" Text="<%$ Resources:lang,ShouLiRen%>"></asp:Label>
                                                                                        </strong></td>
                                                                                    <td align="center" width="5%"><strong>
                                                                                        <asp:Label ID="Label12" runat="server" Text="<%$ Resources:lang,JiLuRen%>"></asp:Label>
                                                                                        </strong></td>
                                                                                </tr>
                                                                            </table>
                                                                        </td>
                                                                        <td align="right" width="7">
                                                                            <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" />
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </HeaderTemplate>
                                                            <ItemTemplate>
                                                                <table border="0" cellpadding="4" cellspacing="0" width="100%">
                                                                    <tr>
                                                                        <td class="tdLeft" style="width: 5%; text-align: center;"><%#DataBinder .Eval (Container .DataItem ,"ID") %></td>
                                                                        <td class="tdLeft" style="width: 10%; padding-left: 5px; text-align: center;"><%#DataBinder .Eval (Container .DataItem,"Type") %></td>
                                                                        <td class="tdLeft" style="width: 5%; padding-left: 5px; text-align: center;"><%#DataBinder .Eval (Container .DataItem,"IsImportant") %></td>
                                                                        <td class="tdLeft" style="width: 10%; text-align: center;"><%#DataBinder .Eval (Container .DataItem,"ContactPerson") %></td>
                                                                        <td class="tdLeft" style="width: 10%; text-align: center;"><%#DataBinder.Eval(Container.DataItem, "AnswerTime", "{0:yyyy/MM/dd}")%></td>
                                                                        <td class="tdLeft" style="width: 13%; text-align: center;"><%#DataBinder .Eval (Container .DataItem,"Company") %></td>
                                                                        <td class="tdLeft" style="width: 10%; text-align: center;"><%#DataBinder .Eval (Container .DataItem,"PhoneNumber") %></td>
                                                                        <td class="tdLeft" style="width: 10%; text-align: center;"><%#DataBinder .Eval (Container .DataItem,"EMail") %></td>
                                                                        <td class="tdLeft" style="width: 10%; text-align: center;"><%#DataBinder.Eval(Container.DataItem, "SummitTime", "{0:yyyy/MM/dd hh:MM:ss}")%></td>
                                                                        <td class="tdLeft" style="width: 5%; text-align: center;"><%#DataBinder .Eval (Container .DataItem, "Status") %></td>
                                                                        <td class="tdRight" style="width: 7%; text-align: center;"><%#DataBinder .Eval (Container .DataItem, "OperatorName") %></td>
                                                                        <td class="tdRight" style="width: 5%; text-align: center;"><%#DataBinder .Eval (Container .DataItem, "RecorderCode") %></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td class="tdLeft" style="width: 5%; text-align: center; font-size: 10pt;">
                                                                            <asp:Label ID="Label14" runat="server" Text="<%$ Resources:lang,WenTi%>"></asp:Label>
                                                                        </td>
                                                                        <td class="tdRight" colspan="7" style="width: 95%; text-align: left; padding-left: 5px"><%#DataBinder .Eval (Container .DataItem,"Question") %></td>
                                                                        <td class="tdLeft" style="text-align: Center;"><%#DataBinder .Eval (Container .DataItem, "UserIP") %></td>
                                                                        <td class="tdRight" colspan="3" style="text-align: Left;"><%#DataBinder .Eval (Container .DataItem, "UserPosition") %></td>
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
                                                        <asp:Label ID="Label35" runat="server" Text="商机信息"></asp:Label>
                                                    </HeaderTemplate>
                                                    <ContentTemplate>
                                                     <asp:DataList ID="DataList1" runat="server" CellPadding="0" ForeColor="#333333" Height="1px"   Width="100%">
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
                                                    </ContentTemplate>
                                                </cc2:TabPanel>
                                            </cc2:TabContainer>
                                            <table border="0" cellpadding="5" cellspacing="0" width="100%">
                                                <tr>
                                                    <td align="left" class="tdTopLine" width="300px">
                                                        <asp:Label ID="Label14" runat="server" Text="<%$ Resources:lang,ZhiJieChengYuan%>"></asp:Label>
                                                        ：<asp:DropDownList ID="DL_Operator" runat="server" DataTextField="UserName" DataValueField="UserCode">
                                                        </asp:DropDownList>
                                                        <asp:Button ID="BT_TransferOperator" runat="server" CssClass="inpuLong" OnClick="BT_TransferOperator_Click" Text="<%$ Resources:lang,ZhiDingWeiShouLiRen%>" />
                                                    </td>
                                                    <td align="left" width="200px">
                                                        <asp:HyperLink ID="HL_QuestionToCustomer" runat="server" Target="_blank">--&gt;<asp:Label ID="Label15" runat="server" Text="<%$ Resources:lang,ZhuanChengKeHuHuoGuanLianKeHu%>"></asp:Label></asp:HyperLink>
                                                    </td>
                                                    <td align="left">
                                                        <asp:Button ID="BT_CancelDelete" runat="server" CssClass="inpu" OnClick="BT_CancelDelete_Click" Text="<%$ Resources:lang,QuXiaoShanChu%>" Visible="false" />
                                                    </td>
                                                </tr>
                                            </table>
                                    <tr>
                                        <td align="left">
                                            <cc2:TabContainer ID="TabContainer1" runat="server" ActiveTabIndex="0" CssClass="ajax_tab_menu" Width="100%">
                                                <cc2:TabPanel ID="TabPanel1" runat="server" HeaderText="协作日志" TabIndex="0">
                                                    <HeaderTemplate>
                                                        <asp:Label ID="Label16" runat="server" Text="<%$ Resources:lang,KeHuYiJian%>"></asp:Label>
                                                    </HeaderTemplate>
                                                    <ContentTemplate>
                                                        <asp:DataList ID="DataList3" runat="server" CellPadding="0" ForeColor="#333333" Height="1px" HorizontalAlign="Center" Width="98%">
                                                            <AlternatingItemStyle BackColor="White" />
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
                                                                                    <td align="center" width="7%"><strong>
                                                                                        <asp:Label ID="Label17" runat="server" Text="<%$ Resources:lang,BianHao%>"></asp:Label>
                                                                                        </strong></td>
                                                                                    <td align="center" width="10%"><strong>
                                                                                        <asp:Label ID="Label18" runat="server" Text="<%$ Resources:lang,LianXiRen%>"></asp:Label>
                                                                                        </strong></td>
                                                                                    <td align="center" width="20%"><strong>
                                                                                        <asp:Label ID="Label19" runat="server" Text="<%$ Resources:lang,LianXiFangShi%>"></asp:Label>
                                                                                        </strong></td>
                                                                                    <td align="center" width="15%"><strong>
                                                                                        <asp:Label ID="Label20" runat="server" Text="<%$ Resources:lang,FuWuFangFa%>"></asp:Label>
                                                                                        </strong></td>
                                                                                    <td align="center" width="20%"><strong>
                                                                                        <asp:Label ID="Label21" runat="server" Text="<%$ Resources:lang,ChuLiShiJian%>"></asp:Label>
                                                                                        </strong></td>
                                                                                    <td align="center" width="8%"><strong>
                                                                                        <asp:Label ID="Label22" runat="server" Text="<%$ Resources:lang,YongShiChangDu%>"></asp:Label>
                                                                                        </strong></td>
                                                                                    <td align="center" width="10%"><strong>
                                                                                        <asp:Label ID="Label23" runat="server" Text="<%$ Resources:lang,ZhuangTai%>"></asp:Label>
                                                                                        </strong></td>
                                                                                    <td align="center" width="10%"><strong>
                                                                                        <asp:Label ID="Label24" runat="server" Text="<%$ Resources:lang,ShouLiRen%>"></asp:Label>
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
                                                                        <td class="tdLeft" style="width: 7%; text-align: center;"><%#DataBinder .Eval (Container .DataItem ,"ID") %></td>
                                                                        <td class="tdLeft" style="width: 10%; padding-left: 5px; text-align: left;"><%#DataBinder.Eval(Container.DataItem, "CustomerAcceptor")%></td>
                                                                        <td class="tdLeft" style="width: 20%; text-align: center;"><%#DataBinder.Eval(Container.DataItem, "AcceptorContactWay")%></td>
                                                                        <td class="tdLeft" style="width: 15%; text-align: center;"><%#DataBinder.Eval(Container.DataItem, "HandleWay")%></td>
                                                                        <td class="tdLeft" style="width: 20%; text-align: center;"><%#DataBinder.Eval(Container.DataItem, "HandleTime","{0:yyyy/MM/dd hh:MM:ss}")%></td>
                                                                        <td class="tdLeft" style="width: 8%; text-align: center;"><%#DataBinder .Eval (Container .DataItem ,"UsedTime") %><%#DataBinder .Eval (Container .DataItem ,"TimeUnit") %></td>
                                                                        <td class="tdLeft" style="width: 10%; text-align: center;"><%#DataBinder .Eval (Container .DataItem ,"HandleStatus") %></td>
                                                                        <td class="tdRight" style="width: 10%; text-align: center;"><%#DataBinder .Eval (Container .DataItem ,"OperatorName") %></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td class="tdLeft" style="width: 5%; text-align: center; font-size: 10pt;">
                                                                            <asp:Label ID="Label25" runat="server" Text="<%$ Resources:lang,ChuLiNeiRong%>"></asp:Label>
                                                                        </td>
                                                                        <td class="tdRight" colspan="7" style="width: 95%; text-align: left; padding-left: 5px"><%#DataBinder.Eval(Container.DataItem, "HandleDetail")%></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td class="tdLeft" style="width: 5%; text-align: center; font-size: 10pt;">
                                                                            <asp:Label ID="Label26" runat="server" Text="<%$ Resources:lang,KeFangPingJia%>"></asp:Label>
                                                                        </td>
                                                                        <td class="tdRight" colspan="7" style="width: 95%; text-align: left; padding-left: 5px"><%#DataBinder.Eval(Container.DataItem, "CustomerComment")%></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td class="tdLeft" style="width: 5%; text-align: center; font-size: 10pt;">
                                                                            <asp:Label ID="Label27" runat="server" Text="<%$ Resources:lang,XiaCiFuWuShiJian%>"></asp:Label>
                                                                        </td>
                                                                        <td class="tdRight" style="width: 10%; text-align: left; padding-left: 5px"><%#DataBinder.Eval(Container.DataItem, "NextServiceTime")%></td>
                                                                        <td class="tdLeft" style="width: 20%; text-align: center; font-size: 10pt;">
                                                                            <asp:Label ID="Label28" runat="server" Text="<%$ Resources:lang,TiQianTongZhiTianShu%>"></asp:Label>
                                                                        </td>
                                                                        <td class="tdRight" colspan="6" style="text-align: left; padding-left: 5px"><%#DataBinder.Eval(Container.DataItem, "PreDays")%></td>
                                                                    </tr>
                                                                </table>
                                                            </ItemTemplate>
                                                            <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                        </asp:DataList>
                                                        <table border="0" cellpadding="5" cellspacing="0" width="100%">
                                                            <tr>
                                                                <td class="tdTopLine" colspan="11"></td>
                                                            </tr>
                                                        </table>
                                                    </ContentTemplate>
                                                </cc2:TabPanel>
                                                <cc2:TabPanel ID="TabPanel2" runat="server" HeaderText="相关文件" TabIndex="1">
                                                    <ContentTemplate>
                                                        <table background="ImagesSkin/main_n_bj.jpg" cellpadding="0" cellspacing="0" width="100%">
                                                            <tr>
                                                                <td width="7">
                                                                    <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" />
                                                                </td>
                                                                <td>
                                                                    <table cellpadding="0" cellspacing="0" width="100%">
                                                                        <tr>
                                                                            <td align="center" width="10%"><strong>
                                                                                <asp:Label ID="Label29" runat="server" Text="<%$ Resources:lang,XuHao%>"></asp:Label>
                                                                                </strong></td>
                                                                            <td align="center" width="15%"><strong>
                                                                                <asp:Label ID="Label30" runat="server" Text="<%$ Resources:lang,LeiXing%>"></asp:Label>
                                                                                </strong></td>
                                                                            <td align="center" width="25%"><strong>
                                                                                <asp:Label ID="Label31" runat="server" Text="<%$ Resources:lang,WenJianMing%>"></asp:Label>
                                                                                </strong></td>
                                                                            <td align="center" width="15%"><strong>
                                                                                <asp:Label ID="Label32" runat="server" Text="<%$ Resources:lang,ZuoZhe%>"></asp:Label>
                                                                                </strong></td>
                                                                            <td align="center" width="15%"><strong>
                                                                                <asp:Label ID="Label33" runat="server" Text="<%$ Resources:lang,ShangChuanZhe%>"></asp:Label>
                                                                                </strong></td>
                                                                            <td align="center" width="20%"><strong>
                                                                                <asp:Label ID="Label34" runat="server" Text="<%$ Resources:lang,ShangChuanShiJian%>"></asp:Label>
                                                                                </strong></td>
                                                                        </tr>
                                                                    </table>
                                                                </td>
                                                                <td align="right" width="6">
                                                                    <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" />
                                                                </td>
                                                            </tr>
                                                        </table>
                                                        <asp:DataGrid ID="DataGrid1" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" Height="1px" ShowHeader="False" Width="100%">
                                                            <Columns>
                                                                <asp:BoundColumn DataField="DocID" HeaderText="序号">
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                </asp:BoundColumn>
                                                                <asp:BoundColumn DataField="DocType" HeaderText="类型">
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="15%" />
                                                                </asp:BoundColumn>
                                                                <asp:HyperLinkColumn DataNavigateUrlField="Address" DataNavigateUrlFormatString="{0}" DataTextField="DocName" HeaderText="文件名" Target="_blank">
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="25%" />
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
                                                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" Width="10%" />
                                                            <EditItemStyle BackColor="#2461BF" />
                                                            <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                            <PagerStyle CssClass="notTab" HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" />
                                                            <ItemStyle CssClass="itemStyle" />
                                                        </asp:DataGrid>
                                                    </ContentTemplate>
                                                </cc2:TabPanel>
                                            </cc2:TabContainer>
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
