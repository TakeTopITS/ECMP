<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTCustomerQuestionRecord_YOUP.aspx.cs" Inherits="TTCustomerQuestionRecord_YOUP" %>

<%@ Register Assembly="NickLee.Web.UI" Namespace="NickLee.Web.UI" TagPrefix="NickLee" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
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
    <style type="text/css">
        .auto-style1 {
            background-color: #F6FAFD;
            background-repeat: no-repeat;
            width: 120px;
        }

        .auto-style2 {
            background-color: #F6FAFD;
            background-repeat: no-repeat;
        }
    </style>

</head>
<body>
    <center>
        <form id="form1" runat="server">
            <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="True" EnableScriptLocalization="True">
            </asp:ScriptManager>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <table cellpadding="0" cellspacing="0" width="100%" class="bian">
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
                                                        <asp:Label ID="Label45" runat="server" Text="<%$ Resources:lang,KeHuXuQiuJiLu%>"></asp:Label>
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
                                <table style="width: 100%;">
                                    <tr>
                                        <td style="width: 220px; border-right: solid 1px #D8D8D8; padding: 5px 0px 0px 5px"
                                            valign="top" align="left">
                                            <asp:TreeView ID="TreeView1" runat="server" NodeWrap="True" OnSelectedNodeChanged="TreeView1_SelectedNodeChanged"
                                                ShowLines="True" Width="220px">
                                                <RootNodeStyle CssClass="rootNode" />
                                                <NodeStyle CssClass="treeNode" />
                                                <LeafNodeStyle CssClass="leafNode" />
                                                <SelectedNodeStyle CssClass="selectNode" ForeColor ="Red" />
                                            </asp:TreeView>
                                        </td>
                                        <td style="padding: 5px 0px 0px 5px" valign="top" align="left">
                                            <cc2:TabContainer CssClass="ajax_tab_menu" ID="TabContainer1" runat="server" ActiveTabIndex="0" Width="100%">
                                                <cc2:TabPanel ID="TabPanel3" runat="server" HeaderText="协作日志" TabIndex="0">
                                                    <HeaderTemplate>
                                                        <asp:Label ID="Label44" runat="server" Text="<%$ Resources:lang,FuWuNeiRong%>"></asp:Label>
                                                    </HeaderTemplate>
                                                    <ContentTemplate>
                                                        <br />
                                                        <table width="95%" cellpadding="3" cellspacing="0" class="formBgStyle">
                                                            <tr>
                                                                <td style="width: 120px; text-align: right;" class="formItemBgStyle">
                                                                    <asp:Label ID="Label43" runat="server" Text="<%$ Resources:lang,DaiMa%>"></asp:Label>：</td>
                                                                <td style="text-align: left;" class="formItemBgStyle">
                                                                    <asp:TextBox ID="TB_ContactPerson" runat="server"></asp:TextBox>
                                                                </td>
                                                                <td align="right" class="formItemBgStyle">
                                                                    <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,XingMing%>"></asp:Label>：</td>
                                                                <td align="left" class="formItemBgStyle">
                                                                    <asp:TextBox ID="TB_Company" runat="server" Width="200px"></asp:TextBox>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td class="formItemBgStyle" style="width: 120px; text-align: right;">
                                                                    <asp:Label ID="Label42" runat="server" Text="<%$ Resources:lang,DianHuaYi%>"></asp:Label>：</td>
                                                                <td class="formItemBgStyle" style="text-align: left;">
                                                                    <asp:TextBox ID="TB_PhoneNumber" runat="server"></asp:TextBox>
                                                                </td>
                                                                <td align="right" class="formItemBgStyle">
                                                                    <asp:Label ID="Label41" runat="server" Text="<%$ Resources:lang,DianHuaEr%>"></asp:Label>：</td>
                                                                <td align="left" class="formItemBgStyle">
                                                                    <asp:TextBox ID="TB_EMail" runat="server"></asp:TextBox>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td class="formItemBgStyle" style="width: 120px; text-align: right;">
                                                                    <asp:Label ID="Label40" runat="server" Text="<%$ Resources:lang,KeHuDengJi%>"></asp:Label>：</td>
                                                                <td class="formItemBgStyle" style="text-align: left;">
                                                                    <asp:DropDownList ID="DL_OperatorName" runat="server" CssClass="DDList">
                                                                        <asp:ListItem>A</asp:ListItem>
                                                                        <asp:ListItem>B</asp:ListItem>
                                                                        <asp:ListItem>C</asp:ListItem>
                                                                        <asp:ListItem>D</asp:ListItem>
                                                                    </asp:DropDownList>
                                                                </td>
                                                                <td align="right" class="formItemBgStyle">
                                                                    <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,ShenFenZhengHao%>"></asp:Label>：</td>
                                                                <td align="left" class="formItemBgStyle">
                                                                    <asp:TextBox ID="TB_CustomerArea" runat="server" Width="200px"></asp:TextBox>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td class="auto-style1" style="text-align: right;">
                                                                    <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,KeHuLaiYuan%>"></asp:Label>：</td>
                                                                <td class="auto-style2" style="text-align: left;">
                                                                    <asp:TextBox ID="TB_Address" runat="server" Width="150px"></asp:TextBox>
                                                                </td>
                                                                <td align="right" class="auto-style2">
                                                                    <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,DianShu%>"></asp:Label>：</td>
                                                                <td align="left" class="auto-style2">
                                                                    <asp:TextBox ID="TB_PostCode" runat="server"></asp:TextBox>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td class="formItemBgStyle" style="width: 120px; text-align: right;">
                                                                    <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,ShouCiZiXun%>"></asp:Label>：</td>
                                                                <td class="formItemBgStyle" style="text-align: left;">
                                                                    <asp:TextBox ID="DLC_SummitTime" runat="server"></asp:TextBox>
                                                                    <cc2:CalendarExtender ID="DLC_SummitTime_CalendarExtender" runat="server" Enabled="True" Format="yyyy-MM-dd" TargetControlID="DLC_SummitTime">
                                                                    </cc2:CalendarExtender>
                                                                </td>
                                                                <td align="right" class="formItemBgStyle">
                                                                    <asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,XuQiuZiJin%>"></asp:Label>：</td>
                                                                <td align="left" class="formItemBgStyle">
                                                                    <asp:TextBox ID="TB_Type" runat="server"></asp:TextBox>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td class="formItemBgStyle" style="width: 120px; text-align: right;">
                                                                    <asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,HangYeLeiXing%>"></asp:Label>：</td>
                                                                <td class="formItemBgStyle" style="text-align: left;">
                                                                    <asp:TextBox ID="TB_UserPosition" runat="server" Width="150px"></asp:TextBox>
                                                                </td>
                                                                <td align="right" class="formItemBgStyle">
                                                                    <asp:Label ID="Label8" runat="server" Text="<%$ Resources:lang,JiLuRen%>"></asp:Label>：</td>
                                                                <td align="left" class="formItemBgStyle">
                                                                    <asp:Label ID="LB_UserCode" runat="server" Visible="False"></asp:Label>
                                                                    &nbsp;<asp:Label ID="LB_UserName" runat="server"></asp:Label>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td class="formItemBgStyle" style="width: 120px; text-align: right;">
                                                                    <asp:Label ID="Label9" runat="server" Text="<%$ Resources:lang,YaoQiuDaFuShiJian%>"></asp:Label>：</td>
                                                                <td class="formItemBgStyle" style="text-align: left;">
                                                                    <asp:TextBox ID="DLC_AnswerTime" runat="server"></asp:TextBox>
                                                                    <cc2:CalendarExtender ID="CalendarExtender1" runat="server" Enabled="True" Format="yyyy-MM-dd" TargetControlID="DLC_AnswerTime">
                                                                    </cc2:CalendarExtender>
                                                                </td>
                                                                <td align="right" class="formItemBgStyle">
                                                                    <asp:Label ID="Label10" runat="server" Text="<%$ Resources:lang,ZhuangTai%>"></asp:Label>：</td>
                                                                <td align="left" class="formItemBgStyle">
                                                                    <asp:Label ID="LB_Status" runat="server" ></asp:Label>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td style="width: 120px; text-align: right;" class="formItemBgStyle">
                                                                    <asp:Label ID="Label11" runat="server" Text="<%$ Resources:lang,JiBenZiLiao%>"></asp:Label>： </td>
                                                                <td align="left" class="formItemBgStyle" colspan="3">
                                                                    <CKEditor:CKEditorControl ID="TB_Question" runat="server" Width="95%" Height="120px" Visible="False" />
                                                                    <CKEditor:CKEditorControl runat="server" ID="HT_Question" Width="95%" Height="120px" Visible="False" />
                                                                    &#160;<font color="#FF0000">*</font> </td>
                                                            </tr>
                                                            <tr>
                                                                <td class="formItemBgStyle" style="width: 120px; text-align: right;">
                                                                    <asp:Label ID="Label12" runat="server" Text="<%$ Resources:lang,ShouLiRenChaXunXinXi%>"></asp:Label>：</td>
                                                                <td class="formItemBgStyle" style="text-align: left;" colspan="3">
                                                                    <asp:TextBox ID="TB_UserInfo" runat="server"></asp:TextBox>
                                                                    (<asp:Label ID="Label13" runat="server" Text="<%$ Resources:lang,KSXSLRDJSFW%>"></asp:Label>)                                                                               
                                                                    <asp:Button runat="server" Text="<%$ Resources:lang,ChaXun%>" CssClass="inpu" ID="BT_Check" OnClick="BT_Check_Click"></asp:Button>
                                                                    <asp:Label ID="LB_Sql3" runat="server" Visible="False"></asp:Label>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td class="formItemBgStyle" style="width: 120px; text-align: right;">
                                                                    <asp:Label ID="Label14" runat="server" Text="<%$ Resources:lang,ShouLiRen%>"></asp:Label>： </td>
                                                                <td class="formItemBgStyle" style="text-align: left;">
                                                                    <asp:TextBox ID="TB_OperatorCode" runat="server"></asp:TextBox>
                                                                    <cc2:ModalPopupExtender ID="TB_OperatorCode_ModalPopupExtender" runat="server" BackgroundCssClass="modalBackground" CancelControlID="IMBT_Close" DynamicServicePath="" Enabled="True" PopupControlID="Panel1" TargetControlID="TB_OperatorCode">
                                                                    </cc2:ModalPopupExtender>
                                                                    <asp:Label ID="LB_ID" runat="server" Visible="False"></asp:Label>
                                                                    <asp:Label ID="LB_OperatorName" runat="server"  Height="20px"></asp:Label>
                                                                </td>
                                                                <td align="right" class="formItemBgStyle">
                                                                    <asp:Label ID="Label15" runat="server" Text="<%$ Resources:lang,ShouLiZhuangTai%>"></asp:Label>：</td>
                                                                <td align="left" class="formItemBgStyle">
                                                                    <asp:Label ID="LB_OperatorCode" runat="server"  Height="20px" Visible="False"></asp:Label>
                                                                    <asp:Label ID="LB_OperatorStatus" runat="server"  Height="20px"></asp:Label>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td style="width: 120px; text-align: right;" class="formItemBgStyle">&nbsp; </td>
                                                                <td align="left" class="formItemBgStyle" colspan="3">
                                                                    <table width="700px">
                                                                        <tr>
                                                                            <td align="left">
                                                                                <asp:Button ID="BT_New" CssClass="inpu" runat="server" Text="<%$ Resources:lang,XinJian%>" OnClick="BT_New_Click" />&#160;<asp:Button ID="BT_Update" CssClass="inpu" runat="server" Text="<%$ Resources:lang,BaoCun%>" OnClick="BT_Update_Click"
                                                                                    Enabled="False" />&#160;<asp:Button ID="BT_Delete" CssClass="inpu" runat="server" Text="<%$ Resources:lang,ShanChu%>" OnClick="BT_Delete_Click" OnClientClick="return confirm(getDeleteMsgByLangCode())"
                                                                                        Enabled="False" />&#160;&#160;<asp:Button ID="BT_Clear" CssClass="inpu" runat="server" Text="<%$ Resources:lang,QingKong%>"
                                                                                            OnClick="BT_Clear_Click" />&#160;&#160;&#160; </td>
                                                                            <td>
                                                                                <asp:Label ID="Label16" runat="server" Text="<%$ Resources:lang,ZhiJieChengYuan%>"></asp:Label>：</td>
                                                                            <td>
                                                                                <asp:DropDownList ID="DL_Operator" DataTextField="UserName" DataValueField="UserCode" runat="server"></asp:DropDownList></td>
                                                                            <td>
                                                                                <asp:Button ID="BT_TransferOperator" runat="server" CssClass="inpuLong" Text="<%$ Resources:lang,ZhiDingWeiShouLiRen%>" OnClick="BT_TransferOperator_Click" Enabled="False" /></td>
                                                                            <td></td>
                                                                        </tr>
                                                                    </table>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                        <asp:Panel ID="Panel1" runat="server" CssClass="modalPopup" Style="display: none;">
                                                            <div class="modalPopup-text" style="width: 500px; height: 395px; overflow: auto;">
                                                                <table>
                                                                    <tr>
                                                                        <td valign="top" align="left">
                                                                            <table width="450px" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                                                                <tr>
                                                                                    <td>
                                                                                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                                            <tr>
                                                                                                <td width="40%" align="center">
                                                                                                    <strong>
                                                                                                        <asp:Label ID="Label17" runat="server" Text="<%$ Resources:lang,YongHuDaiMa%>"></asp:Label></strong>
                                                                                                </td>
                                                                                                <td width="40%" align="center">
                                                                                                    <strong>
                                                                                                        <asp:Label ID="Label18" runat="server" Text="<%$ Resources:lang,YongHuXingMing%>"></asp:Label></strong>
                                                                                                </td>
                                                                                                <td width="20%" align="center">
                                                                                                    <strong>
                                                                                                        <asp:Label ID="Label19" runat="server" Text="<%$ Resources:lang,ZhuangTai%>"></asp:Label></strong>
                                                                                                </td>
                                                                                            </tr>
                                                                                        </table>
                                                                                    </td>
                                                                                </tr>
                                                                            </table>
                                                                            <asp:DataGrid ID="DataGrid3" runat="server" AutoGenerateColumns="False" OnItemCommand="DataGrid3_ItemCommand"
                                                                                Width="450px" AllowPaging="True" OnPageIndexChanged="DataGrid3_PageIndexChanged"
                                                                                ShowHeader="False" CellPadding="4" ForeColor="#333333" GridLines="None">
                                                                                <Columns>
                                                                                    <asp:TemplateColumn HeaderText="用户代码">
                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="40%" />
                                                                                        <ItemTemplate>
                                                                                            <asp:Button ID="BT_UserCode" runat="server" CssClass="inpu" Style="text-align: center"
                                                                                                Text='<%# DataBinder.Eval(Container.DataItem,"UserCode").ToString().Trim() %>' />
                                                                                        </ItemTemplate>
                                                                                    </asp:TemplateColumn>
                                                                                    <asp:BoundColumn DataField="UserName" HeaderText="用户姓名">
                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="40%" />
                                                                                    </asp:BoundColumn>
                                                                                    <asp:TemplateColumn HeaderText="状态">
                                                                                        <ItemTemplate>
                                                                                            <%# ShareClass. GetStatusHomeNameByOtherStatus(Eval("Status").ToString()) %>
                                                                                        </ItemTemplate>
                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="20%" />
                                                                                    </asp:TemplateColumn>
                                                                                </Columns>
                                                                                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                                                <EditItemStyle BackColor="#2461BF" />
                                                                                <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                                                <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />

                                                                                <ItemStyle CssClass="itemStyle" />
                                                                            </asp:DataGrid>
                                                                        </td>
                                                                        <td style="width: 60px; padding: 5px 5px 5px 5px;" valign="top" align="center">
                                                                            <asp:ImageButton ID="IMBT_Close" ImageUrl="ImagesSkin/Close4.jpg" runat="server" />
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </div>
                                                        </asp:Panel>
                                                    </ContentTemplate>
                                                </cc2:TabPanel>
                                                <cc2:TabPanel ID="TabPanel1" runat="server" HeaderText="协作日志" TabIndex="0">
                                                    <HeaderTemplate>
                                                        <asp:Label ID="Label21" runat="server" Text="<%$ Resources:lang,FuWuJiLu%>"></asp:Label>
                                                    </HeaderTemplate>
                                                    <ContentTemplate>
                                                        <asp:DataList ID="DataList3" runat="server" CellPadding="0" ForeColor="#333333" Height="1px" Width="98%">
                                                            <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                            <HeaderTemplate>
                                                                <table width="100%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                                                    <tr>
                                                                        <td>
                                                                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                                <tr>
                                                                                    <td width="5%" align="center">
                                                                                        <strong>
                                                                                            <asp:Label ID="Label20" runat="server" Text="<%$ Resources:lang,BianHao%>"></asp:Label></strong>
                                                                                    </td>
                                                                                    <td width="7%" align="center">
                                                                                        <strong>
                                                                                            <asp:Label ID="Label22" runat="server" Text="<%$ Resources:lang,FuWuRiQi%>"></asp:Label></strong>
                                                                                    </td>
                                                                                    <td width="5%" align="center">
                                                                                        <strong>
                                                                                            <asp:Label ID="Label23" runat="server" Text="<%$ Resources:lang,YeWuRenYuan%>"></asp:Label></strong>
                                                                                    </td>
                                                                                    <td width="5%" align="center">
                                                                                        <strong>
                                                                                            <asp:Label ID="Label24" runat="server" Text="<%$ Resources:lang,TuiJianYinHang%>"></asp:Label></strong>
                                                                                    </td>
                                                                                    <td width="7%" align="center">
                                                                                        <strong>
                                                                                            <asp:Label ID="Label25" runat="server" Text="<%$ Resources:lang,ShangMenShiJian%>"></asp:Label></strong>
                                                                                    </td>
                                                                                    <td width="8%" align="center">
                                                                                        <strong>
                                                                                            <asp:Label ID="Label26" runat="server" Text="<%$ Resources:lang,BanLiYinHang%>"></asp:Label></strong>
                                                                                    </td>
                                                                                    <td width="5%" align="center">
                                                                                        <strong>
                                                                                            <asp:Label ID="Label27" runat="server" Text="<%$ Resources:lang,JingBanRen%>"></asp:Label></strong>
                                                                                    </td>
                                                                                    <td width="7%" align="center">
                                                                                        <strong>
                                                                                            <asp:Label ID="Label28" runat="server" Text="<%$ Resources:lang,TiJiaoShiJian%>"></asp:Label></strong>
                                                                                    </td>
                                                                                    <td width="5%" align="center">
                                                                                        <strong>
                                                                                            <asp:Label ID="Label29" runat="server" Text="<%$ Resources:lang,BanLiQingKuang%>"></asp:Label></strong>
                                                                                    </td>
                                                                                    <td width="7%" align="center">
                                                                                        <strong>
                                                                                            <asp:Label ID="Label30" runat="server" Text="<%$ Resources:lang,PiKuanShiJian%>"></asp:Label></strong>
                                                                                    </td>
                                                                                    <td width="5%" align="center">
                                                                                        <strong>
                                                                                            <asp:Label ID="Label31" runat="server" Text="<%$ Resources:lang,QianYue%>"></asp:Label></strong>
                                                                                    </td>
                                                                                    <td width="5%" align="center">
                                                                                        <strong>
                                                                                            <asp:Label ID="Label32" runat="server" Text="<%$ Resources:lang,FangKuan%>"></asp:Label></strong>
                                                                                    </td>
                                                                                    <td width="5%" align="center">
                                                                                        <strong>
                                                                                            <asp:Label ID="Label33" runat="server" Text="<%$ Resources:lang,ShouKuanRen%>"></asp:Label></strong>
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
                                                                            <%#DataBinder.Eval(Container.DataItem, "ID")%>
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
                                                <cc2:TabPanel ID="TabPanel2" runat="server" HeaderText="相关文件" TabIndex="1">
                                                    <HeaderTemplate>
                                                        <asp:Label ID="Label46" runat="server" Text="<%$ Resources:lang,XiangGuanWenJian%>"></asp:Label>
                                                    </HeaderTemplate>
                                                    <ContentTemplate>
                                                        <table width="100%" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                                            <tr>
                                                                <td>
                                                                    <table width="100%" cellspacing="0" cellpadding="0">
                                                                        <tr>
                                                                            <td width="10%" align="center"><strong>
                                                                                <asp:Label ID="Label34" runat="server" Text="<%$ Resources:lang,XuHao%>"></asp:Label></strong> </td>
                                                                            <td width="15%" align="center"><strong>
                                                                                <asp:Label ID="Label35" runat="server" Text="<%$ Resources:lang,LeiXing%>"></asp:Label></strong> </td>
                                                                            <td width="25%" align="center"><strong>
                                                                                <asp:Label ID="Label36" runat="server" Text="<%$ Resources:lang,WenJianMing%>"></asp:Label></strong> </td>
                                                                            <td width="15%" align="center"><strong>
                                                                                <asp:Label ID="Label37" runat="server" Text="<%$ Resources:lang,ZuoZhe%>"></asp:Label></strong> </td>
                                                                            <td width="15%" align="center"><strong>
                                                                                <asp:Label ID="Label38" runat="server" Text="<%$ Resources:lang,ShangChuanZhe%>"></asp:Label></strong> </td>
                                                                            <td width="20%" align="center"><strong>
                                                                                <asp:Label ID="Label39" runat="server" Text="<%$ Resources:lang,ShangChuanShiJian%>"></asp:Label></strong> </td>
                                                                        </tr>
                                                                    </table>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                        <asp:DataGrid ID="DataGrid1" runat="server"
                                                            AutoGenerateColumns="False" ShowHeader="False"
                                                            CellPadding="4" ForeColor="#333333" GridLines="None" Height="1px"
                                                            Width="100%">
                                                            <Columns>
                                                                <asp:BoundColumn DataField="DocID" HeaderText="序号">
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                </asp:BoundColumn>
                                                                <asp:BoundColumn DataField="DocType" HeaderText="类型">
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="15%" />
                                                                </asp:BoundColumn>
                                                                <asp:HyperLinkColumn DataNavigateUrlField="Address" DataNavigateUrlFormatString="{0}"
                                                                    DataTextField="DocName" HeaderText="文件名" Target="_blank">
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
                                                            <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />

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
