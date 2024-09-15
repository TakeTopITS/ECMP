<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTBMAnnInvitationSupplier.aspx.cs" Inherits="TTBMAnnInvitationSupplier" %>

<%@ Register Assembly="NickLee.Web.UI" Namespace="NickLee.Web.UI" TagPrefix="NickLee" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Assembly="Brettle.Web.NeatUpload" Namespace="Brettle.Web.NeatUpload" TagPrefix="Upload" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link id="mainCss" href="css/bluelightmain.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .auto-style1 {
            background-color: #F6FAFD;
            background-repeat: no-repeat;
            width: 20%;
        }

        .auto-style2 {
            background-color: #F6FAFD;
            background-repeat: no-repeat;
            height: 30px;
            width: 112px;
        }

        .auto-style5 {
            background-color: #F6FAFD;
            background-repeat: no-repeat;
            width: 30%;
        }

        .auto-style6 {
            background-color: #F6FAFD;
            background-repeat: no-repeat;
            height: 30px;
            width: 221px;
        }

        .auto-style7 {
            background-color: #F6FAFD;
            background-repeat: no-repeat;
            width: 10%;
        }

        .auto-style8 {
            background-color: #F6FAFD;
            background-repeat: no-repeat;
            height: 30px;
            width: 79px;
        }

        .auto-style9 {
            background-color: #F6FAFD;
            background-repeat: no-repeat;
            width: 38%;
        }

        .auto-style10 {
            background-color: #F6FAFD;
            background-repeat: no-repeat;
            height: 30px;
            width: 152px;
        }
    </style>
    <script src="js/jquery-1.7.2.min.js" type="text/javascript"></script>
    <script src="js/allAHandler.js" type="text/javascript"></script>
    <script language="javascript" type="text/javascript">
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
                                <td height="31" class="page_topbj" colspan="2">
                                    <table width="96%" border="0" align="center" cellpadding="0" cellspacing="0">
                                        <tr>
                                            <td align="left">
                                                <table width="345" border="0" align="left" cellpadding="0" cellspacing="0">
                                                    <tr>
                                                        <td width="29">
                                                            <%--<img src="Logo/main_top_l.jpg" alt="" width="29" height="31" />--%>
                                                        </td>
                                                        <td align="center" background="ImagesSkin/main_top_bj.jpg" class="titlezi">
                                                            <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,TouBiaoGuanLi%>"></asp:Label>
                                                        </td>
                                                        <td width="5">
                                                            <%--<img src="ImagesSkin/main_top_r.jpg" width="5" height="31" alt="" />--%>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                            <td align="left"></td>
                                            <td align="center" width="100px">
                                                <asp:HyperLink ID="HyperLink1" NavigateUrl="TTBMSupplierInfoModify.aspx" Target="rightFrame"
                                                    Text="<%$ Resources:lang,QiYeXinXi%>" runat="server"></asp:HyperLink>
                                            </td>
                                            <td align="center" width="100px">
                                                <asp:HyperLink ID="HyperLink3" NavigateUrl="TTBMAnnClaFileSupplier.aspx"
                                                    Text="澄清信息回函" runat="server"></asp:HyperLink>
                                            </td>
                                            <td align="center" width="100px">
                                                <asp:HyperLink ID="HyperLink4" NavigateUrl="TTBMSupplierResult.aspx"
                                                    Text="<%$ Resources:lang,TouBiaoXinXiChaXun%>" runat="server"></asp:HyperLink>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td align="center" style="padding-top: 5px; width: 50%">
                                    <table cellpadding="2" cellspacing="0" class="formBgStyle" width="98%">
                                        <tr>
                                            <td align="right" class="auto-style1">
                                                <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,ZhaoBiaoYaoQingHan%>"></asp:Label>：
                                            </td>
                                            <td align="left" class="auto-style5">
                                                <asp:TextBox ID="TB_Name" runat="server" CssClass="shuru" Enabled="False" Width="150px"></asp:TextBox>
                                            </td>
                                            <td align="right" class="auto-style7">
                                                <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,ZhaoBiaoFangShi%>"></asp:Label>：
                                            </td>
                                            <td align="left" class="auto-style9">
                                                <asp:TextBox ID="TB_BidWay" runat="server" CssClass="shuru" Enabled="False"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right" class="auto-style1">
                                                <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,ZhaoBiaoWenJian%>"></asp:Label>：</td>
                                            <td align="left" class="auto-style5" colspan="3">
                                                <asp:Repeater ID="RP_BMBidFiles" runat="server">
                                                    <ItemTemplate>
                                                        <a href='<%# DataBinder.Eval(Container.DataItem,"FilePath") %>' target="_blank">
                                                            <%# DataBinder.Eval(Container.DataItem,"FileName") %>
                                                        </a>
                                                    </ItemTemplate>
                                                </asp:Repeater>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right" class="auto-style1">
                                                <asp:Label ID="Label22" runat="server" Text="投标模板文件"></asp:Label>：</td>
                                            <td align="left" class="auto-style5" colspan="3">
                                                <asp:Repeater ID="RP_BMBidTemplateFile" runat="server">
                                                    <ItemTemplate>
                                                        <a href='<%# DataBinder.Eval(Container.DataItem,"FilePath") %>' target="_blank">
                                                            <%# DataBinder.Eval(Container.DataItem,"FileName") %>
                                                        </a>
                                                    </ItemTemplate>
                                                </asp:Repeater>
                                            </td>
                                        </tr>
                                        <tr style="color: #000000">
                                            <td align="right" class="auto-style2">
                                                <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,BianZhiBuMen%>"></asp:Label>：</td>
                                            <td align="left" class="auto-style6">
                                                <asp:TextBox ID="TB_EnterUnit" runat="server" CssClass="shuru" Enabled="False"></asp:TextBox>
                                            </td>
                                            <td align="right" class="auto-style8">
                                                <asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,BianZhiRiQi%>"></asp:Label>：</td>
                                            <td align="left" class="auto-style10">
                                                <asp:TextBox ID="DLC_EnterDate" runat="server" CssClass="shuru" Enabled="False" ReadOnly="false"></asp:TextBox>
                                                <cc1:CalendarExtender ID="CalendarExtender3" runat="server" Format="yyyy-MM-dd" TargetControlID="DLC_EnterDate">
                                                </cc1:CalendarExtender>
                                            </td>
                                        </tr>
                                        <tr style="color: #000000">
                                            <td align="right" class="auto-style2">
                                                <asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,KaiShiRiQi%>"></asp:Label>：</td>
                                            <td align="left" class="auto-style6">
                                                <asp:Label ID="lbl_StartTime" runat="server"></asp:Label>
                                            </td>
                                            <td align="right" class="auto-style8">
                                                <asp:Label ID="Label8" runat="server" Text="<%$ Resources:lang,JieShuRiQi%>"></asp:Label>：</td>
                                            <td align="left" class="auto-style10">
                                                <asp:Label ID="lbl_EndTime" runat="server"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr style="color: #000000">
                                            <td align="right" class="auto-style2">
                                                <asp:Label ID="Label9" runat="server" Text="<%$ Resources:lang,YaoQingHanNeiRong%>"></asp:Label>： </td>
                                            <td align="left" class="formItemBgStyle" style="height: 30px" colspan="3">
                                                <asp:TextBox ID="TB_Remark" runat="server" CssClass="shuru" Height="40px" TextMode="MultiLine" Width="90%" Enabled="False"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr style="color: #000000">
                                            <td align="right" class="auto-style2">
                                                <asp:Label ID="Label10" runat="server" Text="<%$ Resources:lang,TouBiaoNeiRong%>"></asp:Label>：</td>
                                            <td align="left" class="formItemBgStyle" colspan="3" style="height: 30px">
                                                <asp:TextBox ID="TB_BiddingContent" runat="server" CssClass="shuru" Height="40px" TextMode="MultiLine" Width="90%"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right" class="auto-style1">
                                                <asp:Label ID="lbl_BMSupplierBidID" runat="server" Visible="False"></asp:Label>
                                            </td>
                                            <td align="left" class="formItemBgStyle" colspan="3" style="height: 30px">
                                                <asp:Button ID="BT_Update" runat="server" OnClick="BT_Update_Click" CssClass="inpu" Text="<%$ Resources:lang,BaoCun%>"  />
                                                <asp:Button ID="BT_Add" runat="server" OnClick="BT_Add_Click" CssClass="inpu" Text="<%$ Resources:lang,XinZeng%>" Visible="False"/>
                                                <asp:Button ID="BT_Delete" runat="server" CssClass="inpu" Visible="False" OnClick="BT_Delete_Click" OnClientClick="return confirm(getDeleteMsgByLangCode())" Text="<%$ Resources:lang,ShanChu%>" />
                                                <asp:Label ID="lbl_sql" runat="server" Visible="False"></asp:Label>
                                                <asp:Label ID="LB_ID" runat="server" CssClass="shuru" Enabled="False" Visible="False"></asp:Label>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                                <td align="center" style="padding-top: 5px; width: 50%;">
                                    <table cellpadding="2" cellspacing="0" class="formBgStyle" width="98%">
                                        <tr>
                                            <td align="center">
                                                <asp:Label ID="Label16" runat="server" Text="<%$ Resources:lang,ZhaoBiaoXinXi%>"></asp:Label>：<asp:TextBox ID="TextBox1" runat="server" Width="120px"></asp:TextBox>
                                                &nbsp;
                                            <asp:Label ID="Label17" runat="server" Text="<%$ Resources:lang,ZhaoBiaoRiQi%>"></asp:Label>：<asp:TextBox ID="TextBox3" runat="server" ReadOnly="false" Width="80px"></asp:TextBox>
                                                <cc1:CalendarExtender ID="CalendarExtender5" runat="server" Format="yyyy-MM-dd" TargetControlID="TextBox3">
                                                </cc1:CalendarExtender>
                                                至<asp:TextBox ID="TextBox4" runat="server" ReadOnly="false" Width="80px"></asp:TextBox>
                                                <cc1:CalendarExtender ID="CalendarExtender6" runat="server" Format="yyyy-MM-dd" TargetControlID="TextBox4">
                                                </cc1:CalendarExtender>
                                                <asp:Button ID="BT_Query" runat="server" CssClass="inpu" OnClick="BT_Query_Click" Text="<%$ Resources:lang,ChaXun%>" />
                                            </td>
                                        </tr>
                                    </table>
                                    <table cellpadding="2" cellspacing="0" class="formBgStyle" width="100%">
                                        <tr>
                                            <td style="text-align: left" class="formItemBgStyle">&nbsp;<asp:Label ID="Label18" runat="server" Text="<%$ Resources:lang,ZhaoBiaoXinXi%>"></asp:Label>：</td>
                                        </tr>
                                        <tr>
                                            <td align="center" class="formItemBgStyle" colspan="3">
                                                <table width="100%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                                    <tr>
                                                        <td>
                                                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                <tr>
                                                                    <td width="15%" align="center">
                                                                        <strong>
                                                                            <asp:Label ID="Label19" runat="server" Text="<%$ Resources:lang,BianHao%>"></asp:Label></strong>
                                                                    </td>
                                                                    <td width="30%" align="center">
                                                                        <strong>
                                                                            <asp:Label ID="Label20" runat="server" Text="<%$ Resources:lang,MingCheng%>"></asp:Label></strong>
                                                                    </td>
                                                                    <%--   <td width="15%" align="center">
                                                                    <strong><asp:Label runat="server" Text="<%$ Resources:lang,ZhaoBiaoFangShi%>"></asp:Label></strong>
                                                                </td>
                                                                <td width="15%" align="center">
                                                                    <strong><asp:Label runat="server" Text="<%$ Resources:lang,BianZhiRiQi%>"></asp:Label></strong>
                                                                </td>--%>
                                                                    <td align="center">
                                                                        <strong>
                                                                            <asp:Label ID="Label21" runat="server" Text="<%$ Resources:lang,ZhaoBiaoNeiRong%>"></asp:Label></strong>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                </table>
                                                <asp:DataGrid ID="DataGrid2" runat="server" AutoGenerateColumns="False" Height="1px"
                                                    OnItemCommand="DataGrid2_ItemCommand" Width="100%" CellPadding="4" ForeColor="#333333"
                                                    GridLines="None" ShowHeader="false" AllowPaging="true" PageSize="25" OnPageIndexChanged="DataGrid2_PageIndexChanged">

                                                    <ItemStyle CssClass="itemStyle" />
                                                    <HeaderStyle HorizontalAlign="Center" BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                    <Columns>
                                                        <asp:TemplateColumn HeaderText="编号">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="15%" />
                                                            <ItemTemplate>
                                                                <asp:Button ID="BT_ID" runat="server" CssClass="inpu" Text='<%# DataBinder.Eval(Container.DataItem,"ID") %>' />
                                                            </ItemTemplate>
                                                            <HeaderStyle BorderColor="#394f66" BorderStyle="Solid" BorderWidth="1px" Font-Bold="true"
                                                                HorizontalAlign="Center" />
                                                        </asp:TemplateColumn>
                                                        <asp:BoundColumn DataField="Name" HeaderText="名称">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="30%" />
                                                            <HeaderStyle BorderColor="#394f66" BorderStyle="Solid" BorderWidth="1px" Font-Bold="true"
                                                                HorizontalAlign="Center" />
                                                        </asp:BoundColumn>
                                                        <%--        <asp:BoundColumn DataField="BidWay" HeaderText="招标方式">
                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="15%" />
                                                        <HeaderStyle BorderColor="#394f66" BorderStyle="Solid" BorderWidth="1px" Font-Bold="true"
                                                            HorizontalAlign="Center" />
                                                    </asp:BoundColumn>
                                                    <asp:BoundColumn DataField="EnterDate" HeaderText="编制日期" DataFormatString="{0:yyyy-MM-dd}">
                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="15%" />
                                                        <HeaderStyle BorderColor="#394f66" BorderStyle="Solid" BorderWidth="1px" Font-Bold="true"
                                                            HorizontalAlign="Center" />
                                                    </asp:BoundColumn>--%>
                                                        <asp:BoundColumn DataField="Remark" HeaderText="招标内容">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" />
                                                            <HeaderStyle BorderColor="#394f66" BorderStyle="Solid" BorderWidth="1px" Font-Bold="true"
                                                                HorizontalAlign="Center" />
                                                        </asp:BoundColumn>
                                                    </Columns>
                                                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                    <EditItemStyle BackColor="#2461BF" />
                                                    <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                    <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />
                                                </asp:DataGrid>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">

                                    <table cellpadding="2" cellspacing="0" class="formBgStyle" width="98%">
                                        <tr>
                                            <td align="center" style="text-align: left" class="formItemBgStyle">&nbsp;<asp:Label ID="Label11" runat="server" Text="<%$ Resources:lang,TouBiaoLiShiXinXiLieBiao%>"></asp:Label>：</td>
                                        </tr>
                                        <tr>
                                            <td align="center" class="formItemBgStyle">
                                                <table width="98%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                                    <tr>
                                                        <td>
                                                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                <tr>
                                                                    <td width="10%" align="center">
                                                                        <strong>
                                                                            <asp:Label ID="Label12" runat="server" Text="<%$ Resources:lang,BianHao%>"></asp:Label></strong>
                                                                    </td>
                                                                    <td width="35%" align="center">
                                                                        <strong>
                                                                            <asp:Label ID="Label13" runat="server" Text="<%$ Resources:lang,TouBiaoNeiRong%>"></asp:Label></strong>
                                                                    </td>
                                                                    <td align="center" width="5%">
                                                                        <strong>&nbsp;&nbsp;</strong></td>
                                                                    <td align="center">
                                                                        <strong>
                                                                            <asp:Label ID="Label29" runat="server" Text="文件"></asp:Label>
                                                                        </strong>
                                                                    </td>
                                                                    <td width="15%" align="center">
                                                                        <strong>
                                                                            <asp:Label ID="Label14" runat="server" Text="<%$ Resources:lang,CaoZuoLeiXing%>"></asp:Label></strong>
                                                                    </td>
                                                                    <td width="25%" align="center">
                                                                        <strong>
                                                                            <asp:Label ID="Label15" runat="server" Text="<%$ Resources:lang,CaoZuoshijian%>"></asp:Label></strong>
                                                                    </td>

                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                </table>
                                                <asp:DataGrid ID="DataGrid1" runat="server" AutoGenerateColumns="False" Height="1px" Width="98%" CellPadding="4" ForeColor="#333333"
                                                    GridLines="None" ShowHeader="false">

                                                    <ItemStyle CssClass="itemStyle" />
                                                    <HeaderStyle HorizontalAlign="Center" BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                    <Columns>
                                                        <asp:BoundColumn DataField="ID" HeaderText="编号">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="center" Width="10%" />
                                                            <HeaderStyle BorderColor="#394f66" BorderStyle="Solid" BorderWidth="1px" Font-Bold="true"
                                                                HorizontalAlign="Center" />
                                                        </asp:BoundColumn>
                                                        <asp:BoundColumn DataField="BiddingContent" HeaderText="投标内容">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="35%" />
                                                            <HeaderStyle BorderColor="#394f66" BorderStyle="Solid" BorderWidth="1px" Font-Bold="true"
                                                                HorizontalAlign="Center" />
                                                        </asp:BoundColumn>
                                                        <asp:TemplateColumn HeaderText="发起流程">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                            <ItemTemplate>
                                                                <a href='TTRelatedDIYWorkflowForm.aspx?RelatedType=BMBidRecord&RelatedID=<%# DataBinder.Eval(Container.DataItem,"ID") %>' target="_blank">报价
                                                                </a>
                                                            </ItemTemplate>
                                                            <HeaderStyle BorderColor="#394F66" BorderStyle="Solid" BorderWidth="1px" Font-Bold="True"
                                                                HorizontalAlign="Center" />
                                                        </asp:TemplateColumn>
                                                        <asp:TemplateColumn HeaderText="投标文件">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" />
                                                            <ItemTemplate>
                                                                <a href='TTBMSupplierBidRecordFile.aspx?SupplierBidRecordID=<%# DataBinder.Eval(Container.DataItem,"ID") %>' target="_blank">上传投标文件</a>
                                                            </ItemTemplate>
                                                            <HeaderStyle BorderColor="#394F66" BorderStyle="Solid" BorderWidth="1px" Font-Bold="True"
                                                                HorizontalAlign="Center" />
                                                        </asp:TemplateColumn>
                                                        <asp:BoundColumn DataField="OperationType" HeaderText="操作类型">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="15%" />
                                                            <HeaderStyle BorderColor="#394f66" BorderStyle="Solid" BorderWidth="1px" Font-Bold="true"
                                                                HorizontalAlign="Center" />
                                                        </asp:BoundColumn>
                                                        <asp:BoundColumn DataField="OperationDate" HeaderText="操作时间" DataFormatString="{0:yyyy-MM-dd HH:mm:ss}">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="25%" />
                                                            <HeaderStyle BorderColor="#394f66" BorderStyle="Solid" BorderWidth="1px" Font-Bold="true"
                                                                HorizontalAlign="Center" />
                                                        </asp:BoundColumn>


                                                    </Columns>
                                                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                    <EditItemStyle BackColor="#2461BF" />
                                                    <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                    <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />
                                                </asp:DataGrid>
                                            </td>
                                        </tr>
                                    </table>
                                    <br />
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
