<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTCompletionDataManage.aspx.cs" Inherits="TTCompletionDataManage" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link id="mainCss" href="css/bluelightmain.css" rel="stylesheet" type="text/css" />
    <script src="js/jquery-1.7.2.min.js" type="text/javascript"></script>
    <script src="js/allAHandler.js" type="text/javascript"></script>
    <script language="javascript" type="text/javascript">
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
                    <table cellpadding="0" cellspacing="0" width="100%" class="bian">
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
                                                        <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,JunGongZiLiao%>"></asp:Label>
                                                    </td>
                                                    <td width="5">
                                                        <%--<img src="ImagesSkin/main_top_r.jpg" width="5" height="31" alt="" />--%></td>
                                                </tr>
                                            </table>
                                        </td>
                                        <td align="left">
                                            <table>
                                                <tr>
                                                     <td>( <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,ZHCXFL%>"></asp:Label>：</td>
                                                    <td>
                                                        <asp:DropDownList ID="DL_DocType" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DL_DocType_SelectedIndexChanged">
                                                            <asp:ListItem Value="图纸" Text="<%$ Resources:lang,TuZhi%>"/>
                                                            <asp:ListItem Value="文件" Text="<%$ Resources:lang,WenJian%>"/>
                                                        </asp:DropDownList></td>
                                                     <td>
                                                         <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,ZiLiaoLeiXing%>"></asp:Label>：</td>
                                                     <td>
                                                         <asp:DropDownList ID="DL_DocGraphType" runat="server">
                                                         </asp:DropDownList>
                                                     </td>
                                                    <td>
                                                        <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,ZiLiaoMingCheng%>"></asp:Label>： </td>
                                                    <td>
                                                        <asp:TextBox ID="TB_DocName" runat="server" Width="120px"></asp:TextBox></td>
                                                   
                                                    <td>
                                                        &nbsp;
                                                        <asp:Button ID="BT_Find" runat="server" CssClass="inpu" OnClick="BT_Find_Click" Text="<%$ Resources:lang,ChaXun%>" />) </td>

                                                </tr>
                                            </table>
                                        </td>
                                        <td></td>
                                    </tr>
                                </table>
                            </td>

                        </tr>
                        <tr>
                            <td>
                                <table cellpadding="0" cellspacing="0" width="100%" style="margin-top: 5px">
                                    <tr>
                                        <td style="width: 100%; height: 1px; text-align: left;">
                                            <asp:Label ID="LB_FindCondition" runat="server" Font-Bold="True" Font-Size="Large"></asp:Label>
                                            <asp:Label ID="LB_Sql" runat="server" Visible="False"></asp:Label>
                                            <asp:Label ID="LB_UserCode" runat="server" Visible="False"></asp:Label>
                                            <asp:Label ID="lbl_ProjectID" runat="server" Visible="False"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="width: 100%; padding: 5px 5px 5px 5px;" align="center">
                                            <asp:Panel ID="Panel_ProReceiptRegistration" runat="server">
                                                <table width="98%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                                    <tr>
                                                        <td>
                                                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                <tr>
                                                                    <td width="8%" align="center"><strong>
                                                                        <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,XuHao%>"></asp:Label></strong></td>
                                                                    <td width="20%" align="center"><strong>
                                                                        <asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,TiMing%>"></asp:Label></strong></td>
                                                                    <td width="10%" align="center"><strong>
                                                                        <asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,ZaiTiLeiXing%>"></asp:Label></strong></td>
                                                                    <td width="10%" align="center"><strong>
                                                                        <asp:Label ID="Label8" runat="server" Text="<%$ Resources:lang,GuiDangDanWei%>"></asp:Label></strong></td>
                                                                    <td width="8%" align="center"><strong>
                                                                        <asp:Label ID="Label9" runat="server" Text="<%$ Resources:lang,XiangMuBianHao%>"></asp:Label></strong></td>
                                                                    <td width="10%" align="center"><strong>
                                                                        <asp:Label ID="Label10" runat="server" Text="<%$ Resources:lang,WenJianBianHao%>"></asp:Label></strong></td>
                                                                    <td width="10%" align="center"><strong>
                                                                        <asp:Label ID="Label11" runat="server" Text="<%$ Resources:lang,SheJiDanWei%>"></asp:Label></strong></td>
                                                                    <td width="15%" align="center"><strong>
                                                                        <asp:Label ID="Label12" runat="server" Text="<%$ Resources:lang,XiangMuMingCheng%>"></asp:Label></strong></td>
                                                          <%--          <td width="12%" align="center"><strong><asp:Label runat="server" Text="<%$ Resources:lang,ShouWenRiQi%>"></asp:Label></strong></td>
                                                                    <td width="10%" align="center"><strong><asp:Label runat="server" Text="<%$ Resources:lang,ShiFouXiaoHui%>"></asp:Label><strong></td>--%>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                </table>
                                                <asp:DataGrid ID="DataGrid1" runat="server" AllowPaging="True" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" 
                                                        GridLines="None" Height="1px"  ShowHeader="False" OnPageIndexChanged="DataGrid1_PageIndexChanged" Width="98%">
                                                    
                                                    <Columns>
                                                        <asp:BoundColumn DataField="ID" HeaderText="序号">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                        </asp:BoundColumn>
                                                        <asp:BoundColumn DataField="FileName" HeaderText="题名">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="20%" />
                                                        </asp:BoundColumn>
                                                        <asp:BoundColumn DataField="DocType" HeaderText="载体类型">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="10%" />
                                                        </asp:BoundColumn>
                                                        <asp:BoundColumn DataField="FileWay" HeaderText="归档单位">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="10%" />
                                                        </asp:BoundColumn>
                                                        <asp:BoundColumn DataField="ProjectID" HeaderText="项目编号">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="8%" />
                                                        </asp:BoundColumn>
                                                        <asp:BoundColumn DataField="DocumentNo" HeaderText="文件编号">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                        </asp:BoundColumn>
                                                        <asp:BoundColumn DataField="DispatchDepartment" HeaderText="设计单位">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="10%" />
                                                        </asp:BoundColumn>
                                                        <asp:TemplateColumn>
                                                            <ItemTemplate>
                                                                <%# GetProjectName(Eval("ProjectID").ToString()) %>
                                                            </ItemTemplate>
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="15%" />
                                                        </asp:TemplateColumn>
                                                        <asp:HyperLinkColumn DataNavigateUrlField="FilePath" Visible="false" DataNavigateUrlFormatString="{0}" DataTextField="FileName" HeaderText="载体类型" Target="_blank">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="10%" />
                                                        </asp:HyperLinkColumn>
                                                        <asp:BoundColumn DataField="Creator" HeaderText="收文人" Visible="false">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                        </asp:BoundColumn>
                                                        <asp:BoundColumn DataField="CreateDate" HeaderText="收文日期" DataFormatString="{0:yyyy-MM-dd}" Visible="false">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="12%"/>
                                                        </asp:BoundColumn>
                                                        <asp:TemplateColumn Visible="false">
                                                            <ItemTemplate>
                                                                <%# GetStatusValue(Eval("DestroyPeople").ToString()) %>
                                                            </ItemTemplate>
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                        </asp:TemplateColumn>
                                                    </Columns>
                                                    <EditItemStyle BackColor="#2461BF" />
                                                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                    <ItemStyle  CssClass="itemStyle"/>
                                                    <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />
                                                    <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                </asp:DataGrid>
                                            </asp:Panel>
                                            <asp:Panel ID="Panel_ProGraphRegistration" runat="server">
                                                <table width="98%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                                    <tr>
                                                        <td>
                                                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                <tr>
                                                                    <td width="8%" align="center"><strong>
                                                                        <asp:Label ID="Label13" runat="server" Text="<%$ Resources:lang,XuHao%>"></asp:Label></strong></td>
                                                                    <td width="20%" align="center"><strong>
                                                                        <asp:Label ID="Label14" runat="server" Text="<%$ Resources:lang,TiMing%>"></asp:Label></strong></td>
                                                                    <td width="12%" align="center"><strong>
                                                                        <asp:Label ID="Label15" runat="server" Text="<%$ Resources:lang,ZaiTiLeiXing%>"></asp:Label></strong></td>
                                                                    <td width="9%" align="center"><strong>
                                                                        <asp:Label ID="Label16" runat="server" Text="<%$ Resources:lang,JianShu%>"></asp:Label></strong></td>
                                                                    <td width="9%" align="center"><strong>
                                                                        <asp:Label ID="Label17" runat="server" Text="<%$ Resources:lang,BiaoJian%>"></asp:Label></strong></td>
                                                                    <td width="9%" align="center"><strong>
                                                                        <asp:Label ID="Label18" runat="server" Text="<%$ Resources:lang,TuJian%>"></asp:Label></strong></td>
                                                                    <td width="8%" align="center"><strong>
                                                                        <asp:Label ID="Label19" runat="server" Text="<%$ Resources:lang,XiangMuBianHao%>"></asp:Label></strong></td>
                                                                    <td width="10%" align="center"><strong>
                                                                        <asp:Label ID="Label20" runat="server" Text="<%$ Resources:lang,WenJianBianHao%>"></asp:Label></strong></td>
                                                                    <td width="15%" align="center"><strong>
                                                                        <asp:Label ID="Label21" runat="server" Text="<%$ Resources:lang,XiangMuMingCheng%>"></asp:Label></strong></td>
                                                              <%--      <td width="10%" align="center"><strong><asp:Label runat="server" Text="<%$ Resources:lang,ShangChuanZhe%>"></asp:Label></strong></td>--%>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                </table>
                                                <asp:DataGrid ID="DataGrid3" runat="server" AllowPaging="True" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" 
                                                        GridLines="None" Height="1px"  ShowHeader="False" OnPageIndexChanged="DataGrid3_PageIndexChanged" Width="98%">
                                                    
                                                    <Columns>
                                                        <asp:BoundColumn DataField="ID" HeaderText="序号">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                        </asp:BoundColumn>
                                                        <asp:BoundColumn DataField="FileName" HeaderText="题名">
                                                            <ItemStyle  CssClass="itemBorder" HorizontalAlign="Left" Width="20%" />
                                                        </asp:BoundColumn>
                                                        <asp:BoundColumn DataField="DocType" HeaderText="载体类型">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="10%" />
                                                        </asp:BoundColumn>
                                                        <asp:HyperLinkColumn DataNavigateUrlField="FilePath" Visible="false" DataNavigateUrlFormatString="{0}" DataTextField="FileName" HeaderText="载体类型" Target="_blank">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="12%" />
                                                        </asp:HyperLinkColumn>
                                                        <asp:BoundColumn DataField="FileNum" HeaderText="份数">
                                                            <ItemStyle  CssClass="itemBorder" HorizontalAlign="Center" Width="9%" />
                                                        </asp:BoundColumn>
                                                        <asp:BoundColumn DataField="TableNum" HeaderText="表/份">
                                                            <ItemStyle  CssClass="itemBorder" HorizontalAlign="Center" Width="9%" />
                                                        </asp:BoundColumn>
                                                        <asp:BoundColumn DataField="FigureNum" HeaderText="图/份">
                                                            <ItemStyle  CssClass="itemBorder" HorizontalAlign="Center" Width="9%" />
                                                        </asp:BoundColumn>
                                                        <asp:BoundColumn DataField="ProjectID" HeaderText="项目编号">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="8%" />
                                                        </asp:BoundColumn>
                                                        <asp:BoundColumn DataField="FileNo" HeaderText="档案号">
                                                            <ItemStyle  CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                        </asp:BoundColumn>
                                                        <asp:TemplateColumn>
                                                            <ItemTemplate>
                                                                <%# GetProjectName(Eval("ProjectID").ToString()) %>
                                                            </ItemTemplate>
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="15%" />
                                                        </asp:TemplateColumn>
                                                        <asp:BoundColumn DataField="FigureDate" HeaderText="收图日期" DataFormatString="{0:yyyy-MM-dd}" Visible="false">
                                                            <ItemStyle  CssClass="itemBorder" HorizontalAlign="Center" Width="12%"/>
                                                        </asp:BoundColumn>
                                                        <asp:BoundColumn DataField="Creator" HeaderText="上传者" Visible="false">
                                                            <ItemStyle  CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                        </asp:BoundColumn>
                                                    </Columns>
                                                    <EditItemStyle BackColor="#2461BF" />
                                                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                    <ItemStyle  CssClass="itemStyle"/>
                                                    <PagerStyle   HorizontalAlign="Center" />
                                                    <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                </asp:DataGrid>
                                            </asp:Panel>
                                            <asp:Label ID="LB_Count" runat="server"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="width: 100%; height: 1px; text-align: left;">
                                            <asp:Label ID="LB_FindCondition2" runat="server" Font-Bold="True" Font-Size="Large"></asp:Label>
                                            <asp:Label ID="LB_Sql1" runat="server" Visible="False"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="width: 100%; padding: 5px 5px 5px 5px;" align="center">
                                            <asp:Panel ID="Panel_ProIssueRegistration" runat="server">
                                                <table width="98%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                                    <tr>
                                                        <td>
                                                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                <tr>
                                                                    <td width="8%" align="center"><strong>
                                                                        <asp:Label ID="Label22" runat="server" Text="<%$ Resources:lang,JuanXuHao%>"></asp:Label></strong></td>
                                                                    <td width="8%" align="center"><strong>
                                                                        <asp:Label ID="Label23" runat="server" Text="<%$ Resources:lang,LinShiXuHao%>"></asp:Label></strong></td>
                                                                    <td width="20%" align="center"><strong>
                                                                        <asp:Label ID="Label24" runat="server" Text="<%$ Resources:lang,TiMing%>"></asp:Label></strong></td>
                                                                    <td width="12%" align="center"><strong>
                                                                        <asp:Label ID="Label25" runat="server" Text="<%$ Resources:lang,WenJianRiQi%>"></asp:Label></strong></td>
                                                                    <td width="10%" align="center"><strong>
                                                                        <asp:Label ID="Label26" runat="server" Text="<%$ Resources:lang,ZaiTiLeiXing%>"></asp:Label></strong></td>
                                                                    <td width="10%" align="center"><strong>
                                                                        <asp:Label ID="Label27" runat="server" Text="<%$ Resources:lang,GuiDangDanWei%>"></asp:Label></strong></td>
                                                                    <td width="8%" align="center"><strong>
                                                                        <asp:Label ID="Label28" runat="server" Text="<%$ Resources:lang,YeShu%>"></asp:Label></strong></td>
                                                                    <td width="10%" align="center"><strong>
                                                                        <asp:Label ID="Label29" runat="server" Text="<%$ Resources:lang,WenJianBianHao%>"></asp:Label></strong></td>
                                                               <%--     <td width="10%" align="center"><strong><asp:Label runat="server" Text="<%$ Resources:lang,QianShouRen%>"></asp:Label></strong></td>
                                                                    <td width="12%" align="center"><strong><asp:Label runat="server" Text="<%$ Resources:lang,DianZiBan%>"></asp:Label></strong></td>
                                                                    <td width="10%" align="center"><strong><asp:Label runat="server" Text="<%$ Resources:lang,ShiFouHuiShou%>"></asp:Label><strong></td>--%>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                </table>
                                                <asp:DataGrid ID="DataGrid2" runat="server" AllowPaging="True" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" 
                                                        GridLines="None" Height="1px"  ShowHeader="False" OnPageIndexChanged="DataGrid2_PageIndexChanged" Width="98%">
                                                    
                                                    <Columns>
                                                        <asp:TemplateColumn>
                                                            <ItemTemplate>
                                                                <%# GetProReceiId(Eval("DocumentNo").ToString()) %>
                                                            </ItemTemplate>
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                        </asp:TemplateColumn>
                                                        <asp:BoundColumn DataField="ID" HeaderText="顺序号">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                        </asp:BoundColumn>
                                                        <asp:BoundColumn DataField="FileName" HeaderText="文件名称">
                                                            <ItemStyle  CssClass="itemBorder" HorizontalAlign="Left" Width="20%" />
                                                        </asp:BoundColumn>
                                                        <asp:BoundColumn DataField="IssuingDate" HeaderText="发放日期" DataFormatString="{0:yyyy-MM-dd}">
                                                            <ItemStyle  CssClass="itemBorder" HorizontalAlign="Center" Width="12%"/>
                                                        </asp:BoundColumn>
                                                        <asp:BoundColumn DataField="DocType" HeaderText="载体类型">
                                                            <ItemStyle  CssClass="itemBorder" HorizontalAlign="Left" Width="10%" />
                                                        </asp:BoundColumn>
                                                        <asp:BoundColumn DataField="ReceivingDepartment" HeaderText="领取部门">
                                                            <ItemStyle  CssClass="itemBorder" HorizontalAlign="Left" Width="10%" />
                                                        </asp:BoundColumn>
                                                        <asp:BoundColumn DataField="Attachments" HeaderText="份数">
                                                            <ItemStyle  CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                        </asp:BoundColumn>
                                                        <asp:BoundColumn DataField="DocumentNo" HeaderText="文件编号">
                                                            <ItemStyle  CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                        </asp:BoundColumn>
                                                        <asp:BoundColumn DataField="Recipients" HeaderText="签收人" Visible="false">
                                                            <ItemStyle  CssClass="itemBorder" HorizontalAlign="Left" Width="10%" />
                                                        </asp:BoundColumn>
                                                        <asp:HyperLinkColumn Visible="false" DataNavigateUrlField="FilePath" DataNavigateUrlFormatString="{0}" DataTextField="FileName" HeaderText="电子版" Target="_blank">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="12%" />
                                                        </asp:HyperLinkColumn>
                                                        <asp:TemplateColumn Visible="false">
                                                            <ItemTemplate>
                                                                <%# GetStatusValue(Eval("Recycling").ToString()) %>
                                                            </ItemTemplate>
                                                            <ItemStyle  CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                        </asp:TemplateColumn>
                                                    </Columns>
                                                    <EditItemStyle BackColor="#2461BF" />
                                                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                    <ItemStyle  CssClass="itemStyle"/>
                                                    <PagerStyle   HorizontalAlign="Center" />
                                                    <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                </asp:DataGrid>
                                            </asp:Panel>
                                            <asp:Panel ID="Panel_ProSendFigureRegistration" runat="server">
                                                <table width="98%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                                    <tr>
                                                        <td>
                                                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                <tr>
                                                                    <td width="8%" align="center"><strong>
                                                                        <asp:Label ID="Label30" runat="server" Text="<%$ Resources:lang,JuanXuHao%>"></asp:Label></strong></td>
                                                                    <td width="7%" align="center"><strong>
                                                                        <asp:Label ID="Label31" runat="server" Text="<%$ Resources:lang,LinShiXuHao%>"></asp:Label></strong></td>
                                                                    <td width="18%" align="center"><strong>
                                                                        <asp:Label ID="Label32" runat="server" Text="<%$ Resources:lang,TiMing%>"></asp:Label></strong></td>
                                                                    <td width="12%" align="center"><strong>
                                                                        <asp:Label ID="Label33" runat="server" Text="<%$ Resources:lang,WenJianRiQi%>"></asp:Label></strong></td>
                                                                    <td width="10%" align="center"><strong>
                                                                        <asp:Label ID="Label34" runat="server" Text="<%$ Resources:lang,ZaiTiLeiXing%>"></asp:Label></strong></td>
                                                                    <td width="7%" align="center"><strong>
                                                                        <asp:Label ID="Label35" runat="server" Text="<%$ Resources:lang,JianShu%>"></asp:Label></strong></td>
                                                                    <td width="7%" align="center"><strong>
                                                                        <asp:Label ID="Label36" runat="server" Text="<%$ Resources:lang,BiaoJian%>"></asp:Label></strong></td>
                                                                    <td width="7%" align="center"><strong>
                                                                        <asp:Label ID="Label37" runat="server" Text="<%$ Resources:lang,TuJian%>"></asp:Label></strong></td>
                                                                    <td width="10%" align="center"><strong>
                                                                        <asp:Label ID="Label38" runat="server" Text="<%$ Resources:lang,WenJianBianHao%>"></asp:Label></strong></td>
                                                             <%--       <td width="10%" align="center"><strong><asp:Label runat="server" Text="<%$ Resources:lang,QianShouRen%>"></asp:Label></strong></td>
                                                                    <td width="12%" align="center"><strong><asp:Label runat="server" Text="<%$ Resources:lang,DianZiBan%>"></asp:Label></strong></td>
                                                                    <td width="10%" align="center"><strong><asp:Label runat="server" Text="<%$ Resources:lang,ShiFouHuiShou%>"></asp:Label></strong></td>--%>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                </table>
                                                <asp:DataGrid ID="DataGrid5" runat="server" AllowPaging="True" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" 
                                                        GridLines="None" Height="1px"  ShowHeader="False" OnPageIndexChanged="DataGrid5_PageIndexChanged" Width="98%">
                                                    
                                                    <Columns>
                                                        <asp:TemplateColumn>
                                                            <ItemTemplate>
                                                                <%# GetProGraphId(Eval("FileNo").ToString()) %>
                                                            </ItemTemplate>
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                        </asp:TemplateColumn>
                                                        <asp:BoundColumn DataField="ID" HeaderText="顺序号">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="7%" />
                                                        </asp:BoundColumn>
                                                        <asp:BoundColumn DataField="FileName" HeaderText="名称">
                                                            <ItemStyle  CssClass="itemBorder" HorizontalAlign="Left" Width="18%" />
                                                        </asp:BoundColumn>
                                                        <asp:BoundColumn DataField="IssueDate" HeaderText="发图日期" DataFormatString="{0:yyyy-MM-dd}">
                                                            <ItemStyle  CssClass="itemBorder" HorizontalAlign="Center" Width="12%"/>
                                                        </asp:BoundColumn>
                                                        <asp:BoundColumn DataField="DocType" HeaderText="载体类型">
                                                            <ItemStyle  CssClass="itemBorder" HorizontalAlign="Left" Width="10%" />
                                                        </asp:BoundColumn>
                                                        <asp:BoundColumn DataField="FileNum" HeaderText="份数">
                                                            <ItemStyle  CssClass="itemBorder" HorizontalAlign="Center" Width="7%" />
                                                        </asp:BoundColumn>
                                                        <asp:BoundColumn DataField="TableNum" HeaderText="表/份">
                                                            <ItemStyle  CssClass="itemBorder" HorizontalAlign="Center" Width="7%" />
                                                        </asp:BoundColumn>
                                                        <asp:BoundColumn DataField="FigureNum" HeaderText="图/份">
                                                            <ItemStyle  CssClass="itemBorder" HorizontalAlign="Center" Width="7%" />
                                                        </asp:BoundColumn>
                                                        <asp:BoundColumn DataField="FileNo" HeaderText="档案号">
                                                            <ItemStyle  CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                        </asp:BoundColumn>
                                                        <asp:BoundColumn DataField="Recipients" HeaderText="签收人" Visible="false">
                                                            <ItemStyle  CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                        </asp:BoundColumn>
                                                        <asp:HyperLinkColumn Visible="false" DataNavigateUrlField="FilePath" DataNavigateUrlFormatString="{0}" DataTextField="FileName" HeaderText="电子版" Target="_blank">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="12%" />
                                                        </asp:HyperLinkColumn>
                                                        <asp:TemplateColumn Visible="false">
                                                            <ItemTemplate>
                                                                <%# GetStatusValue(Eval("BackPer").ToString()) %>
                                                            </ItemTemplate>
                                                            <ItemStyle  CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                        </asp:TemplateColumn>
                                                    </Columns>
                                                    <EditItemStyle BackColor="#2461BF" />
                                                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                    <ItemStyle  CssClass="itemStyle"/>
                                                    <PagerStyle   HorizontalAlign="Center" />
                                                    <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                </asp:DataGrid>
                                            </asp:Panel>
                                            <asp:Label ID="LB_TotalCount" runat="server"></asp:Label>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
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
