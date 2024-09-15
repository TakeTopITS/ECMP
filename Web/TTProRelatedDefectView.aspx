<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTProRelatedDefectView.aspx.cs" Inherits="TTProRelatedDefectView" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link id="mainCss" href="css/bluelightmain.css" rel="stylesheet" type="text/css" />

    <script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="js/allAHandler.js"></script>
    <script type="text/javascript" language="javascript">
        $(function () { if (top.location != self.location) { } else { CloseWebPage(); }



        });

    </script>

</head>
<body>
    <form id="form1" runat="server">

        <table cellpadding="0" cellspacing="0" width="100%" class="bian">
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
                                            <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,XiangGuanXuQiu%>"></asp:Label>
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
                <td>
                    <table style="width: 98%;" align="center">
                        <tr>
                            <td style="width: 800px; text-align: right;">
                                <asp:Label ID="LB_UserCode" runat="server" Visible="False"></asp:Label>
                                <asp:Label ID="LB_UserName"
                                    runat="server"  Height="20px"  Width="70px"
                                    Visible="False"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 100%">
                                <asp:DataList ID="DataList1" runat="server" Width="100%" CellPadding="0" ForeColor="#333333">
                                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                    
                                    <ItemStyle CssClass="itemStyle" />
                                    <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                    <ItemTemplate>
                                        <table style="width: 100%;" class="bian" cellpadding="4">
                                            <tr>
                                                <td style="width: 15%; text-align: right;">
                                                    <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,BianHao%>"></asp:Label>：
                                                </td>
                                                <td style="width: 15%; text-align: left;">
                                                    <%#DataBinder .Eval (Container .DataItem ,"DefectID") %>
                                                </td>
                                                <td style="width: 15%; text-align: right;">
                                                    <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,LeiXing%>"></asp:Label>
                                                    ：
                                                </td>
                                                <td style="text-align: left; width: 15%">
                                                    <%#DataBinder .Eval (Container .DataItem ,"DefectType") %>
                                                </td>
                                                <td style="text-align: right; width: 10%;">
                                                    <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,ShenQingRen%>"></asp:Label>：
                                                </td>
                                                <td style="text-align: left; width: 30%">
                                                    <a href='TTUserInforSimple.aspx?UserCode=<%#DataBinder .Eval (Container .DataItem ,"ApplicantCode") %>'
                                                        target="_blank">
                                                        <%#DataBinder .Eval (Container .DataItem ,"ApplicantName") %>
                                                    </a>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="text-align: right; height: 21px;">
                                                    <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,MingCheng%>"></asp:Label>：
                                                </td>
                                                <td colspan="5" style="height: 21px; text-align: left;">
                                                    <%#DataBinder .Eval (Container .DataItem ,"DefectName") %>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="text-align: right;">
                                                    <asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,MiaoShu%>"></asp:Label>：
                                                </td>
                                                <td colspan="5" style="text-align: left">
                                                    <%#DataBinder .Eval (Container .DataItem ,"DefectDetail") %>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="text-align: right;">
                                                    <asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,YanShouBiaoZhun%>"></asp:Label>：
                                                </td>
                                                <td colspan="5" style="text-align: left">
                                                    <%#DataBinder .Eval (Container .DataItem ,"AcceptStandard") %>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="height: 20px; text-align: right;">
                                                    <asp:Label ID="Label8" runat="server" Text="<%$ Resources:lang,YaoQiuWanChengRiQi%>"></asp:Label>：
                                                </td>
                                                <td style="height: 20px; text-align: left;">
                                                    <%#DataBinder .Eval (Container .DataItem ,"DefectFinishedDate","{0:yyyy/MM/dd}") %>
                                                </td>
                                                <td style="height: 20px; text-align: right;">
                                                    <asp:Label ID="Label9" runat="server" Text="<%$ Resources:lang,JianLiRiQi%>"></asp:Label>：
                                                </td>
                                                <td style="height: 20px; text-align: left; width: 212px;">
                                                    <%#DataBinder .Eval (Container .DataItem ,"MakeDate","{0:yyyy/MM/dd}") %>
                                                </td>
                                                <td></td>
                                                <td></td>
                                            </tr>
                                            <tr>
                                                <td style="height: 20px; text-align: right;">
                                                    <asp:Label ID="Label12" runat="server" Text="<%$ Resources:lang,ZhuangTai%>"></asp:Label>：
                                                </td>
                                                <td style="height: 20px; text-align: left;">
                                                    <%#DataBinder .Eval (Container .DataItem ,"Status") %>
                                                </td>
                                                <td style="height: 20px; text-align: right;">
                                                    <a href="TTDocumentTreeView.aspx?RelatedType=Defect&RelatedID=<%#DataBinder .Eval (Container .DataItem ,"DefectID")%>"
                                                        target="_blank">
                                                        <asp:Label ID="Label10" runat="server" Text="<%$ Resources:lang,XiangGuanWenJian%>"></asp:Label></a>&nbsp;&nbsp;&nbsp;&nbsp;
                                                </td>
                                                <td style="height: 20px; text-align: left; width: 212px;">
                                                    <a href="TTDefectAssignRecord.aspx?DefectID=<%#DataBinder .Eval (Container .DataItem ,"DefectID")%>"
                                                        target="_blank">
                                                        <asp:Label ID="Label11" runat="server" Text="<%$ Resources:lang,FenPaiJiLu%>"></asp:Label></a>
                                                </td>
                                                <td>&nbsp;
                                                </td>
                                                <td>&nbsp;
                                                </td>
                                            </tr>
                                        </table>
                                    </ItemTemplate>
                                </asp:DataList>
                            </td>
                        </tr>
                    </table>
                    <br />
                </td>
            </tr>
        </table>
    </form>
</body>
<script type="text/javascript" language="javascript">var cssDirectory = '<%=Session["CssDirectory"] %>'; var oLink = document.getElementById('mainCss'); oLink.href = 'css/' + cssDirectory + '/' + 'bluelightmain.css';</script></html>
