<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTWZGetUnitList.aspx.cs" Inherits="TTWZGetUnitList" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>领料单位列表</title>
    <link id="mainCss" href="css/bluelightmain.css" rel="stylesheet" type="text/css" />
    <script src="js/jquery-1.7.2.min.js"></script>
    <script src="js/allAHandler.js"></script>
    <script language="javascript">
        $(function () { 

           

            ControlStatusCloseChange();

        });



        function ControlStatusChange(objIsMark) {

            $("#BT_NewEdit").attr("class", "inpu");
            $("#BT_NewEdit").removeAttr("disabled");

            if (objIsMark == "0") {
                $("#BT_NewDelete").attr("class", "inpu");
                $("#BT_NewDelete").removeAttr("disabled");                            //删除
            }
            else {
                $("#BT_NewDelete").attr("disabled", "disabled");
                $("#BT_NewDelete").removeClass("inpu");                            //删除
            }
        }

        function ControlStatusCloseChange() {
            $("#BT_NewEdit").attr("disabled", "disabled");
            $("#BT_NewEdit").removeClass("inpu");
            $("#BT_NewDelete").attr("disabled", "disabled");
            $("#BT_NewDelete").removeClass("inpu");
        }


        //一般选择界面
        function SelectDepartment() {
            var url = "TTWZSelectorDepartment.aspx";

            popShowByURLForFixedSize(url + (url.indexOf("?") == -1 ? "?" : "&") + "ctrlId=" + id + "&ctrlName=" + name, '选择部门', 600, 500);	

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
                                                            <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,LingLiaoDanWei%>"></asp:Label>
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
                                                <table style="width: 90%;" cellpadding="2" cellspacing="0" class="formBgStyle">
                                                    <tr>
                                                        <td align="left" class="formItemBgStyle">
                                                            <%--<input type="button" class="inpuLong" value="新增领料单位" onclick="window.location.href = 'TTWZGetUnitEdit.aspx'" />--%>
                                                            <table class="formBgStyle" width="100%">
                                                                <tr>
                                                                    <td style="text-align: left" class="formItemBgStyle">
                                                                        <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,DanWeiBianHao%>"></asp:Label>：</td>
                                                                    <td style="text-align: left" class="formItemBgStyle">
                                                                        <asp:TextBox ID="TXT_UnitCode" runat="server" ReadOnly="true"></asp:TextBox><font color="red">*<asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,XiTongZiDongShengCheng%>"></asp:Label></font>
                                                                    </td>
                                                                    <td style="text-align: left" class="formItemBgStyle">
                                                                        <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,LingLiaoDanWei%>"></asp:Label>：</td>
                                                                    <td style="text-align: left" class="formItemBgStyle" colspan="2">
                                                                        <asp:TextBox ID="TXT_UnitName" runat="server" Width="300px"></asp:TextBox>&nbsp;
                                                                        <input type="button" id="Button1" class="inpu" value="选择" onclick="SelectDepartment()" />
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td style="text-align: left" class="formItemBgStyle">
                                                                        <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,ZhuGuanLingDao%>"></asp:Label>：</td>
                                                                    <td style="text-align: left" class="formItemBgStyle">
                                                                        <asp:TextBox ID="TXT_Leader" runat="server" ReadOnly="true"></asp:TextBox>&nbsp;
                                                                        <input type="button" id="btnLeader" class="inpu" value="选择" onclick="SelectEmployee('TTWZSelectorMember.aspx', 'HF_Leader', 'TXT_Leader')" />
                                                                        <asp:HiddenField ID="HF_Leader" runat="server" />
                                                                    </td>
                                                                    <td style="text-align: left" class="formItemBgStyle">
                                                                        <asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,DanWeiLeiXing%>"></asp:Label>：</td>
                                                                    <td style="text-align: left" class="formItemBgStyle">
                                                                        <asp:DropDownList ID="DDL_UnitType" runat="server">
                                                                            <asp:ListItem Text="<%$ Resources:lang,XingZhengDanWei%>" Value="行政单位"/>
                                                                            <asp:ListItem Text="<%$ Resources:lang,XiangMuBu%>" Value="项目部"/>
                                                                        </asp:DropDownList>
                                                                    </td>
                                                                    <td class="formItemBgStyle">&nbsp;</td>
                                                                </tr>
                                                                <tr>
                                                                    <td style="text-align: left" class="formItemBgStyle">
                                                                        <asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,FeiKongZhuGuan%>"></asp:Label>：</td>
                                                                    <td style="text-align: left" class="formItemBgStyle">
                                                                        <asp:TextBox ID="TXT_FeeManage" runat="server" ReadOnly="true"></asp:TextBox>&nbsp;
                                                                        <input type="button" id="btnFeeManage" class="inpu" value="选择" onclick="SelectEmployee('TTWZSelectorMember.aspx', 'HF_FeeManage', 'TXT_FeeManage')" />
                                                                        <asp:HiddenField ID="HF_FeeManage" runat="server" />
                                                                    </td>
                                                                    <td style="text-align: left" class="formItemBgStyle">
                                                                        <asp:Label ID="Label8" runat="server" Text="<%$ Resources:lang,CaiLiaoYuan%>"></asp:Label>：</td>
                                                                    <td style="text-align: left" class="formItemBgStyle">
                                                                        <asp:TextBox ID="TXT_MaterialPerson" runat="server" ReadOnly="true"></asp:TextBox>&nbsp;
                                                                        <input type="button" id="btnMaterialPerson" class="inpu" value="选择" onclick="SelectEmployee('TTWZSelectorMember.aspx', 'HF_MaterialPerson', 'TXT_MaterialPerson')" />
                                                                        <asp:HiddenField ID="HF_MaterialPerson" runat="server" />
                                                                    </td>
                                                                    <td style="text-align: center" class="formItemBgStyle">
                                                                        <asp:Button ID="btnSave" runat="server" Text="<%$ Resources:lang,BaoCun%>" CssClass="inpu" OnClick="btnSave_Click" />&nbsp;
                                                                        <asp:Button ID="BT_Cancel" runat="server" Text="<%$ Resources:lang,QuXiao%>" CssClass="inpu" OnClick="BT_Cancel_Click" />
                                                                        <%--<input type="button" value="返回" id="BT_Return" class="inpu" onclick="window.location.href = 'TTWZGetUnitList.aspx'" />--%>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="formItemBgStyle" colspan="5">&nbsp;&nbsp;
                                                                        <asp:Label ID="Label9" runat="server" Text="<%$ Resources:lang,LingLiaoDanWeiJiLu%>"></asp:Label>&nbsp;<asp:Label ID="Label10" runat="server" Text="<%$ Resources:lang,Gong%>"></asp:Label><asp:Label ID="LB_Record" runat="server" Text="*"></asp:Label><asp:Label ID="Label11" runat="server" Text="<%$ Resources:lang,Tiao%>"></asp:Label>
                                                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                                        <asp:Button ID="BT_Add" runat="server" Text="<%$ Resources:lang,XinZengLingLiaoDanWei%>" CssClass="inpuLong" OnClick="BT_Add_Click" />
                                                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                                        <asp:Label ID="Label12" runat="server" Text="<%$ Resources:lang,JiLuCaoZuo%>"></asp:Label>：
                                                                        <asp:Button ID="BT_NewEdit" runat="server" Text="<%$ Resources:lang,BianJi%>" CssClass="inpu" OnClick="BT_NewEdit_Click" />&nbsp;
                                                                        <asp:Button ID="BT_NewDelete" runat="server" Text="<%$ Resources:lang,ShanChu%>" CssClass="inpu" OnClick="BT_NewDelete_Click" OnClientClick="return confirm(getDeleteMsgByLangCode())"/>
                                                                    </td>
                                                                </tr>
                                                            </table>
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
                                                                                    <strong>
                                                                                        <asp:Label ID="Label13" runat="server" Text="<%$ Resources:lang,CaoZuo%>"></asp:Label></strong>
                                                                                </td>
                                                                                <td width="10%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label14" runat="server" Text="<%$ Resources:lang,DanWeiBianHao%>"></asp:Label></strong>
                                                                                </td>
                                                                                <td width="22%" align="left">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label15" runat="server" Text="<%$ Resources:lang,LingLiaoDanWei%>"></asp:Label></strong>
                                                                                </td>
                                                                                <td width="10%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label16" runat="server" Text="<%$ Resources:lang,ZhuGuanLingDao%>"></asp:Label></strong>
                                                                                </td>
                                                                                <%--<td width="10%" align="center">
                                                                                    <strong><asp:Label runat="server" Text="<%$ Resources:lang,WeiTuoDaiLiRen%>"></asp:Label></strong>
                                                                                </td>--%>
                                                                                <td width="10%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label17" runat="server" Text="<%$ Resources:lang,FeiKongZhuGuan%>"></asp:Label></strong>
                                                                                </td>
                                                                                <td width="10%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label18" runat="server" Text="<%$ Resources:lang,CaiLiaoYuan%>"></asp:Label></strong>
                                                                                </td>
                                                                                <td width="10%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label19" runat="server" Text="<%$ Resources:lang,ShiYongBiaoJi%>"></asp:Label></strong>
                                                                                </td>
                                                                            </tr>
                                                                        </table>
                                                                    </td>
                                                                    <td width="6" align="right">
                                                                        <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" />
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                            <asp:DataGrid ID="DG_List" runat="server" AllowPaging="False" AutoGenerateColumns="False"
                                                                CellPadding="4" ForeColor="#333333" GridLines="None" Height="1px" PageSize="5" ShowHeader="false"
                                                                Width="100%" OnItemCommand="DG_List_ItemCommand">
                                                                <Columns>
                                                                    <asp:TemplateColumn>
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                        <HeaderTemplate>
                                                                            <asp:Label ID="Label20" runat="server" Text="<%$ Resources:lang,CaoZuo%>"></asp:Label>
                                                                        </HeaderTemplate>
                                                                        <ItemTemplate>

                                                                            <asp:LinkButton ID="LinkButton1" runat="server" CommandArgument='<%# Eval("UnitCode")+"|"+Eval("IsMark") %>' CommandName="click" CssClass="notTab">
                                                                                <asp:Label ID="Label22" runat="server" Text="<%$ Resources:lang,CaoZuo%>"></asp:Label></asp:LinkButton>
                                                                            <%--<a href='TTWZGetUnitEdit.aspx?strUnitCode=<%# DataBinder.Eval(Container.DataItem,"UnitCode") %>'>编辑</a>--%>
                                                                            <%--<asp:LinkButton ID="LinkButton1" runat="server" CommandArgument='<%# DataBinder.Eval(Container.DataItem,"UnitCode") %>' CommandName="del" CssClass="notTab" Visible='<%# Eval("IsMark").ToString()=="0" ? true : false %>'>删除</asp:LinkButton>--%>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateColumn>
                                                                    <asp:BoundColumn DataField="UnitCode" HeaderText="单位编号">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:TemplateColumn>
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="22%" />
                                                                        <HeaderTemplate>
                                                                            <asp:Label ID="Label21" runat="server" Text="<%$ Resources:lang,LingLiaoDanWei%>"></asp:Label>
                                                                        </HeaderTemplate>
                                                                        <ItemTemplate>
                                                                            <%# ShareClass.StringCutByRequire(Eval("UnitName").ToString(), 21) %>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateColumn>
                                                                    <asp:BoundColumn DataField="LeaderName" HeaderText="主管领导">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                    </asp:BoundColumn>
                                                                    <%--<asp:BoundColumn DataField="DelegateAgentName" HeaderText="委托代理人">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                    </asp:BoundColumn>--%>
                                                                    <asp:BoundColumn DataField="FeeManageName" HeaderText="费控主管">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:BoundColumn DataField="MaterialPersonName" HeaderText="材料员">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:BoundColumn DataField="IsMark" HeaderText="使用标记">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                    </asp:BoundColumn>
                                                                </Columns>
                                                                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                                <EditItemStyle BackColor="#2461BF" />
                                                                <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                                <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />
                                                                
                                                                <ItemStyle CssClass="itemStyle" />
                                                                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" HorizontalAlign="Center" />
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
                </div>
                <asp:HiddenField ID="HF_UnitCode" runat="server" />
                <asp:HiddenField ID="HF_NewUnitCode" runat="server" />
                <asp:HiddenField ID="HF_NewIsMark" runat="server" />
            </ContentTemplate>
        </asp:UpdatePanel>
    </form>
</body>
<script type="text/javascript" language="javascript">var cssDirectory = '<%=Session["CssDirectory"] %>'; var oLink = document.getElementById('mainCss'); oLink.href = 'css/' + cssDirectory + '/' + 'bluelightmain.css';</script></html>
