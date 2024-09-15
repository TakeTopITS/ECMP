<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTProjectExpenseAndMemberIncome.aspx.cs" Inherits="TTProjectExpenseAndMemberIncome" %>

<%@ Register Assembly="NickLee.Web.UI" Namespace="NickLee.Web.UI" TagPrefix="NickLee" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>给成员建立和分派项目</title>
    <link id="mainCss" href="css/bluelightmain.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        /*#AboveDiv {
            min-width: 1500px;
            width: expression (document.body.clientWidth <= 1500? "1500px" : "auto" ));
        }*/
        .auto-style1 {
            position: absolute;
            left: 35%;
            top: 35%;
            height: 34px;
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
            <%--  <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="True" EnableScriptLocalization="True">--%>

            <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="True" EnableScriptLocalization="True">
            </asp:ScriptManager>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <div id="AboveDiv" style="width: 100%;">
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
                                                            <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,XiangMuFeiYongYiChengYuanShouRu%>" />
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
                                <td style="padding: 5px 5px 5px 5px;">

                                    <table width="100%" border="0" cellpadding="0" cellspacing="0">
                                        <tr>
                                            <td style="padding: 5px 5px 5px 5px;" align="left">
                                                <asp:Label ID="Label5" runat="server" Font-Bold="True" Text="<%$ Resources:lang,ZongJia%>"></asp:Label>：
                                               <asp:Label ID="LB_TotalAmount" runat="server" Font-Bold="True"></asp:Label>
                                            </td>
                                            <td align="right" style="padding: 5px 5px 5px 5px;">
                                                <asp:Button ID="BT_Create" runat="server" Text="<%$ Resources:lang,New%>" CssClass="inpuYello" OnClick="BT_Create_Click" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="2">

                                                <table width="100%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                                    <tr>
                                                        <td width="7">
                                                            <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" />
                                                        </td>
                                                        <td>
                                                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                <tr>
                                                                   <td width="5%" align="center">
                                                                        <strong>
                                                                            <asp:Label ID="Label24" runat="server" Text="<%$ Resources:lang,BianJi %>" /></strong>
                                                                    </td>
                                                                    <td width="5%" align="center">
                                                                        <strong>
                                                                            <asp:Label ID="Label63" runat="server" Text="<%$ Resources:lang,ShanChu %>" /></strong>
                                                                    </td>
                                                                 
                                                                    <td width="5%" align="center">
                                                                        <strong>
                                                                            <asp:Label ID="Label9881" runat="server" Text="<%$ Resources:lang,BianHao%>" /></strong>
                                                                    </td>
                                                                    <td width="8%" align="center">
                                                                        <strong>
                                                                             <asp:Label ID="Label17" runat="server" Text="<%$ Resources:lang,XiangMu%>" /><asp:Label ID="Label2" runat="server" Text="ID" /></strong>
                                                                    </td>

                                                                    <td width="10%" align="center">
                                                                        <strong>
                                                                            <asp:Label ID="LB_DGProjectID" runat="server" Text="<%$ Resources:lang,BanGongSheFeiYongBiLi%>" /></strong>
                                                                    </td>
                                                                    <td width="10%" align="center">
                                                                        <strong>
                                                                            <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,JianChaFeiYongBiLi%>" /></strong>
                                                                    </td>
                                                                    <td width="8%" align="center">
                                                                        <strong>
                                                                            <asp:Label ID="Label9" runat="server" Text="<%$ Resources:lang,BanGongSheFeiYong%>"  /></strong>
                                                                    </td>
                                                                    <td width="8%" align="center">
                                                                        <strong>
                                                                            <asp:Label ID="Label10" runat="server" Text="<%$ Resources:lang,JianChaFeiYong%>" /></strong>
                                                                    </td>
                                                                    <td width="8%" align="center">
                                                                        <strong>
                                                                            <asp:Label ID="Lb_DGProjectCode" runat="server" Text="<%$ Resources:lang,GongLiShu%>" /></strong>
                                                                    </td>

                                                                    <td width="8%" align="center">
                                                                        <strong>
                                                                            <asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,CheFei%>" /></strong>
                                                                    </td>
                                                                    <td width="8%" align="center">
                                                                        <strong>
                                                                            <asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,CanFei%>"  /></strong>
                                                                    </td>

                                                                    <td align="center">
                                                                        <strong>
                                                                            <asp:Label ID="Label12" runat="server" Text="<%$ Resources:lang,ShengYuFenPeiKuan%>" /></strong>
                                                                    </td>

                                                                </tr>
                                                            </table>
                                                        </td>
                                                        <td width="6" align="right">
                                                            <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" />
                                                        </td>
                                                    </tr>
                                                </table>
                                                <asp:DataGrid ID="DataGrid2" runat="server" AutoGenerateColumns="False" GridLines="None"
                                                    OnItemCommand="DataGrid2_ItemCommand"
                                                    AllowCustomPaging="false" ShowHeader="False"
                                                    Width="100%">
                                                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                    <EditItemStyle BackColor="#2461BF" />
                                                    <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                    <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />
                                                    <ItemStyle CssClass="itemStyle" />
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
                                                        <asp:BoundColumn DataField="ProjectID" HeaderText="项目ID">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                        </asp:BoundColumn>

                                                        <asp:BoundColumn DataField="KeSheGuanLiFeiBiLi" HeaderText="科室费比例">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                        </asp:BoundColumn>
                                                        <asp:BoundColumn DataField="JianChaFeiBiLi" HeaderText="检查费比例">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                        </asp:BoundColumn>
                                                        <asp:BoundColumn DataField="KeSheGuanLiFei" HeaderText="科室费">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                        </asp:BoundColumn>
                                                        <asp:BoundColumn DataField="JianChaFei" HeaderText="检查费">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                        </asp:BoundColumn>
                                                        <asp:BoundColumn DataField="GongLiShu" HeaderText="公里数">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                        </asp:BoundColumn>
                                                        <asp:BoundColumn DataField="CheFei" HeaderText="车费">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                        </asp:BoundColumn>
                                                        <asp:BoundColumn DataField="CanFei" HeaderText="餐费">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                        </asp:BoundColumn>
                                                        <asp:BoundColumn DataField="ShengYuFenPeiKuan" HeaderText="剩余分配款">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" />
                                                        </asp:BoundColumn>

                                                    </Columns>
                                                </asp:DataGrid>
                                                <asp:Label ID="LB_UserCode" runat="server" Font-Bold="False" Visible="False"></asp:Label>
                                                <asp:Label ID="LB_UserName" runat="server" Font-Bold="False" Visible="False"></asp:Label>
                                                <asp:Label ID="LB_ProjectID" runat="server" Font-Bold="False"></asp:Label>

                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="2" align="center" style="padding: 5px 5px 5px 5px;">
                                                <br />
                                                <asp:Label ID="Label8" runat="server" Font-Bold="True" Text="<%$ Resources:lang,YuanGongGongShiShouRu%>" ></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="2" align="center">

                                                <table width="60%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                                    <tr>
                                                        <td width="7">
                                                            <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" />
                                                        </td>
                                                        <td>
                                                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                <tr>
                                                                    <td width="10%" align="center">
                                                                        <strong> <asp:Label ID="Label11" runat="server" Font-Bold="True" Text="<%$ Resources:lang,BianHao%>" ></asp:Label></strong>
                                                                    </td>
                                                                    <td width="15%" align="center">
                                                                        <strong> <asp:Label ID="Label13" runat="server" Font-Bold="True" Text="<%$ Resources:lang,ChengYuanDaiMa%>" ></asp:Label></strong>
                                                                    </td>
                                                                    <td width="15%" align="center">
                                                                        <strong> <asp:Label ID="Label14" runat="server" Font-Bold="True" Text="<%$ Resources:lang,ChenYuanMingCheng%>" ></asp:Label></strong>
                                                                    </td>
                                                                    <td width="35%" align="center">
                                                                        <strong> <asp:Label ID="Label15" runat="server" Font-Bold="True" Text="<%$ Resources:lang,GongShi2%>" ></asp:Label></strong>
                                                                    </td>
                                                                    <td align="center">
                                                                        <strong> <asp:Label ID="Label16" runat="server" Font-Bold="True" Text="<%$ Resources:lang,ShouRu%>" ></asp:Label></strong>
                                                                    </td>

                                                                </tr>
                                                            </table>
                                                        </td>
                                                        <td width="6" align="right">
                                                            <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" />
                                                        </td>
                                                    </tr>
                                                </table>
                                                <asp:DataGrid ID="DataGrid1" runat="server" AutoGenerateColumns="False" GridLines="None"
                                                    AllowCustomPaging="false" ShowHeader="False"
                                                    Width="60%">
                                                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                    <EditItemStyle BackColor="#2461BF" />
                                                    <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                    <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />
                                                    <ItemStyle CssClass="itemStyle" />
                                                    <Columns>

                                                        <asp:BoundColumn DataField="ID" HeaderText="编号">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                        </asp:BoundColumn>
                                                        <asp:BoundColumn DataField="MemberCode" HeaderText="代码">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="15%" />
                                                        </asp:BoundColumn>
                                                        <asp:BoundColumn DataField="MemberName" HeaderText="成员">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="15%" />
                                                        </asp:BoundColumn>
                                                        <asp:TemplateColumn HeaderText="工时">
                                                            <ItemTemplate>
                                                                <asp:TextBox ID="TB_WorkHour" runat="server" Text='<%# DataBinder.Eval(Container.DataItem,"Workhour") %>'></asp:TextBox>
                                                            </ItemTemplate>
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="35%" />
                                                        </asp:TemplateColumn>
                                                        <asp:TemplateColumn HeaderText="收入">
                                                            <ItemTemplate>
                                                                <asp:TextBox ID="TB_Income" runat="server" Text='<%# DataBinder.Eval(Container.DataItem,"MemberIncome") %>'></asp:TextBox>
                                                            </ItemTemplate>
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" />
                                                        </asp:TemplateColumn>

                                                    </Columns>
                                                </asp:DataGrid>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2" align="center">
                                    <br />
                                    <asp:Button ID="BT_RefreshWorkhour" runat="server" CssClass="inpu" Text="<%$ Resources:lang,ShuoXingGongShi%>" OnClick="BT_RefreshWorkhour_Click" />
                                    &nbsp;&nbsp;
                                    <asp:Button ID="BT_SaveMemberIncome" runat="server" CssClass="inpu" Text="<%$ Resources:lang,BaoCun%>" OnClick="BT_SaveMemberIncome_Click" />
                                </td>
                            </tr>
                        </table>

                    </div>

                    <div class="layui-layer layui-layer-iframe" id="popwindow"
                        style="z-index: 9999; width: 800px; height: 530px; position: absolute; overflow: hidden; display: none; border-radius:10px;">
                        <div class="layui-layer-title"  style="background:#e7e7e8;" id="popwindow_title">
                            <asp:Label ID="Label3" runat="server" Text="&lt;div&gt;&lt;img src=ImagesSkin/Update.png border=0 width=30px height=30px alt='BusinessForm' /&gt;&lt;/div&gt;"></asp:Label>
                        </div>
                        <div id="popwindow_content" class="layui-layer-content" style="overflow: auto; padding: 0px 5px 0px 5px;">

                            <table width="100%" cellpadding="2" cellspacing="0" class="formBgStyle">
                                <tr>
                                    <td align="center" class="formItemBgStyle">
                                        <table cellpadding="2" cellspacing="0" class="formBgStyle">
                                            <tr>
                                                <td style="text-align: left" class="formItemBgStyle">
                                                    <asp:Label ID="LB_ID" runat="server" Font-Bold="False" Visible ="false" ></asp:Label>
                                                    <asp:Label ID="Label18" runat="server" Font-Bold="True" Text="<%$ Resources:lang,BanGongSheFeiYongBiLi%>" ></asp:Label>
                                                    
                                                    ：</td>
                                                <td style="text-align: left" class="formItemBgStyle">
                                                    <%@ Register Assembly="NickLee.Web.UI" Namespace="NickLee.Web.UI" TagPrefix="NickLee" %>
                                                    <NickLee:NumberBox MaxAmount="1000000000000" MinAmount="0" ID="NB_KeSheGuanLiFeiBiLi" runat="server" Width="80px" Amount="0.08">0.00</NickLee:NumberBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="text-align: left" class="formItemBgStyle">
                                                     <asp:Label ID="Label19" runat="server" Text="<%$ Resources:lang,JianChaFeiYongBiLi%>" />：</td>
                                                <td style="text-align: left" class="formItemBgStyle">
                                                    <%@ Register Assembly="NickLee.Web.UI" Namespace="NickLee.Web.UI" TagPrefix="NickLee" %>
                                                    <NickLee:NumberBox MaxAmount="1000000000000" MinAmount="0" ID="NB_JianChaFeiBiLi" runat="server" Width="80px" Amount="0.04">0.00</NickLee:NumberBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="text-align: left" class="formItemBgStyle">
                                                    <asp:Label ID="Label1833" runat="server" Font-Bold="True" Text="<%$ Resources:lang,ShiJiMeiTianFeiYong%>" ></asp:Label>：

                                                </td>
                                                <td style="text-align: left" class="formItemBgStyle">
                                                    <%@ Register Assembly="NickLee.Web.UI" Namespace="NickLee.Web.UI" TagPrefix="NickLee" %>
                                                    <NickLee:NumberBox MaxAmount="1000000000000" MinAmount="0" ID="NB_ShiJiRiXin" Amount ="200" runat="server" Width="80px">0.00</NickLee:NumberBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="text-align: left" class="formItemBgStyle"> <asp:Label ID="Label23" runat="server" Font-Bold="True" Text="<%$ Resources:lang,MeiGongLiFeiYong%>" ></asp:Label>：

                                                </td>
                                                <td style="text-align: left" class="formItemBgStyle">
                                                    <%@ Register Assembly="NickLee.Web.UI" Namespace="NickLee.Web.UI" TagPrefix="NickLee" %>
                                                    <NickLee:NumberBox MaxAmount="1000000000000" MinAmount="0" ID="NB_MeiGongLiFeiYong" runat="server" Amount ="0.6" Width="80px">0.00</NickLee:NumberBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="text-align: left" class="formItemBgStyle"><asp:Label ID="Label22" runat="server" Text="<%$ Resources:lang,GongLiShu%>" />：</td>
                                                <td style="text-align: left" class="formItemBgStyle">
                                                    <%@ Register Assembly="NickLee.Web.UI" Namespace="NickLee.Web.UI" TagPrefix="NickLee" %>
                                                    <NickLee:NumberBox MaxAmount="1000000000000" MinAmount="0" ID="NB_GongLiShu" runat="server" Width="80px">0.00</NickLee:NumberBox>
                                                </td>
                                            </tr>

                                            <tr>
                                                <td style="text-align: left" class="formItemBgStyle">
                                                    <asp:Label ID="Label20" runat="server" Text="<%$ Resources:lang,CheFei%>" />：</td>
                                                <td style="text-align: left" class="formItemBgStyle">
                                                    <%@ Register Assembly="NickLee.Web.UI" Namespace="NickLee.Web.UI" TagPrefix="NickLee" %>
                                                    <NickLee:NumberBox MaxAmount="1000000000000" MinAmount="0" ID="NB_CheFei" runat="server" Width="80px">0.00</NickLee:NumberBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="text-align: left" class="formItemBgStyle">
                                                    <asp:Label ID="Label21" runat="server" Text="<%$ Resources:lang,CanFei%>" />：</td>
                                                <td style="text-align: left" class="formItemBgStyle">
                                                    <%@ Register Assembly="NickLee.Web.UI" Namespace="NickLee.Web.UI" TagPrefix="NickLee" %>
                                                    <NickLee:NumberBox MaxAmount="1000000000000" MinAmount="0" ID="NB_CanFei" runat="server" Width="80px">0.00</NickLee:NumberBox>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            </table>
                        </div>

                        <div id="popwindow_footer" class="layui-layer-btn" style="border-top: 1px solid #ccc;">
                            <asp:LinkButton ID="LinkButton111" runat="server" class="layui-layer-btn notTab" OnClick="BT_New_Click" Text="<%$ Resources:lang,BaoCun%>"></asp:LinkButton><a class="layui-layer-btn notTab" onclick="return popClose();"><asp:Label ID="Label2222" runat="server" Text="<%$ Resources:lang,GuanBi%>" /></a>
                        </div>
                        <span class="layui-layer-setwin"><a onclick="return popClose();" class="layui-layer-ico layui-layer-close layui-layer-close1 notTab" href="javascript:;"></a></span>
                    </div>

                    <div class="layui-layer-shade" id="popwindow_shade" style="z-index: 9998; background-color: #000; opacity: 0.3; filter: alpha(opacity=30); display: none;"></div>

                </ContentTemplate>
            </asp:UpdatePanel>
            <div class="auto-style1">
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
