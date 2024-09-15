<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTWZPlanEdit.aspx.cs" Inherits="TTWZPlanEdit" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>领料计划编辑</title>
    <link id="mainCss" href="css/bluelightmain.css" rel="stylesheet" type="text/css" />
    <script src="js/jquery-1.7.2.min.js"></script>
    <script src="js/allAHandler.js"></script>
    <script language="javascript">

        $(function () { 

           

        });

      

        function LoadParentLit() {
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
                                                            <asp:Label ID="Label13" runat="server" Text="<%$ Resources:lang,LingLiaoJiHuaBianJi%>"></asp:Label>
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
                                                        <td align="left" style="width: 45%; padding: 5px 5px 5px 5px;" class="formItemBgStyle" valign="top">
                                                            <table class="formBgStyle" width="100%">
                                                                <tr>
                                                                    <td style="text-align: left" class="formItemBgStyle">
                                                                        <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,JiHuaBianHao%>"></asp:Label>：</td>
                                                                    <td style="text-align: left" class="formItemBgStyle" colspan="5">

                                                                        <asp:Label ID="LB_PlanCode" runat="server"></asp:Label>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td style="text-align: left" class="formItemBgStyle">
                                                                        <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,ZiBianHao%>"></asp:Label>：</td>
                                                                    <td style="text-align: left" class="formItemBgStyle">
                                                                        <asp:TextBox ID="TXT_SinceNumber" runat="server"></asp:TextBox>
                                                                    </td>

                                                                    <td style="text-align: left" class="formItemBgStyle">
                                                                        <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,XiangMuBianMa%>"></asp:Label>：</td>
                                                                    <td style="text-align: left" class="formItemBgStyle">
                                                                        <asp:DropDownList ID="DDL_Project" runat="server" DataTextField="ProjectCode" DataValueField="ProjectName" OnSelectedIndexChanged="DDL_Project_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
                                                                    </td>
                                                                    <td style="text-align: left" class="formItemBgStyle">
                                                                        <asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,GongYingFangShi%>"></asp:Label>：</td>
                                                                    <td style="text-align: left" class="formItemBgStyle">
                                                                        <asp:DropDownList ID="DDL_SupplyMethod" runat="server">
                                                                            <asp:ListItem Text="-" Value="" />
                                                                            <asp:ListItem Text="<%$ Resources:lang,ZiGou%>" Value="自购" />
                                                                            <asp:ListItem Text="<%$ Resources:lang,JiaGong%>" Value="甲供" />
                                                                        </asp:DropDownList>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td style="text-align: left" class="formItemBgStyle">
                                                                        <asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,JiHuaMingCheng%>"></asp:Label>：</td>
                                                                    <td style="text-align: left" class="formItemBgStyle" colspan="5">
                                                                        <asp:TextBox ID="TXT_PlanName" runat="server" Width="99%"></asp:TextBox>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td style="text-align: left" class="formItemBgStyle">
                                                                        <asp:Label ID="Label8" runat="server" Text="<%$ Resources:lang,LingLiaoDanWei%>"></asp:Label>：</td>
                                                                    <td style="text-align: left" class="formItemBgStyle">
                                                                        <asp:TextBox ID="TXT_PickingUnit" runat="server"></asp:TextBox>&nbsp;
                                                                        <input type="button" id="btnPickingUnit" class="inpu" runat="server" value="选择" onclick="OnClickPickingUnit('HF_Department', 'TXT_PickingUnit');" />
                                                                        <asp:HiddenField ID="HF_Department" runat="server" />
                                                                    </td>
                                                                    
                                                                    <td style="text-align: left" class="formItemBgStyle" colspan="4">
                                                                        <asp:Button ID="btnSave" runat="server" Text="<%$ Resources:lang,BaoCun%>" CssClass="inpu" OnClick="btnSave_Click" />&nbsp;&nbsp;
                                                                        <input id="btnClose()" class="inpu" onclick="window.returnValue = false;CloseLayer();"
                                                                            type="button" value="关闭" />

                                                                        <asp:Button ID="BT_Department" runat="server" Text="<%$ Resources:lang,XuanZeBuMen%>" CssClass="inpu" OnClick="BT_Department_Click" Style="display: none;" />
                                                                    </td>
                                                                </tr>
                                                                <tr style="display: none;">

                                                                    <td style="text-align: left" class="formItemBgStyle">
                                                                        <asp:Label ID="Label9" runat="server" Text="<%$ Resources:lang,KuBie%>"></asp:Label>：</td>
                                                                    <td style="text-align: left" class="formItemBgStyle">
                                                                        <asp:DropDownList ID="DDL_StoreRoom" runat="server" DataTextField="StockCode" DataValueField="StockCode"></asp:DropDownList>
                                                                    </td>
                                                                    <td style="text-align: left" class="formItemBgStyle">
                                                                        <asp:Label ID="Label10" runat="server" Text="<%$ Resources:lang,DanWeiBianHao%>"></asp:Label>：</td>
                                                                    <td style="text-align: left" class="formItemBgStyle">
                                                                        <asp:TextBox ID="TXT_UnitCode" runat="server"></asp:TextBox>
                                                                    </td>
                                                                   <td style="text-align: left" class="formItemBgStyle">
                                                                       </td> 
                                                                    <td style="text-align: left" class="formItemBgStyle">
                                                                       </td> 
                                                                </tr>
                                                                <tr style="display: none;">
                                                                    <td style="text-align: left" class="formItemBgStyle">
                                                                        <asp:Label ID="Label12" runat="server" Text="<%$ Resources:lang,CaiGouGongChengShi%>"></asp:Label>：</td>
                                                                    <td style="text-align: left" class="formItemBgStyle" >
                                                                        <asp:TextBox ID="TXT_PurchaseEngineer" runat="server"></asp:TextBox>
                                                                        <asp:HiddenField ID="HF_PurchaseEngineer" runat="server" />
                                                                    </td>
                                                                     <td style="text-align: left" class="formItemBgStyle">
                                                                        <asp:Label ID="Label11" runat="server" Text="<%$ Resources:lang,FeiKongZhuGuan%>"></asp:Label>：</td>
                                                                    <td style="text-align: left" class="formItemBgStyle" colspan="3">
                                                                        <asp:TextBox ID="TXT_FeeManage" runat="server" ReadOnly="true"></asp:TextBox>
                                                                        <asp:HiddenField ID="HF_FeeManage" runat="server" />
                                                                    </td>
                                                                </tr>
                                                                <tr style="display: none;">
                                                                    <td style="text-align: center" class="formItemBgStyle" colspan="8">

                                                                        <%--<input type="button" value="返回" id="BT_Return" class="inpu" onclick="window.location.href = 'TTWZPlanList.aspx'" />--%>
                                                                        
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
                <asp:HiddenField ID="HF_PlanCode" runat="server" />
                <asp:HiddenField ID="HF_CheckerCode" runat="server" />
            </ContentTemplate>
            <Triggers>
                <asp:PostBackTrigger ControlID="btnSave" />
                <asp:PostBackTrigger ControlID="DDL_Project" />
            </Triggers>
        </asp:UpdatePanel>
    </form>
</body>
<script type="text/javascript" language="javascript">var cssDirectory = '<%=Session["CssDirectory"] %>'; var oLink = document.getElementById('mainCss'); oLink.href = 'css/' + cssDirectory + '/' + 'bluelightmain.css';</script></html>
