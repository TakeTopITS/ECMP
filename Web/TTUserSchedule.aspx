<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTUserSchedule.aspx.cs" Inherits="TTUserSchedule" %>

<%@ Register Assembly="NickLee.Web.UI" Namespace="NickLee.Web.UI" TagPrefix="NickLee" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>项目成员资料</title>
    <link id="mainCss" href="css/bluelightmain.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        #AboveDiv {
            min-width: 2500px;
            width: expression (document.body.clientWidth <= 2500? "2500px" : "auto" ));
        }

        .auto-style1 {
            /*border-bottom:dotted  1px #C6CFD4;
        height: 19px;
        line-height: 18px;*/
            border-bottom: 1px dotted #cccccc;
            background-color: #fff;
            background-repeat: no-repeat;
            padding-top: 10px;
            height: 41px;
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
            <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="True" EnableScriptLocalization="True">
            </asp:ScriptManager>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <table style="width: 800px; text-align: left;" align="left">
                        <tr>
                            <td>
                                <table width="98%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                    <tr>
                                        <td width="7">
                                            <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" /></td>
                                        <td>
                                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                <tr>
                                                    <td width="10%" align="center">
                                                        <strong>ID</strong>
                                                    </td>

                                                    <td width="30%" align="center">
                                                        <strong>
                                                            <asp:Label ID="Label3" runat="server" Text="班次名称"></asp:Label></strong>
                                                    </td>

                                                    <td align="center" width="20%"><strong>
                                                        <asp:Label ID="Label268" runat="server" Text="上班开始时间"></asp:Label>
                                                    </strong></td>
                                                    <td align="center" width="20%"><strong>
                                                        <asp:Label ID="Label269" runat="server" Text="下班结束时间"></asp:Label>
                                                    </strong></td>

                                                    <td align="center" width="20%"><strong>
                                                        <asp:Label ID="Label10" runat="server" Text="<%$ Resources:lang,YunXiZuiDaJuLi%>"></asp:Label>
                                                    </strong>(<asp:Label ID="Label56" runat="server" Text="<%$ Resources:lang,Mi%>"></asp:Label>)</td>


                                                </tr>
                                            </table>
                                        </td>
                                        <td width="6" align="right">
                                            <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" /></td>
                                    </tr>
                                </table>
                                <asp:DataGrid ID="DataGrid3" runat="server" AutoGenerateColumns="False" CellPadding="4" ShowHeader="false"
                                    ForeColor="#333333" GridLines="None" OnItemCommand="DataGrid3_ItemCommand" PageSize="20"
                                    Width="98%">
                                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                    <EditItemStyle BackColor="#2461BF" />
                                    <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                    <PagerStyle HorizontalAlign="Center" />

                                    <ItemStyle CssClass="itemStyle" />
                                    <Columns>
                                        <asp:TemplateColumn HeaderText="ID">
                                            <ItemTemplate>
                                                <asp:Button ID="BT_ID" runat="server" CssClass="inpu" Text='<%# DataBinder.Eval(Container.DataItem,"ID") %>' />
                                            </ItemTemplate>
                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="20%" />
                                        </asp:TemplateColumn>

                                        <asp:BoundColumn DataField="ScheduleName" HeaderText="班次名称">
                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="30%" />
                                        </asp:BoundColumn>

                                        <asp:BoundColumn DataField="CheckInStart" HeaderText="上班开始时间">
                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="20%" />
                                        </asp:BoundColumn>
                                        <asp:BoundColumn DataField="CheckInEnd" HeaderText="上班结束时间">
                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="20%" />
                                        </asp:BoundColumn>

                                        <asp:BoundColumn DataField="LargestDistance" HeaderText="允许最大距离">
                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="20%" />
                                        </asp:BoundColumn>

                                    </Columns>
                                </asp:DataGrid>
                            </td>
                        </tr>
                    </table>
                    <table width="98%" cellpadding="3" cellspacing="0" class="formBgStyle">
                        <tr>
                            <td align="left" colspan="3" class="formItemBgStyle">
                                <asp:Label ID="Label21" runat="server" Text="<%$ Resources:lang,BianHao%>"></asp:Label>：<asp:Label ID="LB_ID" runat="server"></asp:Label>
                                &nbsp;<asp:Label ID="Label1" runat="server" Text="班次名称"></asp:Label>
                                <asp:TextBox ID="tb_Name" runat="server" Width="50px"></asp:TextBox>
                                &nbsp;<asp:Label ID="Label285" runat="server" Text="上班开始时间"></asp:Label>
                                <asp:TextBox ID="TB_CheckInStart" runat="server" Width="50px"></asp:TextBox>
                                &nbsp;<asp:Label ID="Label286" runat="server" Text="下班结束时间"></asp:Label>
                                <asp:TextBox ID="TB_CheckInEnd" runat="server" Width="50px"></asp:TextBox>
                                &nbsp;<asp:Label ID="Label13" runat="server" Text="<%$ Resources:lang,Longitude%>"></asp:Label>
                                <asp:TextBox ID="TB_Longitude" runat="server" Width="100px"></asp:TextBox>
                                <asp:Label ID="Label14" runat="server" Text="<%$ Resources:lang,Latitude%>"></asp:Label>
                                <asp:TextBox ID="TB_Latitude" runat="server" Width="100px"></asp:TextBox>
                                <a class="titleSpan" href="http://api.map.baidu.com/lbsapi/getpoint/index.html">
                                    <img src="ImagesSkin/GPS.jpg" alt="取经纬度" width="20" height="20" style="border: 0px;">
                                </a>
                                &nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="Label2119" runat="server" Text="<%$ Resources:lang,YunXiZuiDaJuLi%>"></asp:Label>
                                <NickLee:NumberBox ID="NB_LargestDistance" runat="server" MaxAmount="1000000000000" MinAmount="-1000000000000" Width="80px">0.00</NickLee:NumberBox>
                                <asp:Label ID="Label11" runat="server" Text="<%$ Resources:lang,Mi%>"></asp:Label>
                            </td>

                        </tr>
                        <tr>
                            <td style="text-align: Left;" class="formItemBgStyle">
                                <asp:Button ID="BT_AddUserAttendanceRule" runat="server" CssClass="inpu"
                                    OnClick="BT_AddUserAttendanceRule_Click" Text="<%$ Resources:lang,XinZeng%>" />
                                &nbsp;<asp:Button ID="BT_UpdateUserAttendanceRule" runat="server" CssClass="inpu"
                                    Enabled="False" OnClick="BT_UpdateUserAttendanceRule_Click" Text="<%$ Resources:lang,BaoCun%>" />
                                &nbsp;<asp:Button ID="BT_DeleteUserAttendanceRule" runat="server" CssClass="inpu"
                                    Enabled="False" OnClick="BT_DeleteUserAttendanceRule_Click" OnClientClick="return confirm(getDeleteMsgByLangCode())" Text="<%$ Resources:lang,ShanChu%>" />
                            </td>
                            <td style="text-align: Right;" width="130px" class="formItemBgStyle"></td>
                            <td style="text-align: left;" width="130px" class="formItemBgStyle"></td>
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
