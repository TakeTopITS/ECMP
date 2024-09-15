<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTVisitRegistration_StudentList.aspx.cs" Inherits="TTVisitRegistration_StudentList" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>拜访</title>
    <link id="mainCss" href="css/bluelightmain.css" rel="stylesheet" type="text/css" />
    <script src="js/jquery-1.7.2.min.js"></script>
    <script src="js/allAHandler.js"></script>
    <script language="javascript">
        $(function () { if (top.location != self.location) { } else { CloseWebPage(); }

            

        });


        function LocationEdit(url) {

            window.location.href = url;

        }


        function LoadProjectList() {
            alert("调用成功");
            document.getElementById("BT_RelaceLoad").click();
        }




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
                                                            <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,BaiFangDengJi%>"></asp:Label>
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
                                                        <td class="formItemBgStyle" width="100%"><asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,LieBiaoCaoZuo%>"></asp:Label>：&nbsp;
                                                            <%--<asp:Button ID="BT_NewAdd" runat="server" CssClass="inpu" Enabled="false" Text="新增拜访" OnClick="BT_NewAdd_Click" />&nbsp;--%>
                                                            <input type="button" value="新增拜访" class="inpuLong" onclick="window.location.href='TTVisitRegistration_StudentEdit.aspx'" />
                                                            
                                                            <asp:Button ID="BT_RelaceLoad" runat="server" Text="<%$ Resources:lang,ChongXinJiaZaiLieBiao%>" OnClick="BT_RelaceLoad_Click" CssClass="inpu" style="display:none;" />

                                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                                                            <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,DaoChuNian%>"></asp:Label>：<asp:DropDownList ID="DDL_Year" runat="server"></asp:DropDownList>&nbsp;
                                                                        <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,Yue%>"></asp:Label>：<asp:DropDownList ID="DDL_Month" runat="server"></asp:DropDownList>&nbsp;

                                                            <asp:Button ID="BT_Export" runat="server" Text="<%$ Resources:lang,DaoChu%>" CssClass="inpu" OnClick="BT_Export_Click" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="formItemBgStyle" width="100%">
                                                 
                                                                <table width="100%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                                                    <tr>
                                                                        <td width="7">
                                                                            <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" />
                                                                        </td>
                                                                        <td>
                                                                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                                <tr>
                                                                                    <td width="5%" align="center">
                                                                                        <strong><asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,CaoZuo%>"></asp:Label></strong>
                                                                                    </td>
                                                                                    <td width="10%" align="center">
                                                                                        <strong><asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,LaiYuanShiJian%>"></asp:Label></strong>
                                                                                    </td>
                                                                                    <td width="10%" align="left">
                                                                                        <strong><asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,XingMing%>"></asp:Label></strong>
                                                                                    </td>
                                                                                    <td width="5%" align="center">
                                                                                        <strong><asp:Label ID="Label8" runat="server" Text="<%$ Resources:lang,XingBie%>"></asp:Label></strong>
                                                                                    </td>
                                                                                    <td width="10%" align="left">
                                                                                        <strong><asp:Label ID="Label9" runat="server" Text="<%$ Resources:lang,LaiFangRenZhengJian%>"></asp:Label></strong>
                                                                                    </td>
                                                                                    <td width="10%" align="left">
                                                                                        <strong><asp:Label ID="Label10" runat="server" Text="<%$ Resources:lang,LaiFangYuanYin%>"></asp:Label></strong>
                                                                                    </td>
                                                                                    <td width="10%" align="left">
                                                                                        <strong><asp:Label ID="Label11" runat="server" Text="<%$ Resources:lang,JieDaiRen%>"></asp:Label></strong>
                                                                                    </td>
                                                                                    <td width="10%" align="left">
                                                                                        <strong><asp:Label ID="Label12" runat="server" Text="<%$ Resources:lang,LiYuanShiJian%>"></asp:Label></strong>
                                                                                    </td>
                                                                                </tr>
                                                                            </table>
                                                                        </td>
                                                                        <td width="6" align="right">
                                                                            <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" />
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                                <asp:DataGrid ID="DataGrid1" runat="server" AllowPaging="true" AutoGenerateColumns="False"
                                                                    CellPadding="4" ForeColor="#333333" GridLines="None" Height="1px" PageSize="20" ShowHeader="false"
                                                                    Width="100%" OnItemCommand="DataGrid1_ItemCommand" OnPageIndexChanged="DataGrid1_PageIndexChanged">
                                                                    <Columns>
                                                                        <asp:TemplateColumn>
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                            <HeaderTemplate>
                                                                                <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,CaoZuo%>"></asp:Label>
                                                                            </HeaderTemplate>
                                                                            <ItemTemplate>

                                                                                <asp:LinkButton ID="LB_Edit" runat="server" CommandArgument='<%#Eval("ID") %>' CommandName="edit" CssClass="notTab">
                                                                                    <asp:Label ID="Label13" runat="server" Text="<%$ Resources:lang,LiYuanShiJian%>"></asp:Label></asp:LinkButton>
                                                                                
                                                                            </ItemTemplate>
                                                                        </asp:TemplateColumn>
                                                                        <asp:BoundColumn DataField="VisitStartTime" HeaderText="来园时间">
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                        </asp:BoundColumn>
                                                                        
                                                                        <asp:TemplateColumn>
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="10%" />
                                                                            <HeaderTemplate>
                                                                                <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,XingMing%>"></asp:Label>
                                                                            </HeaderTemplate>
                                                                            <ItemTemplate>
                                                                                <%# ShareClass.StringCutByRequire(Eval("VisitName").ToString(), 190) %>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateColumn>
                                                                        <asp:BoundColumn DataField="VisitSex" HeaderText="性别">
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                        </asp:BoundColumn>
                                                                        <asp:TemplateColumn>
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="10%" />
                                                                            <HeaderTemplate>
                                                                                <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,LaiFangRenZhengJian%>"></asp:Label>
                                                                            </HeaderTemplate>
                                                                            <ItemTemplate>
                                                                                <%# ShareClass.StringCutByRequire(Eval("VisitCardName").ToString(), 9) %>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateColumn>
                                                                        
                                                                        <asp:TemplateColumn>
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="10%" />
                                                                            <HeaderTemplate>
                                                                                <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,LaiFangYuanYin%>"></asp:Label>
                                                                            </HeaderTemplate>
                                                                            <ItemTemplate>
                                                                                <%# ShareClass.StringCutByRequire(Eval("VisitReason").ToString(), 9) %>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateColumn>
                                                                        <asp:TemplateColumn>
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="10%" />
                                                                            <HeaderTemplate>
                                                                                <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,JieDaiRen%>"></asp:Label>
                                                                            </HeaderTemplate>
                                                                            <ItemTemplate>
                                                                                <%# ShareClass.StringCutByRequire(Eval("ReceiverName").ToString(), 8) %>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateColumn>
                                                                        <asp:TemplateColumn>
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="10%" />
                                                                            <HeaderTemplate>
                                                                                <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,LiYuanShiJian%>"></asp:Label>
                                                                            </HeaderTemplate>
                                                                            <ItemTemplate>
                                                                                <%# ShareClass.StringCutByRequire(Eval("VisitEndTime").ToString(), 190) %>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateColumn>
                                                                        
                                                                    </Columns>
                                                                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                                    <EditItemStyle BackColor="#2461BF" />
                                                                    <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                                    <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />
                                                                    
                                                                    <ItemStyle CssClass="itemStyle" />
                                                                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" HorizontalAlign="Center" />
                                                                </asp:DataGrid>
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
               
            </ContentTemplate>
            <Triggers>
                <asp:PostBackTrigger ControlID="BT_Export" />
            </Triggers>
        </asp:UpdatePanel>
    </form>
</body>
<script type="text/javascript" language="javascript">var cssDirectory = '<%=Session["CssDirectory"] %>'; var oLink = document.getElementById('mainCss'); oLink.href = 'css/' + cssDirectory + '/' + 'bluelightmain.css';</script></html>
