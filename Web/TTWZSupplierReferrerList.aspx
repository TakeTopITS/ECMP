<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTWZSupplierReferrerList.aspx.cs" Inherits="TTWZSupplierReferrerList" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>推荐人</title>
    <link id="mainCss" href="css/bluelightmain.css" rel="stylesheet" type="text/css" />
    <script src="js/jquery-1.7.2.min.js"></script>
    <script src="js/allAHandler.js"></script>
    <script src="js/My97DatePicker/WdatePicker.js"></script>
    <script language="javascript">

        $(function () { 

            //ControlStatusCloseChange();

        });

        function ControlStatusChange(objProgress) {

            $("#BT_NewBrowse").attr("class", "inpu");
            $("#BT_NewBrowse").removeAttr("disabled");

            if (objProgress == "提交") {
                $("#BT_NewEdit").attr("class", "inpu");
                $("#BT_NewEdit").removeAttr("disabled");                            //编辑
                $("#BT_NewPush").attr("class", "inpu");
                $("#BT_NewPush").removeAttr("disabled");                          //推荐
                $("#BT_NewPushReturn").attr("disabled", "disabled");
                $("#BT_NewPushReturn").removeClass("inpu");                         //推荐退回
            }
            else if (objProgress == "提交1") {
                $("#BT_NewEdit").attr("disabled", "disabled");
                $("#BT_NewEdit").removeClass("inpu");                            //编辑
                $("#BT_NewPush").attr("disabled", "disabled");
                $("#BT_NewPush").removeClass("inpu");                          //推荐
                $("#BT_NewPushReturn").attr("class", "inpu");
                $("#BT_NewPushReturn").removeAttr("disabled");                         //推荐退回
            }
            else {
                $("#BT_NewEdit").attr("disabled", "disabled");
                $("#BT_NewEdit").removeClass("inpu");                            //编辑
                $("#BT_NewPush").attr("disabled", "disabled");
                $("#BT_NewPush").removeClass("inpu");                          //推荐
                $("#BT_NewPushReturn").attr("disabled", "disabled");
                $("#BT_NewPushReturn").removeClass("inpu");                         //推荐退回
            }

        }



        function ControlStatusCloseChange() {
            $("#BT_NewEdit").attr("disabled", "disabled");
            $("#BT_NewEdit").removeClass("inpu");
            $("#BT_NewPush").attr("disabled", "disabled");
            $("#BT_NewPush").removeClass("inpu");
            $("#BT_NewPushReturn").attr("disabled", "disabled");
            $("#BT_NewPushReturn").removeClass("inpu");
            $("#BT_NewBrowse").attr("disabled", "disabled");
            $("#BT_NewBrowse").removeClass("inpu");
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
                                                            <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,RuWangTuiJian%>"></asp:Label>
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
                                                            <table width="1800px">
                                                                <tr>
                                                                    <td width="950px" class="formItemBgStyle">
                                                                        <table class="formBgStyle">
                                                                            <tr>
                                                                                <td class="formItemBgStyle" colspan="5">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,TuiJianRen%>"></asp:Label></td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td class="formItemBgStyle">
                                                                                    <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,ShenPiWenJian%>"></asp:Label>：</td>
                                                                                <td class="formItemBgStyle">
                                                                                    <asp:FileUpload ID="FUP_ApprovalDocument" runat="server" />
                                                                                    <asp:Button ID="BT_ApprovalDocument" runat="server" Text="<%$ Resources:lang,ShangChuan%>" CssClass="inpu" OnClick="BT_ReviewDocument_Click" /><br />
                                                                                    <asp:Literal ID="LT_ApprovalDocument" runat="server"></asp:Literal>
                                                                                    <asp:HiddenField ID="HF_ApprovalDocument" runat="server" />
                                                                                    <asp:HiddenField ID="HF_ApprovalDocumentURL" runat="server" />
                                                                                </td>
                                                                                <td class="formItemBgStyle">
                                                                                    <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,WuZiZhuGuan%>"></asp:Label>：</td>
                                                                                <td class="formItemBgStyle">
                                                                                    <asp:HiddenField ID="HF_CompetentMaterials" runat="server" />
                                                                                    <asp:TextBox ID="TXT_CompetentMaterials" runat="server"></asp:TextBox>
                                                                                    <input type="button" id="btnCompetentMaterials" class="inpu" runat="server" value="选择" onclick="SelectEmployee('TTWZSelectorMember.aspx', 'HF_CompetentMaterials', 'TXT_CompetentMaterials')" />
                                                                                </td>
                                                                                <td class="formItemBgStyle">
                                                                                    <asp:Button ID="BT_Save" runat="server" CssClass="inpu" Text="<%$ Resources:lang,BaoCun%>" OnClick="BT_Save_Click" />&nbsp;
                                                                        <asp:Button ID="BT_Cancel" runat="server" CssClass="inpu" Text="<%$ Resources:lang,QuXiao%>" OnClick="BT_Cancel_Click" />
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td class="formItemBgStyle">
                                                                                    <asp:Label ID="Label55" runat="server" Text="<%$ Resources:lang,HeTongJianShen%>"></asp:Label>：</td>
                                                                                <td class="formItemBgStyle">
                                                                                    <asp:HiddenField ID="HF_ContractWhose" runat="server" />
                                                                                    <asp:TextBox ID="TXT_ContractWhose" runat="server"></asp:TextBox>
                                                                                    <input type="button" id="btnContractWhose" class="inpu" runat="server" value="选择" onclick="SelectEmployee('TTWZSelectorMember.aspx', 'HF_ContractWhose', 'TXT_ContractWhose')" />
                                                                                </td>
                                                                                <td class="formItemBgStyle">
                                                                                    <asp:Label ID="Label56" runat="server" Text="<%$ Resources:lang,ZhuGuanLingDao%>"></asp:Label>：</td>
                                                                                <td class="formItemBgStyle">
                                                                                    <asp:HiddenField ID="HF_CompetentLeadership" runat="server" />
                                                                                    <asp:TextBox ID="TXT_CompetentLeadership" runat="server"></asp:TextBox>
                                                                                    <input type="button" id="btnCompetentLeadership" class="inpu" runat="server" value="选择" onclick="SelectEmployee('TTWZSelectorMember.aspx', 'HF_CompetentLeadership', 'TXT_CompetentLeadership')" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                                                </td>
                                                                                <td class="formItemBgStyle">&nbsp;</td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td class="formItemBgStyle">
                                                                                    <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,JinDu%>"></asp:Label>：</td>
                                                                                <td class="formItemBgStyle">
                                                                                    <asp:DropDownList ID="DDL_Progress" runat="server" AutoPostBack="true" OnSelectedIndexChanged="DDL_Progress_SelectedIndexChanged">

                                                                                        <asp:ListItem Text="<%$ Resources:lang,TiJiao%>" Value="提交" />
                                                                                        <asp:ListItem Text="<%$ Resources:lang,TiJiaoYi%>" Value="提交1" />
                                                                                        <asp:ListItem Text="<%$ Resources:lang,PiZhun%>" Value="批准" />
                                                                                    </asp:DropDownList>
                                                                                </td>
                                                                                <td class="formItemBgStyle" colspan="3">
                                                                                    <asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,JiLuCaoZuo%>"></asp:Label>：
                                                                        <asp:Button ID="BT_NewEdit" runat="server" CssClass="inpu" Text="<%$ Resources:lang,BianJi%>" OnClick="BT_NewEdit_Click" />
                                                                                    <asp:Button ID="BT_DirectPush" runat="server" CssClass="inpu" Text="<%$ Resources:lang,ZhiJieTuiJian%>" OnClick="BT_DirectPush_Click" />
                                                                                    <asp:Button ID="BT_NewPush" runat="server" CssClass="inpu" Text="<%$ Resources:lang,TuiJian%>" OnClick="BT_NewPush_Click" />
                                                                                    <asp:Button ID="BT_NewPushReturn" runat="server" CssClass="inpu" Text="<%$ Resources:lang,TuiJianTuiHui%>" OnClick="BT_NewPushReturn_Click" />
                                                                                    <asp:Button ID="BT_NewBrowse" runat="server" CssClass="inpu" Text="<%$ Resources:lang,LiuLan%>" OnClick="BT_NewBrowse_Click" />
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td class="formItemBgStyle" colspan="5">
                                                                                    <asp:Label ID="Label8" runat="server" Text="<%$ Resources:lang,GongYingShangJiLuGong%>"></asp:Label><asp:Label ID="LB_Record" runat="server" Text="0"></asp:Label><asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,Tiao%>"></asp:Label>
                                                                                </td>
                                                                            </tr>
                                                                        </table>
                                                                        <td align="left">
                                                                            <table cellpadding="0" cellspacing="0" width="100%">
                                                                                <tr style="font-size: 10pt;">
                                                                                    <td style="height: 14px; text-align: left">
                                                                                        <asp:Label ID="Label49" runat="server" Text="<%$ Resources:lang,DuiYingShenPiJiLu %>"></asp:Label>：
                                                                                    </td>
                                                                                </tr>
                                                                                <tr style="font-size: 10pt">
                                                                                    <td style="height: 11px; text-align: left">
                                                                                        <table background="ImagesSkin/main_n_bj.jpg" border="0" cellpadding="0" cellspacing="0"
                                                                                            width="100%">
                                                                                            <tr>
                                                                                                <td width="7">
                                                                                                    <img height="26" src="ImagesSkin/main_n_l.jpg" width="7" />
                                                                                                </td>
                                                                                                <td>
                                                                                                    <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                                                                        <tr>
                                                                                                            <td align="center" width="10%">
                                                                                                                <strong>
                                                                                                                    <asp:Label ID="Label50" runat="server" Text="<%$ Resources:lang,BianHao %>"></asp:Label></strong>
                                                                                                            </td>
                                                                                                            <td align="center" width="45%">
                                                                                                                <strong>
                                                                                                                    <asp:Label ID="Label51" runat="server" Text="<%$ Resources:lang,GongZuoLiu %>"></asp:Label></strong>
                                                                                                            </td>
                                                                                                            <td align="center" width="25%">
                                                                                                                <strong>
                                                                                                                    <asp:Label ID="Label52" runat="server" Text="<%$ Resources:lang,ShenQingShiJian %>"></asp:Label></strong>
                                                                                                            </td>
                                                                                                            <td align="center" width="10%">
                                                                                                                <strong>
                                                                                                                    <asp:Label ID="Label53" runat="server" Text="<%$ Resources:lang,ZhuangTai %>"></asp:Label></strong>
                                                                                                            </td>
                                                                                                            <td align="center" width="10%">
                                                                                                                <strong></strong>
                                                                                                            </td>
                                                                                                        </tr>
                                                                                                    </table>
                                                                                                </td>
                                                                                                <td align="right" width="6">
                                                                                                    <img alt="" height="26" src="ImagesSkin/main_n_r.jpg" width="6" />
                                                                                                </td>
                                                                                            </tr>
                                                                                        </table>
                                                                                        <asp:DataGrid ID="DataGrid4" runat="server" AutoGenerateColumns="False" CellPadding="4"
                                                                                            ForeColor="#333333" GridLines="None" Height="1px" PageSize="5" ShowHeader="False"
                                                                                            Width="100%">
                                                                                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                                                            <EditItemStyle BackColor="#2461BF" />
                                                                                            <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                                                            <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />

                                                                                            <ItemStyle CssClass="itemStyle" />
                                                                                            <Columns>
                                                                                                <asp:BoundColumn DataField="WLID" HeaderText="编号">
                                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                                                </asp:BoundColumn>
                                                                                                <asp:HyperLinkColumn DataNavigateUrlField="WLID" DataNavigateUrlFormatString="TTWorkFlowViewMain.aspx?WLID={0}"
                                                                                                    DataTextField="WLName" HeaderText="工作流" Target="_blank">
                                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="45%" />
                                                                                                </asp:HyperLinkColumn>
                                                                                                <asp:BoundColumn DataField="CreateTime" HeaderText="申请时间">
                                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="25%" />
                                                                                                </asp:BoundColumn>
                                                                                                <asp:TemplateColumn HeaderText="状态">
                                                                                                    <ItemTemplate>
                                                                                                        <%# ShareClass. GetStatusHomeNameByOtherStatus(Eval("Status").ToString()) %>
                                                                                                    </ItemTemplate>
                                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="10%" />
                                                                                                </asp:TemplateColumn>
                                                                                                <asp:TemplateColumn>
                                                                                                    <ItemTemplate>
                                                                                                        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# DataBinder.Eval(Container, "DataItem.WLID", "TTWLRelatedDoc.aspx?DocType=审核&WLID={0}") %>'
                                                                                                            Target="_blank"><img class="noBorder" src="ImagesSkin/Doc.gif" /></asp:HyperLink>
                                                                                                    </ItemTemplate>
                                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                                                </asp:TemplateColumn>
                                                                                            </Columns>
                                                                                        </asp:DataGrid>
                                                                                    </td>
                                                                                </tr>
                                                                                <tr style="font-size: 10pt">
                                                                                    <td style="text-align: right">
                                                                                        <asp:Label ID="LB_Sql5" runat="server" Visible="False"></asp:Label>
                                                                                        <asp:Label ID="Label54" runat="server" Visible="False"></asp:Label>
                                                                                    </td>
                                                                                </tr>
                                                                            </table>
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
                                                                            <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" /></td>
                                                                        <td>
                                                                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                                <tr>
                                                                                    <td width="2%" align="center"><strong>
                                                                                        <asp:Label ID="Label9" runat="server" Text="<%$ Resources:lang,CaoZuo %>"></asp:Label></strong></td>
                                                                                    <td width="3%" align="center"><strong>
                                                                                        <asp:Label ID="Label10" runat="server" Text="<%$ Resources:lang,GongFangBianHao %>"></asp:Label></strong></td>
                                                                                    <td width="2%" align="left"><strong></strong></td>
                                                                                    <td width="5%" align="left"><strong>
                                                                                        <asp:Label ID="Label11" runat="server" Text="<%$ Resources:lang,TuiJianDanWei %>"></asp:Label></strong></td>
                                                                                    <td width="4%" align="left"><strong>
                                                                                        <asp:Label ID="Label12" runat="server" Text="<%$ Resources:lang,TuiJianRen %>"></asp:Label></strong></td>
                                                                                    <td width="5%" align="left"><strong>
                                                                                        <asp:Label ID="Label13" runat="server" Text="<%$ Resources:lang,ShenPiWenJian %>"></asp:Label></strong></td>
                                                                                    <td width="4%" align="left"><strong>
                                                                                        <asp:Label ID="Label14" runat="server" Text="<%$ Resources:lang,WuZiZhuGuan %>"></asp:Label></strong></td>
                                                                                    <td width="4%" align="left"><strong>
                                                                                        <asp:Label ID="Label15" runat="server" Text="<%$ Resources:lang,HeTongJianShen %>"></asp:Label></strong></td>
                                                                                    <td width="4%" align="left"><strong>
                                                                                        <asp:Label ID="Label16" runat="server" Text="<%$ Resources:lang,ZhuGuanLingDao %>"></asp:Label></strong></td>
                                                                                    <td width="5%" align="left"><strong>
                                                                                        <asp:Label ID="Label17" runat="server" Text="<%$ Resources:lang,GongYingShang %>"></asp:Label></strong></td>
                                                                                    <td width="6%" align="left"><strong>
                                                                                        <asp:Label ID="Label18" runat="server" Text="<%$ Resources:lang,KaiHuHang %>"></asp:Label></strong></td>
                                                                                    <td width="4%" align="left"><strong>
                                                                                        <asp:Label ID="Label19" runat="server" Text="<%$ Resources:lang,ZhangHao %>"></asp:Label></strong></td>
                                                                                    <td width="4%" align="left"><strong>
                                                                                        <asp:Label ID="Label20" runat="server" Text="<%$ Resources:lang,ShuiHao %>"></asp:Label></strong></td>
                                                                                    <td width="6%" align="left"><strong>
                                                                                        <asp:Label ID="Label21" runat="server" Text="<%$ Resources:lang,DanWeiDiZhi %>"></asp:Label></strong></td>
                                                                                    <td width="3%" align="left"><strong>
                                                                                        <asp:Label ID="Label22" runat="server" Text="<%$ Resources:lang,YouBian %>"></asp:Label></strong></td>
                                                                                    <td width="3%" align="left"><strong>
                                                                                        <asp:Label ID="Label23" runat="server" Text="<%$ Resources:lang,FaRenDaiBiao %>"></asp:Label></strong></td>
                                                                                    <td width="3%" align="left"><strong>
                                                                                        <asp:Label ID="Label24" runat="server" Text="<%$ Resources:lang,DanWeiDianHua %>"></asp:Label></strong></td>
                                                                                    <td width="3%" align="left"><strong>
                                                                                        <asp:Label ID="Label25" runat="server" Text="<%$ Resources:lang,WeiTuoDaiLiRen %>"></asp:Label></strong></td>
                                                                                    <td width="3%" align="left"><strong>
                                                                                        <asp:Label ID="Label26" runat="server" Text="<%$ Resources:lang,GuDingDianHua %>"></asp:Label></strong></td>
                                                                                    <td width="3%" align="left"><strong>
                                                                                        <asp:Label ID="Label27" runat="server" Text="<%$ Resources:lang,ShouJi %>"></asp:Label></strong></td>
                                                                                    <td width="3%" align="left"><strong>QQ</strong> &nbsp;&nbsp; &nbsp; </td>
                                                                                    <td width="3%" align="left"><strong>E-mail</strong> &nbsp;&nbsp; &nbsp; </td>
                                                                                    <td width="4%" align="left"><strong>
                                                                                        <asp:Label ID="Label28" runat="server" Text="<%$ Resources:lang,RuWangWenJian %>"></asp:Label></strong></td>
                                                                                    <td width="3%" align="center"><strong>
                                                                                        <asp:Label ID="Label29" runat="server" Text="<%$ Resources:lang,ShenQingRiQi %>"></asp:Label></strong></td>
                                                                                    <td width="3%" align="center"><strong>
                                                                                        <asp:Label ID="Label30" runat="server" Text="<%$ Resources:lang,JinDu %>"></asp:Label></strong></td>
                                                                                    <td width="3%" align="center"><strong>
                                                                                        <asp:Label ID="Label31" runat="server" Text="<%$ Resources:lang,ShiYongBiaoJi %>"></asp:Label></strong></td>
                                                                                </tr>
                                                                            </table>
                                                                        </td>
                                                                        <td width="6" align="right">
                                                                            <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" /></td>
                                                                    </tr>
                                                                </table>
                                                                <asp:DataGrid ID="DG_List" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                                                                    CellPadding="4" ForeColor="#333333" GridLines="None" Height="1px" ShowHeader="False"
                                                                    Width="100%" OnItemCommand="DG_List_ItemCommand" OnPageIndexChanged="DG_List_PageIndexChanged">

                                                                    <Columns>
                                                                        <asp:TemplateColumn>
                                                                            <HeaderTemplate>
                                                                                <asp:Label ID="Label32" runat="server" Text="<%$ Resources:lang,CaoZuo%>"></asp:Label>
                                                                            </HeaderTemplate>
                                                                            <ItemTemplate>
                                                                                <asp:LinkButton ID="LinkButton1" runat="server" CommandArgument='<%# Eval("ID")+"|"+Eval("Progress") %>' CommandName="click" CssClass="notTab">
                                                                                    <asp:Label ID="Label52" runat="server" Text="<%$ Resources:lang,CaoZuo%>"></asp:Label>
                                                                                </asp:LinkButton>
                                                                            </ItemTemplate>
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="2%" />
                                                                        </asp:TemplateColumn>
                                                                        <asp:BoundColumn DataField="SupplierNumber" HeaderText="供方编号">
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="3%" />
                                                                        </asp:BoundColumn>
                                                                        <asp:TemplateColumn>
                                                                            <ItemTemplate>
                                                                                <a class="notTab" href='TTRelatedDIYWorkflowForm.aspx?RelatedType=Supplier&amp;RelatedID=<%#DataBinder .Eval (Container .DataItem ,"ID") %>' target="_blank">
                                                                                    <asp:Label ID="Label53" runat="server" Text="<%$ Resources:lang,RuWangShenQing%>"></asp:Label></a>
                                                                            </ItemTemplate>
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="2%" />
                                                                        </asp:TemplateColumn>
                                                                        <asp:TemplateColumn>
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="5%" />
                                                                            <HeaderTemplate>
                                                                                <asp:Label ID="Label33" runat="server" Text="<%$ Resources:lang,TuiJianDanWei%>"></asp:Label>
                                                                            </HeaderTemplate>
                                                                            <ItemTemplate>
                                                                                <%# ShareClass.StringCutByRequire(Eval("PushUnit").ToString(), 190) %>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateColumn>
                                                                        <asp:TemplateColumn>
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="4%" />
                                                                            <HeaderTemplate>
                                                                                <asp:Label ID="Label34" runat="server" Text="<%$ Resources:lang,TuiJianRen%>"></asp:Label>
                                                                            </HeaderTemplate>
                                                                            <ItemTemplate>
                                                                                <%# ShareClass.StringCutByRequire(Eval("PushPersonName").ToString(), 190) %>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateColumn>
                                                                        <asp:TemplateColumn>
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="5%" />
                                                                            <HeaderTemplate>
                                                                                <asp:Label ID="Label35" runat="server" Text="<%$ Resources:lang,ShenPiWenJian%>"></asp:Label>
                                                                            </HeaderTemplate>
                                                                            <ItemTemplate>
                                                                                <a href='<%# Eval("ApprovalDocumentURL") %>' class="notTab" target="_blank"><%# ShareClass.StringCutByRequire(Eval("ApprovalDocument").ToString(), 190) %></a>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateColumn>
                                                                        <asp:TemplateColumn>
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="4%" />
                                                                            <HeaderTemplate>
                                                                                <asp:Label ID="Label36" runat="server" Text="<%$ Resources:lang,WuZiZhuGuan%>"></asp:Label>
                                                                            </HeaderTemplate>
                                                                            <ItemTemplate>
                                                                                <%# ShareClass.StringCutByRequire(Eval("CompetentMaterialsName").ToString(), 190) %>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateColumn>
                                                                        <asp:TemplateColumn>
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="4%" />
                                                                            <HeaderTemplate>
                                                                                <asp:Label ID="Label37" runat="server" Text="<%$ Resources:lang,HeTongJianShen%>"></asp:Label>
                                                                            </HeaderTemplate>
                                                                            <ItemTemplate>
                                                                                <%# ShareClass.StringCutByRequire(Eval("ContractWhoseName").ToString(), 190) %>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateColumn>
                                                                        <asp:TemplateColumn>
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="4%" />
                                                                            <HeaderTemplate>
                                                                                <asp:Label ID="Label38" runat="server" Text="<%$ Resources:lang,ZhuGuanLingDao%>"></asp:Label>
                                                                            </HeaderTemplate>
                                                                            <ItemTemplate>
                                                                                <%# ShareClass.StringCutByRequire(Eval("CompetentLeadershipName").ToString(), 190) %>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateColumn>
                                                                        <asp:TemplateColumn>
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="5%" />
                                                                            <HeaderTemplate>
                                                                                <asp:Label ID="Label39" runat="server" Text="<%$ Resources:lang,GongYingShang%>"></asp:Label>
                                                                            </HeaderTemplate>
                                                                            <ItemTemplate>
                                                                                <%# ShareClass.StringCutByRequire(Eval("SupplierName").ToString(), 190) %>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateColumn>
                                                                        <asp:TemplateColumn>
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="6%" />
                                                                            <HeaderTemplate>
                                                                                <asp:Label ID="Label40" runat="server" Text="<%$ Resources:lang,KaiHuHang%>"></asp:Label>
                                                                            </HeaderTemplate>
                                                                            <ItemTemplate>
                                                                                <%# ShareClass.StringCutByRequire(Eval("OpeningBank").ToString(), 190) %>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateColumn>
                                                                        <asp:TemplateColumn>
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="4%" />
                                                                            <HeaderTemplate>
                                                                                <asp:Label ID="Label41" runat="server" Text="<%$ Resources:lang,ZhangHao%>"></asp:Label>
                                                                            </HeaderTemplate>
                                                                            <ItemTemplate>
                                                                                <%# ShareClass.StringCutByRequire(Eval("AccountNumber").ToString(), 190) %>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateColumn>
                                                                        <asp:TemplateColumn>
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="4%" />
                                                                            <HeaderTemplate>
                                                                                <asp:Label ID="Label42" runat="server" Text="<%$ Resources:lang,ShuiHao%>"></asp:Label>
                                                                            </HeaderTemplate>
                                                                            <ItemTemplate>
                                                                                <%# ShareClass.StringCutByRequire(Eval("RateNumber").ToString(), 190) %>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateColumn>
                                                                        <asp:TemplateColumn>
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="6%" />
                                                                            <HeaderTemplate>
                                                                                <asp:Label ID="Label43" runat="server" Text="<%$ Resources:lang,DanWeiDiZhi%>"></asp:Label>
                                                                            </HeaderTemplate>
                                                                            <ItemTemplate>
                                                                                <%# ShareClass.StringCutByRequire(Eval("UnitAddress").ToString(), 190) %>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateColumn>
                                                                        <asp:TemplateColumn>
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="3%" />
                                                                            <HeaderTemplate>
                                                                                <asp:Label ID="Label44" runat="server" Text="<%$ Resources:lang,YouBian%>"></asp:Label>
                                                                            </HeaderTemplate>
                                                                            <ItemTemplate>
                                                                                <%# ShareClass.StringCutByRequire(Eval("ZipCode").ToString(), 190) %>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateColumn>
                                                                        <asp:TemplateColumn>
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="3%" />
                                                                            <HeaderTemplate>
                                                                                <asp:Label ID="Label45" runat="server" Text="<%$ Resources:lang,FaRenDaiBiao%>"></asp:Label>
                                                                            </HeaderTemplate>
                                                                            <ItemTemplate>
                                                                                <%# ShareClass.StringCutByRequire(Eval("PersonDelegate").ToString(), 9) %>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateColumn>
                                                                        <asp:TemplateColumn>
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="3%" />
                                                                            <HeaderTemplate>
                                                                                <asp:Label ID="Label46" runat="server" Text="<%$ Resources:lang,DanWeiDianHua%>"></asp:Label>
                                                                            </HeaderTemplate>
                                                                            <ItemTemplate>
                                                                                <%# ShareClass.StringCutByRequire(Eval("UnitPhone").ToString(), 190) %>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateColumn>
                                                                        <asp:TemplateColumn>
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="3%" />
                                                                            <HeaderTemplate>
                                                                                <asp:Label ID="Label47" runat="server" Text="<%$ Resources:lang,WeiTuoDaiLiRen%>"></asp:Label>
                                                                            </HeaderTemplate>
                                                                            <ItemTemplate>
                                                                                <%# ShareClass.StringCutByRequire(Eval("DelegateAgent").ToString(), 9) %>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateColumn>
                                                                        <asp:TemplateColumn>
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="3%" />
                                                                            <HeaderTemplate>
                                                                                <asp:Label ID="Label48" runat="server" Text="<%$ Resources:lang,GuDingDianHua%>"></asp:Label>
                                                                            </HeaderTemplate>
                                                                            <ItemTemplate>
                                                                                <%# ShareClass.StringCutByRequire(Eval("ContactPhone").ToString(), 190) %>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateColumn>
                                                                        <asp:TemplateColumn>
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="3%" />
                                                                            <HeaderTemplate>
                                                                                <asp:Label ID="Label49" runat="server" Text="<%$ Resources:lang,ShouJi%>"></asp:Label>
                                                                            </HeaderTemplate>
                                                                            <ItemTemplate>
                                                                                <%# ShareClass.StringCutByRequire(Eval("Mobile").ToString(), 190) %>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateColumn>
                                                                        <asp:TemplateColumn>
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="3%" />
                                                                            <HeaderTemplate>
                                                                                QQ
                                                                            </HeaderTemplate>
                                                                            <ItemTemplate>
                                                                                <%# ShareClass.StringCutByRequire(Eval("QQ").ToString(), 190) %>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateColumn>
                                                                        <asp:TemplateColumn>
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="3%" />
                                                                            <HeaderTemplate>
                                                                                E-mail
                                                                            </HeaderTemplate>
                                                                            <ItemTemplate>
                                                                                <%# ShareClass.StringCutByRequire(Eval("Email").ToString(), 190) %>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateColumn>
                                                                        <asp:TemplateColumn>
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="4%" />
                                                                            <HeaderTemplate>
                                                                                <asp:Label ID="Label50" runat="server" Text="<%$ Resources:lang,RuWangWenJian%>"></asp:Label>
                                                                            </HeaderTemplate>
                                                                            <ItemTemplate>
                                                                                <a href='<%# Eval("InDocumentURL") %>' class="notTab" target="_blank"><%# ShareClass.StringCutByRequire(Eval("InDocument").ToString(), 9) %></a>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateColumn>
                                                                        <asp:TemplateColumn>
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="3%" />
                                                                            <HeaderTemplate>
                                                                                <asp:Label ID="Label51" runat="server" Text="<%$ Resources:lang,ShenQingRiQi%>"></asp:Label>
                                                                            </HeaderTemplate>
                                                                            <ItemTemplate>
                                                                                <%#DataBinder.Eval(Container.DataItem, "InTime", "{0:yyyy/MM/dd}")%>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateColumn>
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

                <asp:HiddenField ID="HF_ID" runat="server" />
                <asp:HiddenField ID="HF_Progress" runat="server" />
            </ContentTemplate>
            <Triggers>
                <asp:PostBackTrigger ControlID="BT_ApprovalDocument" />
                <asp:PostBackTrigger ControlID="BT_Save" />
                <asp:PostBackTrigger ControlID="BT_Cancel" />
            </Triggers>
        </asp:UpdatePanel>
    </form>
</body>
<script type="text/javascript" language="javascript">var cssDirectory = '<%=Session["CssDirectory"] %>'; var oLink = document.getElementById('mainCss'); oLink.href = 'css/' + cssDirectory + '/' + 'bluelightmain.css';</script></html>
