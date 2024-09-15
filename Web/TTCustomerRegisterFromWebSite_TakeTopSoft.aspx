<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTCustomerRegisterFromWebSite_TakeTopSoft.aspx.cs" Inherits="TTCustomerRegisterFromWebSite_TakeTopSoft" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<meta name="viewport" content="width=device-width; initial-scale=1.0; maximum-scale=1.0; user-scalable=1" />

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>在线试用</title>
    <link id="mainCss" href="css/cssGreen/bluelightmain.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        body {
            /*margin-top: 5px;*/
            /*background-image: url(Images/login_bj.jpg);*/
            background-repeat: repeat-x;
            font: normal 100% Helvetica, Arial, sans-serif;
            text-decoration: none;
        }


        a {
            text-decoration: none;
            color: black;
        }

            a:visited {
                text-decoration: none;
            }

            a:hover {
                text-decoration: underline;
            }

            a:active {
                text-decoration: underline;
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

    <script type="text/javascript" language="javascript">
        $(function () {
        });


        function openMDIFrom(strMDIPageName) {

            window.open(strMDIPageName, '_blank');

            CloseLayer();

        }

    </script>

</head>
<body>
    <center>
        <form id="form1" runat="server">
            <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="True" EnableScriptLocalization="True">
            </asp:ScriptManager>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <div id="#AboveDiv" style="position: relative; top: 30px;">

                        <table style="width: 100%">
                            <tr>
                                <td style="height: 40px; padding-top :20px; text-align: center;" >&nbsp; &nbsp; &nbsp; &nbsp;
                                    <asp:Label ID="Label18" runat="server" Text="<%$ Resources:lang,QXTXYXXXD%>"></asp:Label><font color="#FF0000">*</font>
                                    <asp:Label ID="Label19" runat="server" Text="<%$ Resources:lang,HMWBTXRHDJZCANXTJZJDNDSYYM%>"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td align="center" style="padding-top :15px;" >
                                  <table border="0" cellpadding="0" cellspacing="3" class="zi" style="width: 100%; text-align: left;">
                                        <tr>
                                            <td align="right" class="formItemBgStyle" style="width: 27%;">
                                                <asp:Label ID="Label20" runat="server" Text="<%$ Resources:lang,ChanPing%>"></asp:Label>：
                                            </td>
                                            <td class="formItemBgStyle">
                                                <asp:Label ID="LB_Product" runat="server"></asp:Label>
                                                <br />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right" class="formItemBgStyle">
                                                <asp:Label ID="Label22" runat="server" Text="<%$ Resources:lang,DanWei%>"></asp:Label>：</td>
                                            <td class="formItemBgStyle" w>
                                                <asp:TextBox ID="TB_Company" runat="server" Style="width: 90%; height: 25px;font-size: 16px;"></asp:TextBox>
                                                <font color="#FF0000">&nbsp;*</font>

                                            </td>

                                            <tr>
                                                <td align="right" class="formItemBgStyle">
                                                    <asp:Label ID="Label11" runat="server" Text="<%$ Resources:lang,LianXiRen%>"></asp:Label>：</td>
                                                <td class="formItemBgStyle">
                                                    <asp:TextBox ID="TB_ContactPerson" runat="server" Style="width: 90%; height: 25px; font-size: 16px;"></asp:TextBox>
                                                    &nbsp;<font color="#FF0000">*</font> </td>

                                            </tr>
                                            <tr>
                                                <td align="right" class="formItemBgStyle">
                                                    <asp:Label ID="Label12" runat="server" Text="<%$ Resources:lang,LianXiDianHua%>"></asp:Label>：</td>
                                                <td class="formItemBgStyle">
                                                    <asp:TextBox ID="TB_PhoneNumber" runat="server" Style="width: 90%; height: 25px;font-size: 16px;"></asp:TextBox>
                                                    <font color="#FF0000">&nbsp;*</font>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="right" class="formItemBgStyle" valign="top">
                                                    <asp:Label ID="Label16" runat="server" Text="<%$ Resources:lang,ShiYongYuanYin%>"></asp:Label>：</td>
                                                <td class="formItemBgStyle">
                                                    <asp:DropDownList ID="DL_Description" Height="35px" Style="font-size: 16px;" runat="server">
                                                        <asp:ListItem Text="<%$ Resources:lang,QiYeXuQiu%>" Value="企业需求" />
                                                        <asp:ListItem Text="<%$ Resources:lang,GeRenXueXi%>" Value="个人学习" />
                                                        <asp:ListItem Text="<%$ Resources:lang,QiTaYuanYin%>" Value="其它原因" />
                                                    </asp:DropDownList>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="right" class="formItemBgStyle" valign="top">
                                                    <asp:Label ID="Label17" runat="server" Text="<%$ Resources:lang,YanZhengMa%>"></asp:Label>：</td>
                                                <td align="left" class="formItemBgStyle">
                                                    <table>
                                                        <tr>
                                                            <td>
                                                                <asp:TextBox ID="TB_CheckCode" runat="server" Style="width: 100px; height: 35px;font-size: 16px;"></asp:TextBox>
                                                            </td>
                                                            <td>
                                                                <asp:Image ID="IM_CheckCode" runat="server" src="TTCheckCode.aspx" Width="100px" Height="35px" />
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="formItemBgStyle"></td>
                                                <td class="formItemBgStyle">
                                                    <asp:Button ID="BT_Summit" runat="server" Width="100px" Height="35px" OnClick="BT_Summit_Click"  Text="<%$ Resources:lang,TiJiao%>" />
                                                    <asp:Label ID="LB_Message" runat="server" ForeColor="Red"></asp:Label>
                                                </td>
                                            </tr>
                                            <tr style="display: none;">
                                                <td align="right" class="formItemBgStyle">
                                                    <asp:Label ID="Label13" runat="server" Text="<%$ Resources:lang,Email%>"></asp:Label>
                                                    ： </td>
                                                <td class="formItemBgStyle">
                                                    <asp:TextBox ID="TB_EMail" runat="server" Style="width: 90%;"></asp:TextBox>
                                                    &nbsp;<font color="#FF0000">*</font> </td>
                                            </tr>
                                            <tr style="display: none;">
                                                <td align="right" class="formItemBgStyle">
                                                    <asp:Label ID="Label14" runat="server" Text="<%$ Resources:lang,LianXiDiZhi%>"></asp:Label>
                                                    ： </td>
                                                <td class="formItemBgStyle">
                                                    <asp:TextBox ID="TB_Address" runat="server" Style="width: 90%;"></asp:TextBox>
                                                    <font color="#FF0000">&nbsp;*</font> </td>
                                            </tr>

                                            <tr style="display: none;">
                                                <td align="right" class="formItemBgStyle">
                                                    <asp:Label ID="Label15" runat="server" Text="<%$ Resources:lang,YouBian%>"></asp:Label>
                                                    ： </td>
                                                <td class="formItemBgStyle">
                                                    <asp:TextBox ID="TB_PostCode" runat="server" Style="width: 90%; height: 25px;"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="2" align="center" class="formItemBgStyle">
                                                    <a href="tencent://message/?uin=3166455252&amp;Site=&amp;Menu=yes" ><img align="absmiddle" src="images/qq.png" />客服QQ</a>，电话：<a class="call" href="tel:02151085119" >021-51085119</a>
                                                </td>
                                            </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </div>
                    <br />
                    <br />
                </ContentTemplate>
            </asp:UpdatePanel>
            <div style="position: absolute; left: 50%; top: 50%;">
                <asp:UpdateProgress ID="TakeTopUp" runat="server" AssociatedUpdatePanelID="UpdatePanel1">
                    <ProgressTemplate>
                     <img id="IMG_Waiting" src="Images/Logining.gif" alt="Logining,please wait..." style="text-align: center; " />

                    </ProgressTemplate>
                </asp:UpdateProgress>
            </div>
        </form>
    </center>
</body>
<script type="text/javascript" language="javascript">var cssDirectory = '<%=Session["CssDirectory"] %>'; var oLink = document.getElementById('mainCss'); oLink.href = 'css/' + cssDirectory + '/' + 'bluelightmain.css';</script>
</html>
