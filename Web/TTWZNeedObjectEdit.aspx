<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTWZNeedObjectEdit.aspx.cs" Inherits="TTWZNeedObjectEdit" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>需方编辑</title>
    <link id="mainCss" href="css/bluelightmain.css" rel="stylesheet" type="text/css" />
    <script src="js/jquery-1.7.2.min.js"></script>
    <script src="js/allAHandler.js"></script>
    <script language="javascript">
        $(function () { 

           

        });


        function LoadParentLit() {
            

            parent.window.dialogArguments.LoadNeedObjectList();

            CloseLayer();
        }


    </script>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="True" EnableScriptLocalization="True">
        </asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
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
                                                            <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,XuFangBianJi%>"></asp:Label>
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
                                                <table style="width: 80%;" cellpadding="2" cellspacing="0" class="formBgStyle">
                                                    <tr>
                                                        <td align="left" style="width: 100%; padding: 5px 5px 5px 5px;" class="formItemBgStyle" valign="top">
                                                            <table class="formBgStyle" width="100%">
                                                                <tr>
                                                                    <td style="text-align: right" class="formItemBgStyle">
                                                                        <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,XuFangBianHao%>"></asp:Label>：</td>
                                                                    <td style="text-align: left" class="formItemBgStyle">
                                                                        <asp:Label ID="LB_NeedCode" runat="server" ></asp:Label>
                                                                    </td>
                                                                    <td style="text-align: right" class="formItemBgStyle">
                                                                        <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,MaiShouRen%>"></asp:Label>：</td>
                                                                    <td style="text-align: left" class="formItemBgStyle" colspan="3">
                                                                        <asp:TextBox ID="TXT_Vendee" runat="server" Width="400"></asp:TextBox>
                                                                    </td>
                                                                    
                                                                    
                                                                </tr>
                                                                <tr>
                                                                    <td style="text-align: right" class="formItemBgStyle">
                                                                        <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,FaRenDaiBiao%>"></asp:Label>：</td>
                                                                    <td style="text-align: left" class="formItemBgStyle">
                                                                        <asp:TextBox ID="TXT_PersonDelegate" runat="server"></asp:TextBox>
                                                                    </td>
                                                                    <td style="text-align: right" class="formItemBgStyle">
                                                                        <asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,DanWeiDiZhi%>"></asp:Label>：</td>
                                                                    <td style="text-align: left" class="formItemBgStyle" colspan="3">
                                                                        <asp:TextBox ID="TXT_UnitAddress" runat="server" Width="400"></asp:TextBox>
                                                                    </td>
                                                                    
                                                                    
                                                                </tr>
                                                                <tr>
                                                                    <td style="text-align: right" class="formItemBgStyle">
                                                                        <asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,YouBian%>"></asp:Label>：</td>
                                                                    <td style="text-align: left" class="formItemBgStyle">
                                                                        <asp:TextBox ID="TXT_ZipCode" runat="server"></asp:TextBox>
                                                                    </td>
                                                                    <td style="text-align: right" class="formItemBgStyle">
                                                                        <asp:Label ID="Label8" runat="server" Text="<%$ Resources:lang,KaiHuHang%>"></asp:Label>：</td>
                                                                    <td style="text-align: left" class="formItemBgStyle" colspan="3">
                                                                        <asp:TextBox ID="TXT_OpeningBank" runat="server" Width="400"></asp:TextBox>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td style="text-align: right" class="formItemBgStyle">&nbsp;</td>
                                                                    <td style="text-align: left" class="formItemBgStyle">
                                                                        &nbsp;
                                                                    </td>
                                                                    <td style="text-align: right" class="formItemBgStyle">
                                                                        <asp:Label ID="Label9" runat="server" Text="<%$ Resources:lang,ZhangHao%>"></asp:Label>：</td>
                                                                    <td style="text-align: left" class="formItemBgStyle" colspan="3">
                                                                        <asp:TextBox ID="TXT_AccountNumber" runat="server" Width="500"></asp:TextBox>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    
                                                                    
                                                                    
                                                                    <td style="text-align: right" class="formItemBgStyle">
                                                                        <asp:Label ID="Label10" runat="server" Text="<%$ Resources:lang,CaiWuDianHua%>"></asp:Label>：</td>
                                                                    <td style="text-align: left" class="formItemBgStyle">
                                                                        <asp:TextBox ID="TXT_AccountPhone" runat="server"></asp:TextBox>
                                                                    </td>
                                                                    <td style="text-align: right" class="formItemBgStyle">
                                                                        <asp:Label ID="Label11" runat="server" Text="<%$ Resources:lang,ShuiHao%>"></asp:Label>：</td>
                                                                    <td style="text-align: left" class="formItemBgStyle" colspan="3">
                                                                        <asp:TextBox ID="TXT_RateNumber" runat="server" Width="400"></asp:TextBox>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td style="text-align: right" class="formItemBgStyle">&nbsp;</td>
                                                                    <td style="text-align: left" class="formItemBgStyle">
                                                                        &nbsp;
                                                                    </td>
                                                                    <td style="text-align: right" class="formItemBgStyle">
                                                                        <asp:Label ID="Label12" runat="server" Text="<%$ Resources:lang,WangZhi%>"></asp:Label>：</td>
                                                                    <td style="text-align: left" class="formItemBgStyle" colspan="3">
                                                                        <asp:TextBox ID="TXT_InternetUrl" runat="server" Width="400"></asp:TextBox>
                                                                    </td>
                                                                    
                                                                    
                                                                </tr>
                                                                <tr>
                                                                    <td class="formItemBgStyle" colspan="6"><hr /></td>
                                                                </tr>
                                                                <tr>
                                                                    <td style="text-align: right" class="formItemBgStyle">
                                                                        <asp:Label ID="Label13" runat="server" Text="<%$ Resources:lang,CaiGouGongChengShi%>"></asp:Label>：</td>
                                                                    <td style="text-align: left" class="formItemBgStyle">
                                                                        <asp:TextBox ID="TXT_PurchaseEngineer" runat="server" ReadOnly="true"></asp:TextBox>
                                                                        <asp:HiddenField ID="HF_PurchaseEngineer" runat="server" />
                                                                    </td>
                                                                    <td style="text-align: right" class="formItemBgStyle">
                                                                        <asp:Label ID="Label14" runat="server" Text="<%$ Resources:lang,ChuanZhen%>"></asp:Label>：</td>
                                                                    <td style="text-align: left" class="formItemBgStyle">
                                                                        <asp:TextBox ID="TXT_Fax" runat="server"></asp:TextBox>
                                                                    </td>
                                                                    <td style="text-align: right" class="formItemBgStyle">
                                                                        <asp:Label ID="Label15" runat="server" Text="<%$ Resources:lang,LianXiDianHua%>"></asp:Label>：</td>
                                                                    <td style="text-align: left" class="formItemBgStyle">
                                                                        <asp:TextBox ID="TXT_ContactPhone" runat="server"></asp:TextBox>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td style="text-align: right" class="formItemBgStyle">&nbsp;</td>
                                                                    <td style="text-align: left" class="formItemBgStyle">
                                                                        &nbsp;
                                                                    </td>
                                                                    <td style="text-align: right" class="formItemBgStyle">
                                                                        <asp:Label ID="Label16" runat="server" Text="<%$ Resources:lang,ShouJi%>"></asp:Label>：</td>
                                                                    <td style="text-align: left" class="formItemBgStyle">
                                                                        <asp:TextBox ID="TXT_Mobile" runat="server"></asp:TextBox>
                                                                    </td>
                                                                    <td style="text-align: right" class="formItemBgStyle">QQ：</td>
                                                                    <td style="text-align: left" class="formItemBgStyle" colspan="5">
                                                                        <asp:TextBox ID="TXT_QQ" runat="server"></asp:TextBox>
                                                                    </td>
                                                                    
                                                                    
                                                                </tr>
                                                                <tr>
                                                                    <td style="text-align: right" class="formItemBgStyle">&nbsp;</td>
                                                                    <td style="text-align: left" class="formItemBgStyle">
                                                                        &nbsp;
                                                                    </td>
                                                                    <td style="text-align: right" class="formItemBgStyle">E-mail：</td>
                                                                    <td style="text-align: left" class="formItemBgStyle">
                                                                        <asp:TextBox ID="TXT_Email" runat="server"></asp:TextBox>
                                                                    </td>
                                                                    <td style="text-align: right" class="formItemBgStyle">&nbsp;</td>
                                                                    <td style="text-align: left" class="formItemBgStyle">
                                                                        &nbsp;
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td style="text-align: center" class="formItemBgStyle" colspan="6">
                                                                        <asp:Button ID="btnSave" runat="server" Text="<%$ Resources:lang,BaoCun%>" CssClass="inpu" OnClick="btnSave_Click" />&nbsp;&nbsp;
                                                                        <%--<input type="button" value="返回" id="BT_Return" class="inpu" onclick="window.location.href = 'TTWZNeedObjectList.aspx'" />--%>
                                                                        <input id="btnClose()" class="inpu" onclick="window.returnValue = false;CloseLayer();"
                                                                                type="button" value="关闭" />
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
                <asp:HiddenField ID="HF_ID" runat="server" />
            </ContentTemplate>
            <Triggers>
                <asp:PostBackTrigger ControlID="btnSave" />
            </Triggers>
        </asp:UpdatePanel>
    </form>
</body>
<script type="text/javascript" language="javascript">var cssDirectory = '<%=Session["CssDirectory"] %>'; var oLink = document.getElementById('mainCss'); oLink.href = 'css/' + cssDirectory + '/' + 'bluelightmain.css';</script></html>
