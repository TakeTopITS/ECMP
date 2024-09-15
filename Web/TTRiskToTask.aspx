<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTRiskToTask.aspx.cs" Inherits="TTRiskToTask" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register Assembly="NickLee.Web.UI" Namespace="NickLee.Web.UI" TagPrefix="NickLee" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link id="mainCss" href="css/bluelightmain.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        #AboveDiv {
            min-width: 980px;
            width: expression (document.body.clientWidth <= 980? "980px" : "auto" ));
        }
    </style>

    <script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="js/allAHandler.js"></script>
    <script type="text/javascript" src="js/layer/layer/layer.js"></script>
    <script type="text/javascript" src="js/popwindow.js"></script>
    <script type="text/javascript" language="javascript">
        $(function () {
            if (top.location != self.location) { } else { CloseWebPage(); }
        });

        //设置IFRMAE的高度
        function setBusinessFormIFrameHeight() {

            var winHeight = 0;

            winHeight = document.getElementById("popwindow").style.height;

            document.getElementById("TabContainer1_TabPanel2_IFrame_RelatedInformation").height = (winHeight.toString().replace("px", "") - 160);
        }
        window.onmousemove = setBusinessFormIFrameHeight;

    </script>
</head>
<body>

    <center>
        <form id="form1" runat="server">
            <%--  <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="True" EnableScriptLocalization="True">--%>
            <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="True" EnableScriptLocalization="True">
            </asp:ScriptManager>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <contenttemplate>
                    <div id="AboveDiv">
                        <table id="AboveTable" cellpadding="0" width="100%" cellspacing="0" class="bian">
                            <tr>
                                <td>

                                    <table style="width: 100%;">
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
                                                                        <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,XiangMuFengXianZhuanRenWu%>"></asp:Label>
                                                                    </td>
                                                                    <td width="5">
                                                                        <%-- <img src="ImagesSkin/main_top_r.jpg" width="5" height="31" />--%>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                            <asp:Label ID="LB_UserCode" runat="server" Visible="False"></asp:Label>
                                                            <asp:Label ID="LB_UserName" runat="server" Visible="False"></asp:Label>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <table style="width: 100%">

                                                    <tr>
                                                        <td align="right" style="padding-right: 5px;">
                                                            <asp:Button ID="BT_Create" runat="server" Text="<%$ Resources:lang,New%>" CssClass="inpuYello" OnClick="BT_Create_Click" />
                                                        </td>
                                                    </tr>

                                                    <tr>
                                                        <td style="text-align: left;">

                                                            <table cellpadding="3" cellspacing="0" style="width: 100%">

                                                                <tr>
                                                                    <td style="height: 11px; text-align: left">
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
                                                                                                    <asp:Label ID="Label21" runat="server" Text="<%$ Resources:lang,BianJi %>" />
                                                                                                </strong>
                                                                                            </td>
                                                                                            <td width="5%" align="center">
                                                                                                <strong>
                                                                                                    <asp:Label ID="Label34" runat="server" Text="<%$ Resources:lang,ShanChu %>" />
                                                                                                </strong>
                                                                                            </td>
                                                                                            <td width="10%" align="center">
                                                                                                <strong>
                                                                                                    <asp:Label ID="Label64" runat="server" Text="<%$ Resources:lang,FenPai%>" />
                                                                                                </strong>
                                                                                            </td>
                                                                                            <td align="center" width="5%">
                                                                                                <strong>
                                                                                                    <asp:Label ID="Label12" runat="server" Text="<%$ Resources:lang,BianHao%>"></asp:Label>
                                                                                                </strong>
                                                                                            </td>
                                                                                            <td align="center" width="8%">
                                                                                                <strong>
                                                                                                    <asp:Label ID="Label13" runat="server" Text="<%$ Resources:lang,LeiXing%>"></asp:Label>
                                                                                                </strong>
                                                                                            </td>
                                                                                            <td align="center" width="20%">
                                                                                                <strong>
                                                                                                    <asp:Label ID="Label10" runat="server" Text="<%$ Resources:lang,RenWu%>"></asp:Label>
                                                                                                </strong>
                                                                                            </td>
                                                                                            <td align="center" width="8%">
                                                                                                <strong>
                                                                                                    <asp:Label ID="Label15" runat="server" Text="<%$ Resources:lang,YouXianJi%>"></asp:Label>
                                                                                                </strong>
                                                                                            </td>
                                                                                            <td align="center" width="8%">
                                                                                                <strong>
                                                                                                    <asp:Label ID="Label16" runat="server" Text="<%$ Resources:lang,KaiShiShiJian%>"></asp:Label>
                                                                                                </strong>
                                                                                            </td>
                                                                                            <td align="center" width="8%">
                                                                                                <strong>
                                                                                                    <asp:Label ID="Label17" runat="server" Text="<%$ Resources:lang,JieShuShiJian%>"></asp:Label>
                                                                                                </strong>
                                                                                            </td>
                                                                                            <td align="center" width="5%">
                                                                                                <strong>
                                                                                                    <asp:Label ID="Label18" runat="server" Text="<%$ Resources:lang,YuSuan%>"></asp:Label>
                                                                                                </strong>
                                                                                            </td>
                                                                                            <td align="center" width="7%">
                                                                                                <strong>
                                                                                                    <asp:Label ID="Label19" runat="server" Text="<%$ Resources:lang,WanChengChengDu%>"></asp:Label>
                                                                                                </strong>
                                                                                            </td>
                                                                                            <td align="center" width="7%">
                                                                                                <strong>
                                                                                                    <asp:Label ID="Label11" runat="server" Text="<%$ Resources:lang,FeiYong%>"></asp:Label>
                                                                                                </strong>
                                                                                            </td>
                                                                                            <td align="center" width="5%">
                                                                                                <strong>
                                                                                                    <asp:Label ID="Label20" runat="server" Text="<%$ Resources:lang,ZhuangTai%>"></asp:Label>
                                                                                                </strong>
                                                                                            </td>
                                                                                            <td align="center">
                                                                                                <strong></strong>
                                                                                            </td>
                                                                                            <td align="center">
                                                                                                <strong>&nbsp;
                                                                                                </strong>
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
                                                                            <columns>
                                                                                <asp:ButtonColumn ButtonType="LinkButton" CommandName="Update" Text="&lt;div&gt;&lt;img src=ImagesSkin/Update.png border=0 alt='修改' /&gt;&lt;/div&gt;">
                                                                                    <itemstyle cssclass="itemBorder" horizontalalign="Center" width="5%" />
                                                                                </asp:ButtonColumn>
                                                                                <asp:TemplateColumn HeaderText="Delete">
                                                                                    <itemtemplate>
                                                                                        <asp:LinkButton ID="LBT_Delete" CommandName="Delete" runat="server" OnClientClick="return confirm(getDeleteMsgByLangCode())" Text="&lt;div&gt;&lt;img src=ImagesSkin/Delete.png border=0 alt='删除' /&gt;&lt;/div&gt;"></asp:LinkButton>
                                                                                    </itemtemplate>
                                                                                    <itemstyle cssclass="itemBorder" horizontalalign="Center" width="5%" />
                                                                                </asp:TemplateColumn>
                                                                                <asp:ButtonColumn ButtonType="LinkButton" CommandName="Assign" Text="&lt;div&gt;&lt;img src=ImagesSkin/Assign.png border=0 alt='删除' /&gt;&lt;/div&gt;">
                                                                                    <itemstyle cssclass="itemBorder" horizontalalign="Center" width="10%" />
                                                                                </asp:ButtonColumn>
                                                                                <asp:BoundColumn DataField="TaskID" HeaderText="ID">
                                                                                    <itemstyle cssclass="itemBorder" width="5%" />
                                                                                </asp:BoundColumn>
                                                                                <asp:BoundColumn DataField="Type" HeaderText="类型">
                                                                                    <itemstyle cssclass="itemBorder" width="8%" />
                                                                                </asp:BoundColumn>
                                                                                <asp:HyperLinkColumn DataNavigateUrlField="TaskID" DataTextField="Task" DataNavigateUrlFormatString="TTTaskAssignRecord.aspx?TaskID={0}"
                                                                                    HeaderText="分派记录" Target="_blank">
                                                                                    <itemstyle cssclass="itemBorder" horizontalalign="Left" width="20%" />
                                                                                </asp:HyperLinkColumn>
                                                                                <asp:BoundColumn DataField="Priority" HeaderText="优先级">
                                                                                    <itemstyle cssclass="itemBorder" horizontalalign="Center" width="8%" />
                                                                                </asp:BoundColumn>
                                                                                <asp:BoundColumn DataField="BeginDate" DataFormatString="{0:yyyy/MM/dd}" HeaderText="开始时间">
                                                                                    <itemstyle cssclass="itemBorder" horizontalalign="Center" width="8%" />
                                                                                </asp:BoundColumn>
                                                                                <asp:BoundColumn DataField="EndDate" DataFormatString="{0:yyyy/MM/dd}" HeaderText="结束时间">
                                                                                    <itemstyle cssclass="itemBorder" horizontalalign="Center" width="8%" />
                                                                                </asp:BoundColumn>
                                                                                <asp:BoundColumn DataField="Budget" HeaderText="预算">
                                                                                    <itemstyle cssclass="itemBorder" horizontalalign="Center" width="5%" />
                                                                                </asp:BoundColumn>
                                                                                <asp:BoundColumn DataField="FinishPercent" HeaderText="完成程度">
                                                                                    <itemstyle cssclass="itemBorder" horizontalalign="Center" width="7%" />
                                                                                </asp:BoundColumn>
                                                                                <asp:TemplateColumn>
                                                                                    <itemtemplate>

                                                                                        <a href='TTProExpenseView.aspx?TaskID=<%#DataBinder .Eval (Container .DataItem ,"TaskID") %>'><%#DataBinder .Eval (Container .DataItem ,"Expense") %>  </a>

                                                                                    </itemtemplate>

                                                                                    <itemstyle cssclass="itemBorder" horizontalalign="Center" width="7%" />
                                                                                </asp:TemplateColumn>
                                                                                <asp:TemplateColumn HeaderText="状态">
                                                                                    <itemtemplate>
                                                                                        <%# ShareClass. GetStatusHomeNameByOtherStatus(Eval("Status").ToString()) %>
                                                                                    </itemtemplate>
                                                                                    <itemstyle cssclass="itemBorder" horizontalalign="Left" width="5%" />
                                                                                </asp:TemplateColumn>
                                                                                <asp:HyperLinkColumn DataNavigateUrlField="TaskID" DataNavigateUrlFormatString="TTMakeTaskTestCase.aspx?TaskID={0}"
                                                                                    Text="&lt;div&gt;&lt;img src=ImagesSkin/TestCase.jpg border=0 alt='用例' /&gt;&lt;/div&gt;" HeaderText="测试用例" Target="_blank">
                                                                                    <itemstyle cssclass="itemBorder" horizontalalign="Center" />
                                                                                </asp:HyperLinkColumn>
                                                                                <asp:TemplateColumn>
                                                                                    <itemtemplate>

                                                                                        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# DataBinder.Eval(Container, "DataItem.TaskID", "TTProTaskRelatedDoc.aspx?TaskID={0}") %>'
                                                                                            Target="_blank">
                                                                                            <img src="ImagesSkin/Doc.gif" class="noBorder" /></asp:HyperLink>

                                                                                    </itemtemplate>

                                                                                    <itemstyle cssclass="itemBorder" horizontalalign="Center" />
                                                                                </asp:TemplateColumn>
                                                                                <%--    <asp:ButtonColumn ButtonType="LinkButton" CommandName="Other" Text="- - -">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" />
                                                                    </asp:ButtonColumn>--%>
                                                                            </columns>
                                                                            <footerstyle backcolor="#507CD1" font-bold="True" forecolor="White" />
                                                                            <edititemstyle backcolor="#2461BF" />
                                                                            <selecteditemstyle backcolor="#D1DDF1" font-bold="True" forecolor="#333333" />
                                                                            <pagerstyle horizontalalign="Center" mode="NumericPages" nextpagetext="" prevpagetext="" cssclass="notTab" />

                                                                            <itemstyle cssclass="itemStyle" />
                                                                        </asp:DataGrid>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td style="text-align: left;">
                                                                        <asp:Label ID="LB_RiskID" runat="server" Visible="False"></asp:Label>
                                                                        <asp:Label ID="LB_ProjectID" runat="server" Visible="False"></asp:Label>
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
                    </div>

                    <div class="layui-layer layui-layer-iframe" id="popwindow"
                        style="z-index: 9999; width: 800px; height: 530px; position: absolute; overflow: hidden; display: none; border-radius: 10px;">
                        <div class="layui-layer-title" style="background: #e7e7e8;" id="popwindow_title">
                            <asp:Label ID="Label9" runat="server" Text="&lt;div&gt;&lt;img src=ImagesSkin/Update.png border=0 width=30px height=30px alt='BusinessForm' /&gt;&lt;/div&gt;"></asp:Label>
                        </div>
                        <div id="popwindow_content" class="layui-layer-content" style="text-align: left; overflow: auto; padding: 0px 5px 0px 5px;">

                            <cc1:tabcontainer cssclass="ajax_tab_menu" id="TabContainer1" width="100%" runat="server" activetabindex="0">
                                <cc1:tabpanel id="TabPanel1" runat="server" headertext="基本信息" tabindex="0">
                                    <headertemplate>
                                        <asp:Label ID="Label42" runat="server" Text="<%$ Resources:lang,JiBenXinXi%>"></asp:Label>
                                    </headertemplate>
                                    <contenttemplate>

                                        <table style="width: 98%;" cellpadding="5" cellspacing="0" class="formBgStyle">
                                            <tr>
                                                <td style="width: 10%; text-align: right" class="formItemBgStyle">
                                                    <asp:Label ID="Label22" runat="server" Text="<%$ Resources:lang,LeiXing %>"></asp:Label>
                                                    ：
                                                </td>
                                                <td style="width: 150px; text-align: left" class="formItemBgStyle">
                                                    <asp:DropDownList ID="DL_Type" runat="server" DataTextField="Type" DataValueField="Type">
                                                    </asp:DropDownList>
                                                </td>
                                                <td style="width: 166px; text-align: right" class="formItemBgStyle">
                                                    <asp:Label ID="Label23" runat="server" Text="<%$ Resources:lang,YouXianJi %>"></asp:Label>
                                                    ：
                                                </td>
                                                <td style="text-align: left;" class="formItemBgStyle">
                                                    <asp:DropDownList ID="DL_Priority" runat="server" DataTextField="Priority" DataValueField="Priority">
                                                        <asp:ListItem>Normal</asp:ListItem>
                                                        <asp:ListItem>High</asp:ListItem>
                                                        <asp:ListItem>Low</asp:ListItem>
                                                    </asp:DropDownList>
                                                </td>
                                                <td style="text-align: right" class="formItemBgStyle">
                                                    <asp:Label ID="Label24" runat="server" Text="<%$ Resources:lang,YuSuan %>"></asp:Label>
                                                    ：
                                                </td>
                                                <td style="width: 93px; text-align: left" class="formItemBgStyle">
                                                    <nicklee:numberbox maxamount="1000000000000" minamount="-1000000000000" id="TB_Budget" runat="server" width="67px" onblur="" onfocus=""
                                                        onkeypress="" positivecolor="">
                                                        0.00</nicklee:numberbox>
                                                    <asp:Label ID="LB_TaskNO" runat="server" Visible="false"></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td rowspan="2" style="width: 10%; text-align: right" class="formItemBgStyle">
                                                    <asp:Label ID="Label25" runat="server" Text="<%$ Resources:lang,RenWu %>"></asp:Label>
                                                    ：
                                                </td>
                                                <td colspan="3" rowspan="2" style="text-align: left" class="formItemBgStyle">
                                                    <asp:TextBox ID="TB_Task" runat="server" Height="45px" TextMode="MultiLine" Width="90%"></asp:TextBox>
                                                </td>
                                                <td style="width: 100px; text-align: right" class="formItemBgStyle">
                                                    <asp:Label ID="Label26" runat="server" Text="<%$ Resources:lang,ShiJiFeiYong %>"></asp:Label>
                                                    ：
                                                </td>
                                                <td style="width: 93px; text-align: left" class="formItemBgStyle">
                                                    <nicklee:numberbox maxamount="1000000000000" minamount="-1000000000000" id="TB_Expense" runat="server" enabled="False" width="65px" onblur=""
                                                        onfocus="" onkeypress="" positivecolor="">
                                                        0.00</nicklee:numberbox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="width: 10%; text-align: right" class="formItemBgStyle">
                                                    <asp:Label ID="Label27" runat="server" Text="<%$ Resources:lang,GongShi2 %>"></asp:Label>
                                                    ：
                                                </td>
                                                <td style="width: 93px; text-align: left" class="formItemBgStyle">
                                                    <nicklee:numberbox maxamount="1000000000000" minamount="-1000000000000" id="NB_ManHour" runat="server" width="67px" onblur="" onfocus=""
                                                        onkeypress="" positivecolor="">
                                                        0.00</nicklee:numberbox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="width: 150px; text-align: right" class="formItemBgStyle">
                                                    <asp:Label ID="Label28" runat="server" Text="<%$ Resources:lang,KaiShiShiJian %>"></asp:Label>
                                                    ：
                                                </td>
                                                <td style="width: 150px; text-align: left" class="formItemBgStyle">
                                                    <asp:TextBox ID="DLC_BeginDate" runat="server"></asp:TextBox>
                                                    <ajaxtoolkit:calendarextender format="yyyy-MM-dd" id="CalendarExtender2" runat="server" targetcontrolid="DLC_BeginDate" enabled="True">
                                                    </ajaxtoolkit:calendarextender>
                                                </td>
                                                <td style="text-align: right" class="formItemBgStyle">
                                                    <asp:Label ID="Label29" runat="server" Text="<%$ Resources:lang,JieShuShiJian %>"></asp:Label>
                                                    ：
                                                </td>
                                                <td style="width: 150px; text-align: left;" class="formItemBgStyle">
                                                    <asp:TextBox ID="DLC_EndDate" runat="server"></asp:TextBox>
                                                    <ajaxtoolkit:calendarextender format="yyyy-MM-dd" id="CalendarExtender1"
                                                        runat="server" targetcontrolid="DLC_EndDate" enabled="True">
                                                    </ajaxtoolkit:calendarextender>
                                                </td>
                                                <td style="width: 100px; text-align: right" class="formItemBgStyle">
                                                    <asp:Label ID="Label30" runat="server" Text="<%$ Resources:lang,ShiJiGongShi %>"></asp:Label>
                                                    ：
                                                </td>
                                                <td style="width: 93px; text-align: left" class="formItemBgStyle">
                                                    <nicklee:numberbox maxamount="1000000000000" minamount="-1000000000000" id="NB_RealManHour" runat="server" enabled="False" width="53px"
                                                        onblur="" onfocus="" onkeypress="" positivecolor="">
                                                        0.00</nicklee:numberbox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="width: 10%; text-align: right; height: 16px;" class="formItemBgStyle">
                                                    <asp:Label ID="Label31" runat="server" Text="<%$ Resources:lang,ZhuangTai %>"></asp:Label>
                                                    ：
                                                </td>
                                                <td style="text-align: left; width: 150px; height: 16px;" class="formItemBgStyle">
                                                    <asp:DropDownList ID="DL_Status" runat="server" DataTextField="HomeName" DataValueField="Status"
                                                        Width="103px">
                                                    </asp:DropDownList>
                                                </td>
                                                <td style="text-align: right;" class="formItemBgStyle">
                                                    <asp:Label ID="Label32" runat="server" Text="<%$ Resources:lang,JianLiShiJian %>"></asp:Label>
                                                    ：
                                                </td>
                                                <td style="width: 150px; height: 16px;" class="formItemBgStyle">
                                                    <asp:Label ID="LB_MakeDate" runat="server" Font-Size="10pt" Width="97px"></asp:Label>
                                                </td>
                                                <td style="width: 100px; text-align: right; height: 16px;" class="formItemBgStyle">
                                                    <asp:Label ID="Label33" runat="server" Text="<%$ Resources:lang,WanChengChengDu %>"></asp:Label>
                                                    ：
                                                </td>
                                                <td style="width: 93px; height: 16px; text-align: left;" class="formItemBgStyle">
                                                    <nicklee:numberbox maxamount="1000000000000" minamount="-1000000000000" id="TB_FinishPercent" enabled="false" runat="server" width="47px" onblur="" onfocus=""
                                                        onkeypress="" positivecolor="">
                                                        0.00</nicklee:numberbox>
                                                    %
                                                </td>
                                            </tr>
                                            <tr style="display: none;">
                                                <td style="width: 10%; text-align: right" class="formItemBgStyle">&nbsp;<asp:Label ID="LB_Status" runat="server" Visible="False"></asp:Label>
                                                </td>
                                                <td colspan="5" style="width: 10%; text-align: left;" class="formItemBgStyle">

                                                    <asp:Button ID="BT_Close" runat="server" Enabled="False" Visible="false" OnClick="BT_Close_Click"
                                                        Text="<%$ Resources:lang,GuanBi %>" CssClass="inpu" />
                                                    &nbsp;<asp:Button ID="BT_Active" runat="server" Enabled="False" Visible="false" OnClick="BT_Active_Click"
                                                        Text="<%$ Resources:lang,JiHuo %>" CssClass="inpu" />
                                                    <asp:Label ID="LB_Sql" runat="server" Visible="False"></asp:Label>
                                                    <asp:Label ID="LB_TaskID" runat="server" Visible="False"></asp:Label>
                                                </td>
                                            </tr>
                                        </table>

                                    </contenttemplate>
                                </cc1:tabpanel>
                                <cc1:tabpanel id="TabPanel2" runat="server" headertext="关联信息" tabindex="2">
                                    <headertemplate>
                                        <asp:Label ID="Label63" runat="server" Text="<%$ Resources:lang,XiangGuanYeWuDan%>"></asp:Label>
                                    </headertemplate>
                                    <contenttemplate>

                                        <asp:Panel ID="Panel_RelatedBusiness" runat="server" Visible="false">
                                            <table style="width: 100%;" cellpadding="2" cellspacing="0" class="formBgStyle">
                                                <%--  <tr>
                                                    <td colspan="8" align="center" style="padding-right: 7%;">

                                                        <asp:Label ID="Label34" runat="server" Text="<%$ Resources:lang,XiangGuanYeWuDan %>"></asp:Label>
                                                    </td>
                                                </tr>--%>
                                                <tr>
                                                    <td style="width: 10%; text-align: right;" class="formItemBgStyle">
                                                        <asp:Label ID="Label3333" runat="server" Text="<%$ Resources:lang,LeiXing %>"></asp:Label>
                                                        : </td>
                                                    <td style="width: 20%; text-align: left;" class="formItemBgStyle">
                                                        <asp:DropDownList ID="DL_WLType" runat="server" DataTextField="HomeName" DataValueField="Type"
                                                            AutoPostBack="true" OnSelectedIndexChanged="DL_WLType_SelectedIndexChanged">
                                                        </asp:DropDownList>
                                                    </td>
                                                    <td style="width: 20%; text-align: right;" class="formItemBgStyle">
                                                        <asp:Label ID="Label7333" runat="server" Text="<%$ Resources:lang,BiaoDanGuanLianDeLiuChengMoBan%>"></asp:Label>
                                                        ：
                                                    </td>
                                                    <td style="text-align: left;" class="formItemBgStyle">
                                                        <asp:DropDownList ID="DL_WFTemplate" runat="server" DataTextField="TemName" DataValueField="TemName">
                                                        </asp:DropDownList>
                                                    </td>
                                                    <td style="width: 20%; text-align: right;" class="formItemBgStyle">
                                                        <asp:Label ID="Label41" runat="server" Text="<%$ Resources:lang,YunXuHouXuXiuGe%>"></asp:Label>
                                                        ：
                                                    </td>
                                                    <td style="text-align: left;" class="formItemBgStyle">
                                                        <asp:DropDownList ID="DL_AllowUpdate" runat="server" AutoPostBack="true" OnSelectedIndexChanged="DL_AllowUpdate_SelectedIndexChanged">
                                                            <asp:ListItem Value="YES" Text="YES"></asp:ListItem>
                                                            <asp:ListItem Value="NO" Text="NO"></asp:ListItem>
                                                        </asp:DropDownList>
                                                    </td>
                                                    <td style="text-align: left;" class="formItemBgStyle">

                                                        <asp:Button ID="BT_StartupBusinessForm" runat="server" CssClass="inpu" Text="<%$ Resources:lang,DaKai %>" OnClick="BT_StartupBusinessForm_Click" />
                                                    </td>
                                                    <td style="text-align: left;" class="formItemBgStyle"></td>
                                                </tr>
                                            </table>
                                        </asp:Panel>

                                        <iframe id="IFrame_RelatedInformation" name="IFrame_RelatedInformation" src="TTRelatedDIYBusinessForm.aspx" runat="server" style="width: 100%; overflow: auto;"></iframe>

                                    </contenttemplate>
                                </cc1:tabpanel>
                            </cc1:tabcontainer>

                        </div>

                        <div id="popwindow_footer" class="layui-layer-btn" style="border-top: 1px solid #ccc;">
                            <asp:LinkButton ID="LinkButton1" runat="server" class="layui-layer-btn notTab" OnClientClick="window.frames['IFrame_RelatedInformation'].document.getElementById('BT_SaveXMLFile').click()" OnClick="BT_New_Click" Text="<%$ Resources:lang,BaoCun%>"></asp:LinkButton>
                            <a class="layui-layer-btn notTab" onclick="return popClose();">
                                <asp:Label ID="Label66" runat="server" Text="<%$ Resources:lang,GuanBi%>" />
                            </a>
                        </div>
                        <span class="layui-layer-setwin"><a onclick="return popClose();" class="layui-layer-ico layui-layer-close layui-layer-close1 notTab" href="javascript:;"></a></span>
                    </div>

                    <div class="layui-layer layui-layer-iframe" id="popAssignWindow" name="noConfirm"
                        style="z-index: 9999; width: 800px; height: 530px; position: absolute; overflow: hidden; display: none; border-radius: 10px;">
                        <div class="layui-layer-title" style="background: #e7e7e8;" id="popwindow_title1">
                            <asp:Label ID="Label61" runat="server" Text="&lt;div&gt;&lt;img src=ImagesSkin/Update.png border=0 width=30px height=30px alt='BusinessForm' /&gt;&lt;/div&gt;"></asp:Label>
                        </div>
                        <div id="popwindow_content1" class="layui-layer-content" style="overflow: auto; padding: 0px 5px 0px 5px;">

                            <table cellpadding="5" cellspacing="0" class="formBgStyle" style="width: 98%">

                                <tr>
                                    <td style="width: 15%; text-align: right" class="formItemBgStyle">
                                        <asp:Label ID="Label43" runat="server" Text="<%$ Resources:lang,LeiXing%>"></asp:Label>
                                        ：
                                    </td>
                                    <td style="text-align: left; width: 30%;" class="formItemBgStyle">
                                        <asp:DropDownList ID="DL_RecordType" runat="server" DataTextField="Type" DataValueField="Type">
                                        </asp:DropDownList>
                                        <asp:Label ID="LB_ID" runat="server"></asp:Label>
                                    </td>
                                    <td style="text-align: right; width: 15%;" class="formItemBgStyle">
                                        <asp:Label ID="Label44" runat="server" Text="<%$ Resources:lang,ShouLiRen%>"></asp:Label>
                                        ：</td>
                                    <td style="text-align: left;" class="formItemBgStyle">
                                        <asp:DropDownList ID="DL_OperatorCode" runat="server" DataTextField="UserName" DataValueField="UserCode" Width="160px" AutoPostBack="True" OnSelectedIndexChanged="DL_OperatorCode_SelectedIndexChanged">
                                        </asp:DropDownList>
                                        <asp:HyperLink ID="HL_MemberWorkload" runat="server" Target="_blank">
                                            <asp:Label ID="Label45" runat="server" Text="<%$ Resources:lang,ChaKanGongZuoFuHe%>"></asp:Label>
                                        </asp:HyperLink>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 10%; height: 21px; text-align: right" class="formItemBgStyle">
                                        <asp:Label ID="Label46" runat="server" Text="<%$ Resources:lang,GongZuoYaoQiu%>"></asp:Label>
                                        ：
                                    </td>
                                    <td colspan="3" align="left" class="formItemBgStyle">
                                        <ckeditor:ckeditorcontrol id="HE_Operation" runat="server" height="100px" width="99%" visible="False" />
                                        <ckeditor:ckeditorcontrol runat="server" id="HT_Operation" width="99%" height="100px" visible="False" />

                                        <asp:DropDownList ID="DL_WorkRequest" runat="server" AutoPostBack="True" DataTextField="Operation"
                                            DataValueField="Operation" OnSelectedIndexChanged="DL_WorkRequest_SelectedIndexChanged">
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 10%; text-align: right" class="formItemBgStyle">
                                        <asp:Label ID="Label47" runat="server" Text="<%$ Resources:lang,KaiShiShiJian%>"></asp:Label>
                                        ：
                                    </td>
                                    <td style="width: 220px; text-align: left" class="formItemBgStyle">

                                        <asp:TextBox ID="DLC_TaskBegin" runat="server" AutoPostBack="true" OnTextChanged="DLC_TaskBegin_TextChanged"></asp:TextBox>
                                        <ajaxtoolkit:calendarextender format="yyyy-MM-dd" id="CalendarExtender3" runat="server" targetcontrolid="DLC_TaskBegin" enabled="True">
                                        </ajaxtoolkit:calendarextender>
                                    </td>
                                    <td style="width: 15%; text-align: right" class="formItemBgStyle">
                                        <asp:Label ID="Label48" runat="server" Text="<%$ Resources:lang,JieShuShiJian%>"></asp:Label>
                                        ：
                                    </td>
                                    <td style="width: 220px; text-align: left;" class="formItemBgStyle">

                                        <asp:TextBox ID="DLC_TaskEnd" runat="server" AutoPostBack="true" OnTextChanged="DLC_TaskEnd_TextChanged"></asp:TextBox>
                                        <ajaxtoolkit:calendarextender format="yyyy-MM-dd" id="CalendarExtender4" runat="server" targetcontrolid="DLC_TaskEnd" enabled="True">
                                        </ajaxtoolkit:calendarextender>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 10%; height: 21px; text-align: right" class="formItemBgStyle"></td>
                                    <td colspan="2" style="height: 21px; text-align: center" class="formItemBgStyle">
                                        <asp:Button ID="BT_UpdateAssign" CssClass="inpu" runat="server" Enabled="False" OnClick="BT_UpdateAssign_Click"
                                            Text="<%$ Resources:lang,BaoCun%>" />
                                        &nbsp;&nbsp;
                                        <asp:Button ID="BT_DeleteAssign" runat="server" CssClass="inpu" Enabled="False" OnClick="BT_DeleteAssign_Click" OnClientClick="return confirm(getDeleteMsgByLangCode())"
                                            Text="<%$ Resources:lang,ShanChu%>" />
                                        <asp:Button ID="BT_Assign" runat="server" CssClass="inpu" Enabled="False" OnClick="BT_Assign_Click"
                                            Text="<%$ Resources:lang,FenPai%>" />
                                    </td>
                                    <td style="height: 21px; text-align: left" class="formItemBgStyle"></td>
                                </tr>
                                <tr>
                                    <td style="width: 10%; height: 21px; text-align: right" class="formItemBgStyle"></td>
                                    <td colspan="3" style="height: 21px; text-align: left" class="formItemBgStyle">
                                        <asp:CheckBox ID="CB_SendMsg" runat="server" Font-Bold="False" Font-Size="10pt" Text="<%$ Resources:lang,FaXinXi%>" />
                                        <asp:CheckBox ID="CB_SendMail" runat="server" Font-Bold="False" Font-Size="10pt"
                                            Text="<%$ Resources:lang,FaYouJian%>" />
                                        <span style="font-size: 10pt">
                                            <asp:Label ID="Label49" runat="server" Text="<%$ Resources:lang,TongZhiShouLiRen%>"></asp:Label>
                                        </span>
                                        <asp:TextBox ID="TB_Message" runat="server" Width="383px"></asp:TextBox>
                                        <asp:Button ID="BT_Send" runat="server" OnClick="BT_Send_Click" Text="<%$ Resources:lang,FaSong%>" CssClass="inpu" />
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="4" style="text-align: left; height: 9px;" class="formItemBgStyle">
                                        <span><strong>
                                            <asp:Label ID="LB_TaskName" runat="server" Font-Size="10pt" Visible="False"></asp:Label>
                                        </strong></span>&nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="4" style="text-align: left" class="formItemBgStyle">
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
                                                                    <asp:Label ID="Label50" runat="server" Text="<%$ Resources:lang,XuHao%>"></asp:Label>
                                                                </strong>
                                                            </td>
                                                            <td width="8%" align="center">
                                                                <strong>
                                                                    <asp:Label ID="Label51" runat="server" Text="<%$ Resources:lang,LeiXing%>"></asp:Label>
                                                                </strong>
                                                            </td>
                                                            <td width="11%" align="center">
                                                                <strong>
                                                                    <asp:Label ID="Label52" runat="server" Text="<%$ Resources:lang,RenWu%>"></asp:Label>
                                                                </strong>
                                                            </td>
                                                            <td width="8%" align="center">
                                                                <strong>
                                                                    <asp:Label ID="Label53" runat="server" Text="<%$ Resources:lang,FenPaiRen%>"></asp:Label>
                                                                </strong>
                                                            </td>
                                                            <td width="8%" align="center">
                                                                <strong>
                                                                    <asp:Label ID="Label54" runat="server" Text="<%$ Resources:lang,ShouLiRen%>"></asp:Label>
                                                                </strong>
                                                            </td>
                                                            <td width="14%" align="center">
                                                                <strong>
                                                                    <asp:Label ID="Label55" runat="server" Text="<%$ Resources:lang,ShouLiRenDeGongZuo%>"></asp:Label>
                                                                </strong>
                                                            </td>
                                                            <td width="15%" align="center">
                                                                <strong>
                                                                    <asp:Label ID="Label56" runat="server" Text="<%$ Resources:lang,KaiShiShiJian%>"></asp:Label>
                                                                </strong>
                                                            </td>
                                                            <td width="15%" align="center">
                                                                <strong>
                                                                    <asp:Label ID="Label57" runat="server" Text="<%$ Resources:lang,JieShuShiJian%>"></asp:Label>
                                                                </strong>
                                                            </td>
                                                            <td width="5%" align="center">
                                                                <strong>
                                                                    <asp:Label ID="Label58" runat="server" Text="<%$ Resources:lang,FeiYong%>"></asp:Label>
                                                                </strong>
                                                            </td>
                                                            <td width="5%" align="center">
                                                                <strong>
                                                                    <asp:Label ID="Label59" runat="server" Text="<%$ Resources:lang,LuXian%>"></asp:Label>
                                                                </strong>
                                                            </td>
                                                            <td width="5%" align="center">
                                                                <strong>
                                                                    <asp:Label ID="Label60" runat="server" Text="<%$ Resources:lang,ZhuangTai%>"></asp:Label>
                                                                </strong>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                                <td width="6" align="right">
                                                    <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" />
                                                </td>
                                            </tr>
                                        </table>
                                        <asp:DataGrid ID="DataGrid2" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                                            OnItemCommand="DataGrid2_ItemCommand" Width="100%" Height="1px" CellPadding="4"
                                            ShowHeader="False" ForeColor="#333333" GridLines="None">
                                            <columns>
                                                <asp:TemplateColumn HeaderText="编号">
                                                    <itemtemplate>
                                                        <asp:Button ID="BT_ID" runat="server" Text='<%# DataBinder.Eval(Container.DataItem,"ID") %>'
                                                            CssClass="inpu" />
                                                    </itemtemplate>
                                                    <itemstyle cssclass="itemBorder" horizontalalign="Center" width="9%" />
                                                </asp:TemplateColumn>
                                                <asp:BoundColumn DataField="Type" HeaderText="类型">
                                                    <itemstyle cssclass="itemBorder" horizontalalign="Center" width="8%" />
                                                </asp:BoundColumn>
                                                <asp:BoundColumn DataField="TaskID" HeaderText="任务">
                                                    <itemstyle cssclass="itemBorder" horizontalalign="Center" width="11%" />
                                                </asp:BoundColumn>
                                                <asp:BoundColumn DataField="AssignManName" HeaderText="分派人">
                                                    <itemstyle cssclass="itemBorder" horizontalalign="Center" width="8%" />
                                                </asp:BoundColumn>
                                                <asp:BoundColumn DataField="OperatorName" HeaderText="受理人">
                                                    <itemstyle cssclass="itemBorder" horizontalalign="Center" width="8%" />
                                                </asp:BoundColumn>
                                                <asp:BoundColumn DataField="Operation" HeaderText="受理人的工作">
                                                    <itemstyle cssclass="itemBorder" horizontalalign="Left" width="14%" />
                                                </asp:BoundColumn>
                                                <asp:BoundColumn DataField="BeginDate" DataFormatString="{0:yyyy/MM/dd}" HeaderText="开始时间">
                                                    <itemstyle cssclass="itemBorder" horizontalalign="Center" width="15%" />
                                                </asp:BoundColumn>
                                                <asp:BoundColumn DataField="EndDate" DataFormatString="{0:yyyy/MM/dd}" HeaderText="结束时间">
                                                    <itemstyle cssclass="itemBorder" horizontalalign="Center" width="15%" />
                                                </asp:BoundColumn>
                                                <asp:BoundColumn DataField="Expense" HeaderText="费用">
                                                    <itemstyle cssclass="itemBorder" horizontalalign="Center" width="5%" />
                                                </asp:BoundColumn>
                                                <asp:BoundColumn DataField="RouteNumber" HeaderText="路线">
                                                    <itemstyle cssclass="itemBorder" horizontalalign="Center" width="5%" />
                                                </asp:BoundColumn>
                                                <asp:TemplateColumn HeaderText="状态">
                                                    <itemtemplate>
                                                        <%# ShareClass. GetStatusHomeNameByOtherStatus(Eval("Status").ToString()) %>
                                                    </itemtemplate>
                                                    <itemstyle cssclass="itemBorder" horizontalalign="Left" width="5%" />
                                                </asp:TemplateColumn>
                                            </columns>
                                            <footerstyle backcolor="#507CD1" font-bold="True" forecolor="White" />
                                            <edititemstyle backcolor="#2461BF" />
                                            <selecteditemstyle backcolor="#D1DDF1" font-bold="True" forecolor="#333333" />
                                            <pagerstyle horizontalalign="Center" mode="NumericPages" nextpagetext="" prevpagetext="" cssclass="notTab" />

                                            <itemstyle cssclass="itemStyle" />
                                        </asp:DataGrid>
                                    </td>
                                </tr>
                            </table>
                        </div>

                        <div id="popwindow_footer1" class="layui-layer-btn" style="border-top: 1px solid #ccc;">
                            <a class="layui-layer-btn notTab" onclick="return popClose();">
                                <asp:Label ID="Label62" runat="server" Text="<%$ Resources:lang,GuanBi%>" />
                            </a>
                        </div>
                        <span class="layui-layer-setwin"><a onclick="return popClose();" class="layui-layer-ico layui-layer-close layui-layer-close1 notTab" href="javascript:;"></a></span>
                    </div>


                    <div class="layui-layer layui-layer-iframe" id="popOtherWindow" name="noConfirm"
                        style="z-index: 9999; width: 800px; height: 100px; position: absolute; overflow: hidden; display: none; border-radius: 10px;">
                        <div class="layui-layer-title" style="background: #e7e7e8;" id="popwindow_title111">
                            <asp:Label ID="Label14" runat="server" Text="&lt;div&gt;&lt;img src=ImagesSkin/Update.png border=0 width=30px height=30px alt='BusinessForm' /&gt;&lt;/div&gt;"></asp:Label>
                        </div>
                        <div id="popwindow_content112" class="layui-layer-content" style="overflow: auto; text-align: left; padding: 0px 5px 0px 5px;">

                            <table cellpadding="3" cellspacing="0" style="width: 100%">
                                <tr>
                                    <td align="left">
                                        <table style="width: 100%;" cellpadding="3" cellspacing="0" class="formBgStyle">
                                            <tr>
                                                <td colspan="5" style="text-align: left; height: 4px;" class="formItemBgStyle">
                                                    <asp:HyperLink ID="HL_TestCase" runat="server" Enabled="False" NavigateUrl="TTMakeTaskTestCase.aspx"
                                                        Target="_blank">
                                                        <asp:Label ID="Label35" runat="server" Text="<%$ Resources:lang,CeShiYongLi%>"></asp:Label>
                                                    </asp:HyperLink>
                                                    &nbsp;&nbsp;<asp:HyperLink ID="HL_AssignRecord" runat="server" Enabled="False" NavigateUrl="TTTaskAssignRecord.aspx"
                                                        Target="_blank">
                                                        <asp:Label ID="Label38" runat="server" Text="<%$ Resources:lang,FenPaiJiLu%>"></asp:Label>
                                                    </asp:HyperLink>
                                                    &nbsp; &nbsp;
                                                     <asp:HyperLink ID="HL_ActorGroup" runat="server" Enabled="False"
                                                         NavigateUrl="~/TTProjectRelatedActorGroup.aspx" Target="_blank">
                                                         <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,JueSeZuSheZhi%>"></asp:Label>
                                                     </asp:HyperLink>
                                                    &nbsp;&nbsp;
                                                       <asp:HyperLink ID="HL_RunTaskByWF" runat="server" Enabled="False" Target="_blank" Visible="false">---&gt;<asp:Label ID="Label37" runat="server" Text="<%$ Resources:lang,RenWuChuLiLiuChengMoShi%>"></asp:Label></asp:HyperLink>
                                                    &nbsp;&nbsp;
                                                    <asp:HyperLink ID="HL_TaskReview" runat="server" Enabled="False" Visible="false" Target="_blank">---&gt;<asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,RenWuPingShen%>"></asp:Label></asp:HyperLink>
                                                    &nbsp;&nbsp;<asp:HyperLink ID="HL_RelatedWorkFlowTemplate" runat="server" Enabled="False"
                                                        NavigateUrl="TTProRelatedWFTemplate.aspx" Target="_blank" Visible="false">
                                                        <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,GuanLianGongZuoLiuMuBan%>"></asp:Label>
                                                    </asp:HyperLink>
                                                    &nbsp; &nbsp;
                                                   
                                                    <asp:HyperLink ID="HL_WLTem" runat="server" Enabled="False" NavigateUrl="~/TTWorkFlowTemplate.aspx"
                                                        Target="_blank" Visible="false">
                                                        <asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,MuBanWeiHu%>"></asp:Label>
                                                    </asp:HyperLink>
                                                    &nbsp;&nbsp;

                                                    <asp:HyperLink ID="HL_TaskRelatedDoc" runat="server" Enabled="False" Visible="false"
                                                        NavigateUrl="TTProTaskRelatedDoc.aspx" Target="_blank">
                                                        <asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,XiangGuanWenDang%>"></asp:Label>
                                                    </asp:HyperLink>

                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            </table>
                        </div>

                        <div id="popwindow_footer111" class="layui-layer-btn" style="border-top: 1px solid #ccc;">
                            <a class="layui-layer-btn notTab" onclick="return popClose();">
                                <asp:Label ID="Label77" runat="server" Text="<%$ Resources:lang,GuanBi%>" />
                            </a>
                        </div>
                        <span class="layui-layer-setwin"><a onclick="return popClose();" class="layui-layer-ico layui-layer-close layui-layer-close1 notTab" href="javascript:;"></a></span>
                    </div>

                    <div class="layui-layer-shade" id="popwindow_shade" style="z-index: 9998; background-color: #000; opacity: 0.3; filter: alpha(opacity=30); display: none;"></div>

                    <asp:DataList ID="DataList1" runat="server" CellPadding="0" ForeColor="#333333" Width="98%" Visible="false">
                        <itemstyle cssclass="itemStyle" />

                        <itemtemplate>
                            <table style="width: 100%;" class="bian">
                                <tr>
                                    <td style="width: 130px; text-align: right;">
                                        <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,BianHao%>"></asp:Label>
                                        ：
                                    </td>
                                    <td style="width: 100px; text-align: left;">
                                        <%#DataBinder .Eval (Container .DataItem ,"ID") %>
                                    </td>
                                    <td style="width: 128px; text-align: right;"></td>
                                    <td style="text-align: center"></td>
                                    <td style="text-align: right; width: 209px;"></td>
                                    <td style="text-align: left"></td>
                                </tr>
                                <tr>
                                    <td style="width: 130px; text-align: right; height: 21px;">
                                        <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,MingCheng%>"></asp:Label>
                                        ：
                                    </td>
                                    <td colspan="5" style="height: 21px; text-align: left;">
                                        <%#DataBinder .Eval (Container .DataItem ,"Risk") %>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 130px; text-align: right;">
                                        <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,MiaoShu%>"></asp:Label>
                                        ：
                                    </td>
                                    <td colspan="5" style="text-align: left">
                                        <%#DataBinder .Eval (Container .DataItem ,"Detail") %>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 130px; text-align: right;"></td>
                                    <td colspan="5" style="text-align: left"></td>
                                </tr>
                                <tr>
                                    <td style="width: 130px; height: 20px; text-align: right;">
                                        <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,ShengXiaoRiQi%>"></asp:Label>
                                        :
                                    </td>
                                    <td style="height: 20px; text-align: left;" colspan="2">
                                        <%#DataBinder.Eval(Container.DataItem, "EffectDate", "{0:yyyy/MM/dd}")%>
                                    </td>
                                    <td style="width: 83px; height: 20px; text-align: right;">
                                        <asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,FaXianRiQi%>"></asp:Label>
                                        ：<td style="height: 20px; text-align: left; width: 212px;" colspan="2">
                                            <%#DataBinder .Eval (Container .DataItem ,"FindDate","{0:yyyy/MM/dd}") %>
                                        </td>
                                </tr>
                                <tr>
                                    <td style="width: 130px; text-align: right;">
                                        <asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,ZhuangTai%>"></asp:Label>
                                        ：
                                    </td>
                                    <td colspan="3" style="text-align: left">
                                        <%#DataBinder .Eval (Container .DataItem ,"Status") %>
                                    </td>
                                    <td colspan="2" style="text-align: center">
                                        <span style="color: #0000ff;"><a href="TTRiskRelatedDoc.aspx?RelatedID=<%#DataBinder .Eval (Container .DataItem ,"ID")%>"
                                            target="_blank">
                                            <asp:Label ID="Label8" runat="server" Text="<%$ Resources:lang,XiangGuanWenJian%>"></asp:Label>
                                        </a></td>
                                </tr>
                            </table>
                        </itemtemplate>
                    </asp:DataList>
                </contenttemplate>
            </asp:UpdatePanel>
            <div style="position: absolute; left: 50%; top: 50%;">
                <asp:UpdateProgress ID="TakeTopUp" runat="server" AssociatedUpdatePanelID="UpdatePanel1">
                    <progresstemplate>
                        <img src="Images/Processing.gif" alt="Loading,please wait..." />
                    </progresstemplate>
                </asp:UpdateProgress>
            </div>
        </form>
    </center>
</body>
<script type="text/javascript" language="javascript">var cssDirectory = '<%=Session["CssDirectory"] %>'; var oLink = document.getElementById('mainCss'); oLink.href = 'css/' + cssDirectory + '/' + 'bluelightmain.css';</script>
</html>
