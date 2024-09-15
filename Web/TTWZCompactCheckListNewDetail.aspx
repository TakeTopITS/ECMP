<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTWZCompactCheckListNewDetail.aspx.cs" Inherits="TTWZCompactCheckListNewDetail" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>检号编辑</title>
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
                                                            <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,JianHaoBianJi%>"></asp:Label>
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
                                    <table class="formBgStyle">
                                        <tr>
                                            <td class="formItemBgStyle" style="text-align:right;">
                                                <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,JianHao%>"></asp:Label>：
                                            </td>
                                            <td class="formItemBgStyle">
                                                <asp:TextBox ID="TXT_CheckCode" runat="server"></asp:TextBox>
                                            </td>
                                            <td class="formItemBgStyle" style="text-align:right;">
                                                <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,DaoHuoShuLiang%>"></asp:Label>：
                                            </td>
                                            <td class="formItemBgStyle">
                                                <asp:TextBox ID="TXT_ArrivalGoodsNumber" runat="server" ></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="formItemBgStyle" style="text-align:right;">
                                                <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,DaoHuoMingCheng%>"></asp:Label>：
                                            </td>
                                            <td class="formItemBgStyle" colspan="3">
                                                <asp:TextBox ID="TXT_ArrivalGoodsName" runat="server" Width="300px" ></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="formItemBgStyle" style="text-align:right;">
                                                <asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,DaoHuoGuiGe%>"></asp:Label>：
                                            </td>
                                            <td class="formItemBgStyle" colspan="3">
                                                <asp:TextBox ID="TXT_ArrivalGoodsModel" runat="server" Width="700px" ></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="formItemBgStyle" style="text-align:right;">
                                                <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,ShengChanChangJia%>"></asp:Label>：
                                            </td>
                                            <td class="formItemBgStyle" colspan="3">
                                                <asp:TextBox ID="TXT_Factory" runat="server" Width="300px" ></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="formItemBgStyle" style="text-align:right;">
                                                <asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,ZhiXingBiaoZhun%>"></asp:Label>：
                                            </td>
                                            <td class="formItemBgStyle">
                                                <asp:TextBox ID="TXT_ExecutionStandard" runat="server" ></asp:TextBox>
                                            </td>
                                            <td class="formItemBgStyle" style="text-align:right;">
                                                <asp:Label ID="Label8" runat="server" Text="<%$ Resources:lang,LuPiHao%>"></asp:Label>：
                                            </td>
                                            <td class="formItemBgStyle">
                                                <asp:TextBox ID="TXT_BatchNo" runat="server" Width="200px" ></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="formItemBgStyle" style="text-align:right;">
                                                <asp:Label ID="Label9" runat="server" Text="<%$ Resources:lang,CaiJianZiLiao%>"></asp:Label>：
                                            </td>
                                            <td class="formItemBgStyle">
                                                <asp:FileUpload ID="FUP_CheckDocument" runat="server" />
                                                <asp:Button ID="BT_CheckDocument" runat="server" Text="上传" CssClass="inpu" OnClick="BT_CheckDocument_Click" /><br />
                                                <asp:Literal ID="LT_CheckDocument" runat="server"></asp:Literal>
                                                <asp:HiddenField ID="HF_CheckDocument" runat="server" />
                                                <asp:HiddenField ID="HF_CheckDocumentURL" runat="server" />
                                            </td>
                                            <td class="formItemBgStyle" style="text-align:right;">
                                                <asp:Label ID="Label10" runat="server" Text="<%$ Resources:lang,JiaoHuoZhuangTai%>"></asp:Label>：
                                            </td>
                                            <td class="formItemBgStyle">
                                                <asp:TextBox ID="TXT_DeliveryStatus" runat="server" ></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="formItemBgStyle" style="text-align:right;">
                                                <asp:Label ID="Label11" runat="server" Text="<%$ Resources:lang,FuYanJiLu%>"></asp:Label>：
                                            </td>
                                            <td class="formItemBgStyle">
                                                <asp:FileUpload ID="FUP_ReinspectionRecord" runat="server" />
                                                <asp:Button ID="BT_ReinspectionRecord" runat="server" Text="<%$ Resources:lang,ShangChuan%>" CssClass="inpu" OnClick="BT_ReinspectionRecord_Click" /><br />
                                                <asp:Literal ID="LT_ReinspectionRecord" runat="server"></asp:Literal>
                                                <asp:HiddenField ID="HF_ReinspectionRecord" runat="server" />
                                                <asp:HiddenField ID="HF_ReinspectionRecordURL" runat="server" />
                                            </td>
                                            <td class="formItemBgStyle" style="text-align:right;">
                                                <asp:Label ID="Label12" runat="server" Text="<%$ Resources:lang,CaiJianYuan%>"></asp:Label>：
                                            </td>
                                            <td class="formItemBgStyle">
                                                <asp:HiddenField ID="HF_Checker" runat="server" />
                                                <asp:TextBox ID="TXT_Checker" runat="server" ></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="formItemBgStyle" style="text-align:right;">
                                                <asp:Label ID="Label13" runat="server" Text="<%$ Resources:lang,BeiZhu%>"></asp:Label>：
                                            </td>
                                            <td class="formItemBgStyle">
                                                <asp:TextBox ID="TXT_Remark" runat="server" Width="300px" ></asp:TextBox>
                                            </td>
                                            <td class="formItemBgStyle" style="text-align:right;">
                                                <asp:Label ID="Label14" runat="server" Text="<%$ Resources:lang,CaiJianRiQi%>"></asp:Label>：
                                            </td>
                                            <td class="formItemBgStyle">
                                                <asp:TextBox ID="TXT_CheckerDate" runat="server"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="center" class="formItemBgStyle" colspan="4">
                                                <asp:Button ID="BT_Save" runat="server" Text="<%$ Resources:lang,BaoCun%>" CssClass="inpu" OnClick="BT_Save_Click" />&nbsp;
                                                <input id="btnClose()" class="inpu" onclick="window.returnValue = false;CloseLayer();"
                                                                type="button" value="关闭" />
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
                <asp:PostBackTrigger ControlID="BT_CheckDocument" />
                <asp:PostBackTrigger ControlID="BT_ReinspectionRecord" />
            </Triggers>
        </asp:UpdatePanel>
    </form>
</body>
<script type="text/javascript" language="javascript">var cssDirectory = '<%=Session["CssDirectory"] %>'; var oLink = document.getElementById('mainCss'); oLink.href = 'css/' + cssDirectory + '/' + 'bluelightmain.css';</script></html>
