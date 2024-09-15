<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTWZRequestList.aspx.cs" Inherits="TTWZRequestList" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>请款单</title>
    <link id="mainCss" href="css/bluelightmain.css" rel="stylesheet" type="text/css" />
    <script src="js/jquery-1.7.2.min.js"></script>
    <script src="js/allAHandler.js"></script>
    <script language="javascript">

        $(function () { 
           

            ControlStatusCloseChange();

        });


        function PrintRequestPage(requestCode) {
            var strUrl = "TTWZRequestPrintPage.aspx?requestCode=" + requestCode;
            var strOtherUrl = "TTWZRequestDetailPrintPage.aspx?requestCode=" + requestCode;

            window.open(strUrl);
            window.open(strOtherUrl);
        }


        function ControlStatusChange(objProgress) {

            $("#BT_NewEdit").attr("class", "inpu");
            $("#BT_NewEdit").removeAttr("disabled");
            $("#BT_NewCollect").attr("class", "inpu");
            $("#BT_NewCollect").removeAttr("disabled");

            //alert(objProgress);
            if (objProgress == "录入") {
                $("#BT_NewDelete").attr("class", "inpu");
                $("#BT_NewDelete").removeAttr("disabled");                            //删除
                $("#BT_NewRequest").attr("class", "inpu");
                $("#BT_NewRequest").removeAttr("disabled");                          //请款
                $("#BT_NewReturn").attr("disabled", "disabled");
                $("#BT_NewReturn").removeClass("inpu");                         //退回
                $("#BT_NewPrint").attr("disabled", "disabled");
                $("#BT_NewPrint").removeClass("inpu");                         //打印
            }
            else if (objProgress == "请款") {
                $("#BT_NewDelete").attr("disabled", "disabled");
                $("#BT_NewDelete").removeClass("inpu");                            //删除
                $("#BT_NewRequest").attr("disabled", "disabled");
                $("#BT_NewRequest").removeClass("inpu");                          //请款
                $("#BT_NewReturn").attr("class", "inpu");
                $("#BT_NewReturn").removeAttr("disabled");                         //退回
                $("#BT_NewPrint").attr("disabled", "disabled");
                $("#BT_NewPrint").removeClass("inpu");                            //打印
            }
            else if (objProgress == "报销") {
                $("#BT_NewDelete").attr("disabled", "disabled");
                $("#BT_NewDelete").removeClass("inpu");                            //删除
                $("#BT_NewRequest").attr("disabled", "disabled");
                $("#BT_NewRequest").removeClass("inpu");                          //请款
                $("#BT_NewReturn").attr("disabled", "disabled");
                $("#BT_NewReturn").removeClass("inpu");                            //退回
                $("#BT_NewPrint").attr("class", "inpu");
                $("#BT_NewPrint").removeAttr("disabled");                         //生效
            }
            else {
                $("#BT_NewEdit").attr("disabled", "disabled");
                $("#BT_NewEdit").removeClass("inpu");
                $("#BT_NewDelete").attr("disabled", "disabled");
                $("#BT_NewDelete").removeClass("inpu");
                $("#BT_NewCollect").attr("disabled", "disabled");
                $("#BT_NewCollect").removeClass("inpu");
                $("#BT_NewRequest").attr("disabled", "disabled");
                $("#BT_NewRequest").removeClass("inpu");
                $("#BT_NewReturn").attr("disabled", "disabled");
                $("#BT_NewReturn").removeClass("inpu");
                $("#BT_NewPrint").attr("disabled", "disabled");
                $("#BT_NewPrint").removeClass("inpu");
            }
        }

        function ControlStatusCloseChange() {
            $("#BT_NewEdit").attr("disabled", "disabled");
            $("#BT_NewEdit").removeClass("inpu");
            $("#BT_NewDelete").attr("disabled", "disabled");
            $("#BT_NewDelete").removeClass("inpu");
            $("#BT_NewCollect").attr("disabled", "disabled");
            $("#BT_NewCollect").removeClass("inpu");
            $("#BT_NewRequest").attr("disabled", "disabled");
            $("#BT_NewRequest").removeClass("inpu");
            $("#BT_NewReturn").attr("disabled", "disabled");
            $("#BT_NewReturn").removeClass("inpu");
            $("#BT_NewPrint").attr("disabled", "disabled");
            $("#BT_NewPrint").removeClass("inpu");
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
                                                            <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,QingKuanDan%>"></asp:Label>
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
                                                <table class="formBgStyle" width="40%">
                                                    <tr>
                                                        <td class="formItemBgStyle">
                                                            <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,QingKuanDanHao%>"></asp:Label>：
                                                        </td>
                                                        <td style="text-align: left" class="formItemBgStyle" colspan="5">
                                                            <asp:TextBox ID="TXT_RequestCode" runat="server" ReadOnly="true"></asp:TextBox><font color="red">*<asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,XiTongZiDongShengCheng%>"></asp:Label></font>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="text-align: left" class="formItemBgStyle">
                                                            <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,HeTongBianHao%>"></asp:Label>：</td>
                                                        <td style="text-align: left" class="formItemBgStyle">
                                                            <asp:DropDownList ID="DDL_Compact" DataTextField="CompactCode" DataValueField="CompactCode"
                                                                 OnSelectedIndexChanged="DDL_Compact_SelectedIndexChanged" AutoPostBack="true"  runat="server">
                                                            </asp:DropDownList>
                                                        </td>
                                                        <td style="text-align: left" class="formItemBgStyle">
                                                            <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,XiangMuBianMa%>"></asp:Label>：</td>
                                                        <td style="text-align: left" class="formItemBgStyle">
                                                            <asp:TextBox ID="TXT_ProjectCode" runat="server" ReadOnly="true"></asp:TextBox>
                                                        </td>
                                                        <td style="text-align: left" class="formItemBgStyle">
                                                            <asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,GongFangBianHao%>"></asp:Label>：</td>
                                                        <td style="text-align: left" class="formItemBgStyle">
                                                            <asp:TextBox ID="TXT_SupplierName" runat="server" ReadOnly="true"></asp:TextBox>
                                                            <asp:HiddenField ID="HF_SupplierCode" runat="server" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="text-align: left" class="formItemBgStyle">
                                                            <asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,YongTu%>"></asp:Label>：</td>
                                                        <td style="text-align: left" class="formItemBgStyle">
                                                            <asp:DropDownList ID="DDL_UseWay" runat="server">
                                                                <asp:ListItem Text="" Value=""/>
                                                                <asp:ListItem Text="<%$ Resources:lang,FuCaiLiaoKuan%>" Value="付材料款"/>
                                                                <asp:ListItem Text="<%$ Resources:lang,FuSheBeiKuan%>" Value="付设备款"/>
                                                                <asp:ListItem Text="<%$ Resources:lang,FuQiTaKuan%>" Value="付其它款"/>
                                                            </asp:DropDownList>
                                                        </td>
                                                        <td style="text-align: left" class="formItemBgStyle">
                                                            <asp:Label ID="Label8" runat="server" Text="<%$ Resources:lang,CaiWuShenHe%>"></asp:Label>：</td>
                                                        <td style="text-align: left" class="formItemBgStyle" colspan="3">
                                                            <asp:HiddenField ID="HF_Approver" runat="server" />
                                                            <asp:TextBox ID="TXT_Approver" runat="server"></asp:TextBox>&nbsp;
                                                            <input type="button" id="btnPurchaseManager" class="inpu" runat="server" value="选择" onclick="SelectEmployee('TTWZSelectorMember.aspx', 'HF_Approver', 'TXT_Approver')" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="text-align: center" class="formItemBgStyle" valign="top" colspan="6">
                                                            <asp:Button ID="BT_Create" runat="server" Text="<%$ Resources:lang,XinJian%>" CssClass="inpu" OnClick="BT_Create_Click" />&nbsp;
                                                            <asp:Button ID="BT_Edit" runat="server" Text="<%$ Resources:lang,BaoCun%>" CssClass="inpu" OnClick="BT_Edit_Click" />&nbsp;
                                                            <asp:Button ID="BT_Save" runat="server" Text="<%$ Resources:lang,BaoCun%>" CssClass="inpu" OnClick="BT_Save_Click" Visible="false" />
                                                            <asp:Button ID="BT_Reset" runat="server" Text="<%$ Resources:lang,QuXiao%>" CssClass="inpu" OnClick="BT_Reset_Click" />&nbsp;
                                                            <asp:Button ID="BT_MoreAdd" runat="server" Text="<%$ Resources:lang,ShouLiaoDanBiaoZhu%>" CssClass="inpuLong" OnClick="BT_MoreAdd_Click" />&nbsp;
                                                            <asp:Button ID="BT_MoreDel" runat="server" Text="<%$ Resources:lang,ShouLiaoDanQuXiao%>" CssClass="inpuLong" OnClick="BT_MoreDel_Click" />&nbsp;
                                                            <asp:Button ID="BT_Print" runat="server" Text="<%$ Resources:lang,DaYin%>" CssClass="inpuLong" OnClick="BT_Print_Click" Visible="false" />&nbsp;
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="formItemBgStyle" valign="top" colspan="6">
                                                            <asp:Button ID="BT_NewEdit" runat="server" Text="<%$ Resources:lang,BianJi%>" CssClass="inpu" OnClick="BT_NewEdit_Click" />&nbsp;
                                                            <asp:Button ID="BT_NewDelete" runat="server" Text="<%$ Resources:lang,ShanChu%>" CssClass="inpu" OnClick="BT_NewDelete_Click" OnClientClick="return confirm(getDeleteMsgByLangCode())"/>&nbsp;
                                                            <asp:Button ID="BT_NewCollect" runat="server" Text="<%$ Resources:lang,ShouLiaoDan%>" CssClass="inpu" OnClick="BT_NewCollect_Click" />&nbsp;
                                                            <asp:Button ID="BT_NewRequest" runat="server" Text="<%$ Resources:lang,QingKuan%>" CssClass="inpu" OnClick="BT_NewRequest_Click" />&nbsp;
                                                            <asp:Button ID="BT_NewReturn" runat="server" Text="<%$ Resources:lang,TuiHui%>" CssClass="inpu" OnClick="BT_NewReturn_Click" />&nbsp;
                                                            <asp:Button ID="BT_NewPrint" runat="server" Text="<%$ Resources:lang,DaYin%>" CssClass="inpu" OnClick="BT_NewPrint_Click" />&nbsp;
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr style="height: 400px; overflow-y: auto;">
                                            <td valign="top" style="padding-top: 5px;">
                                                <div style="width: 2000px;">
                                                    <table width="100%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                                        <tr>
                                                            <td width="7">
                                                                <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" />
                                                            </td>
                                                            <td>
                                                                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                    <tr>
                                                                        <td width="3%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="Label9" runat="server" Text="<%$ Resources:lang,CaoZuo%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="4%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="Label10" runat="server" Text="<%$ Resources:lang,QingKuanDanHao%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="4%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="Label11" runat="server" Text="<%$ Resources:lang,HeTongBianHao%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="4%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="Label12" runat="server" Text="<%$ Resources:lang,XiangMuBianMa%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="8%" align="left">
                                                                            <strong>
                                                                                <asp:Label ID="Label13" runat="server" Text="<%$ Resources:lang,GongFangMingCheng%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="4%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="Label14" runat="server" Text="<%$ Resources:lang,YongTu%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="5%" align="right">
                                                                            <strong>
                                                                                <asp:Label ID="Label15" runat="server" Text="<%$ Resources:lang,ShiGouJinE%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="5%" align="right">
                                                                            <strong>
                                                                                <asp:Label ID="Label16" runat="server" Text="<%$ Resources:lang,ShuiJin%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="4%" align="right">
                                                                            <strong>
                                                                                <asp:Label ID="Label17" runat="server" Text="<%$ Resources:lang,YunFei%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="4%" align="right">
                                                                            <strong>
                                                                                <asp:Label ID="Label18" runat="server" Text="<%$ Resources:lang,QiTa%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="5%" align="right">
                                                                            <strong>
                                                                                <asp:Label ID="Label19" runat="server" Text="<%$ Resources:lang,JieKuanJinE%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="4%" align="right">
                                                                            <strong>
                                                                                <asp:Label ID="Label20" runat="server" Text="<%$ Resources:lang,LiaoDanZhangShu%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="4%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="Label21" runat="server" Text="<%$ Resources:lang,JieKuanRen%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="4%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="Label22" runat="server" Text="<%$ Resources:lang,QingKuanRiQi%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="4%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="Label23" runat="server" Text="<%$ Resources:lang,CaiWuShenHe%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="4%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="Label24" runat="server" Text="<%$ Resources:lang,BaoXiaoRiQi%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="4%" align="right">
                                                                            <strong>
                                                                                <asp:Label ID="Label25" runat="server" Text="<%$ Resources:lang,YuFuKuan%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="4%" align="right">
                                                                            <strong>
                                                                                <asp:Label ID="Label26" runat="server" Text="<%$ Resources:lang,YiFuKuan%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="4%" align="right">
                                                                            <strong>
                                                                                <asp:Label ID="Label27" runat="server" Text="<%$ Resources:lang,QianKuan%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="4%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="Label28" runat="server" Text="<%$ Resources:lang,JinDu%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="4%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="Label29" runat="server" Text="<%$ Resources:lang,FuKuanBiaoZhi%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="4%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="Label30" runat="server" Text="<%$ Resources:lang,WanChengBiaoJi%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="4%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="Label31" runat="server" Text="<%$ Resources:lang,ShiYongBiaoJi%>"></asp:Label></strong>
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </td>
                                                            <td width="6" align="right">
                                                                <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" />
                                                            </td>
                                                        </tr>
                                                    </table>
                                                    <asp:DataGrid ID="DG_Request" runat="server" AllowPaging="true" AutoGenerateColumns="False"
                                                        CellPadding="4" ForeColor="#333333" GridLines="None" Height="1px" PageSize="3" ShowHeader="false"
                                                        Width="100%" OnItemCommand="DG_Request_ItemCommand" OnPageIndexChanged="DG_Request_PageIndexChanged">
                                                        <Columns>
                                                            <asp:TemplateColumn>
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="3%" />
                                                                <HeaderTemplate>
                                                                    <asp:Label ID="Label32" runat="server" Text="<%$ Resources:lang,CaoZuo%>"></asp:Label>
                                                                </HeaderTemplate>
                                                                <ItemTemplate>

                                                                    <%--<input type="checkbox" name="cb_Request_Code" value='<%#Eval("RequestCode") %>' checked="checked" style="display:none;" />--%>
                                                                    <asp:LinkButton ID="LinkButton2" runat="server" CommandArgument='<%#Eval("RequestCode")+"|"+Eval("Progress") %>' CommandName="click" CssClass="notTab">
                                                                        <asp:Label ID="Label69" runat="server" Text="<%$ Resources:lang,CaoZuo%>"></asp:Label></asp:LinkButton>
                                                                    <%--<asp:LinkButton ID="LinkButton1" runat="server" CommandArgument='<%#Eval("RequestCode") %>' CommandName="del" CssClass="notTab" Visible='<%# Eval("Progress").ToString()=="录入" ? true : false %>'>删除</asp:LinkButton>--%>
                                                                    <%--<asp:LinkButton ID="LinkButton2" runat="server" CommandArgument='<%#Eval("RequestCode") %>' CommandName="edit" CssClass="notTab">编辑</asp:LinkButton>--%>
                                                                    <%--<asp:LinkButton ID="LinkButton3" runat="server" CommandArgument='<%#Eval("RequestCode") %>' CommandName="collect" CssClass="notTab">收料单</asp:LinkButton>--%>
                                                                    <%--<asp:LinkButton ID="LinkButton4" runat="server" CommandArgument='<%#Eval("RequestCode") %>' CommandName="request" CssClass="notTab" Visible='<%# Eval("Progress").ToString()=="录入" ? true : false %>'>请款</asp:LinkButton>--%>
                                                                    <%--<asp:LinkButton ID="LinkButton5" runat="server" CommandArgument='<%#Eval("RequestCode") %>' CommandName="notRequest" CssClass="notTab" Visible='<%# Eval("Progress").ToString()=="请款" ? true : false %>'>退回</asp:LinkButton>--%>
                                                                    <%--<asp:LinkButton ID="LinkButton6" runat="server" CommandArgument='<%#Eval("RequestCode") %>' CommandName="print" CssClass="notTab" Visible='<%# Eval("Progress").ToString()=="报销" ? true : false %>'>打印</asp:LinkButton>--%>
                                                                    
                                                                </ItemTemplate>
                                                            </asp:TemplateColumn>
                                                            <asp:BoundColumn DataField="RequestCode" HeaderText="请款单号">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="4%" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="CompactCode" HeaderText="合同编号">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="4%" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="ProjectCode" HeaderText="项目编码">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="4%" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="SupplierName" HeaderText="供方名称">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="8%" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="UseWay" HeaderText="用途">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="4%" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="ActualMoney" HeaderText="实购金额">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Right" Width="5%" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="RatioMoney" HeaderText="税金">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Right" Width="5%" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="Freight" HeaderText="运费">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Right" Width="4%" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="OtherObject" HeaderText="其它">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Right" Width="4%" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="BorrowMoney" HeaderText="借款金额">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Right" Width="5%" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="RowNumber" HeaderText="料单张数">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Right" Width="4%" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="BorrowerName" HeaderText="借款人">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="4%" />
                                                            </asp:BoundColumn>
                                                            <%--<asp:BoundColumn DataField="RequestTime" HeaderText="请款日期">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="4%" />
                                                            </asp:BoundColumn>--%>
                                                            <asp:TemplateColumn>
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="4%" />
                                                                <HeaderTemplate>
                                                                    <asp:Label ID="Label33" runat="server" Text="<%$ Resources:lang,QingKuanRiQi%>"></asp:Label>
                                                                </HeaderTemplate>
                                                                <ItemTemplate>
                                                                    <%#DataBinder.Eval(Container.DataItem, "RequestTime", "{0:yyyy/MM/dd}")%>
                                                                </ItemTemplate>
                                                            </asp:TemplateColumn>
                                                            <asp:BoundColumn DataField="ApproverName" HeaderText="财务审核">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="4%" />
                                                            </asp:BoundColumn>
                                                            <%--<asp:BoundColumn DataField="CancelTime" HeaderText="报销日期">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="4%" />
                                                            </asp:BoundColumn>--%>
                                                            <asp:TemplateColumn>
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="4%" />
                                                                <HeaderTemplate>
                                                                    <asp:Label ID="Label34" runat="server" Text="<%$ Resources:lang,BaoXiaoRiQi%>"></asp:Label>
                                                                </HeaderTemplate>
                                                                <ItemTemplate>
                                                                    <%# ShareClass.StringCutByRequire(Eval("CancelTime").ToString(), 190) %>
                                                                </ItemTemplate>
                                                            </asp:TemplateColumn>
                                                            <asp:BoundColumn DataField="BeforePayMoney" HeaderText="预付款">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Right" Width="4%" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="PayMoney" HeaderText="已付款">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Right" Width="4%" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="Arrearage" HeaderText="欠款">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Right" Width="4%" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="Progress" HeaderText="进度">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="4%" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="IsPay" HeaderText="付款标志">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="4%" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="IsFinisth" HeaderText="完成标记">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="4%" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="IsMark" HeaderText="使用标记">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="4%" />
                                                            </asp:BoundColumn>
                                                        </Columns>
                                                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                        <EditItemStyle BackColor="#2461BF" />
                                                        <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                        <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />
                                                        
                                                        <ItemStyle CssClass="itemStyle" />
                                                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" HorizontalAlign="Center" />
                                                    </asp:DataGrid>
                                                </div>
                                                <asp:Label ID="LB_RequestSql" runat="server" Visible="False"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="formItemBgStyle">
                                                <div style="width: 2800px;">
                                                    <table width="100%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                                        <tr>
                                                            <td width="7">
                                                                <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" />
                                                            </td>
                                                            <td>
                                                                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                    <tr>
                                                                        <td width="2%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="Label35" runat="server" Text="<%$ Resources:lang,CaoZuo%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="3%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="Label36" runat="server" Text="<%$ Resources:lang,ShouLiaoDanHao%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="3%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="Label37" runat="server" Text="<%$ Resources:lang,HeTongBianHao%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="3%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="Label38" runat="server" Text="<%$ Resources:lang,XiangMuBianMa%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="3%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="Label39" runat="server" Text="<%$ Resources:lang,WuZiDaiMa%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="4%" align="left">
                                                                            <strong>
                                                                                <asp:Label ID="Label40" runat="server" Text="<%$ Resources:lang,WuZiMingCheng%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="3%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="Label41" runat="server" Text="<%$ Resources:lang,KuBie%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="3%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="Label42" runat="server" Text="<%$ Resources:lang,KaiPiaoRiQi%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="3%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="Label43" runat="server" Text="<%$ Resources:lang,ShouLiaoFangShi%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="3%" align="right">
                                                                            <strong>
                                                                                <asp:Label ID="Label44" runat="server" Text="<%$ Resources:lang,YingShouShuLiang%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="3%" align="right">
                                                                            <strong>
                                                                                <asp:Label ID="Label45" runat="server" Text="<%$ Resources:lang,ShiShouShuLiang%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="3%" align="right">
                                                                            <strong>
                                                                                <asp:Label ID="Label46" runat="server" Text="<%$ Resources:lang,ShiGouDanJia%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="3%" align="right">
                                                                            <strong>
                                                                                <asp:Label ID="Label47" runat="server" Text="<%$ Resources:lang,ShiGouJinE%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="3%" align="right">
                                                                            <strong>
                                                                                <asp:Label ID="Label48" runat="server" Text="<%$ Resources:lang,ShuiLv%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="3%" align="right">
                                                                            <strong>
                                                                                <asp:Label ID="Label49" runat="server" Text="<%$ Resources:lang,ShuiJin%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="3%" align="right">
                                                                            <strong>
                                                                                <asp:Label ID="Label50" runat="server" Text="<%$ Resources:lang,YunFei%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="3%" align="right">
                                                                            <strong>
                                                                                <asp:Label ID="Label51" runat="server" Text="<%$ Resources:lang,QiTa%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="3%" align="right">
                                                                            <strong>
                                                                                <asp:Label ID="Label52" runat="server" Text="<%$ Resources:lang,HuanSuanShuLiang%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="3%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="Label53" runat="server" Text="<%$ Resources:lang,GongFangBianHao%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="3%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="Label54" runat="server" Text="<%$ Resources:lang,FaPiaoHaoMa%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="3%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="Label55" runat="server" Text="<%$ Resources:lang,JianHao%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="3%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="Label56" runat="server" Text="<%$ Resources:lang,CaiJianYuan%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="3%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="Label57" runat="server" Text="<%$ Resources:lang,CaiJianRiQi%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="3%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="Label58" runat="server" Text="<%$ Resources:lang,BaoGuanYuan%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="3%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="Label59" runat="server" Text="<%$ Resources:lang,ShouLiaoRiQi%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="3%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="Label60" runat="server" Text="<%$ Resources:lang,HeTongYuan%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="3%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="Label61" runat="server" Text="<%$ Resources:lang,QingKuanDanHao%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="3%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="Label62" runat="server" Text="<%$ Resources:lang,CaiWuShenHe%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="3%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="Label63" runat="server" Text="<%$ Resources:lang,BaoXiaoJinDu%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="3%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="Label64" runat="server" Text="<%$ Resources:lang,JinDu%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="3%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="Label65" runat="server" Text="<%$ Resources:lang,ShiYongBiaoJi%>"></asp:Label></strong>
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </td>
                                                            <td width="6" align="right">
                                                                <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" />
                                                            </td>
                                                        </tr>
                                                    </table>
                                                    <asp:DataGrid ID="DG_Collect" runat="server" AllowPaging="False" AutoGenerateColumns="False"
                                                        CellPadding="4" ForeColor="#333333" GridLines="None" Height="1px" PageSize="5" ShowHeader="false"
                                                        Width="100%">
                                                        <Columns>
                                                            <asp:TemplateColumn>
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="2%" />
                                                                <HeaderTemplate>
                                                                    <asp:Label ID="Label66" runat="server" Text="<%$ Resources:lang,CaoZuo%>"></asp:Label>
                                                                </HeaderTemplate>
                                                                <ItemTemplate>
                                                                    <input type="checkbox" name="cb_Collect_Code" value='<%#Eval("CollectCode") %>' checked="checked" />
                                                                </ItemTemplate>
                                                            </asp:TemplateColumn>
                                                            <asp:BoundColumn DataField="CollectCode" HeaderText="收料单号">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="3%" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="CompactCode" HeaderText="合同编号">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="3%" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="ProjectCode" HeaderText="项目编码">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="3%" />
                                                            </asp:BoundColumn>
                                                            <%--<asp:BoundColumn DataField="PlanDetailID" HeaderText="计划编号">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="3%" />
                                                            </asp:BoundColumn>--%>
                                                            <asp:BoundColumn DataField="ObjectCode" HeaderText="物资代码">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="3%" />
                                                            </asp:BoundColumn>
                                                            <%--<asp:BoundColumn DataField="ObjectName" HeaderText="物资名称">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="4%" />
                                                            </asp:BoundColumn>--%>
                                                            <asp:TemplateColumn>
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="4%" />
                                                                <HeaderTemplate>
                                                                    <asp:Label ID="Label67" runat="server" Text="<%$ Resources:lang,WuZiMingCheng%>"></asp:Label>
                                                                </HeaderTemplate>
                                                                <ItemTemplate>
                                                                    <%# ShareClass.StringCutByRequire(Eval("ObjectName").ToString(), 192) %>
                                                                </ItemTemplate>
                                                            </asp:TemplateColumn>
                                                            <asp:BoundColumn DataField="StoreRoom" HeaderText="库别">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="3%" />
                                                            </asp:BoundColumn>
                                                            <%--<asp:BoundColumn DataField="TicketTime" HeaderText="开票日期">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="3%" />
                                                            </asp:BoundColumn>--%>
                                                            <asp:TemplateColumn>
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="3%" />
                                                                <HeaderTemplate>
                                                                    <asp:Label ID="Label68" runat="server" Text="<%$ Resources:lang,KaiPiaoRiQi%>"></asp:Label>
                                                                </HeaderTemplate>
                                                                <ItemTemplate>
                                                                    <%#DataBinder.Eval(Container.DataItem, "TicketTime", "{0:yyyy/MM/dd}")%>
                                                                </ItemTemplate>
                                                            </asp:TemplateColumn>
                                                            <asp:BoundColumn DataField="CollectMethod" HeaderText="收料方式">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="3%" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="CollectNumber" HeaderText="应收数量">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Right" Width="3%" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="ActualNumber" HeaderText="实收数量">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Right" Width="3%" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="ActualPrice" HeaderText="实购单价">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Right" Width="3%" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="ActualMoney" HeaderText="实购金额">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Right" Width="3%" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="Ratio" HeaderText="税率">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Right" Width="3%" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="RatioMoney" HeaderText="税金">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Right" Width="3%" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="Freight" HeaderText="运费">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Right" Width="3%" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="OtherObject" HeaderText="其它">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Right" Width="3%" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="ConvertNumber" HeaderText="换算数量">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Right" Width="3%" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="SupplierName" HeaderText="供方编号">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="3%" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="TicketNumber" HeaderText="发票号码">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="3%" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="CheckCode" HeaderText="检号">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="3%" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="CheckerName" HeaderText="材检员">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="3%" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="CheckTime" HeaderText="材检日期">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="3%" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="SafekeeperName" HeaderText="保管员">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="3%" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="CollectTime" HeaderText="收料日期">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="3%" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="ContacterName" HeaderText="合同员">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="3%" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="RequestCode" HeaderText="请款单号">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="3%" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="FinanceApproveName" HeaderText="财务审核">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="3%" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="PayProcess" HeaderText="报销进度">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="3%" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="Progress" HeaderText="进度">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="3%" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="IsMark" HeaderText="使用标记">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="3%" />
                                                            </asp:BoundColumn>
                                                        </Columns>
                                                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                        <EditItemStyle BackColor="#2461BF" />
                                                        <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                        <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />
                                                        
                                                        <ItemStyle CssClass="itemStyle" />
                                                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" HorizontalAlign="Center" />
                                                    </asp:DataGrid>
                                                </div>

                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
                <asp:HiddenField ID="HF_RequestCode" runat="server" />

                <asp:HiddenField ID="HF_NewRequestCode" runat="server" />
                <asp:HiddenField ID="HF_NewProgress" runat="server" />
            </ContentTemplate>
            <Triggers>
                <asp:PostBackTrigger ControlID="BT_Save" />
                <asp:PostBackTrigger ControlID="BT_Reset" />
                <asp:PostBackTrigger ControlID="BT_MoreAdd" />
                <asp:PostBackTrigger ControlID="BT_MoreDel" />
                <asp:PostBackTrigger ControlID="DDL_Compact" />
                <asp:PostBackTrigger ControlID="BT_Print" />
            </Triggers>
        </asp:UpdatePanel>
    </form>
</body>
<script type="text/javascript" language="javascript">var cssDirectory = '<%=Session["CssDirectory"] %>'; var oLink = document.getElementById('mainCss'); oLink.href = 'css/' + cssDirectory + '/' + 'bluelightmain.css';</script></html>
