<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTMyMemTask.aspx.cs" Inherits="TTMyMemTask" %>

<%@ Register Assembly="ZedGraph.Web" Namespace="ZedGraph.Web" TagPrefix="cc1" %>
<%@ Register Assembly="ZedGraph" Namespace="ZedGraph" TagPrefix="cc1" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc2" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>下属项目列表</title>
    <link id="mainCss" href="css/bluelightmain.css" rel="stylesheet" type="text/css" />
    <link id="layCss" href="js/layer-v3.0.1/layer/skin/default/layer.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        #AboveDiv {
            min-width: 1100px;
            width: expression (document.body.clientWidth <= 1100? "1100px" : "auto" ));
        }
    </style>
    <script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>

    <script type="text/javascript" src="js/layer/layer/layer.js"></script>
    <script type="text/javascript" src="js/popwindow.js"></script>

    <script type="text/javascript" src="js/allAHandler.js"></script>

    <script type="text/javascript" language="javascript">
        $(function () {
            if (top.location != self.location) { } else { CloseWebPage(); }
        });

        function AdjustDivHeight() {

            document.getElementById("Div_ToBeHandled").style.height = document.documentElement.clientHeight - 90 + "px";
            document.getElementById("Div_Handling").style.height = document.documentElement.clientHeight - 90 + "px";
            document.getElementById("Div_FinishedUnAssigned").style.height = document.documentElement.clientHeight - 90 + "px";
            document.getElementById("Div_Assigned").style.height = document.documentElement.clientHeight - 90 + "px";

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
                                                            <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,ZhiJieChenYuanDeRenWu%>"></asp:Label>
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
                                <td align="center" width="100%">
                                    <table cellpadding="0" cellspacing="0" width="100%">
                                        <tr>
                                            <td style="border-right: solid 1px #D8D8D8; padding: 5px 0px 0px 5px; overflow: auto;" onmousemove="document.getElementById('TreeView1').style.width = '170px'"
                                                onmouseout="document.getElementById('TreeView1').style.width = '10px'" valign="top" align="left">
                                                <asp:TreeView ID="TreeView1" runat="server" NodeWrap="True" OnSelectedNodeChanged="TreeView1_SelectedNodeChanged"
                                                    ShowLines="True" Width="10">
                                                    <RootNodeStyle CssClass="rootNode" />
                                                    <NodeStyle CssClass="treeNode" />
                                                    <LeafNodeStyle CssClass="leafNode" />
                                                    <SelectedNodeStyle CssClass="selectNode" ForeColor="Red" />
                                                </asp:TreeView>
                                            </td>
                                            <td valign="top" width="165" style="padding: 5px 5px 0px 5px; border-left: solid 1px #D8D8D8">
                                                <table width="100%">
                                                    <tr>
                                                        <td style="width: 100%; text-align: center;">
                                                            <asp:Button ID="BT_AllTasks" runat="server" CssClass="inpuLong" OnClick="BT_AllTasks_Click"
                                                                Text="<%$ Resources:lang,ChenYuanRenWu%>" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="width: 165;">
                                                            <table background="ImagesSkin/main_n_bj.jpg" border="0" cellpadding="0" cellspacing="0"
                                                                width="100%">
                                                                <tr>
                                                                    <td width="7">
                                                                        <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" />
                                                                    </td>
                                                                    <td>
                                                                        <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                                            <tr>
                                                                                <td align="center" width="10%">
                                                                                    <strong><strong>
                                                                                        <asp:Label ID="LB_DepartmentMember" runat="server" Text="<%$ Resources:lang,DepartmentMember%>"></asp:Label>
                                                                                    </strong></strong>
                                                                                </td>
                                                                            </tr>
                                                                        </table>
                                                                    </td>
                                                                    <td align="right" width="6">
                                                                        <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" />
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                            <asp:DataGrid ID="DataGrid1" runat="server" AutoGenerateColumns="False" BorderColor="#394f66"
                                                                CellPadding="4" ForeColor="#333333" GridLines="None" OnItemCommand="DataGrid1_ItemCommand"
                                                                ShowHeader="false" Width="100%">
                                                                <Columns>
                                                                    <asp:TemplateColumn HeaderText="直接成员：">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" />
                                                                        <ItemTemplate>
                                                                            <asp:Button ID="BT_UnderlingCode" runat="server" CssClass="inpu" 
                                                                                Style="text-align: right" Text='<%# DataBinder.Eval(Container.DataItem,"UserCode") %>' />
                                                                            <asp:Button ID="BT_UnderlingName" runat="server" CssClass="inpu" 
                                                                                Style="text-align: left" Text='<%# DataBinder.Eval(Container.DataItem,"UserName") %>' />
                                                                        </ItemTemplate>
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
<script type="text/javascript" language="javascript">var cssDirectory = '<%=Session["CssDirectory"] %>'; var oLink = document.getElementById('mainCss'); oLink.href = 'css/' + cssDirectory + '/' + 'bluelightmain.css';</script></html>
