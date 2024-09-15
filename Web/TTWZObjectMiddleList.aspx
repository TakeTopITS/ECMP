<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTWZObjectMiddleList.aspx.cs" Inherits="TTWZObjectMiddleList" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>中类代码列表</title>
    <link id="mainCss" href="css/bluelightmain.css" rel="stylesheet" type="text/css" />
    <script src="js/jquery-1.7.2.min.js"></script>
    <script src="js/allAHandler.js"></script>
    <script language="javascript">
        $(function () { 

           

            //ControlStatusCloseChange();

        });


        function ControlStatusChange(objProgress, objIsMark) {

            
            if (objIsMark == "0") {
                $("#BT_NewEdit").attr("class", "inpu");
                $("#BT_NewEdit").removeAttr("disabled");
                $("#BT_NewDelete").attr("class", "inpu");
                $("#BT_NewDelete").removeAttr("disabled");
            } else {
                $("#BT_NewEdit").attr("disabled", "disabled");
                $("#BT_NewEdit").removeClass("inpu");
                $("#BT_NewDelete").attr("disabled", "disabled");
                $("#BT_NewDelete").removeClass("inpu");
            }

            if (objProgress == "申请") {
                $("#BT_NewApprove").attr("class", "inpu");
                $("#BT_NewApprove").removeAttr("disabled");                            //批准
            }
            else {
                $("#BT_NewApprove").attr("disabled", "disabled");
                $("#BT_NewApprove").removeClass("inpu");                                //批准
            }

            if (objProgress == "批准" && objIsMark == "0") {
                $("#BT_NewApproveReturn").attr("class", "inpu");
                $("#BT_NewApproveReturn").removeAttr("disabled");                         //批准撤消
            }
            else {
                $("#BT_NewApproveReturn").attr("disabled", "disabled");
                $("#BT_NewApproveReturn").removeClass("inpu");
            }
        }



        function ControlStatusCloseChange() {
            $("#BT_NewEdit").attr("disabled", "disabled");
            $("#BT_NewEdit").removeClass("inpu");
            
            $("#BT_NewApprove").attr("disabled", "disabled");
            $("#BT_NewApprove").removeClass("inpu");
            $("#BT_NewApproveReturn").attr("disabled", "disabled");
            $("#BT_NewApproveReturn").removeClass("inpu");

            $("#BT_NewDelete").attr("disabled", "disabled");
            $("#BT_NewDelete").removeClass("inpu");
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
                                                            <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,ZhongLeiShenHe%>"></asp:Label>
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
                                                        <td style="text-align: left;" class="formItemBgStyle" colspan="2">
                                                            <table class="formBgStyle" style="width: 80%;">
                                                                <tr>
                                                                    <td class="formItemBgStyle">
                                                                        <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,DaLeiDaiMa%>"></asp:Label>：</td>
                                                                    <td class="formItemBgStyle">
                                                                        <asp:TextBox ID="TXT_DLCode" runat="server" ReadOnly="true"></asp:TextBox>
                                                                    </td>
                                                                    <td class="formItemBgStyle">
                                                                        <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,ZhongLeiMingCheng%>"></asp:Label>：</td>
                                                                    <td class="formItemBgStyle">
                                                                        <asp:TextBox ID="TXT_ZLName" runat="server" Width="200px"></asp:TextBox>
                                                                    </td>
                                                                    <td class="formItemBgStyle">
                                                                        <asp:Button ID="BT_Save" runat="server" Text="<%$ Resources:lang,BaoCun%>" CssClass="inpu" OnClick="btnSave_Click" />
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="formItemBgStyle">
                                                                        <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,ZhongLeiDaiMa%>"></asp:Label>：</td>
                                                                    <td class="formItemBgStyle">
                                                                        <asp:TextBox ID="TXT_ZLCode" runat="server"></asp:TextBox>
                                                                    </td>
                                                                    <td class="formItemBgStyle">
                                                                        <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,ZhongLeiShuoMing%>"></asp:Label>：</td>
                                                                    <td class="formItemBgStyle">
                                                                        <asp:TextBox ID="TXT_ZLDesc" runat="server" Width="300px"></asp:TextBox>
                                                                    </td>
                                                                    <td class="formItemBgStyle">
                                                                        <asp:Button ID="BT_Cancel" runat="server" Text="<%$ Resources:lang,QuXiao%>" CssClass="inpu" OnClick="BT_Cancel_Click" />
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="formItemBgStyle" colspan="5">
                                                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                                        <asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,LieBiaoPaiXu%>"></asp:Label>：<asp:Button ID="BT_ZLCode" runat="server" Text="<%$ Resources:lang,ZhongLeiDaiMa%>" CssClass="inpu" OnClick="BT_ZLCode_Click" />
                                                                        <asp:Button ID="BT_IsMark" runat="server" Text="<%$ Resources:lang,ShiYongBiaoJi%>" CssClass="inpu" OnClick="BT_IsMark_Click" />
                                                                        <asp:Button ID="BT_CreateProgress" runat="server" Text="<%$ Resources:lang,ChuangJianJinDu%>" CssClass="inpu" OnClick="BT_CreateProgress_Click" />
                                                                        <asp:HiddenField ID="HF_SortZLCode" runat="server" />
                                                                        <asp:HiddenField ID="HF_SortIsMark" runat="server" />
                                                                        <asp:HiddenField ID="HF_SortCreateProgress" runat="server" />
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="formItemBgStyle" colspan="5">
                                                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                                        <asp:Label ID="Label9" runat="server" Text="<%$ Resources:lang,JiLuCaoZuo%>"></asp:Label>：<asp:Button ID="BT_NewEdit" runat="server" Text="<%$ Resources:lang,BianJi%>" CssClass="inpu" OnClick="BT_NewEdit_Click" />&nbsp;
                                                                        <asp:Button ID="BT_NewApprove" runat="server" Text="<%$ Resources:lang,PiZhun%>" CssClass="inpu" OnClick="BT_NewApprove_Click" />&nbsp;
                                                                        <asp:Button ID="BT_NewApproveReturn" runat="server" Text="<%$ Resources:lang,PiZhunCheXiao%>" CssClass="inpu" OnClick="BT_NewApproveReturn_Click" />&nbsp;
                                                                        <asp:Button ID="BT_NewDelete" runat="server" Text="<%$ Resources:lang,ShanChu%>" CssClass="inpu" OnClick="BT_NewDelete_Click" OnClientClick="return confirm(getDeleteMsgByLangCode())"/>&nbsp;&nbsp;&nbsp;
                                                                        <asp:Button ID="BT_RepartIsMark" runat="server" Text="<%$ Resources:lang,ChongZuoShiYongBiaoJi%>" CssClass="inpuLong" OnClick="BT_RepartIsMark_Click" />&nbsp;&nbsp;&nbsp;
                                                                        <asp:Label ID="LB_ShowDLName" runat="server" Text="**"></asp:Label><asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,DaLeiZhongLeiJiLu%>"></asp:Label>&nbsp;&nbsp;<asp:Label ID="Label8" runat="server" Text="<%$ Resources:lang,Gong%>"></asp:Label>
                                                                                    <asp:Label ID="LB_ShowRecordCount" runat="server" Text="**"></asp:Label><asp:Label ID="Label10" runat="server" Text="<%$ Resources:lang,Tiao%>"></asp:Label>&nbsp;&nbsp;
                                                                                    
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="formItemBgStyle" style="width: 15%;">
                                                            <asp:TreeView ID="TV_BigObject" runat="server" ShowLines="True" NodeWrap="True" OnSelectedNodeChanged="TV_BigObject_SelectedNodeChanged">
                                                                <RootNodeStyle CssClass="rootNode" /><NodeStyle CssClass="treeNode" /><LeafNodeStyle CssClass="leafNode" /><SelectedNodeStyle CssClass="selectNode" ForeColor ="Red" />
                                                            </asp:TreeView>
                                                        </td>
                                                        <td class="formItemBgStyle" style="width: 85%;">
                                                            <%--<font style="color:red;">*使用标记不为-1的，修改中类代码请慎重，可能导致已经使用当前的中类代码对应不上！</font>--%>
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
                                                                                        <asp:Label ID="Label11" runat="server" Text="<%$ Resources:lang,CaoZuo%>"></asp:Label></strong>
                                                                                </td>
                                                                                <td width="8%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label12" runat="server" Text="<%$ Resources:lang,DaLeiDaiMa%>"></asp:Label></strong>
                                                                                </td>
                                                                                <td width="8%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label13" runat="server" Text="<%$ Resources:lang,ZhongLeiDaiMa%>"></asp:Label></strong>
                                                                                </td>
                                                                                <td width="16%" align="left">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label14" runat="server" Text="<%$ Resources:lang,ZhongLeiMingCheng%>"></asp:Label></strong>
                                                                                </td>
                                                                                <td width="16%" align="left">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label15" runat="server" Text="<%$ Resources:lang,ZhongLeiShuoMing%>"></asp:Label></strong>
                                                                                </td>
                                                                                <td width="8%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label16" runat="server" Text="<%$ Resources:lang,ShiYongBiaoJi%>"></asp:Label></strong>
                                                                                </td>
                                                                                <td width="8%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label17" runat="server" Text="<%$ Resources:lang,ChuangJianJinDu%>"></asp:Label></strong>
                                                                                </td>
                                                                                <td width="8%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label18" runat="server" Text="<%$ Resources:lang,ChuangJianRen%>"></asp:Label></strong>
                                                                                </td>
                                                                                <td width="8%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label19" runat="server" Text="<%$ Resources:lang,ChuangJianBiaoZhi%>"></asp:Label></strong>
                                                                                </td>
                                                                            </tr>
                                                                        </table>
                                                                    </td>
                                                                    <td width="6" align="right">
                                                                        <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" />
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                            <asp:DataGrid ID="DG_List" runat="server" AllowPaging="false" AutoGenerateColumns="False"
                                                                CellPadding="4" ForeColor="#333333" GridLines="None" Height="1px" PageSize="10" ShowHeader="false"
                                                                Width="100%" OnItemCommand="DG_List_ItemCommand" OnPageIndexChanged="DG_List_PageIndexChanged">
                                                                <Columns>
                                                                    <asp:TemplateColumn>
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                        <HeaderTemplate>
                                                                            <asp:Label ID="Label20" runat="server" Text="<%$ Resources:lang,CaoZuo%>"></asp:Label>
                                                                        </HeaderTemplate>
                                                                        <ItemTemplate>

                                                                            <asp:LinkButton ID="LinkButton1" runat="server" CommandArgument='<%# Eval("ZLCode")+"|"+Eval("CreateProgress")+"|"+Eval("IsMark") %>' CommandName="click" CssClass="notTab"> <asp:Label ID="Label23" runat="server" Text="<%$ Resources:lang,CaoZuo%>"></asp:Label></asp:LinkButton>
                                                                            <%--<asp:LinkButton runat="server" CommandArgument='<%# DataBinder.Eval(Container.DataItem,"ZLCode") %>' CommandName="edit" CssClass="notTab">编辑</asp:LinkButton>--%>
                                                                            <%--<asp:LinkButton runat="server" CommandArgument='<%# DataBinder.Eval(Container.DataItem,"ZLCode") %>' CommandName='<%# Eval("CreateProgress").ToString()=="申请" ? "approve" : "notApprove" %>' CssClass="notTab" Text='<%# Eval("CreateProgress").ToString()=="申请" ? "批准" : "撤销" %>'></asp:LinkButton>--%>

                                                                        </ItemTemplate>
                                                                    </asp:TemplateColumn>
                                                                    <asp:BoundColumn DataField="DLCode" HeaderText="大类代码">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:BoundColumn DataField="ZLCode" HeaderText="中类代码">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                                    </asp:BoundColumn>
                                                                    <%--<asp:BoundColumn DataField="ZLName" HeaderText="中类名称">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="16%" />
                                                                    </asp:BoundColumn>--%>
                                                                    <asp:TemplateColumn>
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="16%" />
                                                                        <HeaderTemplate>
                                                                            <asp:Label ID="Label21" runat="server" Text="<%$ Resources:lang,ZhongLeiMingCheng%>"></asp:Label>
                                                                        </HeaderTemplate>
                                                                        <ItemTemplate>
                                                                            <%# ShareClass.StringCutByRequire(Eval("ZLName").ToString(), 13) %>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateColumn>
                                                                    <%--<asp:BoundColumn DataField="ZLDesc" HeaderText="中类说明">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="16%" />
                                                                    </asp:BoundColumn>--%>
                                                                    <asp:TemplateColumn>
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="16%" />
                                                                        <HeaderTemplate>
                                                                            <asp:Label ID="Label22" runat="server" Text="<%$ Resources:lang,ZhongLeiShuoMing%>"></asp:Label>
                                                                        </HeaderTemplate>
                                                                        <ItemTemplate>
                                                                            <%# ShareClass.StringCutByRequire(Eval("ZLDesc").ToString(), 190) %>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateColumn>
                                                                    <asp:BoundColumn DataField="IsMark" HeaderText="使用标记">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:BoundColumn DataField="CreateProgress" HeaderText="创建进度">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:BoundColumn DataField="CreaterName" HeaderText="创建人">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:BoundColumn DataField="CreateTitle" HeaderText="创建标志">
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
                <asp:HiddenField ID="HF_ZLCode" runat="server" />

                <asp:HiddenField ID="HF_NewZLCode" runat="server" />
                <asp:HiddenField ID="HF_NewProgress" runat="server" />
                <asp:HiddenField ID="HF_NewIsMark" runat="server" />
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
</body>
<script type="text/javascript" language="javascript">var cssDirectory = '<%=Session["CssDirectory"] %>'; var oLink = document.getElementById('mainCss'); oLink.href = 'css/' + cssDirectory + '/' + 'bluelightmain.css';</script></html>
