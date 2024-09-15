<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTUserInfor_StudentCo.aspx.cs" Inherits="TTUserInfor_StudentCo" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>学生收费</title>
    <link id="mainCss" href="css/bluelightmain.css" rel="stylesheet" type="text/css" />
    <script src="js/My97DatePicker/WdatePicker.js"></script>
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
                                                            <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,XueShengShouFei%>"></asp:Label>
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
                                                    <tr style="font-size: 12pt">
                                                        <td class="formItemBgStyle" width="100%">
                                                            <table style="width: 100%;" cellpadding="2" cellspacing="0" class="formBgStyle">
                                                                <tr style="font-size: 12pt">
                                                                    <td align="left" style="width: 20%; padding: 5px 5px 5px 5px; font-size: 12px;" class="formItemBgStyle" valign="top">

                                                                        <table class="formBgStyle" width="100%">
                                                                            <tr>
                                                                                <td style="text-align: left" class="formItemBgStyle">
                                                                                    <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,XueshengMingChen%>"></asp:Label></td>
                                                                                <td style="text-align: left" class="formItemBgStyle">
                                                                                    <asp:Label ID="LB_StudentCode" runat="server"></asp:Label>
                                                                                    &nbsp;<asp:Label ID="LB_StudentName" runat="server"></asp:Label>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td class="formItemBgStyle" style="text-align: left">
                                                                                    <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,XuHao%>"></asp:Label></td>
                                                                                <td class="formItemBgStyle" style="text-align: left">
                                                                                    <asp:TextBox ID="TXT_ID" runat="server" Enabled="false"></asp:TextBox>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td style="text-align: left" class="formItemBgStyle">
                                                                                    <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,ShouFeiRiQi%>"></asp:Label></td>
                                                                                <td style="text-align: left" class="formItemBgStyle">
                                                                                    <asp:TextBox ID="TXT_CollectTime" runat="server" onClick="WdatePicker({dateFmt:'yyyy-MM-dd'})"></asp:TextBox>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td style="text-align: left" class="formItemBgStyle">
                                                                                    <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,ShouFeiMingChen%>"></asp:Label></td>
                                                                                <td style="text-align: left" class="formItemBgStyle">
                                                                                    <asp:TextBox ID="TXT_CostProject" runat="server"></asp:TextBox>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td style="text-align: left" class="formItemBgStyle">
                                                                                    <asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,ShouFeiJingE%>"></asp:Label></td>
                                                                                <td style="text-align: left" class="formItemBgStyle">
                                                                                    <asp:TextBox ID="TXT_CostDemial" runat="server"></asp:TextBox>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td style="text-align: left" class="formItemBgStyle">
                                                                                    <asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,MeiXueQiBaoJiaoFei%>"></asp:Label></td>
                                                                                <td style="text-align: left" class="formItemBgStyle">
                                                                                    <asp:TextBox ID="TXT_WangFeePerSemester" runat="server"></asp:TextBox>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td style="text-align: left" class="formItemBgStyle">
                                                                                    <asp:Label ID="Label8" runat="server" Text="<%$ Resources:lang,SanSiFei%>"></asp:Label></td>
                                                                                <td style="text-align: left" class="formItemBgStyle">
                                                                                    <asp:TextBox ID="TXT_Meals" runat="server"></asp:TextBox>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td style="text-align: left" class="formItemBgStyle">
                                                                                    <asp:Label ID="Label9" runat="server" Text="<%$ Resources:lang,KeHoutuoGuanFeiyong%>"></asp:Label></td>
                                                                                <td style="text-align: left" class="formItemBgStyle">
                                                                                    <asp:TextBox ID="TXT_CustodyAfterClass" runat="server"></asp:TextBox>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td style="text-align: left" class="formItemBgStyle">
                                                                                    <asp:Label ID="Label10" runat="server" Text="<%$ Resources:lang,KeWaiHuoDongFeiYong%>"></asp:Label></td>
                                                                                <td style="text-align: left" class="formItemBgStyle">
                                                                                    <asp:TextBox ID="TXT_ActivityCost" runat="server"></asp:TextBox>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td style="text-align: left" class="formItemBgStyle">
                                                                                    <asp:Label ID="Label11" runat="server" Text="<%$ Resources:lang,DaiShouDaiZhiShengHuoYongPingFei%>"></asp:Label></td>
                                                                                <td style="text-align: left" class="formItemBgStyle">
                                                                                    <asp:TextBox ID="TXT_ReplaceCosts" runat="server"></asp:TextBox>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td style="text-align: center" class="formItemBgStyle" colspan="2">
                                                                                    <asp:Button ID="btnSave" runat="server" Text="<%$ Resources:lang,BaoCun%>" CssClass="inpu" OnClick="btnSave_Click" />&nbsp;
                                                                                    <asp:Button ID="btnCancel" runat="server" Text="<%$ Resources:lang,QuXiao%>" CssClass="inpu" OnClick="btnCancel_Click" />
                                                                                </td>
                                                                            </tr>
                                                                        </table>
                                                                    </td>
                                                                    <td class="formItemBgStyle" width="80%">
                                                                        <asp:Label ID="Label12" runat="server" Text="<%$ Resources:lang,Nian%>"></asp:Label><asp:DropDownList ID="DDL_SYear" runat="server"></asp:DropDownList>&nbsp;
                                                                                    <asp:Label ID="Label13" runat="server" Text="<%$ Resources:lang,Yue%>"></asp:Label><asp:DropDownList ID="DDL_SMonth" runat="server"></asp:DropDownList>&nbsp;
                                                                        <asp:Button ID="BT_Seach" runat="server" Text="<%$ Resources:lang,ChaXun%>" CssClass="inpu" OnClick="BT_Seach_Click" /><br />
                                                                        <asp:DataGrid ID="DG_List" runat="server" AllowPaging="false" AutoGenerateColumns="False"
                                                                            CellPadding="4" ForeColor="#333333" GridLines="None" Height="1px" PageSize="10" ShowHeader="True"
                                                                            Width="100%" OnItemCommand="DG_List_ItemCommand">
                                                                            <Columns>
                                                                                <asp:TemplateColumn HeaderText="">
                                                                                    <ItemTemplate>
                                                                                        <asp:Button ID="BT_ID" runat="server" Text='<%# DataBinder.Eval(Container.DataItem,"id") %>'
                                                                                            CommandName="edit" CommandArgument='<%# DataBinder.Eval(Container.DataItem,"id") %>' CssClass="inpu" />
                                                                                    </ItemTemplate>
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                                </asp:TemplateColumn>

                                                                                <asp:TemplateColumn HeaderText="">
                                                                                    <ItemTemplate>
                                                                                        <asp:Button ID="BT_Finished" runat="server" ForeColor="Black" Text="<%$ Resources:lang,YiShou%>"
                                                                                            CommandName="Finished" CommandArgument='<%# DataBinder.Eval(Container.DataItem,"ID") %>' CssClass="inpu" />
                                                                                    </ItemTemplate>
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                                </asp:TemplateColumn>


                                                                                <asp:BoundColumn DataField="StudentCode" HeaderText="学生编辑">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                                </asp:BoundColumn>
                                                                                <asp:BoundColumn DataField="StudentName" HeaderText="学生姓名">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="15%" />
                                                                                </asp:BoundColumn>
                                                                                <asp:BoundColumn DataField="CollectTime" HeaderText="收费时间" DataFormatString="{0:yyyy-MM-dd}">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                                </asp:BoundColumn>
                                                                                <asp:BoundColumn DataField="CostProject" HeaderText="收费项目">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                                </asp:BoundColumn>
                                                                                <asp:BoundColumn DataField="CostDemial" HeaderText="收费金额 ">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                                </asp:BoundColumn>

                                                                                <asp:BoundColumn DataField="WangFeePerSemester" HeaderText="保教费">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                                </asp:BoundColumn>
                                                                                <asp:BoundColumn DataField="Meals" HeaderText="膳费">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                                </asp:BoundColumn>
                                                                                <asp:BoundColumn DataField="CustodyAfterClass" HeaderText="托管费">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                                </asp:BoundColumn>
                                                                                <asp:BoundColumn DataField="ActivityCost" HeaderText="外出活动费用">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                                </asp:BoundColumn>
                                                                                <asp:BoundColumn DataField="ReplaceCosts" HeaderText="代收代支生活用品费">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                                </asp:BoundColumn>

                                                                                <asp:TemplateColumn HeaderText="">
                                                                                    <ItemTemplate>
                                                                                        <asp:Button ID="BT_Delete" runat="server" ForeColor="Black" Text="<%$ Resources:lang,ShanChu%>"
                                                                                            CommandName="del" CommandArgument='<%# DataBinder.Eval(Container.DataItem,"ID") %>' CssClass="inpu" />
                                                                                    </ItemTemplate>
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" />
                                                                                </asp:TemplateColumn>
                                                                            </Columns>
                                                                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                                            <EditItemStyle BackColor="#2461BF" />
                                                                            <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                                            <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />
                                                                            
                                                                            <ItemStyle CssClass="itemStyle" />
                                                                            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" HorizontalAlign="Center" />
                                                                        </asp:DataGrid>
                                                                        <asp:Label ID="LB_QualitySql" runat="server" Visible="False"></asp:Label>
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
                </div>
                <asp:HiddenField ID="HF_ID" runat="server" />

                <asp:HiddenField ID="HF_StudentCode" runat="server" />
                <asp:HiddenField ID="HF_StudentName" runat="server" />
            </ContentTemplate>
            <Triggers>
                <asp:PostBackTrigger ControlID="btnSave" />
            </Triggers>
        </asp:UpdatePanel>
    </form>
</body>
<script type="text/javascript" language="javascript">var cssDirectory = '<%=Session["CssDirectory"] %>'; var oLink = document.getElementById('mainCss'); oLink.href = 'css/' + cssDirectory + '/' + 'bluelightmain.css';</script></html>
