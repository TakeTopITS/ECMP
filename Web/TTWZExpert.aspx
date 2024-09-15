<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTWZExpert.aspx.cs" Inherits="TTWZExpert" %>

<%@ Register Assembly="NickLee.Web.UI" Namespace="NickLee.Web.UI" TagPrefix="NickLee" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link id="mainCss" href="css/bluelightmain.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        #AboveDiv {
            min-width: 1200px;
            width: expression (document.body.clientWidth <= 1200? "1200px" : "auto" ));
        }
    </style>
    <script src="js/jquery-1.7.2.min.js" type="text/javascript"></script>
    <script src="js/allAHandler.js" type="text/javascript"></script>
    <script language="javascript" type="text/javascript">
        $(function () {

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
                                                            <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,ZhuanJiaKuDangAn%>"></asp:Label>
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
                                            <td style="padding:5px;">

                                                <table align="center" cellpadding="0" cellspacing="0" width="100%">
                                                    <tr>
                                                        <td align="center">
                                                            <table cellpadding="2" cellspacing="0" class="formBgStyle" width="75%">
                                                                <tr>
                                                                    <td align="center">
                                                                        <asp:Label ID="Label24" runat="server" Text="<%$ Resources:lang,ZhuanJiaXinXi%>"></asp:Label>：
                                                                                
                                                                                    <asp:TextBox ID="txt_ExpertInfo" runat="server"></asp:TextBox>

                                                                        <asp:Label ID="Label25" runat="server" Text="<%$ Resources:lang,ZhuanJiaLeiXing%>"></asp:Label>：
                                                                                    <asp:DropDownList ID="ddlType" runat="server">
                                                                                        <asp:ListItem Value="请选择" Text="<%$ Resources:lang,QingXuanZe%>" />
                                                                                        <asp:ListItem Value="物资招标专家" Text="<%$ Resources:lang,WuZiZhaoBiaoZhuanJia%>" />
                                                                                        <asp:ListItem Value="工程招标专家" Text="<%$ Resources:lang,GongChengZhaoBiaoZhuanJia%>" />
                                                                                        <asp:ListItem Value="其他招标专家" Text="<%$ Resources:lang,QiTaZhaoBiaoZhuanJia%>" />
                                                                                    </asp:DropDownList>

                                                                        <asp:Label ID="lbl_sql" runat="server" Visible="False"></asp:Label>
                                                                        <asp:Button ID="BT_Query" runat="server" CssClass="inpu" OnClick="BT_Query_Click" Text="<%$ Resources:lang,ChaXun%>" />
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="right" class="formItemBgStyle" style="padding: 5px 5px 5px 5px;">
                                                            <asp:Button ID="BT_Create" runat="server" Text="<%$ Resources:lang,New%>" CssClass="inpuYello" OnClick="BT_Create_Click" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <table background="ImagesSkin/main_n_bj.jpg" border="0" cellpadding="0" cellspacing="0" width="100%">
                                                                <tr>
                                                                    <td>
                                                                        <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                                            <tr>
                                                                                <td width="5%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label37" runat="server" Text="<%$ Resources:lang,BianJi %>" /></strong>
                                                                                </td>
                                                                                <td width="5%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label63" runat="server" Text="<%$ Resources:lang,ShanChu %>" /></strong>
                                                                                </td>
                                                                                <td width="8%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label26" runat="server" Text="<%$ Resources:lang,DaiMa%>"></asp:Label></strong>
                                                                                </td>
                                                                                <td width="8%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label27" runat="server" Text="<%$ Resources:lang,XingMing%>"></asp:Label></strong>
                                                                                </td>
                                                                                <td width="10%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label28" runat="server" Text="<%$ Resources:lang,GongZuoDanWei%>"></asp:Label></strong>
                                                                                </td>
                                                                                <td width="8%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label29" runat="server" Text="<%$ Resources:lang,ZhiWu%>"></asp:Label></strong></td>
                                                                                <td width="8%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label30" runat="server" Text="<%$ Resources:lang,ZhiCheng%>"></asp:Label></strong>
                                                                                </td>
                                                                                <td width="10%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label31" runat="server" Text="<%$ Resources:lang,YiDongDianHua%>"></asp:Label></strong>
                                                                                </td>
                                                                                <td width="20%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label32" runat="server" Text="<%$ Resources:lang,ZhuanYeFanWei%>"></asp:Label></strong>
                                                                                </td>
                                                                                <td width="8%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label33" runat="server" Text="<%$ Resources:lang,GongZuoDianShu%>"></asp:Label></strong>
                                                                                </td>
                                                                                <td align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label34" runat="server" Text="<%$ Resources:lang,ZhuanJiaLeiXing%>"></asp:Label></strong>
                                                                                </td>
                                                                            </tr>
                                                                        </table>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                            <asp:DataGrid ID="DataGrid1" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                                                                CellPadding="4" ForeColor="#333333" GridLines="None" Height="1px" OnItemCommand="DataGrid1_ItemCommand"
                                                                OnPageIndexChanged="DataGrid1_PageIndexChanged" PageSize="25" ShowHeader="False"
                                                                Width="100%">
                                                                <Columns>
                                                                    <asp:ButtonColumn ButtonType="LinkButton" CommandName="Update" Text="&lt;div&gt;&lt;img src=ImagesSkin/Update.png border=0 alt='修改' /&gt;&lt;/div&gt;">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                    </asp:ButtonColumn>
                                                                    <asp:TemplateColumn HeaderText="Delete">
                                                                        <ItemTemplate>
                                                                            <asp:LinkButton ID="LBT_Delete" CommandName="Delete" runat="server" OnClientClick="return confirm(getDeleteMsgByLangCode())" Text="&lt;div&gt;&lt;img src=ImagesSkin/Delete.png border=0 alt='删除' /&gt;&lt;/div&gt;"></asp:LinkButton>
                                                                        </ItemTemplate>
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                    </asp:TemplateColumn>
                                                                    <asp:BoundColumn DataField="ID" HeaderText="ID" Visible="false"></asp:BoundColumn>
                                                                    <asp:BoundColumn DataField="ExpertCode" HeaderText="ExpertCode">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:BoundColumn DataField="Name" HeaderText="姓名" Visible="false">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                                        <HeaderStyle BorderColor="#394f66" BorderStyle="Solid" BorderWidth="1px" Font-Bold="true" HorizontalAlign="Center" />
                                                                    </asp:BoundColumn>
                                                                    <asp:HyperLinkColumn DataNavigateUrlField="ID" DataNavigateUrlFormatString="TTBMExpertInfoView.aspx?ExpertID={0}" DataTextField="Name" HeaderText="姓名" Target="_blank">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="8%" />
                                                                        <HeaderStyle BorderColor="#394f66" BorderStyle="Solid" BorderWidth="1px" Font-Bold="true" HorizontalAlign="Center" />
                                                                    </asp:HyperLinkColumn>
                                                                    <asp:BoundColumn DataField="WorkUnit" HeaderText="工作单位">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                        <HeaderStyle BorderColor="#394f66" BorderStyle="Solid" BorderWidth="1px" Font-Bold="true" HorizontalAlign="Center" />
                                                                    </asp:BoundColumn>
                                                                    <asp:BoundColumn DataField="Job" HeaderText="职务">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                                        <HeaderStyle BorderColor="#394f66" BorderStyle="Solid" BorderWidth="1px" Font-Bold="true" HorizontalAlign="Center" />
                                                                    </asp:BoundColumn>
                                                                    <asp:BoundColumn DataField="JobTitle" HeaderText="职称">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                                        <HeaderStyle BorderColor="#394f66" BorderStyle="Solid" BorderWidth="1px" Font-Bold="true" HorizontalAlign="Center" />
                                                                    </asp:BoundColumn>
                                                                    <asp:BoundColumn DataField="Phone" HeaderText="移动电话">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                        <HeaderStyle BorderColor="#394f66" BorderStyle="Solid" BorderWidth="1px" Font-Bold="true" HorizontalAlign="Center" />
                                                                    </asp:BoundColumn>
                                                                    <asp:BoundColumn DataField="AllExpertType" HeaderText="专业范围">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="20%" />
                                                                        <HeaderStyle BorderColor="#394f66" BorderStyle="Solid" BorderWidth="1px" Font-Bold="true" HorizontalAlign="Center" />
                                                                    </asp:BoundColumn>
                                                                    <asp:BoundColumn DataField="WorkingPoint" HeaderText="工作点数">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                                        <HeaderStyle BorderColor="#394f66" BorderStyle="Solid" BorderWidth="1px" Font-Bold="true" HorizontalAlign="Center" />
                                                                    </asp:BoundColumn>
                                                                    <asp:BoundColumn DataField="Type" HeaderText="专家类型">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" />
                                                                        <HeaderStyle BorderColor="#394f66" BorderStyle="Solid" BorderWidth="1px" Font-Bold="true" HorizontalAlign="Center" />
                                                                    </asp:BoundColumn>
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

                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </div>


                    <div class="layui-layer layui-layer-iframe" id="popwindow"
                        style="z-index: 9999; width: 900px; height: 530px; position: absolute; overflow: hidden; display: none; border-radius: 10px;">
                        <div class="layui-layer-title" style="background: #e7e7e8;" id="popwindow_title">
                            <asp:Label ID="Label35" runat="server" Text="&lt;div&gt;&lt;img src=ImagesSkin/Update.png border=0 width=30px height=30px alt='BusinessForm' /&gt;&lt;/div&gt;"></asp:Label>
                        </div>
                        <div id="popwindow_content" class="layui-layer-content" style="overflow: auto; padding: 0px 5px 0px 5px;">

                            <table cellpadding="0" cellspacing="0">
                                <tr>
                                    <td align="left" style="width: 220px;" valign="top">
                                        <asp:TreeView ID="TreeView1" runat="server" NodeWrap="True" OnSelectedNodeChanged="TreeView1_SelectedNodeChanged"
                                            ShowLines="True" Width="170px">
                                            <RootNodeStyle CssClass="rootNode" />
                                            <NodeStyle CssClass="treeNode" />
                                            <LeafNodeStyle CssClass="leafNode" />
                                            <SelectedNodeStyle CssClass="selectNode" ForeColor="Red" />
                                        </asp:TreeView>
                                    </td>
                                    <td style="border-right: solid 1px #D8D8D8;" valign="top" width="170">
                                        <table style="width: 170px;">
                                            <tr>
                                                <td style="width: 170px; text-align: left">
                                                    <table background="ImagesSkin/main_n_bj.jpg" border="0" cellpadding="0" cellspacing="0"
                                                        width="170px">
                                                        <tr>
                                                            <td width="7">
                                                                <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" />
                                                            </td>
                                                            <td>
                                                                <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                                    <tr>
                                                                        <td align="center">
                                                                            <strong>
                                                                                <asp:Label ID="Label23" runat="server" Text="<%$ Resources:lang,BuMenRenYuan%>"></asp:Label></strong>
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </td>
                                                            <td align="right" width="6">
                                                                <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" />
                                                            </td>
                                                        </tr>
                                                    </table>
                                                    <asp:DataGrid ID="DataGrid3" runat="server" AutoGenerateColumns="False" CellPadding="4"
                                                        ForeColor="#333333" GridLines="None" OnItemCommand="DataGrid3_ItemCommand" ShowHeader="false"
                                                        Width="170px">
                                                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                        <EditItemStyle BackColor="#2461BF" />
                                                        <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                        <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />

                                                        <ItemStyle CssClass="itemStyle" />
                                                        <Columns>
                                                            <asp:TemplateColumn HeaderText="部门人员：">
                                                                <ItemTemplate>
                                                                    <asp:Button ID="BT_UserCode" runat="server" CssClass="inpu" Text='<%# DataBinder.Eval(Container.DataItem,"UserCode").ToString().Trim() %>' />
                                                                    <asp:Button ID="BT_UserName" runat="server" CssClass="inpu" Text='<%# DataBinder.Eval(Container.DataItem,"UserName").ToString().Trim() %>' />
                                                                </ItemTemplate>
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" />
                                                            </asp:TemplateColumn>
                                                        </Columns>
                                                    </asp:DataGrid>
                                                </td>
                                            </tr>
                                        </table>
                                        <br />
                                    </td>
                                    <td>
                                        <table width="98%" cellpadding="3" cellspacing="0" class="formBgStyle">
                                            <tr>
                                                <td class="formItemBgStyle" style="text-align: right">
                                                    <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,ZhuanJia%>"></asp:Label>：
                                                </td>
                                                <td class="formItemBgStyle" colspan="3" style="text-align: left">
                                                    <asp:TextBox ID="TB_ExpertCode" runat="server" Width="80px" Enabled="False"></asp:TextBox>
                                                    <asp:Label ID="LB_Name" runat="server"></asp:Label>
                                                    &nbsp;(---&gt;<asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,QingCongYouBianXuanQuZhuanJia%>"></asp:Label>)
                                                    <asp:Label ID="lbl_ID" runat="server" Visible="False"></asp:Label>
                                                </td>
                                                <td class="formItemBgStyle" style="text-align: right">
                                                    <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,GongZuoDanWei%>"></asp:Label>：</td>
                                                <td class="formItemBgStyle" style="text-align: left">
                                                    <asp:Label ID="lbl_WorkUnit" runat="server"></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="formItemBgStyle" style="text-align: right">
                                                    <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,ZhiWu%>"></asp:Label>：</td>
                                                <td class="formItemBgStyle" style="text-align: left">
                                                    <asp:TextBox ID="TB_Job" runat="server" ReadOnly="false"></asp:TextBox>
                                                </td>
                                                <td class="formItemBgStyle" style="text-align: right">
                                                    <asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,ZhiCheng%>"></asp:Label>：</td>
                                                <td class="formItemBgStyle" style="text-align: left">
                                                    <asp:TextBox ID="TB_JobTitle" runat="server" ReadOnly="false"></asp:TextBox>
                                                </td>
                                                <td class="formItemBgStyle" style="text-align: right">
                                                    <asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,ZhuanJiaLeiXing%>"></asp:Label>：</td>
                                                <td class="formItemBgStyle" style="text-align: left">
                                                    <asp:DropDownList ID="ddl_Type" DataValueField="Type" DataTextField="Type" runat="server">
                                                    </asp:DropDownList>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="formItemBgStyle" style="text-align: right">
                                                    <asp:Label ID="Label8" runat="server" Text="<%$ Resources:lang,YiDongDianHua%>"></asp:Label>：</td>
                                                <td class="formItemBgStyle" style="text-align: left">
                                                    <asp:TextBox ID="TB_Phone" runat="server" Width="120px"></asp:TextBox>
                                                </td>
                                                <td class="formItemBgStyle" style="text-align: right">
                                                    <asp:Label ID="Label9" runat="server" Text="<%$ Resources:lang,CongShiZhuanJiaLeiBie%>"></asp:Label>：</td>
                                                <td class="formItemBgStyle" style="text-align: left">
                                                    <asp:TextBox ID="TB_EngagedCategory" runat="server" Width="120px"></asp:TextBox>
                                                </td>
                                                <td class="formItemBgStyle" style="text-align: right">
                                                    <asp:Label ID="Label10" runat="server" Text="<%$ Resources:lang,CaiGouZhuanJia%>"></asp:Label>：</td>
                                                <td class="formItemBgStyle" style="text-align: left">
                                                    <asp:DropDownList ID="ddl_ProcurementCategory" runat="server">
                                                        <asp:ListItem Value="否" Text="<%$ Resources:lang,Fou%>" />
                                                        <asp:ListItem Value="是" Text="<%$ Resources:lang,Shi%>" />
                                                    </asp:DropDownList>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="formItemBgStyle" style="text-align: right; vertical-align: middle;">
                                                    <asp:Label ID="Label11" runat="server" Text="<%$ Resources:lang,ZhuanYeFanWei%>"></asp:Label>：</td>
                                                <td class="formItemBgStyle" style="text-align: left" colspan="5">
                                                    <asp:TextBox ID="TB_ExpertType" runat="server" Height="30px" TextMode="MultiLine" Width="95%"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="formItemBgStyle" style="text-align: right; vertical-align: middle;">
                                                    <asp:Label ID="Label12" runat="server" Text="<%$ Resources:lang,ZhuanYeFanWeiEr%>"></asp:Label>：</td>
                                                <td class="formItemBgStyle" style="text-align: left" colspan="5">
                                                    <asp:TextBox ID="TB_ExpertType2" runat="server" Height="30px" TextMode="MultiLine" Width="85%"></asp:TextBox>&nbsp;
                                                    <input type="button" class="inpu" value="选择" id="btnSelect" onclick="SelectDLCode('TTWZSelectorDLCode.aspx','TB_ExpertType2','')" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="formItemBgStyle" style="text-align: right; vertical-align: middle;">
                                                    <asp:Label ID="Label13" runat="server" Text="<%$ Resources:lang,BenZhiZhuanYeTeChang%>"></asp:Label>：</td>
                                                <td class="formItemBgStyle" colspan="5" style="text-align: left; vertical-align: middle;">
                                                    <asp:TextBox ID="TB_LaborExpertise" runat="server" Height="30px" TextMode="MultiLine" Width="95%"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="formItemBgStyle" style="text-align: right; vertical-align: middle;">
                                                    <asp:Label ID="Label14" runat="server" Text="<%$ Resources:lang,FeiBenZhiZhuanYeTeChang%>"></asp:Label>：</td>
                                                <td class="formItemBgStyle" colspan="5" style="text-align: left; vertical-align: middle;">
                                                    <asp:TextBox ID="TB_NotLaborExpertise" runat="server" Height="30px" TextMode="MultiLine" Width="95%"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="formItemBgStyle" style="text-align: right; vertical-align: middle;">
                                                    <asp:Label ID="Label15" runat="server" Text="<%$ Resources:lang,CaoZuoLeiTuChuJiNeng%>"></asp:Label>：</td>
                                                <td class="formItemBgStyle" colspan="5" style="text-align: left; vertical-align: middle;">
                                                    <asp:TextBox ID="TB_ActionOutstanding" runat="server" Height="30px" TextMode="MultiLine" Width="95%"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="formItemBgStyle" style="text-align: right; vertical-align: middle;">
                                                    <asp:Label ID="Label16" runat="server" Text="<%$ Resources:lang,YouLiangYeJi%>"></asp:Label>：</td>
                                                <td class="formItemBgStyle" colspan="5" style="text-align: left; vertical-align: middle;">
                                                    <asp:TextBox ID="TB_GoodPerformance" runat="server" Height="30px" TextMode="MultiLine" Width="95%"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="formItemBgStyle" style="text-align: right; vertical-align: middle;">
                                                    <asp:Label ID="Label17" runat="server" Text="<%$ Resources:lang,ChengGongChuLiAnLi%>"></asp:Label>：</td>
                                                <td class="formItemBgStyle" colspan="5" style="text-align: left; vertical-align: middle;">
                                                    <asp:TextBox ID="TB_SuccessfulCasePro" runat="server" Height="30px" TextMode="MultiLine" Width="95%"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="formItemBgStyle" style="text-align: right; vertical-align: middle;">
                                                    <asp:Label ID="Label18" runat="server" Text="<%$ Resources:lang,LunZhuWenXian%>"></asp:Label>：</td>
                                                <td class="formItemBgStyle" colspan="5" style="text-align: left; vertical-align: middle;">
                                                    <asp:TextBox ID="TB_LiteratureWorks" runat="server" Height="30px" TextMode="MultiLine" Width="95%"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="formItemBgStyle" style="text-align: right; vertical-align: middle;">
                                                    <asp:Label ID="Label19" runat="server" Text="<%$ Resources:lang,FaMingZhuanLi%>"></asp:Label>：</td>
                                                <td class="formItemBgStyle" colspan="5" style="text-align: left; vertical-align: middle;">
                                                    <asp:TextBox ID="TB_PatentInvention" runat="server" Height="30px" TextMode="MultiLine" Width="95%"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="formItemBgStyle" style="text-align: right; vertical-align: middle;">
                                                    <asp:Label ID="Label20" runat="server" Text="<%$ Resources:lang,KeYanChengGuo%>"></asp:Label>：</td>
                                                <td class="formItemBgStyle" colspan="5" style="text-align: left; vertical-align: middle;">
                                                    <asp:TextBox ID="TB_ScientificAchieve" runat="server" Height="30px" TextMode="MultiLine" Width="95%"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="formItemBgStyle" style="text-align: right; vertical-align: middle;">
                                                    <asp:Label ID="Label21" runat="server" Text="<%$ Resources:lang,GuanLiChuangXin%>"></asp:Label>：</td>
                                                <td class="formItemBgStyle" colspan="5" style="text-align: left; vertical-align: middle;">
                                                    <asp:TextBox ID="TB_ManagementInnovation" runat="server" Height="30px" TextMode="MultiLine" Width="95%"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="formItemBgStyle" style="text-align: right; vertical-align: middle;">
                                                    <asp:Label ID="Label22" runat="server" Text="<%$ Resources:lang,BuLiangBiaoXianJiLu%>"></asp:Label>：</td>
                                                <td class="formItemBgStyle" colspan="5" style="text-align: left; vertical-align: middle;">
                                                    <asp:TextBox ID="TB_BadTrackRecord" runat="server" Height="30px" TextMode="MultiLine" Width="95%"></asp:TextBox>
                                                </td>
                                            </tr>

                                        </table>
                                    </td>
                                </tr>
                            </table>
                        </div>

                        <div id="popwindow_footer" class="layui-layer-btn" style="border-top: 1px solid #ccc;">
                            <asp:LinkButton ID="BT_New" runat="server" class="layui-layer-btn notTab" OnClick="BT_New_Click" Text="<%$ Resources:lang,BaoCun%>"></asp:LinkButton><a class="layui-layer-btn notTab" onclick="return popClose();"><asp:Label ID="Label36" runat="server" Text="<%$ Resources:lang,GuanBi%>" /></a>
                        </div>
                        <span class="layui-layer-setwin"><a onclick="return popClose();" class="layui-layer-ico layui-layer-close layui-layer-close1 notTab" href="javascript:;"></a></span>
                    </div>

                    <div class="layui-layer-shade" id="popwindow_shade" style="z-index: 9998; background-color: #000; opacity: 0.3; filter: alpha(opacity=30); display: none;"></div>




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
<script type="text/javascript" language="javascript">var cssDirectory = '<%=Session["CssDirectory"] %>'; var oLink = document.getElementById('mainCss'); oLink.href = 'css/' + cssDirectory + '/' + 'bluelightmain.css';</script>
</html>
