<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTWZPurchasePlanListVolume.aspx.cs" Inherits="TTWZPurchasePlanListVolume" %>

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

        // 选择供应商
        function SelectSupplier(objHFValue, objTXTValue, objSortNumber, objPurchaseCode) {

            var url = "TTWZSelectorSupplier.aspx?SupplierCode=" + objHFValue + "&SortNUmber=" + objSortNumber + "&PurchaseCode=" + objPurchaseCode;

            popShowByURLForFixedSize(url + (url.indexOf("?") == -1 ? "?" : "&") + "ctrlId=HF_Supplier" + objSortNumber + "&ctrlName=" + objTXTValue, '选择供应商', 800, 500);

        }


        // 清空供应商
        function RemoveSupplier(objHFValue, objTXTValue) {
            $("#" + objHFValue).val("");
            $("#" + objTXTValue).val("");
        }

        // 打开供应商3给选择
        function OpenSupplier3() {
            $("#BT_Supplier3").attr("disabled", "");
        }



        // 打开供应商4-6给清空
        function OpenSupplier456() {
            $("#BT_Supplier4").attr("disabled", "");
            $("#BT_Supplier5").attr("disabled", "");
            $("#BT_Supplier6").attr("disabled", "");
        }


        // 自动选择供应商禁用
        function CloseAutoSupplier() {
            $("#BT_SuppierSystem").attr("disabled", "disabled");
        }


        // 自动选择专家禁用
        function CloseAutoExpert() {
            $("#BT_ExpertSystem").attr("disabled", "disabled");
        }



        //选择专家
        function SelectExpert(objHFValue, objTXTValue) {
            var url = "TTWZSelectorExpert.aspx";

            popShowByURLForFixedSize(url + (url.indexOf("?") == -1 ? "?" : "&") + "ctrlId=" + objHFValue + "&ctrlName=" + objTXTValue, '选择专家', 800, 500);

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
                                                            <asp:Label ID="Label1" runat="server" Text="采购计划-组卷"></asp:Label>
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
                                            <td align="left" class="formItemBgStyle">
                                                <table style="width: 100%;" cellpadding="2" cellspacing="0" class="formBgStyle">
                                                    <tr>
                                                        <td style="text-align: left" class="formItemBgStyle">
                                                            <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,CaiGouFangShi%>"></asp:Label>：
                                                        </td>
                                                        <td style="text-align: left" class="formItemBgStyle" colspan="5">
                                                            <asp:DropDownList ID="DDL_PurchaseMethod" runat="server">
                                                                <asp:ListItem Text="<%$ Resources:lang,XunBiJia%>" Value="询比价" />
                                                                <asp:ListItem Text="<%$ Resources:lang,ZhaoBiao%>" Value="招标" />
                                                                <asp:ListItem Text="<%$ Resources:lang,KuangJia%>" Value="框架" />
                                                                <asp:ListItem Text="<%$ Resources:lang,DuJia%>" Value="独家" />
                                                                <asp:ListItem Text="<%$ Resources:lang,YiJia%>" Value="议价" />
                                                                <asp:ListItem Text="<%$ Resources:lang,JinJi%>" Value="紧急" />
                                                                <asp:ListItem Text="<%$ Resources:lang,XiaoE%>" Value="小额" />
                                                            </asp:DropDownList>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="text-align: left" class="formItemBgStyle">
                                                            <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,GongYingShang%>"></asp:Label>：
                                                        </td>
                                                        <td style="text-align: left" class="formItemBgStyle" colspan="5">
                                                            <asp:Button ID="BT_SuppierSystem" runat="server" Text="<%$ Resources:lang,ZiDongXuanZe%>" CssClass="inpu" OnClick="BT_SuppierSystem_Click" />&nbsp;
                                                            
                                                            <asp:HiddenField ID="HF_Supplier1" runat="server" />
                                                            <asp:HiddenField ID="HF_Supplier2" runat="server" />
                                                            <asp:HiddenField ID="HF_Supplier3" runat="server" />
                                                            <asp:HiddenField ID="HF_Supplier4" runat="server" />
                                                            <asp:HiddenField ID="HF_Supplier5" runat="server" />
                                                            <asp:HiddenField ID="HF_Supplier6" runat="server" />
                                                            <asp:HiddenField ID="HF_SupplierSortNumber" runat="server" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="text-align: right" class="formItemBgStyle">1：
                                                        </td>
                                                        <td style="text-align: left" class="formItemBgStyle" colspan="5">
                                                            <asp:TextBox ID="TXT_Supplier1" runat="server" Width="90px"></asp:TextBox>
                                                            <asp:Button ID="BT_SelectSupplier1" runat="server" Text="▼" CssClass="inpu" OnClick="BT_SelectSupplier1_Click" Enabled="false" />
                                                            &nbsp;<asp:Button ID="BT_DeleteSupplier1" runat="server" CssClass="inpu" Enabled="false" Text="X" OnClick="BT_DeleteSupplier1_Click" />

                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="text-align: right" class="formItemBgStyle">2：
                                                        </td>
                                                        <td style="text-align: left" class="formItemBgStyle" colspan="5">
                                                            <asp:TextBox ID="TXT_Supplier2" runat="server" Width="90px"></asp:TextBox>
                                                            <asp:Button ID="BT_SelectSupplier2" runat="server" Text="▼" CssClass="inpu" OnClick="BT_SelectSupplier2_Click" Enabled="false" />
                                                            &nbsp;<asp:Button ID="BT_DeleteSupplier2" runat="server" CssClass="inpu" Enabled="false" Text="X" OnClick="BT_DeleteSupplier2_Click" />

                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="text-align: right" class="formItemBgStyle">3：
                                                        </td>
                                                        <td style="text-align: left" class="formItemBgStyle" colspan="5">
                                                            <asp:TextBox ID="TXT_Supplier3" runat="server" Width="90px"></asp:TextBox>
                                                            <asp:Button ID="BT_SelectSupplier3" runat="server" Text="▼" CssClass="inpu" OnClick="BT_SelectSupplier3_Click" Enabled="false" />
                                                            &nbsp;<asp:Button ID="BT_DeleteSupplier3" runat="server" CssClass="inpu" Enabled="false" Text="X" OnClick="BT_DeleteSupplier3_Click" />

                                                            <%--<input type="button" class="inpu" value="供应商3" id="BT_Supplier3" onclick="SelectSupplier('HF_Supplier3', 'TXT_Supplier3')" disabled="disabled" />&nbsp;--%>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="text-align: right" class="formItemBgStyle">4：
                                                        </td>
                                                        <td style="text-align: left" class="formItemBgStyle" colspan="5">
                                                            <asp:TextBox ID="TXT_Supplier4" runat="server" Width="90px"></asp:TextBox>
                                                            <asp:Button ID="BT_SelectSupplier4" runat="server" Text="▼" CssClass="inpu" OnClick="BT_SelectSupplier4_Click" Enabled="false" />
                                                            &nbsp;<asp:Button ID="BT_DeleteSupplier4" runat="server" CssClass="inpu" Enabled="false" Text="X" OnClick="BT_DeleteSupplier4_Click" />

                                                            <%--<input type="button" class="inpu" value="清空4" id="Button3" onclick="RemoveSupplier('HF_Supplier4', 'TXT_Supplier4')" disabled="disabled" />&nbsp;--%>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="text-align: right" class="formItemBgStyle">5：
                                                        </td>
                                                        <td style="text-align: left" class="formItemBgStyle" colspan="5">
                                                            <asp:TextBox ID="TXT_Supplier5" runat="server" Width="90px"></asp:TextBox>
                                                            <asp:Button ID="BT_SelectSupplier5" runat="server" Text="▼" CssClass="inpu" OnClick="BT_SelectSupplier5_Click" Enabled="false" />
                                                            <%--<input type="button" class="inpu" value="清空5" id="Button4" onclick="RemoveSupplier('HF_Supplier5', 'TXT_Supplier5')" disabled="disabled" />&nbsp;--%>
                                                            &nbsp;<asp:Button ID="BT_DeleteSupplier5" runat="server" CssClass="inpu" Enabled="false" Text="X" OnClick="BT_DeleteSupplier5_Click" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="text-align: right" class="formItemBgStyle">6：
                                                        </td>
                                                        <td style="text-align: left" class="formItemBgStyle" colspan="5">
                                                            <asp:TextBox ID="TXT_Supplier6" runat="server" Width="90px"></asp:TextBox>
                                                            <asp:Button ID="BT_SelectSupplier6" runat="server" Text="▼" CssClass="inpu" OnClick="BT_SelectSupplier6_Click" Enabled="false" />
                                                            <%--<input type="button" class="inpu" value="清空6" id="Button5" onclick="RemoveSupplier('HF_Supplier6', 'TXT_Supplier6')" disabled="disabled" />--%>
                                                            &nbsp;<asp:Button ID="BT_DeleteSupplier6" runat="server" CssClass="inpu" Enabled="false" Text="X" OnClick="BT_DeleteSupplier6_Click" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="text-align: left" class="formItemBgStyle">
                                                            <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,ZhuanJiaZu%>"></asp:Label>：
                                                        </td>
                                                        <td style="text-align: left" class="formItemBgStyle" colspan="5">
                                                            <asp:Button ID="BT_ExpertSystem" runat="server" Text="<%$ Resources:lang,ZiDongXuanZe%>" CssClass="inpu" OnClick="BT_ExpertSystem_Click" />&nbsp;
                                                            
                                                            <asp:HiddenField ID="HF_Expert1" runat="server" />
                                                            <asp:HiddenField ID="HF_Expert2" runat="server" />
                                                            <asp:HiddenField ID="HF_Expert3" runat="server" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="text-align: right" class="formItemBgStyle">1：
                                                        </td>
                                                        <td style="text-align: left" class="formItemBgStyle" colspan="5">
                                                            <asp:TextBox ID="TXT_Expert1" runat="server" Width="90px"></asp:TextBox>
                                                            <asp:Button ID="BT_SelectExpert1" runat="server" Text="▼" CssClass="inpu" OnClick="BT_SelectExpert1_Click" Enabled="false" />
                                                            <%--<input type="button" class="inpu" value="专家1" id="BT_ExpertSelect" onclick="SelectExpert('HF_Expert1', 'TXT_Expert1')" disabled="disabled" />--%>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="text-align: right" class="formItemBgStyle">2：
                                                        </td>
                                                        <td style="text-align: left" class="formItemBgStyle" colspan="5">
                                                            <asp:TextBox ID="TXT_Expert2" runat="server" Width="90px"></asp:TextBox>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="text-align: right" class="formItemBgStyle">3：
                                                        </td>
                                                        <td style="text-align: left" class="formItemBgStyle" colspan="5">
                                                            <asp:TextBox ID="TXT_Expert3" runat="server" Width="90px"></asp:TextBox>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="text-align: left" class="formItemBgStyle">
                                                            <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,ZhaoBiaoWenJian%>"></asp:Label>：
                                                        </td>
                                                        <td style="text-align: left" class="formItemBgStyle">
                                                            <asp:FileUpload ID="FUP_PurchaseDocument" runat="server" />
                                                            <asp:Button ID="BT_PurchaseFile" runat="server" Text="<%$ Resources:lang,ShangChuan%>" CssClass="inpu" OnClick="BT_PurchaseFile_Click" />&nbsp;<asp:Button ID="BT_DeletePurchaseFile" runat="server" CssClass="inpu" OnClick="BT_DeletePurchaseFile_Click" Text="X" />
                                                            <br />
                                                            <asp:Literal ID="LT_PurchaseDocument" runat="server"></asp:Literal>
                                                            <asp:HiddenField ID="HF_PurchaseDocument" runat="server" />
                                                            <asp:HiddenField ID="HF_PurchaseDocumentURL" runat="server" />
                                                        </td>
                                                        <td style="text-align: left" class="formItemBgStyle">
                                                            <asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,JiJianJianDu%>"></asp:Label>：
                                                        </td>
                                                        <td style="text-align: left" class="formItemBgStyle">
                                                            <asp:HiddenField ID="HF_DisciplinarySupervision" runat="server" />
                                                            <asp:TextBox ID="TXT_DisciplinarySupervision" runat="server"></asp:TextBox>&nbsp;
                                                            <input type="button" id="BT_DisciplinarySupervision" class="inpu" runat="server" value="选择" onclick="SelectEmployee('TTWZSelectorMember.aspx', 'HF_DisciplinarySupervision', 'TXT_DisciplinarySupervision')" />
                                                        </td>
                                                        <td style="text-align: left" class="formItemBgStyle">
                                                            <asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,BaoJiaKaiShi%>"></asp:Label>：
                                                        </td>
                                                        <td style="text-align: left" class="formItemBgStyle">
                                                            <asp:TextBox ID="TXT_PurchaseStartTime" runat="server" onClick="WdatePicker({dateFmt:'yyyy-MM-dd'})"></asp:TextBox>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="text-align: left" class="formItemBgStyle">
                                                            <asp:Label ID="Label8" runat="server" Text="<%$ Resources:lang,PingBiaoWenJian%>"></asp:Label>：
                                                        </td>
                                                        <td style="text-align: left" class="formItemBgStyle">
                                                            <asp:FileUpload ID="FUP_PurchaseOfferDocument" runat="server" />&nbsp;
                                                            <asp:Button ID="BT_Upload" runat="server" Text="<%$ Resources:lang,ShangChuan%>" CssClass="inpu" OnClick="BT_Upload_Click" />&nbsp;<asp:Button ID="BT_DeleteAssessmentDocument" runat="server" CssClass="inpu" OnClick="BT_DeleteAssessmentDocument_Click" Text="X" />
                                                            <br />
                                                            <asp:Literal ID="LT_AssessmentDocument" runat="server"></asp:Literal>
                                                            <asp:HiddenField ID="HF_AssessmentDocument" runat="server" />
                                                            <asp:HiddenField ID="HF_AssessmentDocumentURL" runat="server" />
                                                        </td>
                                                        <td style="text-align: left" class="formItemBgStyle">
                                                            <asp:Label ID="Label9" runat="server" Text="<%$ Resources:lang,JiaGeJianShen%>"></asp:Label>：
                                                        </td>
                                                        <td style="text-align: left" class="formItemBgStyle">
                                                            <asp:HiddenField ID="HF_ControlMoney" runat="server" />
                                                            <asp:TextBox ID="TXT_ControlMoney" runat="server"></asp:TextBox>&nbsp;
                                                            <input type="button" id="BT_ControlMoney" class="inpu" runat="server" value="选择" onclick="SelectEmployee('TTWZSelectorMember.aspx', 'HF_ControlMoney', 'TXT_ControlMoney')" />
                                                        </td>
                                                        <td style="text-align: left" class="formItemBgStyle">
                                                            <asp:Label ID="Label10" runat="server" Text="<%$ Resources:lang,BaoJiaJieZhi%>"></asp:Label>：
                                                        </td>
                                                        <td style="text-align: left" class="formItemBgStyle">
                                                            <asp:TextBox ID="TXT_PurchaseEndTime" runat="server" onClick="WdatePicker({dateFmt:'yyyy-MM-dd'})"></asp:TextBox>
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
            </ContentTemplate>
            <Triggers>
                <asp:PostBackTrigger ControlID="BT_Upload" />
                <asp:PostBackTrigger ControlID="BT_PurchaseFile" />
            </Triggers>
        </asp:UpdatePanel>
    </form>
</body>
<script type="text/javascript" language="javascript">var cssDirectory = '<%=Session["CssDirectory"] %>'; var oLink = document.getElementById('mainCss'); oLink.href = 'css/' + cssDirectory + '/' + 'bluelightmain.css';</script></html>
