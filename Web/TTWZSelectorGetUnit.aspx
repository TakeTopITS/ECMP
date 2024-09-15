<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTWZSelectorGetUnit.aspx.cs" Inherits="TTWZSelectorGetUnit" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>领料单位</title>
    <link id="mainCss" href="css/bluelightmain.css" rel="stylesheet" type="text/css" />
    <script src="js/jquery-1.7.2.min.js"></script>
    <script src="js/allAHandler.js" type="text/javascript"></script>
    <script type="text/jscript">

        //单选择按钮判断
        function chooseUpdate() {
            var str = "";
            $("input[name=name1]").each(function () {
                if (this.checked) {
                    str = $(this).attr("id");
                }
            });

            if (str == "") {
                alert('请选择记录项！');
                return false;
            }
            else {
                clickMember(str);
            }
        }

        function clickMember(resultList) {

            if (resultList != "" && resultList != undefined) {
                var arrResult = resultList.split('|');


                window.parent.document.getElementById("TXT_PickingUnit").value = arrResult[1];
                window.parent.document.getElementById("TXT_UnitCode").value = arrResult[0];

                //$("#TXT_PickingUnit").val(arrResult[1]);
                //$("#TXT_UnitCode").val(arrResult[0]);

                var arrDelegate = arrResult[2].split(',');
                window.parent.document.getElementById("TXT_DelegateAgent").value = arrDelegate[1];
                window.parent.document.getElementById("HF_DelegateAgent").value = arrDelegate[0];

                //$("#TXT_DelegateAgent").val(arrDelegate[1]);
                //$("#HF_DelegateAgent").val(arrDelegate[0]);

                var arrFee = arrResult[3].split(',');
                window.parent.document.getElementById("TXT_FeeManage").value = arrFee[1];
                window.parent.document.getElementById("HF_FeeManage").value = arrFee[0];

                //$("#TXT_FeeManage").val(arrFee[1]);
                //$("#HF_FeeManage").val(arrFee[0]);
            }

            CloseLayer();
        }
    </script>
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
                                                    <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,LingLiaoDanWei%>"></asp:Label>
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
                                                <td class="formItemBgStyle" width="100%">
                                                    <div>
                                                        <table width="100%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                                            <tr>
                                                                <td width="7">
                                                                    <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" />
                                                                </td>
                                                                <td>
                                                                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                        <tr>
                                                                            <td width="4%" align="center">
                                                                                <strong>
                                                                                    <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,CaoZuo%>"></asp:Label></strong>
                                                                            </td>
                                                                            <td width="15%" align="center">
                                                                                <strong>
                                                                                    <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,DanWeiBianHao%>"></asp:Label></strong>
                                                                            </td>
                                                                            <td width="15%" align="left">
                                                                                <strong>
                                                                                    <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,LingLiaoDanWei%>"></asp:Label></strong>
                                                                            </td>
                                                                            <td width="15%" align="center">
                                                                                <strong>
                                                                                    <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,ZhuGuanLingDao%>"></asp:Label></strong>
                                                                            </td>
                                                                            <td width="15%" align="center">
                                                                                <strong>
                                                                                    <asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,WeiTuoDaiLiRen%>"></asp:Label></strong>
                                                                            </td>
                                                                            <td width="15%" align="center">
                                                                                <strong>
                                                                                    <asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,FeiKongZhuGuan%>"></asp:Label></strong>
                                                                            </td>
                                                                            <td width="21%" align="center">
                                                                                <strong>
                                                                                    <asp:Label ID="Label8" runat="server" Text="<%$ Resources:lang,CaiLiaoYuan%>"></asp:Label></strong>
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
                                                            Width="100%">
                                                            <Columns>
                                                                <asp:TemplateColumn>
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="4%" />
                                                                    <HeaderTemplate>
                                                                        &nbsp;
                                                                    </HeaderTemplate>
                                                                    <ItemTemplate>
                                                                        <input id='<%#Eval("UnitCode") %>|<%#Eval("UnitName") %>|<%#Eval("DelegateAgent") %>,<%#Eval("DelegateAgentName") %>|<%#Eval("FeeManage") %>,<%#Eval("FeeManageName") %>' type="radio" name="name1" />
                                                                    </ItemTemplate>
                                                                </asp:TemplateColumn>
                                                                <asp:BoundColumn DataField="UnitCode" HeaderText="单位编号">
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="15%" />
                                                                </asp:BoundColumn>
                                                                <%--<asp:BoundColumn DataField="UnitName" HeaderText="领料单位">
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="15%" />
                                                                </asp:BoundColumn>--%>
                                                                <asp:TemplateColumn>
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="15%" />
                                                                    <HeaderTemplate>
                                                                        <asp:Label ID="Label9" runat="server" Text="<%$ Resources:lang,LingLiaoDanWei%>"></asp:Label>
                                                                    </HeaderTemplate>
                                                                    <ItemTemplate>
                                                                        <%# ShareClass.StringCutByRequire(Eval("UnitName").ToString(), 190) %>
                                                                    </ItemTemplate>
                                                                </asp:TemplateColumn>
                                                                <asp:BoundColumn DataField="LeaderName" HeaderText="主管领导">
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="15%" />
                                                                </asp:BoundColumn>
                                                                <asp:BoundColumn DataField="DelegateAgentName" HeaderText="委托代理人">
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="15%" />
                                                                </asp:BoundColumn>
                                                                <asp:BoundColumn DataField="FeeManageName" HeaderText="费控主管">
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="15%" />
                                                                </asp:BoundColumn>
                                                                <asp:BoundColumn DataField="MaterialPersonName" HeaderText="材料员">
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="21%" />
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
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="formItemBgStyle">
                                                    <div style="text-align: center">
                                                        <input id="btnOk" class="inpu" onclick="return chooseUpdate()" type="button" value="确定" />
                                                        &nbsp;&nbsp;&nbsp;&nbsp;
                                                        <input id="btnClose()" class="inpu" onclick="window.returnValue = false;CloseLayer();"
                                                            type="button" value="关闭" />
                                                    </div>
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
    </form>
</body>
<script type="text/javascript" language="javascript">var cssDirectory = '<%=Session["CssDirectory"] %>'; var oLink = document.getElementById('mainCss'); oLink.href = 'css/' + cssDirectory + '/' + 'bluelightmain.css';</script></html>
