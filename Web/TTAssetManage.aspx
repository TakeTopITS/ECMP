<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTAssetManage.aspx.cs" Inherits="TTAssetManage" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link id="mainCss" href="css/bluelightmain.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        #AboveDiv {
            min-width: 1450px;
            width: expression (document.body.clientWidth <= 1450? "1450px" : "auto" ));
        }
    </style>

    <script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="js/allAHandler.js"></script>
    <script type="text/javascript" language="javascript">
        $(function () {
            if (top.location != self.location) { } else { CloseWebPage(); }



        });

        //复选框全选
        function ChooseAll(item) {
            $("input[name=dlCode]").each(function () {
                if (item.checked == true) {
                    $(this).attr("checked", "checked");
                } else {
                    $(this).removeAttr("checked");
                }
            });
        }

        //多选择按钮判断
        function ClickBarPrintMore() {
            var str = "";
            var businessType = "AssetManage";

            var intCount = 0;

            $("input[name=dlCode]").each(function () {
                if ($(this).attr("checked")) {
                    str = str + $(this).attr("id") + ","; // 整个以,隔开
                    intCount++;
                }
            });

            if (intCount > 15) {
                alert('每次选择不要超过15个资产代码进行打印，A4纸一版显示不完！');
                return false;
            }

            if (str == "") {
                alert('请选择记录项！');
                return false;
            }
            else {
                window.open("TTPrintBarCode.aspx?BusinessCodes=" + escape(str) + "&BusinessType=AssetManage");

                //jQuery.ajax({
                //    type: "post",
                //    url: "TTMakeAssetPrintMorePost.aspx?AssetCodes=" + escape(str),
                //    success: function (result) {

                //    }
                //});


            }

        }
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
                                                            <%--<img src="Logo/main_top_l.jpg" alt="" width="29" height="31" />--%>
                                                        </td>
                                                        <td align="center" background="ImagesSkin/main_top_bj.jpg" class="titlezi">
                                                            <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,ZiChanGuanLi%>" />
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
                                <td valign="top">
                                    <table style="width: 100%" cellpadding="0" cellspacing="0" align="center">
                                        <tr>
                                            <td align="left" style="padding-top: 5px;">
                                                <table>
                                                    <tr>
                                                        <td>
                                                            <asp:DropDownList ID="DL_AssetType" runat="server" DataTextField="Type" DataValueField="Type"
                                                                Width="100px" CssClass="DDList">
                                                            </asp:DropDownList></td>
                                                        <td>&nbsp;<asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,YongHuMing%>"></asp:Label>：</td>
                                                        <td>
                                                            <asp:TextBox ID="TB_OwnerName" runat="server" Width="80px"></asp:TextBox></td>
                                                        <td>&nbsp;<asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,DaiMa%>"></asp:Label>：</td>
                                                        <td>
                                                            <asp:TextBox ID="TB_AssetCode" runat="server" Width="100px"></asp:TextBox></td>

                                                        <td>&nbsp;<asp:Label ID="Label16" runat="server" Text="<%$ Resources:lang,MingCheng%>"></asp:Label>：</td>

                                                        <td>
                                                            <asp:TextBox ID="TB_AssetName" runat="server" Width="150px"></asp:TextBox></td>
                                                        <td>
                                                            <asp:Button ID="BT_Find" runat="server" CssClass="inpu" Text="<%$ Resources:lang,ChaXun%>" OnClick="BT_Find_Click" />
                                                            <input type="button" class="inpuLong" onclick="ClickBarPrintMore();" value="打印条形码" />
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                    </table>

                                    <table style="width: 100%" cellpadding="0" cellspacing="0" align="center">
                                        <tr>
                                            <td valign="top">
                                                <table style="font-size: 10pt; width: 100%" cellpadding="0" cellspacing="0">
                                                    <tr>
                                                        <td valign="top" align="center" style="padding: 5px 2px  0px 5px;">
                                                            <table width="98%" cellpadding="0" cellspacing="0">
                                                                <tr>
                                                                    <td style="width: 98%; text-align: left;" valign="top">
                                                                        <asp:Label ID="LB_AssetOwner" runat="server" Visible="false"></asp:Label>
                                                                        <asp:Label ID="LB_UserCode" runat="server" Visible="False"></asp:Label>

                                                                        <asp:Label ID="LB_ProjectID" runat="server" Visible="False"></asp:Label>
                                                                        <asp:Label ID="LB_UserName" runat="server" Visible="False"></asp:Label>

                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td style="text-align: center;" valign="top">
                                                                        <table width="100%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                                                            <tr>
                                                                                <td width="7">
                                                                                    <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" />
                                                                                </td>
                                                                                <td>
                                                                                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                                        <tr>
                                                                                            <td width="7%" align="center">
                                                                                                <strong>
                                                                                                    <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,BianHao%>"></asp:Label></strong>
                                                                                            </td>
                                                                                            <td width="7%" align="center">
                                                                                                <strong>
                                                                                                    <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,DaiMa%>"></asp:Label></strong>
                                                                                            </td>
                                                                                            <td width="7%" align="center">
                                                                                                <strong>
                                                                                                    <asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,LeiXing%>"></asp:Label></strong>
                                                                                            </td>
                                                                                            <td width="15%" align="center">
                                                                                                <strong>
                                                                                                    <asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,MingCheng%>"></asp:Label></strong>
                                                                                            </td>
                                                                                            <td width="7%" align="center">
                                                                                                <strong>
                                                                                                    <asp:Label ID="Label8" runat="server" Text="<%$ Resources:lang,ShuLiang%>"></asp:Label></strong>
                                                                                            </td>
                                                                                            <td width="7%" align="center">
                                                                                                <strong>
                                                                                                    <asp:Label ID="Label9" runat="server" Text="<%$ Resources:lang,DanJia%>"></asp:Label></strong>
                                                                                            </td>
                                                                                            <td width="7%" align="center">
                                                                                                <strong>
                                                                                                    <asp:Label ID="Label17" runat="server" Text="<%$ Resources:lang,DanWei%>"></asp:Label></strong>
                                                                                            </td>
                                                                                            <td width="9%" align="center">
                                                                                                <strong>
                                                                                                    <asp:Label ID="Label10" runat="server" Text="<%$ Resources:lang,YongHu%>"></asp:Label></strong>
                                                                                            </td>
                                                                                            <td width="11%" align="center">
                                                                                                <strong>
                                                                                                    <asp:Label ID="Label11" runat="server" Text="<%$ Resources:lang,DiZhi%>"></asp:Label></strong>
                                                                                            </td>
                                                                                            <td width="10%" align="center">
                                                                                                <strong>
                                                                                                    <asp:Label ID="Label12" runat="server" Text="<%$ Resources:lang,ShiJian%>"></asp:Label></strong>
                                                                                            </td>
                                                                                            <td width="7%" align="center">
                                                                                                <strong>
                                                                                                    <asp:Label ID="Label13" runat="server" Text="<%$ Resources:lang,TiaoPei%>"></asp:Label></strong>
                                                                                            </td>
                                                                                            <td align="center">
                                                                                                <strong>
                                                                                                    <asp:Label ID="Label14" runat="server" Text="<%$ Resources:lang,WeiHu%>"></asp:Label></strong>
                                                                                            </td>
                                                                                        </tr>
                                                                                    </table>
                                                                                </td>
                                                                                <td width="6" align="right">
                                                                                    <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" />
                                                                                </td>
                                                                            </tr>
                                                                        </table>
                                                                        <asp:DataGrid ID="DataGrid1" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                                                                            ShowHeader="false" Height="1px" OnPageIndexChanged="DataGrid1_PageIndexChanged"
                                                                            PageSize="30" Width="100%" CellPadding="4" ForeColor="#333333" GridLines="None">
                                                                            <Columns>

                                                                                <asp:TemplateColumn HeaderText="编号">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="7%" />
                                                                                    <ItemTemplate>
                                                                                        <input value='<%#Eval("ID") %>' id='<%#Eval("ID") %>' type="checkbox" name="dlCode" />
                                                                                        <asp:Label ID="Label1" runat="server" Text='<%# DataBinder.Eval(Container.DataItem,"ID") %>'></asp:Label>
                                                                                    </ItemTemplate>
                                                                                </asp:TemplateColumn>
                                                                                <asp:BoundColumn DataField="AssetCode" HeaderText="代码">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="7%" />
                                                                                </asp:BoundColumn>
                                                                                <asp:BoundColumn DataField="Type" HeaderText="类型">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="7%" />
                                                                                </asp:BoundColumn>
                                                                                <asp:HyperLinkColumn DataNavigateUrlField="ID" DataNavigateUrlFormatString="TTAssetInforView.aspx?AssetID={0}"
                                                                                    DataTextField="AssetName" HeaderText="名称" Target="_blank">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="15%" />
                                                                                </asp:HyperLinkColumn>
                                                                                <asp:BoundColumn DataField="Number" HeaderText="数量">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="7%" />
                                                                                </asp:BoundColumn>
                                                                                <asp:BoundColumn DataField="Price" HeaderText="单价">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="7%" />
                                                                                </asp:BoundColumn>
                                                                                <asp:BoundColumn DataField="UnitName" HeaderText="单位">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="7%" />
                                                                                </asp:BoundColumn>
                                                                                <asp:HyperLinkColumn DataNavigateUrlField="OwnerCode" DataNavigateUrlFormatString="TTUserInforSimple.aspx?UserCode={0}"
                                                                                    DataTextField="OwnerName" HeaderText="用户" Target="_blank">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="9%" />
                                                                                </asp:HyperLinkColumn>
                                                                                <asp:BoundColumn DataField="Position" HeaderText="地址">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="11%" />
                                                                                </asp:BoundColumn>
                                                                                <asp:BoundColumn DataField="BuyTime" HeaderText="购买时间" DataFormatString="{0:yyyy/MM/dd}">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                                </asp:BoundColumn>

                                                                                <asp:TemplateColumn HeaderText="调拨">
                                                                                    <ItemTemplate>
                                                                                        <a href='TTAssetUserRecord.aspx?ID=<%# Eval("ID").ToString() %>' target="_blank">
                                                                                            <asp:Label ID="Label13" runat="server" Text="<%$ Resources:lang,DiaoBo%>"></asp:Label>
                                                                                        </a>
                                                                                    </ItemTemplate>
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="7%" />
                                                                                </asp:TemplateColumn>

                                                                                <asp:TemplateColumn HeaderText="维护">
                                                                                    <ItemTemplate>
                                                                                        <a href='TTAssetMTRecord.aspx?ID=<%# Eval("ID").ToString() %>' target="_blank">
                                                                                            <asp:Label ID="Label13" runat="server" Text="<%$ Resources:lang,WeiHu%>"></asp:Label>
                                                                                        </a>
                                                                                    </ItemTemplate>
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" />
                                                                                </asp:TemplateColumn>


                                                                            </Columns>

                                                                            <ItemStyle CssClass="itemStyle" />
                                                                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                                            <EditItemStyle BackColor="#2461BF" />
                                                                            <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                                            <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />
                                                                        </asp:DataGrid>
                                                                        <asp:Label ID="LB_Sql" runat="server" Visible="False"></asp:Label>
                                                                        <asp:Label ID="LB_DepartString" runat="server" Visible="false"></asp:Label>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                        <td valign="top" width="170" style="padding: 5px 2px  0px 5px; border-left: solid 1px #D8D8D8">
                                                            <table cellpadding="0" cellspacing="0" style="width: 170px;">
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
                                                                                            <td align="center">
                                                                                                <strong>
                                                                                                    <asp:Label ID="Label15" runat="server" Text="<%$ Resources:lang,BuMenRenYuan%>"></asp:Label></strong>
                                                                                            </td>
                                                                                        </tr>
                                                                                    </table>
                                                                                </td>
                                                                                <td width="6" align="right">
                                                                                    <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" />
                                                                                </td>
                                                                            </tr>
                                                                        </table>
                                                                        <asp:DataGrid ID="DataGrid3" runat="server" AutoGenerateColumns="False" OnItemCommand="DataGrid3_ItemCommand"
                                                                            ShowHeader="false" Width="170px" CellPadding="4" ForeColor="#333333" GridLines="None">
                                                                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                                            <EditItemStyle BackColor="#2461BF" />
                                                                            <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                                            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />

                                                                            <ItemStyle CssClass="itemStyle" />
                                                                            <Columns>
                                                                                <asp:TemplateColumn HeaderText="部门人员：">
                                                                                    <ItemTemplate>
                                                                                        <asp:Button ID="BT_UserCode" runat="server" CssClass="inpu" Text='<%# DataBinder.Eval(Container.DataItem,"UserCode") %>' />
                                                                                        <asp:Button ID="BT_UserName" runat="server" CssClass="inpu" Text='<%# DataBinder.Eval(Container.DataItem,"UserName") %>' />
                                                                                    </ItemTemplate>
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" />
                                                                                </asp:TemplateColumn>
                                                                            </Columns>
                                                                        </asp:DataGrid>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                        <td style="width: 220px; border-left: solid 1px #D8D8D8; padding: 5px 0px 0px 5px"
                                                            valign="top" align="left">
                                                            <asp:TreeView ID="TreeView1" runat="server" NodeWrap="True" OnSelectedNodeChanged="TreeView1_SelectedNodeChanged"
                                                                ShowLines="True" Width="220px">
                                                                <RootNodeStyle CssClass="rootNode" />
                                                                <NodeStyle CssClass="treeNode" />
                                                                <LeafNodeStyle CssClass="leafNode" />
                                                                <SelectedNodeStyle CssClass="selectNode" ForeColor="Red" />
                                                            </asp:TreeView>
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
