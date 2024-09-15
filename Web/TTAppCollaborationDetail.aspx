<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTAppCollaborationDetail.aspx.cs" Inherits="TTAppCollaborationDetail" %>

<meta name="viewport" content="width=device-width; initial-scale=1.0; maximum-scale=1.0; user-scalable=1" />

<%@ Register Assembly="Brettle.Web.NeatUpload" Namespace="Brettle.Web.NeatUpload"
    TagPrefix="Upload" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc2" %>


<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link id="mainCss" href="css/bluelightmain.css" rel="stylesheet" type="text/css" />
    <link id="flxappCss" href="css/flxapp.css" rel="stylesheet" type="text/css" />


    <style type="text/css">
        body {
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

    <script language="javascript" type="text/javascript">

        function is_iPad() {
            var ua = navigator.userAgent.toLowerCase();
            if (ua.match(/iPad/i) == "ipad") {
                return true;
            } else {
                return false;
            }
        }
    </script>

    <script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="js/allAHandler.js"></script>
    <script type="text/javascript" language="javascript">
        $(function () {



        });

    </script>

</head>
<body>

    <form id="form1" runat="server">
        <%--  <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="True" EnableScriptLocalization="True">--%>
        <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="True" EnableScriptLocalization="True">
        </asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>

                <table style="width: 100%" cellpadding="0" cellspacing="0" align="center">
                    <tr>
                        <td height="31" class="page_topbj">
                            <table width="96%" border="0" align="center" cellpadding="0" cellspacing="0">
                                <tr>
                                    <td align="left">
                                        <a href="TTAppCollaboration.aspx" target="_parent" onclick="javascript:document.getElementById('IMG_Waiting').style.display = 'block';">

                                            <table width="245" border="0" align="left" cellpadding="0" cellspacing="0">
                                                <tr>
                                                    <td width="29">
                                                        <img src="ImagesSkin/return.png" alt="" />
                                                    </td>
                                                    <td align="center" background="ImagesSkin/main_top_bj.jpg" class="titleziAPP">
                                                        <asp:Label runat="server" Text="<%$ Resources:lang,Back%>" />
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
                        <td>

                            <table width="100%" cellpadding="3" cellspacing="0">
                                <tr>
                                    <td>
                                        <div class="napbox">
                                            <div class="npbx">
                                                <div class="cline"></div>

                                                <div class="mline" style="padding-left:5px;">
                                                    <h4></h4>
                                                  <asp:Label ID="LB_CollaborationName" runat="server"></asp:Label>
                                                    <asp:Label ID="LB_CoID" runat="server" Visible="false"></asp:Label>
                                                </div>

                                                <div class="mline">
                                                    <h4></h4>
                                                    <asp:Repeater ID="RP_Attendant" runat="server">
                                                        <ItemTemplate>
                                                            <asp:Button ID="BT_UserName" runat="server" CssClass="inpu" ForeColor="Black" Text='<%# DataBinder.Eval(Container.DataItem,"UserName") %>' />
                                                        </ItemTemplate>
                                                    </asp:Repeater>
                                                </div>

                                                <div class="npbxs">

                                                    <h3></h3>
                                                    <CKEditor:CKEditorControl ID="CKEditor1" runat="server" Toolbar="TextColor|BGColor|Bold|Font|FontSize|Image" Height="130px" Visible="False" Width="98%" />
                                                    <CKEditor:CKEditorControl ID="HTEditor1" runat="server" Height="170px" Style="width: 98%;" Visible="False" />
                                                </div>

                                                <div class="npbtn">
                                                    <asp:Button ID="BT_AddLog" runat="server" CssClass="inpu" OnClick="BT_AddLog_Click" Text="<%$ Resources:lang,FaSong%>" />
                                                    <asp:Button ID="BT_Close" runat="server" CssClass="inpu" OnClick="BT_Close_Click" Text="<%$ Resources:lang,GuanBiXieZuo%>" Visible="False" />
                                                    <asp:Button ID="BT_Active" runat="server" CssClass="inpu" OnClick="BT_Active_Click" Text="<%$ Resources:lang,JiHuoXieZuo%>" Visible="False" />
                                                    <br />

                                                </div>
                                            </div>
                                        </div>

                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>

                <table style="width: 100%;" cellpadding="2" cellspacing="0" class="formBgStyle">
                    <tr style="display: none;">
                        <td style="text-align: Right; vertical-align: middle;" class="formItemBgStyle">
                            <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,NeiRong%>"></asp:Label>： </td>
                        <td class="formItemBgStyle" align="left">
                            <div id="mess_box" style="width: 100%; height: 150px; overflow: auto;">
                                <asp:DataList ID="DataList1" runat="server" CellPadding="4" ForeColor="#333333" Width="100%">
                                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                    <ItemStyle CssClass="itemStyle" />
                                    <ItemTemplate>
                                        <table style="width: 100%; table-layout: fixed;">
                                            <tr>
                                                <td style="width: 100%;"><%# DataBinder.Eval(Container.DataItem, "Comment")%></td>
                                            </tr>
                                        </table>
                                    </ItemTemplate>
                                    <SelectedItemStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                </asp:DataList>
                            </div>
                        </td>
                    </tr>
                    <tr style="display: none;">
                        <td style="text-align: Right;" class="formItemBgStyle">
                            <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,ChuangJianZhe%>"></asp:Label>： </td>
                        <td style="text-align: left;" class="formItemBgStyle">
                            <asp:Label ID="LB_Creator" runat="server" Text="<%$ Resources:lang,ChuangJianShiJian%>"></asp:Label>：
                                                    <asp:Label ID="LB_CreateTime" runat="server" Text="<%$ Resources:lang,ZhuangTai%>"></asp:Label>：
                                                    <asp:Label ID="LB_Status" runat="server"></asp:Label>
                            <asp:HyperLink ID="HL_CollaborationToTask" runat="server" Enabled="False" NavigateUrl="~/CollaborationToTask">--&gt;<asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,ZhuanChengRenWu%>"></asp:Label></asp:HyperLink>
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

</body>
<script type="text/javascript" language="javascript">var cssDirectory = '<%=Session["CssDirectory"] %>'; var oLink = document.getElementById('mainCss'); oLink.href = 'css/' + cssDirectory + '/' + 'bluelightmain.css';</script>
</html>
