<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTExpenseApplyQueryCenter.aspx.cs" Inherits="TTExpenseApplyQueryCenter" %>

<%@ Register Assembly="NickLee.Web.UI" Namespace="NickLee.Web.UI" TagPrefix="NickLee" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link id="mainCss" href="css/bluelightmain.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        /*#AboveDiv {
            min-width: 1000px;
            width: expression (document.body.clientWidth <= 1000? "1000px" : "auto" ));
        }*/
    </style>
    <script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="js/allAHandler.js"></script>
    <script type="text/javascript" src="js/layer/layer/layer.js"></script>
    <script type="text/javascript" src="js/popwindow.js"></script>
    <script type="text/javascript" language="javascript">
        $(function () {
            if (top.location != self.location) { } else { CloseWebPage(); }



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
                                                            <%--<img src="Logo/main_top_l.jpg" alt="" width="29" height="31" />--%></td>
                                                        <td align="center" background="ImagesSkin/main_top_bj.jpg" class="titlezi">
                                                            <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,FeiYongShenQingChaXun%>"></asp:Label>
                                                        </td>
                                                        <td width="5">
                                                            <%-- <img src="ImagesSkin/main_top_r.jpg" width="5" height="31" />--%></td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2" class="formItemBgStyle" style="padding: 5px 5px 5px 5px;">
                                    <table width="100%" cellpadding="0" cellspacing="0">

                                        <tr>
                                            <td align="right" style="padding: 5px 5px 0px 5px;">
                                                <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
                                                    <tr>
                                                        <td align="center" style="padding-top: 4px;">
                                                            <table>
                                                                <tr>
                                                                    <td>
                                                                        <asp:Label ID="Label66" runat="server" Text="<%$ Resources:lang,BianHao%>"></asp:Label></td>
                                                                    <td>
                                                                        <asp:TextBox ID="TB_AOCode" Width="50px" runat="server"></asp:TextBox>
                                                                    </td>
                                                                    <td>
                                                                        <asp:Button ID="Button1" runat="server" CssClass="inpu" OnClick="BT_FindAOCode_Click" Text="<%$ Resources:lang,ChaXun%>" />
                                                                    </td>
                                                                    <td>
                                                                        <asp:Label ID="Label32421" runat="server" Text="<%$ Resources:lang,feiyongMingCheng%>"></asp:Label>
                                                                    </td>
                                                                    <td>
                                                                        <asp:TextBox ID="TB_ExpenseName" runat="server"></asp:TextBox>
                                                                    </td>
                                                                    <td>
                                                                        <asp:Label ID="Label62" runat="server" Text="<%$ Resources:lang,ShenQingRen%>"></asp:Label>
                                                                    </td>
                                                                    <td>
                                                                        <asp:TextBox ID="TB_ApplicantName" Width="80px" runat="server"></asp:TextBox>
                                                                    </td>

                                                                    <td>
                                                                        <asp:Label ID="Label32" runat="server" Text="<%$ Resources:lang,XiangMu%>"></asp:Label>
                                                                    </td>
                                                                    <td>
                                                                        <asp:TextBox ID="TB_ProjectName" runat="server"></asp:TextBox>
                                                                    </td>

                                                                    <td>
                                                                        <asp:Label ID="Label63" runat="server" Text="<%$ Resources:lang,Cong%>"></asp:Label>
                                                                    </td>
                                                                    <td style="width: 120px;" align="left">
                                                                        <asp:TextBox ID="DLC_StartTime" ReadOnly="false" runat="server" Width="90px"></asp:TextBox>
                                                                        <ajaxToolkit:CalendarExtender Format="yyyy-MM-dd" ID="CalendarExtender1" runat="server" TargetControlID="DLC_StartTime">
                                                                        </ajaxToolkit:CalendarExtender>
                                                                    </td>
                                                                    <td>
                                                                        <asp:Label ID="Label64" runat="server" Text="<%$ Resources:lang,Dao%>"></asp:Label>
                                                                    </td>
                                                                    <td style="width: 120px;" align="left">
                                                                        <asp:TextBox ID="DLC_EndTime" ReadOnly="false" runat="server" Width="90px"></asp:TextBox>
                                                                        <ajaxToolkit:CalendarExtender Format="yyyy-MM-dd" ID="CalendarExtender4" runat="server" TargetControlID="DLC_EndTime">
                                                                        </ajaxToolkit:CalendarExtender>
                                                                    </td>
                                                                    <td>
                                                                        <asp:Label ID="Label33" runat="server" Text="<%$ Resources:lang,ZhuangTai%>"></asp:Label>
                                                                    </td>
                                                                    <td>
                                                                        <asp:DropDownList ID="DL_Status" runat="server">
                                                                            <asp:ListItem Value="" Text="<%$ Resources:lang,SuoYou%>"></asp:ListItem>
                                                                            <asp:ListItem Value="已记账" Text="<%$ Resources:lang,YiJiZhang%>" />
                                                                            <asp:ListItem Value="新建" Text="<%$ Resources:lang,XinJian%>" />
                                                                            <asp:ListItem Value="处理中" Text="<%$ Resources:lang,ShenPiZhong%>" />
                                                                        </asp:DropDownList>

                                                                    </td>
                                                                    <td>
                                                                        <asp:Button ID="BT_Find" runat="server" CssClass="inpu" OnClick="BT_Find_Click"
                                                                            Text="<%$ Resources:lang,ChaXun%>" />
                                                                    </td>

                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td valign="top" align="center">
                                                            <table width="100%">
                                                                <tr>
                                                                    <td align="center">
                                                                        <asp:Label ID="Label36" runat="server" Text="<%$ Resources:lang,BaoXiaoFeiYongZongE%>"></asp:Label>:&nbsp;
                                                                        <asp:Label ID="LB_Amount" runat="server"></asp:Label>
                                                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                                                                </tr>
                                                                <tr>
                                                                    <td>
                                                                        <table width="100%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                                                            <tr>
                                                                                <td width="7">
                                                                                    <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" />
                                                                                </td>
                                                                                <td>
                                                                                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                                        <tr>
                                                                                            <td align="center" width="5%"><strong>
                                                                                                <asp:Label ID="LB_tdTaskID" runat="server" Text="<%$ Resources:lang,ID%>"></asp:Label>
                                                                                            </strong></td>
                                                                                            <td align="center" width="8%"><strong>
                                                                                                <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,XiangGuanLeiXing %>"></asp:Label>
                                                                                            </strong>&nbsp; </td>
                                                                                            <td align="center" width="8%"><strong>
                                                                                                <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,XiangGuanID %>"></asp:Label>
                                                                                            </strong>&nbsp; </td>
                                                                                            <td align="center" width="13%"><strong>
                                                                                                <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,MingCheng %>"></asp:Label>
                                                                                            </strong>&nbsp; </td>
                                                                                            <td align="center" width="8%"><strong>
                                                                                                <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,JinE %>"></asp:Label>
                                                                                            </strong>&nbsp; </td>
                                                                                            <td align="center" width="8%"><strong>
                                                                                                <asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,BiBie %>"></asp:Label>
                                                                                            </strong>&nbsp; </td>
                                                                                            <td align="center" width="8%"><strong>
                                                                                                <asp:Label ID="Label8" runat="server" Text="<%$ Resources:lang,KeMu %>"></asp:Label>
                                                                                            </strong></td>
                                                                                            <td align="center" width="18%"><strong>
                                                                                                <asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,YongTu %>"></asp:Label>
                                                                                            </strong>&nbsp; </td>
                                                                                            <td align="center" width="10%"><strong>
                                                                                                <asp:Label ID="Label9" runat="server" Text="<%$ Resources:lang,HuanKuanShiJian %>"></asp:Label>
                                                                                            </strong>&nbsp; </td>
                                                                                            <td align="center" width="8%"><strong>
                                                                                                <asp:Label ID="Label10" runat="server" Text="<%$ Resources:lang,ZhuangTai %>"></asp:Label>
                                                                                            </strong>&nbsp; </td>
                                                                                            <td align="center"><strong></strong></td>
                                                                                        </tr>
                                                                                    </table>
                                                                                </td>
                                                                                <td width="6" align="right">
                                                                                    <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" />
                                                                                </td>
                                                                            </tr>
                                                                        </table>
                                                                        <asp:DataGrid ID="DataGrid2" runat="server" AutoGenerateColumns="False"
                                                                            Height="1px" OnItemCommand="DataGrid2_ItemCommand" ShowHeader="False"
                                                                            Width="100%" CellPadding="4"
                                                                            ForeColor="#333333" GridLines="None">
                                                                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                                            <Columns>
                                                                                <asp:BoundColumn DataField="ID" HeaderText="ID">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                                </asp:BoundColumn>
                                                                                <asp:BoundColumn DataField="RelatedType" HeaderText="相关类型">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                                                </asp:BoundColumn>
                                                                                <asp:BoundColumn DataField="RelatedID" HeaderText="相关ID">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                                                </asp:BoundColumn>
                                                                                <asp:BoundColumn DataField="ExpenseName" HeaderText="名称">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="13%" />
                                                                                </asp:BoundColumn>
                                                                                <asp:BoundColumn DataField="Amount" HeaderText="金额">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                                                </asp:BoundColumn>
                                                                                <asp:BoundColumn DataField="CurrencyType" HeaderText="币别">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                                                </asp:BoundColumn>
                                                                                <asp:BoundColumn DataField="Account" HeaderText="科目">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                                                </asp:BoundColumn>
                                                                                <asp:BoundColumn DataField="Purpose" HeaderText="用途">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="18%" />
                                                                                </asp:BoundColumn>
                                                                                <asp:BoundColumn DataField="PayBackTime" HeaderText="还款时间" DataFormatString="{0:yyyy/MM/dd}">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                                </asp:BoundColumn>
                                                                                <asp:TemplateColumn HeaderText="状态">
                                                                                    <ItemTemplate>
                                                                                        <%# ShareClass. GetStatusHomeNameByOtherStatus(Eval("Status").ToString()) %>
                                                                                    </ItemTemplate>
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="8%" />
                                                                                </asp:TemplateColumn>

                                                                                <asp:TemplateColumn HeaderText="明细">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" />
                                                                                    <ItemTemplate>
                                                                                        <asp:Button ID="BT_ID" runat="server" CssClass="inpu" Text="<%$ Resources:lang,MingXi%>" />
                                                                                    </ItemTemplate>
                                                                                </asp:TemplateColumn>
                                                                            </Columns>
                                                                            <EditItemStyle BackColor="#2461BF" />
                                                                            <ItemStyle CssClass="itemStyle" />
                                                                            <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />
                                                                            <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
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
                                </td>
                            </tr>
                        </table>
                    </div>

                    <div class="layui-layer layui-layer-iframe" id="popwindow" name="fixedDivNoConfirm"
                        style="z-index: 9999; width: 800px; height: 530px; position: absolute; overflow: hidden; display: none; border-radius: 10px;">
                        <div class="layui-layer-title" style="background: #e7e7e8;" id="popwindow_title">
                            <asp:Label ID="Label11" runat="server" Text="&lt;div&gt;&lt;img src=ImagesSkin/Update.png border=0 width=30px height=30px alt='BusinessForm' /&gt;&lt;/div&gt;"></asp:Label>
                        </div>
                        <div id="popwindow_content" class="layui-layer-content" style="overflow: auto; padding: 0px 5px 0px 5px;">

                            <table width="100%">
                                <tr>
                                    <td align="left">
                                        <asp:Label ID="Label21" runat="server" Text="<%$ Resources:lang,DuiYingShenPiGongZuoLiu%>"></asp:Label>：
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <table width="98%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                            <tr>
                                                <td width="7">
                                                    <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" />
                                                </td>
                                                <td>
                                                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                        <tr>
                                                            <td width="10%" align="center">
                                                                <strong>
                                                                    <asp:Label ID="Label22" runat="server" Text="<%$ Resources:lang,BianHao%>"></asp:Label></strong>
                                                            </td>
                                                            <td width="50%" align="center">
                                                                <strong>
                                                                    <asp:Label ID="Label23" runat="server" Text="<%$ Resources:lang,GongZuoLiu%>"></asp:Label></strong>
                                                            </td>
                                                            <td width="20%" align="center">
                                                                <strong>
                                                                    <asp:Label ID="Label24" runat="server" Text="<%$ Resources:lang,ShenQingShiJian%>"></asp:Label></strong>
                                                            </td>
                                                            <td width="10%" align="center">
                                                                <strong>
                                                                    <asp:Label ID="Label25" runat="server" Text="<%$ Resources:lang,ZhuangTai%>"></asp:Label></strong>
                                                            </td>
                                                            <td width="10%" align="center">
                                                                <strong></strong>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                                <td width="6" align="right">
                                                    <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" />
                                                </td>
                                            </tr>
                                        </table>
                                        <asp:DataGrid ID="DataGrid1" runat="server" AutoGenerateColumns="False" Height="1px"
                                            ShowHeader="false" PageSize="5" Width="98%" CellPadding="4" ForeColor="#333333"
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
                                                <asp:BoundColumn DataField="WLName" HeaderText="工作流">
                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="50%" />
                                                </asp:BoundColumn>
                                                <asp:BoundColumn DataField="CreateTime" HeaderText="申请时间">
                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="20%" />
                                                </asp:BoundColumn>
                                                <asp:TemplateColumn HeaderText="状态">
                                                    <ItemTemplate>
                                                        <%# ShareClass.GetStatusHomeNameByRequirementStatus(Eval("Status").ToString()) %>
                                                    </ItemTemplate>
                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="10%" />
                                                </asp:TemplateColumn>
                                                <asp:TemplateColumn>
                                                    <ItemTemplate>
                                                        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# DataBinder.Eval(Container, "DataItem.WLID", "TTWLRelatedDoc.aspx?DocType=WorkFlow&WLID={0}") %>'
                                                            Target="_blank"><img src="ImagesSkin/Doc.gif" class="noBorder"/></asp:HyperLink>
                                                    </ItemTemplate>
                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                </asp:TemplateColumn>
                                            </Columns>
                                        </asp:DataGrid>
                                    </td>
                                </tr>
                            </table>

                        </div>

                        <div id="popwindow_footer" class="layui-layer-btn" style="border-top: 1px solid #ccc;">
                            <a class="layui-layer-btn notTab" onclick="return popClose();">
                                <asp:Label ID="Label12" runat="server" Text="<%$ Resources:lang,GuanBi%>" /></a>
                        </div>
                        <span class="layui-layer-setwin"><a onclick="return popClose();" class="layui-layer-ico layui-layer-close layui-layer-close1 notTab" href="javascript:;"></a></span>
                    </div>

                    <div class="layui-layer-shade" id="popwindow_shade" style="z-index: 9998; background-color: #000; opacity: 0.3; filter: alpha(opacity=30); display: none;"></div>

                    <asp:Label ID="LB_Sql" runat="server" Visible="false"></asp:Label>


                    <asp:Label ID="LB_Member" runat="server" Width="100px"></asp:Label>
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
