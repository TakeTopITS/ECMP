<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTMakeStandBookInformation.aspx.cs" Inherits="TTMakeStandBookInformation" %>


<%@ Register Assembly="NickLee.Web.UI" Namespace="NickLee.Web.UI" TagPrefix="NickLee" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Assembly="Brettle.Web.NeatUpload" Namespace="Brettle.Web.NeatUpload" TagPrefix="Upload" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link id="mainCss" href="css/bluelightmain.css" rel="stylesheet" type="text/css" />


    <%-- <style type="text/css">
        #AboveDiv {
            min-width: 1400px;
            width: expression (document.body.clientWidth <= 1400? "1400px" : "auto" ));
        }
    </style>--%>

    <script src="js/jquery-1.7.2.min.js" type="text/javascript"></script>
    <script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="js/allAHandler.js"></script>
    <script type="text/javascript" src="js/layer/layer/layer.js"></script>
    <script type="text/javascript" src="js/popwindow.js"></script>
    <script type="text/javascript" language="javascript">
        $(function () {
            if (top.location != self.location) { } else { CloseWebPage(); }



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
                    <div id="AboveDiv">
                        <table cellpadding="0" cellspacing="0" width="100%" align="center" class="bian">
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
                                                            <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,BiaoZhunDangAn%>"></asp:Label>
                                                        </td>
                                                        <td width="5">
                                                            <%--<img src="ImagesSkin/main_top_r.jpg" width="5" height="31" alt="" />--%>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td align="center" style="padding: 5px 5px 5px 5px;">
                                    <table cellpadding="2" cellspacing="0" class="formBgStyle" width="100%">
                                        <tr>
                                            <td align="right" class="formItemBgStyle">
                                                <asp:Button ID="BT_Create" runat="server" Text="<%$ Resources:lang,New%>" CssClass="inpuYello" OnClick="BT_Create_Click" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="center" class="formItemBgStyle">

                                                <table cellpadding="2" cellspacing="0" class="formBgStyle" width="100%">
                                                    <tr>
                                                        <td align="center">
                                                            <asp:Label ID="Label20" runat="server" Text="<%$ Resources:lang,BiaoZhunXinXi%>"></asp:Label>：<asp:TextBox ID="TextBox2" runat="server" Width="120px"></asp:TextBox>
                                                        </td>
                                                        <td>
                                                            <asp:Button ID="BT_Query" runat="server" CssClass="inpu" OnClick="BT_Query_Click" Text="<%$ Resources:lang,ChaXun%>" />
                                                        </td>
                                                    </tr>
                                                </table>

                                                <br />

                                                <table width="100%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                                    <tr>
                                                        <td>
                                                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                <tr>
                                                                    <td width="5%" align="center">
                                                                        <strong>
                                                                            <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,BianJi %>" /></strong>
                                                                    </td>
                                                                    <td width="5%" align="center">
                                                                        <strong>
                                                                            <asp:Label ID="Label63" runat="server" Text="<%$ Resources:lang,ShanChu %>" /></strong>
                                                                    </td>
                                                                  
                                                                    <td width="8%" align="center">
                                                                        <strong>
                                                                            <asp:Label ID="LB_DGProjectID" runat="server" Text="<%$ Resources:lang,DanHao%>" /></strong>
                                                                    </td>
                                                                    <td width="10%" align="center">
                                                                        <strong>
                                                                            <asp:Label ID="Label23" runat="server" Text="<%$ Resources:lang,BiaoZhunHao%>"></asp:Label></strong>
                                                                    </td>
                                                                    <td width="13%" align="center">
                                                                        <strong>
                                                                            <asp:Label ID="Label24" runat="server" Text="<%$ Resources:lang,BiaoZhunMingCheng%>"></asp:Label></strong>
                                                                    </td>
                                                                    <td width="8%" align="center">
                                                                        <strong>
                                                                            <asp:Label ID="Label25" runat="server" Text="<%$ Resources:lang,DianZiBan%>"></asp:Label></strong>
                                                                    </td>
                                                                    <td width="7%" align="center">
                                                                        <strong>
                                                                            <asp:Label ID="Label26" runat="server" Text="<%$ Resources:lang,JianSuoHao%>"></asp:Label></strong>
                                                                    </td>
                                                                    <td width="7%" align="center">
                                                                        <strong>
                                                                            <asp:Label ID="Label27" runat="server" Text="<%$ Resources:lang,BiaoZhunFenLei%>"></asp:Label></strong>
                                                                    </td>
                                                                    <td width="7%" align="center">
                                                                        <strong>
                                                                            <asp:Label ID="Label28" runat="server" Text="<%$ Resources:lang,FenLeiMa%>"></asp:Label></strong>
                                                                    </td>
                                                                    <td width="8%" align="center">
                                                                        <strong>
                                                                            <asp:Label ID="Label29" runat="server" Text="<%$ Resources:lang,ChuBanShe%>"></asp:Label></strong>
                                                                    </td>
                                                                    <td width="8%" align="center">
                                                                        <strong>
                                                                            <asp:Label ID="Label30" runat="server" Text="<%$ Resources:lang,ShiShiRiQi%>"></asp:Label></strong>
                                                                    </td>
                                                                    <td width="8%" align="center">
                                                                        <strong>
                                                                            <asp:Label ID="Label31" runat="server" Text="<%$ Resources:lang,ShuLiang%>"></asp:Label></strong>
                                                                    </td>
                                                                    <td align="center">
                                                                        <strong>
                                                                            <asp:Label ID="Label32" runat="server" Text="<%$ Resources:lang,ZhuangTai%>"></asp:Label></strong>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                </table>
                                                <asp:DataGrid ID="DataGrid2" runat="server" AutoGenerateColumns="False" Height="1px" PageSize="25"
                                                    OnItemCommand="DataGrid2_ItemCommand" Width="100%" CellPadding="4" ForeColor="#333333"
                                                    GridLines="None" ShowHeader="false" AllowPaging="True" OnPageIndexChanged="DataGrid2_PageIndexChanged">

                                                    <ItemStyle CssClass="itemStyle" />
                                                    <HeaderStyle HorizontalAlign="Center" BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                    <Columns>
                                                        <asp:ButtonColumn ButtonType="LinkButton" CommandName="Update" Text="&lt;div&gt;&lt;img src=ImagesSkin/Update.png border=0 alt='修改' /&gt;&lt;/div&gt;">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                        </asp:ButtonColumn>
                                                        <asp:TemplateColumn HeaderText="Delete">
                                                            <ItemTemplate>
                                                                <asp:LinkButton ID="LBT_Delete" CommandName="Delete" runat="server" OnClientClick="return confirm(getDeleteMsgByLangCode())" Text="&lt;div&gt;&lt;img src=ImagesSkin/Delete.png border=0 alt='删除' /&gt;&lt;/div&gt;"></asp:LinkButton>
                                                            </ItemTemplate>
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                        </asp:TemplateColumn>
                                                        <asp:BoundColumn DataField="ID" HeaderText="ID">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                        </asp:BoundColumn>
                                                        <asp:BoundColumn DataField="BarCode" HeaderText="标准编号">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="10%" />
                                                            <HeaderStyle BorderColor="#394f66" BorderStyle="Solid" BorderWidth="1px" Font-Bold="true"
                                                                HorizontalAlign="Center" />
                                                        </asp:BoundColumn>
                                                        <asp:BoundColumn DataField="BookName" HeaderText="标准名称">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="13%" />
                                                            <HeaderStyle BorderColor="#394f66" BorderStyle="Solid" BorderWidth="1px" Font-Bold="true"
                                                                HorizontalAlign="Center" />
                                                        </asp:BoundColumn>
                                                        <asp:HyperLinkColumn DataNavigateUrlField="BookImage" DataNavigateUrlFormatString="{0}" DataTextField="BookName" HeaderText="电子版" Target="_blank">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="8%" />
                                                        </asp:HyperLinkColumn>
                                                        <asp:BoundColumn DataField="ReferenceNo" HeaderText="检索号">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="7%" />
                                                            <HeaderStyle BorderColor="#394f66" BorderStyle="Solid" BorderWidth="1px" Font-Bold="true"
                                                                HorizontalAlign="Center" />
                                                        </asp:BoundColumn>
                                                        <asp:BoundColumn DataField="BookClassificationName" HeaderText="标准分类">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="7%" />
                                                            <HeaderStyle BorderColor="#394f66" BorderStyle="Solid" BorderWidth="1px" Font-Bold="true"
                                                                HorizontalAlign="Center" />
                                                        </asp:BoundColumn>
                                                        <asp:BoundColumn DataField="ClassificationCode" HeaderText="分类码">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="7%" />
                                                            <HeaderStyle BorderColor="#394f66" BorderStyle="Solid" BorderWidth="1px" Font-Bold="true"
                                                                HorizontalAlign="Center" />
                                                        </asp:BoundColumn>
                                                        <asp:BoundColumn DataField="BookPublishersName" HeaderText="出版社">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                            <HeaderStyle BorderColor="#394f66" BorderStyle="Solid" BorderWidth="1px" Font-Bold="true"
                                                                HorizontalAlign="Center" />
                                                        </asp:BoundColumn>
                                                        <asp:BoundColumn DataField="PublicationDate" HeaderText="实施日期" DataFormatString="{0:yyyy-MM-dd}">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                            <HeaderStyle BorderColor="#394f66" BorderStyle="Solid" BorderWidth="1px" Font-Bold="true"
                                                                HorizontalAlign="Center" />
                                                        </asp:BoundColumn>
                                                        <asp:BoundColumn DataField="BookNum" HeaderText="数量">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                            <HeaderStyle BorderColor="#394f66" BorderStyle="Solid" BorderWidth="1px" Font-Bold="true"
                                                                HorizontalAlign="Center" />
                                                        </asp:BoundColumn>
                                                        <asp:TemplateColumn HeaderText="状态">
                                                            <ItemTemplate>
                                                                <%# ShareClass. GetStatusHomeNameByOtherStatus(Eval("Status").ToString()) %>
                                                            </ItemTemplate>
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="8%" />
                                                        </asp:TemplateColumn>
                                                    </Columns>
                                                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                    <EditItemStyle BackColor="#2461BF" />
                                                    <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                    <PagerStyle ForeColor="black" HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />
                                                </asp:DataGrid>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </div>


                    <asp:Panel ID="Panel1" runat="server" CssClass="modalPopup" Style="display: none;">
                        <div class="modalPopup-text" style="width: 273px; height: 400px; overflow: auto;">
                            <table>
                                <tr>
                                    <td style="width: 220px; padding: 5px 5px 5px 5px;" valign="top" align="left">
                                        <asp:TreeView ID="TreeView1" runat="server" NodeWrap="True" OnSelectedNodeChanged="TreeView1_SelectedNodeChanged"
                                            ShowLines="True" Width="220px">
                                            <RootNodeStyle CssClass="rootNode" />
                                            <NodeStyle CssClass="treeNode" />
                                            <LeafNodeStyle CssClass="leafNode" />
                                            <SelectedNodeStyle CssClass="selectNode" ForeColor="Red" />
                                        </asp:TreeView>
                                    </td>
                                    <td style="width: 60px; padding: 5px 5px 5px 5px;" valign="top" align="center">
                                        <asp:ImageButton ID="IMBT_Close" ImageUrl="ImagesSkin/Close4.jpg" runat="server" />
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </asp:Panel>

                    <asp:Label ID="LB_DepartString" runat="server" Visible="false"></asp:Label>


                    <div class="layui-layer layui-layer-iframe" id="popwindow"
                        style="z-index: 9999; width: 800px; height: 530px; position: absolute; overflow: hidden; display: none; border-radius: 10px;">
                        <div class="layui-layer-title" style="background: #e7e7e8;" id="popwindow_title">
                            <asp:Label ID="Label33" runat="server" Text="&lt;div&gt;&lt;img src=ImagesSkin/Update.png border=0 width=30px height=30px alt='BusinessForm' /&gt;&lt;/div&gt;"></asp:Label>
                        </div>
                        <div id="popwindow_content" class="layui-layer-content" style="overflow: auto; padding: 0px 5px 0px 5px;">

                            <table cellpadding="2" cellspacing="0" class="formBgStyle" width="100%">
                                <tr>
                                    <td align="right" style="width: 130px" class="formItemBgStyle">
                                        <asp:Label ID="Label14334" runat="server" Text="<%$ Resources:lang,BiaoZhunHao%>"></asp:Label>：
                                    </td>
                                    <td align="left" class="formItemBgStyle">
                                        <asp:TextBox ID="TB_BarCode" runat="server" CssClass="shuru" Width="150px"></asp:TextBox>
                                    </td>
                                    <td align="right" class="formItemBgStyle">
                                        <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,BiaoZhunMingCheng%>"></asp:Label>：
                                    </td>
                                    <td align="left" class="formItemBgStyle">
                                        <asp:TextBox ID="TB_BookName" runat="server" CssClass="shuru" Width="150px"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr style="color: #000000">
                                    <td align="right" style="height: 30px" class="formItemBgStyle">
                                        <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,JianSuoBianHao%>"></asp:Label>：
                                    </td>
                                    <td align="left" style="height: 30px" class="formItemBgStyle">
                                        <asp:TextBox ID="TB_ReferenceNo" runat="server" Width="150px" CssClass="shuru"></asp:TextBox>
                                    </td>
                                    <td align="right" class="formItemBgStyle" style="height: 30px">
                                        <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,BiaoZhunFenLei%>"></asp:Label>：</td>
                                    <td align="left" class="formItemBgStyle" style="height: 30px">
                                        <asp:DropDownList ID="DL_BookClassificationId" runat="server" AutoPostBack="True" DataTextField="ClassificationName" DataValueField="ID" OnSelectedIndexChanged="DL_BookClassificationId_SelectedIndexChanged">
                                        </asp:DropDownList>
                                        <asp:TextBox ID="TextBox1" runat="server" Width="90px"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr style="color: #000000">
                                    <td align="right" style="height: 30px" class="formItemBgStyle">
                                        <asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,ChuBanShe%>"></asp:Label>：
                                    </td>
                                    <td align="left" style="height: 30px" class="formItemBgStyle">
                                        <asp:DropDownList ID="DL_BookPublishersId" runat="server" DataTextField="PublishersName" DataValueField="ID">
                                        </asp:DropDownList>
                                    </td>
                                    <td align="right" class="formItemBgStyle" style="height: 30px">
                                        <asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,ShiShiRiQi%>"></asp:Label>：</td>
                                    <td align="left" class="formItemBgStyle" style="height: 30px">
                                        <asp:TextBox ID="DLC_PublicationDate" runat="server" ReadOnly="false"></asp:TextBox>
                                        <cc1:CalendarExtender ID="CalendarExtender2" runat="server" Format="yyyy-MM-dd" TargetControlID="DLC_PublicationDate">
                                        </cc1:CalendarExtender>
                                    </td>
                                </tr>
                                <tr style="color: #000000">
                                    <td align="right" class="formItemBgStyle" style="height: 30px">
                                        <asp:Label ID="Label8" runat="server" Text="<%$ Resources:lang,ShuLiang%>"></asp:Label>：
                                    </td>
                                    <td align="left" class="formItemBgStyle" style="height: 30px">
                                        <NickLee:NumberBox MaxAmount="1000000000000" MinAmount="-1000000000000" ID="NB_BookNum" runat="server" Width="79px" Precision="0">0</NickLee:NumberBox>
                                    </td>
                                    <td align="right" class="formItemBgStyle" style="height: 30px">
                                        <asp:Label ID="Label9" runat="server" Text="<%$ Resources:lang,JiaGe%>"></asp:Label>：&nbsp;
                                    </td>
                                    <td align="left" class="formItemBgStyle" style="height: 30px">
                                        <NickLee:NumberBox ID="NB_Price" runat="server" MaxAmount="1000000000000" MinAmount="-1000000000000" Width="79px">0.00</NickLee:NumberBox>
                                    </td>
                                </tr>
                                <tr style="color: #000000">
                                    <td align="right" class="formItemBgStyle" style="height: 30px">
                                        <asp:Label ID="Label10" runat="server" Text="<%$ Resources:lang,CunFangWeiZhi%>"></asp:Label>：
                                    </td>
                                    <td align="left" class="formItemBgStyle" style="height: 30px">
                                        <asp:TextBox ID="TB_Location" runat="server" CssClass="shuru" Width="150px"></asp:TextBox>
                                    </td>
                                    <td align="right" class="formItemBgStyle" style="height: 30px">
                                        <asp:Label ID="Label11" runat="server" Text="<%$ Resources:lang,ZhuangTai%>"></asp:Label>：
                                    </td>
                                    <td align="left" class="formItemBgStyle" style="height: 30px">
                                        <asp:DropDownList ID="DL_Status" runat="server">
                                            <asp:ListItem Value="现行" Text="<%$ Resources:lang,XianXing%>" />
                                            <asp:ListItem Value="作废" Text="<%$ Resources:lang,ZuoFei%>" />
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr style="color: #000000; display: none">
                                    <td align="right" class="formItemBgStyle" style="height: 30px">
                                        <asp:Label ID="Label12" runat="server" Text="<%$ Resources:lang,ZhuZuoZhe%>"></asp:Label>：
                                    </td>
                                    <td align="left" class="formItemBgStyle" style="height: 30px">
                                        <asp:TextBox ID="TB_Author" runat="server" CssClass="shuru" Width="150px"></asp:TextBox>
                                    </td>
                                    <td align="right" class="formItemBgStyle" style="height: 30px">
                                        <asp:Label ID="Label14" runat="server" Text="<%$ Resources:lang,YiZhe%>"></asp:Label>：
                                    </td>
                                    <td align="left" class="formItemBgStyle" style="height: 30px">
                                        <asp:TextBox ID="TB_Translator" runat="server" CssClass="shuru" Width="150px"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr style="color: #000000; display: none">
                                    <td align="right" class="formItemBgStyle" style="height: 30px">
                                        <asp:Label ID="Label13" runat="server" Text="<%$ Resources:lang,LaiYuan%>"></asp:Label>：</td>
                                    <td align="left" class="formItemBgStyle" style="height: 30px">
                                        <asp:DropDownList ID="DL_Source" runat="server">
                                            <asp:ListItem Value="购买" Text="<%$ Resources:lang,GouMai%>" />
                                            <asp:ListItem Value="捐赠" Text="<%$ Resources:lang,JuanZeng%>" />
                                        </asp:DropDownList>
                                    </td>
                                    <td align="right" class="formItemBgStyle" style="height: 30px">
                                        <asp:Label ID="Label15" runat="server" Text="<%$ Resources:lang,JuanZengZhe%>"></asp:Label>：</td>
                                    <td align="left" class="formItemBgStyle" style="height: 30px">
                                        <asp:TextBox ID="TB_Donors" runat="server" CssClass="shuru" Width="150px"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr style="color: #000000">
                                    <td align="right" class="formItemBgStyle" style="height: 30px">
                                        <asp:Label ID="Label16" runat="server" Text="<%$ Resources:lang,JianJie%>"></asp:Label>：</td>
                                    <td align="left" class="formItemBgStyle" style="height: 30px" colspan="3">
                                        <asp:TextBox ID="TB_Introduction" runat="server" CssClass="shuru" Height="49px" TextMode="MultiLine" Width="559px"></asp:TextBox>
                                        <NickLee:NumberBox ID="NB_PageNum" runat="server" MaxAmount="1000000000000" MinAmount="-1000000000000" Precision="0" Visible="False" Width="16px">0</NickLee:NumberBox>
                                        <asp:TextBox ID="TB_Version" runat="server" CssClass="shuru" Visible="False" Width="16px"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr style="color: #000000">
                                    <td align="right" class="formItemBgStyle" style="height: 30px">&nbsp;<asp:Label ID="Label17" runat="server" Text="<%$ Resources:lang,DengJiZhe%>"></asp:Label>：</td>
                                    <td align="left" class="formItemBgStyle" style="height: 30px">
                                        <asp:Label ID="lbl_CreateCode" runat="server"></asp:Label>
                                        <asp:Label ID="lbl_CreateName" runat="server"></asp:Label>
                                    </td>
                                    <td align="right" class="formItemBgStyle" style="height: 30px">
                                        <asp:Label ID="Label18" runat="server" Text="<%$ Resources:lang,GuiShuBuMen%>"></asp:Label>： </td>
                                    <td align="left" class="formItemBgStyle" style="height: 30px">
                                        <asp:TextBox ID="TB_DepartCode" runat="server" Width="80px"></asp:TextBox>
                                        <cc1:ModalPopupExtender ID="TB_DepartCode_ModalPopupExtender" runat="server" BackgroundCssClass="modalBackground" CancelControlID="IMBT_Close" Enabled="True" PopupControlID="Panel1" TargetControlID="TB_DepartCode">
                                        </cc1:ModalPopupExtender>
                                        <asp:Label ID="LB_DepartName" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr style="color: #000000">
                                    <td align="right" class="formItemBgStyle" style="height: 30px">
                                        <asp:Label ID="Label19" runat="server" Text="<%$ Resources:lang,MeiTiZhuangTai%>"></asp:Label>：</td>
                                    <td align="left" class="formItemBgStyle" style="height: 30px" colspan="3">
                                        <asp:UpdatePanel ID="UpdatePanel12" runat="server" UpdateMode="Conditional">
                                            <ContentTemplate>
                                                <div>
                                                    <Upload:InputFile ID="AttachFile" runat="server" Width="300px" Height="22px" />
                                                    <asp:HyperLink ID="HL_StandardDocURL" runat="server"></asp:HyperLink>
                                                    <br />
                                                    <asp:Button ID="BtnUP" runat="server" OnClick="BtnUP_Click" Text="<%$ Resources:lang,ShangChuan%>" />
                                                    <br />
                                                    <div id="ProgressBar">
                                                        <Upload:ProgressBar ID="ProgressBar1" runat='server' Width="500px" Height="100px">
                                                        </Upload:ProgressBar>
                                                    </div>
                                                </div>
                                            </ContentTemplate>
                                            <Triggers>
                                                <asp:PostBackTrigger ControlID="BtnUP" />
                                            </Triggers>
                                        </asp:UpdatePanel>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" colspan="4" class="formItemBgStyle"></td>

                                    <asp:Label ID="lbl_ID" runat="server" Visible="False"></asp:Label>
                                </tr>
                                <caption>
                                    &nbsp;
                                    <asp:Label ID="lbl_sql" runat="server" Visible="False"></asp:Label>
                                    </td>
                                    </tr>
                                </caption>
                            </table>

                        </div>

                        <div id="popwindow_footer" class="layui-layer-btn" style="border-top: 1px solid #ccc;">
                            <asp:LinkButton ID="BT_New" runat="server" class="layui-layer-btn notTab" OnClick="BT_New_Click" Text="<%$ Resources:lang,BaoCun%>"></asp:LinkButton><a class="layui-layer-btn notTab" onclick="return popClose();"><asp:Label ID="Label34" runat="server" Text="<%$ Resources:lang,GuanBi%>" /></a>
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
