<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTOtherTaskDetail.aspx.cs" Inherits="TTOtherTaskDetail" %>

<%@ Register Assembly="NickLee.Web.UI" Namespace="NickLee.Web.UI" TagPrefix="NickLee" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link id="mainCss" href="css/bluelightmain.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        #AboveDiv {
            min-width: 1100px;
            width: expression (document.body.clientWidth <= 1100? "1100px" : "auto" ));
        }
    </style>
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
            <%-- <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="True" EnableScriptLocalization="True">--%>
            <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="True" EnableScriptLocalization="True">
            </asp:ScriptManager>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <div id="AboveDiv">
                        <table id="AboveTable" cellpadding="0" width="100%" cellspacing="0" class="bian">
                            <tr>
                                <td>

                                    <table cellpadding="0" cellspacing="0" width="100%">
                                        <tr>
                                            <td height="31" class="page_topbj">
                                                <table width="96%" border="0" align="center" cellpadding="0" cellspacing="0">
                                                    <tr>
                                                        <td align="left">
                                                            <table width="180" border="0" align="left" cellpadding="0" cellspacing="0">
                                                                <tr>
                                                                    <td width="29">
                                                                        <%--<img src="Logo/main_top_l.jpg" alt="" width="29" height="31" />--%>
                                                                    </td>
                                                                    <td align="center" background="ImagesSkin/main_top_bj.jpg" class="titlezi">
                                                                        <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,RenWuChuLiXiangXiXinXi%>"></asp:Label>
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
                                            <td valign="top">
                                                <table cellpadding="0" cellspacing="0" width="100%">
                                                    <tr>
                                                        <td>
                                                            <table style="width: 98%;">
                                                                <tr>
                                                                    <td colspan="2" style="text-align: left;">

                                                                        <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,RenWuFenPaiJiLuZiLiao%>"></asp:Label>：</span>
                                                                         &nbsp;
                                                                        <asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,RenWu%>"></asp:Label>：
                                                                        <asp:HyperLink ID="HL_ProjectTaskView" runat="server" NavigateUrl="TTProjectTaskView.aspx?TaskID=" Target="_blank">
                                                                            <asp:Label ID="LB_TaskID" runat="server"></asp:Label>&nbsp;
                                                                        <asp:Label ID="LB_Task" runat="server"></asp:Label>
                                                                        </asp:HyperLink>
                                                                        <asp:Label ID="LB_ProjectID" runat="server" Visible="False"></asp:Label>
                                                                        <asp:Label ID="LB_UserName" runat="server" Visible="False"></asp:Label>
                                                                        <asp:Label ID="LB_UserCode" runat="server" Visible="False"></asp:Label>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td style="text-align: left;" class="formItemBgStyle">
                                                                        <div style="width: 100%; height: 100px; overflow-y: auto;">
                                                                            <asp:DataList ID="DataList2" runat="server" Width="100%" Height="1px" CellPadding="0"
                                                                                ForeColor="#333333">
                                                                                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                                                <ItemTemplate>
                                                                                    <table style="width: 100%;" cellpadding="4" cellspacing="0">
                                                                                        <tr>
                                                                                            <td style="width: 15%; text-align: right;">
                                                                                                <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,JiLuBianHao%>"></asp:Label>：
                                                                                            </td>
                                                                                            <td style="width: 20%" align="left">
                                                                                                <%# DataBinder.Eval(Container.DataItem,"ID") %>
                                                                                            </td>
                                                                                            <td style="text-align: right">
                                                                                                <asp:Label ID="Label23" runat="server" Text="<%$ Resources:lang,RenWu%>"></asp:Label>：
                                                                                            </td>
                                                                                            <td align="left">
                                                                                                <a href="TTProjectTaskView.aspx?TaskID=<%# DataBinder.Eval(Container.DataItem,"TaskID") %>">
                                                                                                    <%# DataBinder.Eval(Container.DataItem,"TaskID") %></a>
                                                                                            </td>
                                                                                            <td style="text-align: right">
                                                                                                <asp:Label ID="Label13" runat="server" Text="<%$ Resources:lang,GongShi2%>"></asp:Label>：
                                                                                            </td>
                                                                                            <td align="left">
                                                                                                <%# DataBinder.Eval(Container.DataItem,"ManHour") %>
                                                                                            </td>
                                                                                            <td style="text-align: right">
                                                                                                <asp:Label ID="Label14" runat="server" Text="<%$ Resources:lang,FeiYong%>"></asp:Label>：
                                                                                            </td>
                                                                                            <td align="left">
                                                                                                <%# DataBinder.Eval(Container.DataItem,"Expense") %>
                                                                                            </td>
                                                                                            <td style="text-align: right">
                                                                                                <asp:Label ID="Label15" runat="server" Text="<%$ Resources:lang,ZhuangTai%>"></asp:Label>：
                                                                                            </td>
                                                                                            <td style="text-align: left">
                                                                                                <%# DataBinder.Eval(Container.DataItem,"Status") %>
                                                                                            </td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td style="text-align: right;">
                                                                                                <asp:Label ID="Label8" runat="server" Text="<%$ Resources:lang,WoDeGongZuo%>"></asp:Label>：
                                                                                            </td>
                                                                                            <td colspan="7" style="text-align: left">
                                                                                                <b>
                                                                                                    <%# DataBinder.Eval(Container.DataItem,"Operation") %>
                                                                                                </b>
                                                                                            </td>
                                                                                        </tr>
                                                                                        <tr style="display: none;">
                                                                                            <td style="text-align: right;">
                                                                                                <asp:Label ID="Label9" runat="server" Text="<%$ Resources:lang,KaiShiShiJian%>"></asp:Label>：
                                                                                            </td>
                                                                                            <td align="left">
                                                                                                <%# DataBinder.Eval(Container.DataItem,"BeginDate","{0:yyyy/MM/dd}") %>
                                                                                            </td>
                                                                                            <td style="text-align: right;">
                                                                                                <asp:Label ID="Label10" runat="server" Text="<%$ Resources:lang,JieShuShiJian%>"></asp:Label>：
                                                                                            </td>
                                                                                            <td align="left">
                                                                                                <%# DataBinder.Eval(Container.DataItem, "EndDate", "{0:yyyy/MM/dd}")%>
                                                                                            </td>
                                                                                            <td style="text-align: right;">
                                                                                                <asp:Label ID="Label11" runat="server" Text="<%$ Resources:lang,FenPaiRen%>"></asp:Label>：
                                                                                            </td>
                                                                                            <td style="text-align: left;">
                                                                                                <%# DataBinder.Eval(Container.DataItem,"AssignManName") %>
                                                                                            </td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td style="text-align: right">
                                                                                                <asp:Label ID="Label12" runat="server" Text="<%$ Resources:lang,WoDeFanKui%>"></asp:Label>：
                                                                                            </td>
                                                                                            <td colspan="7" style="text-align: left">
                                                                                                <%# DataBinder.Eval(Container.DataItem,"OperatorContent") %>
                                                                                            </td>
                                                                                        </tr>
                                                                                        <tr style="display: none;">
                                                                                        </tr>
                                                                                    </table>
                                                                                </ItemTemplate>

                                                                                <ItemStyle BackColor="#EFF3FB" />
                                                                                <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                                                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                                            </asp:DataList>
                                                                        </div>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td colspan="2" align="left">
                                                                        <cc1:TabContainer CssClass="ajax_tab_menu" ID="TabContainer1" runat="server" ActiveTabIndex="0" Width="98%">
                                                                            <cc1:TabPanel ID="TabPanel2" runat="server" HeaderText="任务处理">
                                                                                <HeaderTemplate>
                                                                                    <asp:Label ID="Label49" runat="server" Text="<%$ Resources:lang,RenWuChuLi%>"></asp:Label>
                                                                                </HeaderTemplate>
                                                                                <ContentTemplate>
                                                                                    <table width="80%" cellpadding="3" cellspacing="0" class="formBgStyle">
                                                                                        <tr>
                                                                                            <td style="text-align: left;" class="formItemBgStyle">
                                                                                                <table width="100%">
                                                                                                    <tr>
                                                                                                        <td width="20%" align="left">
                                                                                                            <asp:Label ID="Label17" runat="server" Text="<%$ Resources:lang,WoDeZongJie %>"></asp:Label>：
                                                                                                        </td>

                                                                                                        <td align="right">
                                                                                                            <asp:Repeater ID="Repeater1" runat="server">
                                                                                                                <ItemTemplate>
                                                                                                                    <a href='<%# DataBinder.Eval(Container.DataItem,"ModulePage") %>' target="iframe">
                                                                                                                        <%# DataBinder.Eval(Container.DataItem,"HomeModuleName") %> &nbsp;
                                                                                                                    </a>
                                                                                                                </ItemTemplate>
                                                                                                            </asp:Repeater>

                                                                                                            &nbsp;&nbsp; &nbsp;&nbsp;

                                                                                                            <asp:HyperLink ID="HL_StartupBusinessForm" runat="server" Text="<%$ Resources:lang,XiangGuanYeWuDan %>"></asp:HyperLink>
                                                                                                            <asp:HyperLink ID="HL_TaskReview" runat="server" Enabled="False" Visible="False" Target="_blank" Text="<%$ Resources:lang,RenWuPingShen %>"></asp:HyperLink>
                                                                                                            <asp:HyperLink ID="HL_MakeProjectDefect" runat="server" Target="_blank" Text="<%$ Resources:lang,JianLiHeFenPaiXuQiu %>" Visible="False"></asp:HyperLink>
                                                                                                            <asp:Label ID="LB_AssignID" runat="server" Visible="False"></asp:Label>
                                                                                                            <asp:Label ID="LB_RouteNumber" runat="server" Visible="False"></asp:Label>
                                                                                                        </td>
                                                                                                    </tr>
                                                                                                </table>
                                                                                            </td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td style="width: 100%;" align="left" class="formItemBgStyle">
                                                                                                <table width="100%" cellpadding="3" cellspacing="0" class="formBgStyle">
                                                                                                    <tr>
                                                                                                        <td style="width: 10%; text-align: right" class="formItemBgStyle">

                                                                                                            <asp:Label ID="Label18" runat="server" Text="<%$ Resources:lang,FeiYong %>"></asp:Label>：
                                                                                                        </td>
                                                                                                        <td style="text-align: Left;" class="formItemBgStyle">

                                                                                                            <asp:HyperLink ID="HL_Expense" runat="server" NavigateUrl="TTProExpense.aspx" Text="<%$ Resources:lang,FeiYongMingXi %>" Target="_blank">
                                                                                                            </asp:HyperLink>

                                                                                                            <NickLee:NumberBox MaxAmount="1000000000000" MinAmount="-1000000000000" ID="TB_Expense" runat="server" OnBlur="" OnFocus="" OnKeyPress=""
                                                                                                                PositiveColor="" Visible="False" Width="60px">0.00</NickLee:NumberBox>

                                                                                                            &nbsp;&nbsp;
                                                                                                  
                                                                                                            <asp:Label ID="Label20" runat="server" Text="<%$ Resources:lang,HaoFeiGongShi %>"></asp:Label>:
                                                                                                     
                                                                                                            <NickLee:NumberBox MaxAmount="1000000000000" MinAmount="-1000000000000" ID="NB_ManHour" runat="server" OnBlur="" OnFocus="" OnKeyPress=""
                                                                                                                PositiveColor="" Width="60px">0.00</NickLee:NumberBox>
                                                                                                            &nbsp;&nbsp;
                                                                                                            <asp:Label ID="Label21" runat="server" Text="<%$ Resources:lang,JinDu %>"></asp:Label>：<NickLee:NumberBox MaxAmount="1000000000000" MinAmount="-1000000000000" ID="NB_FinishPercent" runat="server" OnBlur="" OnFocus="" OnKeyPress=""
                                                                                                                PositiveColor="" Precision="0" Width="60px">0</NickLee:NumberBox>

                                                                                                            <asp:Label ID="Label1" runat="server" Font-Bold="True" Text="%"></asp:Label>

                                                                                                            &nbsp;&nbsp;

                                                                                                            <asp:Label ID="LB_TaskProgress" runat="server" Text="<%$ Resources:lang,ZhengTi %>"></asp:Label>：
                                                                                                            <NickLee:NumberBox MaxAmount="1000000000000" MinAmount="-1000000000000" ID="NB_TaskProgress" runat="server" OnBlur="" OnFocus="" OnKeyPress="" Enabled="False"
                                                                                                                PositiveColor="" Precision="0" Width="60px">0</NickLee:NumberBox>

                                                                                                            <asp:Label ID="Label52" runat="server" Font-Bold="True" Text="%"></asp:Label>
                                                                                                        </td>
                                                                                                    </tr>
                                                                                                    <tr>

                                                                                                        <td style="width: 10%; text-align: right" class="formItemBgStyle">
                                                                                                            <asp:Label ID="Label22" runat="server" Text="<%$ Resources:lang,GongZuoZongJie %>"></asp:Label>：
                                                                                                        </td>
                                                                                                        <td align="left" class="formItemBgStyle">

                                                                                                            <CKEditor:CKEditorControl ID="HE_FinishContent" Height="150px" runat="server" Visible="False" Width="" />

                                                                                                            <CKEditor:CKEditorControl runat="server" ID="HT_FinishContent" Width="100%" Height="150px" Visible="False" />
                                                                                                        </td>
                                                                                                    </tr>

                                                                                                    <tr>

                                                                                                        <td style="width: 10%; text-align: right" class="formItemBgStyle"></td>

                                                                                                        <td align="left" class="formItemBgStyle">

                                                                                                            <table>
                                                                                                                <tr>
                                                                                                                    <td>
                                                                                                                        <asp:Button ID="BT_Activity" runat="server" OnClick="BT_Activity_Click" Text="<%$ Resources:lang,BaoCun %>"
                                                                                                                            CssClass="inpu" />

                                                                                                                        &nbsp;<asp:Button ID="BT_Finish" runat="server" OnClick="BT_Finish_Click" Font-Bold="True"
                                                                                                                            Text="<%$ Resources:lang,WanChengTiJiao %>" CssClass="inpu" />

                                                                                                                        &nbsp;<asp:Button ID="BT_TBD" runat="server" OnClick="BT_TBD_Click" Text="<%$ Resources:lang,GuaQi %>" CssClass="inpu" />

                                                                                                                    </td>
                                                                                                                    <td style="padding-left: 20px;">
                                                                                                                        <asp:Button ID="BT_CloseTask" runat="server" Enabled="False" OnClick="BT_CloseTask_Click"
                                                                                                                            CssClass="inpuClose" ToolTip="<%$ Resources:lang,GuanBi%>" />

                                                                                                                        &nbsp;<asp:Button ID="BT_ActiveTask" runat="server" Enabled="False" OnClick="BT_ActiveTask_Click"
                                                                                                                            CssClass="inpuActive" ToolTip="<%$ Resources:lang,JiHuo%>" />
                                                                                                                    </td>
                                                                                                                </tr>
                                                                                                            </table>
                                                                                                        </td>
                                                                                                    </tr>

                                                                                                    <tr>

                                                                                                        <td colspan="2" class="formItemBgStyle">
                                                                                                            <br />
                                                                                                            <asp:CheckBox ID="CB_ReturnMsg" runat="server" Font-Bold="False" Text="<%$ Resources:lang,FaXinXi %>" />

                                                                                                            <asp:CheckBox ID="CB_ReturnMail" runat="server" Font-Bold="False" Text="<%$ Resources:lang,FaYouJian %>" />

                                                                                                            <asp:Label ID="Label29" runat="server" Text="<%$ Resources:lang,TongZhiFenPaiRen %>"></asp:Label>

                                                                                                            <asp:TextBox ID="TB_Message" runat="server" Width="50%"></asp:TextBox>

                                                                                                            <asp:Button ID="BT_Send" runat="server" OnClick="BT_Send_Click" Text="<%$ Resources:lang,FaSong %>"
                                                                                                                CssClass="inpu" />
                                                                                                        </td>
                                                                                                    </tr>
                                                                                                </table>
                                                                                            </td>
                                                                                        </tr>
                                                                                    </table>
                                                                                </ContentTemplate>
                                                                            </cc1:TabPanel>
                                                                            <cc1:TabPanel ID="TabPanel1" runat="server" HeaderText="继续分派">
                                                                                <HeaderTemplate>
                                                                                    <asp:Label ID="Label50" runat="server" Text="<%$ Resources:lang,JiXuFenPai%>"></asp:Label>
                                                                                </HeaderTemplate>
                                                                                <ContentTemplate>

                                                                                    <table width="98%" cellpadding="3" cellspacing="0" class="formBgStyle">

                                                                                        <tr>

                                                                                            <td style="width: 100%; text-align: left;" class="formItemBgStyle">

                                                                                                <strong>
                                                                                                    <asp:Label ID="Label30" runat="server" Text="<%$ Resources:lang,YJXFPRWQXZSLRHSRGZYQ %>"></asp:Label>：<asp:Label ID="LB_ID" runat="server" Visible="False"></asp:Label>
                                                                                                </strong>
                                                                                            </td>
                                                                                        </tr>

                                                                                        <tr>

                                                                                            <td align="left" class="formItemBgStyle">

                                                                                                <table width="800" cellpadding="3" cellspacing="0" class="formBgStyle">

                                                                                                    <tr>

                                                                                                        <td class="formItemBgStyle" style="width: 10%; text-align: right;">
                                                                                                            <asp:Label ID="Label31" runat="server" Text="<%$ Resources:lang,LeiXing %>"></asp:Label>
                                                                                                            ：
                                                                                                        </td>

                                                                                                        <td class="formItemBgStyle" style="width: 20%;">

                                                                                                            <asp:DropDownList ID="DL_RecordType" runat="server" DataTextField="Type" DataValueField="Type">
                                                                                                            </asp:DropDownList>
                                                                                                        </td>

                                                                                                        <td class="formItemBgStyle" style="width: 20%; text-align: right;">
                                                                                                            <asp:Label ID="Label32" runat="server" Text="<%$ Resources:lang,ShouLiRen %>"></asp:Label>：
                                                                                                        </td>

                                                                                                        <td class="formItemBgStyle" style="width: 50%;">

                                                                                                            <asp:DropDownList ID="DL_OperatorCode" DataTextField="UserName" DataValueField="UserCode" runat="server">
                                                                                                            </asp:DropDownList>
                                                                                                        </td>
                                                                                                    </tr>

                                                                                                    <tr>

                                                                                                        <td class="formItemBgStyle" style="width: 10%; text-align: right;">
                                                                                                            <asp:Label ID="Label33" runat="server" Text="<%$ Resources:lang,GongZuoYaoQiu %>"></asp:Label>：
                                                                                                        </td>

                                                                                                        <td class="formItemBgStyle" colspan="3">

                                                                                                            <CKEditor:CKEditorControl ID="HE_Operation" runat="server" Height="150px" Visible="False" Width="" />

                                                                                                            <CKEditor:CKEditorControl runat="server" ID="HT_Operation" Width="" Height="150px" Visible="False" />

                                                                                                            <asp:DropDownList ID="DL_WorkRequest" runat="server" AutoPostBack="True" DataTextField="Operation"
                                                                                                                DataValueField="Operation" OnSelectedIndexChanged="DL_WorkRequest_SelectedIndexChanged">
                                                                                                            </asp:DropDownList>
                                                                                                        </td>
                                                                                                    </tr>

                                                                                                    <tr>

                                                                                                        <td class="formItemBgStyle" style="width: 10%; text-align: right;">
                                                                                                            <asp:Label ID="Label34" runat="server" Text="<%$ Resources:lang,KaiShiShiJian %>"></asp:Label>：
                                                                                                        </td>

                                                                                                        <td class="formItemBgStyle" style="width: 20%">

                                                                                                            <asp:TextBox ID="DLC_BeginDate" runat="server" AutoPostBack="True" OnTextChanged="DLC_BeginDate_TextChanged"></asp:TextBox>

                                                                                                            <ajaxToolkit:CalendarExtender Format="yyyy-MM-dd" ID="CalendarExtender2" runat="server" TargetControlID="DLC_BeginDate" Enabled="True">
                                                                                                            </ajaxToolkit:CalendarExtender>
                                                                                                        </td>

                                                                                                        <td class="formItemBgStyle" style="width: 20%; text-align: right;">
                                                                                                            <asp:Label ID="Label35" runat="server" Text="<%$ Resources:lang,JieShuShiJian %>"></asp:Label>：
                                                                                                        </td>

                                                                                                        <td class="formItemBgStyle" style="width: 50%">

                                                                                                            <asp:TextBox ID="DLC_EndDate" AutoPostBack="True" runat="server" OnTextChanged="DLC_EndDate_TextChanged"></asp:TextBox>

                                                                                                            <ajaxToolkit:CalendarExtender Format="yyyy-MM-dd" ID="CalendarExtender1"
                                                                                                                runat="server" TargetControlID="DLC_EndDate" Enabled="True">
                                                                                                            </ajaxToolkit:CalendarExtender>
                                                                                                        </td>
                                                                                                    </tr>

                                                                                                    <tr>

                                                                                                        <td class="formItemBgStyle" style="width: 10%;"></td>

                                                                                                        <td class="formItemBgStyle" colspan="3">

                                                                                                            <asp:Button ID="BT_UpdateAssign" runat="server" CssClass="inpu" Enabled="False" OnClick="BT_UpdateAssign_Click"
                                                                                                                Text="<%$ Resources:lang,BaoCun %>" />
                                                                                                             &nbsp;
                                                                                                            <asp:Button ID="BT_DeleteAssign" runat="server" CssClass="inpu" Enabled="False" OnClick="BT_DeleteAssign_Click" OnClientClick="return confirm(getDeleteMsgByLangCode())"
                                                                                                                Text="<%$ Resources:lang,ShanChu %>" />
                                                                                                             &nbsp;
                                                                                                            <asp:Button ID="BT_Assign" runat="server" CssClass="inpu" OnClick="BT_Assign_Click"
                                                                                                                Text="<%$ Resources:lang,FenPaiRenWu %>" />
                                                                                                        </td>
                                                                                                    </tr>

                                                                                                    <tr>

                                                                                                        <td class="formItemBgStyle" colspan="4">

                                                                                                            <asp:CheckBox ID="CB_SendMsg" runat="server" Font-Bold="False" Text="<%$ Resources:lang,FaXinXi %>" />

                                                                                                            <asp:CheckBox ID="CB_SendMail" runat="server" Font-Bold="False" Text="<%$ Resources:lang,FaYouJian %>" />

                                                                                                            <asp:Label ID="Label36" runat="server" Text="<%$ Resources:lang,TongZhiShouLiRen %>"></asp:Label>

                                                                                                            <asp:TextBox ID="TB_AssignMessage" runat="server" Width="45%"></asp:TextBox>

                                                                                                            <asp:Button ID="BT_SendAssignMsg" runat="server" CssClass="inpu" OnClick="BT_SendAssignMsg_Click"
                                                                                                                Text="<%$ Resources:lang,FaSong %>" />
                                                                                                        </td>
                                                                                                    </tr>
                                                                                                </table>
                                                                                            </td>
                                                                                        </tr>

                                                                                        <tr>

                                                                                            <td align="left" class="formItemBgStyle">

                                                                                                <strong>
                                                                                                    <asp:Label ID="Label37" runat="server" Text="<%$ Resources:lang,CiRenWuFenPaiJiLuZiJiLu %>"></asp:Label>（<span style="font-size: 9pt"><asp:Label ID="Label38" runat="server" Text="<%$ Resources:lang,XuanZeKeZaiShangMianXiuGai %>"></asp:Label>）：</span></strong>
                                                                                            </td>
                                                                                        </tr>

                                                                                        <tr>

                                                                                            <td align="left" class="formItemBgStyle">

                                                                                                <table background="ImagesSkin/main_n_bj.jpg" border="0" cellpadding="0" cellspacing="0"
                                                                                                    width="100%">

                                                                                                    <tr>

                                                                                                        <td width="7">

                                                                                                            <img height="26" src="ImagesSkin/main_n_l.jpg" width="7" />
                                                                                                        </td>

                                                                                                        <td>

                                                                                                            <table border="0" cellpadding="0" cellspacing="0" width="100%">

                                                                                                                <tr>

                                                                                                                    <td align="center" width="9%">

                                                                                                                        <strong>
                                                                                                                            <asp:Label ID="Label39" runat="server" Text="<%$ Resources:lang,BianHao %>"></asp:Label></strong>
                                                                                                                    </td>

                                                                                                                    <td align="center" width="8%">

                                                                                                                        <strong>
                                                                                                                            <asp:Label ID="Label40" runat="server" Text="<%$ Resources:lang,LeiXing %>"></asp:Label></strong>
                                                                                                                    </td>

                                                                                                                    <td align="center" width="8%">

                                                                                                                        <strong>
                                                                                                                            <asp:Label ID="Label41" runat="server" Text="<%$ Resources:lang,ShouLiRen %>"></asp:Label></strong>
                                                                                                                    </td>

                                                                                                                    <td align="center" width="15%">

                                                                                                                        <strong>
                                                                                                                            <asp:Label ID="Label42" runat="server" Text="<%$ Resources:lang,ShouLiRenDeGongZuo %>"></asp:Label></strong>
                                                                                                                    </td>

                                                                                                                    <td align="center" width="12%">

                                                                                                                        <strong>
                                                                                                                            <asp:Label ID="Label43" runat="server" Text="<%$ Resources:lang,KaiShiShiJian %>"></asp:Label></strong>
                                                                                                                    </td>

                                                                                                                    <td align="center" width="12%">

                                                                                                                        <strong>
                                                                                                                            <asp:Label ID="Label44" runat="server" Text="<%$ Resources:lang,JieShuShiJian %>"></asp:Label></strong>
                                                                                                                    </td>

                                                                                                                    <td align="center" width="9%">

                                                                                                                        <strong>
                                                                                                                            <asp:Label ID="Label45" runat="server" Text="<%$ Resources:lang,FeiYong %>"></asp:Label></strong>
                                                                                                                    </td>

                                                                                                                    <td align="center" width="10%">

                                                                                                                        <strong>
                                                                                                                            <asp:Label ID="Label46" runat="server" Text="<%$ Resources:lang,LuXian %>"></asp:Label></strong>
                                                                                                                    </td>

                                                                                                                    <td align="center" width="9%">

                                                                                                                        <strong>
                                                                                                                            <asp:Label ID="Label47" runat="server" Text="<%$ Resources:lang,ZhuangTai %>"></asp:Label></strong>
                                                                                                                    </td>
                                                                                                                </tr>
                                                                                                            </table>
                                                                                                        </td>

                                                                                                        <td align="right" width="6">

                                                                                                            <img alt="" height="26" src="ImagesSkin/main_n_r.jpg" width="6" />
                                                                                                        </td>
                                                                                                    </tr>
                                                                                                </table>

                                                                                                <asp:DataGrid ID="DataGrid2" runat="server" AutoGenerateColumns="False" CellPadding="4"
                                                                                                    ForeColor="#333333" Height="1px" OnItemCommand="DataGrid2_ItemCommand" ShowHeader="False"
                                                                                                    Width="100%">

                                                                                                    <Columns>
                                                                                                        <asp:TemplateColumn HeaderText="编号">
                                                                                                            <ItemTemplate>
                                                                                                                <asp:Button ID="BT_ID" runat="server" Text='<%# DataBinder.Eval(Container.DataItem,"ID") %>'
                                                                                                                    CssClass="inpu" />
                                                                                                            </ItemTemplate>
                                                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="9%" />
                                                                                                        </asp:TemplateColumn>

                                                                                                        <asp:BoundColumn DataField="Type" HeaderText="类型">

                                                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                                                                        </asp:BoundColumn>

                                                                                                        <asp:BoundColumn DataField="OperatorName" HeaderText="受理人">

                                                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                                                                        </asp:BoundColumn>

                                                                                                        <asp:BoundColumn DataField="Operation" HeaderText="受理人的工作">

                                                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="15%" />
                                                                                                        </asp:BoundColumn>

                                                                                                        <asp:BoundColumn DataField="BeginDate" DataFormatString="{0:yyyy/MM/dd}" HeaderText="开始时间">

                                                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="12%" />
                                                                                                        </asp:BoundColumn>

                                                                                                        <asp:BoundColumn DataField="EndDate" DataFormatString="{0:yyyy/MM/dd}" HeaderText="结束时间">

                                                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="12%" />
                                                                                                        </asp:BoundColumn>

                                                                                                        <asp:BoundColumn DataField="Expense" HeaderText="费用">

                                                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="9%" />
                                                                                                        </asp:BoundColumn>

                                                                                                        <asp:BoundColumn DataField="RouteNumber" HeaderText="路线">

                                                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                                                        </asp:BoundColumn>

                                                                                                        <asp:TemplateColumn HeaderText="状态">
                                                                                                            <ItemTemplate>
                                                                                                                <%# ShareClass. GetStatusHomeNameByOtherStatus(Eval("Status").ToString()) %>
                                                                                                            </ItemTemplate>
                                                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="9%" />
                                                                                                        </asp:TemplateColumn>
                                                                                                    </Columns>

                                                                                                    <EditItemStyle BackColor="#2461BF" />

                                                                                                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />

                                                                                                    <ItemStyle CssClass="itemStyle" />

                                                                                                    <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />

                                                                                                    <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                                                                </asp:DataGrid>
                                                                                            </td>
                                                                                        </tr>
                                                                                    </table>
                                                                                </ContentTemplate>
                                                                            </cc1:TabPanel>
                                                                        </cc1:TabContainer>
                                                                    </td>
                                                                </tr>
                                                            </table>
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
<script type="text/javascript" language="javascript">var cssDirectory = '<%=Session["CssDirectory"] %>'; var oLink = document.getElementById('mainCss'); oLink.href = 'css/' + cssDirectory + '/' + 'bluelightmain.css';</script>
</html>
