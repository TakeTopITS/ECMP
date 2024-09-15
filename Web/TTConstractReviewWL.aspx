<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTConstractReviewWL.aspx.cs"
    Inherits="TTConstractReviewWL" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link id="mainCss" href="css/bluelightmain.css" rel="stylesheet" type="text/css" />
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

                    <table cellpadding="0" cellspacing="0" width="100%" class="bian">
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
                                                        <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,ShenHeGongZuoLiu%>"></asp:Label>
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
                            <td valign="top" style="padding-top: 5px;">
                                <table width="98%" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td>
                                            <asp:DataList ID="DataList1" runat="server" CellPadding="0" ForeColor="#333333" Height="1px"
                                                Width="100%">
                                                <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                <HeaderTemplate>
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
                                                                                <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,HeTongDaiMa%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="20%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,HeTongMingCheng%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="7%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,LeiXing%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="7%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,HeTongE%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="7%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,ZhuangTai%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="11%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,JiaFangDanWei%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="11%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="Label8" runat="server" Text="<%$ Resources:lang,YiFangDanWei%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="8%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="Label9" runat="server" Text="<%$ Resources:lang,KaiShiRiQi%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="8%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="Label10" runat="server" Text="<%$ Resources:lang,JieZhiRiQi%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="8%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="Label11" runat="server" Text="<%$ Resources:lang,QianDingRiQi%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="7%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="Label12" runat="server" Text="<%$ Resources:lang,JiLuRen%>"></asp:Label></strong>
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </td>
                                                            <td width="6" align="right">
                                                                <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" />
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </HeaderTemplate>
                                                <ItemTemplate>
                                                    <table cellpadding="4" cellspacing="0" width="100%">
                                                        <tr>
                                                            <td class="tdLeft" style="width: 7%; text-align: center;">
                                                                <%#DataBinder .Eval (Container .DataItem ,"ConstractCode") %>
                                                            </td>
                                                            <td class="tdLeft" style="width: 20%; text-align: left; padding-left: 5px">
                                                                <%#DataBinder .Eval (Container .DataItem,"ConstractName") %>
                                                            </td>
                                                            <td class="tdLeft" style="width: 7%; text-align: center">
                                                                <%#DataBinder .Eval (Container .DataItem,"Type") %>
                                                            </td>
                                                            <td class="tdLeft" style="width: 7%; text-align: center">
                                                                <%#DataBinder .Eval (Container .DataItem,"Amount") %>
                                                            </td>
                                                            <td class="tdLeft" style="width: 7%; text-align: center">
                                                                <%#DataBinder .Eval (Container .DataItem,"Status") %>
                                                            </td>
                                                            <td class="tdLeft" style="width: 11%; text-align: center">
                                                                <%#DataBinder .Eval (Container .DataItem,"PartA") %>
                                                            </td>
                                                            <td class="tdLeft" style="width: 11%; text-align: center">
                                                                <%#DataBinder .Eval (Container .DataItem,"PartB") %>
                                                            </td>
                                                            <td class="tdLeft" style="width: 8%; text-align: center">
                                                                <%#DataBinder .Eval (Container .DataItem, "StartDate","{0:yyyy/MM/dd}") %>
                                                            </td>
                                                            <td class="tdLeft" style="width: 8%; text-align: center">
                                                                <%#DataBinder.Eval(Container.DataItem, "EndDate", "{0:yyyy/MM/dd}")%>
                                                            </td>
                                                            <td class="tdLeft" style="width: 8%; text-align: center">
                                                                <%#DataBinder.Eval(Container.DataItem, "SignDate", "{0:yyyy/MM/dd}")%>
                                                            </td>
                                                            <td class="tdRight" style="width: 7%; text-align: center">
                                                                <%#DataBinder .Eval (Container .DataItem, "RecorderName") %>
                                                            </td>
                                                        </tr>
                                                        <tr >
                                                            <td class="tdLeft" style="width: 7%; text-align: center; font-size: 10pt">
                                                                <asp:Label ID="Label13" runat="server" Text="<%$ Resources:lang,ZhuYaoNeiRong%>"></asp:Label>
                                                            </td>
                                                            <td class="tdRight" colspan="10" style="text-align: left; padding-left: 5px;">

                                                                <div style="height: 200px; overflow-y: auto;">
                                                                    <%#DataBinder .Eval (Container .DataItem,"MainContent") %>
                                                                </div>


                                                                <%--   <a id="aDownload" href='' target="_blank">
                                                                    <asp:Label ID="Label30" runat="server" Text="<%$ Resources:lang,XiaZai%>"></asp:Label>
                                                                </a>--%>
                                                                <%--   <table>
                                                                    <tr>
                                                                        <td></td>
                                                                        <td style="padding-left: 20px;">
                                                                            <div id="divEdit" onclick="javascript:POBrowser.openWindowModeless('TTOpenWord.aspx?DocURL=<%# ShareClass.URLEncode(Eval("MainContent").ToString()) %>','fullscreen=yes;');">
                                                                                <asp:Label ID="LB_OpenWord" Text="<%$ Resources:lang,BianJi %>" runat="server"></asp:Label>
                                                                            </div>
                                                                        </td>
                                                                    </tr>
                                                                </table>--%>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="tdLeft" style="width: 7%; text-align: center; font-size: 10pt">
                                                                <asp:Label ID="Label14" runat="server" Text="<%$ Resources:lang,BeiZhu%>"></asp:Label>
                                                            </td>
                                                            <td class="tdRight" colspan="10" style="text-align: left; padding-left: 5px">
                                                                <%#DataBinder .Eval (Container .DataItem,"Exception") %>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="tdRight" colspan="11" style="text-align: Right;">
                                                                <a href='TTConstractRelatedDocView.aspx?RelatedID=<%#DataBinder .Eval (Container .DataItem ,"ConstractID") %>'
                                                                    target="_blank">
                                                                    <asp:Label ID="Label15" runat="server" Text="<%$ Resources:lang,HeTongWenDang%>"></asp:Label>&nbsp;&nbsp;</a>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </ItemTemplate>
                                                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />

                                                <ItemStyle CssClass="itemStyle" />
                                            </asp:DataList>
                                            <table cellpadding="5" cellspacing="0" border="0" width="100%">
                                                <tr>
                                                    <td colspan="11" class="tdTopLine">&nbsp;
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: left;">
                                            <b>
                                                <asp:Label ID="Label16" runat="server" Text="<%$ Resources:lang,HeTongPingShenGongZuoLiu%>"></asp:Label>:</b>(<asp:HyperLink ID="HL_RelatedWorkFlowTemplate"
                                                    runat="server" NavigateUrl="TTProRelatedWFTemplate.aspx" Target="_blank" Enabled="false" Text="<%$ Resources:lang,RelatedWFTemplate%>"></asp:HyperLink>)
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: left;">
                                            <table style="width: 100%" cellpadding="3" cellspacing="0" class="formBgStyle">
                                                <tr style="font-size: 10pt">
                                                    <td style="text-align: left; width: 1000px;" class="formItemBgStyle">
                                                        <asp:Label ID="Label17" runat="server" Text="<%$ Resources:lang,MingCheng%>"></asp:Label>：<asp:TextBox ID="TB_WLName" runat="server" Width="220px"></asp:TextBox>&nbsp;
                                                    <asp:Label ID="Label18" runat="server" Text="<%$ Resources:lang,LeiXing%>"></asp:Label>：<asp:DropDownList ID="DL_WFType" runat="server">
                                                        <asp:ListItem Value="合同评审" Text="<%$ Resources:lang,HeTongPingSheng%>" />
                                                    </asp:DropDownList>
                                                        &nbsp;<asp:Label ID="Label19" runat="server" Text="<%$ Resources:lang,GongZuoLiuMuBan%>"></asp:Label>：<asp:DropDownList ID="DL_TemName" runat="server" DataTextField="TemName"
                                                            DataValueField="TemName" Width="144px">
                                                        </asp:DropDownList>
                                                        &nbsp; &nbsp;<asp:HyperLink ID="HL_WLTem" runat="server" NavigateUrl="~/TTWorkFlowTemplate.aspx"
                                                            Target="_blank">
                                                            <asp:Label ID="Label20" runat="server" Text="<%$ Resources:lang,MuBanWeiHu%>"></asp:Label>
                                                        </asp:HyperLink>&nbsp;
                                                        <asp:Label ID="Label21" runat="server" Text="<%$ Resources:lang,ChaXunGuanJianZi%>"></asp:Label>：&nbsp;<asp:TextBox ID="TB_KeyWord"
                                                            Width="80px" runat="server"></asp:TextBox>
                                                        &nbsp;
                                                    <asp:Button ID="BT_Refrash" runat="server" Text="<%$ Resources:lang,ShuaXin%>" OnClick="BT_Refrash_Click" CssClass="inpu" />
                                                    </td>
                                                </tr>
                                                <tr style="font-size: 10pt">
                                                    <td style="text-align: left; width: 850px; height: 51px;" class="formItemBgStyle">
                                                        <asp:Label ID="Label22" runat="server" Text="<%$ Resources:lang,ShuoMing%>"></asp:Label>：<asp:TextBox ID="TB_Description" runat="server" TextMode="MultiLine" Width="441px"
                                                            Height="48px"></asp:TextBox>&nbsp;
                                                    </td>
                                                </tr>
                                                <tr style="font-size: 10pt">
                                                    <td style="text-align: left; width: 850px;" class="formItemBgStyle">
                                                        <span style="font-size: 10pt">（<asp:Label ID="Label23" runat="server" Text="<%$ Resources:lang,YaoQiuShouDaoXinXi%>"></asp:Label>：<asp:CheckBox ID="CB_Mail" runat="server"
                                                            Text="<%$ Resources:lang,YouJian%>" />
                                                            <asp:CheckBox ID="CB_SMS" runat="server" Text="<%$ Resources:lang,DuanXin%>" />） </span>
                                                        <asp:Button ID="BT_SubmitApply" runat="server" Text="<%$ Resources:lang,TiJiaoShenQing%>" CssClass="inpu" />
                                                        <cc1:ModalPopupExtender ID="BT_SubmitApply_ModalPopupExtender" runat="server" Enabled="True"
                                                            TargetControlID="BT_SubmitApply" PopupControlID="Panel1" BackgroundCssClass="modalBackground" Y="150"
                                                            DynamicServicePath="">
                                                        </cc1:ModalPopupExtender>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: left; padding: 20px 0px 5px 0px;">
                                            <b>
                                                <asp:Label ID="Label24" runat="server" Text="<%$ Resources:lang,DuiYingGongZuoLiuLieBiao%>"></asp:Label>：</b>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="left">
                                            <table width="100%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                                <tr>
                                                    <td width="7">
                                                        <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" />
                                                    </td>
                                                    <td>
                                                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                            <tr>
                                                                <td width="10%" align="center">
                                                                    <strong>
                                                                        <asp:Label ID="Label25" runat="server" Text="<%$ Resources:lang,BianHao%>"></asp:Label></strong>
                                                                </td>
                                                                <td width="50%" align="center">
                                                                    <strong>
                                                                        <asp:Label ID="Label26" runat="server" Text="<%$ Resources:lang,GongZuoLiu%>"></asp:Label></strong>
                                                                </td>
                                                                <td width="20%" align="center">
                                                                    <strong>
                                                                        <asp:Label ID="Label27" runat="server" Text="<%$ Resources:lang,ShenQingShiJian%>"></asp:Label></strong>
                                                                </td>
                                                                <td width="10%" align="center">
                                                                    <strong>
                                                                        <asp:Label ID="Label28" runat="server" Text="<%$ Resources:lang,ZhuangTai%>"></asp:Label></strong>
                                                                </td>
                                                                <td width="10%" align="center">
                                                                    <strong></strong>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                    <td width="6" align="right">
                                                        <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" />
                                                    </td>
                                                </tr>
                                            </table>
                                            <asp:DataGrid ID="DataGrid4" runat="server" AutoGenerateColumns="False" Height="1px"
                                                ShowHeader="false" PageSize="5" Width="100%" CellPadding="4" ForeColor="#333333"
                                                GridLines="None">
                                                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                <EditItemStyle BackColor="#2461BF" />
                                                <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />

                                                <ItemStyle CssClass="itemStyle" />
                                                <Columns>
                                                    <asp:BoundColumn DataField="WLID" HeaderText="编号">
                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                    </asp:BoundColumn>
                                                    <asp:HyperLinkColumn DataNavigateUrlField="WLID" DataNavigateUrlFormatString="TTMyWorkDetailMain.aspx?WLID={0}"
                                                        DataTextField="WLName" HeaderText="工作流" Target="_blank">
                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="50%" />
                                                    </asp:HyperLinkColumn>
                                                    <asp:BoundColumn DataField="CreateTime" HeaderText="申请时间">
                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="20%" />
                                                    </asp:BoundColumn>
                                                    <asp:TemplateColumn HeaderText="状态">
                                                        <ItemTemplate>
                                                            <%# ShareClass. GetStatusHomeNameByOtherStatus(Eval("Status").ToString()) %>
                                                        </ItemTemplate>
                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="10%" />
                                                    </asp:TemplateColumn>
                                                    <asp:TemplateColumn>
                                                        <ItemTemplate>
                                                            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# DataBinder.Eval(Container, "DataItem.WLID", "TTWLRelatedDoc.aspx?DocType=审核&WLID={0}") %>'
                                                                Target="_blank"><img src="ImagesSkin/Doc.gif" class="noBorder" /></asp:HyperLink>
                                                        </ItemTemplate>
                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                    </asp:TemplateColumn>
                                                </Columns>
                                            </asp:DataGrid>
                                            <br />
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                    <asp:Panel ID="Panel1" runat="server" CssClass="modalPopup" Style="display: none;"
                        Width="500px">
                        <div>
                            <table>
                                <tr>
                                    <td style="width: 420px; padding: 5px 5px 5px 5px;" valign="top" align="left">
                                        <asp:Label ID="Label29" runat="server" Text="<%$ Resources:lang,LCSQSCHYLJDLCJHYMQJHM%>"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 420px; padding: 5px 5px 5px 5px;" valign="top" align="left">&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;<asp:Button ID="BT_ActiveYes" runat="server" CssClass="inpu" Text="<%$ Resources:lang,Shi%>" OnClick="BT_ActiveYes_Click" />
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Button
                                            ID="BT_ActiveNo" runat="server" CssClass="inpu" Text="<%$ Resources:lang,Fou%>" OnClick="BT_ActiveNo_Click" />
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
