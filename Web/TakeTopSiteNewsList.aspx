<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TakeTopSiteNewsList.aspx.cs" Inherits="TakeTopSiteNewsList" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

    <title></title>
    <link href="Logo/website/css/new.css" rel="stylesheet" type="text/css" />

    <script src="js/jquery-1.7.2.min.js" type="text/javascript"></script>
    <script src="js/allAHandler.js" type="text/javascript"></script>

    <style type="text/css">
        .ToolBarLeftRight {
            position: fixed !important;
            top: 250px;
            left: 0px;
            margin: 0 auto;
            position: absolute;
            top: expression(offsetParent.scrollTop+0);
            /*border: 1px solid #dddddd;*/
            background-color: white;
            width: 25px;
            height: 169px;
            z-index: 99999;
        }

        a:link {
            color: black;
            text-decoration: none;
            font-weight: 500;
            font-size: 14px;
            font-family: '-apple-system, BlinkMacSystemFont, "Segoe UI", Helvetica, Arial, "Apple Color Emoji", "Segoe UI Emoji", "Segoe UI Symbol", "Liberation Sans", "PingFang SC", "Microsoft YaHei", "Hiragino Sans GB", "Wenquanyi Micro Hei", "WenQuanYi Zen Hei", "ST Heiti", SimHei, SimSun, "WenQuanYi Zen Hei Sharp", sans-serif';
        }

        a:hover {
            color: #000000;
            text-decoration: none;
        }
    </style>

    <script type="text/javascript" language="javascript">
        $(function () {

            /*   aHandler();*/

        });

        function ChangeMenu(way) {

            if (way == 0) {

                window.parent.document.getElementById("TakeTopSiteMDI").cols = '0,*';

                return;
            }

            if (way == 1) {

                window.parent.document.getElementById("TakeTopSiteMDI").cols = '181,*';

                top.frames[2].document.all('divLeftBar').style.display = "none";
                top.frames[2].document.all('IM_RightToLeft').style.display = "none";

                return;
            }
        }

    </script>

</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="True" EnableScriptLocalization="True">
        </asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>

                <div id="divLeftBar" runat="server" class="ToolBarLeftRight" width="95%">
                    <table width="100%">
                        <tr>
                            <td width="100px" align="left">
                                <a href="javascript:ChangeMenu(1)">
                                    <asp:Image ID="IM_RightToLeft" ImageUrl="Logo/website/Images/tupian.png" Width="50" Height="169" border="0" alt="隐藏左边栏" runat="server" /></a>

                            </td>
                        </tr>
                    </table>
                </div>
                <div id="divBody" width="100%">
                    <table cellpadding="0" cellspacing="0" width="100%" class="bian">
                        <tr>
                            <td align="left" style="width: 100%; padding-left: 5px;">
                                <asp:DataGrid ID="DataGrid1" runat="server" AutoGenerateColumns="False" ShowHeader="false"
                                    Height="1px" Width="100%"
                                    CellPadding="4" ForeColor="#333333" GridLines="None">
                                    <Columns>
                                        <asp:BoundColumn DataField="ID" HeaderText="ID" Visible="False">
                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" />
                                        </asp:BoundColumn>
                                        <asp:TemplateColumn HeaderText="NewsTitle">
                                            <ItemTemplate>
                                                <a onclick="javascript:popShowByURL('TakeTopSiteNewsView.aspx?ID=<%# Eval("ID").ToString() %>','<%# Eval("Title").ToString() %>',800, 600,window.location);" target="_blank">
                                                  <%#this.DataGrid1.CurrentPageIndex * this.DataGrid1.PageSize + Container.ItemIndex +1%> 、 <%# Eval("Title").ToString() %>
                                                </a>
                                            </ItemTemplate>
                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="80%" />
                                        </asp:TemplateColumn>
                                        <asp:BoundColumn DataField="PublishTime" DataFormatString="{0:yyyy/MM/dd}" HeaderText="发布时间">
                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="20%" />
                                        </asp:BoundColumn>
                                    </Columns>
                                    <ItemStyle CssClass="itemStyle" />
                                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                    <EditItemStyle BackColor="#2461BF" />
                                    <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                    <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />
                                </asp:DataGrid>
                            </td>
                        </tr>
                    </table>
                </div>
                <div class="tupian">
                    <img src="Logo/website/Images/1.jpg" />
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

</body>
<script type="text/javascript" language="javascript">var cssDirectory = '<%=Session["CssDirectory"] %>'; var oLink = document.getElementById('mainCss'); oLink.href = 'css/' + cssDirectory + '/' + 'bluelightmain.css';</script>
</html>
