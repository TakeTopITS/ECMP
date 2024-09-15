<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTAppCreateOtherTask.aspx.cs" Inherits="TTAppCreateOtherTask" %>

<meta name="viewport" content="width=device-width; initial-scale=1.0; maximum-scale=1.0; minimum-scale=0.1; user-scalable=1" />

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register Assembly="NickLee.Web.UI" Namespace="NickLee.Web.UI" TagPrefix="NickLee" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link id="mainCss" href="css/bluelightmain.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        <style type="text/css" > body {
            /*margin-top: 5px;*/
            /*background-image: url(Images/login_bj.jpg);*/
            background-repeat: repeat-x;
            font: normal 100% Helvetica, Arial, sans-serif;
        }
    </style>
    <style type="text/css">
        #AboveDiv {
            max-width: 1024px;
            width: expression (document.body.clientWidth >= 1024? "1024px" : "auto" ));
            min-width: 277px;
            width: expression (document.body.clientWidth <= 277? "277px" : "auto" ));
        }
    </style>
    <script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="js/allAHandler.js"></script>
    <script type="text/javascript" src="js/layer/layer/layer.js"></script>
    <script type="text/javascript" src="js/popwindow.js"></script>
    <script type="text/javascript" language="javascript">
        $(function () {
             /*  if (top.location != self.location) { } else { CloseWebPage(); }*/

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

                    <table id="AboveTable" cellpadding="0" width="100%" cellspacing="0" class="bian">
                        <tr>
                            <td>
                                <table style="width: 100%;" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td height="31" class="page_topbj">
                                            <table width="96%" border="0" align="center" cellpadding="0" cellspacing="0">
                                                <tr>
                                                    <td align="left">
                                                        <a href="TTAppTask.aspx" target="_parent" onclick="javascript:document.getElementById('IMG_Waiting').style.display = 'block';">

                                                            <table width="245" border="0" align="left" cellpadding="0" cellspacing="0">
                                                                <tr>
                                                                    <td width="29">
                                                                        <img src="ImagesSkin/return.png" alt="" />
                                                                    </td>
                                                                    <td align="center" background="ImagesSkin/main_top_bj.jpg" class="titleziAPP">
                                                                        <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,Back%>" />
                                                                    </td>
                                                                    <td width="5">
                                                                        <%-- <img src="ImagesSkin/main_top_r.jpg" width="5" height="31" />--%>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                            <img id="IMG_Waiting" src="Images/Processing.gif" alt="请稍候，处理中..." style="display: none;" />
                                                        </a>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td valign="top">
                                            <table style="width: 100%;" cellpadding="0" cellspacing="0">
                                                 <tr style="display:none;">
                                                    <td align="right" style="padding: 5px 5px 0px 5px;">
                                                        <asp:Button ID="BT_Create" runat="server" Text="<%$ Resources:lang,New%>" CssClass="inpuYello" OnClick="BT_Create_Click" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="right" style="padding: 5px 5px 0px 5px;">
                                                        <table width="100%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                                            <tr>
                                                                <td width="7">
                                                                    <img height="26" src="ImagesSkin/main_n_l.jpg" width="7" />
                                                                </td>
                                                                <td>
                                                                    <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                                        <tr>
                                                                            <td width="5%" align="center">
                                                                                <strong>
                                                                                    <asp:Label ID="Label19" runat="server" Text="<%$ Resources:lang,BianJi %>" /></strong>
                                                                            </td>
                                                                            <td width="5%" align="center">
                                                                                <strong>
                                                                                    <asp:Label ID="Label63" runat="server" Text="<%$ Resources:lang,ShanChu %>" /></strong>
                                                                            </td>
                                                                            <td width="10%" align="center">
                                                                                <strong>
                                                                                    <asp:Label ID="Label64" runat="server" Text="<%$ Resources:lang,FaQiShengQing%>" /></strong>
                                                                            </td>
                                                                            <td align="center" width="5%">
                                                                                <strong>
                                                                                    <asp:Label ID="Label52" runat="server" Text="<%$ Resources:lang,BianHao%>"></asp:Label></strong>
                                                                            </td>
                                                                            <%--       <td align="center" width="8%">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label51" runat="server" Text="<%$ Resources:lang,LeiXing%>"></asp:Label></strong>
                                                                                </td>--%>
                                                                            <td align="center" width="15%">
                                                                                <strong>
                                                                                    <asp:Label ID="Label50" runat="server" Text="<%$ Resources:lang,RenWu%>"></asp:Label></strong>
                                                                            </td>
                                                                            <%-- <td align="center" width="8%">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label49" runat="server" Text="<%$ Resources:lang,YouXianJi%>"></asp:Label></strong>
                                                                                </td>

                                                                                <td align="center" width="9%">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label47" runat="server" Text="<%$ Resources:lang,KaiShiShiJian%>"></asp:Label></strong>
                                                                                </td>
                                                                                <td align="center" width="9%">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label46" runat="server" Text="<%$ Resources:lang,JieShuShiJian%>"></asp:Label></strong>
                                                                                </td>
                                                                                <td align="center" width="5%">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label45" runat="server" Text="<%$ Resources:lang,YuSuan%>"></asp:Label></strong>
                                                                                </td>
                                                                                <td align="center" width="7%">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label44" runat="server" Text="<%$ Resources:lang,WanChengChengDu%>"></asp:Label></strong>
                                                                                </td>
                                                                                <td align="center" width="5%">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label43" runat="server" Text="<%$ Resources:lang,FeiYong%>"></asp:Label></strong>
                                                                                </td>--%>
                                                                            <td align="center" width="5%">
                                                                                <strong>
                                                                                    <asp:Label ID="Label42" runat="server" Text="<%$ Resources:lang,ZhuangTai%>"></asp:Label></strong>
                                                                            </td>
                                                                        </tr>
                                                                    </table>
                                                                </td>
                                                                <td width="6" align="right">
                                                                    <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" />
                                                                </td>
                                                            </tr>
                                                        </table>
                                                        <asp:DataGrid ID="DataGrid1" runat="server" AllowPaging="True" AutoGenerateColumns="False" PageSize="20"
                                                            ShowHeader="False" OnItemCommand="DataGrid1_ItemCommand" OnPageIndexChanged="DataGrid1_PageIndexChanged"
                                                            Width="100%" Height="1px" CellPadding="4" ForeColor="#333333" GridLines="None">
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
                                                                <asp:ButtonColumn ButtonType="LinkButton" CommandName="Assign" Text="&lt;div&gt;&lt;img src=ImagesSkin/Assign.png border=0 alt='删除' /&gt;&lt;/div&gt;">
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                </asp:ButtonColumn>
                                                                <asp:BoundColumn DataField="TaskID" HeaderText="ID">
                                                                    <ItemStyle CssClass="itemBorder" Width="5%" />
                                                                </asp:BoundColumn>
                                                                <%--   <asp:BoundColumn DataField="Type" HeaderText="类型">
                                                                        <ItemStyle CssClass="itemBorder" Width="8%" />
                                                                    </asp:BoundColumn>--%>
                                                                <asp:BoundColumn DataField="Task" HeaderText="任务">
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="15%" />
                                                                </asp:BoundColumn>
                                                                <%--  <asp:BoundColumn DataField="Priority" HeaderText="优先级">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                                    </asp:BoundColumn>

                                                                    <asp:BoundColumn DataField="BeginDate" DataFormatString="{0:yyyy/MM/dd}" HeaderText="开始时间">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="9%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:BoundColumn DataField="EndDate" DataFormatString="{0:yyyy/MM/dd}" HeaderText="结束时间">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="9%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:BoundColumn DataField="Budget" HeaderText="预算">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:BoundColumn DataField="FinishPercent" HeaderText="完成程度">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="7%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:BoundColumn DataField="Expense" HeaderText="费用">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                    </asp:BoundColumn>--%>
                                                                <asp:TemplateColumn HeaderText="状态">
                                                                    <ItemTemplate>
                                                                        <%# ShareClass. GetStatusHomeNameByOtherStatus(Eval("Status").ToString()) %>
                                                                    </ItemTemplate>
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="5%" />
                                                                </asp:TemplateColumn>
                                                            </Columns>
                                                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                            <EditItemStyle BackColor="#2461BF" />
                                                            <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                            <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />

                                                            <ItemStyle CssClass="itemStyle" />
                                                        </asp:DataGrid>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="left"></td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: left;">
                                            <asp:Label ID="LB_MeetingID" runat="server" Visible="False"></asp:Label>
                                            <asp:Label ID="LB_ProjectID" runat="server" Visible="False"></asp:Label>
                                            <asp:Label ID="LB_UserCode" runat="server" Visible="False"></asp:Label>
                                            <asp:Label ID="LB_UserName" runat="server" Visible="False"></asp:Label>
                                            <asp:Label ID="LB_Sql" runat="server" Visible="False"></asp:Label>
                                            <asp:Label ID="LB_TaskID" runat="server" Visible="False"></asp:Label>
                                            <asp:Label ID="LB_Status" runat="server" Visible="False"></asp:Label>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>

                    <div class="layui-layer layui-layer-iframe" id="popwindow" name="fixedDiv"
                        style="z-index: 9999; width: 98%; height: 500px; position: absolute; overflow: hidden; display: none; border-radius: 10px;">
                        <div class="layui-layer-title" style="background: #e7e7e8;" id="popwindow_title">
                            <asp:Label ID="LB_PopWindowTitle" runat="server" Text="&lt;div&gt;&lt;img src=ImagesSkin/Update.png border=0 width=30px height=30px alt='BusinessForm' /&gt;&lt;/div&gt;"></asp:Label>
                        </div>
                        <div id="popwindow_content" class="layui-layer-content" style="overflow: auto; text-align: left; padding: 0px 5px 0px 5px;">

                            <table cellpadding="3" cellspacing="0" style="width: 100%">

                                <tr>
                                    <td align="left">
                                        <table style="width: 100%;" cellpadding="3" cellspacing="0" class="formBgStyle">
                                            <tr style="display: none;">
                                                <td style="width: 12%; text-align: left;" class="formItemBgStyle">
                                                    <asp:Label ID="Label40" runat="server" Text="<%$ Resources:lang,BianHao%>"></asp:Label>
                                                    <asp:Label ID="LB_TaskNO" runat="server"></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="width: 12%; text-align: left;" class="formItemBgStyle">
                                                    <asp:Label ID="Label39" runat="server" Text="<%$ Resources:lang,LeiXing%>"></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="width: 99%; text-align: left" class="formItemBgStyle">
                                                    <asp:DropDownList ID="DL_Type" runat="server" DataTextField="Type" DataValueField="Type" Width="99%">
                                                    </asp:DropDownList>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="width: 12%; text-align: left;" class="formItemBgStyle">
                                                    <asp:Label ID="Label38" runat="server" Text="<%$ Resources:lang,YouXianJi%>"></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="width: 20%; text-align: left" class="formItemBgStyle">
                                                    <asp:DropDownList ID="DL_Priority" runat="server" DataTextField="Priority" DataValueField="Priority" Width="99%">
                                                        <asp:ListItem>Normal</asp:ListItem>
                                                        <asp:ListItem>High</asp:ListItem>
                                                        <asp:ListItem>Low</asp:ListItem>
                                                    </asp:DropDownList>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="width: 12%; text-align: left;" class="formItemBgStyle">
                                                    <asp:Label ID="Label37" runat="server" Text="<%$ Resources:lang,YuSuan%>"></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="text-align: left" class="formItemBgStyle">
                                                    <NickLee:NumberBox MaxAmount="1000000000000" MinAmount="-1000000000000" ID="TB_Budget" runat="server" Width="99%" OnBlur="" OnFocus=""
                                                        OnKeyPress="" PositiveColor="">0.00</NickLee:NumberBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="text-align: left;" class="formItemBgStyle">
                                                    <asp:Label ID="Label35" runat="server" Text="<%$ Resources:lang,RenWu%>"></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="text-align: left" class="formItemBgStyle">
                                                    <asp:TextBox ID="TB_Task" runat="server" Height="45px" TextMode="MultiLine" Width="99%"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="text-align: left;" class="formItemBgStyle">
                                                    <asp:Label ID="Label36" runat="server" Text="<%$ Resources:lang,ShiJiFeiYong%>"></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="text-align: left" class="formItemBgStyle">
                                                    <NickLee:NumberBox MaxAmount="1000000000000" MinAmount="-1000000000000" ID="TB_Expense" runat="server" Enabled="False" Width="99%" OnBlur=""
                                                        OnFocus="" OnKeyPress="" PositiveColor="">0.00</NickLee:NumberBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="text-align: left;" class="formItemBgStyle">
                                                    <asp:Label ID="Label34" runat="server" Text="<%$ Resources:lang,GongShi2%>"></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="text-align: left" class="formItemBgStyle">
                                                    <NickLee:NumberBox MaxAmount="1000000000000" MinAmount="-1000000000000" ID="NB_ManHour" runat="server" Width="99%" OnBlur="" OnFocus=""
                                                        OnKeyPress="" PositiveColor="">0.00</NickLee:NumberBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="text-align: left;" class="formItemBgStyle">
                                                    <asp:Label ID="Label33" runat="server" Text="<%$ Resources:lang,KaiShiShiJian%>"></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="text-align: left" class="formItemBgStyle">
                                                    <asp:TextBox ID="DLC_BeginDate" runat="server" Width="99%"></asp:TextBox>
                                                    <ajaxToolkit:CalendarExtender Format="yyyy-MM-dd" ID="CalendarExtender2" runat="server" TargetControlID="DLC_BeginDate" Enabled="True">
                                                    </ajaxToolkit:CalendarExtender>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="text-align: left;" class="formItemBgStyle">
                                                    <asp:Label ID="Label32" runat="server" Text="<%$ Resources:lang,JieShuShiJian%>"></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="text-align: left;" class="formItemBgStyle">
                                                    <asp:TextBox ID="DLC_EndDate" runat="server" Width="99%"></asp:TextBox>
                                                    <ajaxToolkit:CalendarExtender Format="yyyy-MM-dd" ID="CalendarExtender1"
                                                        runat="server" TargetControlID="DLC_EndDate" Enabled="True">
                                                    </ajaxToolkit:CalendarExtender>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="text-align: left;" class="formItemBgStyle">
                                                    <asp:Label ID="Label31" runat="server" Text="<%$ Resources:lang,ShiJiGongShi%>"></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="text-align: left" class="formItemBgStyle">
                                                    <NickLee:NumberBox MaxAmount="1000000000000" MinAmount="-1000000000000" ID="NB_RealManHour" runat="server" Enabled="False" Width="99%"
                                                        OnBlur="" OnFocus="" OnKeyPress="" PositiveColor="">0.00</NickLee:NumberBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="text-align: left;" class="formItemBgStyle">
                                                    <asp:Label ID="Label30" runat="server" Text="<%$ Resources:lang,ZhuangTai%>"></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="text-align: left; width: 150px;" class="formItemBgStyle">
                                                    <asp:DropDownList ID="DL_Status" runat="server" DataTextField="HomeName" DataValueField="Status"
                                                        Width="99%">
                                                    </asp:DropDownList>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="text-align: left;" class="formItemBgStyle">
                                                    <asp:Label ID="Label28" runat="server" Text="<%$ Resources:lang,JianLiShiJian%>"></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="text-align: left;" class="formItemBgStyle">
                                                    <asp:Label ID="LB_MakeDate" runat="server"></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="text-align: left;" class="formItemBgStyle">
                                                    <asp:Label ID="Label29" runat="server" Text="<%$ Resources:lang,WanChengChengDu%>"></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="text-align: left;" class="formItemBgStyle">
                                                    <NickLee:NumberBox MaxAmount="1000000000000" MinAmount="-1000000000000" ID="TB_FinishPercent" Enabled="false" runat="server" Width="95%" OnBlur="" OnFocus=""
                                                        OnKeyPress="" PositiveColor="">0.00</NickLee:NumberBox>
                                                    %
                                                </td>
                                            </tr>
                                            <tr>

                                                <td style="text-align: left" class="formItemBgStyle">&nbsp;
                                                    <asp:Button ID="BT_Close" runat="server" CssClass="inpuClose" ToolTip="<%$ Resources:lang,GuanBi%>" Enabled="False" Visible="false"
                                                        OnClick="BT_Close_Click" />
                                                    &nbsp;
                                                    <asp:Button ID="BT_Active" runat="server" CssClass="inpuActive" ToolTip="<%$ Resources:lang,JiHuo%>" Enabled="False" OnClick="BT_Active_Click" Visible="false" />
                                                </td>
                                            </tr>

                                            <tr>

                                                <td style="text-align: left; height: 4px; display: none;" class="formItemBgStyle">
                                                    <asp:HyperLink ID="HL_RunTaskByWF" runat="server" Enabled="False" Target="_blank" Visible="false">---&gt;<asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,RenWuChuLiLiuChengMoShi%>"></asp:Label></asp:HyperLink>
                                                    &nbsp;&nbsp;
                                                    <asp:HyperLink ID="HL_TaskReview" runat="server" Enabled="False" Target="_blank">---&gt;<asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,RenWuPingShen%>"></asp:Label></asp:HyperLink>
                                                    &nbsp;&nbsp;<asp:HyperLink ID="HL_RelatedWorkFlowTemplate" runat="server" Enabled="False"
                                                        NavigateUrl="TTProRelatedWFTemplate.aspx" Target="_blank" Visible="false">
                                                        <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,GuanLianGongZuoLiuMuBan%>"></asp:Label>
                                                    </asp:HyperLink>
                                                    &nbsp; &nbsp;
                                                    <asp:HyperLink ID="HL_ActorGroup" runat="server" Enabled="False"
                                                        NavigateUrl="~/TTProjectRelatedActorGroup.aspx" Target="_blank">
                                                        <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,JueSeZuSheZhi%>"></asp:Label>
                                                    </asp:HyperLink>
                                                    &nbsp; &nbsp;<asp:HyperLink ID="HL_WLTem" runat="server" Enabled="False" NavigateUrl="~/TTWorkFlowTemplate.aspx"
                                                        Target="_blank" Visible="false">
                                                        <asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,MuBanWeiHu%>"></asp:Label>
                                                    </asp:HyperLink>
                                                    &nbsp;&nbsp;<asp:HyperLink ID="HL_TaskRelatedDoc" runat="server" Enabled="False"
                                                        NavigateUrl="TTProTaskRelatedDoc.aspx" Target="_blank">
                                                        <asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,XiangGuanWenDang%>"></asp:Label>
                                                    </asp:HyperLink>
                                                    &nbsp;&nbsp;<asp:HyperLink ID="HL_TestCase" runat="server" Enabled="False" NavigateUrl="TTMakeTaskTestCase.aspx"
                                                        Target="_blank">
                                                        <asp:Label ID="Label8" runat="server" Text="<%$ Resources:lang,CeShiYongLi%>"></asp:Label>
                                                    </asp:HyperLink>
                                                    &nbsp;&nbsp;<asp:HyperLink ID="HL_AssignRecord" runat="server" Enabled="False" NavigateUrl="TTTaskAssignRecord.aspx"
                                                        Target="_blank">
                                                        <asp:Label ID="Label9" runat="server" Text="<%$ Resources:lang,FenPaiJiLu%>"></asp:Label>
                                                    </asp:HyperLink>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            </table>

                            <asp:Panel ID="Panel_RelatedBusiness" runat="server" Visible="false">
                                <table style="width: 100%;" cellpadding="2" cellspacing="0" class="formBgStyle">
                                    <tr>
                                        <td align="center">
                                            <asp:Label ID="Label10" runat="server" Text="<%$ Resources:lang,XiangGuanYeWuDan %>"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: left;" class="formItemBgStyle">
                                            <asp:Label ID="Label3333" runat="server" Text="<%$ Resources:lang,LeiXing %>"></asp:Label>: </td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: left" class="formItemBgStyle">
                                            <asp:DropDownList ID="DL_WLType" runat="server" DataTextField="HomeName" DataValueField="Type"
                                                AutoPostBack="true" OnSelectedIndexChanged="DL_WLType_SelectedIndexChanged" Width="99%">
                                            </asp:DropDownList>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: left;" class="formItemBgStyle">
                                            <asp:Label ID="Label7333" runat="server" Text="<%$ Resources:lang,LiuChengMuBan%>"></asp:Label>：
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: left;" class="formItemBgStyle">
                                            <asp:DropDownList ID="DL_WFTemplate" runat="server" DataTextField="TemName" DataValueField="TemName" Width="99%">
                                            </asp:DropDownList>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="width: 20%; text-align: left;" class="formItemBgStyle">
                                            <asp:Label ID="Label18" runat="server" Text="<%$ Resources:lang,YunXuHouXuXiuGe%>"></asp:Label>：
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: left;" class="formItemBgStyle">
                                            <asp:DropDownList ID="DL_AllowUpdate" runat="server" AutoPostBack="true" OnSelectedIndexChanged="DL_AllowUpdate_SelectedIndexChanged" Width="99%">
                                                <asp:ListItem Value="YES" Text="YES"></asp:ListItem>
                                                <asp:ListItem Value="NO" Text="NO"></asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                    </tr>

                                    <tr>
                                        <td style="text-align: left; padding-bottom: 5px; padding-top: 30px;" class="formItemBgStyle">
                                            <asp:Button ID="BT_StartupBusinessForm" runat="server" CssClass="inpu" Text="<%$ Resources:lang,DaKai %>" OnClick="BT_StartupBusinessForm_Click" />
                                        </td>
                                    </tr>

                                    <tr>
                                        <td style="text-align: center; padding-bottom: 5px; padding-top: 40px;" class="formItemBgStyle"></td>
                                    </tr>

                                </table>
                            </asp:Panel>
                        </div>

                        <div id="popwindow_footer" class="layui-layer-btn" style="border-top: 1px solid #ccc;">
                            <asp:LinkButton ID="LinkButton1" runat="server" class="layui-layer-btn notTab" OnClick="BT_New_Click" Text="<%$ Resources:lang,BaoCun%>"></asp:LinkButton><a class="layui-layer-btn notTab" onclick="return popClose();"><asp:Label ID="Label54" runat="server" Text="<%$ Resources:lang,GuanBi%>" /></a>
                        </div>
                        <span class="layui-layer-setwin"><a onclick="return popClose();" class="layui-layer-ico layui-layer-close layui-layer-close1 notTab" href="javascript:;"></a></span>
                    </div>

                    <div class="layui-layer layui-layer-iframe" id="popAssignWindow" name="fixedDivNoConfirm"
                        style="z-index: 9999; width: 98%; height: 500px; position: absolute; overflow: hidden; display: none; border-radius: 10px;">
                        <div class="layui-layer-title" style="background: #e7e7e8;" id="popwindow_title1">
                            <asp:Label ID="Label41" runat="server" Text="&lt;div&gt;&lt;img src=ImagesSkin/Update.png border=0 width=30px height=30px alt='BusinessForm' /&gt;&lt;/div&gt;"></asp:Label>
                        </div>
                        <div id="popwindow_content1" class="layui-layer-content" style="overflow: auto; text-align: left; padding: 0px 5px 0px 5px;">

                            <table cellpadding="3" cellspacing="0" style="width: 100%" class="formBgStyle">

                                <tr>
                                    <td style="width: 80px; text-align: left;" class="formItemBgStyle">
                                        <asp:Label ID="Label11" runat="server" Text="<%$ Resources:lang,LeiXing%>"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="formItemBgStyle" style="text-align: left;">
                                        <asp:DropDownList ID="DL_RecordType" runat="server" DataTextField="Type" DataValueField="Type" Width="99%">
                                        </asp:DropDownList>
                                        <asp:Label ID="LB_ID" runat="server"></asp:Label>
                                    </td>
                                    <tr>
                                        <td style="text-align: left;" class="formItemBgStyle">
                                            <asp:Label ID="Label12" runat="server" Text="<%$ Resources:lang,ShouLiRen%>"></asp:Label>
                                        </td>
                                    </tr>
                                <tr>
                                    <td class="formItemBgStyle" style="text-align: left;">
                                        <asp:DropDownList ID="DL_OperatorCode" runat="server" DataTextField="UserName" DataValueField="UserCode" Width="99%">
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="text-align: left;" class="formItemBgStyle">
                                        <asp:Label ID="Label13" runat="server" Text="<%$ Resources:lang,GongZuoYaoQiu%>"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="left" class="formItemBgStyle">
                                        <CKEditor:CKEditorControl ID="HE_Operation" runat="server" Width="99%" Height="150px" Visible="False" />
                                        <CKEditor:CKEditorControl runat="server" ID="HT_Operation" Width="99%" Height="150px" Visible="False" />
                                        <asp:DropDownList ID="DL_WorkRequest" runat="server" AutoPostBack="True" DataTextField="Operation"
                                            DataValueField="Operation" OnSelectedIndexChanged="DL_WorkRequest_SelectedIndexChanged" Width="99%">
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="text-align: left;" class="formItemBgStyle">
                                        <asp:Label ID="Label14" runat="server" Text="<%$ Resources:lang,KaiShiShiJian%>"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="text-align: left" class="formItemBgStyle">
                                        <asp:TextBox ID="DLC_TaskBegin" runat="server" Width="99%"></asp:TextBox>
                                        <ajaxToolkit:CalendarExtender Format="yyyy-MM-dd" ID="CalendarExtender3" runat="server" TargetControlID="DLC_TaskBegin" Enabled="True">
                                        </ajaxToolkit:CalendarExtender>
                                    </td>
                                    <tr>
                                        <td style="text-align: left;" class="formItemBgStyle">
                                            <asp:Label ID="Label15" runat="server" Text="<%$ Resources:lang,JieShuShiJian%>"></asp:Label>
                                        </td>
                                    </tr>
                                <tr>
                                    <td style="text-align: left;" class="formItemBgStyle">
                                        <asp:TextBox ID="DLC_TaskEnd" runat="server" Width="99%"></asp:TextBox>
                                        <ajaxToolkit:CalendarExtender Format="yyyy-MM-dd" ID="CalendarExtender4" runat="server" TargetControlID="DLC_TaskEnd" Enabled="True">
                                        </ajaxToolkit:CalendarExtender>
                                    </td>
                                </tr>

                                <tr>
                                    <td style="text-align: left;" class="formItemBgStyle">
                                        <asp:Button ID="BT_Assign" runat="server" CssClass="inpu" Enabled="False" OnClick="BT_Assign_Click"
                                            Text="<%$ Resources:lang,FenPai%>" />
                                        &nbsp;
                                        <asp:Button ID="BT_UpdateAssign" runat="server" CssClass="inpu" Enabled="False" OnClick="BT_UpdateAssign_Click"
                                            Text="<%$ Resources:lang,BaoCun%>" />
                                        &nbsp;<asp:Button ID="BT_DeleteAssign" runat="server" CssClass="inpu" Enabled="False"
                                            OnClick="BT_DeleteAssign_Click" OnClientClick="return confirm(getDeleteMsgByLangCode())" Text="<%$ Resources:lang,ShanChu%>" />
                                    </td>
                                </tr>

                                <tr>
                                    <td class="formItemBgStyle" style="height: 21px; text-align: left">
                                        <asp:CheckBox ID="CB_SendMsg" runat="server" Font-Bold="False" Font-Size="10pt" Text="<%$ Resources:lang,FaXinXi%>" />
                                        <asp:CheckBox ID="CB_SendMail" runat="server" Font-Bold="False" Font-Size="10pt"
                                            Text="<%$ Resources:lang,FaYouJian%>" />
                                        <span style="font-size: 10pt">
                                            <asp:Label ID="Label16" runat="server" Text="<%$ Resources:lang,TongZhiShouLiRen%>"></asp:Label></span>
                                        <asp:TextBox ID="TB_Message" runat="server" Width="60%"></asp:TextBox>
                                        <asp:Button ID="BT_Send" runat="server" CssClass="inpu" OnClick="BT_Send_Click" Text="<%$ Resources:lang,FaSong%>" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="formItemBgStyle" style="text-align: left; height: 9px;">
                                        <span><strong>
                                            <asp:Label ID="LB_TaskName" runat="server" Visible="False"></asp:Label>
                                        </strong></span>
                                    </td>
                                </tr>
                            </table>
                            <br />
                            <table width="100%" cellpadding="0" cellspacing="0">
                                <tr>
                                    <td style="text-align: left">
                                        <table width="100%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                            <tr>
                                                <td width="7">
                                                    <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" />
                                                </td>
                                                <td>
                                                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                        <tr>
                                                            <td width="9%" align="center">
                                                                <strong>
                                                                    <asp:Label ID="Label17" runat="server" Text="<%$ Resources:lang,BianHao%>"></asp:Label></strong>
                                                            </td>

                                                            <td width="20%" align="center">
                                                                <strong>
                                                                    <asp:Label ID="Label21" runat="server" Text="<%$ Resources:lang,ShouLiRen%>"></asp:Label></strong>
                                                            </td>
                                                            <td align="center">
                                                                <strong>
                                                                    <asp:Label ID="Label22" runat="server" Text="<%$ Resources:lang,ShouLiRenDeGongZuo%>"></asp:Label></strong>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                                <td width="6" align="right">
                                                    <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" />
                                                </td>
                                            </tr>
                                        </table>
                                        <asp:DataGrid ID="DataGrid2" runat="server" AutoGenerateColumns="False" CellPadding="4"
                                            ShowHeader="False" ForeColor="#333333" GridLines="None" Height="1px" OnItemCommand="DataGrid2_ItemCommand"
                                            Width="100%">
                                            <Columns>
                                                <asp:TemplateColumn HeaderText="编号">
                                                    <ItemTemplate>
                                                        <asp:Button ID="BT_ID" runat="server" Text='<%# DataBinder.Eval(Container.DataItem,"ID") %>'
                                                            CssClass="inpu" />
                                                    </ItemTemplate>
                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="9%" />
                                                </asp:TemplateColumn>

                                                <asp:BoundColumn DataField="OperatorName" HeaderText="受理人">
                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="20%" />
                                                </asp:BoundColumn>
                                                <asp:BoundColumn DataField="Operation" HeaderText="受理人的工作">
                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" />
                                                </asp:BoundColumn>
                                            </Columns>
                                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                            <EditItemStyle BackColor="#2461BF" />
                                            <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                            <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />

                                            <ItemStyle CssClass="itemStyle" />
                                        </asp:DataGrid>
                                    </td>
                                </tr>
                            </table>
                        </div>

                        <div id="popwindow_footer1" class="layui-layer-btn" style="border-top: 1px solid #ccc;">
                            <a class="layui-layer-btn notTab" onclick="return popClose();">
                                <asp:Label ID="Label48" runat="server" Text="<%$ Resources:lang,GuanBi%>" /></a>
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
