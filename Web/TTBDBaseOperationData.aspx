<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTBDBaseOperationData.aspx.cs" Inherits="TTBDBaseOperationData" %>

<%@ Register Assembly="NickLee.Web.UI" Namespace="NickLee.Web.UI" TagPrefix="NickLee" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Assembly="Brettle.Web.NeatUpload" Namespace="Brettle.Web.NeatUpload" TagPrefix="Upload" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link id="mainCss" href="css/bluelightmain.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="js/allAHandler.js"></script>
    <script type="text/javascript" src="js/layer/layer/layer.js"></script>
    <script type="text/javascript" src="js/popwindow.js"></script>
    <script type="text/javascript" language="javascript">
        $(function () {
            if (top.location != self.location) { } else { CloseWebPage(); }



        });
    </script>

    <style type="text/css">
        .auto-style1 {
            background-color: #F6FAFD;
            background-repeat: no-repeat;
            width: 284px;
        }

        .auto-style3 {
            background-color: #F6FAFD;
            background-repeat: no-repeat;
            width: 149px;
        }

        .auto-style5 {
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
    <center>
        <form id="form1" runat="server">
            <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="True" EnableScriptLocalization="True">
            </asp:ScriptManager>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <div id="AboveDiv">
                        <table cellpadding="0" cellspacing="0" width="100%" align="center" class="bian">
                            <tr>
                                <td height="31" class="page_topbj" colspan="2">
                                    <table width="96%" border="0" align="center" cellpadding="0" cellspacing="0">
                                        <tr>
                                            <td align="left">
                                                <table width="345" border="0" align="left" cellpadding="0" cellspacing="0">
                                                    <tr>
                                                        <td width="29">
                                                            <%--<img src="Logo/main_top_l.jpg" alt="" width="29" height="31" />--%>
                                                        </td>
                                                        <td align="center" background="ImagesSkin/main_top_bj.jpg" class="titlezi">
                                                            <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,YuSuanFeiYongGuanLi%>"></asp:Label></td>
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
                                <td align="left" style="width: 15%;">
                                    <asp:TreeView ID="TreeView1" runat="server" NodeWrap="True" OnSelectedNodeChanged="TreeView1_SelectedNodeChanged" ShowLines="True" Width="100%">
                                        <RootNodeStyle CssClass="rootNode" />
                                        <NodeStyle CssClass="treeNode" />
                                        <LeafNodeStyle CssClass="leafNode" />
                                        <SelectedNodeStyle CssClass="selectNode" ForeColor="Red" />
                                    </asp:TreeView>
                                </td>
                                <td align="center" style="padding: 5px 5px 5px 5px; width: 80%">
                                    <table cellpadding="2" cellspacing="0" class="formBgStyle" width="100%">
                                        <tr>
                                            <td align="right" style="padding-right: 5px;" class="formItemBgStyle">
                                                <table width="100%">
                                                    <tr>
                                                        <td align="left">
                                                            <asp:Label ID="Label23" runat="server" Text="<%$ Resources:lang,YuSuanFeiYongLieBiao%>"></asp:Label>
                                                            ：</td>
                                            </td>
                                            <td width="20%" align="right">&nbsp;</td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td align="center" class="formItemBgStyle">
                                    <table background="ImagesSkin/main_n_bj.jpg" border="0" cellpadding="0" cellspacing="0" width="100%">
                                        <tr>
                                            <td>
                                                <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                    <tr>

                                                        <td width="5%" align="center">
                                                            <strong>
                                                                <asp:Label ID="LB_DGProjectID" runat="server" Text="<%$ Resources:lang,BianHao%>" /></strong>
                                                        </td>
                                                        <td align="center" width="30%"><strong>
                                                            <asp:Label ID="Label25" runat="server" Text="<%$ Resources:lang,BuMenMingCheng%>"></asp:Label>
                                                        </strong></td>
                                                        <td align="center" width="15%"><strong>
                                                            <asp:Label ID="Label26" runat="server" Text="<%$ Resources:lang,KuaiJiKeMu%>"></asp:Label>
                                                        </strong></td>
                                                        <td align="center" width="10%"><strong>
                                                            <asp:Label ID="Label27" runat="server" Text="<%$ Resources:lang,YuSuanNianFen%>"></asp:Label>
                                                        </strong></td>
                                                        <td align="center" width="10%"><strong>
                                                            <asp:Label ID="Label28" runat="server" Text="<%$ Resources:lang,YuSuanYueFen%>"></asp:Label>
                                                        </strong></td>
                                                        <td align="center" width="15%"><strong>
                                                            <asp:Label ID="Label29" runat="server" Text="<%$ Resources:lang,FeiYong%>"></asp:Label>
                                                        </strong></td>
                                                        <td align="center">
                                                            <strong></strong>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                    </table>
                                    <asp:DataGrid ID="DataGrid3" runat="server" AllowPaging="true" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" Height="1px" OnItemCommand="DataGrid3_ItemCommand" OnPageIndexChanged="DataGrid3_PageIndexChanged" PageSize="3" ShowHeader="false" Width="100%">
                                        <ItemStyle CssClass="itemStyle" />
                                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" HorizontalAlign="Center" />
                                        <Columns>
                                            <asp:BoundColumn DataField="ID" HeaderText="ID">
                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                            </asp:BoundColumn>
                                            <asp:BoundColumn DataField="DepartName" HeaderText="部门名称">
                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="30%" />
                                                <HeaderStyle BorderColor="#394f66" BorderStyle="Solid" BorderWidth="1px" Font-Bold="true" HorizontalAlign="Center" />
                                            </asp:BoundColumn>
                                            <asp:TemplateColumn HeaderText="会计科目">
                                                <ItemTemplate>
                                                    <%# ShareClass.GetAccountName(Eval("AccountCode").ToString()) %>
                                                </ItemTemplate>
                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="15%" />
                                            </asp:TemplateColumn>
                                            <asp:BoundColumn DataField="YearNum" HeaderText="预算年份">
                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="10%" />
                                                <HeaderStyle BorderColor="#394f66" BorderStyle="Solid" BorderWidth="1px" Font-Bold="true" HorizontalAlign="Center" />
                                            </asp:BoundColumn>
                                            <asp:BoundColumn DataField="MonthNum" HeaderText="预算月份">
                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="10%" />
                                                <HeaderStyle BorderColor="#394f66" BorderStyle="Solid" BorderWidth="1px" Font-Bold="true" HorizontalAlign="Center" />
                                            </asp:BoundColumn>
                                            <asp:BoundColumn DataField="MoneyNum" HeaderText="金额标准">
                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Right" Width="15%" />
                                                <HeaderStyle BorderColor="#394f66" BorderStyle="Solid" BorderWidth="1px" Font-Bold="true" HorizontalAlign="Center" />
                                            </asp:BoundColumn>
                                            <asp:TemplateColumn>
                                                <ItemTemplate>
                                                    <asp:Button ID="BT_Select" runat="server" CssClass="inpu" Text="<%$ Resources:lang,XuanZe%>" CommandName="Select" />
                                                </ItemTemplate>
                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" />
                                            </asp:TemplateColumn>
                                        </Columns>
                                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                        <EditItemStyle BackColor="#2461BF" />
                                        <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                        <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />
                                    </asp:DataGrid>
                                </td>
                            </tr>
                        </table>

                        <br />
                        <table cellpadding="2" cellspacing="0" class="formBgStyle" width="100%">
                            <tr>
                                <td align="center">
                                    <table cellpadding="2" cellspacing="0" class="formBgStyle">
                                        <tr>
                                            <td align="left">
                                                <asp:Label ID="Label11" runat="server" Text="<%$ Resources:lang,BuMen%>"></asp:Label>：<asp:TextBox ID="TB_DepartName" runat="server" Width="120px"></asp:TextBox>
                                                <asp:Label ID="LB_DepartCode" runat="server"></asp:Label>
                                            </td>
                                            <td align="left">
                                                <asp:Label ID="Label22" runat="server" Text="<%$ Resources:lang,KeMu%>"></asp:Label>：<asp:TextBox ID="TB_AccountName" runat="server" Width="120px"></asp:TextBox>
                                            </td>
                                            <td align="left">
                                                <asp:Label ID="Label12" runat="server" Text="<%$ Resources:lang,NianFen%>"></asp:Label>：<asp:TextBox ID="TB_Year" runat="server" Width="100px" ReadOnly="false"></asp:TextBox>
                                                <cc1:CalendarExtender ID="CalendarExtender5" runat="server" Format="yyyy" TargetControlID="TB_Year">
                                                </cc1:CalendarExtender>
                                                &nbsp;<asp:Label ID="Label13" runat="server" Text="<%$ Resources:lang,YueFen%>"></asp:Label>：<asp:TextBox ID="TB_Month" runat="server" Width="100px" ReadOnly="false"></asp:TextBox>
                                                <cc1:CalendarExtender ID="CalendarExtender6" runat="server" Format="MM" TargetControlID="TB_Month">
                                                </cc1:CalendarExtender>
                                            </td>

                                            <td>
                                                <asp:Button ID="BT_Query" runat="server" CssClass="inpu" OnClick="BT_Query_Click" Text="<%$ Resources:lang,ChaXun%>" />

                                            </td>
                                        </tr>
                                    </table>
                                </td>

                            </tr>
                        </table>
                        <table cellpadding="2" cellspacing="0" class="formBgStyle" width="100%">
                            <tr>
                                <td align="center" style="text-align: left" class="formItemBgStyle">&nbsp;&nbsp;&nbsp;
                                <table width="100%">
                                    <tr>
                                        <td align="left">
                                            <asp:Label ID="Label14" runat="server" Text="<%$ Resources:lang,YuSuanFeiYongLieBiao%>"></asp:Label>：
                                        </td>
                                        <td align="right" style="padding-right: 5px;">
                                            <asp:Button ID="BT_Create" runat="server" CssClass="inpuYello" OnClick="BT_Create_Click" Text="<%$ Resources:lang,New%>" />

                                        </td>
                                    </tr>
                                </table>

                                </td>
                            </tr>
                            <tr>
                                <td align="center" class="formItemBgStyle">
                                    <table width="100%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                        <tr>
                                            <td>
                                                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                    <tr>
                                                        <td width="5%" align="center">
                                                            <strong>
                                                                <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,BianJi %>" /></strong>
                                                        </td>
                                                        <td width="5%" align="center">
                                                            <strong>
                                                                <asp:Label ID="Label63" runat="server" Text="<%$ Resources:lang,ShanChu %>" /></strong>
                                                        </td>

                                                        <td width="5%" align="center">
                                                            <strong>
                                                                <asp:Label ID="Label15" runat="server" Text="<%$ Resources:lang,BianHao%>" /></strong>
                                                        </td>
                                                        <td width="30%" align="center">
                                                            <strong>
                                                                <asp:Label ID="Label16" runat="server" Text="<%$ Resources:lang,BuMenMingCheng%>"></asp:Label></strong>
                                                        </td>
                                                        <td width="15%" align="center">
                                                            <strong>
                                                                <asp:Label ID="Label17" runat="server" Text="<%$ Resources:lang,KuaiJiKeMu%>"></asp:Label></strong>
                                                        </td>
                                                        <td width="10%" align="center">
                                                            <strong>
                                                                <asp:Label ID="Label18" runat="server" Text="<%$ Resources:lang,YuSuanNianFen%>"></asp:Label></strong></td>
                                                        <td width="10%" align="center">
                                                            <strong>
                                                                <asp:Label ID="Label19" runat="server" Text="<%$ Resources:lang,YuSuanYueFen%>"></asp:Label></strong></td>
                                                        <td width="20%" align="center">
                                                            <strong>
                                                                <asp:Label ID="Label20" runat="server" Text="<%$ Resources:lang,FeiYong%>"></asp:Label></strong></td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                    </table>
                                    <asp:DataGrid ID="DataGrid2" runat="server" AutoGenerateColumns="False" Height="1px"
                                        OnItemCommand="DataGrid2_ItemCommand" Width="100%" CellPadding="4" ForeColor="#333333"
                                        GridLines="None" ShowHeader="false" AllowPaging="true" PageSize="10" OnPageIndexChanged="DataGrid2_PageIndexChanged">

                                        <ItemStyle CssClass="itemStyle" />
                                        <HeaderStyle HorizontalAlign="Center" BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
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
                                            <asp:BoundColumn DataField="ID" HeaderText="ID">
                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                            </asp:BoundColumn>

                                            <asp:BoundColumn DataField="DepartName" HeaderText="部门名称">
                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="30%" />
                                                <HeaderStyle BorderColor="#394f66" BorderStyle="Solid" BorderWidth="1px" Font-Bold="true"
                                                    HorizontalAlign="Center" />
                                            </asp:BoundColumn>
                                            <%--   <asp:BoundColumn DataField="AccountName" HeaderText="会计科目">
                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="15%" />
                                                        <HeaderStyle BorderColor="#394f66" BorderStyle="Solid" BorderWidth="1px" Font-Bold="true"
                                                            HorizontalAlign="Center" />
                                                    </asp:BoundColumn>--%>
                                            <asp:TemplateColumn HeaderText="会计科目">
                                                <ItemTemplate>
                                                    <%# ShareClass.GetAccountName(Eval("AccountCode").ToString()) %>
                                                </ItemTemplate>
                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="15%" />
                                            </asp:TemplateColumn>
                                            <asp:BoundColumn DataField="YearNum" HeaderText="预算年份">
                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="10%" />
                                                <HeaderStyle BorderColor="#394f66" BorderStyle="Solid" BorderWidth="1px" Font-Bold="true"
                                                    HorizontalAlign="Center" />
                                            </asp:BoundColumn>
                                            <asp:BoundColumn DataField="MonthNum" HeaderText="预算月份">
                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="10%" />
                                                <HeaderStyle BorderColor="#394f66" BorderStyle="Solid" BorderWidth="1px" Font-Bold="true"
                                                    HorizontalAlign="Center" />
                                            </asp:BoundColumn>
                                            <asp:BoundColumn DataField="MoneyNum" HeaderText="金额标准">
                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Right" Width="20%" />
                                                <HeaderStyle BorderColor="#394f66" BorderStyle="Solid" BorderWidth="1px" Font-Bold="true"
                                                    HorizontalAlign="Center" />
                                            </asp:BoundColumn>

                                        </Columns>
                                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                        <EditItemStyle BackColor="#2461BF" />
                                        <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                        <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />
                                    </asp:DataGrid>
                                </td>
                            </tr>
                        </table>
                        <br />
                        <asp:TextBox ID="TB_DepartString" runat="server" Style="visibility: hidden"></asp:TextBox>
                    </div>

                    <div class="layui-layer layui-layer-iframe" id="popwindow"
                        style="z-index: 9999; width: 800px; height: 530px; position: absolute; overflow: hidden; display: none; border-radius: 10px;">
                        <div class="layui-layer-title" style="background: #e7e7e8;" id="popwindow_title">
                            <asp:Label ID="Label10" runat="server" Text="&lt;div&gt;&lt;img src=ImagesSkin/Update.png border=0 width=30px height=30px alt='BusinessForm' /&gt;&lt;/div&gt;"></asp:Label>
                        </div>
                        <div id="popwindow_content" class="layui-layer-content" style="overflow: auto; padding: 0px 5px 0px 5px;">
                            <table cellpadding="2" cellspacing="0" class="formBgStyle" width="100%">
                                <tr>
                                    <td align="right" width="15%" class="formItemBgStyle">
                                        <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,BuMen%>"></asp:Label>
                                        ：</td>
                                    <td colspan="3" align="left" class="formItemBgStyle">
                                        <asp:Label ID="lbl_DCode" runat="server"></asp:Label>
                                        &nbsp;<asp:Label ID="lbl_DName" runat="server"></asp:Label>
                                        <asp:Label ID="LB_ID" runat="server" Visible="false"></asp:Label>
                                        <asp:Label ID="LB_BudgetID" runat="server" Visible="false"></asp:Label>
                                    </td>
                                </tr>
                                <tr style="color: #000000">
                                    <td align="right" style="height: 30px; width: 150px;" class="formItemBgStyle">
                                        <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,KuaiJiKeMu%>"></asp:Label>：</td>
                                    <td align="left" class="formItemBgStyle">
                                        <asp:DropDownList ID="ddl_AccountName" runat="server" DataTextField="AccountName" DataValueField="AccountCode" AutoPostBack="True" OnSelectedIndexChanged="ddl_AccountName_SelectedIndexChanged">
                                        </asp:DropDownList>
                                    </td>
                                    <td align="right" class="formItemBgStyle">
                                        <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,YuSuanNianFen%>"></asp:Label>：
                                    </td>
                                    <td align="left" class="formItemBgStyle" style="height: 30px">
                                        <asp:TextBox ID="DLC_YearNum" runat="server" ReadOnly="false" Enabled="false" OnTextChanged="DLC_YearNum_TextChanged"></asp:TextBox>
                                        <cc1:CalendarExtender ID="CalendarExtender1" runat="server" Format="yyyy" TargetControlID="DLC_YearNum">
                                        </cc1:CalendarExtender>
                                    </td>
                                </tr>
                                <tr style="color: #000000">
                                    <td align="right" class="formItemBgStyle" style="height: 30px; width: 150px;">
                                        <asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,YuSuanYueFen%>"></asp:Label>：</td>
                                    <td align="left" class="formItemBgStyle">
                                        <asp:TextBox ID="DLC_MonthNum" runat="server" ReadOnly="false" Enabled="false" OnTextChanged="DLC_MonthNum_TextChanged"></asp:TextBox>
                                        <cc1:CalendarExtender ID="DLC_MonthNum_CalendarExtender" runat="server" Format="MM" TargetControlID="DLC_MonthNum">
                                        </cc1:CalendarExtender>
                                    </td>
                                    <td align="right" class="formItemBgStyle">
                                        <asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,ShengYuYuSuan%>"></asp:Label>：</td>
                                    <td align="left" class="formItemBgStyle" style="height: 30px">
                                        <asp:Label ID="lbl_MoneyNum" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr style="color: #000000">
                                    <td align="right" class="formItemBgStyle" style="height: 30px; width: 150px;">
                                        <asp:Label ID="Label8" runat="server" Text="<%$ Resources:lang,FeiYong%>"></asp:Label>：</td>
                                    <td align="left" class="formItemBgStyle">
                                        <NickLee:NumberBox ID="NB_MoneyNum" runat="server" MaxAmount="1000000000000" MinAmount="-1000000000000" Width="100px">0.00</NickLee:NumberBox>
                                    </td>
                                    <td align="right" class="formItemBgStyle">
                                        <asp:Label ID="Label9" runat="server" Text="<%$ Resources:lang,ShenQingRen%>"></asp:Label>：</td>
                                    <td align="left" class="formItemBgStyle" style="height: 30px">
                                        <asp:Label ID="lbl_Creater" runat="server"></asp:Label>
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <div id="popwindow_footer" class="layui-layer-btn" style="border-top: 1px solid #ccc;">
                            <asp:LinkButton ID="BT_New" runat="server" class="layui-layer-btn notTab" OnClick="BT_New_Click" Text="<%$ Resources:lang,BaoCun%>"></asp:LinkButton><a class="layui-layer-btn notTab" onclick="return popClose();"><asp:Label ID="Label21" runat="server" Text="<%$ Resources:lang,GuanBi%>" /></a>
                        </div>
                        <span class="layui-layer-setwin"><a onclick="return popClose();" class="layui-layer-ico layui-layer-close layui-layer-close1 notTab" href="javascript:;"></a></span>
                    </div>
                    <div class="layui-layer-shade" id="popwindow_shade" style="z-index: 9998; background-color: #000; opacity: 0.3; filter: alpha(opacity=30); display: none;"></div>

                    <asp:Label ID="lbl_sql" runat="server" Visible="False"></asp:Label>
                    <asp:Label ID="lbl_DepartString" runat="server" Visible="False"></asp:Label>
                    <asp:Label ID="lbl_sql3" runat="server" Visible="False"></asp:Label>
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
