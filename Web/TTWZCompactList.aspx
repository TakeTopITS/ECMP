<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTWZCompactList.aspx.cs" Inherits="TTWZCompactList" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>合同列表</title>
    <link id="mainCss" href="css/bluelightmain.css" rel="stylesheet" type="text/css" />
    <script src="js/jquery-1.7.2.min.js"></script>
    <script src="js/allAHandler.js"></script>
    <script language="javascript" type="text/javascript">
        $(function () { 

        });


        function ControlStatus() {
            $("#TXT_ControlMoney").attr("readonly", "readonly");
        }

        function LoadProjectList() {
            //alert("调用成功");
            document.getElementById("BT_RelaceLoad").click();
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
                                                            <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,HeTong%>"></asp:Label>
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
                                                        <td align="left" class="formItemBgStyle">
                                                            <table class="formBgStyle" width="1000px">
                                                                <tr style="display: none;">
                                                                    <td style="text-align: left" class="formItemBgStyle">
                                                                        <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,HeTongBianHao%>"></asp:Label>：</td>
                                                                    <td style="text-align: left" class="formItemBgStyle">
                                                                        <asp:TextBox ID="TXT_CompactCode" runat="server" ReadOnly="true"></asp:TextBox><font color="red">*<asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,XiTongZiDongShengCheng%>"></asp:Label></font>
                                                                    </td>
                                                                    <td style="text-align: left" class="formItemBgStyle">
                                                                        <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,XiangMuBianMa%>"></asp:Label>：</td>
                                                                    <td style="text-align: left" class="formItemBgStyle">
                                                                        <asp:DropDownList ID="DDL_Project" runat="server" DataTextField="ProjectCode" DataValueField="ProjectCode"
                                                                            OnSelectedIndexChanged="DDL_Project_SelectedIndexChanged" AutoPostBack="true">
                                                                        </asp:DropDownList>
                                                                    </td>
                                                                    <td style="text-align: left" class="formItemBgStyle">
                                                                        <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,GongFangBianHao%>"></asp:Label>：</td>
                                                                    <td style="text-align: left" class="formItemBgStyle">
                                                                        <asp:DropDownList ID="DDL_Supplier" runat="server" DataTextField="SupplierName" DataValueField="SupplierCode"></asp:DropDownList>
                                                                    </td>
                                                                </tr>
                                                                <tr style="display: none;">

                                                                    <td style="text-align: left" class="formItemBgStyle">
                                                                        <asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,HeTongMingCheng%>"></asp:Label>：</td>
                                                                    <td style="text-align: left" class="formItemBgStyle">
                                                                        <asp:TextBox ID="TXT_CompactName" runat="server"></asp:TextBox>
                                                                    </td>
                                                                    <td style="text-align: left" class="formItemBgStyle">
                                                                        <asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,HeTongWenBen%>"></asp:Label>：</td>
                                                                    <td style="text-align: left" class="formItemBgStyle">
                                                                        <asp:FileUpload ID="FUP_CompactText" runat="server" />
                                                                        <asp:Button ID="BT_CompactText" runat="server" Text="上传" CssClass="inpu" OnClick="BT_CompactText_Click" /><br />
                                                                        <asp:Literal ID="LT_CompactText" runat="server"></asp:Literal>
                                                                        <asp:HiddenField ID="HF_CompactText" runat="server" />
                                                                        <asp:HiddenField ID="HF_CompactTextURL" runat="server" />
                                                                    </td>
                                                                    <td style="text-align: left" class="formItemBgStyle">
                                                                        <asp:Label ID="Label8" runat="server" Text="<%$ Resources:lang,JiaGeJianShen%>"></asp:Label>：</td>
                                                                    <td style="text-align: left" class="formItemBgStyle">
                                                                        <asp:HiddenField ID="HF_ControlMoney" runat="server" />
                                                                        <asp:TextBox ID="TXT_ControlMoney" runat="server"></asp:TextBox>&nbsp;
                                                                        <input type="button" value="选择" id="BT_SelectPrice" class="inpu" onclick="SelectEmployee('TTWZSelectorMember.aspx', 'HF_ControlMoney', 'TXT_ControlMoney')" />
                                                                    </td>
                                                                </tr>
                                                                <tr style="display: none;">
                                                                    <td style="text-align: center" class="formItemBgStyle" colspan="6">
                                                                        <asp:Button ID="BT_Create" runat="server" Text="<%$ Resources:lang,XinJian%>" CssClass="inpu" OnClick="BT_Create_Click" />&nbsp;
                                                                        <asp:Button ID="BT_Edit" runat="server" Text="<%$ Resources:lang,BaoCun%>" CssClass="inpu" OnClick="BT_Edit_Click" />&nbsp;
                                                                        <asp:Button ID="btnSave" runat="server" Text="<%$ Resources:lang,BaoCun%>" CssClass="inpu" OnClick="btnSave_Click" Visible="false" />
                                                                        <asp:Button ID="btnReset" runat="server" Text="<%$ Resources:lang,QuXiao%>" OnClick="btnReset_Click" CssClass="inpu" />
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="formItemBgStyle" colspan="6">
                                                                        <asp:Label ID="Label9" runat="server" Text="<%$ Resources:lang,LieBiaoChaXun%>"></asp:Label>：&nbsp;&nbsp;&nbsp;&nbsp;
                                                                        <asp:Label ID="Label10" runat="server" Text="<%$ Resources:lang,JinDu%>"></asp:Label>：
                                                                        <asp:DropDownList ID="DDL_WhereProgress" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DDL_WhereProgress_SelectedIndexChanged">
                                                                            <asp:ListItem Text="<%$ Resources:lang,LuRu%>" Value="录入" />
                                                                            <asp:ListItem Text="<%$ Resources:lang,CaoQian%>" Value="草签" />
                                                                            <asp:ListItem Text="<%$ Resources:lang,ShenHe%>" Value="审核" />
                                                                            <asp:ListItem Text="<%$ Resources:lang,ShengXiao%>" Value="生效" />
                                                                            <asp:ListItem Text="<%$ Resources:lang,HeXiao%>" Value="核销" />
                                                                            <asp:ListItem Text="<%$ Resources:lang,QuanBu%>" Value="" />
                                                                        </asp:DropDownList>
                                                                        <asp:Label ID="Label11" runat="server" Text="<%$ Resources:lang,XiangMuBianMa%>"></asp:Label>：<asp:TextBox ID="TXT_WhereProjectCode" runat="server" Width="70px"></asp:TextBox>
                                                                        <asp:Label ID="Label12" runat="server" Text="<%$ Resources:lang,HeTongMingCheng%>"></asp:Label>：<asp:TextBox ID="TXT_WhereCompactName" runat="server"></asp:TextBox>&nbsp;
                                                                        <asp:Button ID="BT_Search" runat="server" CssClass="inpu" Text="<%$ Resources:lang,ChaXun%>" OnClick="BT_Search_Click" />
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="formItemBgStyle" colspan="6">
                                                                        <asp:Label ID="Label13" runat="server" Text="<%$ Resources:lang,LieBiaoCaoZuo%>"></asp:Label>：
                                                                        <asp:Button ID="BT_NewAdd" runat="server" Text="<%$ Resources:lang,XinJian%>" CssClass="inpu" OnClick="BT_NewAdd_Click" />&nbsp;
                                                                        <asp:Button ID="BT_NewEdit" runat="server" Text="<%$ Resources:lang,BianJi%>" CssClass="inpu" Enabled="false" OnClick="BT_NewEdit_Click" />&nbsp;
                                                                        <asp:Button ID="BT_NewDelete" runat="server" Text="<%$ Resources:lang,ShanChu%>" CssClass="inpu" Enabled="false" OnClick="BT_NewDelete_Click" OnClientClick="return confirm(getDeleteMsgByLangCode())"/>&nbsp;
                                                                        <asp:Button ID="BT_NewDetail" runat="server" Text="<%$ Resources:lang,MingXi%>" CssClass="inpu" Enabled="false" OnClick="BT_NewDetail_Click" />&nbsp;
                                                                        <asp:Button ID="BT_NewSign" runat="server" Text="<%$ Resources:lang,TiJiao%>" CssClass="inpu" Enabled="false" OnClick="BT_NewSign_Click" />&nbsp;
                                                                        <asp:Button ID="BT_NewSignReturn" runat="server" Text="<%$ Resources:lang,TiJiaoTuiHui%>" CssClass="inpu" Enabled="false" OnClick="BT_NewSignReturn_Click" />&nbsp;&nbsp;
                                                                        <asp:Button ID="BT_NewCompactPrint" runat="server" Text="<%$ Resources:lang,HeTongDaYin%>" CssClass="inpu" Enabled="false" OnClick="BT_NewCompactPrint_Click" />&nbsp;
                                                                        <asp:Button ID="BT_NewDetailPrint" runat="server" Text="<%$ Resources:lang,MingXiDaiYing%>" CssClass="inpu" Enabled="false" Visible ="false"  OnClick="BT_NewDetailPrint_Click" />&nbsp;
                                                                        
                                                                        <asp:Button ID="BT_RelaceLoad" runat="server" Text="<%$ Resources:lang,ChongXinJiaZaiLieBiao%>" OnClick="BT_RelaceLoad_Click" CssClass="inpu" Style="display: none;" />

                                                                        &nbsp;&nbsp;&nbsp; <asp:HyperLink ID="HL_TransferNormalConatract" runat="server" Text ="转常规合同 "></asp:HyperLink>

                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="formItemBgStyle" colspan="6">
                                                                        <asp:Label ID="Label14" runat="server" Text="<%$ Resources:lang,HeTongJiLu%>"></asp:Label>&nbsp;
                                                                        <asp:Label ID="Label16" runat="server" Text="<%$ Resources:lang,Gong%>"></asp:Label><asp:Label ID="LB_RecordCount" runat="server" Text="*"></asp:Label><asp:Label ID="Label15" runat="server" Text="<%$ Resources:lang,Tiao%>"></asp:Label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                                        <asp:Label ID="Label17" runat="server" Text="<%$ Resources:lang,LieBiaoPaiXu%>"></asp:Label>：
                                                                        <asp:Button ID="BT_SortCompactCode" runat="server" Text="<%$ Resources:lang,HeTongBianHao%>" CssClass="inpu" OnClick="BT_SortCompactCode_Click" />&nbsp;
                                                                        <asp:Button ID="BT_SortProjectCode" runat="server" Text="<%$ Resources:lang,XiangMuBianMa%>" CssClass="inpu" OnClick="BT_SortProjectCode_Click" />&nbsp;
                                                                        <asp:Button ID="BT_SortSupplierCode" runat="server" Text="<%$ Resources:lang,GongFangBianHao%>" CssClass="inpu" OnClick="BT_SortSupplierCode_Click" />&nbsp;
                                                                        <asp:Button ID="BT_SortMarkTime" runat="server" Text="<%$ Resources:lang,BianZhiRiQi%>" CssClass="inpu" OnClick="BT_SortMarkTime_Click" />
                                                                        <asp:HiddenField ID="HF_SortCompactCode" runat="server" />
                                                                        <asp:HiddenField ID="HF_SortProjectCode" runat="server" />
                                                                        <asp:HiddenField ID="HF_SortSupplierCode" runat="server" />
                                                                        <asp:HiddenField ID="HF_SortMarkTime" runat="server" />
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="formItemBgStyle" width="100%">
                                                            <div style="width: 3300px;">
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
                                                                                            <asp:Label ID="Label18" runat="server" Text="<%$ Resources:lang,CaoZuo%>"></asp:Label></strong>
                                                                                    </td>
                                                                                    <td width="3%" align="center">
                                                                                        <strong>
                                                                                            <asp:Label ID="Label19" runat="server" Text="<%$ Resources:lang,HeTongBianHao%>"></asp:Label></strong>
                                                                                    </td>
                                                                                    <td width="3%" align="center">
                                                                                        <strong>
                                                                                            <asp:Label ID="Label20" runat="server" Text="<%$ Resources:lang,XiangMuBianMa%>"></asp:Label></strong>
                                                                                    </td>
                                                                                    <td width="3%" align="center">
                                                                                        <strong>
                                                                                            <asp:Label ID="Label21" runat="server" Text="<%$ Resources:lang,XuFangBianHao%>"></asp:Label></strong>
                                                                                    </td>
                                                                                    <td width="3%" align="center">
                                                                                        <strong>
                                                                                            <asp:Label ID="Label22" runat="server" Text="<%$ Resources:lang,GongFangBianHao%>"></asp:Label></strong>
                                                                                    </td>
                                                                                    <td width="6%" align="left">
                                                                                        <strong>
                                                                                            <asp:Label ID="Label23" runat="server" Text="<%$ Resources:lang,HeTongMingCheng%>"></asp:Label></strong>
                                                                                    </td>
                                                                                    <td width="6%" align="left">
                                                                                        <strong>
                                                                                            <asp:Label ID="Label24" runat="server" Text="<%$ Resources:lang,HeTongWenBen%>"></asp:Label></strong>
                                                                                    </td>
                                                                                    <td width="3%" align="right">
                                                                                        <strong>
                                                                                            <asp:Label ID="Label25" runat="server" Text="<%$ Resources:lang,MingXiTiaoShu%>"></asp:Label></strong>
                                                                                    </td>
                                                                                    <td width="3%" align="right">
                                                                                        <strong>
                                                                                            <asp:Label ID="Label26" runat="server" Text="<%$ Resources:lang,HeTongJinE%>"></asp:Label></strong>
                                                                                    </td>
                                                                                    <td width="3%" align="right">
                                                                                        <strong>
                                                                                            <asp:Label ID="Label27" runat="server" Text="<%$ Resources:lang,ShouLiaoZongE%>"></asp:Label></strong>
                                                                                    </td>
                                                                                    <td width="3%" align="right">
                                                                                        <strong>
                                                                                            <asp:Label ID="Label28" runat="server" Text="<%$ Resources:lang,QingKuanJinE%>"></asp:Label></strong>
                                                                                    </td>
                                                                                    <td width="3%" align="right">
                                                                                        <strong>
                                                                                            <asp:Label ID="Label29" runat="server" Text="<%$ Resources:lang,MoQingKuanE%>"></asp:Label></strong>
                                                                                    </td>
                                                                                    <td width="3%" align="center">
                                                                                        <strong>
                                                                                            <asp:Label ID="Label30" runat="server" Text="<%$ Resources:lang,BianZhiRiQi%>"></asp:Label></strong>
                                                                                    </td>
                                                                                    <td width="3%" align="center">
                                                                                        <strong>
                                                                                            <asp:Label ID="Label31" runat="server" Text="<%$ Resources:lang,CaoQianRiQi%>"></asp:Label></strong>
                                                                                    </td>
                                                                                    <td width="3%" align="center">
                                                                                        <strong>
                                                                                            <asp:Label ID="Label32" runat="server" Text="<%$ Resources:lang,CaiGouGongChengShi%>"></asp:Label></strong>
                                                                                    </td>
                                                                                    <td width="3%" align="center">
                                                                                        <strong>
                                                                                            <asp:Label ID="Label33" runat="server" Text="<%$ Resources:lang,JiaGeJianShen%>"></asp:Label></strong>
                                                                                    </td>
                                                                                    <td width="3%" align="center">
                                                                                        <strong>
                                                                                            <asp:Label ID="Label34" runat="server" Text="<%$ Resources:lang,ShenHeRiQi%>"></asp:Label></strong>
                                                                                    </td>
                                                                                    <td width="3%" align="center">
                                                                                        <strong>
                                                                                            <asp:Label ID="Label35" runat="server" Text="<%$ Resources:lang,FaRenDaiBiao%>"></asp:Label></strong>
                                                                                    </td>

                                                                                    <td width="3%" align="center">
                                                                                        <strong>
                                                                                            <asp:Label ID="Label36" runat="server" Text="<%$ Resources:lang,WeiTuoDaiLiRen%>"></asp:Label></strong>
                                                                                    </td>
                                                                                    <td width="3%" align="center">
                                                                                        <strong>
                                                                                            <asp:Label ID="Label37" runat="server" Text="<%$ Resources:lang,ShengXiaoRiQi%>"></asp:Label></strong>
                                                                                    </td>
                                                                                    <td width="2%" align="center">
                                                                                        <strong>
                                                                                            <asp:Label ID="Label38" runat="server" Text="<%$ Resources:lang,HeTongYuan%>"></asp:Label></strong>
                                                                                    </td>
                                                                                    <td width="3%" align="center">
                                                                                        <strong>
                                                                                            <asp:Label ID="Label39" runat="server" Text="<%$ Resources:lang,QianShouRiQi%>"></asp:Label></strong>
                                                                                    </td>
                                                                                    <td width="2%" align="center">
                                                                                        <strong>
                                                                                            <asp:Label ID="Label40" runat="server" Text="<%$ Resources:lang,KuBie%>"></asp:Label></strong>
                                                                                    </td>
                                                                                    <td width="3%" align="center">
                                                                                        <strong>
                                                                                            <asp:Label ID="Label41" runat="server" Text="<%$ Resources:lang,BaoGuanYuan%>"></asp:Label></strong>
                                                                                    </td>
                                                                                    <td width="3%" align="center">
                                                                                        <strong>
                                                                                            <asp:Label ID="Label42" runat="server" Text="<%$ Resources:lang,CaiJianYuan%>"></asp:Label></strong>
                                                                                    </td>

                                                                                    <td width="3%" align="center">
                                                                                        <strong>
                                                                                            <asp:Label ID="Label43" runat="server" Text="<%$ Resources:lang,HeXiaoRiQi%>"></asp:Label></strong>
                                                                                    </td>
                                                                                    <td width="3%" align="right">
                                                                                        <strong>
                                                                                            <asp:Label ID="Label44" runat="server" Text="<%$ Resources:lang,YuFuKuan%>"></asp:Label></strong>
                                                                                    </td>
                                                                                    <td width="3%" align="right">
                                                                                        <strong>
                                                                                            <asp:Label ID="Label45" runat="server" Text="<%$ Resources:lang,YuFuYuE%>"></asp:Label></strong>
                                                                                    </td>
                                                                                   <%-- <td width="3%" align="center">
                                                                                        <strong>
                                                                                            <asp:Label ID="Label46" runat="server" Text="<%$ Resources:lang,YuFuBiaoZhi%>"></asp:Label></strong>
                                                                                    </td>--%>
                                                                                    <td width="2%" align="center">
                                                                                        <strong>
                                                                                            <asp:Label ID="Label47" runat="server" Text="<%$ Resources:lang,JinDu%>"></asp:Label></strong>
                                                                                    </td>
                                                                                    <td width="3%" align="center">
                                                                                        <strong>
                                                                                            <asp:Label ID="Label48" runat="server" Text="<%$ Resources:lang,ShiYongBiaoJi%>"></asp:Label></strong>
                                                                                    </td>
                                                                                </tr>
                                                                            </table>
                                                                        </td>
                                                                        <td width="6" align="right">
                                                                            <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" />
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                                <asp:DataGrid ID="DG_List" runat="server" AllowPaging="true" AutoGenerateColumns="False"
                                                                    CellPadding="4" ForeColor="#333333" GridLines="None" Height="1px" PageSize="30" ShowHeader="false"
                                                                    Width="100%" OnItemCommand="DG_List_ItemCommand" OnPageIndexChanged="DG_List_PageIndexChanged">
                                                                    <Columns>
                                                                        <asp:TemplateColumn>
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="2%" />
                                                                            <HeaderTemplate>
                                                                                <asp:Label ID="Label50" runat="server" Text="<%$ Resources:lang,CaoZuo%>"></asp:Label>
                                                                            </HeaderTemplate>
                                                                            <ItemTemplate>

                                                                                <asp:LinkButton ID="LinkButton4" runat="server" CommandArgument='<%# Eval("CompactCode") %>' CommandName="click" CssClass="notTab">操作</asp:LinkButton>
                                                                                <%--<asp:LinkButton runat="server" CommandArgument='<%# DataBinder.Eval(Container.DataItem,"CompactCode") %>' CommandName="edit" CssClass="notTab" Visible='<%# Eval("Progress").ToString()=="录入" ? true : false %>'>编辑</asp:LinkButton>--%>
                                                                                <%--<asp:LinkButton runat="server" CommandArgument='<%# DataBinder.Eval(Container.DataItem,"CompactCode") %>' CommandName="del" CssClass="notTab" Visible='<%# (Eval("Progress").ToString()=="录入" && Eval("IsMark").ToString()=="0") ? true : false %>'>删除</asp:LinkButton>--%>
                                                                                <%--<asp:LinkButton ID="LinkButton1" runat="server" CommandArgument='<%# DataBinder.Eval(Container.DataItem,"CompactCode") %>' CommandName="sign" CssClass="notTab" Visible='<%# Eval("Progress").ToString()=="录入" ? true : false %>'>草签</asp:LinkButton>--%>
                                                                                <%--<asp:LinkButton ID="LinkButton2" runat="server" CommandArgument='<%# DataBinder.Eval(Container.DataItem,"CompactCode") %>' CommandName="notSign" CssClass="notTab" Visible='<%# Eval("Progress").ToString()=="草签" ? true : false %>'>草签退回</asp:LinkButton>--%>
                                                                                <%--<asp:LinkButton ID="LinkButton3" runat="server" CommandArgument='<%# DataBinder.Eval(Container.DataItem,"CompactCode") %>' CommandName="detail" CssClass="notTab" Visible='<%# Eval("Progress").ToString()=="录入" ? true : false %>'>明细</asp:LinkButton>--%>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateColumn>
                                                                        <asp:BoundColumn DataField="CompactCode" HeaderText="合同编号">
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="3%" />
                                                                        </asp:BoundColumn>
                                                                        <asp:BoundColumn DataField="ProjectCode" HeaderText="项目编码">
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="3%" />
                                                                        </asp:BoundColumn>
                                                                        <asp:BoundColumn DataField="NeedCode" HeaderText="需方编号">
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="3%" />
                                                                        </asp:BoundColumn>
                                                                        <asp:BoundColumn DataField="SupplierCode" HeaderText="供方编号">
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="3%" />
                                                                        </asp:BoundColumn>
                                                                        <%--<asp:BoundColumn DataField="CompactName" HeaderText="合同名称">
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="6%" />
                                                                        </asp:BoundColumn>--%>
                                                                        <asp:TemplateColumn>
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="6%" />
                                                                            <HeaderTemplate>
                                                                                <asp:Label ID="Label49" runat="server" Text="<%$ Resources:lang,HeTongMingCheng%>"></asp:Label>
                                                                            </HeaderTemplate>
                                                                            <ItemTemplate>
                                                                                <%# ShareClass.StringCutByRequire(Eval("CompactName").ToString(), 190) %>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateColumn>
                                                                        <%--<asp:BoundColumn DataField="CompactText" HeaderText="合同文本">
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" />
                                                                        </asp:BoundColumn>--%>
                                                                        <asp:TemplateColumn>
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="6%" />
                                                                            <HeaderTemplate>
                                                                                <asp:Label ID="Label51" runat="server" Text="<%$ Resources:lang,HeTongWenBen%>"></asp:Label>
                                                                            </HeaderTemplate>
                                                                            <ItemTemplate>
                                                                                <a href='<%# Eval("CompactTextURL") %>' class="notTab" target="_blank"><%# ShareClass.StringCutByRequire(Eval("CompactText").ToString(), 190) %></a>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateColumn>
                                                                        <asp:BoundColumn DataField="RowNumber" HeaderText="明细条数">
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Right" Width="3%" />
                                                                        </asp:BoundColumn>
                                                                        <asp:BoundColumn DataField="CompactMoney" HeaderText="合同金额">
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Right" Width="3%" />
                                                                        </asp:BoundColumn>
                                                                        <asp:BoundColumn DataField="CollectMoney" HeaderText="收料金额">
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Right" Width="3%" />
                                                                        </asp:BoundColumn>
                                                                        <asp:BoundColumn DataField="RequestMoney" HeaderText="请款金额">
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Right" Width="3%" />
                                                                        </asp:BoundColumn>
                                                                        <asp:BoundColumn DataField="NotRequestMoney" HeaderText="末请金额">
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Right" Width="3%" />
                                                                        </asp:BoundColumn>
                                                                        <%--<asp:BoundColumn DataField="MarkTime" HeaderText="编制日期">
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="3%" />
                                                                        </asp:BoundColumn>--%>
                                                                        <asp:TemplateColumn>
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="3%" />
                                                                            <HeaderTemplate>
                                                                                <asp:Label ID="Label52" runat="server" Text="<%$ Resources:lang,BianZhiRiQi%>"></asp:Label>
                                                                            </HeaderTemplate>
                                                                            <ItemTemplate>
                                                                                <%#DataBinder.Eval(Container.DataItem, "MarkTime", "{0:yyyy/MM/dd}")%>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateColumn>
                                                                        <%--<asp:BoundColumn DataField="SingTime" HeaderText="草签日期">
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="3%" />
                                                                        </asp:BoundColumn>--%>
                                                                        <asp:TemplateColumn>
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="3%" />
                                                                            <HeaderTemplate>
                                                                                <asp:Label ID="Label53" runat="server" Text="<%$ Resources:lang,CaoQianRiQi%>"></asp:Label>
                                                                            </HeaderTemplate>
                                                                            <ItemTemplate>
                                                                                <%# ShareClass.StringCutByRequire(Eval("SingTime").ToString(), 190) %>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateColumn>
                                                                        <asp:BoundColumn DataField="PurchaseEngineerName" HeaderText="采购工程师">
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="3%" />
                                                                        </asp:BoundColumn>
                                                                        <asp:BoundColumn DataField="ControlMoneyName" HeaderText="价格监审">
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="3%" />
                                                                        </asp:BoundColumn>
                                                                        <%--<asp:BoundColumn DataField="VerifyTime" HeaderText="审核日期">
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="3%" />
                                                                        </asp:BoundColumn>--%>
                                                                        <asp:TemplateColumn>
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="3%" />
                                                                            <HeaderTemplate>
                                                                                <asp:Label ID="Label54" runat="server" Text="<%$ Resources:lang,ShenHeRiQi%>"></asp:Label>
                                                                            </HeaderTemplate>
                                                                            <ItemTemplate>
                                                                                <%# ShareClass.StringCutByRequire(Eval("VerifyTime").ToString(), 190) %>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateColumn>
                                                                        <asp:BoundColumn DataField="JuridicalPersonName" HeaderText="法人代表">
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="3%" />
                                                                        </asp:BoundColumn>

                                                                        <asp:BoundColumn DataField="DelegateAgentName" HeaderText="委托代理人">
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="3%" />
                                                                        </asp:BoundColumn>
                                                                        <%--<asp:BoundColumn DataField="EffectTime" HeaderText="生效日期">
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="3%" />
                                                                        </asp:BoundColumn>--%>
                                                                        <asp:TemplateColumn>
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="3%" />
                                                                            <HeaderTemplate>
                                                                                <asp:Label ID="Label55" runat="server" Text="<%$ Resources:lang,ShengXiaoRiQi%>"></asp:Label>
                                                                            </HeaderTemplate>
                                                                            <ItemTemplate>
                                                                                <%# ShareClass.StringCutByRequire(Eval("EffectTime").ToString(), 190) %>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateColumn>
                                                                        <asp:BoundColumn DataField="CompacterName" HeaderText="合同员">
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="2%" />
                                                                        </asp:BoundColumn>
                                                                        <%--<asp:BoundColumn DataField="ReceiveTime" HeaderText="签收日期">
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="3%" />
                                                                        </asp:BoundColumn>--%>
                                                                        <asp:TemplateColumn>
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="3%" />
                                                                            <HeaderTemplate>
                                                                                <asp:Label ID="Label56" runat="server" Text="<%$ Resources:lang,QianShouRiQi%>"></asp:Label>
                                                                            </HeaderTemplate>
                                                                            <ItemTemplate>
                                                                                <%# ShareClass.StringCutByRequire(Eval("ReceiveTime").ToString(), 190) %>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateColumn>
                                                                        <asp:BoundColumn DataField="StoreRoom" HeaderText="库别">
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="2%" />
                                                                        </asp:BoundColumn>
                                                                        <asp:BoundColumn DataField="SafekeepName" HeaderText="保管员">
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="3%" />
                                                                        </asp:BoundColumn>
                                                                        <asp:BoundColumn DataField="CheckerName" HeaderText="材检员">
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="3%" />
                                                                        </asp:BoundColumn>

                                                                        <%--<asp:BoundColumn DataField="CancelTime" HeaderText="核销日期">
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="3%" />
                                                                        </asp:BoundColumn>--%>
                                                                        <asp:TemplateColumn>
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="3%" />
                                                                            <HeaderTemplate>
                                                                                <asp:Label ID="Label57" runat="server" Text="<%$ Resources:lang,HeXiaoRiQi%>"></asp:Label>
                                                                            </HeaderTemplate>
                                                                            <ItemTemplate>
                                                                                <%# ShareClass.StringCutByRequire(Eval("CancelTime").ToString(), 190) %>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateColumn>
                                                                        <asp:BoundColumn DataField="BeforePayMoney" HeaderText="预付款">
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Right" Width="3%" />
                                                                        </asp:BoundColumn>
                                                                        <asp:BoundColumn DataField="BeforePayBalance" HeaderText="预付余额">
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Right" Width="3%" />
                                                                        </asp:BoundColumn>
                                                                       <%-- <asp:BoundColumn DataField="PayIsMark" HeaderText="预付标志">
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="3%" />
                                                                        </asp:BoundColumn>--%>
                                                                        <asp:BoundColumn DataField="Progress" HeaderText="进度">
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="2%" />
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
                                                            <asp:Label ID="LB_Sql" runat="server" Visible="False"></asp:Label>
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
                <asp:HiddenField ID="HF_CompactCode" runat="server" />
                <asp:HiddenField ID="HF_DelegateAgent" runat="server" />
                <asp:HiddenField ID="HF_Compacter" runat="server" />
                <asp:HiddenField ID="HF_StoreRoom" runat="server" />
                <asp:HiddenField ID="HF_Safekeep" runat="server" />
                <asp:HiddenField ID="HF_Checker" runat="server" />


                <asp:HiddenField ID="HF_NewCompactCode" runat="server" />
                <asp:HiddenField ID="HF_NewProgress" runat="server" />
                <asp:HiddenField ID="HF_NewPurchaseEngineer" runat="server" />
                <asp:HiddenField ID="HF_NewIsMark" runat="server" />
            </ContentTemplate>
            <Triggers>
                <asp:PostBackTrigger ControlID="btnSave" />
                <asp:PostBackTrigger ControlID="DDL_Project" />
                <asp:PostBackTrigger ControlID="btnReset" />
                <asp:PostBackTrigger ControlID="BT_CompactText" />
            </Triggers>
        </asp:UpdatePanel>
    </form>
</body>
<script type="text/javascript" language="javascript">var cssDirectory = '<%=Session["CssDirectory"] %>'; var oLink = document.getElementById('mainCss'); oLink.href = 'css/' + cssDirectory + '/' + 'bluelightmain.css';</script></html>
