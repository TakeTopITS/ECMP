<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTItemBOMView.aspx.cs" Inherits="TTItemBOMView" %>


<%@ Register Assembly="NickLee.Web.UI" Namespace="NickLee.Web.UI" TagPrefix="NickLee" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link id="mainCss" href="css/bluelightmain.css" rel="stylesheet" type="text/css" />

    <style type="text/css">
        body {
            font-family: 微软雅黑,宋体;
            font-size: 1em;
        }

        .auto-style1 {
            /*border-bottom:dotted  1px #C6CFD4;
        height: 19px;
        line-height: 18px;*/
            background-color: #fff;
            background-repeat: no-repeat;
            padding-top: 10px;
            width: 100%;
        }
    </style>

    <script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="js/allAHandler.js"></script>
    <script type="text/javascript" language="javascript">
        $(function () { if (top.location != self.location) { } else { CloseWebPage(); }

            

        });

    </script>

</head>
<body>
    <center>
        <form id="form2" runat="server">
            <div style="position: relative; top: 50px;">
                <table style="width: 1080px;">
                    <tr>
                        <td style="width: 100%; height: 80px; font-size: xx-large; text-align: center;">
                            <table width="100%">
                                <tr>
                                    <td width="200px">
                                        <img src="Logo/FormLogo.png" /></td>
                                    <td width="550px" style="font-size: xx-large; text-align: center;">
                                        <br />
                                        <asp:Label ID="LB_ReportName" runat="server" Text="<%$ Resources:lang,CPWLQD%>"></asp:Label>&nbsp;BOM
                                        <br />
                                    </td>
                                    <td  style="font-size: x-small; text-align: center; vertical-align: bottom;">
                                        <table width="200" cellpadding="3" cellspacing="0" class="formBgStyle">
                                            <tr>
                                                <td width="80px" class="formItemBgStyle" align="center">File NO.</td>
                                                <td class="formItemBgStyle" align="center"></td>

                                            </tr>
                                            <tr>
                                                <td class="formItemBgStyle" >Edition</td>
                                                <td class="formItemBgStyle"></td>

                                            </tr>
                                            <tr>
                                                <td class="formItemBgStyle" >Date</td>
                                                <td class="formItemBgStyle" ></td>

                                            </tr>
                                            <tr>
                                                <td class="formItemBgStyle" >Page</td>
                                                <td class="formItemBgStyle" ></td>

                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                              
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: left; ">
                            <asp:Label ID="LB_ProductName" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td  style="text-align: left; width: 70%;">

                            <table align="center" cellpadding="0" cellspacing="0" width="100%">
                                <tr>
                                    <td align="right">
                                        <table background="ImagesSkin/main_n_bj.jpg" border="0" cellpadding="0" cellspacing="0"
                                            width="100%">
                                            <tr>
                                                <td width="7">
                                                    <img height="26" src="ImagesSkin/main_n_l.jpg" width="7" /></td>
                                                <td>
                                                    <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                        <tr>
                                                            <td align="center" width="7%"><strong>
                                                                <asp:Label ID="Label9" runat="server" Text="<%$ Resources:lang,DaiMa%>"></asp:Label></strong> </td>

                                                            <td align="center" width="9%"><strong>
                                                                <asp:Label ID="Label11" runat="server" Text="<%$ Resources:lang,MingCheng%>"></asp:Label></strong> </td>
                                                            <td align="center" width="10%"><strong>
                                                                <asp:Label ID="Label16" runat="server" Text="<%$ Resources:lang,XingHao%>"></asp:Label></strong> </td>
                                                            <td align="center" width="13%"><strong>
                                                                <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,GuiGe%>"></asp:Label></strong> </td>
                                                               <td align="center" width="10%"><strong>
                                                                <asp:Label ID="Label13" runat="server" Text="<%$ Resources:lang,PinPai%>"></asp:Label></strong> </td>
                                                            <td align="center" width="5%"><strong>
                                                                <asp:Label ID="Label12" runat="server" Text="<%$ Resources:lang,ShuLiang%>"></asp:Label></strong> </td>
                                                          
                                                            <td align="center" width="5%"><strong>
                                                                <asp:Label ID="Label14" runat="server" Text="<%$ Resources:lang,DanWei%>"></asp:Label></strong> </td>


                                                            <td align="center" width="10%"><strong>
                                                                <asp:Label ID="Label19" runat="server" Text="<%$ Resources:lang,BeiZhu%>"></asp:Label></strong> </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                                <td align="right" width="6">
                                                    <img alt="" height="26" src="ImagesSkin/main_n_r.jpg" width="6" /></td>
                                            </tr>
                                        </table>
                                        <asp:DataGrid ID="DataGrid1" runat="server" AutoGenerateColumns="False"
                                            CellPadding="4" ForeColor="#333333" GridLines="None" Height="1px"
                                            ShowHeader="False"
                                            Width="100%">
                                            
                                            <Columns>
                                                <asp:BoundColumn DataField="ItemCode" HeaderText="代码">
                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="7%" />
                                                </asp:BoundColumn>

                                                <asp:BoundColumn DataField="ItemName" HeaderText="名称">
                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="9%" />
                                                </asp:BoundColumn>

                                                <asp:BoundColumn DataField="ModelNumber" HeaderText="型号">
                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="10%" />
                                                </asp:BoundColumn>

                                                <asp:BoundColumn DataField="Specification" HeaderText="规格">
                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="13%" />
                                                </asp:BoundColumn>

                                                <asp:BoundColumn DataField="Brand" HeaderText="品牌">
                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="13%" />
                                                </asp:BoundColumn>

                                                <asp:BoundColumn DataField="Number" HeaderText="数量">
                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                </asp:BoundColumn>

                                                <asp:BoundColumn DataField="Unit" HeaderText="单位">
                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                </asp:BoundColumn>

                                                <asp:BoundColumn DataField="Comment" HeaderText="备注">
                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="10%" />
                                                </asp:BoundColumn>
                                            </Columns>
                                            <EditItemStyle BackColor="#2461BF" />
                                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                            <ItemStyle CssClass="itemStyle" />
                                            <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />
                                            <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                        </asp:DataGrid>

                                        <br />
                                        <table width="100%">
                                            <tr>
                                                <td align="left">
                                                    <table width="80%">
                                                        <tr>
                                                            <td class="formItemBgStyle" style="text-align: left;" width="150px">
                                                                <asp:Label ID="Label20" runat="server" Text="<%$ Resources:lang,ZhiDing%>"></asp:Label>：</td>
                                                            <td class="formItemBgStyle" style="text-align: left;"></td>
                                                            <td class="formItemBgStyle" style="text-align: left;" width="150px">
                                                                <asp:Label ID="Label21" runat="server" Text="<%$ Resources:lang,ShenHe%>"></asp:Label>：</td>
                                                            <td class="formItemBgStyle" style="text-align: left;"></td>
                                                            <td class="formItemBgStyle" style="text-align: left;" width="150px">
                                                                <asp:Label ID="Label22" runat="server" Text="<%$ Resources:lang,PiZhunRen%>"></asp:Label>：</td>
                                                            <td class="formItemBgStyle" style="text-align: left;"></td>
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
        </form>
    </center>
</body>
<script type="text/javascript" language="javascript">var cssDirectory = '<%=Session["CssDirectory"] %>'; var oLink = document.getElementById('mainCss'); oLink.href = 'css/' + cssDirectory + '/' + 'bluelightmain.css';</script></html>
