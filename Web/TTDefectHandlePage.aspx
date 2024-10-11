<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTDefectHandlePage.aspx.cs" Inherits="TTDefectHandlePage" %>

<%@ Register Assembly="NickLee.Web.UI" Namespace="NickLee.Web.UI" TagPrefix="NickLee" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc2" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>制定计划</title>
    <link id="mainCss" href="css/bluelightmain.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        #AboveDiv {
            min-width: 1100px;
            width: expression (document.body.clientWidth <= 1100? "1100px" : "auto" ));
        }
    </style>
    <script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="js/jquery-ui/jquery-ui.min.js"></script>
    <script type="text/javascript" src="js/allAHandler.js"></script>
    <script type="text/javascript" language="javascript">

        //页面加载完成,ajax回发加载完成后执行的操作，传入一个funtion
        //$load调用示例
        //$load(function () {
        //    //需要页面加载完成执行的代码
        //});
        var $load = function (loadFunc) {
            $(function () {
                if (typeof (Sys) != 'undefined') {
                    Sys.WebForms.PageRequestManager.getInstance().add_pageLoaded(loadFunc);
                }
                else {
                    loadFunc();
                }
            });
        };

        $load(function () {
            if (top.location != self.location) { } else { CloseWebPage(); }

            $(".bian").draggable({
                revert: "invalid",
                start: function (event, ui) {
                    $(this).closest("table").parent().css("overflow-y", "visible");
                },
                stop: function (event, ui) {
                    /*  $(this).closest("table").parent().css("overflow-y", "auto");*/
                    $(this).closest("table").parent().css("overflow-y", "visible");
                }
            });

            $(".formItemBgStyle>div").each(function () {
                $(this).droppable({
                    accept: ".formItemBgStyle>div:not(#" + $(this).attr("id") + ") .bian",
                    over: function (event, ui) {
                        $(this).css("border", "3px solid LightCoral");
                    },
                    out: function (event, ui) {
                        $(this).css("border", "0px");
                    },
                    drop: function (event, ui) {
                        var $draggerDiv = $(ui.draggable[0]);
                        $draggerDiv.closest("table").parent().css("overflow-y", "auto");
                        $cloneTr = $draggerDiv.parent().parent().clone();
                        $(this).find("table").find("tr:eq(0)").before($cloneTr);
                        $cloneTr.find("div").css("position", "inherit");
                        $cloneTr.find("div").css("left", "0");
                        $cloneTr.find("div").css("top", "0");

                        $("#LB_SourceID").val(getQueryString("ID", $cloneTr.find("a").attr("href")));
                        $("#LB_TargetStatus").val($(this).prev().find(".StatusCss").text());

                        $draggerDiv.parent().parent().remove()
                        $(this).css("border", "0px");

                        $("#BT_UpdateStatus").click();
                    }
                });
            });
        });

        function AdjustDivHeight() {

            document.getElementById("Div_ToBeHandled").style.height = document.documentElement.clientHeight - 110 + "px";
            document.getElementById("Div_Handling").style.height = document.documentElement.clientHeight - 110 + "px";
            document.getElementById("Div_FinishedUnAssigned").style.height = document.documentElement.clientHeight - 110 + "px";
            document.getElementById("Div_Assigned").style.height = document.documentElement.clientHeight - 110 + "px";

        }

        //获取url后参数值
        function getQueryString(name, url) {
            if (!url) {
                url = window.location.search.substr(1);
            }
            else {
                url = url.substring(url.indexOf("?") + 1);
            }
            var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
            var r = url.match(reg);
            if (r != null) return unescape(r[2]); return null;
        }
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
                                                            <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,QuanXianGuanLi%>" />
                                                        </td>
                                                        <td width="5">
                                                            <%-- <img src="ImagesSkin/main_top_r.jpg" width="5" height="31" />--%>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                            <td align="right" style="padding-top: 5px; display: none;">
                                                <asp:Button ID="BT_CreateDefect" runat="server" CssClass="inpuLong" Text="<%$ Resources:lang,JianLiHeFenPaiQueXian%>" OnClick="BT_CreateDefect_Click" />
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td valign="top" style="padding: 0px 5px 5px 5px;">
                                    <cc2:TabContainer CssClass="ajax_tab_menu" ID="TabContainer2" runat="server" ActiveTabIndex="0" Width="100%">
                                        <cc2:TabPanel ID="TabPanel1" runat="server" HeaderText="正处理的缺陷：">
                                            <HeaderTemplate>
                                                <asp:Label ID="Label8" runat="server" Text="<%$ Resources:lang,ZhenChuLiDeQueXian%>"></asp:Label>
                                            </HeaderTemplate>
                                            <ContentTemplate>
                                                <table cellpadding="0" cellspacing="0" width="100%">
                                                    <tr>
                                                        <td align="left" class="formItemBgStyle" width="23%">
                                                            <table background="ImagesSkin/main_n_bj.jpg" border="0" cellpadding="0" cellspacing="0"
                                                                width="100%">
                                                                <tr>
                                                                    <td width="7">
                                                                        <img height="26" src="ImagesSkin/main_n_l.jpg" width="7" /></td>
                                                                    <td>
                                                                        <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                                            <tr>
                                                                                <td align="center" width="100%">
                                                                                    <strong>
                                                                                        <table>
                                                                                            <tr>
                                                                                                <td>
                                                                                                    <asp:Label ID="Label9" runat="server" Text="<%$ Resources:lang,DaiChuLiDD %>"></asp:Label>
                                                                                                </td>
                                                                                                <td style="padding-left: 10px;">
                                                                                                    <asp:HyperLink ID="HL_CreateDefect" runat="server"> <span style ="font-size:xx-large;color:red;"> +</span> </asp:HyperLink>
                                                                                                </td>
                                                                                            </tr>
                                                                                        </table>
                                                                                    </strong>
                                                                                </td>
                                                                            </tr>
                                                                            <tr style="display: none;">
                                                                                <td align="center" width="100%">
                                                                                    <asp:Label ID="LB_TaskRecordStatus_ToBeHandled" runat="server" CssClass="StatusCss" Text="待处理"></asp:Label>
                                                                                </td>
                                                                            </tr>
                                                                        </table>
                                                                    </td>
                                                                    <td align="right" width="6">
                                                                        <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" /></td>
                                                                </tr>
                                                            </table>
                                                            <div id="Div_ToBeHandled" style="overflow-y: auto;">
                                                                <asp:DataList ID="DataList_ToBeHandled" runat="server" Width="100%" CellPadding="0">
                                                                    <ItemTemplate>
                                                                        <div id="div_task" class="bian" style="border-collapse: collapse; width: 97%; border-left: solid; border-top: dotted; border-right: dotted; border-bottom: dotted; border-radius: 3px 4px; border-left-color: green; border-top-color: lightblue; border-right-color: lightblue; border-bottom-color: lightblue;">

                                                                            <a href='TTDefectDetail.aspx?ID=<%#DataBinder.Eval(Container.DataItem, "ID")%>' target="_blank">
                                                                                <span style="color: red;">#<%#DataBinder.Eval(Container.DataItem, "ID")%></span>&nbsp;&nbsp; <%#DataBinder.Eval(Container.DataItem, "Operation")%><br />
                                                                                <span style="font-size: smaller">
                                                                                    <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,FenPaiRen%>"></asp:Label>：<%#DataBinder.Eval(Container.DataItem, "AssignManName")%> </span>

                                                                            </a>
                                                                        </div>
                                                                        <div style="background-color: white; height: 5px;">
                                                                            &nbsp;
                                                                        </div>
                                                                    </ItemTemplate>
                                                                </asp:DataList>
                                                            </div>
                                                        </td>
                                                        <td width="10px"></td>
                                                        <td align="left" class="formItemBgStyle" width="23%">
                                                            <table background="ImagesSkin/main_n_bj.jpg" border="0" cellpadding="0" cellspacing="0"
                                                                width="100%">
                                                                <tr>
                                                                    <td width="7">
                                                                        <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" /></td>
                                                                    <td>
                                                                        <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                                            <tr>
                                                                                <td align="center" width="100%"><strong>
                                                                                    <asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,ChuLiZhongDD %>"></asp:Label>
                                                                                </strong></td>
                                                                            </tr>
                                                                            <tr style="display: none;">
                                                                                <td align="center" width="100%">
                                                                                    <asp:Label ID="LB_TaskRecordStatus_Handling" CssClass="StatusCss" runat="server" Text="处理中"></asp:Label>
                                                                                </td>
                                                                            </tr>
                                                                        </table>
                                                                    </td>
                                                                    <td align="right" width="6">
                                                                        <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" /></td>
                                                                </tr>
                                                            </table>
                                                            <div id="Div_Handling" style="overflow-y: auto;">
                                                                <asp:DataList ID="DataList_Handling" runat="server" Width="100%" CellPadding="0">
                                                                    <ItemTemplate>
                                                                        <div id="div_task" class="bian" style="border-collapse: collapse; width: 97%; border-left: solid; border-top: dotted; border-right: dotted; border-bottom: dotted; border-radius: 3px 4px; border-left-color: green; border-top-color: lightblue; border-right-color: lightblue; border-bottom-color: lightblue;">
                                                                            <a href='TTDefectDetail.aspx?ID=<%#DataBinder.Eval(Container.DataItem, "ID")%>' target="_blank">
                                                                                <span style="color: red;">#<%#DataBinder.Eval(Container.DataItem, "ID")%></span>&nbsp;&nbsp; <%#DataBinder.Eval(Container.DataItem, "Operation")%><br />
                                                                                <span style="font-size: smaller">
                                                                                    <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,FenPaiRen%>"></asp:Label>：<%#DataBinder.Eval(Container.DataItem, "AssignManName")%> </span>
                                                                            </a>
                                                                        </div>
                                                                        <div style="background-color: white; height: 5px;">
                                                                            &nbsp;
                                                                        </div>
                                                                    </ItemTemplate>
                                                                </asp:DataList>
                                                            </div>
                                                        </td>
                                                        <td width="10px"></td>
                                                        <td align="left" class="formItemBgStyle" width="23%">
                                                            <table background="ImagesSkin/main_n_bj.jpg" border="0" cellpadding="0" cellspacing="0"
                                                                width="100%">
                                                                <tr>
                                                                    <td width="7">
                                                                        <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" /></td>
                                                                    <td>
                                                                        <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                                            <tr>
                                                                                <td align="center" width="100%"><strong>
                                                                                    <asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,YuWanChengDaiFenPai %>"></asp:Label>
                                                                                </strong></td>
                                                                            </tr>
                                                                            <tr style="display: none;">
                                                                                <td align="center" width="100%">
                                                                                    <asp:Label ID="LB_TaskRecordStatus_Finished" CssClass="StatusCss" runat="server" Text="已完成"></asp:Label>
                                                                                </td>
                                                                            </tr>
                                                                        </table>
                                                                    </td>
                                                                    <td align="right" width="6">
                                                                        <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" /></td>
                                                                </tr>
                                                            </table>
                                                            <div id="Div_FinishedUnAssigned" style="overflow-y: auto;">
                                                                <asp:DataList ID="DataList_FinishedUnAssigned" runat="server" Width="100%" CellPadding="0">
                                                                    <ItemTemplate>
                                                                        <div id="div_task" class="bian" style="border-collapse: collapse; width: 97%; border-left: solid; border-top: dotted; border-right: dotted; border-bottom: dotted; border-radius: 3px 4px; border-left-color: green; border-top-color: lightblue; border-right-color: lightblue; border-bottom-color: lightblue;">
                                                                            <a href='TTDefectDetail.aspx?ID=<%#DataBinder.Eval(Container.DataItem, "ID")%>' target="_blank">
                                                                                <span style="color: red;">#<%#DataBinder.Eval(Container.DataItem, "ID")%></span>&nbsp;&nbsp; <%#DataBinder.Eval(Container.DataItem, "Operation")%><br />
                                                                                <span style="font-size: smaller">
                                                                                    <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,FenPaiRen%>"></asp:Label>：<%#DataBinder.Eval(Container.DataItem, "AssignManName")%> </span>
                                                                            </a>
                                                                        </div>
                                                                        <div style="background-color: white; height: 5px;">
                                                                            &nbsp;
                                                                        </div>
                                                                    </ItemTemplate>
                                                                </asp:DataList>
                                                            </div>
                                                        </td>
                                                        <td width="10px"></td>
                                                        <td align="left" class="formItemBgStyle" width="23%">
                                                            <table background="ImagesSkin/main_n_bj.jpg" border="0" cellpadding="0" cellspacing="0"
                                                                width="100%">
                                                                <tr>
                                                                    <td width="7">
                                                                        <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" /></td>
                                                                    <td>
                                                                        <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                                            <tr>
                                                                                <td align="center" width="100%"><strong>
                                                                                    <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,YuFenPai %>"></asp:Label>
                                                                                </strong></td>
                                                                            </tr>
                                                                            <tr style="display: none;">
                                                                                <td align="center" width="100%">
                                                                                    <asp:Label ID="LB_TaskRecordStatus_Assigned" CssClass="StatusCss" runat="server" Text="已分派"></asp:Label>
                                                                                </td>
                                                                            </tr>
                                                                        </table>
                                                                    </td>
                                                                    <td align="right" width="6">
                                                                        <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" /></td>
                                                                </tr>
                                                            </table>
                                                            <div id="Div_Assigned" style="overflow-y: auto;">
                                                                <asp:DataList ID="DataList_Assigned" runat="server" Width="100%" CellPadding="0">
                                                                    <ItemTemplate>
                                                                        <div id="div_task" class="bian" style="border-collapse: collapse; width: 97%; border-left: solid; border-top: dotted; border-right: dotted; border-bottom: dotted; border-radius: 3px 4px; border-left-color: green; border-top-color: lightblue; border-right-color: lightblue; border-bottom-color: lightblue;">
                                                                            <a href='TTDefectDetail.aspx?ID=<%#DataBinder.Eval(Container.DataItem, "ID")%>' target="_blank">
                                                                                <span style="color: red;">#<%#DataBinder.Eval(Container.DataItem, "ID")%></span>&nbsp;&nbsp; <%#DataBinder.Eval(Container.DataItem, "Operation")%><br />
                                                                                <span style="font-size: smaller">
                                                                                    <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,FenPaiRen%>"></asp:Label>：<%#DataBinder.Eval(Container.DataItem, "AssignManName")%> </span>
                                                                            </a>
                                                                        </div>
                                                                        <div style="background-color: white; height: 5px;">
                                                                            &nbsp;
                                                                        </div>
                                                                    </ItemTemplate>
                                                                </asp:DataList>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                </table>
                                                <br />
                                            </ContentTemplate>
                                        </cc2:TabPanel>
                                        <cc2:TabPanel ID="TabPanel3" runat="server" HeaderText="我建立的任务：">
                                            <HeaderTemplate>
                                                <asp:Label ID="Label36" runat="server" Text="<%$ Resources:lang,WoDeQueXian%>"></asp:Label>
                                            </HeaderTemplate>
                                            <ContentTemplate>
                                                <table style="width: 100%;" cellpadding="0" cellspacing="0">
                                                    <tr>
                                                        <td style="text-align: left; padding: 5px 5px 5px 5px">
                                                            <table width="95%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                                                <tr>
                                                                    <td width="7">
                                                                        <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" />
                                                                    </td>
                                                                    <td>
                                                                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                            <tr>
                                                                                <td width="6%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label37" runat="server" Text="<%$ Resources:lang,BianHao%>"></asp:Label></strong>
                                                                                </td>
                                                                                <td width="38%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label38" runat="server" Text="<%$ Resources:lang,QueXianMingCheng%>"></asp:Label></strong>
                                                                                </td>
                                                                                <td width="10%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label39" runat="server" Text="<%$ Resources:lang,LeiXing%>"></asp:Label></strong>
                                                                                </td>
                                                                                <td width="15%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label40" runat="server" Text="<%$ Resources:lang,QueXianRiQi%>"></asp:Label></strong>
                                                                                </td>
                                                                                <td width="15%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label10" runat="server" Text="<%$ Resources:lang,JianLiRiQi%>"></asp:Label></strong>
                                                                                </td>
                                                                                <td align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label41" runat="server" Text="<%$ Resources:lang,ZhuangTai%>"></asp:Label></strong>
                                                                                </td>
                                                                                <td align="center">
                                                                                    <strong>&nbsp;</strong>
                                                                                </td>
                                                                                <td align="center">
                                                                                    <strong>&nbsp;</strong>
                                                                                </td>
                                                                            </tr>
                                                                        </table>
                                                                    </td>
                                                                    <td width="6" align="right">
                                                                        <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" />
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                            <asp:DataGrid ID="DataGrid5" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                                                                ShowHeader="false" CellPadding="4" ForeColor="#333333" GridLines="None" Height="1px"
                                                                OnPageIndexChanged="DataGrid5_PageIndexChanged" PageSize="25" Width="95%">
                                                                <Columns>
                                                                    <asp:BoundColumn DataField="DefectID" HeaderText="编号">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:HyperLinkColumn DataNavigateUrlField="DefectID" DataNavigateUrlFormatString="TTCreateDefectDetail.aspx?DefectID={0}"
                                                                        DataTextField="DefectName" HeaderText="缺陷名称" Target="_blank">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="38%" />
                                                                    </asp:HyperLinkColumn>
                                                                    <asp:BoundColumn DataField="DefectType" HeaderText="类型">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:BoundColumn DataField="DefectFinishedDate" DataFormatString="{0:yyyy/MM/dd}" HeaderText="缺陷日期">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="15%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:BoundColumn DataField="MakeDate" DataFormatString="{0:yyyy/MM/dd}" HeaderText="建立日期">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="15%" />
                                                                    </asp:BoundColumn>

                                                                    <asp:TemplateColumn HeaderText="状态">
                                                                        <ItemTemplate>
                                                                            <%# ShareClass.GetStatusHomeNameByDefectmentStatus(Eval("Status").ToString()) %>
                                                                        </ItemTemplate>
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" />
                                                                    </asp:TemplateColumn>
                                                                    <asp:HyperLinkColumn DataNavigateUrlField="DefectID" DataNavigateUrlFormatString="TTDefectAssignRecord.aspx?DefectID={0}"
                                                                        Text="<%$ Resources:lang,AssignRecord %>" HeaderText="分派记录" Target="_blank">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" />
                                                                    </asp:HyperLinkColumn>

                                                                    <asp:TemplateColumn>
                                                                        <ItemTemplate>
                                                                            <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl='<%# DataBinder.Eval(Container, "DataItem.DefectID", "TTDocumentTreeView.aspx?RelatedType=Defect&RelatedID={0}") %>'
                                                                                Target="_blank"><img src ="ImagesSkin/Doc.gif"  class="noBorder" /></asp:HyperLink>
                                                                        </ItemTemplate>
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" />
                                                                    </asp:TemplateColumn>
                                                                </Columns>
                                                                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                                <EditItemStyle BackColor="#2461BF" />
                                                                <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                                <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />

                                                                <ItemStyle CssClass="itemStyle" />
                                                            </asp:DataGrid>
                                                            <asp:Label ID="LB_Sql5" runat="server" Visible="False"></asp:Label>

                                                        </td>
                                                    </tr>
                                                </table>
                                                <br />
                                            </ContentTemplate>
                                        </cc2:TabPanel>
                                    </cc2:TabContainer>

                                </td>
                            </tr>
                            <tr style="display: none;">
                                <td>
                                    <asp:Button ID="BT_UpdateStatus" runat="server" Text="UpdateStatus" OnClick="BT_UpdateStatus_Click" />
                                    <asp:HiddenField ID="LB_TargetStatus" runat="server" />
                                    <asp:HiddenField ID="LB_SourceID" runat="server" />
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
