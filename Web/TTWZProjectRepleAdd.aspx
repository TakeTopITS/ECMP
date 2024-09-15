<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTWZProjectRepleAdd.aspx.cs" Inherits="TTWZProjectRepleAdd" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>编辑工程项目</title>
    <link id="mainCss" href="css/bluelightmain.css" rel="stylesheet" type="text/css" />
    <script src="js/jquery-1.7.2.min.js"></script>
    <script src="js/allAHandler.js"></script>
    <script src="js/My97DatePicker/WdatePicker.js"></script>
    <script type="text/JavaScript">

        $(function () { 

            $("#btnGetUnit").click(function () {
                var url = "TTWZSelectorGetUnit.aspx";

                popShowByURLForFixedSize(url + (url.indexOf("?") == -1 ? "?" : "&") + "ctrlId=" + id + "&ctrlName=" + name, '选择领料单位', 900, 500);	

            });

        });



        function LoadParentLit() {

            alert("保存成功！");

            if (navigator.userAgent.indexOf("Firefox") >= 0) {

                window.parent.LoadProjectList();
            }
            else {


                window.parent.LoadProjectList();

            }
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
                                                            <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,BianJiLiXiangBuChong%>"></asp:Label>
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
                                                    <tr>
                                                        <td style="text-align: left; width:10%;" class="formItemBgStyle">
                                                            <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,XiangMuBianMa%>"></asp:Label>：
                                                        </td>
                                                        <td style="text-align: left; width:20%;" class="formItemBgStyle">
                                                            <asp:Label ID="LB_ProjectCode" runat="server" ></asp:Label>
                                                        </td>
                                                        <td style="text-align: left; width:10%;" class="formItemBgStyle">
                                                            <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,XiangMuJingLi%>"></asp:Label>：</td>
                                                        <td style="text-align: left; width:20%;" class="formItemBgStyle">
                                                            <asp:HiddenField ID="HF_ProjectManager" runat="server" />
                                                            <asp:TextBox ID="TXT_ProjectManager" runat="server" Width="80px" ReadOnly="true"></asp:TextBox>&nbsp;
                                                    <input type="button" id="btnProjectManager" style="display: none;" class="inpu" runat="server" value="选择" onclick="SelectEmployee('TTWZSelectorMember.aspx', 'HF_ProjectManager', 'TXT_ProjectManager')" />
                                                        </td>
                                                        <td style="text-align: left; width:10%;" class="formItemBgStyle">
                                                            <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,ShouQuanCaiGou%>"></asp:Label>：</td>
                                                        <td style="text-align: left; width:20%;" class="formItemBgStyle">
                                                            <asp:DropDownList ID="TXT_PowerPurchase" runat="server" Enabled="false">
                                                                <asp:ListItem Text="<%$ Resources:lang,You%>" Value="有"/>
                                                                <asp:ListItem Text="<%$ Resources:lang,Wu%>" Value="无"/>
                                                            </asp:DropDownList>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="text-align: left" class="formItemBgStyle">
                                                            <asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,XiangMuMingCheng%>"></asp:Label>：
                                                        </td>
                                                        <td style="text-align: left" class="formItemBgStyle" colspan="5">
                                                            <asp:TextBox ID="TXT_ProjectName" runat="server" Width="350px" ReadOnly="true"></asp:TextBox>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="text-align: left" class="formItemBgStyle">
                                                            <asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,XiangMuMiaoShu%>"></asp:Label>：</td>
                                                        <td style="text-align: left" class="formItemBgStyle" colspan="5">
                                                            <%--<textarea cols="50" rows="1" runat="server" id="TXT_ProjectDesc" disabled="disabled"></textarea>--%>
                                                            <asp:TextBox ID="TXT_ProjectDesc" runat="server" TextMode="MultiLine" Height="100px" Width="500px" ReadOnly="true"></asp:TextBox>
                                                        </td>
                                                    </tr>
                                                    <tr>

                                                        <td style="text-align: left" class="formItemBgStyle">
                                                            <asp:Label ID="Label8" runat="server" Text="<%$ Resources:lang,KaiGongRiQi%>"></asp:Label>：</td>
                                                        <td style="text-align: left" class="formItemBgStyle">
                                                            <asp:TextBox ID="TXT_StartTime" runat="server" Width="80px" ReadOnly="true"></asp:TextBox>
                                                        </td>
                                                        <td style="text-align: left" class="formItemBgStyle">
                                                            <asp:Label ID="Label9" runat="server" Text="<%$ Resources:lang,BianZhiRiQi%>"></asp:Label>：</td>
                                                        <td style="text-align: left" class="formItemBgStyle">
                                                            <asp:TextBox ID="TXT_MarkTime" runat="server" Width="80px" ReadOnly="true"></asp:TextBox>
                                                        </td>
                                                        <td style="text-align: left" class="formItemBgStyle">
                                                            <asp:Label ID="Label10" runat="server" Text="<%$ Resources:lang,BianZhiRen%>"></asp:Label>：</td>
                                                        <td style="text-align: left" class="formItemBgStyle">
                                                            <asp:TextBox ID="TXT_Marker" runat="server" Width="80px" ReadOnly="true"></asp:TextBox><asp:HiddenField ID="HF_Marker" runat="server" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="text-align: left" class="formItemBgStyle" colspan="6">
                                                            <hr />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="text-align: left" class="formItemBgStyle">
                                                            <asp:Label ID="Label11" runat="server" Text="<%$ Resources:lang,KuBie%>"></asp:Label>：</td>
                                                        <td style="text-align: left" class="formItemBgStyle">
                                                            <asp:TextBox ID="TXT_StoreRoom" runat="server" Width="80px"></asp:TextBox>&nbsp;
                                                            <input type="button" id="BT_StoreBie" class="inpu" runat="server" value="选择" onclick="SelectStock('HF_StoreRoom','TXT_StoreRoom');" />
                                                            <%--<asp:DropDownList ID="DDL_StoreRoom" runat="server"
                                                                OnSelectedIndexChanged="DDL_StoreRoom_SelectedIndexChanged" AutoPostBack="true"
                                                                DataTextField="StockCode" DataValueField="StockCode">
                                                            </asp:DropDownList>--%>
                                                            <asp:HiddenField ID="HF_StoreRoom" runat="server" />
                                                        </td>
                                                        <td style="text-align: left" class="formItemBgStyle">
                                                            <asp:Label ID="Label12" runat="server" Text="<%$ Resources:lang,WeiTuoDaiLiRen%>"></asp:Label>：</td>
                                                        <td style="text-align: left" class="formItemBgStyle">
                                                            <asp:TextBox ID="TXT_DelegateAgent" runat="server" Width="80px"></asp:TextBox>
                                                            <asp:HiddenField ID="HF_DelegateAgent" runat="server" />
                                                            &nbsp;
                                                    <input type="button" id="Button1" class="inpu" runat="server" value="选择" onclick="SelectEmployee('TTWZSelectorMember.aspx', 'HF_DelegateAgent', 'TXT_DelegateAgent')" />
                                                        </td>
                                                        <td style="text-align: left" class="formItemBgStyle">
                                                            <asp:Label ID="Label13" runat="server" Text="<%$ Resources:lang,CaiGouJingLi%>"></asp:Label>：</td>
                                                        <td style="text-align: left" class="formItemBgStyle">
                                                            <asp:HiddenField ID="HF_PurchaseManager" runat="server" />
                                                            <asp:TextBox ID="TXT_PurchaseManager" runat="server" Width="80px"></asp:TextBox>&nbsp;
                                                            <input type="button" id="btnPurchaseManager" class="inpu" runat="server" value="选择" onclick="SelectEmployee('TTWZSelectorMember.aspx', 'HF_PurchaseManager', 'TXT_PurchaseManager')" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="text-align: left" class="formItemBgStyle">
                                                            <asp:Label ID="Label14" runat="server" Text="<%$ Resources:lang,CaiGouGongChengShi%>"></asp:Label>：</td>
                                                        <td style="text-align: left" class="formItemBgStyle">
                                                            <asp:HiddenField ID="HF_PurchaseEngineer" runat="server" />
                                                            <asp:TextBox ID="TXT_PurchaseEngineer" runat="server" Width="80px"></asp:TextBox>&nbsp;
                                                    <input type="button" id="btnPurchaseEngineer" class="inpu" runat="server" value="选择" onclick="SelectEmployee('TTWZSelectorMember.aspx', 'HF_PurchaseEngineer', 'TXT_PurchaseEngineer')" />
                                                        </td>
                                                        <td style="text-align: left" class="formItemBgStyle">
                                                            <asp:Label ID="Label15" runat="server" Text="<%$ Resources:lang,HeTongYuan%>"></asp:Label>：</td>
                                                        <td style="text-align: left" class="formItemBgStyle">
                                                            <asp:HiddenField ID="HF_Contracter" runat="server" />
                                                            <asp:TextBox ID="TXT_Contracter" runat="server" Width="80px"></asp:TextBox>&nbsp;
                                                    <input type="button" id="btnContracter" class="inpu" runat="server" value="选择" onclick="SelectEmployee('TTWZSelectorMember.aspx', 'HF_Contracter', 'TXT_Contracter')" />
                                                        </td>
                                                        <td style="text-align: left" class="formItemBgStyle">
                                                            <asp:Label ID="Label16" runat="server" Text="<%$ Resources:lang,CaiJianYuan%>"></asp:Label>：</td>
                                                        <td style="text-align: left" class="formItemBgStyle">
                                                            <asp:HiddenField ID="HF_Checker" runat="server" />
                                                            <asp:TextBox ID="TXT_Checker" runat="server" Width="80px"></asp:TextBox>&nbsp;
                                                            <input type="button" id="btnChecker" class="inpu" runat="server" value="选择" onclick="SelectEmployee('TTWZSelectorMember.aspx', 'HF_Checker', 'TXT_Checker')" />
                                                        </td>

                                                    </tr>
                                                    <tr>
                                                        <td style="text-align: left" class="formItemBgStyle">
                                                            <asp:Label ID="Label17" runat="server" Text="<%$ Resources:lang,BaoGuanYuan%>"></asp:Label>：</td>
                                                        <td style="text-align: left" class="formItemBgStyle" colspan="3">
                                                            <asp:HiddenField ID="HF_Safekeep" runat="server" />
                                                            <asp:TextBox ID="TXT_Safekeep" runat="server" Width="80px"></asp:TextBox>&nbsp;
                                                    <input type="button" id="btnSafekeep" class="inpu" runat="server" value="选择" onclick="SelectEmployee('TTWZSelectorMember.aspx', 'HF_Safekeep', 'TXT_Safekeep')" style="display: none;" />
                                                        </td>
                                                        <td style="text-align: left" class="formItemBgStyle">
                                                            <asp:Label ID="Label18" runat="server" Text="<%$ Resources:lang,BuChongBianJi%>"></asp:Label>：</td>
                                                        <td style="text-align: left" class="formItemBgStyle">
                                                            <asp:TextBox ID="TXT_SupplementEditor" runat="server" Width="80px" ReadOnly="true"></asp:TextBox><asp:HiddenField ID="HF_SupplementEditor" runat="server" />
                                                        </td>
                                                    </tr>

                                                    <tr>
                                                        <td style="text-align: center" class="formItemBgStyle" colspan="6">
                                                            <asp:Button ID="btnSave" runat="server" Text="<%$ Resources:lang,BaoCun%>" CssClass="inpu" OnClick="btnSave_Click" />&nbsp;
                                                    <input id="btnClose()" class="inpu" onclick="window.returnValue = false;CloseLayer();"
                                                        type="button" value="关闭" /><%--<input type="button" value="返回" id="BT_Return" class="inpu" onclick="window.history.go(-1);" />--%>
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
