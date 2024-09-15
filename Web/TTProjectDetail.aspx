<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTProjectDetail.aspx.cs"
    Inherits="TTProjectDetail" %>

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
            min-width: 1580px;
            width: expression (document.body.clientWidth <= 1580? "1580px" : "auto" ));
        }

        .moduleGreen li {
            float: left; /* 往左浮动 */
            background: url('ImagesSkin/JianTouTuGreen.png');
            height: 44px;
            width: 151px;
            vertical-align: middle;
            list-style: none; /* 将默认的列表符号去掉 */
            padding: 0; /* 将默认的内边距去掉 */
            margin: 0; /* 将默认的外边距去掉 */
        }

         .moduleGrey li {
            float: left; /* 往左浮动 */
            background: url('ImagesSkin/JianTouTuGrey.png');
            height: 44px;
            width: 151px;
            vertical-align: middle;
            list-style: none; /* 将默认的列表符号去掉 */
            padding: 0; /* 将默认的内边距去掉 */
            margin: 0; /* 将默认的外边距去掉 */
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
                                                        <td width="350" align="left">
                                                            <table width="345" border="0" align="left" cellpadding="0" cellspacing="0">
                                                                <tr>
                                                                    <td width="29">
                                                                        <%--<img src="Logo/main_top_l.jpg" alt="" width="29" height="31" />--%>
                                                                    </td>
                                                                    <td align="center" background="ImagesSkin/main_top_bj.jpg" class="titlezi">
                                                                        <asp:Label ID="LB_RunProject" runat="server" Text="<%$ Resources:lang,RunProject%>" />
                                                                    </td>
                                                                    <td width="5">
                                                                        <%-- <img src="ImagesSkin/main_top_r.jpg" width="5" height="31" />--%>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                        <td align="center" style="padding-top: 5px;">
                                                            <asp:HyperLink ID="HL_ProjectDetailView" runat="server" Text="<%$ Resources:lang,XiangMuXinXi%>"></asp:HyperLink>
                                                            &nbsp;&nbsp;&nbsp;&nbsp;
                                                             <asp:HyperLink ID="HL_BusinessForm" runat="server" Text="<%$ Resources:lang,XiangGuanYeWuDan%>"></asp:HyperLink>

                                                        </td>

                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <div style="width: 2000px; overflow: auto;">
                                                    <ul class="moduleGreen">
                                                        <asp:Repeater ID="Repeater1" runat="server">
                                                            <ItemTemplate>
                                                                <li>
                                                                    <div style="padding-top: 10px; text-align: center;">
                                                                        <a href='<%# DataBinder.Eval(Container.DataItem,"ModulePage") %>' target="iframe">
                                                                            <b style="color: white;"><%# DataBinder.Eval(Container.DataItem,"HomeModuleName") %></b>
                                                                        </a>
                                                                    </div>
                                                                </li>
                                                            </ItemTemplate>
                                                        </asp:Repeater>
                                                    </ul>
                                                </div>
                                             
                                                <ul class="moduleGreen">
                                                    <asp:Repeater ID="Repeater2" runat="server">
                                                        <ItemTemplate>
                                                            <li>
                                                                <div style="padding-top: 10px; text-align: center; color: white;">
                                                                    <a href='<%# DataBinder.Eval(Container.DataItem,"ModulePage") %>' target="iframe">
                                                                        <b style="color: white;"><%# DataBinder.Eval(Container.DataItem,"HomeModuleName") %> </b>
                                                                    </a>
                                                                </div>
                                                            </li>
                                                        </ItemTemplate>
                                                    </asp:Repeater>
                                                </ul>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="padding-top: 5px">
                                                <table width="98%">

                                                    <tr id="trProjectView" style="display: none;">
                                                        <td>
                                                            <asp:DataList ID="DataList1" runat="server" Height="1px" CellPadding="0" ForeColor="#333333"
                                                                Width="100%">
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
                                                                                            <strong>
                                                                                                <asp:Label ID="LB_DLProjectID" runat="server" Text="<%$ Resources:lang,ProjectID%>" /></strong>
                                                                                        </td>
                                                                                        <td width="23%" align="center">
                                                                                            <strong>
                                                                                                <asp:Label ID="LB_DLProjectName" runat="server" Text="<%$ Resources:lang,ProjectName%>" /></strong>
                                                                                        </td>
                                                                                        <td width="6%" align="center">
                                                                                            <strong>
                                                                                                <asp:Label ID="LB_DLProjectType" runat="server" Text="<%$ Resources:lang,ProjectType%>" /></strong>
                                                                                        </td>
                                                                                        <td width="6%" align="center">
                                                                                            <strong>
                                                                                                <asp:Label ID="LB_DLProjectCreator" runat="server" Text="<%$ Resources:lang,ProjectCreator%>" /></strong>
                                                                                        </td>
                                                                                        <td width="6%" align="center">
                                                                                            <strong>
                                                                                                <asp:Label ID="LB_CustomerPM" runat="server" Text="<%$ Resources:lang,CustomerPM%>" /></strong>
                                                                                        </td>
                                                                                        <td width="6%" align="center">
                                                                                            <strong>
                                                                                                <asp:Label ID="LB_DLBudget" runat="server" Text="<%$ Resources:lang,Budget%>" /></strong>
                                                                                        </td>
                                                                                        <td width="5%" align="center">
                                                                                            <strong>
                                                                                                <asp:Label ID="LB_DLManHour" runat="server" Text="<%$ Resources:lang,ManHour%>" /></strong>
                                                                                        </td>
                                                                                        <td width="5%" align="center">
                                                                                            <strong>
                                                                                                <asp:Label ID="LB_DLManPower" runat="server" Text="<%$ Resources:lang,ManPower%>" /></strong>
                                                                                        </td>
                                                                                        <td width="6%" align="center">
                                                                                            <strong>
                                                                                                <asp:Label ID="LB_DLStartTime" runat="server" Text="<%$ Resources:lang,StartTime%>" /></strong>
                                                                                        </td>
                                                                                        <td width="6%" align="center">
                                                                                            <strong>
                                                                                                <asp:Label ID="LB_DLEndTime" runat="server" Text="<%$ Resources:lang,EndTime%>" /></strong>
                                                                                        </td>
                                                                                        <td width="6%" align="center">
                                                                                            <strong>
                                                                                                <asp:Label ID="LB_DLCreateTime" runat="server" Text="<%$ Resources:lang,CreateTime%>" /></strong>
                                                                                        </td>
                                                                                    </tr>
                                                                                </table>
                                                                            </td>
                                                                            <td width="6" align="right">
                                                                                <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" />
                                                                            </td>
                                                                        </tr>
                                                                    </table>
                                                                </HeaderTemplate>
                                                                <ItemTemplate>
                                                                    <table cellpadding="5" cellspacing="0" width="100%">
                                                                        <tr>
                                                                            <td style="width: 5%; text-align: center;" class="tdLeft">
                                                                                <%#DataBinder .Eval (Container .DataItem ,"ProjectID") %><br />
                                                                                <%#DataBinder .Eval (Container .DataItem ,"ProjectCode") %>
                                                                            </td>
                                                                            <td style="width: 23%; text-align: left; padding-left: 5px" class="tdLeft">
                                                                                <%#DataBinder .Eval (Container .DataItem,"ProjectName") %>
                                                                            </td>
                                                                            <td style="width: 6%; text-align: center" class="tdLeft">
                                                                                <%#DataBinder .Eval (Container .DataItem,"ProjectType") %>
                                                                            </td>
                                                                            <td style="width: 6%; text-align: center" class="tdLeft">
                                                                                <%#DataBinder .Eval (Container .DataItem,"UserName") %>
                                                                            </td>
                                                                            <td style="width: 6%; text-align: center" class="tdLeft">
                                                                                <%#DataBinder .Eval (Container .DataItem,"CustomerPMName") %>
                                                                            </td>
                                                                            <td style="width: 6%; text-align: center" class="tdLeft">
                                                                                <%#DataBinder .Eval (Container .DataItem,"Budget") %>
                                                                            </td>
                                                                            <td style="width: 5%; text-align: center" class="tdLeft">
                                                                                <%#DataBinder .Eval (Container .DataItem,"ManHour") %>
                                                                            </td>
                                                                            <td style="width: 5%; text-align: center" class="tdLeft">
                                                                                <%#DataBinder .Eval (Container .DataItem,"ManNumber") %>
                                                                            </td>
                                                                            <td style="width: 6%; text-align: center" class="tdLeft">
                                                                                <%#DataBinder .Eval (Container .DataItem, "BeginDate","{0:yyyy/MM/dd}") %>
                                                                            </td>
                                                                            <td style="width: 6%; text-align: center" class="tdLeft">
                                                                                <%#DataBinder.Eval(Container.DataItem, "EndDate", "{0:yyyy/MM/dd}")%>
                                                                            </td>
                                                                            <td style="width: 6%; text-align: center" class="tdRight">
                                                                                <%#DataBinder.Eval(Container.DataItem, "MakeDate", "{0:yyyy/MM/dd}")%>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td style="width: 5%; text-align: center; vertical-align: middle; font-size: 10pt" class="tdLeft">
                                                                                <asp:Label ID="LB_DLDescription" runat="server" Text="<%$ Resources:lang,Description%>" />
                                                                            </td>
                                                                            <td colspan="10" style="text-align: left; padding-left: 5px" class="tdRight">
                                                                                <%#DataBinder .Eval (Container .DataItem,"ProjectDetail") %>
                                                                            </td>
                                                                        </tr>
                                                                        <%--   <tr>
                                                                            <td style="width: 5%; text-align: center; font-size: 10pt" class="tdLeft">
                                                                                <asp:Label ID="LB_DLAcceptanceStandard" runat="server" Text="<%$ Resources:lang,AcceptanceStandard%>" />
                                                                            </td>
                                                                            <td colspan="10" style="text-align: left; padding-left: 5px" class="tdRight">
                                                                                <%#DataBinder .Eval (Container .DataItem,"AcceptStandard") %>
                                                                            </td>
                                                                        </tr>--%>
                                                                    </table>
                                                                </ItemTemplate>
                                                                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />

                                                                <ItemStyle CssClass="itemStyle" />
                                                            </asp:DataList>

                                                        </td>
                                                    </tr>

                                                    <tr>
                                                        <td style="height: 20px; text-align: left">&nbsp;
                                                            <table width="100%">
                                                                <tr>
                                                                    <td width="460px" align="left">
                                                                        <table>
                                                                            <tr>
                                                                                <td>
                                                                                    <asp:Button ID="BT_Receive" runat="server" Text="<%$ Resources:lang,ProjectAgree%>"
                                                                                        CssClass="inpu" OnClick="BT_Receive_Click" /></td>
                                                                                <td>
                                                                                    <asp:Button ID="BT_Refuse" runat="server" Text="<%$ Resources:lang,Refuse%>" OnClick="BT_Refuse_Click"
                                                                                        CssClass="inpu" /></td>
                                                                                <td>
                                                                                    <asp:Button ID="BT_Activity" runat="server" Text="<%$ Resources:lang,Running%>" CssClass="inpu"
                                                                                        OnClick="BT_Activity_Click" /></td>
                                                                                <td>
                                                                                    <asp:DropDownList ID="DL_Status" runat="server" DataTextField="HomeName"
                                                                                        OnSelectedIndexChanged="DL_Status_SelectedIndexChanged" AutoPostBack="true" DataValueField="Status"
                                                                                        CssClass="DDList">
                                                                                    </asp:DropDownList>
                                                                                </td>
                                                                                <td>
                                                                                    <asp:Label ID="LB_StatusValue" runat="server" Text="<%$ Resources:lang,StatusValue%>" />

                                                                                </td>
                                                                                <td>
                                                                                    <asp:DropDownList ID="DL_StatusValue" OnSelectedIndexChanged=" DL_StatusValue_SelectedIndexChanged"
                                                                                        AutoPostBack="true" runat="server" Width="80px">
                                                                                        <asp:ListItem Value="进行中" Text="<%$ Resources:lang,JinXingZhong%>" />
                                                                                        <asp:ListItem Value="通过" Text="<%$ Resources:lang,TongGuo%>" />
                                                                                    </asp:DropDownList>
                                                                                </td>
                                                                            </tr>
                                                                        </table>
                                                                        <br />
                                                                    </td>

                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="height: 20px; text-align: left">
                                                            <asp:CheckBox ID="CB_ReturnMsg" runat="server" Font-Bold="False" Text="<%$ Resources:lang,SendSMS%>" />
                                                            <asp:CheckBox ID="CB_ReturnMail" runat="server" Font-Bold="False" Text="<%$ Resources:lang,SendEMail%>" />
                                                            <asp:Label ID="LB_NoticeProjectCreator" runat="server" Text="<%$ Resources:lang,NoticeProjectCreator%>" />
                                                            <asp:TextBox ID="TB_Message" runat="server" Width="375px"></asp:TextBox><asp:Button
                                                                CssClass="inpu" ID="BT_Send" runat="server" OnClick="BT_Send_Click" Text="<%$ Resources:lang,Send%>" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="text-align: left;">
                                                            <br />
                                                            <table cellpadding="0" cellspacing="0" border="0" width="100%">
                                                                <tr>
                                                                    <td align="left" class="tdFullBorder" style="padding-left: 20px; font-weight: bold; height: 24px; color: #394f66; background-image: url('ImagesSkin/titleBG.jpg')">
                                                                        <asp:Label ID="LB_TodaySummary" runat="server" Text="<%$ Resources:lang,TodaySummary%>" />

                                                                        <asp:Label ID="LB_WorkID" runat="server" Text="-1" Visible="False"></asp:Label>
                                                                        <%--   （<asp:Label ID="LB_CurrentDayTaskTotal" runat="server"></asp:Label>）--%>

                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td style="padding-top: 5px" align="left">
                                                                        <table cellpadding="3" width="100%">
                                                                            <tr>
                                                                                <td align="left">
                                                                                    <table>
                                                                                        <tr>
                                                                                            <td>
                                                                                                <asp:Label ID="LB_Progress" runat="server" Text="<%$ Resources:lang,Progress%>" />:<NickLee:NumberBox
                                                                                                    ID="NB_FinishPercent" runat="server" Width="50px" MaxAmount="100" MinAmount="0"
                                                                                                    Precision="0">0</NickLee:NumberBox>
                                                                                                <asp:Label ID="Label1" runat="server" Font-Bold="True" Text="%"></asp:Label>
                                                                                                &nbsp;<asp:Label ID="LB_ManHour" runat="server" Text="<%$ Resources:lang,ManHour%>" /><NickLee:NumberBox MaxAmount="1000000000000"
                                                                                                    ID="NB_ManHour" runat="server" Width="71px" MinAmount="0">0.00</NickLee:NumberBox>&nbsp;
                                                                                                  <NickLee:NumberBox MaxAmount="1000000000000" MinAmount="-1000000000000" ID="TB_Charge" runat="server" Width="71px" Visible="False">0.00</NickLee:NumberBox>&nbsp;
                                                                                            </td>
                                                                                            <td align="left">
                                                                                                <asp:HyperLink ID="HL_CurrentDailyWorkTask" runat="server" Text="&lt;div&gt;&lt;img src=ImagesSkin/renwu.png border=0 width=20 height=20 alt='DailyTask' /&gt;&lt;/div&gt;"></asp:HyperLink>
                                                                                            </td>
                                                                                            <td>
                                                                                                <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,DiDian%>"></asp:Label>：</td>
                                                                                            <td>
                                                                                                <asp:TextBox ID="TB_WorkAddress" runat="server" Width="250px"></asp:TextBox></td>
                                                                                            <td>

                                                                                                <asp:Repeater ID="Repeater3" runat="server">
                                                                                                    <ItemTemplate>
                                                                                                        <a href='<%# DataBinder.Eval(Container.DataItem,"ModulePage") %>' target="iframe">
                                                                                                            <%# DataBinder.Eval(Container.DataItem,"HomeModuleName") %>  &nbsp;
                                                                                                        </a>
                                                                                                    </ItemTemplate>
                                                                                                </asp:Repeater>



                                                                                                <%--  <asp:HyperLink ID="HL_RelatedDoc" runat="server" NavigateUrl="TTProRelatedDoc.aspx"
                                                                                                    Target="_blank" Text="<%$ Resources:lang,ProjectDocument%>"></asp:HyperLink>
                                                                                                &nbsp;<asp:HyperLink ID="HL_RelatedReq" runat="server" NavigateUrl="TTProRelatedReqSummary.aspx"
                                                                                                    Target="_blank" Text="<%$ Resources:lang,ProjectReq%>"></asp:HyperLink>
                                                                                                &nbsp;<asp:HyperLink ID="HL_RelatedRisk" runat="server" NavigateUrl="TTProRelatedRisk.aspx"
                                                                                                    Target="_blank" Text="<%$ Resources:lang,ProjectRisk%>"></asp:HyperLink>

                                                                                                &nbsp;<asp:HyperLink ID="HL_WLTem" runat="server" Target="_blank" Text="<%$ Resources:lang,WFTemplate%>"></asp:HyperLink>
                                                                                                &nbsp;<asp:HyperLink ID="HL_RelatedWorkFlowTemplate" runat="server" Enabled="false"
                                                                                                    NavigateUrl="TTProRelatedWFTemplate.aspx" Target="_blank" Text="<%$ Resources:lang,RelatedWFTemplate%>"></asp:HyperLink>
                                                                                                </span>&nbsp;<asp:HyperLink ID="HL_ActorGroup" runat="server" NavigateUrl="~/TTProjectRelatedActorGroup.aspx"
                                                                                                    Target="_blank" Text="<%$ Resources:lang,ActorGroup%>"></asp:HyperLink>
                                                                                                &nbsp;<asp:HyperLink ID="HL_RelatedContactInfor" runat="server" Target="_blank" Text="<%$ Resources:lang,ContactList%>"></asp:HyperLink>
                                                                                                &nbsp;<asp:HyperLink ID="HL_DailyWorkReportForCustomer" runat="server" Target="_blank" Text="<%$ Resources:lang,ShiShiRiZhiKeHuYong%>"></asp:HyperLink>--%>
                                                                                            </td>
                                                                                        </tr>
                                                                                    </table>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td align="left">
                                                                                    <table width="80%">
                                                                                        <tr>
                                                                                            <td width="40px">
                                                                                                <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,RiZhi%>"></asp:Label>：</td>
                                                                                            <td>
                                                                                                <CKEditor:CKEditorControl ID="HE_TodaySummary" runat="server" Width="100%" Height="150" Visible="false" />
                                                                                                <CKEditor:CKEditorControl runat="server" ID="HT_TodaySummary" Width="100%" Height="150px" Visible="false" />
                                                                                            </td>
                                                                                            <td>
                                                                                                <asp:DropDownList ID="DL_Authority" runat="server">
                                                                                                    <asp:ListItem Value="NO" Text="<%$ Resources:lang,BuBaoMi%>" />
                                                                                                    <asp:ListItem Value="YES" Text="<%$ Resources:lang,BaoMi%>" />
                                                                                                </asp:DropDownList>
                                                                                            </td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td width="40px">
                                                                                                <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,ChengGuo%>"></asp:Label>：</td>
                                                                                            <td align="left" style="padding-left: 2px;">
                                                                                                <asp:TextBox ID="TB_Achievement" runat="server" Height="40px" TextMode="MultiLine" Width="95%"></asp:TextBox>
                                                                                            </td>
                                                                                            <td>&nbsp;</td>
                                                                                        </tr>
                                                                                    </table>
                                                                                </td>
                                                                            </tr>
                                                                        </table>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr style="height: 15px">
                                <td style="text-align: left; padding-left: 30px">
                                    <asp:Button ID="BT_Summit" runat="server" CssClass="inpu" OnClick="BT_Summit_Click" Text="<%$ Resources:lang,Submit%>" />
                                </td>
                            </tr>
                            <tr style="height: 15px">
                                <td style="height: 13px; text-align: left"></td>
                            </tr>
                            <tr style="height: 15px">
                                <td style="text-align: left; height: 9px; padding-left: 15px;">
                                    <div id="DivProject1" runat="server">
                                        <span>

                                            <asp:Repeater ID="Repeater4" runat="server">
                                                <ItemTemplate>
                                                    <a href='<%# DataBinder.Eval(Container.DataItem,"ModulePage") %>' target="iframe">
                                                        <%# DataBinder.Eval(Container.DataItem,"HomeModuleName") %>  &nbsp;
                                                    </a>
                                                </ItemTemplate>
                                            </asp:Repeater>
                                        </span>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td style="text-align: left; height: 28px; padding-left: 15px;">
                                    <div id="DivProject2" runat="server">
                                        <span>
                                            <asp:Repeater ID="Repeater5" runat="server">
                                                <ItemTemplate>
                                                    <a href='<%# DataBinder.Eval(Container.DataItem,"ModulePage") %>' target="iframe">
                                                        <%# DataBinder.Eval(Container.DataItem,"HomeModuleName") %>  &nbsp;
                                                    </a>
                                                </ItemTemplate>
                                            </asp:Repeater>
                                        </span>
                                    </div>
                                </td>
                            </tr>
                            <tr style="display: none;">
                                <td>
                                    <asp:HyperLink ID="HL_ImpleRoute" runat="server" Target="_blank" Text="<%$ Resources:lang,ShiShiLuXianTuiSong%>"></asp:HyperLink>

                                    <asp:HyperLink ID="HL_ImplePush" runat="server" Target="_blank" Text="<%$ Resources:lang,ShiShiGongJuTuiSong%>"></asp:HyperLink>

                                    <asp:HyperLink ID="HL_ProjectItemBom" runat="server" Target="_blank" Text="<%$ Resources:lang,BOMWBSPlanning%>"></asp:HyperLink>

                                    <asp:Label ID="LB_Status" runat="server" Visible="False"></asp:Label>
                                    <asp:Label ID="LB_CreatorCode" runat="server" Visible="False"></asp:Label>
                                    <asp:Label ID="LB_UserCode" runat="server" Visible="False"></asp:Label>
                                    <asp:Label ID="LB_UserName" runat="server" Visible="False"></asp:Label>
                                    <asp:Label ID="LB_ProjectID" runat="server" T Visible="False"></asp:Label>

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
