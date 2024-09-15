<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTMakeBookInfoDetail.aspx.cs" Inherits="TTMakeBookInfoDetail" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link id="mainCss" href="css/bluelightmain.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        #AboveDiv {
            min-width: 1200px;
            width: expression (document.body.clientWidth <= 1200? "1200px" : "auto" ));
        }
        </style>
    <script src="js/jquery-1.7.2.min.js" type="text/javascript"></script>
    <script src="js/allAHandler.js" type="text/javascript"></script>
    <script language="javascript" type="text/javascript">
        $(function () { if (top.location != self.location) { } else { CloseWebPage(); }
            
        });
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="True" EnableScriptLocalization="True">
        </asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <div id="AboveDiv">
                    <table id="AboveTable" cellpadding="0" width="100%" cellspacing="0" class="bian">
                        <tr>
                            <td>
                                <table cellpadding="0" cellspacing="0" width="100%">
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
                                                                    <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,JiBenXinXi%>"></asp:Label>
                                                                </td>
                                                                <td width="5">
                                                                    <%--<img src="ImagesSkin/main_top_r.jpg" width="5" height="31" alt="" />--%>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td valign="top">
                                            <table width="100%" cellpadding="0" cellspacing="0">
                                                <tr>
                                                    <td>
                                                        <table style="width: 100%;">
                                                            <tr>
                                                                <td class="formItemBgStyle" style="text-align: center">
                                                                    <asp:Label ID="lbl_Title" runat="server" Font-Bold="True" Font-Size="X-Large"></asp:Label>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td style="text-align: left; padding-top: 5px;" valign="top">
                                                                    <table width="100%">
                                                                        <tr>
                                                                            <td valign="top" rowspan="8" class="formItemBgStyle" style="text-align: center">
                                                                                <asp:Panel ID="Panel_Book" runat="server">
                                                                                <img alt="" src="<%= strBookImage %>" width="180px" height="220px" /></asp:Panel>
                                                                            </td>
                                                                            <td class="formItemBgStyle" style="text-align: right">
                                                                                <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,BianHao%>"></asp:Label>：</td>
                                                                            <td class="formItemBgStyle" style="text-align: left">
                                                                                <asp:Label ID="lbl_BarCode" runat="server"></asp:Label>
                                                                            </td>
                                                                            <td class="formItemBgStyle" style="text-align: right">
                                                                                <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,MingCheng%>"></asp:Label>：</td>
                                                                            <td class="formItemBgStyle" style="text-align: left">
                                                                                <asp:Label ID="lbl_BookName" runat="server"></asp:Label>
                                                                            </td>
                                                                            <td class="formItemBgStyle" style="text-align: right">
                                                                                <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,JianSuoHao%>"></asp:Label>：</td>
                                                                            <td class="formItemBgStyle" style="text-align: left">
                                                                                <asp:Label ID="lbl_ReferenceNo" runat="server"></asp:Label>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td class="formItemBgStyle" style="text-align: right">
                                                                                <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,FenLei%>"></asp:Label>：</td>
                                                                            <td class="formItemBgStyle" style="text-align: left">
                                                                                <asp:Label ID="lbl_BookClassificationName" runat="server"></asp:Label>
                                                                            </td>
                                                                            <td class="formItemBgStyle" style="text-align: right">
                                                                                <asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,ChuBanShe%>"></asp:Label>：</td>
                                                                            <td class="formItemBgStyle" style="text-align: left">
                                                                                <asp:Label ID="lbl_BookPublishersName" runat="server"></asp:Label>
                                                                            </td>
                                                                            <td class="formItemBgStyle" style="text-align: right">
                                                                                <asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,ZhuZuoZhe%>"></asp:Label>：</td>
                                                                            <td class="formItemBgStyle" style="text-align: left">
                                                                                <asp:Label ID="lbl_Author" runat="server"></asp:Label>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td class="formItemBgStyle" style="text-align: right">
                                                                                <asp:Label ID="Label8" runat="server" Text="<%$ Resources:lang,BanBen%>"></asp:Label>：</td>
                                                                            <td class="formItemBgStyle" style="text-align: left">
                                                                                <asp:Label ID="lbl_Version" runat="server"></asp:Label>
                                                                            </td>
                                                                            <td class="formItemBgStyle" style="text-align: right">
                                                                                <asp:Label ID="Label9" runat="server" Text="<%$ Resources:lang,XianYouCunLiang%>"></asp:Label>：</td>
                                                                            <td class="formItemBgStyle" style="text-align: left">
                                                                                <asp:Label ID="lbl_BookNum" runat="server"></asp:Label>
                                                                            </td>
                                                                            <td class="formItemBgStyle" style="text-align: right">
                                                                                <asp:Label ID="Label10" runat="server" Text="<%$ Resources:lang,YiZhe%>"></asp:Label>：</td>
                                                                            <td class="formItemBgStyle" style="text-align: left">
                                                                                <asp:Label ID="lbl_Translator" runat="server"></asp:Label>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td class="formItemBgStyle" style="text-align: right">
                                                                                <asp:Label ID="Label11" runat="server" Text="<%$ Resources:lang,JiaGe%>"></asp:Label>：</td>
                                                                            <td class="formItemBgStyle" style="text-align: left">
                                                                                <asp:Label ID="lbl_Price" runat="server"></asp:Label>
                                                                            </td>
                                                                            <td class="formItemBgStyle" style="text-align: right">
                                                                                <asp:Label ID="Label12" runat="server" Text="<%$ Resources:lang,JieChuShuLiang%>"></asp:Label>：</td>
                                                                            <td class="formItemBgStyle" style="text-align: left">
                                                                                <asp:Label ID="lbl_BookUseNum" runat="server"></asp:Label>
                                                                            </td>
                                                                            <td class="formItemBgStyle" style="text-align: right">
                                                                                <asp:Label ID="Label13" runat="server" Text="<%$ Resources:lang,JieYueCiShu%>"></asp:Label>：</td>
                                                                            <td class="formItemBgStyle" style="text-align: left">
                                                                                <asp:Label ID="lbl_UseNum" runat="server"></asp:Label>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td class="formItemBgStyle" style="text-align: right">
                                                                                <asp:Label ID="Label14" runat="server" Text="<%$ Resources:lang,ChuBanShiShiShiJian%>"></asp:Label>：</td>
                                                                            <td class="formItemBgStyle" style="text-align: left">
                                                                                <asp:Label ID="lbl_PublicationDate" runat="server"></asp:Label>
                                                                            </td>
                                                                            <td class="formItemBgStyle" style="text-align: right">
                                                                                <asp:Label ID="Label15" runat="server" Text="<%$ Resources:lang,ZhuangTai%>"></asp:Label>：</td>
                                                                            <td class="formItemBgStyle" style="text-align: left">
                                                                                <asp:Label ID="lbl_Status" runat="server"></asp:Label>
                                                                            </td>
                                                                            <td class="formItemBgStyle" style="text-align: right">
                                                                                <asp:Label ID="Label16" runat="server" Text="<%$ Resources:lang,GuiShuBuMen%>"></asp:Label>：</td>
                                                                            <td class="formItemBgStyle" style="text-align: left">
                                                                                <asp:Label ID="lbl_DepartCodeName" runat="server"></asp:Label>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td class="formItemBgStyle" style="text-align: right">
                                                                                <asp:Label ID="Label17" runat="server" Text="<%$ Resources:lang,CunFangWeiZhi%>"></asp:Label>：</td>
                                                                            <td colspan="3" class="formItemBgStyle" style="text-align: left">
                                                                                <asp:Label ID="lbl_Location" runat="server"></asp:Label>
                                                                            </td>
                                                                            <td class="formItemBgStyle" style="text-align: right">&nbsp;</td>
                                                                            <td class="formItemBgStyle" style="text-align: left">
                                                                                &nbsp;</td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td class="formItemBgStyle" style="text-align: right">
                                                                                <asp:Label ID="Label18" runat="server" Text="<%$ Resources:lang,JianJie%>"></asp:Label>：</td>
                                                                            <td colspan="5" class="formItemBgStyle" style="text-align: left">
                                                                                <asp:Label ID="lbl_Introduction" runat="server"></asp:Label>
                                                                                <asp:Label ID="lbl_PageNum" runat="server" Visible="False"></asp:Label>
                                                                                <asp:Label ID="lbl_Source" runat="server" Visible="False"></asp:Label>
                                                                                <asp:Label ID="lbl_Donors" runat="server" Visible="False"></asp:Label>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <asp:Panel ID="Panel_Stand" runat="server">
                                                                            <td class="formItemBgStyle" style="text-align: right">
                                                                                <asp:Label ID="Label19" runat="server" Text="<%$ Resources:lang,MeiTiZhuangTai%>"></asp:Label>：</td>
                                                                            <td class="formItemBgStyle" colspan="5" style="text-align: left">
                                                                                <asp:HyperLink ID="HyperLink1" runat="server">
                                                                                    <asp:Label ID="Label20" runat="server" Text="<%$ Resources:lang,DianJiXiaZai%>"></asp:Label></asp:HyperLink></td></asp:Panel>
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
<script type="text/javascript" language="javascript">var cssDirectory = '<%=Session["CssDirectory"] %>'; var oLink = document.getElementById('mainCss'); oLink.href = 'css/' + cssDirectory + '/' + 'bluelightmain.css';</script></html>
