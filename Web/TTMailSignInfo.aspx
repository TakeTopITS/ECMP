<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTMailSignInfo.aspx.cs" Inherits="TTMailSignInfo" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link id="mainCss" href="css/bluelightmain.css" rel="stylesheet" type="text/css" />

    <script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="js/allAHandler.js"></script>
    <script type="text/javascript" language="javascript">
        $(function () {

            if (top.location != self.location) { } else { CloseWebPage(); }

        });

        function AdjustListBoxHeight() {

            document.getElementById("LLB_SignInfo").style.height = document.documentElement.clientHeight + "px";
        }

    </script>
</head>
<body >
    <center>
        <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="True" EnableScriptLocalization="True">
        </asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <contenttemplate>
                <table cellpadding="0" cellspacing="0" width="100%" class="bian">
                    <tr>
                        <td height="31" class="page_topbj">
                            <table width="96%" border="0" align="center" cellpadding="0" cellspacing="0">
                                <tr>
                                    <td align="left">
                                        <table width="345" border="0" align="left" cellpadding="0" cellspacing="0">
                                            <tr>
                                                <td width="29"><%--<img src="Logo/main_top_l.jpg" alt="" width="29" height="31" />--%></td>
                                                <td align="center" background="ImagesSkin/main_top_bj.jpg" class="titlezi">
                                                    <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,QianMingSheZhi%>"></asp:Label>
                                                </td>
                                                <td width="5"><%-- <img src="ImagesSkin/main_top_r.jpg" width="5" height="31" />--%></td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td >
                            <table width="100%" cellpadding="5" cellspacing="0">
                                <tr>
                                    <td>
                                        <table width="100%"  cellpadding="2" cellspacing="0" class="formBgStyle"  style="padding-top:5px">
                                            <tr>
                                                <td align="right" id ="TD_LLB_Signfo"  width="50" class="formItemBgStyle" rowspan="4">
                                                    <asp:ListBox ID="LLB_SignInfo" runat="server" AutoPostBack="True" 
                                                        DataTextField="Title" DataValueField="ID" 
                                                        OnSelectedIndexChanged="LLB_SignInfo_SelectedIndexChanged" Width="220px">
                                                    </asp:ListBox>
                                                </td>
                                                <td align="right" class="formItemBgStyle" width="50">
                                                    <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,MingCheng%>"></asp:Label>：</td>
                                                <td  align="left" class="formItemBgStyle">
                                                  
                                                    <asp:TextBox ID="TB_Title" runat="server" Width="90%"></asp:TextBox>
                                                    <asp:Label ID="LB_ID" runat="server"></asp:Label>
                                                  
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="right" class="formItemBgStyle" valign="top">
                                                    <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,NeiRong%>"></asp:Label>： 
                                                </td>
                                                <td  align="left" class="formItemBgStyle">
                                                   <table width ="100%">
                                                     <tr>
                                                      <td width ="70%">   
                                                      <CKEditor:CKEditorControl ID="CKEditor1" Width="98%" Height="500px" runat="server">
                                                      </CKEditor:CKEditorControl>
                                                    </td>
                                                    <td>
                                                      
                                                        <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,BeiZhu%>"></asp:Label>：<br /> [DateTime]<asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,DBFSYJSJSZQMSBTFSYJFSSHHYFSSJTHT%>"></asp:Label></td>
                                                    </tr>
                                                    </table>
                                                
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="right" class="formItemBgStyle" style="width: 50px; height: 29px">
                                                    <asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,ZhuangTai%>"></asp:Label>：</td>
                                                <td align="left" style="height: 29px" class="formItemBgStyle">
                                                    <asp:DropDownList ID="DL_Status" runat="server">
                                                    <asp:ListItem Value="处理中" Text="<%$ Resources:lang,HuoDong%>"/>
                                                    <asp:ListItem Value="备用" Text="<%$ Resources:lang,BeiYong%>"/>
                                                    </asp:DropDownList>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="right" class="formItemBgStyle" style="width: 50px; height: 29px">
                                                </td>
                                                <td align="left" class="formItemBgStyle" style="height: 29px">
                                                    <asp:Button ID="BT_New" runat="server" CssClass="inpu" OnClick="BT_New_Click" 
                                                        Text="<%$ Resources:lang,XinZeng%>" />
                                                    &nbsp;
                                                    <asp:Button ID="BT_Update" runat="server" CssClass="inpu" 
                                                        OnClick="BT_Update_Click" Text="<%$ Resources:lang,BaoCun%>" />
                                                    &nbsp;
                                                    <asp:Button ID="BT_Delete" runat="server" CssClass="inpu" 
                                                        OnClick="BT_Delete_Click" OnClientClick="return confirm(getDeleteMsgByLangCode())" Text="<%$ Resources:lang,ShanChu%>" />
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </contenttemplate>
        </asp:UpdatePanel>
        <div style="position: absolute; left: 50%; top: 50%;">
            <asp:UpdateProgress ID="TakeTopUp" runat="server" AssociatedUpdatePanelID="UpdatePanel1">
                <progresstemplate>
                    <img src="Images/Processing.gif" alt="Loading,please wait..." /></progresstemplate>
            </asp:UpdateProgress>
        </div>
        </form>
    </center>
</body>
<script type="text/javascript" language="javascript">var cssDirectory = '<%=Session["CssDirectory"] %>'; var oLink = document.getElementById('mainCss'); oLink.href = 'css/' + cssDirectory + '/' + 'bluelightmain.css';</script></html>
