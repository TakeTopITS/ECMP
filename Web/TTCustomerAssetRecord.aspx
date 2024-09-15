<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTCustomerAssetRecord.aspx.cs" Inherits="TTCustomerAssetRecord" %>

<%@ Register Assembly="NickLee.Web.UI" Namespace="NickLee.Web.UI" TagPrefix="NickLee" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Assembly="Brettle.Web.NeatUpload" Namespace="Brettle.Web.NeatUpload" TagPrefix="Upload" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>设备管理</title>
    <link id="mainCss" href="css/bluelightmain.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        #AboveDiv {
            min-width: 1200px;
            width: expression (document.body.clientWidth <= 1200? "1200px" : "auto" ));
        }

        .auto-style1 {
            font-size: large;
        }
    </style>
    <script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="js/allAHandler.js"></script>
    <script type="text/javascript" src="js/layer/layer/layer.js"></script>
    <script type="text/javascript" src="js/popwindow.js"></script>
    <script type="text/javascript" language="javascript">
        $(function () { if (top.location != self.location) { } else { CloseWebPage(); }

        });
    </script>
</head>
<body>
    <center>
        <form id="form1" runat="server">
            <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="True" EnableScriptLocalization="True">
            </asp:ScriptManager>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
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
                                                            <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,SheBeiGuanLi%>"></asp:Label>
                                                        </td>
                                                        <td width="5">
                                                            <%--<img src="ImagesSkin/main_top_r.jpg" width="5" height="31" alt="" />--%>
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
                                    <table width="100%" cellpadding="0" cellspacing="0">
                                        <tr>
                                            <td align="center" style="padding: 5px 5px 0px 5px; border-right: solid 1px #D8D8D8;">
                                                <table width="98%" cellpadding="3" cellspacing="0" class="formBgStyle">
                                                    <tr>
                                                        <td class="formItemBgStyle" style="text-align: right" width="20%">
                                                            <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,DanHao%>"></asp:Label>：
                                                        </td>
                                                        <td class="formItemBgStyle" style="width: 35%; text-align: left">
                                                            <asp:Label ID="LB_POID" runat="server"></asp:Label>
                                                            <asp:Label ID="LB_Sql5" runat="server" Visible="False"></asp:Label>
                                                        </td>
                                                        <td class="formItemBgStyle" style="width: 15%; text-align: right">
                                                            <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,MingCheng%>"></asp:Label>：
                                                        </td>
                                                        <td class="formItemBgStyle" style="width: 35%; text-align: left">
                                                            <asp:TextBox ID="TB_POName" runat="server" Width="98%"></asp:TextBox>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="formItemBgStyle" style="text-align: right">
                                                            <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,ZongJinE%>"></asp:Label>：
                                                        </td>
                                                        <td class="formItemBgStyle" colspan="1" style="text-align: left;">
                                                            <NickLee:NumberBox MaxAmount="1000000000000" MinAmount="-1000000000000" ID="NB_Amount" runat="server" Enabled="False" OnBlur="" OnFocus=""
                                                                OnKeyPress="" PositiveColor="" Width="85px">   
                                                                0.00
                                                            </NickLee:NumberBox>
                                                        </td>
                                                        <td align="right" class="formItemBgStyle">
                                                            <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,BiZhong%>"></asp:Label>：</td>
                                                        <td align="left" class="formItemBgStyle">
                                                            <asp:DropDownList ID="DL_CurrencyType" runat="server" DataTextField="Type" DataValueField="Type">
                                                            </asp:DropDownList>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="formItemBgStyle" style="text-align: right">
                                                            <asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,BeiZhu%>"></asp:Label>：
                                                        </td>
                                                        <td class="formItemBgStyle" colspan="3" style="text-align: left">
                                                            <asp:TextBox ID="TB_Comment" Width="98%" runat="server"></asp:TextBox>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="formItemBgStyle" style="text-align: right">
                                                            <asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,ZhuangTai%>"></asp:Label>：
                                                        </td>
                                                        <td class="formItemBgStyle" style="text-align: left; width: 120px;">
                                                            <asp:DropDownList ID="DL_POStatus" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DL_POStatus_SelectedIndexChanged">
                                                                <asp:ListItem Value="新建" Text="<%$ Resources:lang,XinJian%>" />
                                                                <asp:ListItem Value="处理中" Text="<%$ Resources:lang,ShenPiZhong%>" />
                                                                <asp:ListItem Value="采购中" Text="<%$ Resources:lang,CaiGouZhong%>" />
                                                                <asp:ListItem Value="取消" Text="<%$ Resources:lang,QuXiao%>" />
                                                                <asp:ListItem Value="完成" Text="<%$ Resources:lang,WanCheng%>" />
                                                            </asp:DropDownList>
                                                        </td>
                                                        <td class="formItemBgStyle" style="text-align: right"></td>
                                                        <td align="left" class="formItemBgStyle"></td>
                                                    </tr>
                                                    <tr>
                                                        <td class="formItemBgStyle" style="text-align: right"></td>
                                                        <td class="formItemBgStyle" colspan="3" style="text-align: left">
                                                            <asp:Button ID="BT_AddPO" runat="server" CssClass="inpu" OnClick="BT_AddPO_Click"
                                                                Text="<%$ Resources:lang,XinZeng%>" />
                                                            &nbsp;<asp:Button ID="BT_UpdatePO" runat="server" CssClass="inpu" Enabled="False"
                                                                OnClick="BT_UpdatePO_Click" Text="<%$ Resources:lang,BaoCun%>" />
                                                            &nbsp;<asp:Button ID="BT_DeletePO" runat="server" CssClass="inpu" Enabled="False" OnClientClick="return confirm(getDeleteMsgByLangCode())"
                                                                OnClick="BT_DeletePO_Click" Text="<%$ Resources:lang,ShanChu%>" />

                                                            <asp:Label ID="LB_UserCode" runat="server" Visible="False"></asp:Label>
                                                            <asp:Label ID="LB_UserName" runat="server" Font-Size="10pt"
                                                                Visible="False"></asp:Label>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="formItemBgStyle" style="text-align: right">
                                                            <asp:Label ID="Label8" runat="server" Text="<%$ Resources:lang,DaoRuSheBei%>"></asp:Label>：</td>
                                                        <td class="formItemBgStyle" colspan="3" style="text-align: left">
                                                            <asp:UpdatePanel ID="UpdatePanel3" runat="server" UpdateMode="Conditional">
                                                                <ContentTemplate>
                                                                    <div>
                                                                        <Upload:InputFile ID="FileUpload_Training" runat="server" Width="400px" />
                                                                        <br />
                                                                        <asp:Button ID="btn_ExcelToDataTraining" runat="server" CssClass="inpu" Text="<%$ Resources:lang,DaoRuShuJu%>" OnClick="btn_ExcelToDataTraining_Click" />
                                                                        <asp:Label ID="Label9" runat="server" Text="<%$ Resources:lang,SJDRMBGS%>"></asp:Label>：<a href="Template/设备数据导入模版.xls"><asp:Label ID="Label10" runat="server" Text="<%$ Resources:lang,SBSJDRMB%>"></asp:Label></a>
                                                                        <div id="ProgressBar">
                                                                            <Upload:ProgressBar ID="ProgressBar1" runat="server" Height="100px" Width="500px">
                                                                            </Upload:ProgressBar>
                                                                        </div>
                                                                    </div>
                                                                </ContentTemplate>
                                                                <Triggers>
                                                                    <asp:PostBackTrigger ControlID="btn_ExcelToDataTraining" />
                                                                </Triggers>
                                                            </asp:UpdatePanel>
                                                             <asp:Label ID="LB_ErrorText" runat="server" ForeColor="Red"></asp:Label>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                            <td style="padding: 5px 5px 0px 5px;">
                                                <table background="ImagesSkin/main_n_bj.jpg" border="0" cellpadding="0" cellspacing="0"
                                                    width="100%">
                                                    <tr>
                                                        <td width="7">
                                                            <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" />
                                                        </td>
                                                        <td>
                                                            <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                                <tr>
                                                                    <td align="center" width="10%">
                                                                        <strong>
                                                                            <asp:Label ID="Label11" runat="server" Text="<%$ Resources:lang,DanHao%>"></asp:Label></strong>
                                                                    </td>
                                                                    <td align="center" width="35%">
                                                                        <strong>
                                                                            <asp:Label ID="Label12" runat="server" Text="<%$ Resources:lang,MingCheng%>"></asp:Label></strong>
                                                                    </td>
                                                                    <td align="center" width="15%">
                                                                        <strong>
                                                                            <asp:Label ID="Label13" runat="server" Text="<%$ Resources:lang,ZongJinE%>"></asp:Label></strong>
                                                                    </td>
                                                                    <td align="center" width="20%">
                                                                        <strong>
                                                                            <asp:Label ID="Label14" runat="server" Text="<%$ Resources:lang,DengJiShiJian%>"></asp:Label></strong>
                                                                    </td>
                                                                    <td align="center" width="15%">
                                                                        <strong>
                                                                            <asp:Label ID="Label15" runat="server" Text="<%$ Resources:lang,ZhuangTai%>"></asp:Label></strong>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                        <td align="right" width="6">
                                                            <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" />
                                                        </td>
                                                    </tr>
                                                </table>
                                                <asp:DataGrid ID="DataGrid5" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                                                    CellPadding="4" ForeColor="#333333" GridLines="None" Height="1px" OnItemCommand="DataGrid5_ItemCommand"
                                                    OnPageIndexChanged="DataGrid5_PageIndexChanged" PageSize="5" ShowHeader="false"
                                                    Width="100%">
                                                    <Columns>
                                                        <asp:TemplateColumn HeaderText="单号">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                            <ItemTemplate>
                                                                <asp:Button ID="BT_POID" runat="server" CssClass="inpu" Text='<%# DataBinder.Eval(Container.DataItem,"POID").ToString().Trim() %>' />
                                                            </ItemTemplate>
                                                        </asp:TemplateColumn>
                                                        <asp:BoundColumn DataField="POName" HeaderText="名称">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="35%" />
                                                        </asp:BoundColumn>
                                                        <asp:BoundColumn DataField="Amount" HeaderText="总金额">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="15%" />
                                                        </asp:BoundColumn>
                                                        <asp:BoundColumn DataField="PurTime" DataFormatString="{0:yyyy/MM/dd}" HeaderText="采购时间">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="20%" />
                                                        </asp:BoundColumn>
                                                        <asp:TemplateColumn HeaderText="状态">
                                                            <ItemTemplate>
                                                                <%# ShareClass. GetStatusHomeNameByOtherStatus(Eval("Status").ToString()) %>
                                                            </ItemTemplate>
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="15%" />
                                                        </asp:TemplateColumn>
                                                    </Columns>

                                                    <ItemStyle CssClass="itemStyle" />
                                                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                    <EditItemStyle BackColor="#2461BF" />
                                                    <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                    <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />
                                                </asp:DataGrid>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="padding-left: 5px;" colspan="2">
                                                <br />
                                                <table cellpadding="0" cellspacing="0" width="100%">
                                                    <tr>
                                                        <td align="left">
                                                            <table align="center" cellpadding="0" cellspacing="0" width="99%">
                                                                <tr>
                                                                    <td class="auto-style1">
                                                                        <b>
                                                                            <asp:Label ID="Label16" runat="server" Text="<%$ Resources:lang,MingXiDengJi%>"></asp:Label></b></td>
                                                                </tr>
                                                                <tr style="font-size: 10pt">
                                                                    <td>
                                                                        <table background="ImagesSkin/main_n_bj.jpg" border="0" cellpadding="0" cellspacing="0"
                                                                            width="100%">
                                                                            <tr>
                                                                                <td>
                                                                                    <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                                                        <tr>
                                                                                            <td align="center" width="10%">
                                                                                                <strong>
                                                                                                    <asp:Label ID="Label17" runat="server" Text="<%$ Resources:lang,BianHao%>"></asp:Label></strong>
                                                                                            </td>
                                                                                            <td align="center" width="10%">
                                                                                                <strong>
                                                                                                    <asp:Label ID="Label18" runat="server" Text="<%$ Resources:lang,LeiXing%>"></asp:Label></strong>
                                                                                            </td>
                                                                                            <td align="center" width="10%">
                                                                                                <strong>
                                                                                                    <asp:Label ID="Label19" runat="server" Text="<%$ Resources:lang,DaiMa%>"></asp:Label></strong>
                                                                                            </td>
                                                                                            <td align="center" width="20%">
                                                                                                <strong>
                                                                                                    <asp:Label ID="Label20" runat="server" Text="<%$ Resources:lang,MingCheng%>"></asp:Label></strong>
                                                                                            </td>
                                                                                            <td align="center" width="8%">
                                                                                                <strong>
                                                                                                    <asp:Label ID="Label21" runat="server" Text="<%$ Resources:lang,ShuLiang%>"></asp:Label></strong>
                                                                                            </td>
                                                                                            <td align="center" width="8%">
                                                                                                <strong>
                                                                                                    <asp:Label ID="Label22" runat="server" Text="<%$ Resources:lang,DanWei%>"></asp:Label></strong>
                                                                                            </td>
                                                                                            <td align="center" width="10%">
                                                                                                <strong>
                                                                                                    <asp:Label ID="Label23" runat="server" Text="<%$ Resources:lang,JiaGe%>"></asp:Label></strong>
                                                                                            </td>
                                                                                            <td align="center" width="10%">
                                                                                                <strong>
                                                                                                    <asp:Label ID="Label24" runat="server" Text="<%$ Resources:lang,ZhuangTai%>"></asp:Label></strong>
                                                                                            </td>
                                                                                        </tr>
                                                                                    </table>
                                                                                </td>
                                                                            </tr>
                                                                        </table>
                                                                        <asp:DataGrid ID="DataGrid1" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                                                                            CellPadding="4" ForeColor="#333333" GridLines="None" Height="1px" OnItemCommand="DataGrid1_ItemCommand"
                                                                            OnPageIndexChanged="DataGrid1_PageIndexChanged" PageSize="5" ShowHeader="False"
                                                                            Width="100%">
                                                                            <Columns>
                                                                                <asp:TemplateColumn HeaderText="编号">
                                                                                    <ItemTemplate>
                                                                                        <asp:Button ID="BT_ID" runat="server" CssClass="inpu" Text='<%# DataBinder.Eval(Container.DataItem,"ID").ToString().Trim() %>' />
                                                                                    </ItemTemplate>
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                                </asp:TemplateColumn>
                                                                                <asp:BoundColumn DataField="Type" HeaderText="类型">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                                </asp:BoundColumn>
                                                                                <asp:BoundColumn DataField="AssetCode" HeaderText="代码">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="10%" />
                                                                                </asp:BoundColumn>
                                                                                <asp:BoundColumn DataField="AssetName" HeaderText="名称">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="20%" />
                                                                                </asp:BoundColumn>
                                                                                <asp:BoundColumn DataField="Number" HeaderText="数量">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                                                </asp:BoundColumn>
                                                                                <asp:BoundColumn DataField="Unit" HeaderText="单位">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                                                </asp:BoundColumn>
                                                                                <asp:BoundColumn DataField="Price" HeaderText="价格">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                                </asp:BoundColumn>
                                                                                <asp:TemplateColumn HeaderText="状态">
                                                                                    <ItemTemplate>
                                                                                        <%# ShareClass.GetStatusHomeNameByRequirementStatus(Eval("Status").ToString()) %>
                                                                                    </ItemTemplate>
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="10%" />
                                                                                </asp:TemplateColumn>
                                                                            </Columns>

                                                                            <ItemStyle CssClass="itemStyle" />
                                                                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                                            <EditItemStyle BackColor="#2461BF" />
                                                                            <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                                            <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />
                                                                        </asp:DataGrid>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                            <br />
                                                            <table align="center" cellpadding="3" cellspacing="0" class="formBgStyle" width="99%">
                                                                <tr>
                                                                    <td class="formItemBgStyle" style="text-align: right">
                                                                        <asp:Label ID="Label25" runat="server" Text="<%$ Resources:lang,BianHao%>"></asp:Label>：
                                                                    </td>
                                                                    <td class="formItemBgStyle" style="text-align: left">
                                                                        <asp:Label ID="LB_ID" runat="server"></asp:Label>
                                                                        <asp:Label ID="LB_Sql" runat="server" Visible="False"></asp:Label>
                                                                    </td>
                                                                    <td class="formItemBgStyle" style="text-align: right">
                                                                        <asp:Label ID="Label26" runat="server" Text="<%$ Resources:lang,LeiXing%>"></asp:Label>：</td>
                                                                    <td class="formItemBgStyle" colspan="1" style="text-align: left">
                                                                        <asp:DropDownList ID="DL_Type" runat="server" DataTextField="Type" DataValueField="Type">
                                                                        </asp:DropDownList>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="formItemBgStyle" style="text-align: right">
                                                                        <asp:Label ID="Label27" runat="server" Text="<%$ Resources:lang,DaiMa%>"></asp:Label>：
                                                                    </td>
                                                                    <td class="formItemBgStyle" style="text-align: left">
                                                                        <asp:TextBox ID="TB_AssetCode" runat="server" Width="80px"></asp:TextBox>
                                                                    </td>
                                                                    <td class="formItemBgStyle" style="text-align: right">
                                                                        <asp:Label ID="Label28" runat="server" Text="<%$ Resources:lang,MingCheng%>"></asp:Label>：
                                                                    </td>
                                                                    <td class="formItemBgStyle" colspan="1" style="text-align: left">
                                                                        <asp:TextBox ID="TB_AssetName" runat="server" Height="20px" Width="350px"></asp:TextBox>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="formItemBgStyle" style="text-align: right">
                                                                        <asp:Label ID="Label29" runat="server" Text="<%$ Resources:lang,XingHao%>"></asp:Label>：</td>
                                                                    <td class="formItemBgStyle" colspan="1" style="text-align: left">
                                                                        <asp:TextBox ID="TB_ModelNumber" runat="server" Height="35px" Width="95%" TextMode="MultiLine"></asp:TextBox>
                                                                    </td>
                                                                    <td align="right" class="formItemBgStyle">
                                                                        <asp:Label ID="Label30" runat="server" Text="<%$ Resources:lang,GuiGe%>"></asp:Label>：</td>
                                                                    <td align="left" class="formItemBgStyle">
                                                                        <asp:TextBox ID="TB_Spec" runat="server" Height="35px" TextMode="MultiLine" Width="90%"></asp:TextBox>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="formItemBgStyle" style="text-align: right">
                                                                        <asp:Label ID="Label31" runat="server" Text="<%$ Resources:lang,DengJiLiYou%>"></asp:Label>：
                                                                    </td>
                                                                    <td class="formItemBgStyle" colspan="3" style="height: 1px; text-align: left;">
                                                                        <asp:TextBox ID="TB_PurReason" runat="server" Height="35px" TextMode="MultiLine"
                                                                            Width="95%"></asp:TextBox>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="formItemBgStyle" style="text-align: right">
                                                                        <asp:Label ID="Label32" runat="server" Text="<%$ Resources:lang,ShuLiang%>"></asp:Label>：
                                                                    </td>
                                                                    <td class="formItemBgStyle" colspan="1" style="text-align: left">
                                                                        <NickLee:NumberBox MaxAmount="1000000000000" MinAmount="-1000000000000" ID="NB_Number" runat="server" OnBlur="" OnFocus="" OnKeyPress=""
                                                                            PositiveColor="" Width="53px">0.00</NickLee:NumberBox>
                                                                    </td>
                                                                    <td class="formItemBgStyle" style="text-align: right">
                                                                        <asp:Label ID="Label33" runat="server" Text="<%$ Resources:lang,DanJia%>"></asp:Label>：
                                                                    </td>
                                                                    <td class="formItemBgStyle" style="text-align: left">
                                                                        <NickLee:NumberBox MaxAmount="1000000000000" MinAmount="-1000000000000" ID="NB_Price" runat="server" OnBlur="" OnFocus="" OnKeyPress=""
                                                                            PositiveColor="" Width="85px">0.00</NickLee:NumberBox>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="formItemBgStyle" style="text-align: right">
                                                                        <asp:Label ID="Label34" runat="server" Text="<%$ Resources:lang,DanWei%>"></asp:Label>：
                                                                    </td>
                                                                    <td class="formItemBgStyle" colspan="1" style="text-align: left">
                                                                        <asp:DropDownList ID="DL_Unit" runat="server" DataTextField="UnitName" DataValueField="UnitName"
                                                                            Width="64px">
                                                                        </asp:DropDownList>
                                                                    </td>
                                                                    <td class="formItemBgStyle" style="text-align: right">
                                                                        <asp:Label ID="Label35" runat="server" Text="<%$ Resources:lang,ZhuangTai%>"></asp:Label>： </td>
                                                                    <td class="formItemBgStyle" style="text-align: left">
                                                                        <asp:DropDownList ID="DL_Status" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DL_Status_SelectedIndexChanged">
                                                                            <asp:ListItem Value="新建" Text="<%$ Resources:lang,XinJian%>" />
                                                                            <asp:ListItem Value="采购中" Text="<%$ Resources:lang,CaiGouZhong%>" />
                                                                            <asp:ListItem Value="完成" Text="<%$ Resources:lang,WanCheng%>" />
                                                                            <asp:ListItem Value="取消" Text="<%$ Resources:lang,QuXiao%>" />
                                                                        </asp:DropDownList>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="formItemBgStyle" style="text-align: right">
                                                                        <asp:Label ID="Label36" runat="server" Text="<%$ Resources:lang,GongYingShang%>"></asp:Label>：
                                                                    </td>
                                                                    <td class="formItemBgStyle" colspan="1" style="text-align: left">
                                                                        <asp:TextBox ID="TB_Supplier" runat="server" Width="280px"></asp:TextBox>
                                                                    </td>
                                                                    <td class="formItemBgStyle" style="text-align: right">
                                                                        <asp:Label ID="Label37" runat="server" Text="<%$ Resources:lang,GongYingShangDianHua%>"></asp:Label>：</td>
                                                                    <td class="formItemBgStyle" style="text-align: left">
                                                                        <asp:TextBox ID="TB_SupplierPhone" runat="server" Width="150px"></asp:TextBox>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="formItemBgStyle" style="text-align: right">&nbsp;</td>
                                                                    <td class="formItemBgStyle" style="text-align: left" colspan="3">
                                                                        <asp:Button ID="BT_New" runat="server" CssClass="inpu" Enabled="False" OnClick="BT_New_Click" Text="<%$ Resources:lang,XinZeng%>" />
                                                                        &nbsp;<asp:Button ID="BT_Update" runat="server" CssClass="inpu" Enabled="False" OnClick="BT_Update_Click" Text="<%$ Resources:lang,BaoCun%>" />
                                                                        &nbsp;<asp:Button ID="BT_Delete" runat="server" CssClass="inpu" Enabled="False" OnClick="BT_Delete_Click" OnClientClick="return confirm(getDeleteMsgByLangCode())" Text="<%$ Resources:lang,ShanChu%>" />
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
                </ContentTemplate>
            </asp:UpdatePanel>
            <div style="position: absolute; left: 50%; top: 50%;">
                <asp:UpdateProgress ID="TakeTopUp" runat="server" AssociatedUpdatePanelID="UpdatePanel1">
                    <ProgressTemplate>
                        <img src="Images/Processing.gif" alt="Loading,please wait..." />
                    </ProgressTemplate>
                </asp:UpdateProgress>
            </div>
        </form>
    </center>
</body>
<script type="text/javascript" language="javascript">var cssDirectory = '<%=Session["CssDirectory"] %>'; var oLink = document.getElementById('mainCss'); oLink.href = 'css/' + cssDirectory + '/' + 'bluelightmain.css';</script></html>
