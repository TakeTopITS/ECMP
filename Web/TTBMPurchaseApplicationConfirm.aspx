<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTBMPurchaseApplicationConfirm.aspx.cs" Inherits="TTBMPurchaseApplicationConfirm" %>

<%@ Register Assembly="NickLee.Web.UI" Namespace="NickLee.Web.UI" TagPrefix="NickLee" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Assembly="Brettle.Web.NeatUpload" Namespace="Brettle.Web.NeatUpload" TagPrefix="Upload" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link id="mainCss" href="css/bluelightmain.css" rel="stylesheet" type="text/css" />
    <script src="js/jquery-1.7.2.min.js" type="text/javascript"></script>
    <script src="js/allAHandler.js" type="text/javascript"></script>
    <script language="javascript" type="text/javascript">
        $(function () {
            if (top.location != self.location) { } else { CloseWebPage(); }

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
                                                            <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,FenBaoFuKuanShengQing%>"></asp:Label>
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
                                <td align="center" style="padding-top: 5px; width: 100%">
                                    <table cellpadding="2" cellspacing="0" class="formBgStyle" width="75%">
                                        <tr>
                                              <td align="center">
                                                <asp:Label ID="Label9" runat="server" Text="<%$ Resources:lang,ShenQingXinXi %>"></asp:Label>：<asp:TextBox ID="TextBox1" runat="server" Width="100px"></asp:TextBox>
                                          
                                                <asp:Label ID="Label10" runat="server" Text="<%$ Resources:lang,ShenQingRen %>"></asp:Label>：<asp:TextBox ID="TextBox2" runat="server" Width="100px"></asp:TextBox>
                                         
                                                <asp:Label ID="Label11" runat="server" Text="<%$ Resources:lang,ShenQingRiQi %>"></asp:Label>：<asp:TextBox ID="TextBox3" runat="server" Width="85px"></asp:TextBox>
                                                <cc1:CalendarExtender ID="CalendarExtender5" runat="server" Format="yyyy-MM-dd" TargetControlID="TextBox3" Enabled="True">
                                                </cc1:CalendarExtender>
                                                <asp:Label ID="Label12" runat="server" Text="<%$ Resources:lang,Zhi %>"></asp:Label><asp:TextBox ID="TextBox4" runat="server" Width="85px"></asp:TextBox>
                                                <cc1:CalendarExtender ID="CalendarExtender6" runat="server" Format="yyyy-MM-dd" TargetControlID="TextBox4" Enabled="True">
                                                </cc1:CalendarExtender>
                                          
                                                <asp:Button ID="BT_Query" runat="server" CssClass="inpu" OnClick="BT_Query_Click" Text="<%$ Resources:lang,ChaXun %>" />
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td align="left" style="padding-top: 5px; width: 100%">


                                    <table cellpadding="2" cellspacing="0" class="formBgStyle" width="98%">
                                        <tr>
                                            <td align="center" class="formItemBgStyle">
                                                <table width="100%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                                    <tr>
                                                        <td>
                                                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                <tr>
                                                                    <td width="10%" align="center">
                                                                        <strong>
                                                                            <asp:Label ID="Label13" runat="server" Text="<%$ Resources:lang,BianHao %>"></asp:Label></strong>
                                                                    </td>
                                                                    <td width="10%" align="center"></td>
                                                                    <td width="20%" align="center">
                                                                        <strong>
                                                                            <asp:Label ID="Label14" runat="server" Text="<%$ Resources:lang,MingCheng %>"></asp:Label></strong>
                                                                    </td>
                                                                    <td width="10%" align="center">
                                                                        <strong>
                                                                            <asp:Label ID="Label15" runat="server" Text="<%$ Resources:lang,ShenQingRen %>"></asp:Label></strong>
                                                                    </td>
                                                                    <td width="10%" align="center">
                                                                        <strong>
                                                                            <asp:Label ID="Label16" runat="server" Text="<%$ Resources:lang,ShenQingRiQi %>"></asp:Label></strong>
                                                                    </td>
                                                                    <td width="15%" align="center">
                                                                        <strong>
                                                                            <asp:Label ID="Label17" runat="server" Text="分包商"></asp:Label></strong>
                                                                    </td>
                                                                    <td width="35%" align="center">
                                                                        <strong>
                                                                            <asp:Label ID="Label18" runat="server" Text="分包内容"></asp:Label></strong>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                </table>
                                                <asp:DataGrid ID="DataGrid2" runat="server" AutoGenerateColumns="False" Height="1px" PageSize="25"
                                                    OnItemCommand="DataGrid2_ItemCommand" Width="100%" CellPadding="4" ForeColor="#333333"
                                                    GridLines="None" ShowHeader="False" AllowPaging="True" OnPageIndexChanged="DataGrid2_PageIndexChanged">

                                                    <ItemStyle CssClass="itemStyle" />
                                                    <HeaderStyle HorizontalAlign="Center" BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                    <Columns>
                                                        <asp:TemplateColumn HeaderText="编号">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                            <ItemTemplate>
                                                                <asp:Button ID="BT_ID" runat="server" CommandName="Update" CssClass="inpu" Width="150px" Text='<%# DataBinder.Eval(Container.DataItem,"Code").ToString().Trim() %>' />
                                                            </ItemTemplate>
                                                            <HeaderStyle BorderColor="#394F66" BorderStyle="Solid" BorderWidth="1px" Font-Bold="True"
                                                                HorizontalAlign="Center" />
                                                        </asp:TemplateColumn>
                                                        <asp:TemplateColumn HeaderText="Workflow">
                                                            <ItemTemplate>
                                                                <asp:LinkButton ID="LBT_Workflow" CommandName="Workflow" runat="server" Text="&lt;div&gt;&lt;img src=ImagesSkin/Assign.png border=0 alt='删除' /&gt;&lt;/div&gt;"></asp:LinkButton>
                                                            </ItemTemplate>
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                        </asp:TemplateColumn>
                                                        <asp:BoundColumn DataField="Name" HeaderText="名称">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="20%" />
                                                            <HeaderStyle BorderColor="#394F66" BorderStyle="Solid" BorderWidth="1px" Font-Bold="True"
                                                                HorizontalAlign="Center" />
                                                        </asp:BoundColumn>
                                                        <asp:BoundColumn DataField="Application" HeaderText="申请人">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="10%" />
                                                            <HeaderStyle BorderColor="#394F66" BorderStyle="Solid" BorderWidth="1px" Font-Bold="True"
                                                                HorizontalAlign="Center" />
                                                        </asp:BoundColumn>
                                                        <asp:BoundColumn DataField="ApplicationDate" HeaderText="申请日期" DataFormatString="{0:yyyy-MM-dd}">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                            <HeaderStyle BorderColor="#394F66" BorderStyle="Solid" BorderWidth="1px" Font-Bold="True"
                                                                HorizontalAlign="Center" />
                                                        </asp:BoundColumn>
                                                        <asp:BoundColumn DataField="SupplierName" HeaderText="分包商">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="15%" />
                                                            <HeaderStyle BorderColor="#394F66" BorderStyle="Solid" BorderWidth="1px" Font-Bold="True"
                                                                HorizontalAlign="Center" />
                                                        </asp:BoundColumn>
                                                        <asp:BoundColumn DataField="Remark" HeaderText="申请内容">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="35%" />
                                                            <HeaderStyle BorderColor="#394F66" BorderStyle="Solid" BorderWidth="1px" Font-Bold="True"
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
                                </td>

                            </tr>
                        </table>
                    </div>
                    <asp:Panel ID="Panel1" runat="server" CssClass="modalPopup" Style="display: none;">
                        <div class="modalPopup-text" style="width: 273px; height: 400px; overflow: auto;">
                            <table>
                                <tr>
                                    <td style="width: 60px; padding: 5px 5px 5px 5px;" valign="top" align="center">
                                        <asp:ImageButton ID="IMBT_Close" ImageUrl="ImagesSkin/Close4.jpg" runat="server" />
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </asp:Panel>
                    <asp:Panel ID="Panel2" runat="server" CssClass="modalPopup" Style="display: none;" Width="500px">
                        <div>
                            <table>
                                <tr>
                                    <td style="width: 420px; padding: 5px 5px 5px 5px;" valign="top" align="left">
                                        <asp:Label ID="Label20" runat="server" Text="<%$ Resources:lang,LCSQSCHYLJDLCJHYMQJHM%>"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 420px; padding: 5px 5px 5px 5px;" valign="top" align="left">&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;<asp:Button ID="BT_ActiveYes" runat="server" CssClass="inpu" Text="<%$ Resources:lang,Shi%>" OnClick="BT_ActiveYes_Click" />
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        <asp:Button ID="BT_ActiveNo" runat="server" CssClass="inpu" Text="<%$ Resources:lang,Fou%>" OnClick="BT_ActiveNo_Click" />
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </asp:Panel>
                    <asp:Panel ID="Panel3" runat="server" CssClass="modalPopup" Style="display: none;">
                        <div class="modalPopup-text" style="width: 273px; height: 400px; overflow: auto;">
                            <table>
                                <tr>
                                    <td style="width: 220px; padding: 5px 5px 5px 5px;" valign="top" align="left">
                                        <asp:TreeView ID="TreeView1" runat="server" NodeWrap="True" OnSelectedNodeChanged="TreeView1_SelectedNodeChanged"
                                            ShowLines="True" Width="220px">
                                            <RootNodeStyle CssClass="rootNode" />
                                            <NodeStyle CssClass="treeNode" />
                                            <LeafNodeStyle CssClass="leafNode" />
                                            <SelectedNodeStyle CssClass="selectNode" ForeColor="Red" />
                                        </asp:TreeView>
                                    </td>
                                    <td style="width: 60px; padding: 5px 5px 5px 5px;" valign="top" align="center">
                                        <asp:ImageButton ID="IMBT_CloseTree" ImageUrl="ImagesSkin/Close4.jpg" runat="server" />
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </asp:Panel>

                    <div class="layui-layer layui-layer-iframe" id="popwindow"
                        style="z-index: 9999; width: 900px; height: 530px; position: absolute; overflow: hidden; display: none; border-radius: 10px;">
                        <div class="layui-layer-title" style="background: #e7e7e8;" id="popwindow_title">
                            <asp:Label ID="Label112" runat="server" Text="&lt;div&gt;&lt;img src=ImagesSkin/Update.png border=0 width=30px height=30px alt='BusinessForm' /&gt;&lt;/div&gt;"></asp:Label>
                        </div>
                        <div id="popwindow_content" class="layui-layer-content" style="overflow: auto; padding: 0px 5px 0px 5px; text-align: left;">

                            <table cellpadding="2" cellspacing="0" class="formBgStyle" width="100%">
                                <tr>
                                    <td align="right" class="formItemBgStyle">
                                        <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,FenBaoXiangMuMingCheng%>"></asp:Label>：
                                    </td>
                                    <td align="left" class="formItemBgStyle">
                                        <asp:Label ID="LB_ProjectID" runat="server"></asp:Label>
                                        <asp:TextBox ID="TB_Name" runat="server" CssClass="shuru" Width="90%"></asp:TextBox>
                                        <cc1:ModalPopupExtender ID="ModalPopupExtender1" runat="server"
                                            Enabled="True" TargetControlID="TB_Name" PopupControlID="Panel3"
                                            CancelControlID="IMBT_CloseTree" BackgroundCssClass="modalBackground" Y="150">
                                        </cc1:ModalPopupExtender>
                                    </td>
                                    <td align="right" class="formItemBgStyle" style="height: 30px">
                                        <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,BianHao%>"></asp:Label>：
                                    </td>
                                    <td align="left" class="formItemBgStyle" style="height: 30px">
                                        <asp:TextBox ID="TB_ID" runat="server" CssClass="shuru" Enabled="False" Visible="False" Width="16px"></asp:TextBox>
                                        <asp:TextBox ID="TB_Code" runat="server" CssClass="shuru" Enabled="False"></asp:TextBox>
                                        &nbsp;<asp:TextBox ID="TB_Code1" runat="server" CssClass="shuru"></asp:TextBox>
                                    </td>

                                </tr>
                                <tr style="color: #000000">
                                    <td align="right" class="formItemBgStyle" style="height: 30px">
                                        <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,ShenQingRen%>"></asp:Label>：</td>
                                    <td align="left" class="formItemBgStyle" style="height: 30px">
                                        <asp:TextBox ID="TB_Application" runat="server" CssClass="shuru"></asp:TextBox>
                                    </td>
                                    <td align="right" class="formItemBgStyle" style="height: 30px">
                                        <asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,ShenQingRiQi%>"></asp:Label>：</td>
                                    <td align="left" class="formItemBgStyle" style="height: 30px">
                                        <asp:TextBox ID="DLC_ApplicationDate" runat="server" ReadOnly="false" CssClass="shuru" Width="150px"></asp:TextBox>
                                        <cc1:CalendarExtender ID="CalendarExtender3" runat="server" Format="yyyy-MM-dd" TargetControlID="DLC_ApplicationDate">
                                        </cc1:CalendarExtender>
                                    </td>
                                </tr>
                                <tr style="color: #000000">
                                    <td align="right" class="formItemBgStyle" style="height: 30px">
                                        <asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,ShenQingBuMen%>"></asp:Label>：</td>
                                    <td align="left" class="formItemBgStyle" style="height: 30px">
                                        <asp:TextBox ID="TB_DepartName" runat="server" CssClass="shuru" Width="200px"></asp:TextBox>
                                    </td>
                                    <td align="right" class="formItemBgStyle" style="height: 30px">
                                        <asp:Label ID="Label37" runat="server" Text="<%$ Resources:lang,FenBaoShang%>"></asp:Label>：</td>
                                    <td align="left" class="formItemBgStyle" style="height: 30px">
                                        <asp:DropDownList ID="DL_Supplier" DataValueField="Code" DataTextField="Name" runat="server">
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr style="color: #000000">
                                    <td align="right" class="formItemBgStyle" style="height: 30px">
                                        <asp:Label ID="Label89" runat="server" Text="<%$ Resources:lang,GongChengDiDian%>"></asp:Label>：</td>
                                    <td colspan="3" align="left" class="formItemBgStyle" style="height: 30px">
                                        <asp:TextBox ID="TB_EngineeringAddress" runat="server" CssClass="shuru" Width="99%"></asp:TextBox>
                                    </td>

                                </tr>
                                <tr style="color: #000000">
                                    <td align="right" class="formItemBgStyle" style="height: 30px">
                                        <asp:Label ID="Label8" runat="server" Text="<%$ Resources:lang,FenBaoNeiRong%>"></asp:Label>：</td>
                                    <td align="left" class="formItemBgStyle" colspan="3" style="height: 30px">
                                        <asp:TextBox ID="TB_Remark" runat="server" Height="50px" TextMode="MultiLine" Width="90%" CssClass="shuru"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr style="color: #000000">
                                    <td align="right" class="formItemBgStyle" style="height: 30px">
                                        <asp:Label ID="Label30" runat="server" Text="<%$ Resources:lang,GongChengShuLiang%>"></asp:Label>：</td>
                                    <td align="left" class="formItemBgStyle">
                                        <NickLee:NumberBox MaxAmount="1000000000000" MinAmount="-1000000000000" ID="NB_EnigeeringNumber" runat="server" Width="150px">0.00</NickLee:NumberBox>


                                        <asp:DropDownList ID="DL_EngineeringUnit" runat="server" DataTextField="UnitName" DataValueField="UnitName">
                                        </asp:DropDownList>


                                    </td>
                                    <td align="right" class="formItemBgStyle" style="height: 30px">
                                        <asp:Label ID="Label31" runat="server" Text="<%$ Resources:lang,JiHuaKaiGongShiJian%>"></asp:Label>：
                                    </td>
                                    <td align="left" class="formItemBgStyle" style="height: 30px">
                                        <asp:TextBox ID="DLC_PlanStartTime" runat="server" ReadOnly="false" CssClass="shuru" Width="150px"></asp:TextBox>
                                        <cc1:CalendarExtender ID="CalendarExtender1" runat="server" Format="yyyy-MM-dd" TargetControlID="DLC_PlanStartTime">
                                        </cc1:CalendarExtender>

                                        &nbsp;

              <asp:Label ID="Label34" runat="server" Text="<%$ Resources:lang,ShiGongZongZhouQi%>"></asp:Label>：
               <NickLee:NumberBox MaxAmount="1000000000000" MinAmount="-1000000000000" ID="NB_TotalDuration" runat="server" Width="150px">0.00</NickLee:NumberBox>
                                    </td>
                                </tr>
                                <tr style="color: #000000">
                                    <td align="right" class="formItemBgStyle" style="height: 30px">
                                        <asp:Label ID="Label32" runat="server" Text="<%$ Resources:lang,SheBeiShuLiang%>"></asp:Label>：</td>
                                    <td align="left" class="formItemBgStyle" style="height: 30px">
                                        <NickLee:NumberBox MaxAmount="1000000000000" MinAmount="-1000000000000" ID="NB_DeviceNumber" runat="server" Width="150px">0.00</NickLee:NumberBox>

                                        <asp:DropDownList ID="DL_DeviceUnit" runat="server" DataTextField="UnitName" DataValueField="UnitName">
                                        </asp:DropDownList>
                                    </td>

                                    <td align="right" class="formItemBgStyle" style="height: 30px">
                                        <asp:Label ID="Label35" runat="server" Text="<%$ Resources:lang,ManPower%>"></asp:Label>：</td>
                                    <td align="left" class="formItemBgStyle" style="height: 30px">
                                        <NickLee:NumberBox MaxAmount="1000000000000" MinAmount="-1000000000000" ID="NB_ManHour" runat="server" Width="150px">0.00</NickLee:NumberBox>
                                        &nbsp;
               <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,YuJiGongChengE%>"></asp:Label>：            
              <NickLee:NumberBox MaxAmount="1000000000000" MinAmount="-1000000000000" ID="NB_ExpectedAmount" runat="server" Width="150px">0.00</NickLee:NumberBox>

                                    </td>
                                </tr>

                                <tr style="color: #000000">

                                    <td align="right" class="formItemBgStyle" style="height: 30px">
                                        <asp:Label ID="Label33" runat="server" Text="<%$ Resources:lang,XianChangShiGongTiaoJian%>"></asp:Label>：:
                                    </td>
                                    <td colspan="3" align="left" class="formItemBgStyle">
                                        <asp:TextBox ID="TB_SiteCondition" runat="server" CssClass="shuru" Width="90%"></asp:TextBox>
                                    </td>


                                </tr>
                                <tr style="color: #000000">
                                    <td align="right" class="formItemBgStyle" style="height: 30px">
                                        <asp:Label ID="Label36" runat="server" Text="<%$ Resources:lang,QTYQ%>"></asp:Label>：:
                                    </td>
                                    <td colspan="3" align="left" class="formItemBgStyle" style="height: 30px">
                                        <asp:TextBox ID="TB_OtherComment" runat="server" CssClass="shuru" Width="90%"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr style="color: #000000">
                                    <td colspan="4" align="left">
                                        <asp:Label ID="Label39" runat="server" Text="<%$ Resources:lang,FuKuanXinXi%>"></asp:Label>

                                    </td>
                                </tr>
                                <tr>
                                    <td style="text-align: right; height: 19px;" class="formItemBgStyle">
                                        <asp:Label ID="LB_tbAccount" runat="server" Text="<%$ Resources:lang,Account%>"></asp:Label>
                                        :
                                    </td>
                                    <td colspan="3" style="text-align: left; height: 19px;" class="formItemBgStyle">
                                        <asp:TextBox ID="TB_Account" runat="server" Width="45%"></asp:TextBox>
                                        <asp:DropDownList ID="DL_Account" runat="server" AutoPostBack="True" DataTextField="AccountName"
                                            DataValueField="AccountName" Height="25px" OnSelectedIndexChanged="DL_Account_SelectedIndexChanged">
                                        </asp:DropDownList>
                                        <asp:Label ID="lbl_AccountCode" runat="server" Visible="False"></asp:Label>

                                        <asp:Label ID="Label46" runat="server" Text="<%$ Resources:lang,BiBie%>"></asp:Label>：
                              <asp:DropDownList ID="DL_CurrencyType" runat="server" DataTextField="Type" DataValueField="Type"></asp:DropDownList>
                                    </td>
                                </tr>
                                <tr style="color: #000000">
                                    <td align="right" class="formItemBgStyle" style="height: 30px">
                                        <asp:Label ID="Label38" runat="server" Text="<%$ Resources:lang,ShiJiGongShi%>"></asp:Label>：</td>
                                    <td align="left" class="formItemBgStyle">
                                        <NickLee:NumberBox MaxAmount="1000000000000" MinAmount="-1000000000000" ID="NB_ActualManHour" runat="server" Width="150px">0.00</NickLee:NumberBox>

                                    </td>
                                    <td align="right" class="formItemBgStyle" style="height: 30px">
                                        <asp:Label ID="Label40" runat="server" Text="<%$ Resources:lang,DanJia%>"></asp:Label>：
                                    </td>
                                    <td align="left" class="formItemBgStyle" style="height: 30px">
                                        <NickLee:NumberBox MaxAmount="1000000000000" MinAmount="-1000000000000" ID="NB_UnitPrice" runat="server" Width="150px">0.00</NickLee:NumberBox>
                                        <asp:Button ID="BT_CountActualAmount" runat="server" CssClass="inpu" Text="<%$ Resources:lang,JiSuan%>" OnClick="BT_CountActualAmount_Click" />
                                    </td>


                                </tr>

                                <tr>
                                    <td align="right" class="formItemBgStyle" style="height: 30px">
                                        <asp:Label ID="Label41" runat="server" Text="<%$ Resources:lang,YingFuJinE%>"></asp:Label>：</td>
                                    <td align="left" class="formItemBgStyle" style="height: 30px">
                                        <NickLee:NumberBox MaxAmount="1000000000000" MinAmount="-1000000000000" ID="NB_ActualAmount" runat="server" Width="150px">0.00</NickLee:NumberBox>

                                    </td>
                                    <td align="right" class="formItemBgStyle" style="height: 30px">
                                        <asp:Label ID="Label42" runat="server" Text="<%$ Resources:lang,HeTongWaiYingFuKuanHeJi%>"></asp:Label>：</td>
                                    <td align="left" class="formItemBgStyle" style="height: 30px">
                                        <NickLee:NumberBox MaxAmount="1000000000000" MinAmount="-1000000000000" ID="NB_OutContractPayAmount" runat="server" Width="150px">0.00</NickLee:NumberBox>

                                    </td>
                                </tr>
                                <tr style="color: #000000">
                                    <td align="right" class="formItemBgStyle" style="height: 30px">
                                        <asp:Label ID="Label43" runat="server" Text="<%$ Resources:lang,YingKouZhanKouKuanHeJi%>"></asp:Label>：</td>
                                    <td align="left" class="formItemBgStyle" style="height: 30px">
                                        <NickLee:NumberBox MaxAmount="1000000000000" MinAmount="-1000000000000" ID="NB_DeductedAmount" runat="server" Width="150px">0.00</NickLee:NumberBox>

                                        <asp:Button ID="BT_CountTotalAmount" runat="server" CssClass="inpu" Text="<%$ Resources:lang,JiSuan%>" OnClick="BT_CountTotalAmount_Click" />

                                    </td>

                                    <td align="right" class="formItemBgStyle" style="height: 30px">
                                        <asp:Label ID="Label44" runat="server" Text="<%$ Resources:lang,YingFuZongEZongJi%>"></asp:Label>：</td>
                                    <td align="left" class="formItemBgStyle" style="height: 30px">
                                        <NickLee:NumberBox MaxAmount="1000000000000" MinAmount="-1000000000000" ID="NB_TotalPayAmount" runat="server" Width="150px">0.00</NickLee:NumberBox>

                                    </td>
                                </tr>

                                <tr style="color: #000000">
                                    <td align="right" class="formItemBgStyle" style="height: 30px">
                                        <asp:Label ID="Label47" runat="server" Text="<%$ Resources:lang,BeiZhu%>"></asp:Label>：:
                                    </td>
                                    <td colspan="3" align="left" class="formItemBgStyle" style="height: 30px">
                                        <asp:TextBox ID="TB_Comment" runat="server" CssClass="shuru" Width="90%" TextMode="MultiLine" Height="80px"></asp:TextBox>
                                    </td>
                                </tr>

                                <tr style="color: #000000">

                                    <td align="right" class="formItemBgStyle" style="height: 30px">
                                        <asp:Label ID="Label45" runat="server" Text="<%$ Resources:lang,ZhuangTai%>"></asp:Label>
                                        ：</td>
                                    <td align="left" class="formItemBgStyle" colspan="3" style="height: 30px">
                                        <asp:Label ID="LB_Status" runat="server"></asp:Label>
                                    </td>
                                </tr>

                                <tr>
                                    <td align="right" class="formItemBgStyle" style="height: 30px"></td>
                                    <td align="left" class="formItemBgStyle" style="height: 30px">&nbsp;&nbsp;&nbsp;
                                          <asp:Button ID="BT_Add" runat="server" OnClick="BT_Add_Click" CssClass="inpu" Visible="false" Text="<%$ Resources:lang,XinZeng%>" />&nbsp;
       
                                          &nbsp;
                                      <asp:Button ID="BT_Delete" runat="server" OnClick="BT_Delete_Click" CssClass="inpu" OnClientClick="return confirm(getDeleteMsgByLangCode())"
                                          Text="<%$ Resources:lang,ShanChu%>" Enabled="False" Visible="false" />
                                    </td>
                                    <td align="left" class="formItemBgStyle">&nbsp;</td>
                                    <td align="left" class="formItemBgStyle"></td>
                                </tr>
                            </table>
                            <asp:Label ID="lbl_sql" runat="server" Visible="False"></asp:Label>
                        </div>
                        <div id="popwindow_footer0001" class="layui-layer-btn" style="border-top: 1px solid #ccc;">
                            <asp:Button ID="BT_Update" runat="server" OnClick="BT_Update_Click" CssClass="layui-layer-btn notTab"
                                Text="<%$ Resources:lang,BaoCun%>" Enabled="False" />
                            <a class="layui-layer-btn notTab" onclick="return popClose();">
                                <asp:Label ID="Label49" runat="server" Text="<%$ Resources:lang,GuanBi%>" /></a>
                        </div>
                        <span class="layui-layer-setwin"><a onclick="return popClose();" class="layui-layer-ico layui-layer-close layui-layer-close1 notTab" href="javascript:;"></a></span>
                    </div>


                    <div class="layui-layer layui-layer-iframe" id="popwindowWorkflow"
                        style="z-index: 9999; width: 900px; height: 530px; position: absolute; overflow: hidden; display: none; border-radius: 10px;">
                        <div class="layui-layer-title" style="background: #e7e7e8;" id="popwindow_title">
                            <asp:Label ID="Label48" runat="server" Text="&lt;div&gt;&lt;img src=ImagesSkin/Update.png border=0 width=30px height=30px alt='BusinessForm' /&gt;&lt;/div&gt;"></asp:Label>
                        </div>
                        <div id="popwindow_content" class="layui-layer-content" style="overflow: auto; padding: 0px 5px 0px 5px; text-align: left;">

                            <table width="98%" cellpadding="4" cellspacing="0">
                                <tr>
                                    <td align="right" style="width: 100px; height: 27px">
                                        <asp:Label ID="Label29" runat="server" Text="<%$ Resources:lang,LiuChengMuBan %>"></asp:Label>：
                                    </td>
                                    <td align="left" style="width: 650px; height: 27px">
                                        <asp:DropDownList ID="DL_TemName" runat="server" DataTextField="TemName" DataValueField="TemName"
                                            Width="228px">
                                        </asp:DropDownList>
                                        <asp:Label ID="Label27" runat="server" Text="<%$ Resources:lang,LeiXing %>"></asp:Label>： 
                                        <asp:DropDownList ID="DL_WFType" runat="server">
                                            <asp:ListItem Value="付款申请" />
                                        </asp:DropDownList>
                                        <asp:HyperLink
                                            ID="HL_WLTem" runat="server" NavigateUrl="~/TTWorkFlowTemplate.aspx" Target="_blank">
                                            <asp:Label ID="Label28" runat="server" Text="<%$ Resources:lang,MuBanWeiHu %>"></asp:Label>
                                        </asp:HyperLink><asp:Button
                                            ID="BT_Reflash" runat="server" OnClick="BT_Reflash_Click" Text="<%$ Resources:lang,ShuaXin %>" CssClass="inpu" />
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" style="width: 100px; height: 27px"></td>
                                    <td align="left" style="width: 650px; height: 27px">
                                        <span style="font-size: 10pt"></span>
                                        <asp:CheckBox ID="CB_SMS" runat="server" Font-Size="10pt" Text="<%$ Resources:lang,DuanXin %>" /><asp:CheckBox
                                            ID="CB_Mail" runat="server" Font-Size="10pt" Text="<%$ Resources:lang,YouJian %>" /><span style="font-size: 10pt"><asp:Label ID="Label26" runat="server" Text="<%$ Resources:lang,YaoQiuShouDaoXinXi %>"></asp:Label>
                                            </span>
                                        <asp:Button ID="BT_SubmitApply" runat="server" Enabled="False" Text="<%$ Resources:lang,TiJiaoShenQing %>" CssClass="inpu" />
                                        <cc1:ModalPopupExtender ID="BT_SubmitApply_ModalPopupExtender" runat="server" Enabled="True"
                                            TargetControlID="BT_SubmitApply" PopupControlID="Panel2" CancelControlID="IMBT_Close"
                                            BackgroundCssClass="modalBackground" DynamicServicePath="">
                                        </cc1:ModalPopupExtender>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center" colspan="2" style="height: 22px; text-align: left;">
                                        <asp:Label ID="Label25" runat="server" Text="<%$ Resources:lang,DuiYingGongZuoLiuLieBiao %>"></asp:Label>：
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center" colspan="2">
                                        <table width="100%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                            <tr>
                                                <td>
                                                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                        <tr>
                                                            <td width="10%" align="center">
                                                                <strong>
                                                                    <asp:Label ID="Label21" runat="server" Text="<%$ Resources:lang,BianHao %>"></asp:Label></strong> &nbsp;&nbsp;</td>
                                                            <td width="50%" align="center">
                                                                <strong>
                                                                    <asp:Label ID="Label22" runat="server" Text="<%$ Resources:lang,GongZuoLiu %>"></asp:Label></strong> &nbsp;&nbsp;</td>
                                                            <td width="20%" align="center">
                                                                <strong>
                                                                    <asp:Label ID="Label23" runat="server" Text="<%$ Resources:lang,ShenQingShiJian %>"></asp:Label></strong> &nbsp;&nbsp;</td>
                                                            <td width="10%" align="center">
                                                                <strong>
                                                                    <asp:Label ID="Label24" runat="server" Text="<%$ Resources:lang,ZhuangTai %>"></asp:Label></strong> &nbsp;&nbsp;</td>
                                                            <td width="10%" align="center">
                                                                <strong></strong>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                        </table>
                                        <asp:DataGrid ID="DataGrid4" runat="server" AutoGenerateColumns="False" Height="1px"
                                            ShowHeader="False" PageSize="5" Width="100%" CellPadding="4" ForeColor="#333333"
                                            GridLines="None">
                                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                            <EditItemStyle BackColor="#2461BF" />
                                            <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                            <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />

                                            <ItemStyle CssClass="itemStyle" />
                                            <Columns>
                                                <asp:BoundColumn DataField="WLID" HeaderText="编号">
                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                </asp:BoundColumn>
                                                <asp:HyperLinkColumn DataNavigateUrlField="WLID" DataNavigateUrlFormatString="TTMyWorkDetailMain.aspx?WLID={0}"
                                                    DataTextField="WLName" HeaderText="工作流" Target="_blank">
                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="50%" />
                                                </asp:HyperLinkColumn>
                                                <asp:BoundColumn DataField="CreateTime" HeaderText="申请时间">
                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="20%" />
                                                </asp:BoundColumn>
                                                <asp:TemplateColumn HeaderText="状态">
                                                    <ItemTemplate>
                                                    </ItemTemplate>
                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="10%" />
                                                </asp:TemplateColumn>
                                                <asp:TemplateColumn>
                                                    <ItemTemplate>
                                                        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# DataBinder.Eval(Container, "DataItem.WLID", "TTWLRelatedDoc.aspx?DocType=WorkFlow&WLID={0}") %>'
                                                            Target="_blank"><img src="ImagesSkin/Doc.gif" class="noBorder" alt="" /></asp:HyperLink>
                                                    </ItemTemplate>
                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                </asp:TemplateColumn>
                                            </Columns>
                                        </asp:DataGrid>
                                    </td>
                                </tr>
                            </table>

                        </div>
                        <div id="popwindow_footer0001" class="layui-layer-btn" style="border-top: 1px solid #ccc;">
                            <a class="layui-layer-btn notTab" onclick="return popClose();">
                                <asp:Label ID="Label50" runat="server" Text="<%$ Resources:lang,GuanBi%>" /></a>
                        </div>
                        <span class="layui-layer-setwin"><a onclick="return popClose();" class="layui-layer-ico layui-layer-close layui-layer-close1 notTab" href="javascript:;"></a></span>
                    </div>



                    <div class="layui-layer-shade" id="popwindow_shade" style="z-index: 9998; background-color: #000; opacity: 0.3; filter: alpha(opacity=30); display: none;"></div>


                </ContentTemplate>
            </asp:UpdatePanel>
            <div style="position: absolute; left: 40%; top: 40%;">
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
