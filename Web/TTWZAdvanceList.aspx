<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTWZAdvanceList.aspx.cs" Inherits="TTWZAdvanceList" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>预付计划</title>
    <link id="mainCss" href="css/bluelightmain.css" rel="stylesheet" type="text/css" />
    <script src="js/jquery-1.7.2.min.js"></script>
    <script src="js/allAHandler.js"></script>
    <script language="javascript">
        $(function () { 

           

            ControlStatusCloseChange();

        });



        function ControlStatusChange(objProgress) {

            $("#BT_NewDetail").attr("class", "inpu");
            $("#BT_NewDetail").removeAttr("disabled");                          //明细

            //alert(objProgress);
            if (objProgress == "录入") {
                $("#BT_NewEdit").attr("class", "inpu");
                $("#BT_NewEdit").removeAttr("disabled");                            //编辑
                $("#BT_NewDelete").attr("class", "inpu");
                $("#BT_NewDelete").removeAttr("disabled");                            //删除
                $("#BT_NewReport").attr("class", "inpu");
                $("#BT_NewReport").removeAttr("disabled");                          //报批
                $("#BT_NewExecute").attr("disabled", "disabled");
                $("#BT_NewExecute").removeClass("inpu");                         //执行
            }
            else if (objProgress == "批准") {
                $("#BT_NewEdit").attr("disabled", "disabled");
                $("#BT_NewEdit").removeClass("inpu");                            //删除
                $("#BT_NewDelete").attr("disabled", "disabled");
                $("#BT_NewDelete").removeClass("inpu");                          //请款
                $("#BT_NewReport").attr("disabled", "disabled");
                $("#BT_NewReport").removeClass("inpu");                            //报批
                $("#BT_NewExecute").attr("class", "inpu");
                $("#BT_NewExecute").removeAttr("disabled");                         //执行
            }
            else {
                $("#BT_NewEdit").attr("disabled", "disabled");
                $("#BT_NewEdit").removeClass("inpu");
                $("#BT_NewDelete").attr("disabled", "disabled");
                $("#BT_NewDelete").removeClass("inpu");
                $("#BT_NewDetail").attr("disabled", "disabled");
                $("#BT_NewDetail").removeClass("inpu");
                $("#BT_NewReport").attr("disabled", "disabled");
                $("#BT_NewReport").removeClass("inpu");
                $("#BT_NewExecute").attr("disabled", "disabled");
                $("#BT_NewExecute").removeClass("inpu");
            }

        }



        function ControlStatusCloseChange() {
            $("#BT_NewEdit").attr("disabled", "disabled");
            $("#BT_NewEdit").removeClass("inpu");
            $("#BT_NewDelete").attr("disabled", "disabled");
            $("#BT_NewDelete").removeClass("inpu");
            $("#BT_NewDetail").attr("disabled", "disabled");
            $("#BT_NewDetail").removeClass("inpu");
            $("#BT_NewReport").attr("disabled", "disabled");
            $("#BT_NewReport").removeClass("inpu");
            $("#BT_NewExecute").attr("disabled", "disabled");
            $("#BT_NewExecute").removeClass("inpu");
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
                                                            <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,YuFuKuanJiHua%>"></asp:Label>
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
                                            <td align="left" class="formItemBgStyle">
                                                <table class="formBgStyle" width="40%">
                                                    <tr>
                                                        <td class="formItemBgStyle">
                                                            <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,YuFuKuanID%>"></asp:Label>：
                                                        </td>
                                                        <td style="text-align: left" class="formItemBgStyle" colspan="3">
                                                            <asp:TextBox ID="TXT_AdvanceCode" runat="server" ReadOnly="true"></asp:TextBox><font color="red">*<asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,XiTongZiDongShengCheng%>"></asp:Label></font>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="text-align: left" class="formItemBgStyle">
                                                            <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,XiangMuBianMa%>"></asp:Label>：</td>
                                                        <td style="text-align: left" class="formItemBgStyle">
                                                            <asp:DropDownList ID="DDL_Project" DataTextField="ProjectCode" DataValueField="ProjectCode" runat="server">
                                                            </asp:DropDownList>
                                                        </td>
                                                        <td style="text-align: left" class="formItemBgStyle">
                                                            <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,YuFuKuanMingCheng%>"></asp:Label>：</td>
                                                        <td style="text-align: left" class="formItemBgStyle">
                                                            <asp:TextBox ID="TXT_AdvanceName" runat="server"></asp:TextBox>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="text-align: center" class="formItemBgStyle" valign="top" colspan="4">
                                                            <asp:Button ID="BT_Create" runat="server" Text="<%$ Resources:lang,XinJian%>" CssClass="inpu" OnClick="BT_Create_Click" />&nbsp;
                                                            <asp:Button ID="BT_Edit" runat="server" Text="<%$ Resources:lang,BaoCun%>" CssClass="inpu" OnClick="BT_Edit_Click" />&nbsp;
                                                            <asp:Button ID="BT_Save" runat="server" Text="<%$ Resources:lang,BaoCun%>" CssClass="inpu" OnClick="BT_Save_Click" Visible="false" />
                                                            <asp:Button ID="BT_Reset" runat="server" Text="<%$ Resources:lang,QuXiao%>" CssClass="inpu" OnClick="BT_Reset_Click" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="text-align: center" class="formItemBgStyle" valign="top" colspan="4">
                                                            <asp:Button ID="BT_NewEdit" runat="server" Text="<%$ Resources:lang,BianJi%>" CssClass="inpu" OnClick="BT_NewEdit_Click" />&nbsp;
                                                            <asp:Button ID="BT_NewDelete" runat="server" Text="<%$ Resources:lang,ShanChu%>" CssClass="inpu" OnClick="BT_NewDelete_Click" OnClientClick="return confirm(getDeleteMsgByLangCode())"/>&nbsp;
                                                            <asp:Button ID="BT_NewDetail" runat="server" Text="<%$ Resources:lang,MingXi%>" CssClass="inpu" OnClick="BT_NewDetail_Click" />&nbsp;
                                                            <asp:Button ID="BT_NewReport" runat="server" Text="<%$ Resources:lang,BaoPi%>" CssClass="inpu" OnClick="BT_NewReport_Click" />&nbsp;
                                                            <asp:Button ID="BT_NewExecute" runat="server" Text="<%$ Resources:lang,ZhiXing%>" CssClass="inpu" OnClick="BT_NewExecute_Click" />&nbsp;
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
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
                                                                    <td width="5%" align="center">
                                                                        <strong>
                                                                            <asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,CaoZuo%>"></asp:Label></strong>
                                                                    </td>
                                                                    <td width="9%" align="center">
                                                                        <strong>
                                                                            <asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,YuFuKuanID%>"></asp:Label></strong>
                                                                    </td>
                                                                    <td width="10%" align="center">
                                                                        <strong>
                                                                            <asp:Label ID="Label8" runat="server" Text="<%$ Resources:lang,XiangMuBianMa%>"></asp:Label></strong>
                                                                    </td>
                                                                    <td width="19%" align="left">
                                                                        <strong>
                                                                            <asp:Label ID="Label9" runat="server" Text="<%$ Resources:lang,YuFuKuanMingCheng%>"></asp:Label></strong>
                                                                    </td>
                                                                    <td width="10%" align="right">
                                                                        <strong>
                                                                            <asp:Label ID="Label10" runat="server" Text="<%$ Resources:lang,YuFuZongE%>"></asp:Label></strong>
                                                                    </td>
                                                                    <td width="8%" align="center">
                                                                        <strong>
                                                                            <asp:Label ID="Label11" runat="server" Text="<%$ Resources:lang,FuKuanRiQi%>"></asp:Label></strong>
                                                                    </td>
                                                                    <td width="8%" align="center">
                                                                        <strong>
                                                                            <asp:Label ID="Label12" runat="server" Text="<%$ Resources:lang,BianZhiRen%>"></asp:Label></strong>
                                                                    </td>
                                                                    <td width="8%" align="center">
                                                                        <strong>
                                                                            <asp:Label ID="Label13" runat="server" Text="<%$ Resources:lang,JinDu%>"></asp:Label></strong>
                                                                    </td>
                                                                    <td width="8%" align="center">
                                                                        <strong>
                                                                            <asp:Label ID="Label14" runat="server" Text="<%$ Resources:lang,ShiYongBiaoJi%>"></asp:Label></strong>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                        <td width="6" align="right">
                                                            <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" />
                                                        </td>
                                                    </tr>
                                                </table>
                                                <asp:DataGrid ID="DG_Advance" runat="server" AllowPaging="true" AutoGenerateColumns="False"
                                                    CellPadding="4" ForeColor="#333333" GridLines="None" Height="1px" PageSize="10" ShowHeader="false"
                                                    Width="100%" OnItemCommand="DG_Advance_ItemCommand" OnPageIndexChanged="DG_Advance_PageIndexChanged">
                                                    <Columns>
                                                        <asp:TemplateColumn>
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                            <HeaderTemplate>
                                                                <asp:Label ID="Label15" runat="server" Text="<%$ Resources:lang,CaoZuo%>"></asp:Label>
                                                            </HeaderTemplate>
                                                            <ItemTemplate>

                                                                <asp:LinkButton ID="LinkButton5" runat="server" CommandArgument='<%#Eval("AdvanceCode")+"|"+Eval("Progress") %>' CommandName="click" CssClass="notTab">操作</asp:LinkButton>
                                                                <%--<asp:LinkButton ID="LinkButton1" runat="server" CommandArgument='<%#Eval("AdvanceCode") %>' CommandName="del" CssClass="notTab" Visible='<%# Eval("Progress").ToString()=="录入" ? true : false %>'>删除</asp:LinkButton>--%>
                                                                <%--<asp:LinkButton ID="LinkButton2" runat="server" CommandArgument='<%#Eval("AdvanceCode") %>' CommandName="edit" CssClass="notTab" Visible='<%# Eval("Progress").ToString()=="录入" ? true : false %>'>编辑</asp:LinkButton>--%>
                                                                <%--<asp:LinkButton ID="LinkButton3" runat="server" CommandArgument='<%#Eval("AdvanceCode") %>' CommandName="request" CssClass="notTab" Visible='<%# Eval("Progress").ToString()=="录入" ? true : false %>'>报批</asp:LinkButton>--%>
                                                                <%--<asp:LinkButton ID="LinkButton4" runat="server" CommandArgument='<%#Eval("AdvanceCode") %>' CommandName="execute" CssClass="notTab" Visible='<%# Eval("Progress").ToString()=="批准" ? true : false %>'>执行</asp:LinkButton>--%>
                                                                <%--<a href='TTWZAdvanceDetail.aspx?AdvanceCode=<%# DataBinder.Eval(Container.DataItem,"AdvanceCode") %>'>明细</a>--%>
                                                            </ItemTemplate>
                                                        </asp:TemplateColumn>
                                                        <asp:BoundColumn DataField="AdvanceCode" HeaderText="预付款ID">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="9%" />
                                                        </asp:BoundColumn>
                                                        <asp:BoundColumn DataField="ProjectCode" HeaderText="项目编码">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                        </asp:BoundColumn>
                                                        <%--<asp:BoundColumn DataField="AdvanceName" HeaderText="预付款名称">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="15%" />
                                                        </asp:BoundColumn>--%>
                                                        <asp:TemplateColumn>
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="19%" />
                                                            <HeaderTemplate>
                                                                <asp:Label ID="Label16" runat="server" Text="<%$ Resources:lang,YuFuKuanMingCheng%>"></asp:Label>
                                                            </HeaderTemplate>
                                                            <ItemTemplate>
                                                                <%# ShareClass.StringCutByRequire(Eval("AdvanceName").ToString(), 190) %>
                                                            </ItemTemplate>
                                                        </asp:TemplateColumn>
                                                        <asp:BoundColumn DataField="AdvanceMoney" HeaderText="预付总额">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Right" Width="10%" />
                                                        </asp:BoundColumn>
                                                        <%--<asp:BoundColumn DataField="AdvanceTime" HeaderText="付款日期">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="10%" />
                                                        </asp:BoundColumn>--%>
                                                        <asp:TemplateColumn>
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                            <HeaderTemplate>
                                                                <asp:Label ID="Label17" runat="server" Text="<%$ Resources:lang,FuKuanRiQi%>"></asp:Label>
                                                            </HeaderTemplate>
                                                            <ItemTemplate>
                                                                <%#DataBinder.Eval(Container.DataItem, "AdvanceTime", "{0:yyyy/MM/dd}")%>
                                                            </ItemTemplate>
                                                        </asp:TemplateColumn>
                                                        <asp:BoundColumn DataField="MarkerName" HeaderText="编制人">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                        </asp:BoundColumn>
                                                        <asp:BoundColumn DataField="Progress" HeaderText="进度">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                        </asp:BoundColumn>
                                                        <asp:BoundColumn DataField="IsMark" HeaderText="使用标记">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                        </asp:BoundColumn>
                                                    </Columns>
                                                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                    <EditItemStyle BackColor="#2461BF" />
                                                    <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                    <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />
                                                    
                                                    <ItemStyle CssClass="itemStyle" />
                                                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" HorizontalAlign="Center" />
                                                </asp:DataGrid>
                                                <asp:Label ID="LB_AdvanceSql" runat="server" Visible="False"></asp:Label>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
                <asp:HiddenField ID="HF_RequestCode" runat="server" />

                <asp:HiddenField ID="HF_NewAdvanceCode" runat="server" />
                <asp:HiddenField ID="HF_NewProgress" runat="server" />
            </ContentTemplate>
            <Triggers>
                <asp:PostBackTrigger ControlID="BT_Save" />
                <asp:PostBackTrigger ControlID="BT_Reset" />
            </Triggers>
        </asp:UpdatePanel>
    </form>
</body>
<script type="text/javascript" language="javascript">var cssDirectory = '<%=Session["CssDirectory"] %>'; var oLink = document.getElementById('mainCss'); oLink.href = 'css/' + cssDirectory + '/' + 'bluelightmain.css';</script></html>
