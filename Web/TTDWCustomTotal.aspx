<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTDWCustomTotal.aspx.cs" Inherits="TTDWCustomTotal" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>客户价值统计数据</title>
    <link id="mainCss" href="css/bluelightmain.css" rel="stylesheet" type="text/css" />
    <script src="js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript">
        function manageOption() {
            var $nowOpton_Obj = $(".manageOption li");
            $nowOpton_Obj.eq(0).click(function () {
                $("#TotalManage").show();
                $("#HistoryManage").hide();
                $nowOpton_Obj.removeClass("nowOpton");
                $(this).addClass("nowOpton");
            });
            $nowOpton_Obj.eq(1).click(function () {
                $("#TotalManage").hide();
                $("#HistoryManage").show();
                $nowOpton_Obj.removeClass("nowOpton");
                $(this).addClass("nowOpton");
            });

        };

        function clickTotal() {
            $("#TotalManage").show();
            $("#HistoryManage").hide();
            $(".manageOption li").removeClass("nowOpton");
            $($(".manageOption li").eq(0)).addClass("nowOpton");
        }

        function clickDetail() {
            $("#TotalManage").hide();
            $("#HistoryManage").show();
            $(".manageOption li").removeClass("nowOpton");
            $($(".manageOption li").eq(1)).addClass("nowOpton");
        }


        $(function () { 
            manageOption();


        });
    </script>
    <script language="JavaScript">
        var axu_url800x600 = "1.css"; //设置变量axu_url800x600 样式：1.cssvar axu_url1280x1024="2.css"; //设置变量axu_url1024x768 样式：2.cssif((screen.width==800)&&(screen.height==600)) document.getElementById("skin").href=axu_url800x600; //判断分辨率是800x600调用1.csselse if((screen.width==1280)&&(screen.height==1024)) document.getElementById("skin").href=axu_url1280x1024; //判断分辨率是1024x768调用2.csselse document.getElementById("skin").href=axu_url1280x1024; //否则 调用2.css</script>
    <style type="text/css">
        .manageOption {
            width: 340px;
            height: 30px;
            margin-top: 10px;
            background-position: 0px 29px;
            overflow: hidden;
            opacity: 0.4;
            filter: alpha(opacity=40);
        }


            .manageOption li {
                float: left;
                border: 1px solid #ccc;
                border-bottom: none;
                border-radius: 3px 3px 0 0;
                height: 22px;
                padding: 0 10px;
                margin: 6px 0 0 5px;
                cursor: pointer;
                color: #333;
                line-height: 22px;
                list-style: none;
            }

                .manageOption li.nowOpton {
                    border: 1px solid #248eca;
                    border-bottom: none;
                    font-weight: bold;
                    color: #000;
                    background: #fafafa;
                    margin: 4px 0 0 5px;
                    height: 25px;
                }


        /*中间栏，宽度auto www.codefans.net */
        .wrap_m {
            width: auto;
            /*background: #00FF00;*/
            margin: 0 0px 0 0px;
            border: 1px solid #000;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
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
                                                    <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,KeHuJiaZhiTongJi%>"></asp:Label>
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
                            <ul class="manageOption">
                                <li class="nowOpton">
                                    <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,KeHuJiaZhiBiaoHuiZong%>"></asp:Label></li>
                                <li>
                                    <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,KeHuJiaZhiBiaoXiangXiShuJu%>"></asp:Label></li>
                            </ul>
                            <div id="TotalManage">
                                <table width="100%" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td valign="top" style="padding-top: 5px;">
                                            <table style="width: 80%;" cellpadding="2" cellspacing="0" class="formBgStyle">
                                                <tr>
                                                    <td class="formItemBgStyle" width="100%">
                                                        <table class="formBgStyle">
                                                            <tr>
                                                                <td class="formItemBgStyle">&nbsp;<asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,Nian%>"></asp:Label>：<asp:DropDownList ID="DDL_TYear" runat="server"></asp:DropDownList>
                                                                </td>
                                                                <td class="formItemBgStyle">
                                                                    <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,KeHuMingCheng%>"></asp:Label>：<asp:TextBox ID="TXT_TCustomeName" runat="server"></asp:TextBox> 
                                                                    <asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,HuoZhe%>"></asp:Label>
                                                                    <asp:DropDownList ID="DDL_TCustomeName" runat="server" DataTextField="CustomName" DataValueField="CustomName"></asp:DropDownList>
                                                                </td>
                                                                <td>
                                                                    <asp:Button ID="BT_TSeach" runat="server" Text="<%$ Resources:lang,ChaXun%>" CssClass="inpu" OnClick="BT_TSeach_Click" />
                                                                    <asp:Button ID="BT_TExport" runat="server" Text="<%$ Resources:lang,DaoChu%>" CssClass="inpu" OnClick="BT_TExport_Click" />
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr style="font-size: 12pt">
                                        <td class="formItemBgStyle" width="100%">
                                            <div style="width: 100%; height: 100%; overflow: auto;">
                                                <table cellpadding="2" cellspacing="0" class="formBgStyle" style="width: 100%;">
                                                    <tr>
                                                        <td class="formItemBgStyle" width="100%" style="overflow: auto;">
                                                            <div class="wrap_m">

                                                                <div style="width: 100%; height: 100%; overflow-x: auto;">
                                                                    <asp:DataGrid ID="DG_Total" runat="server" AllowPaging="true" AutoGenerateColumns="False" CellPadding="4"
                                                                        ForeColor="#333333" GridLines="None" Height="1px" PageSize="20" ShowHeader="True"
                                                                        OnItemDataBound="DG_Total_ItemDataBound" Width="100%" OnPageIndexChanged="DG_Total_PageIndexChanged">
                                                                        <Columns>
                                                                            <asp:BoundColumn DataField="CustomName" HeaderText="客户名称">
                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" />
                                                                            </asp:BoundColumn>
                                                                            <asp:BoundColumn DataField="MonthTotal1" HeaderText="1月价值">
                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" />
                                                                            </asp:BoundColumn>
                                                                            <asp:BoundColumn DataField="MonthTotal2" HeaderText="2月价值">
                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" />
                                                                            </asp:BoundColumn>
                                                                            <asp:BoundColumn DataField="MonthTotal3" HeaderText="3月价值">
                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" />
                                                                            </asp:BoundColumn>
                                                                            <asp:BoundColumn DataField="MonthTotal4" HeaderText="4月价值">
                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" />
                                                                            </asp:BoundColumn>
                                                                            <asp:BoundColumn DataField="MonthTotal5" HeaderText="5月价值">
                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" />
                                                                            </asp:BoundColumn>
                                                                            <asp:BoundColumn DataField="MonthTotal6" HeaderText="6月价值">
                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" />
                                                                            </asp:BoundColumn>
                                                                            <asp:BoundColumn DataField="MonthTotal7" HeaderText="7月价值">
                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" />
                                                                            </asp:BoundColumn>
                                                                            <asp:BoundColumn DataField="MonthTotal8" HeaderText="8月价值">
                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" />
                                                                            </asp:BoundColumn>
                                                                            <asp:BoundColumn DataField="MonthTotal9" HeaderText="9月价值">
                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" />
                                                                            </asp:BoundColumn>
                                                                            <asp:BoundColumn DataField="MonthTotal10" HeaderText="10月价值">
                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" />
                                                                            </asp:BoundColumn>
                                                                            <asp:BoundColumn DataField="MonthTotal11" HeaderText="11月价值">
                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" />
                                                                            </asp:BoundColumn>
                                                                            <asp:BoundColumn DataField="MonthTotal12" HeaderText="12月价值">
                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" />
                                                                            </asp:BoundColumn>
                                                                            <asp:TemplateColumn>
                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                                                <HeaderTemplate>
                                                                                    <asp:Label ID="Label11" runat="server" Text="<%$ Resources:lang,HuiZong%>"></asp:Label>
                                                                                </HeaderTemplate>
                                                                                <ItemTemplate>
                                                                                    <asp:Label ID="LB_ShowTotal" runat="server" Text="<%$ Resources:lang,Ling%>"></asp:Label>
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
                                                                </div>
                                                                <asp:Label ID="LB_TotalSql" runat="server" Visible="False"></asp:Label>

                                                            </div>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </div>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                            <div id="HistoryManage" style="display: none;">
                                <table width="100%" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td valign="top" style="padding-top: 5px;">
                                            <table style="width: 80%;" cellpadding="2" cellspacing="0" class="formBgStyle">
                                                <tr style="font-size: 12pt">
                                                    <td class="formItemBgStyle" width="100%">
                                                        <table class="formBgStyle">
                                                            <tr>
                                                                <td class="formItemBgStyle">
                                                                    <asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,Nian%>"></asp:Label>：<asp:DropDownList ID="DDL_Year" runat="server"></asp:DropDownList>&nbsp;
                                                                        <asp:Label ID="Label8" runat="server" Text="<%$ Resources:lang,Yue%>"></asp:Label>：<asp:DropDownList ID="DDL_Month" runat="server"></asp:DropDownList>&nbsp;
                                                                </td>
                                                                <td class="formItemBgStyle">
                                                                    <asp:Label ID="Label9" runat="server" Text="<%$ Resources:lang,KeHuMingCheng%>"></asp:Label>：<asp:TextBox ID="TXT_CustomName" runat="server"></asp:TextBox>
                                                                    <asp:Label ID="Label10" runat="server" Text="<%$ Resources:lang,HuoZhe%>"></asp:Label>
                                                                    <asp:DropDownList ID="DDL_CustomName" runat="server" DataTextField="CustomName" DataValueField="CustomName"></asp:DropDownList>
                                                                </td>
                                                                <td>
                                                                    <asp:Button ID="BT_Seach" runat="server" Text="<%$ Resources:lang,ChaXun%>" CssClass="inpu" OnClick="BT_Seach_Click" />
                                                                    <asp:Button ID="BT_Export" runat="server" Text="<%$ Resources:lang,DaoChu%>" CssClass="inpu" OnClick="BT_Export_Click" />
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr style="font-size: 12pt">
                                        <td class="formItemBgStyle" width="100%">
                                            <table cellpadding="2" cellspacing="0" class="formBgStyle" style="width: 100%;">
                                                <tr style="font-size: 12pt">
                                                    <td class="formItemBgStyle" width="100%">
                                                        <div style="width: auto; height: auto;">
                                                            <div style="width: 2200px; overflow-x: auto;">
                                                                <asp:DataGrid ID="DG_CustomValue" runat="server" AllowPaging="false" AutoGenerateColumns="False" CellPadding="4"
                                                                    ForeColor="#333333" GridLines="None" Height="1px" PageSize="10" ShowHeader="True" Width="100%" OnPageIndexChanged="DG_CustomValue_PageIndexChanged">
                                                                    <Columns>
                                                                        <asp:BoundColumn DataField="CustomName" HeaderText="客户名称">
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" />
                                                                        </asp:BoundColumn>
                                                                        <asp:BoundColumn DataField="ProductCode" HeaderText="产品编号">
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" />
                                                                        </asp:BoundColumn>
                                                                        <asp:BoundColumn DataField="ProductType" HeaderText="类别">
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" />
                                                                        </asp:BoundColumn>
                                                                        <%--<asp:BoundColumn DataField="SaleTime" HeaderText="日期">
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" />
                                                                        </asp:BoundColumn>--%>
                                                                        <asp:TemplateColumn HeaderText="日期">
                                                                            <ItemStyle HorizontalAlign="Center" />
                                                                            <ItemTemplate>
                                                                                <%#DataBinder.Eval(Container.DataItem, "SaleTime", "{0:yyyy/MM/dd}")%>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateColumn>
                                                                        <asp:BoundColumn DataField="SaleNumber" HeaderText="销售数量">
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" />
                                                                        </asp:BoundColumn>
                                                                        <asp:BoundColumn DataField="SalePrice" HeaderText="销售单价">
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" />
                                                                        </asp:BoundColumn>
                                                                        <asp:BoundColumn DataField="SaleMoney" HeaderText="销售金额">
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" />
                                                                        </asp:BoundColumn>
                                                                        <asp:BoundColumn DataField="ProductCost" HeaderText="产品成本">
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" />
                                                                        </asp:BoundColumn>
                                                                        <asp:BoundColumn DataField="MakeCost" HeaderText="制造费用">
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" />
                                                                        </asp:BoundColumn>
                                                                        <asp:BoundColumn DataField="TonCost" HeaderText="吨耗">
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" />
                                                                        </asp:BoundColumn>
                                                                        <asp:BoundColumn DataField="PickCost" HeaderText="包装费用">
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" />
                                                                        </asp:BoundColumn>
                                                                        <asp:BoundColumn DataField="QualityCost" HeaderText="质量损失">
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" />
                                                                        </asp:BoundColumn>
                                                                        <asp:BoundColumn DataField="TransportCost" HeaderText="运输费用月结">
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" />
                                                                        </asp:BoundColumn>
                                                                        <asp:BoundColumn DataField="AccountCost" HeaderText="财务费用月结">
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" />
                                                                        </asp:BoundColumn>
                                                                        <asp:BoundColumn DataField="ServeCost" HeaderText="招待费用">
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" />
                                                                        </asp:BoundColumn>
                                                                        <asp:BoundColumn DataField="TravelCost" HeaderText="差旅费">
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" />
                                                                        </asp:BoundColumn>
                                                                        <asp:BoundColumn DataField="Applyer" HeaderText="报销人员">
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" />
                                                                        </asp:BoundColumn>
                                                                        <asp:BoundColumn DataField="SurplusValue" HeaderText="剩余价值">
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" />
                                                                        </asp:BoundColumn>
                                                                    </Columns>
                                                                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                                    <EditItemStyle BackColor="#2461BF" />
                                                                    <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                                    <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />
                                                                    
                                                                    <ItemStyle CssClass="itemStyle" />
                                                                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" HorizontalAlign="Center" />
                                                                </asp:DataGrid>
                                                            </div>
                                                            <asp:Label ID="LB_CustomValueSql" runat="server" Visible="False"></asp:Label>
                                                        </div>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                </table>
                            </div>

                        </td>
                    </tr>
                </table>
            </div>
        </div>
    </form>
</body>
<script type="text/javascript" language="javascript">var cssDirectory = '<%=Session["CssDirectory"] %>'; var oLink = document.getElementById('mainCss'); oLink.href = 'css/' + cssDirectory + '/' + 'bluelightmain.css';</script></html>
