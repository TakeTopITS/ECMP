<%@ Page Language="C#" AutoEventWireup="true" ValidateRequest="false" CodeFile="TTWFTemplateView.aspx.cs"
    Inherits="TTWFTemplateView" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link id="mainCss" href="css/bluelightmain.css" rel="stylesheet" type="text/css" />

    <script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="js/allAHandler.js"></script>
    <script type="text/javascript" language="javascript">
        $(function () {

            if (top.location != self.location) { } else { CloseWebPage(); }

            parent.window.document.getElementById("nodeDesign").style.width = "60%";
            parent.window.document.getElementById("divImgWaiting").style.display = "none";


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
                    <table cellpadding="0" cellspacing="0" width="100%" class="bian">
                        <tr>
                            <td height="31" class="page_topbj">
                                <table width="96%" border="0" align="center" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td align="left">
                                            <table width="350" border="0" align="left" cellpadding="0" cellspacing="0">
                                                <tr>
                                                    <td width="29">
                                                        <%--<img src="Logo/main_top_l.jpg" alt="" width="29" height="31" />--%>
                                                    </td>
                                                    <td align="center" background="ImagesSkin/main_top_bj.jpg" class="titlezi">
                                                        <asp:Label ID="LB_WorkFlow" runat="server" Font-Size="10pt"></asp:Label>
                                                        &nbsp;
                                                        <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,BuZhouLieBiao%>"></asp:Label>
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
                            <td class="tdBottom">
                                <table style="width: 100%">
                                    <tr>
                                        <td>
                                            <table style="width: 100%">
                                                <tr>
                                                    <td colspan="2" style="text-align: left">
                                                        <asp:Label ID="LB_ProjectID" runat="server" Visible="False"></asp:Label>
                                                        <asp:Label ID="LB_UserCode" runat="server" Visible="False"></asp:Label>
                                                        <asp:Label ID="LB_UserName" runat="server"
                                                            Visible="False"></asp:Label>
                                                        <asp:Label ID="LB_MakeUserCode" runat="server"
                                                            Visible="False"></asp:Label>
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
                                                                                <strong>&nbsp;</strong>
                                                                            </td>
                                                                            <td width="5%" align="center">
                                                                                <strong>&nbsp;</strong>
                                                                            </td>
                                                                            <td width="4%" align="center">
                                                                                <strong>
                                                                                    <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,BuXu%>"></asp:Label>
                                                                                </strong>
                                                                            </td>
                                                                            <td width="10%" align="center">
                                                                                <strong>
                                                                                    <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,MingChen%>"></asp:Label>
                                                                                </strong>
                                                                            </td>
                                                                            <td width="5%" align="center">
                                                                                <strong>
                                                                                    <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,ZuiShaoRenShu%>"></asp:Label>
                                                                                </strong>
                                                                            </td>
                                                                            <td width="7%" align="center">
                                                                                <strong>
                                                                                    <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,ShiJianXiaoShi%>"></asp:Label>
                                                                                </strong>
                                                                            </td>
                                                                            <td width="5%" align="center">
                                                                                <strong>
                                                                                    <asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,TiaoJian%>"></asp:Label>
                                                                                </strong>
                                                                            </td>
                                                                            <td width="5%" align="center">
                                                                                <strong>
                                                                                    <asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,ShiFouZiShen%>"></asp:Label>
                                                                                </strong>
                                                                            </td>
                                                                            <td width="5%" align="center">
                                                                                <strong>
                                                                                    <asp:Label ID="Label8" runat="server" Text="<%$ Resources:lang,BuMenXiangGuan%>"></asp:Label>
                                                                                </strong>
                                                                            </td>
                                                                            <td width="5%" align="center">
                                                                                <strong>
                                                                                    <asp:Label ID="Label9" runat="server" Text="<%$ Resources:lang,YongXuJianZhiShenPi%>"></asp:Label>
                                                                                </strong>
                                                                            </td>
                                                                            <td width="5%" align="center">
                                                                                <strong>
                                                                                    <asp:Label ID="Label10" runat="server" Text="<%$ Resources:lang,XianMuXiangGuan%>"></asp:Label>
                                                                                </strong>
                                                                            </td>
                                                                            <td width="5%" align="center">
                                                                                <strong>
                                                                                    <asp:Label ID="Label11" runat="server" Text="<%$ Resources:lang,ZiXuanShenPiRen%>"></asp:Label></strong>
                                                                            </td>
                                                                            <td width="7%" align="center">
                                                                                <strong>
                                                                                    <asp:Label ID="Label13" runat="server" Text="<%$ Resources:lang,ShenQingRenZiDongShenPi%>"></asp:Label>
                                                                                </strong>
                                                                            </td>
                                                                            <td width="7%" align="center">
                                                                                <strong>
                                                                                    <asp:Label ID="Label23" runat="server" Text="<%$ Resources:lang,YishenpiZheZiDongShenPi%>"></asp:Label>
                                                                                </strong>
                                                                            </td>
                                                                            <td width="7%" align="center">
                                                                                <strong>
                                                                                    <asp:Label ID="Label12" runat="server" Text="<%$ Resources:lang,XiaYiBuBiXu%>"></asp:Label>
                                                                                </strong>
                                                                            </td>
                                                                            <td width="5%" align="center">
                                                                                <strong>
                                                                                    <asp:Label ID="Label14" runat="server" Text="<%$ Resources:lang,xiaYiBu%>"></asp:Label>
                                                                                </strong>
                                                                            </td>
                                                                            <td align="center">
                                                                                <strong>
                                                                                    <asp:Label ID="Label73" runat="server" Text="<%$ Resources:lang,ZhanZhengTiJingDuYuGu %>"></asp:Label>
                                                                                </strong>
                                                                            </td>

                                                                        </tr>
                                                                    </table>
                                                                </td>
                                                                <td width="6" align="right">
                                                                    <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" />
                                                                </td>
                                                            </tr>
                                                        </table>
                                                        <asp:DataGrid ID="DataGrid2" runat="server" AutoGenerateColumns="False" Height="1px"
                                                            ShowHeader="false" OnItemCommand="DataGrid2_ItemCommand" OnPageIndexChanged="DataGrid2_PageIndexChanged"
                                                            PageSize="5" Width="100%" CellPadding="4" ForeColor="#333333" GridLines="None">
                                                            <Columns>
                                                                <asp:TemplateColumn>
                                                                    <ItemTemplate>
                                                                        <asp:Button ID="BT_StepID" runat="server" CommandName="Update" CssClass="inpu" Width="50px" Text='<%# DataBinder.Eval(Container.DataItem,"StepID") %>' />
                                                                    </ItemTemplate>
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                </asp:TemplateColumn>
                                                                <asp:TemplateColumn HeaderText="Delete">
                                                                    <ItemTemplate>
                                                                        <asp:LinkButton ID="LBT_Delete" CommandName="Delete" runat="server" OnClientClick="return confirm(getDeleteMsgByLangCode())" Text="&lt;div&gt;&lt;img src=ImagesSkin/Delete.png border=0 alt='删除' /&gt;&lt;/div&gt;"></asp:LinkButton>
                                                                    </ItemTemplate>
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="4%" />
                                                                </asp:TemplateColumn>
                                                                <asp:BoundColumn DataField="SortNumber" HeaderText="步序">
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="4%" />
                                                                </asp:BoundColumn>
                                                                <asp:BoundColumn DataField="StepName" HeaderText="名称">
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="10%" />
                                                                </asp:BoundColumn>
                                                                <asp:BoundColumn DataField="limitedOperator" HeaderText="最少人数">
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                </asp:BoundColumn>
                                                                <asp:BoundColumn DataField="LimitedTime" HeaderText="时间(小时)">
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="7%" />
                                                                </asp:BoundColumn>
                                                                <asp:HyperLinkColumn DataNavigateUrlField="StepID" DataNavigateUrlFormatString="TTWLTStepCondition.aspx?StepID={0}"
                                                                    Target="_blank" Text="条件">
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                </asp:HyperLinkColumn>
                                                                <asp:BoundColumn DataField="SelfReview" HeaderText="自审">
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                </asp:BoundColumn>
                                                                <asp:BoundColumn DataField="DepartRelated" HeaderText="部门相关">
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                </asp:BoundColumn>
                                                                <asp:BoundColumn DataField="PartTimeReview" HeaderText="允许兼职审批">
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                </asp:BoundColumn>
                                                                <asp:BoundColumn DataField="ProjectRelated" HeaderText="项目相关">
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                </asp:BoundColumn>
                                                                <asp:BoundColumn DataField="OperatorSelect" HeaderText="自选审批者">
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                </asp:BoundColumn>
                                                                <asp:BoundColumn DataField="AllowSelfPass" HeaderText="申请人自批">
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="7%" />
                                                                </asp:BoundColumn>
                                                                <asp:BoundColumn DataField="AllowPriorOperatorPass" HeaderText="已批者自批">
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="7%" />
                                                                </asp:BoundColumn>
                                                                <asp:BoundColumn DataField="NextStepMust" HeaderText="为下一步必须通过">
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="7%" />
                                                                </asp:BoundColumn>
                                                                <asp:BoundColumn DataField="NextSortNumber" HeaderText="下一步">
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                </asp:BoundColumn>
                                                                <asp:TemplateColumn>
                                                                    <ItemTemplate>
                                                                        <%# DataBinder.Eval(Container.DataItem,"FinishPercent") %> %
                                                                    </ItemTemplate>
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" />
                                                                </asp:TemplateColumn>
                                                            </Columns>
                                                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                            <EditItemStyle BackColor="#2461BF" />
                                                            <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                            <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />
                                                            <ItemStyle CssClass="itemStyle" />
                                                        </asp:DataGrid>
                                                        <asp:Label ID="LB_SqlWL" runat="server" Visible="False"></asp:Label>
                                                        <asp:Label ID="LB_RelatedUserCode" runat="server" Visible="False"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td colspan="2" style="height: 20px; text-align: left">&nbsp;
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td colspan="2" align="left" class="tdBottom">&nbsp;
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td colspan="2" style="height: 20px; text-align: left">&nbsp;
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                       
                        <tr>
                            <td align="left" class="tdBottom">
                            <asp:Button ID="BT_SaveWFDefinition" runat="server" CssClass="inpuLong" OnClick="BT_SaveWFDefinition_Click"
                                Text="<%$ Resources:lang,BaoChunMoBanDingYi%>" Enabled="False" />
                            </td>
                        </tr>
                        <tr>
                            <td align="left" class="tdBottom">
                                <asp:TextBox ID="TB_WFXML" runat="server" Style="visibility: hidden"></asp:TextBox>
                                <asp:TextBox ID="TB_WFChartString" runat="server" Style="visibility: hidden"></asp:TextBox>
                            </td>
                        </tr>
                        <tr style="display: none;">
                            <td class="tdBottom" align="left" style="padding-left: 20px;">
                                <table width="90%">
                                    <tr>
                                        <td align="left" colspan="4" style="height: 17px;">
                                            <strong>
                                                <asp:Label ID="Label28" runat="server" Text="<%$ Resources:lang,JieDianYuYiBianLiangTuiYing%>"></asp:Label>

                                                :<asp:Label ID="Label29" runat="server" Text="<%$ Resources:lang,YCZRDDMMCBMDMBMMCTHBDDEXYXX%>"></asp:Label>
                                                (<asp:HyperLink ID="HL_XMLFile" runat="server" Target="_blank">---&gt;<asp:Label ID="Label27" runat="server" Text="<%$ Resources:lang,ChaKanShuJuWenJian%>"></asp:Label></asp:HyperLink>)
                                            </strong>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="4" style="text-align: right">
                                            <table background="ImagesSkin/main_n_bj.jpg" border="0" cellpadding="0" cellspacing="0" width="100%">
                                                <tr>
                                                    <td width="7">
                                                        <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" />
                                                    </td>
                                                    <td>
                                                        <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                            <tr>
                                                                <td align="center" width="10%"><strong>&nbsp;</strong> </td>
                                                                <td align="center" width="45%"><strong>
                                                                    <asp:Label ID="Label24" runat="server" Text="XMLNode"></asp:Label>
                                                                </strong></td>
                                                                <td align="center" width="45%"><strong>
                                                                    <asp:Label ID="Label26" runat="server" Text="Field"></asp:Label>

                                                                </strong></td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                    <td align="right" width="6">
                                                        <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" />
                                                    </td>
                                                </tr>
                                            </table>
                                            <asp:DataGrid ID="DataGrid3" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" Height="1px" OnItemCommand="DataGrid3_ItemCommand" ShowHeader="false" Width="100%">
                                                <Columns>
                                                    <asp:TemplateColumn>
                                                        <ItemTemplate>
                                                            <asp:Button ID="BT_ID" runat="server" CssClass="inpu" Text='<%# DataBinder.Eval(Container.DataItem,"ID") %>' />
                                                        </ItemTemplate>
                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                    </asp:TemplateColumn>
                                                    <asp:BoundColumn DataField="XMLNode" HeaderText="表达式">
                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="45%" />
                                                    </asp:BoundColumn>
                                                    <asp:BoundColumn DataField="GlobalVariable" HeaderText="变量">
                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="45%" />
                                                    </asp:BoundColumn>
                                                </Columns>
                                                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                <EditItemStyle BackColor="#2461BF" />
                                                <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                <PagerStyle CssClass="notTab" HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" />
                                                <ItemStyle CssClass="itemStyle" />
                                            </asp:DataGrid>
                                        </td>
                                    </tr>
                                </table>
                                <br />
                                <table cellpadding="3" cellspacing="0" class="formBgStyle" width="70%">
                                    <tr>
                                        <td class="formItemBgStyle" style="width: 10%; height: 24px; text-align: right">
                                            <asp:Label ID="Label25" runat="server" Text="<%$ Resources:lang,BianHao%>"></asp:Label>
                                            ： </td>
                                        <td class="formItemBgStyle" style="height: 24px;">
                                            <asp:Label ID="LB_XMLNodeID" runat="server"></asp:Label>
                                        </td>
                                        <td class="formItemBgStyle" style="font-size: 10pt; width: 20%; height: 24px; text-align: right">XMLNode： </td>
                                        <td class="formItemBgStyle" style="width: 35%; height: 24px; text-align: left;">
                                            <asp:TextBox ID="TB_XMLNode" runat="server" Width="500px"></asp:TextBox>
                                        </td>
                                        <td class="formItemBgStyle" style="font-size: 10pt; width: 20%; height: 24px; text-align: right">

                                            <asp:Label ID="Label22" runat="server" Text="Field"></asp:Label>:


                                        </td>
                                        <td class="formItemBgStyle" style="width: 35%; height: 24px; text-align: left;">
                                            <asp:DropDownList ID="DL_GlobalVariable" runat="server">
                                                <asp:ListItem Value="[TAKETOPUSERCODE]">[TAKETOPUSERCODE]</asp:ListItem>
                                                <asp:ListItem Value="[TAKETOPUSERNAME]">[TAKETOPUSERNAME]</asp:ListItem>
                                                <asp:ListItem Value="[TAKETOPUSERDEPARTCODE]">[TAKETOPDEPARTCODE]</asp:ListItem>
                                                <asp:ListItem Value="[TAKETOPDEPARTNAME]">[TAKETOPDEPARTNAME]</asp:ListItem>
                                                <asp:ListItem Value="[TAKETOPRELATEDTYPE]">[TAKETOPRELATEDTYPE]</asp:ListItem>
                                                <asp:ListItem Value="[TAKETOPRELATEDID]">[TAKETOPRELATEDID]</asp:ListItem>
                                                <asp:ListItem Value="[TAKETOPRELATEDCODE]">[TAKETOPRELATEDCODE]</asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="formItemBgStyle" style="width: 10%; height: 24px; text-align: right">&nbsp; </td>
                                        <td class="formItemBgStyle" colspan="5" style="height: 24px;">
                                            <asp:Button ID="BT_Add" runat="server" CssClass="inpu" Text="<%$ Resources:lang,XinZeng%>" OnClick="BT_Add_Click" />
                                            &nbsp;
                                    <asp:Button ID="BT_Update" runat="server" CssClass="inpu" Enabled="False" Text="<%$ Resources:lang,BaoCun%>" OnClick="BT_Update_Click" />
                                            &nbsp;
                                    <asp:Button ID="BT_Delete" runat="server" CssClass="inpu" Enabled="False" Text="<%$ Resources:lang,ShanChu%>" OnClick="BT_Delete_Click" OnClientClick="return confirm(getDeleteMsgByLangCode())" />
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>

                    <div class="layui-layer layui-layer-iframe" id="popwindow" name="fixedDiv"
                        style="z-index: 9999; width: 800px; height: 400px; position: absolute; overflow: hidden; display: none; border-radius: 10px;">
                        <div class="layui-layer-title" style="background: #e7e7e8;" id="popwindow_title">
                            <asp:Label ID="Label30" runat="server" Text="&lt;div&gt;&lt;img src=ImagesSkin/Update.png border=0 width=30px height=30px alt='BusinessForm' /&gt;&lt;/div&gt;"></asp:Label>
                        </div>
                        <div id="popwindow_content" class="layui-layer-content" style="text-align: left; overflow: auto; padding: 0px 5px 0px 5px;">

                            <table width="100%">
                                <tr>
                                    <td style="text-align: left">
                                        <asp:Label ID="Label15" runat="server" Text="<%$ Resources:lang,BuXu%>"></asp:Label>
                                        <asp:Label ID="LB_SortNumber" runat="server"></asp:Label>&nbsp;
                                                    <asp:Label ID="LB_StepName" runat="server"></asp:Label>
                                        <asp:Label ID="LB_StepID" runat="server" Visible="False"></asp:Label><asp:Label ID="Label16" runat="server" Text="<%$ Resources:lang,MingXi%>"></asp:Label>：
                                    </td>
                                    <td style="width: 200px; text-align: left">
                                        <asp:Label ID="LB_ID" runat="server" Visible="False"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2" style="text-align: center;">
                                        <table width="98%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                            <tr>
                                                <td width="7">
                                                    <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" />
                                                </td>
                                                <td>
                                                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                        <tr>
                                                            <td width="25%" align="center">
                                                                <strong>
                                                                    <asp:Label ID="Label17" runat="server" Text="<%$ Resources:lang,CanYuJueSeZhu%>"></asp:Label>
                                                                </strong>
                                                            </td>
                                                            <td width="25%" align="center">
                                                                <strong>
                                                                    <asp:Label ID="Label18" runat="server" Text="<%$ Resources:lang,GongZuo%>"></asp:Label>
                                                                </strong>
                                                            </td>
                                                            <td width="20%" align="center">
                                                                <strong>
                                                                    <asp:Label ID="Label19" runat="server" Text="<%$ Resources:lang,ChenDanJueSe%>"></asp:Label></strong>
                                                            </td>
                                                            <td width="15%" align="center">
                                                                <strong>
                                                                    <asp:Label ID="Label20" runat="server" Text="<%$ Resources:lang,ShiFouBiXu%>"></asp:Label>
                                                                </strong>
                                                            </td>
                                                            <td width="15%" align="center">
                                                                <strong>
                                                                    <asp:Label ID="Label21" runat="server" Text="<%$ Resources:lang,ShiJianXiaoshi%>"></asp:Label>
                                                                </strong>
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
                                            ShowHeader="false" Width="98%" CellPadding="4" ForeColor="#333333" GridLines="None">
                                            <Columns>
                                                <asp:HyperLinkColumn DataNavigateUrlField="IdentifyString" DataNavigateUrlFormatString="TTActorGroupMemberView.aspx?IdentifyString={0}"
                                                    DataTextField="ActorGroup" HeaderText="参与角色组" Target="_blank">
                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="25%" />
                                                </asp:HyperLinkColumn>
                                                <asp:BoundColumn DataField="WorkDetail" HeaderText="工作">
                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="25%" />
                                                </asp:BoundColumn>
                                                <asp:BoundColumn DataField="Actor" HeaderText="承担角色">
                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="20%" />
                                                </asp:BoundColumn>
                                                <asp:BoundColumn DataField="Requisite" HeaderText="是否必需">
                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="15%" />
                                                </asp:BoundColumn>
                                                <asp:BoundColumn DataField="LimitedTime" HeaderText="时间(小时)">
                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="15%" />
                                                </asp:BoundColumn>
                                            </Columns>
                                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                            <EditItemStyle BackColor="#2461BF" />
                                            <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                            <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />

                                            <ItemStyle CssClass="itemStyle" />
                                        </asp:DataGrid>
                                        <asp:Label ID="LB_DetailID" runat="server" Visible="False"></asp:Label>
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <div id="popwindow_footer" class="layui-layer-btn" style="border-top: 1px solid #ccc;">
                            <a class="layui-layer-btn notTab" onclick="return popClose();">
                                <asp:Label ID="Label31" runat="server" Text="<%$ Resources:lang,GuanBi%>" /></a>
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
<script type="text/javascript" language="javascript">var cssDirectory = '<%=Session["CssDirectory"] %>'; var oLink = document.getElementById('mainCss'); oLink.href = 'css/' + cssDirectory + '/' + 'bluelightmain.css';</script></html>
