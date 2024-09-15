<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTWZSupplierLeaderList.aspx.cs" Inherits="TTWZSupplierLeaderList" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>主管领导</title>
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

            if (objProgress == "提交3") {
                $("#BT_NewEdit").attr("class", "inpu");
                $("#BT_NewEdit").removeAttr("disabled");                            //编辑
                $("#BT_NewApproval").attr("class", "inpu");
                $("#BT_NewApproval").removeAttr("disabled");                          //批准
                $("#BT_NewApprovalReturn").attr("disabled", "disabled");
                $("#BT_NewApprovalReturn").removeClass("inpu");                         //批准退回
                $("#BT_NewReportReturn").attr("class", "inpu");
                $("#BT_NewReportReturn").removeAttr("disabled");                          //报批退回
            }
            else if (objProgress == "批准") {
                $("#BT_NewEdit").attr("disabled", "disabled");
                $("#BT_NewEdit").removeClass("inpu");                            //编辑
                $("#BT_NewApproval").attr("disabled", "disabled");
                $("#BT_NewApproval").removeClass("inpu");                          //批准
                $("#BT_NewApprovalReturn").attr("class", "inpu");
                $("#BT_NewApprovalReturn").removeAttr("disabled");                         //批准退回
                $("#BT_NewReportReturn").attr("disabled", "disabled");
                $("#BT_NewReportReturn").removeClass("inpu");                            //报批退回
            }
            else {
                $("#BT_NewEdit").attr("disabled", "disabled");
                $("#BT_NewEdit").removeClass("inpu");                            //编辑
                $("#BT_NewApproval").attr("disabled", "disabled");
                $("#BT_NewApproval").removeClass("inpu");                          //批准
                $("#BT_NewApprovalReturn").attr("disabled", "disabled");
                $("#BT_NewApprovalReturn").removeClass("inpu");                         //批准退回
                $("#BT_NewReportReturn").attr("disabled", "disabled");
                $("#BT_NewReportReturn").removeClass("inpu");                         //报批退回
            }

        }



        function ControlStatusCloseChange() {
            $("#BT_NewEdit").attr("disabled", "disabled");
            $("#BT_NewEdit").removeClass("inpu");
            $("#BT_NewApproval").attr("disabled", "disabled");
            $("#BT_NewApproval").removeClass("inpu");
            $("#BT_NewApprovalReturn").attr("disabled", "disabled");
            $("#BT_NewApprovalReturn").removeClass("inpu");
            $("#BT_NewReportReturn").attr("disabled", "disabled");
            $("#BT_NewReportReturn").removeClass("inpu");
            $("#BT_NewBrowse").attr("disabled", "disabled");
            $("#BT_NewBrowse").removeClass("inpu");
        }



    </script>
    <style type="text/css">
        .auto-style1 {
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
                                                            <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,RuWangLingDaoShenPi%>"></asp:Label>
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
                                                            <table class="formBgStyle">
                                                                <tr>
                                                                    <td class="formItemBgStyle" colspan="5">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,TiJiao%>"></asp:Label>主管领导</td>
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
                                                                    <td class="formItemBgStyle" colspan="2">
                                                                        <asp:Button ID="BT_Save" runat="server" CssClass="inpu" Text="<%$ Resources:lang,BaoCun%>" OnClick="BT_Save_Click" />&nbsp;
                                                                        <asp:Button ID="BT_Cancel" runat="server" CssClass="inpu" Text="<%$ Resources:lang,QuXiao%>" OnClick="BT_Cancel_Click" />
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="formItemBgStyle">
                                                                        <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,JinDu%>"></asp:Label>：</td>
                                                                    <td class="formItemBgStyle">
                                                                        <%--<asp:DropDownList ID="DDL_Progress" runat="server">
                                                                            <asp:ListItem Text="" Value=""/>
                                                                            <asp:ListItem Text="提交1" Value="提交1"/>
                                                                            <asp:ListItem Text="提交2" Value="提交2"/>
                                                                        </asp:DropDownList>--%>
                                                                        <asp:DropDownList ID="DDL_Progress" runat="server" AutoPostBack="true" OnSelectedIndexChanged="DDL_Progress_SelectedIndexChanged">
                                                                            
                                                                            <asp:ListItem Text="<%$ Resources:lang,TiJiaoSan%>" Value="提交3"/>
                                                                            <asp:ListItem Text="<%$ Resources:lang,PiZhun%>" Value="批准"/>
                                                                        </asp:DropDownList>
                                                                    </td>
                                                                    <td class="formItemBgStyle">
                                                                        <asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,GongYingShangJiLuGong%>"></asp:Label><asp:Label ID="LB_Record" runat="server" Text="0"></asp:Label><asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,Tiao%>"></asp:Label>
                                                                    </td>
                                                                    <td class="formItemBgStyle">
                                                                        <asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,JiLuCaoZuo%>"></asp:Label>：
                                                                        <asp:Button ID="BT_NewEdit" runat="server" CssClass="inpu" Text="<%$ Resources:lang,BianJi%>" OnClick="BT_NewEdit_Click" />
                                                                        <asp:Button ID="BT_NewApproval" runat="server" CssClass="auto-style1" Text="<%$ Resources:lang,PiZhun%>" OnClick="BT_NewApproval_Click" />
                                                                        <asp:Button ID="BT_NewApprovalReturn" runat="server" CssClass="inpu" Text="<%$ Resources:lang,PiZhunTuiHui%>" OnClick="BT_NewApprovalReturn_Click" />
                                                                        <asp:Button ID="BT_NewReportReturn" runat="server" CssClass="inpu" Text="<%$ Resources:lang,BaoPiTuiHui%>" OnClick="BT_NewReportReturn_Click" />
                                                                        <asp:Button ID="BT_NewBrowse" runat="server" CssClass="inpu" Text="<%$ Resources:lang,LiuLan%>" OnClick="BT_NewBrowse_Click" />
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
                                                                                            <asp:Label ID="Label8" runat="server" Text="<%$ Resources:lang,CaoZuo%>"></asp:Label></strong>
                                                                                    </td>
                                                                                    <td width="3%" align="center">
                                                                                        <strong>
                                                                                            <asp:Label ID="Label9" runat="server" Text="<%$ Resources:lang,GongFangBianHao%>"></asp:Label></strong>
                                                                                    </td>
                                                                                    <td width="5%" align="left">
                                                                                        <strong>
                                                                                            <asp:Label ID="Label10" runat="server" Text="<%$ Resources:lang,TuiJianDanWei%>"></asp:Label></strong>
                                                                                    </td>
                                                                                    <td width="4%" align="left">
                                                                                        <strong>
                                                                                            <asp:Label ID="Label11" runat="server" Text="<%$ Resources:lang,TuiJianRen%>"></asp:Label></strong>
                                                                                    </td>
                                                                                    <td width="5%" align="left">
                                                                                        <strong>
                                                                                            <asp:Label ID="Label12" runat="server" Text="<%$ Resources:lang,ShenPiWenJian%>"></asp:Label></strong>
                                                                                    </td>
                                                                                    <td width="4%" align="left">
                                                                                        <strong>
                                                                                            <asp:Label ID="Label13" runat="server" Text="<%$ Resources:lang,WuZiZhuGuan%>"></asp:Label></strong>
                                                                                    </td>
                                                                                    <td width="4%" align="left">
                                                                                        <strong>
                                                                                            <asp:Label ID="Label14" runat="server" Text="<%$ Resources:lang,HeTongJianShen%>"></asp:Label></strong>
                                                                                    </td>
                                                                                    <td width="4%" align="left">
                                                                                        <strong>
                                                                                            <asp:Label ID="Label15" runat="server" Text="<%$ Resources:lang,ZhuGuanLingDao%>"></asp:Label></strong>
                                                                                    </td>
                                                                                    <td width="5%" align="left">
                                                                                        <strong>
                                                                                            <asp:Label ID="Label16" runat="server" Text="<%$ Resources:lang,GongYingShang%>"></asp:Label></strong>
                                                                                    </td>
                                                                                    <td width="6%" align="left">
                                                                                        <strong>
                                                                                            <asp:Label ID="Label17" runat="server" Text="<%$ Resources:lang,KaiHuHang%>"></asp:Label></strong>
                                                                                    </td>
                                                                                    <td width="4%" align="left">
                                                                                        <strong>
                                                                                            <asp:Label ID="Label18" runat="server" Text="<%$ Resources:lang,ZhangHao%>"></asp:Label></strong>
                                                                                    </td>
                                                                                    <td width="4%" align="left">
                                                                                        <strong>
                                                                                            <asp:Label ID="Label19" runat="server" Text="<%$ Resources:lang,ShuiHao%>"></asp:Label></strong>
                                                                                    </td>
                                                                                    <td width="6%" align="left">
                                                                                        <strong>
                                                                                            <asp:Label ID="Label20" runat="server" Text="<%$ Resources:lang,DanWeiDiZhi%>"></asp:Label></strong>
                                                                                    </td>
                                                                                    <td width="3%" align="left">
                                                                                        <strong>
                                                                                            <asp:Label ID="Label21" runat="server" Text="<%$ Resources:lang,YouBian%>"></asp:Label></strong>
                                                                                    </td>
                                                                                    <td width="3%" align="left">
                                                                                        <strong>
                                                                                            <asp:Label ID="Label22" runat="server" Text="<%$ Resources:lang,FaRenDaiBiao%>"></asp:Label></strong>
                                                                                    </td>
                                                                                    <td width="3%" align="left">
                                                                                        <strong>
                                                                                            <asp:Label ID="Label23" runat="server" Text="<%$ Resources:lang,DanWeiDianHua%>"></asp:Label></strong>
                                                                                    </td>
                                                                                    <td width="3%" align="left">
                                                                                        <strong>
                                                                                            <asp:Label ID="Label24" runat="server" Text="<%$ Resources:lang,WeiTuoDaiLiRen%>"></asp:Label></strong>
                                                                                    </td>
                                                                                    <td width="3%" align="left">
                                                                                        <strong>
                                                                                            <asp:Label ID="Label25" runat="server" Text="<%$ Resources:lang,GuDingDianHua%>"></asp:Label></strong>
                                                                                    </td>
                                                                                    <td width="3%" align="left">
                                                                                        <strong>
                                                                                            <asp:Label ID="Label26" runat="server" Text="<%$ Resources:lang,ShouJi%>"></asp:Label></strong>
                                                                                    </td>
                                                                                    <td width="3%" align="left">
                                                                                        <strong>QQ</strong>
                                                                                    </td>
                                                                                    <td width="3%" align="left">
                                                                                        <strong>E-mail</strong>
                                                                                    </td>
                                                                                    <td width="4%" align="left">
                                                                                        <strong>
                                                                                            <asp:Label ID="Label27" runat="server" Text="<%$ Resources:lang,RuWangWenJian%>"></asp:Label></strong>
                                                                                    </td>
                                                                                    <td width="3%" align="center">
                                                                                        <strong>
                                                                                            <asp:Label ID="Label28" runat="server" Text="<%$ Resources:lang,ShenQingRiQi%>"></asp:Label></strong>
                                                                                    </td>
                                                                                    <td width="3%" align="center">
                                                                                        <strong>
                                                                                            <asp:Label ID="Label29" runat="server" Text="<%$ Resources:lang,JinDu%>"></asp:Label></strong>
                                                                                    </td>
                                                                                    <td width="3%" align="center">
                                                                                            <strong>
                                                                                                <asp:Label ID="Label30" runat="server" Text="<%$ Resources:lang,ShiYongBiaoJi%>"></asp:Label></strong>
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
                                                                    CellPadding="4" ForeColor="#333333" GridLines="None" Height="1px" PageSize="10" ShowHeader="false"
                                                                    Width="100%" OnItemCommand="DG_List_ItemCommand" OnPageIndexChanged="DG_List_PageIndexChanged">
                                                                    <Columns>
                                                                        <asp:TemplateColumn>
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="2%" />
                                                                            <HeaderTemplate>
                                                                                <asp:Label ID="Label31" runat="server" Text="<%$ Resources:lang,CaoZuo%>"></asp:Label>
                                                                            </HeaderTemplate>
                                                                            <ItemTemplate>

                                                                                <asp:LinkButton ID="LinkButton1" runat="server" CommandArgument='<%# Eval("ID")+"|"+Eval("Progress") %>' CommandName="click" CssClass="notTab">操作</asp:LinkButton>
                                                                                
                                                                            </ItemTemplate>
                                                                        </asp:TemplateColumn>
                                                                        <asp:BoundColumn DataField="SupplierNumber" HeaderText="供方编号">
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="3%" />
                                                                        </asp:BoundColumn>
                                                                        <asp:TemplateColumn>
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="5%" />
                                                                            <HeaderTemplate>
                                                                                <asp:Label ID="Label32" runat="server" Text="<%$ Resources:lang,TuiJianDanWei%>"></asp:Label>
                                                                            </HeaderTemplate>
                                                                            <ItemTemplate>
                                                                                <%# ShareClass.StringCutByRequire(Eval("PushUnit").ToString(), 190) %>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateColumn>
                                                                        <asp:TemplateColumn>
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="4%" />
                                                                            <HeaderTemplate>
                                                                                <asp:Label ID="Label33" runat="server" Text="<%$ Resources:lang,TuiJianRen%>"></asp:Label>
                                                                            </HeaderTemplate>
                                                                            <ItemTemplate>
                                                                                <%# ShareClass.StringCutByRequire(Eval("PushPersonName").ToString(), 190) %>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateColumn>
                                                                        <asp:TemplateColumn>
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="5%" />
                                                                            <HeaderTemplate>
                                                                                <asp:Label ID="Label34" runat="server" Text="<%$ Resources:lang,ShenPiWenJian%>"></asp:Label>
                                                                            </HeaderTemplate>
                                                                            <ItemTemplate>
                                                                                <a href='<%# Eval("ApprovalDocumentURL") %>' class="notTab" target="_blank"><%# ShareClass.StringCutByRequire(Eval("ApprovalDocument").ToString(), 190) %></a>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateColumn>
                                                                        <asp:TemplateColumn>
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="4%" />
                                                                            <HeaderTemplate>
                                                                                <asp:Label ID="Label35" runat="server" Text="<%$ Resources:lang,WuZiZhuGuan%>"></asp:Label>
                                                                            </HeaderTemplate>
                                                                            <ItemTemplate>
                                                                                <%# ShareClass.StringCutByRequire(Eval("CompetentMaterialsName").ToString(), 190) %>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateColumn>
                                                                        <asp:TemplateColumn>
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="4%" />
                                                                            <HeaderTemplate>
                                                                                <asp:Label ID="Label36" runat="server" Text="<%$ Resources:lang,HeTongJianShen%>"></asp:Label>
                                                                            </HeaderTemplate>
                                                                            <ItemTemplate>
                                                                                <%# ShareClass.StringCutByRequire(Eval("ContractWhoseName").ToString(), 190) %>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateColumn>
                                                                        <asp:TemplateColumn>
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="4%" />
                                                                            <HeaderTemplate>
                                                                                <asp:Label ID="Label37" runat="server" Text="<%$ Resources:lang,ZhuGuanLingDao%>"></asp:Label>
                                                                            </HeaderTemplate>
                                                                            <ItemTemplate>
                                                                                <%# ShareClass.StringCutByRequire(Eval("CompetentLeadershipName").ToString(), 190) %>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateColumn>
                                                                        <asp:TemplateColumn>
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="5%" />
                                                                            <HeaderTemplate>
                                                                                <asp:Label ID="Label38" runat="server" Text="<%$ Resources:lang,GongYingShang%>"></asp:Label>
                                                                            </HeaderTemplate>
                                                                            <ItemTemplate>
                                                                                <%# ShareClass.StringCutByRequire(Eval("SupplierName").ToString(), 190) %>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateColumn>
                                                                        <asp:TemplateColumn>
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="6%" />
                                                                            <HeaderTemplate>
                                                                                <asp:Label ID="Label39" runat="server" Text="<%$ Resources:lang,KaiHuHang%>"></asp:Label>
                                                                            </HeaderTemplate>
                                                                            <ItemTemplate>
                                                                                <%# ShareClass.StringCutByRequire(Eval("OpeningBank").ToString(), 190) %>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateColumn>
                                                                        <asp:TemplateColumn>
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="4%" />
                                                                            <HeaderTemplate>
                                                                                <asp:Label ID="Label40" runat="server" Text="<%$ Resources:lang,ZhangHao%>"></asp:Label>
                                                                            </HeaderTemplate>
                                                                            <ItemTemplate>
                                                                                <%# ShareClass.StringCutByRequire(Eval("AccountNumber").ToString(), 190) %>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateColumn>
                                                                        <asp:TemplateColumn>
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="4%" />
                                                                            <HeaderTemplate>
                                                                                <asp:Label ID="Label41" runat="server" Text="<%$ Resources:lang,ShuiHao%>"></asp:Label>
                                                                            </HeaderTemplate>
                                                                            <ItemTemplate>
                                                                                <%# ShareClass.StringCutByRequire(Eval("RateNumber").ToString(), 190) %>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateColumn>
                                                                        <asp:TemplateColumn>
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="6%" />
                                                                            <HeaderTemplate>
                                                                                <asp:Label ID="Label42" runat="server" Text="<%$ Resources:lang,DanWeiDiZhi%>"></asp:Label>
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
                                                                                <asp:Label ID="Label43" runat="server" Text="<%$ Resources:lang,FaRenDaiBiao%>"></asp:Label>
                                                                            </HeaderTemplate>
                                                                            <ItemTemplate>
                                                                                <%# ShareClass.StringCutByRequire(Eval("PersonDelegate").ToString(), 9) %>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateColumn>
                                                                        <asp:TemplateColumn>
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="3%" />
                                                                            <HeaderTemplate>
                                                                                <asp:Label ID="Label45" runat="server" Text="<%$ Resources:lang,DanWeiDianHua%>"></asp:Label>
                                                                            </HeaderTemplate>
                                                                            <ItemTemplate>
                                                                                <%# ShareClass.StringCutByRequire(Eval("UnitPhone").ToString(), 190) %>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateColumn>
                                                                        <asp:TemplateColumn>
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="3%" />
                                                                            <HeaderTemplate>
                                                                                <asp:Label ID="Label46" runat="server" Text="<%$ Resources:lang,WeiTuoDaiLiRen%>"></asp:Label>
                                                                            </HeaderTemplate>
                                                                            <ItemTemplate>
                                                                                <%# ShareClass.StringCutByRequire(Eval("DelegateAgent").ToString(), 9) %>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateColumn>
                                                                        <asp:TemplateColumn>
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="3%" />
                                                                            <HeaderTemplate>
                                                                                <asp:Label ID="Label47" runat="server" Text="<%$ Resources:lang,GuDingDianHua%>"></asp:Label>
                                                                            </HeaderTemplate>
                                                                            <ItemTemplate>
                                                                                <%# ShareClass.StringCutByRequire(Eval("ContactPhone").ToString(), 190) %>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateColumn>
                                                                        <asp:TemplateColumn>
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="3%" />
                                                                            <HeaderTemplate>
                                                                                <asp:Label ID="Label48" runat="server" Text="<%$ Resources:lang,ShouJi%>"></asp:Label>
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
                                                                                <asp:Label ID="Label49" runat="server" Text="<%$ Resources:lang,RuWangWenJian%>"></asp:Label>
                                                                            </HeaderTemplate>
                                                                            <ItemTemplate>
                                                                                <a href='<%# Eval("InDocumentURL") %>' class="notTab" target="_blank"><%# ShareClass.StringCutByRequire(Eval("InDocument").ToString(), 9) %></a>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateColumn>
                                                                        <asp:TemplateColumn>
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="3%" />
                                                                            <HeaderTemplate>
                                                                                <asp:Label ID="Label50" runat="server" Text="<%$ Resources:lang,ShenQingRiQi%>"></asp:Label>
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
