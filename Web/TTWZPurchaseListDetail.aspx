<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTWZPurchaseListDetail.aspx.cs" Inherits="TTWZPurchaseListDetail" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>采购文件</title>
    <link id="mainCss" href="css/bluelightmain.css" rel="stylesheet" type="text/css" />
    <script src="js/jquery-1.7.2.min.js"></script>
    <script src="js/allAHandler.js"></script>
    <script src="js/My97DatePicker/WdatePicker.js"></script>
    <script language="javascript">

        $(function () { 

           

        });

        //一般选择界面
        function SelectProject() {
            var url = "TTWZSelectorProjectPurchase.aspx";

            popShowByURLForFixedSize(url + (url.indexOf("?") == -1 ? "?" : "&") + "ctrlId=" + "TXT_PickingUnit" + "&ctrlName=" + "TXT_UnitCode", '选择物资项目', 900, 500);	

        }



        function AlertProjectPage(url) {

            popShowByURLForFixedSize(url, '', 1200, 500);

        }




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
                                                            <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,CaiGouWenJian%>"></asp:Label>
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
                                        <tr >
                                            <td align="left" class="formItemBgStyle">
                                                <input type="button" class="inpuLong" value="新增采购文件" onclick="window.location.href = 'TTWZPurchaseEdit.aspx'" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="left" class="formItemBgStyle">
                                                <table style="width: 80%;" cellpadding="2" cellspacing="0" class="formBgStyle">
                                                    <tr style="display: none;">
                                                        <td style="text-align: left" class="formItemBgStyle"><asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,CaiGouBianHao%>"></asp:Label>：
                                                        </td>
                                                        <td style="text-align: left" class="formItemBgStyle" colspan="7">
                                                            <asp:TextBox ID="TXT_PurchaseCode" runat="server" ReadOnly="true"></asp:TextBox><font color="red">*<asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,XiTongZiDongShengCheng%>"></asp:Label></font>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="text-align: left" class="formItemBgStyle"><asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,XiangMuBianMa%>"></asp:Label>：
                                                        </td>
                                                        <td style="text-align: left" class="formItemBgStyle">
                                                            <asp:HiddenField ID="HiddenField1" runat="server" />
                                                            <asp:TextBox ID="TXT_ProjectCode" runat="server"></asp:TextBox>&nbsp;
                                                            <input type="button" id="btnProjectManager" class="inpu" runat="server" value="选择" onclick="SelectProject();" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="text-align: left" class="formItemBgStyle"><asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,CaiGouMingCheng%>"></asp:Label>：
                                                        </td>
                                                        <td style="text-align: left" class="formItemBgStyle">
                                                            <asp:TextBox ID="TXT_PurchaseName" runat="server" Width="300px"></asp:TextBox>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="text-align: center" class="formItemBgStyle" colspan="6">
                                                            <asp:Button ID="btnOK" runat="server" Text="<%$ Resources:lang,BaoCun%>" CssClass="inpu" OnClick="btnOK_Click" />&nbsp;
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
                    </div>
                </div>
                <asp:HiddenField ID="HF_PurchaseCode" runat="server" />

                <asp:HiddenField ID="HF_PurchaseEngineer" runat="server" />
                <asp:HiddenField ID="HF_DelegateAgent" runat="server" />
                <asp:HiddenField ID="HF_PurchaseManager" runat="server" />
            </ContentTemplate>
            <Triggers>
                <asp:PostBackTrigger ControlID="btnOK" />
            </Triggers>
        </asp:UpdatePanel>
    </form>
</body>
<script type="text/javascript" language="javascript">var cssDirectory = '<%=Session["CssDirectory"] %>'; var oLink = document.getElementById('mainCss'); oLink.href = 'css/' + cssDirectory + '/' + 'bluelightmain.css';</script></html>
