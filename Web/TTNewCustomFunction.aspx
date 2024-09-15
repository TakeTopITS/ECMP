<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTNewCustomFunction.aspx.cs" Inherits="TTNewCustomFunction" %>


<%@ Register Assembly="NickLee.Web.UI" Namespace="NickLee.Web.UI" TagPrefix="NickLee" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>新客户开发</title>
    <link id="mainCss" href="css/bluelightmain.css" rel="stylesheet" type="text/css" />
    <script src="js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript">

        function collapseObj(obj1, obj2) {
            var sObj = document.getElementById(obj2);
            if (sObj.style.display != "none") {
                sObj.style.display = "none";
                obj1.className = "c";
                obj1.title = "展开";
                $("#HF_DivState").val("close");
            } else {
                sObj.style.display = "block";
                obj1.className = "";
                obj1.title = "收缩";
                $("#HF_DivState").val("open");
            }
            obj1.blur();
            return false;
        }

        $(function () { if (top.location != self.location) { } else { CloseWebPage(); }


            var topWin = window.top.document.getElementById("mainFrame").contentWindow;
            if (topWin.document.getElementById("btnNotWorkFlow") != null) {
                topWin.document.getElementById("btnNotWorkFlow").style.visibility = "visible";
            }


        });


        function ShowDiv() {
            var hfDivState = $("#HF_DivState").val();
            //alert(hfDivState);
            if (hfDivState == "close") {
                $("#HF_DivState").val("close");
                $("#divCustomer").hide();
            }
            else if (hfDivState == "open") {
                $("#HF_DivState").val("open");
                $("#divCustomer").show();
            }
        }

    </script>
    <style type="text/css">
        .showControl button {
            float: right;
            width: 35px;
            height: 20px;
            border: 0;
            cursor: pointer;
            margin-right: 10px;
            margin-top: 6px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
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
                                                    <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,XinKeHuKaiFa%>"></asp:Label>
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
                        <td style="padding: 0px 5px 5px 5px;" valign="top">
                            <table width="100%" cellpadding="0" cellspacing="0">
                                <tr>
                                    <td valign="top" style="padding-top: 5px;">
                                        <table style="width: 100%;" cellpadding="2" cellspacing="0" class="formBgStyle">
                                            <tr style="font-size: 12pt">
                                                <td align="left" style="width: 15%; padding: 5px 5px 5px 5px; font-size:12px;" class="formItemBgStyle" valign="top">

                                                    <asp:TreeView ID="TV_Customers" runat="server" OnSelectedNodeChanged="TV_Customers_SelectedNodeChanged" ShowLines="True" NodeWrap="True">
                                                        <RootNodeStyle CssClass="rootNode" /><NodeStyle CssClass="treeNode" /><LeafNodeStyle CssClass="leafNode" /><SelectedNodeStyle CssClass="selectNode" ForeColor ="Red" />
                                                    </asp:TreeView>

                                                </td>
                                                <td class="formItemBgStyle" width="90%">
                                                    <table class="formBgStyle" width="100%">
                                                        <tr id="trTop" style="width: 100%;">
                                                            <td class="formItemBgStyle" style="height: 10%; width: 100%;">
                                                                <table style="width: 100%; text-align: center;" cellpadding="3" cellspacing="0" class="formBgStyle">
                                                                    <tr>
                                                                        <td style="text-align: right;" width="15%" class="formItemBgStyle">
                                                                            <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,DaiMa%>"></asp:Label>：
                                                                        </td>
                                                                        <td style="text-align: left;" width="19%" class="formItemBgStyle">
                                                                            <asp:TextBox ID="TB_CustomerCode" runat="server" Width="150px"></asp:TextBox>
                                                                        </td>
                                                                        <td style="text-align: right;" width="15%" class="formItemBgStyle">
                                                                            <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,MingCheng%>"></asp:Label>：
                                                                        </td>
                                                                        <td style="text-align: left;" width="19%" class="formItemBgStyle">
                                                                            <asp:TextBox ID="TB_CustomerName" runat="server" Style="margin-left: 0px" Width="95%"></asp:TextBox>
                                                                        </td>
                                                                        <td class="formItemBgStyle" style="text-align: end;" valign="middle">&nbsp;&nbsp;
                                                                            <asp:Button ID="BT_Add" runat="server" CssClass="inpu" OnClick="BT_Add_Click"
                                                                                Text="<%$ Resources:lang,XinZeng%>" />
                                                                            &nbsp;
                                                                            <asp:Button ID="BT_Update" runat="server" CssClass="inpu" OnClick="BT_Update_Click"
                                                                                Text="<%$ Resources:lang,BaoCun%>" Enabled="False" />
                                                                        </td>
                                                                        <td class="formItemBgStyle" valign="middle">&nbsp;
                                                                            <span style="cursor: pointer;">
                                                                                <img src="Images/UpDnArrow.png" onclick="return collapseObj(this,'divCustomer');" class="showControl" /></span>
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                                <div id="divCustomer" style="display: none;" runat="server">
                                                                    <table class="formBgStyle" width="100%">
                                                                        <tr>
                                                                            <td style="text-align: right;" class="formItemBgStyle">
                                                                                <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,YingWenMing%>"></asp:Label>：
                                                                            </td>
                                                                            <td align="left" class="formItemBgStyle">
                                                                                <asp:TextBox ID="TB_CustomerEnglishName" runat="server" Height="20px" Width="95%"></asp:TextBox>
                                                                            </td>
                                                                            <td align="right" class="formItemBgStyle">
                                                                                <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,HangYeLeiXing%>"></asp:Label>：
                                                                            </td>
                                                                            <td align="left" class="formItemBgStyle">
                                                                                <asp:TextBox ID="TB_Type" runat="server" Width="120px"></asp:TextBox>
                                                                                <asp:DropDownList ID="DL_IndustryType" runat="server" AutoPostBack="True"
                                                                                    DataTextField="Type" DataValueField="Type" OnSelectedIndexChanged="DL_IndustryType_SelectedIndexChanged">
                                                                                </asp:DropDownList>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td style="text-align: right;" class="formItemBgStyle">
                                                                                <asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,KaiHuYinHang%>"></asp:Label>：
                                                                            </td>
                                                                            <td style="text-align: left;" class="formItemBgStyle">
                                                                                <asp:TextBox ID="TB_Bank" runat="server" Width="95%"></asp:TextBox>
                                                                            </td>
                                                                            <td style="text-align: right;" class="formItemBgStyle">
                                                                                <asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,YinHangZhangHao%>"></asp:Label>：
                                                                            </td>
                                                                            <td style="text-align: left;" class="formItemBgStyle">
                                                                                <asp:TextBox ID="TB_BankAccount" runat="server" Width="150px"></asp:TextBox>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td style="text-align: right;" class="formItemBgStyle">
                                                                                <asp:Label ID="Label8" runat="server" Text="<%$ Resources:lang,FaPiaoDiZhi%>"></asp:Label>：
                                                                            </td>
                                                                            <td style="text-align: left;" class="formItemBgStyle">
                                                                                <asp:TextBox ID="TB_InvoiceAddress" TextMode="MultiLine" Height="60" runat="server"
                                                                                    Width="95%"></asp:TextBox>
                                                                            </td>
                                                                            <td align="right" class="formItemBgStyle">
                                                                                <asp:Label ID="Label9" runat="server" Text="<%$ Resources:lang,ZhuYaoLianXiRen%>"></asp:Label>：
                                                                            </td>
                                                                            <td align="left" class="formItemBgStyle">
                                                                                <asp:TextBox ID="TB_ContactName" runat="server" Width="150px"></asp:TextBox>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td style="text-align: right;" class="formItemBgStyle">
                                                                                <asp:Label ID="Label10" runat="server" Text="<%$ Resources:lang,DianHuaYi%>"></asp:Label>：
                                                                            </td>
                                                                            <td style="text-align: left;" class="formItemBgStyle">
                                                                                <asp:TextBox ID="TB_Tel1" runat="server" Width="150px"></asp:TextBox>
                                                                            </td>
                                                                            <td align="right" class="formItemBgStyle">
                                                                                <asp:Label ID="Label11" runat="server" Text="<%$ Resources:lang,DianHuaEr%>"></asp:Label>：
                                                                            </td>
                                                                            <td align="left" class="formItemBgStyle">
                                                                                <asp:TextBox ID="TB_Tel2" runat="server" Width="150px"></asp:TextBox>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td style="text-align: right;" class="formItemBgStyle">EMail：
                                                                            </td>
                                                                            <td style="text-align: left;" class="formItemBgStyle">
                                                                                <asp:TextBox ID="TB_EMailAddress" runat="server" Width="95%"></asp:TextBox>
                                                                            </td>
                                                                            <td style="text-align: right;" class="formItemBgStyle">
                                                                                <asp:Label ID="Label12" runat="server" Text="<%$ Resources:lang,YouZhengBianMa%>"></asp:Label>：
                                                                            </td>
                                                                            <td style="text-align: left;" class="formItemBgStyle">
                                                                                <asp:TextBox ID="TB_ZP" runat="server" Width="150px"></asp:TextBox>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td style="text-align: right;" class="formItemBgStyle">
                                                                                <asp:Label ID="Label13" runat="server" Text="<%$ Resources:lang,WangZhi%>"></asp:Label>：
                                                                            </td>
                                                                            <td style="text-align: left;" class="formItemBgStyle">
                                                                                <asp:TextBox ID="TB_WebSite" runat="server" Width="150px"></asp:TextBox>
                                                                            </td>
                                                                            <td style="text-align: right;" class="formItemBgStyle">
                                                                                <asp:Label ID="Label14" runat="server" Text="<%$ Resources:lang,ChuanZhen%>"></asp:Label>：
                                                                            </td>
                                                                            <td style="text-align: left;" class="formItemBgStyle">
                                                                                <asp:TextBox ID="TB_Fax" runat="server" Width="150px"></asp:TextBox>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td style="text-align: right;" class="formItemBgStyle">
                                                                                <asp:Label ID="Label15" runat="server" Text="<%$ Resources:lang,YeWuYuan%>"></asp:Label>：
                                                                            </td>
                                                                            <td style="text-align: left;" class="formItemBgStyle">
                                                                                <asp:TextBox ID="TB_SalePerson" runat="server" Width="150px"></asp:TextBox>
                                                                            </td>
                                                                            <td style="text-align: right;" class="formItemBgStyle">
                                                                                <asp:Label ID="Label16" runat="server" Text="<%$ Resources:lang,BiBie%>"></asp:Label>：
                                                                            </td>
                                                                            <td style="text-align: left;" class="formItemBgStyle">
                                                                                <asp:DropDownList ID="DL_Currency" runat="server">
                                                                                    <asp:ListItem Value="人民币" Text="<%$ Resources:lang,RenMinBi%>"/>
                                                                                    <asp:ListItem Value="美元" Text="<%$ Resources:lang,MeiYuan%>"/>
                                                                                    <asp:ListItem Value="欧元" Text="<%$ Resources:lang,OuYuan%>"/>
                                                                                    <asp:ListItem Value="港币" Text="<%$ Resources:lang,GangBi%>"/>
                                                                                    <asp:ListItem Value="台币" Text="<%$ Resources:lang,TaiBi%>"/>
                                                                                </asp:DropDownList>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td style="text-align: right;" class="formItemBgStyle">
                                                                                <asp:Label ID="Label17" runat="server" Text="<%$ Resources:lang,ZheKouLv%>"></asp:Label>：
                                                                            </td>
                                                                            <td style="text-align: left;" class="formItemBgStyle">
                                                                                <NickLee:NumberBox MaxAmount="1000000000000" MinAmount="-1000000000000" ID="NB_Discount" runat="server" Height="23px" Width="44px">
                                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0.00&nbsp;&nbsp;&nbsp;&nbsp;0.00&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0.00&nbsp;&nbsp;&nbsp;&nbsp;0.00
                                                                                </NickLee:NumberBox>
                                                                            </td>
                                                                            <td style="text-align: right;" class="formItemBgStyle">
                                                                                <asp:Label ID="Label18" runat="server" Text="<%$ Resources:lang,XinYongDengJi%>"></asp:Label>：
                                                                            </td>
                                                                            <td style="text-align: left;" class="formItemBgStyle">
                                                                                <NickLee:NumberBox MaxAmount="1000000000000" MinAmount="-1000000000000" ID="NB_CreditRate" runat="server" Height="22px" Width="44px">
                                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0.00&nbsp;&nbsp;&nbsp;&nbsp;0.00&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0.00&nbsp;&nbsp;&nbsp;&nbsp;0.00
                                                                                </NickLee:NumberBox>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td style="text-align: right;" class="formItemBgStyle">
                                                                                <asp:Label ID="Label19" runat="server" Text="<%$ Resources:lang,GuoJia%>"></asp:Label>：
                                                                            </td>
                                                                            <td style="text-align: left;" class="formItemBgStyle">
                                                                                <asp:TextBox ID="TB_Country" runat="server" Width="150px"></asp:TextBox>
                                                                            </td>
                                                                            <td style="text-align: right;" class="formItemBgStyle">
                                                                                <asp:Label ID="Label20" runat="server" Text="<%$ Resources:lang,ShengFen%>"></asp:Label>：
                                                                            </td>
                                                                            <td style="text-align: left;" class="formItemBgStyle">
                                                                                <asp:TextBox ID="TB_State" runat="server" Width="150px"></asp:TextBox>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td style="text-align: right;" class="formItemBgStyle">
                                                                                <asp:Label ID="Label21" runat="server" Text="<%$ Resources:lang,ChengShi%>"></asp:Label>：
                                                                            </td>
                                                                            <td style="text-align: left;" class="formItemBgStyle">
                                                                                <asp:TextBox ID="TB_City" runat="server" Width="150px"></asp:TextBox>
                                                                            </td>
                                                                            <td align="right" class="formItemBgStyle">
                                                                                <asp:Label ID="Label22" runat="server" Text="<%$ Resources:lang,JianLiShiJian%>"></asp:Label>：
                                                                            </td>
                                                                            <td style="text-align: left;" class="formItemBgStyle">
                                                                                <asp:Label ID="LB_CreateDate" runat="server" Text=""></asp:Label>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td style="text-align: right;" class="formItemBgStyle">
                                                                                <asp:Label ID="Label23" runat="server" Text="<%$ Resources:lang,XiangXiDiZhi%>"></asp:Label>：
                                                                            </td>
                                                                            <td style="text-align: left;" class="formItemBgStyle">
                                                                                <asp:TextBox ID="TB_AddressCN" Height="60px" TextMode="MultiLine" runat="server"
                                                                                    Width="95%"></asp:TextBox>
                                                                            </td>
                                                                            <td align="right" class="formItemBgStyle">
                                                                                <asp:Label ID="Label24" runat="server" Text="<%$ Resources:lang,YingWenDiZhi%>"></asp:Label>：
                                                                            </td>
                                                                            <td align="left" class="formItemBgStyle">
                                                                                <asp:TextBox ID="TB_AddressEN" runat="server" Height="60" TextMode="MultiLine" Width="95%"></asp:TextBox>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td style="text-align: right;" class="formItemBgStyle">
                                                                                <asp:Label ID="Label25" runat="server" Text="<%$ Resources:lang,BeiZhu%>"></asp:Label>：
                                                                            </td>
                                                                            <td colspan="3" style="text-align: left;" class="formItemBgStyle">
                                                                                <asp:TextBox ID="TB_Comment" runat="server" Height="60px" TextMode="MultiLine" Width="98%"></asp:TextBox>
                                                                            </td>
                                                                        </tr>
                                                                    </table>
                                                                </div>
                                                            </td>
                                                        </tr>
                                                        <tr style="width: 100%;">
                                                            <td class="formItemBgStyle" style="height: 10%; width: 100%;">
                                                                <asp:HiddenField ID="HF_RelatedCode" runat="server" />
                                                                <asp:Repeater ID="RPT_WF" runat="server" OnItemCommand="RPT_WF_ItemCommand">
                                                                    <HeaderTemplate>
                                                                        <table><tr>
                                                                    </HeaderTemplate>
                                                                    <ItemTemplate>
                                                                        <td>
                                                                            <asp:Button ID="BTN_ClickWF" runat="server" Text='<%# Eval("TemName") %>' CssClass="inpuLong" />
                                                                            <asp:HiddenField ID="HF_IdentifyString" runat="server" Value='<%# Eval("IdentifyString") %>' />
                                                                        </td>
                                                                    </ItemTemplate>
                                                                    <FooterTemplate>
                                                                        </tr></table>
                                                                    </FooterTemplate>
                                                                </asp:Repeater>
                                                                <asp:ListBox ID="LLB_CustomModule" runat="server" AutoPostBack="True" Width="200" Height="50px"
                                                                    DataTextField="TemName" DataValueField="IdentifyString" OnSelectedIndexChanged="LLB_CustomModule_SelectedIndexChanged" Visible="false"></asp:ListBox>
                                                                <iframe name="mainFrame" id="mainFrame" style="margin-top: 0px;" src="" frameborder="0" height="900"
                                                                    width="100%" runat="server"></iframe>
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
        </div>
        <asp:HiddenField ID="HF_DivState" runat="server" />
    </form>
</body>
<script type="text/javascript" language="javascript">var cssDirectory = '<%=Session["CssDirectory"] %>'; var oLink = document.getElementById('mainCss'); oLink.href = 'css/' + cssDirectory + '/' + 'bluelightmain.css';</script></html>
