<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTAllTasks.aspx.cs" Inherits="TTAllTasks" %>

<%@ Register Assembly="ZedGraph.Web" Namespace="ZedGraph.Web" TagPrefix="cc1" %>
<%@ Register Assembly="ZedGraph" Namespace="ZedGraph" TagPrefix="cc1" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc2" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>整个项目状态</title>
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

            //$(".bian").draggable({
            //    revert: "invalid",
            //    start: function (event, ui) {
            //        $(this).closest("table").parent().css("overflow-y", "visible");
            //    },
            //    stop: function (event, ui) {
            //        $(this).closest("table").parent().css("overflow-y", "auto");
            //    }
            //});

            //$(".formItemBgStyle>div").each(function () {
            //    $(this).droppable({
            //        accept: ".formItemBgStyle>div:not(#" + $(this).attr("id") + ") .bian",
            //        over: function (event, ui) {
            //            $(this).css("border", "3px solid LightCoral");
            //        },
            //        out: function (event, ui) {
            //            $(this).css("border", "0px");
            //        },
            //        drop: function (event, ui) {
            //            var $draggerDiv = $(ui.draggable[0]);
            //            $draggerDiv.closest("table").parent().css("overflow-y", "auto");
            //            $cloneTr = $draggerDiv.parent().parent().clone();
            //            $(this).find("table").find("tr:eq(0)").before($cloneTr);
            //            $cloneTr.find("div").css("position", "inherit");
            //            $cloneTr.find("div").css("left", "0");
            //            $cloneTr.find("div").css("top", "0");

            //            $("#LB_SourceID").val(getQueryString("ID", $cloneTr.find("a").attr("href")));
            //            $("#LB_TargetStatus").val($(this).prev().find(".StatusCss").text());

            //            $draggerDiv.parent().parent().remove()
            //            $(this).css("border", "0px");

            //            $("#BT_UpdateStatus").click();
            //        }
            //    });
            //});


        });

        function AdjustDivHeight() {

            document.getElementById("Div_ToBeHandled").style.height = document.documentElement.clientHeight - 90 + "px";
            document.getElementById("Div_Handling").style.height = document.documentElement.clientHeight - 90 + "px";
            document.getElementById("Div_FinishedUnAssigned").style.height = document.documentElement.clientHeight - 90 + "px";
            document.getElementById("Div_Assigned").style.height = document.documentElement.clientHeight - 90 + "px";

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
                                <td height="31" class="page_topbj" colspan="3">
                                    <table width="96%" border="0" align="center" cellpadding="0" cellspacing="0">
                                        <tr>
                                            <td align="left">
                                                <table width="345" border="0" align="left" cellpadding="0" cellspacing="0">
                                                    <tr>
                                                        <td width="29">
                                                            <%--<img src="Logo/main_top_l.jpg" alt="" width="29" height="31" />--%>
                                                        </td>
                                                        <td align="center" background="ImagesSkin/main_top_bj.jpg" class="titlezi">
                                                            <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,SuoYouChengYuanDeRenWu%>"></asp:Label>
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
                                <td align="left" width="100%" valign="top">
                                    <table width="100%" cellpadding="0" cellspacing="0">
                                        <tr>
                                            <td style="width: 220px; padding: 5px 0px 0px 5px" valign="top" align="left">
                                                <asp:TreeView ID="TreeView1" runat="server" NodeWrap="True" OnSelectedNodeChanged="TreeView1_SelectedNodeChanged"
                                                    ShowLines="True" Width="220">
                                                    <RootNodeStyle CssClass="rootNode" />
                                                    <NodeStyle CssClass="treeNode" />
                                                    <LeafNodeStyle CssClass="leafNode" />
                                                    <SelectedNodeStyle CssClass="selectNode" ForeColor="Red" />
                                                </asp:TreeView>
                                            </td>
                                            <td valign="top" width="165" style="padding: 5px 5px 0px 5px; border-right: solid 1px #D8D8D8;">
                                                <table style="width: 100%;">
                                                    <tr>
                                                        <td style="width: 100%; text-align: center;">
                                                            <asp:Button ID="BT_AllTask" runat="server" CssClass="inpuLong" Text="<%$ Resources:lang,SuoYouRenWu%>" OnClick="BT_AllTask_Click" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="text-align: center" valign="top">
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
                                                                                        <asp:Label ID="LB_DepartmentMember" runat="server" Text="<%$ Resources:lang,DepartmentMember%>"></asp:Label></strong>
                                                                                </td>
                                                                            </tr>
                                                                        </table>
                                                                    </td>
                                                                    <td width="6" align="right">
                                                                        <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" />
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                            <asp:DataGrid ID="DataGrid1" runat="server" AutoGenerateColumns="False" OnItemCommand="DataGrid1_ItemCommand"
                                                                Width="100%" CellPadding="4" ForeColor="#333333" GridLines="None" ShowHeader="false">
                                                                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                                <EditItemStyle BackColor="#2461BF" />
                                                                <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                                                <Columns>
                                                                    <asp:TemplateColumn HeaderText="Resources.lang.ZZXMZY">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" />
                                                                        <ItemTemplate>
                                                                            <asp:Button ID="BT_UserCode" runat="server" CssClass="inpu" Style="text-align: center"
                                                                                Text='<%# DataBinder.Eval(Container.DataItem,"UserCode") %>' />
                                                                            <asp:Button ID="BT_UserName" runat="server" CssClass="inpu" Style="text-align: center"
                                                                                Text='<%# DataBinder.Eval(Container.DataItem,"UserName") %>' />
                                                                        </ItemTemplate>
                                                                    </asp:TemplateColumn>
                                                                </Columns>
                                                            </asp:DataGrid>
                                                        </td>
                                                    </tr>

                                                    <tr>
                                                        <td style="text-align: left;">
                                                            <asp:Label ID="LB_DepartCode" runat="server" Visible="False"></asp:Label>
                                                            <asp:Label ID="LB_DepartName" runat="server" Visible="False"></asp:Label>
                                                            <asp:Label ID="LB_DepartString" runat="server" Visible="False"></asp:Label>
                                                            <asp:Label ID="LB_Operator" runat="server" Visible="False"></asp:Label>
                                                            <asp:Label ID="LB_UserCode" runat="server" Visible="False"></asp:Label>
                                                            <asp:Label ID="LB_UserName" runat="server" Visible="False"></asp:Label>
                                                            <asp:Label ID="LB_OperatorCode" runat="server" Visible="False"></asp:Label>
                                                            <asp:Label ID="LB_OperatorName" runat="server" Visible="False"></asp:Label>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                            <td align="center" style="border-left: solid 1px #D8D8D8">
                                                <table width="98%" style="margin-top: 5px">
                                                    <tr>
                                                        <td style="width: 100%; vertical-align: top;">
                                                            <table cellpadding="0" cellspacing="0" width="100%">
                                                                <tr>
                                                                    <td align="left" class="formItemBgStyle" width="23%">
                                                                        <table background="ImagesSkin/main_n_bj.jpg" border="0" cellpadding="0" cellspacing="0"
                                                                            width="100%">
                                                                            <tr>
                                                                                <td width="7">
                                                                                    <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" /></td>
                                                                                <td>
                                                                                    <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                                                        <tr>
                                                                                            <td align="center" width="100%">
                                                                                                <strong>
                                                                                                    <asp:Label ID="Label9" runat="server" Text="<%$ Resources:lang,DaiChuLiDD %>"></asp:Label>
                                                                                                </strong>
                                                                                            </td>
                                                                                        </tr>
                                                                                        <tr style="display: none;">
                                                                                            <td align="center" width="100%">
                                                                                                <asp:Label ID="LB_TaskRecordStatus_ToBeHandled" runat="server" CssClass="StatusCss" Text="待处理"></asp:Label>
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
                                                                        <div id="div_task" class="bian" style="border-collapse: collapse; width: 97%; border: dotted; border-radius: 3px 4px; border-color: lightblue;">

                                                                            <a href='TTTaskDetail.aspx?ID=<%#DataBinder.Eval(Container.DataItem, "ID")%>' target="_blank">
                                                                                <span style="color:lightgreen;">#<%#DataBinder.Eval(Container.DataItem, "ID")%></span>&nbsp;&nbsp;<asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,MingCheng%>"></asp:Label>： <%#DataBinder.Eval(Container.DataItem, "Operation")%><br />
                                                                                <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,FenPaiRen%>"></asp:Label>：<%#DataBinder.Eval(Container.DataItem, "AssignManName")%>

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
                                                                        <div id="div_task" class="bian" style="border-collapse: collapse; width: 97%; border: dotted; border-radius: 3px 4px; border-color: lightcoral;">
                                                                            <a href='TTTaskDetail.aspx?ID=<%#DataBinder.Eval(Container.DataItem, "ID")%>' target="_blank">
                                                                                <span style="color: lightgreen;">#<%#DataBinder.Eval(Container.DataItem, "ID")%> </span>&nbsp;&nbsp;<asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,MingCheng%>"></asp:Label>： <%#DataBinder.Eval(Container.DataItem, "Operation")%><br />
                                                                                <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,FenPaiRen%>"></asp:Label>：<%#DataBinder.Eval(Container.DataItem, "AssignManName")%>
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
                                                                        <div id="div_task" class="bian" style="border-collapse: collapse; width: 97%; border: dotted; border-radius: 3px 4px; border-color: orange;">
                                                                            <a href='TTTaskDetail.aspx?ID=<%#DataBinder.Eval(Container.DataItem, "ID")%>' target="_blank">
                                                                                <span style="color: lightgreen;">#<%#DataBinder.Eval(Container.DataItem, "ID")%></span>&nbsp;&nbsp;<asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,MingCheng%>"></asp:Label>： <%#DataBinder.Eval(Container.DataItem, "Operation")%><br />
                                                                                <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,FenPaiRen%>"></asp:Label>：<%#DataBinder.Eval(Container.DataItem, "AssignManName")%>
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
                                                                        <div id="div_task" class="bian" style="border-collapse: collapse; width: 97%; border: dotted; border-radius: 3px 4px; border-color: lightgreen;">
                                                                            <a href='TTTaskDetail.aspx?ID=<%#DataBinder.Eval(Container.DataItem, "ID")%>' target="_blank">
                                                                                <span style="color: lightgreen;">#<%#DataBinder.Eval(Container.DataItem, "ID")%></span>&nbsp;&nbsp;<asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,MingCheng%>"></asp:Label>： <%#DataBinder.Eval(Container.DataItem, "Operation")%><br />
                                                                                <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,FenPaiRen%>"></asp:Label>：<%#DataBinder.Eval(Container.DataItem, "AssignManName")%>
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
