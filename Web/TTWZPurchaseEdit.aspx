<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTWZPurchaseEdit.aspx.cs" Inherits="TTWZPurchaseEdit" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>采购文件</title>
    <link id="mainCss" href="css/bluelightmain.css" rel="stylesheet" type="text/css" />
    <script src="js/My97DatePicker/WdatePicker.js"></script>
    <script src="js/jquery-1.7.2.min.js"></script>
    <script src="js/allAHandler.js"></script>
    <script language="javascript">

        $(function () { 

            $("#BT_SupplierSelect").click(function () {
                var url = "TTWZSelectorSupplier.aspx";

                popShowByURLForFixedSize(url + (url.indexOf("?") == -1 ? "?" : "&") + "ctrlId=" + "TXT_PickingUnit" + "&ctrlName=" + "TXT_UnitCode", '选择供应商', 900, 500);	

            });


            $("#BT_ExpertSelect").click(function () {

                var url = "TTWZSelectorExpert.aspx";

                popShowByURLForFixedSize(url + (url.indexOf("?") == -1 ? "?" : "&") + "ctrlId=" + "TXT_PickingUnit" + "&ctrlName=" + "TXT_UnitCode", '选择专家', 900, 500);	

            });

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
    <style type="text/css">
        .auto-style2 {
            border-style: none;
            background-image: url('ImagesSkin/butbj.jpg');
            width: 71px;
            text-align: center;
            margin-left: 0px;
            margin-right: 0px;
            font-size: 12px;
            color: #000000;
            font-family: "microsoft yahei";
            cursor: pointer;
            height: 21px;
            margin-left: 0;
            margin-right: 0;
            margin-bottom: 2px;
        }
    </style>
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
                                                            <asp:Label ID="Label1" runat="server" Text="采购文件"></asp:Label>
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
                                                        <td style="text-align: left" class="formItemBgStyle"><asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,CaiGouBianHao%>"></asp:Label>：
                                                        </td>
                                                        <td style="text-align: left" class="formItemBgStyle" colspan="7">
                                                            <asp:Label ID="LB_PurchaseCode" runat="server" ></asp:Label>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="text-align: left" class="formItemBgStyle"><asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,CaiGouMingCheng%>"></asp:Label>：
                                                        </td>
                                                        <td style="text-align: left" class="formItemBgStyle">
                                                            <asp:TextBox ID="TXT_PurchaseName" runat="server"></asp:TextBox>
                                                        </td>
                                                        <td style="text-align: left" class="formItemBgStyle"><asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,XiangMuBianMa%>"></asp:Label>：
                                                        </td>
                                                        <td style="text-align: left" class="formItemBgStyle">
                                                            <asp:DropDownList ID="DDL_Project" runat="server" DataTextField="ProjectCode"
                                                                 DataValueField="ProjectCode" OnSelectedIndexChanged="DDL_Project_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
                                                        </td>
                                                        <td style="text-align: left" class="formItemBgStyle"><asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,CaiGouFangShi%>"></asp:Label>：
                                                        </td>
                                                        <td style="text-align: left" class="formItemBgStyle">
                                                            <asp:DropDownList ID="DDL_PurchaseMethod" runat="server">
                                                                <asp:ListItem Text="<%$ Resources:lang,XunBiJia%>" Value="询比价"/>
                                                                <asp:ListItem Text="<%$ Resources:lang,ZhaoBiao%>" Value="招标"/>
                                                                <asp:ListItem Text="<%$ Resources:lang,KuangJia%>" Value="框架"/>
                                                                <asp:ListItem Text="<%$ Resources:lang,DuJia%>" Value="独家"/>
                                                                <asp:ListItem Text="<%$ Resources:lang,YiJia%>" Value="议价"/>
                                                                <asp:ListItem Text="<%$ Resources:lang,JinJi%>" Value="紧急"/>
                                                                <asp:ListItem Text="<%$ Resources:lang,XiaoE%>" Value="小额"/>
                                                            </asp:DropDownList>
                                                        </td>
                                                        <td style="text-align: left" class="formItemBgStyle"><asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,BaoJiaJieZhi%>"></asp:Label>：
                                                        </td>
                                                        <td style="text-align: left" class="formItemBgStyle">
                                                            <asp:TextBox ID="TXT_PurchaseEndTime" runat="server" onClick="WdatePicker({dateFmt:'yyyy-MM-dd'})"></asp:TextBox>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="text-align: left" class="formItemBgStyle"><asp:Label ID="Label8" runat="server" Text="<%$ Resources:lang,CaiGouWenJian%>"></asp:Label>：
                                                        </td>
                                                        <td style="text-align: left" class="formItemBgStyle">
                                                            <asp:FileUpload ID="FUP_PurchaseDocument" runat="server" />
                                                            <asp:Button ID="BT_PurchaseFile" runat="server" Text="<%$ Resources:lang,ShangChuan%>" CssClass="inpu" OnClick="BT_PurchaseFile_Click" /><br />
                                                            <asp:Literal ID="LT_PurchaseDocument" runat="server"></asp:Literal>
                                                            <asp:HiddenField ID="HF_PurchaseDocument" runat="server" />
                                                            <asp:HiddenField ID="HF_PurchaseDocumentURL" runat="server" />
                                                        </td>
                                                        <td style="text-align: left" class="formItemBgStyle"><asp:Label ID="Label9" runat="server" Text="<%$ Resources:lang,ShangJiZhuGuan%>"></asp:Label>：
                                                        </td>
                                                        <td style="text-align: left" class="formItemBgStyle">
                                                            <asp:HiddenField ID="HF_UpLeader" runat="server" />
                                                            <asp:TextBox ID="TXT_UpLeader" runat="server"></asp:TextBox>&nbsp;
                                                            <input type="button" id="btnProjectManager" class="inpu" runat="server" value="选择" onclick="SelectEmployee('TTWZSelectorMember.aspx', 'HF_UpLeader', 'TXT_UpLeader')" />
                                                        </td>
                                                        <td style="text-align: left" class="formItemBgStyle"></td>
                                                        <td style="text-align: left" class="formItemBgStyle"></td>
                                                        <td style="text-align: left" class="formItemBgStyle"></td>
                                                        <td style="text-align: left" class="formItemBgStyle"></td>
                                                    </tr>
                                                    <tr style ="display :none ;">
                                                        <td style="text-align: left" class="formItemBgStyle"><asp:Label ID="Label10" runat="server" Text="<%$ Resources:lang,GongYingShang%>"></asp:Label>：
                                                        </td>
                                                        <td style="text-align: left" class="formItemBgStyle" colspan="7">
                                                            <asp:TextBox ID="TXT_Supplier" runat="server" Width="400px"></asp:TextBox>
                                                            <asp:HiddenField ID="HF_Supplier" runat="server" />
                                                            &nbsp;
                                                            <asp:Button ID="BT_SuppierSystem" runat="server" Text="<%$ Resources:lang,ZiDongXuanZe%>" CssClass="inpu" OnClick="BT_SuppierSystem_Click" />&nbsp;
                                                            <input type="button" class="inpu" value="手动选择" id="BT_SupplierSelect" />&nbsp;
                                                            <font color="red"><asp:Label ID="Label11" runat="server" Text="<%$ Resources:lang,GongYingShangDuoGeYiFenKai%>"></asp:Label></font><br />
                                                            <asp:Repeater ID="RPT_PurchaseSupplier" runat="server" OnItemCommand="RPT_PurchaseDocument_ItemCommand">
                                                                <HeaderTemplate>
                                                                    <table>
                                                                </HeaderTemplate>
                                                                <ItemTemplate>
                                                                    <tr>
                                                                        <td>
                                                                            <%# Eval("SupplierName") %>
                                                                        </td>
                                                                        <td>
                                                                            <asp:LinkButton ID="LB_Del" CommandName="del" CommandArgument='<%# Eval("ID") %>' runat="server"><asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,ShanChu%>"></asp:Label></asp:LinkButton>
                                                                        </td>
                                                                    </tr>
                                                                </ItemTemplate>
                                                                <FooterTemplate>
                                                                    </table>
                                                                </FooterTemplate>
                                                            </asp:Repeater>
                                                        </td>
                                                    </tr>
                                                    <tr style ="display :none ;">
                                                        <td style="text-align: left" class="formItemBgStyle"><asp:Label ID="Label12" runat="server" Text="<%$ Resources:lang,ZhuanJia%>"></asp:Label>：
                                                        </td>
                                                        <td style="text-align: left" class="formItemBgStyle" colspan="7">
                                                            <asp:TextBox ID="TXT_Expert" runat="server" Width="400px"></asp:TextBox>
                                                            <asp:HiddenField ID="HF_Expert" runat="server" />
                                                            &nbsp;
                                                            <asp:Button ID="BT_ExpertSystem" runat="server" Text="<%$ Resources:lang,ZiDongXuanZe%>" CssClass="inpu" OnClick="BT_ExpertSystem_Click" />&nbsp;
                                                            <input type="button" class="inpu" value="手动选择" id="BT_ExpertSelect" />&nbsp;
                                                            <font color="red"><asp:Label ID="Label13" runat="server" Text="<%$ Resources:lang,GongYingShangDuoGeYiFenKai%>"></asp:Label></font><br />
                                                            <asp:Repeater ID="RPT_PurchaseExpert" runat="server" OnItemCommand="RPT_PurchaseExpert_ItemCommand">
                                                                <HeaderTemplate>
                                                                    <table>
                                                                </HeaderTemplate>
                                                                <ItemTemplate>
                                                                    <tr>
                                                                        <td>
                                                                            <%# Eval("ExpertName") %>
                                                                        </td>
                                                                        <td>
                                                                            <asp:LinkButton ID="LB_Del" CommandName="del" CommandArgument='<%# Eval("ID") %>' runat="server"><asp:Label ID="Label1" runat="server" ></asp:Label>删除</asp:LinkButton>
                                                                        </td>
                                                                    </tr>
                                                                </ItemTemplate>
                                                                <FooterTemplate>
                                                                    </table>
                                                                </FooterTemplate>
                                                            </asp:Repeater>
                                                        </td>
                                                    </tr>
                                                     <tr style ="display :none ;">
                                                        <td style="text-align: left" class="formItemBgStyle"><asp:Label ID="Label14" runat="server" Text="<%$ Resources:lang,BaoJiaWenJian%>"></asp:Label>：
                                                        </td>
                                                        <td style="text-align: left" class="formItemBgStyle" colspan="7">
                                                            <asp:FileUpload ID="FUP_PurchaseOfferDocument" runat="server" />&nbsp;
                                                            <asp:Button ID="BT_Upload" runat="server" Text="<%$ Resources:lang,ShangChuan%>" CssClass="inpu" OnClick="BT_Upload_Click" /><br />
                                                            <asp:Repeater ID="RPT_PurchaseDocument" runat="server" OnItemCommand="RPT_PurchaseDocument_ItemCommand">
                                                                <HeaderTemplate>
                                                                    <table>
                                                                </HeaderTemplate>
                                                                <ItemTemplate>
                                                                    <tr>
                                                                        <td>
                                                                          <a href="  <%# Eval("DocumentURL") %>  ">   <%# Eval("DocumentName") %> </a>
                                                                        </td>
                                                                        <td>
                                                                            <asp:LinkButton ID="LB_Del" CommandName="del" CommandArgument='<%# Eval("ID") %>' runat="server"><asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,ShanChu%>"></asp:Label></asp:LinkButton>
                                                                        </td>
                                                                    </tr>
                                                                </ItemTemplate>
                                                                <FooterTemplate>
                                                                    </table>
                                                                </FooterTemplate>
                                                            </asp:Repeater>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="text-align: center" class="formItemBgStyle" colspan="8">
                                                            <asp:Button ID="btnOK" runat="server" Text="<%$ Resources:lang,BaoCun%>" CssClass="inpu" OnClick="btnOK_Click" />&nbsp;&nbsp;
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
                <asp:HiddenField ID="HF_PurchaseManager" runat="server" />
                <asp:HiddenField ID="HF_Decision" runat="server" />
            </ContentTemplate>
            <Triggers>
                <asp:PostBackTrigger ControlID="btnOK" />
                <asp:PostBackTrigger ControlID="DDL_Project" />
                <asp:PostBackTrigger ControlID="BT_Upload" />
                <asp:PostBackTrigger ControlID="BT_PurchaseFile" />
                <asp:PostBackTrigger ControlID="BT_SuppierSystem" />
                <asp:PostBackTrigger ControlID="BT_ExpertSystem" />
            </Triggers>
        </asp:UpdatePanel>
    </form>
</body>
<script type="text/javascript" language="javascript">var cssDirectory = '<%=Session["CssDirectory"] %>'; var oLink = document.getElementById('mainCss'); oLink.href = 'css/' + cssDirectory + '/' + 'bluelightmain.css';</script></html>
