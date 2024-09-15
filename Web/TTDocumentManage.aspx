<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTDocumentManage.aspx.cs" Inherits="TTDocumentManage" %>


<%@ Register Assembly="NickLee.Web.UI" Namespace="NickLee.Web.UI" TagPrefix="NickLee" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link id="mainCss" href="css/bluelightmain.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        #AboveDiv {
            min-width: 1100px;
            width: expression (document.body.clientWidth <= 1100? "1100px" : "auto" ));
        }
    </style>

    <script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="js/allAHandler.js"></script>
    <script type="text/javascript" language="javascript">
        $(function () {
            if (top.location != self.location) { } else { CloseWebPage(); }



        });

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
                                                            <asp:Label ID="Label1" runat="server"></asp:Label>
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
                                <td>
                                    <table width="100%" cellpadding="0" cellspacing="0">
                                        <tr>
                                            <td width="220px" valign="top" style="padding: 5px 5px 5px 5px; border-right: solid 1px #D8D8D8"
                                                align="left">
                                                <table width="220px" cellpadding="0" cellspacing="0">
                                                    <tr>
                                                        <td style="width: 220px; text-align: left;">
                                                            <asp:TreeView ID="TreeView1" runat="server" NodeWrap="True" OnSelectedNodeChanged="TreeView1_SelectedNodeChanged"
                                                                Width="220px" ShowLines="True" Font-Size="10pt" Font-Bold="False" Font-Names="宋体">
                                                                <RootNodeStyle CssClass="rootNode" />
                                                                <NodeStyle CssClass="treeNode" />
                                                                <LeafNodeStyle CssClass="leafNode" />
                                                                <SelectedNodeStyle CssClass="selectNode" ForeColor="Red" />
                                                            </asp:TreeView>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="width: 220px; text-align: left;">
                                                            <span style="font-size: 10pt">
                                                                <asp:Label ID="Label33441" runat="server" Text="<%$ Resources:lang,JieHaoDian%>"></asp:Label>：</span><asp:Label ID="LB_DocTypeID" runat="server"
                                                                    Width="39px" Font-Size="10pt">0</asp:Label>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="height: 14px; text-align: left; background: Buttonface;"></td>
                                                    </tr>
                                                    <tr>
                                                        <td style="height: 13px;" align="left">

                                                            <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,LeiXing%>"></asp:Label>：</span><asp:TextBox ID="TB_DocType" runat="server"
                                                                Width="160px"></asp:TextBox>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="text-align: left;">

                                                            <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,QuanXian%>"></asp:Label>：</span><asp:DropDownList ID="DL_Authority" DataTextField="HomeName"
                                                                DataValueField="GroupName" runat="server" AutoPostBack="True" CssClass="DDList"
                                                                Width="160px" Height="25px">
                                                            </asp:DropDownList>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="text-align: left;">

                                                            <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,ShunXu%>"></asp:Label>：<NickLee:NumberBox MaxAmount="1000000000000" MinAmount="-1000000000000" ID="NB_DocTypeSort" runat="server" Width="40px" Precision="0">00</NickLee:NumberBox>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <br />
                                                            <table>
                                                                <tr>
                                                                    <td>
                                                                        <asp:Button ID="BT_NewDocType" runat="server" OnClick="BT_NewDocType_Click" Text="<%$ Resources:lang,ZengJiaZiJieDian%>"
                                                                            CssClass="inpu" /></td>
                                                                    <td>
                                                                        <asp:Button ID="BT_UpdateDocType" runat="server" OnClick="BT_UpdateDocType_Click"
                                                                            CssClass="inpuSave" Enabled="False" /></td>
                                                                    <td>&nbsp;<asp:Button ID="BT_DeleteDocType" runat="server" OnClick="BT_DeleteDocType_Click" OnClientClick="return confirm(getDeleteMsgByLangCode())"
                                                                        CssClass="inpuDelete" ToolTip="<%$ Resources:lang,ShanChu%>" Enabled="False" /></td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="height: 14px; text-align: left; background: Buttonface;">
                                                            <asp:Label ID="LB_Sql" runat="server" Visible="False"></asp:Label>
                                                            <asp:Label ID="LB_UserCode" runat="server" Visible="False"></asp:Label>
                                                            <asp:Label ID="LB_ParentDepratString" runat="server" Visible="False"></asp:Label>
                                                            <asp:Label ID="LB_UnderDepartStringg" runat="server" Visible="False"></asp:Label>

                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                            <td valign="top" style="padding: 0px 5px 5px 5px">
                                                <table align="center" style="width: 98%;">
                                                    <tr>
                                                        <td style="background: #F0F0F0; width: 100%; text-align: left;">
                                                            <table style="width: 99%; height: 12px;">
                                                                <tr>
                                                                    <td width="70px" align="right">
                                                                        <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,WenJianMing%>"></asp:Label>：</td>
                                                                    <td width="130px" align="left">
                                                                        <asp:TextBox ID="TB_DocName" runat="server" Width="120px"></asp:TextBox>
                                                                    </td>

                                                                    <td width="80px" align="right">
                                                                        <asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,ShangChuanZhe%>"></asp:Label>：</td>
                                                                    <td width="120px">
                                                                        <asp:TextBox ID="TB_UploadManName" runat="server" Width="120px"></asp:TextBox>
                                                                    </td>
                                                                    <td>
                                                                        <asp:Label ID="Label50" runat="server" Text="<%$ Resources:lang,Cong%>"></asp:Label>
                                                                    </td>
                                                                    <td style="width: 120px;" align="left">
                                                                        <asp:TextBox ID="DLC_StartTime" ReadOnly="false" runat="server" Width="99%"></asp:TextBox>
                                                                        <ajaxToolkit:CalendarExtender Format="yyyy-MM-dd" ID="CalendarExtender3" runat="server" TargetControlID="DLC_StartTime">
                                                                        </ajaxToolkit:CalendarExtender>
                                                                    </td>
                                                                    <td align="center">
                                                                        <asp:Label ID="Label51" runat="server" Text="<%$ Resources:lang,Dao%>"></asp:Label>
                                                                    </td>
                                                                    <td style="width: 120px;" align="left">
                                                                        <asp:TextBox ID="DLC_EndTime" ReadOnly="false" runat="server" Width="99%"></asp:TextBox>
                                                                        <ajaxToolkit:CalendarExtender Format="yyyy-MM-dd" ID="CalendarExtender4" runat="server" TargetControlID="DLC_EndTime">
                                                                        </ajaxToolkit:CalendarExtender>
                                                                    </td>
                                                                    <td style="text-align: right; width: 80px;">
                                                                        <asp:Label ID="LB_TBParentProject" runat="server" Text="<%$ Resources:lang,Project %>" />: </td>
                                                                    <td style="text-align: left; width: 350px;">
                                                                        <asp:TextBox ID="TB_ParentProject" Width="99%" runat="server"></asp:TextBox><cc1:ModalPopupExtender ID="ModalPopupExtender1" runat="server"
                                                                            Enabled="True" TargetControlID="TB_ParentProject" PopupControlID="Panel2"
                                                                            CancelControlID="IMBT_CloseTree" BackgroundCssClass="modalBackground" Y="150" DynamicServicePath="">
                                                                        </cc1:ModalPopupExtender>
                                                                        <div style="display: none;">
                                                                            <asp:Label ID="LB_ParentProjectID" runat="server" Font-Bold="False"></asp:Label>
                                                                            <asp:Label ID="LB_ProjectID" runat="server"></asp:Label>
                                                                        </div>
                                                                    </td>
                                                                    <td>
                                                                        <asp:Button ID="BT_HazyFind" runat="server" OnClick="BT_HazyFind_Click" Text="<%$ Resources:lang,ChaXun%>" />
                                                                    </td>
                                                                    <td style="background: #F0F0F0; width: 20%; text-align: right;">---&gt;<asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="TTUploadDoc.aspx" Target="_blank" Text="<%$ Resources:lang,ShangChuanWenDang%>"></asp:HyperLink>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="background: #F0F0F0; width: 100%; text-align: left;">
                                                            <table width="100%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                                                <tr>
                                                                    <td width="7">
                                                                        <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" />
                                                                    </td>
                                                                    <td>
                                                                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                            <tr>
                                                                                <td width="6%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,XuHao%>"></asp:Label></strong>
                                                                                </td>
                                                                                <td width="10%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label8" runat="server" Text="<%$ Resources:lang,DaLei%>"></asp:Label></strong>
                                                                                </td>
                                                                                <td width="8%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label14" runat="server" Text="<%$ Resources:lang,FuLei%>"></asp:Label></strong>
                                                                                </td>
                                                                                <td width="10%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label9" runat="server" Text="<%$ Resources:lang,LeiXing%>"></asp:Label></strong>
                                                                                </td>
                                                                                <td width="21%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label10" runat="server" Text="<%$ Resources:lang,WenJianMing%>"></asp:Label></strong>
                                                                                </td>
                                                                                <td width="10%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label15" runat="server" Text="<%$ Resources:lang,BuMen%>"></asp:Label></strong>
                                                                                </td>
                                                                                <td width="10%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label11" runat="server" Text="<%$ Resources:lang,ShangChuanZhe%>"></asp:Label></strong>
                                                                                </td>
                                                                                <td width="15%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label12" runat="server" Text="<%$ Resources:lang,ShangChuanShiJian%>"></asp:Label></strong>
                                                                                </td>
                                                                                <td width="10%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label13" runat="server" Text="<%$ Resources:lang,XiangGuan%>"></asp:Label></strong>
                                                                                </td>
                                                                            </tr>
                                                                        </table>
                                                                    </td>
                                                                    <td width="6" align="right">
                                                                        <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" />
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                            <asp:DataGrid ID="DataGrid1" runat="server" AllowPaging="True" AutoGenerateColumns="false"
                                                                PageSize="37" ShowHeader="false" Height="1px" OnPageIndexChanged="DataGrid1_PageIndexChanged"
                                                                Width="100%" Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False"
                                                                Font-Underline="False" CellPadding="4" ForeColor="#333333" GridLines="None">
                                                                <Columns>
                                                                    <asp:BoundColumn DataField="DocID" HeaderText="序号">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:BoundColumn DataField="RelatedType" HeaderText="大类">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:TemplateColumn HeaderText="父类">
                                                                        <ItemTemplate>
                                                                            <%# ShareClass . getDocParentTypeByID(Eval("DocTypeID").ToString()) %>
                                                                        </ItemTemplate>
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                                    </asp:TemplateColumn>
                                                                    <asp:BoundColumn DataField="DocType" HeaderText="类型">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:HyperLinkColumn DataNavigateUrlField="Address" DataNavigateUrlFormatString="{0}"
                                                                        DataTextField="DocName" HeaderText="文件名" Target="_blank">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="21%" />
                                                                    </asp:HyperLinkColumn>
                                                                    <asp:BoundColumn DataField="DepartName" HeaderText="部门">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:HyperLinkColumn DataNavigateUrlField="UploadManCode" DataNavigateUrlFormatString="TTUserInforSimple.aspx?UserCode={0}"
                                                                        DataTextField="UploadManName" HeaderText="上传者" Target="_blank">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                    </asp:HyperLinkColumn>
                                                                    <asp:BoundColumn DataField="UploadTime" HeaderText="上传时间">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="15%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:BoundColumn DataField="Address" Visible="False"></asp:BoundColumn>
                                                                    <asp:HyperLinkColumn DataNavigateUrlField="DocID" DataTextField="RelatedID" HeaderText="相关"
                                                                        Target="_blank" DataNavigateUrlFormatString="TTRelatedFormView.aspx?Type=Doc&ID={0}">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                    </asp:HyperLinkColumn>
                                                                </Columns>

                                                                <ItemStyle CssClass="itemStyle" />
                                                                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                                <EditItemStyle BackColor="#2461BF" />
                                                                <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                                <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />
                                                            </asp:DataGrid>
                                                            <asp:Label ID="LB_Count" runat="server"></asp:Label>
                                                            &nbsp;&nbsp;
                                                        <asp:Label ID="LB_TotalCount" runat="server"></asp:Label></td>
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
                    <asp:Panel ID="Panel2" runat="server" CssClass="modalPopup" Style="display: none;">
                        <div class="modalPopup-text" style="width: 420px; height: 400px; overflow: auto;">
                            <table>
                                <tr>
                                    <td style="width: 360px; padding: 5px 5px 5px 5px;" valign="top" align="left">
                                        <asp:TreeView ID="TreeView2" runat="server" NodeWrap="True" OnSelectedNodeChanged="TreeView2_SelectedNodeChanged"
                                            ShowLines="True" Width="220px">
                                            <RootNodeStyle CssClass="rootNode" />
                                            <NodeStyle CssClass="treeNode" />
                                            <LeafNodeStyle CssClass="leafNode" />
                                            <SelectedNodeStyle CssClass="selectNode" ForeColor="Red" />
                                        </asp:TreeView>
                                    </td>
                                    <td style="width: 60px; padding: 5px 5px 5px 5px;" valign="top" align="center">
                                        <asp:ImageButton ID="IMBT_CloseTree" ImageUrl="ImagesSkin/Close4.jpg" runat="server" />
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </asp:Panel>
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
