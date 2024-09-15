<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTDefectReviewWL.aspx.cs" Inherits="TTDefectReviewWL" %>


<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link id="mainCss" href="css/bluelightmain.css" rel="stylesheet" type="text/css" />

    <script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="js/allAHandler.js"></script>
    <script type="text/javascript" language="javascript">
        $(function () { if (top.location != self.location) { } else { CloseWebPage(); }



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
                    <div>

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
                                                            <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,QueXianPingShen%>"></asp:Label>
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
                                <td style="padding: 5px 5px 5px 5px;" align="left">
                                    <table width="100%" cellpadding="0" cellspacing="0">
                                        <tr>
                                            <td>
                                                <br />
                                                <asp:DataList ID="DataList1" runat="server" Width="95%" CellPadding="0" CellSpacing="0"
                                                    ForeColor="#333333">
                                                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                    <ItemTemplate>
                                                        <table class="bian" style="width: 100%;" cellpadding="4" cellspacing="0">
                                                            <tr>
                                                                <td style="width: 10%; text-align: right;">
                                                                    <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,BianHao%>"></asp:Label>：
                                                                </td>
                                                                <td style="width: 20%; text-align: left;">
                                                                    <%#DataBinder .Eval (Container .DataItem ,"DefectID") %>
                                                                </td>
                                                                <td style="width: 10%; text-align: right;">
                                                                    <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,LeiXing%>"></asp:Label>：
                                                                </td>
                                                                <td style="width: 20%; text-align: left;">
                                                                    <%#DataBinder .Eval (Container .DataItem ,"DefectType") %>
                                                                </td>
                                                                <td style="text-align: right; width: 10%;">
                                                                    <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,ShenQingRen%>"></asp:Label>：
                                                                </td>
                                                                <td style="width: 30%; text-align: left">
                                                                    <a href='TTUserInforSimple.aspx?UserCode=<%#DataBinder .Eval (Container .DataItem ,"ApplicantCode") %>'
                                                                        target="_blank">
                                                                        <%#DataBinder .Eval (Container .DataItem ,"ApplicantName") %>
                                                                    </a>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td style="width: 10%; text-align: right; height: 21px;">
                                                                    <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,MingCheng%>"></asp:Label>：
                                                                </td>
                                                                <td colspan="5" style="height: 21px; text-align: left;">
                                                                    <%#DataBinder .Eval (Container .DataItem ,"DefectName") %>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td style="width: 10%; text-align: right;">
                                                                    <asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,MiaoShu%>"></asp:Label>：
                                                                </td>
                                                                <td colspan="5" style="text-align: left">
                                                                    <%#DataBinder .Eval (Container .DataItem ,"DefectDetail") %>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td style="width: 10%; text-align: right;">
                                                                    <asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,YanShouBiaoZhun%>"></asp:Label>：
                                                                </td>
                                                                <td colspan="5" style="text-align: left">
                                                                    <%#DataBinder .Eval (Container .DataItem ,"AcceptStandard") %>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td style="width: 10%; height: 20px; text-align: right;">
                                                                    <asp:Label ID="Label8" runat="server" Text="<%$ Resources:lang,YaoQiuWanChengRiQi%>"></asp:Label>:
                                                                </td>
                                                                <td colspan="2" style="height: 20px; text-align: left;">
                                                                    <%#DataBinder .Eval (Container .DataItem ,"DefectFinishedDate","{0:yyyy/MM/dd}") %>
                                                                </td>
                                                                <td style="width: 10%; height: 20px; text-align: right;">
                                                                    <asp:Label ID="Label9" runat="server" Text="<%$ Resources:lang,JianLiRiQi%>"></asp:Label>：<td colspan="2" style="height: 20px; text-align: left; width: 212px;">
                                                                        <%#DataBinder .Eval (Container .DataItem ,"MakeDate","{0:yyyy/MM/dd}") %>
                                                                    </td>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td style="width: 10%; text-align: right;">
                                                                    <asp:Label ID="Label10" runat="server" Text="<%$ Resources:lang,ZhuangTai%>"></asp:Label>：
                                                                </td>
                                                                <td colspan="5" style="text-align: left">
                                                                    <%#DataBinder .Eval (Container .DataItem ,"Status") %>
                                                                &nbsp; &nbsp; &nbsp; &nbsp; <span style="color: #0000ff;"><a href='TTDefectRelatedDocView.aspx?RelatedID=<%#DataBinder .Eval (Container .DataItem ,"DefectID")%>'
                                                                    target="_blank">
                                                                    <asp:Label ID="Label11" runat="server" Text="<%$ Resources:lang,XiangGuanWenJian%>"></asp:Label></a> &nbsp;<a href='TTDefectAssignRecord.aspx?DefectID=<%#DataBinder .Eval (Container .DataItem ,"DefectID")%>'
                                                                        target="_blank"><asp:Label ID="Label12" runat="server" Text="<%$ Resources:lang,FenPaiJiLu%>"></asp:Label></a> </span>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </ItemTemplate>

                                                    <ItemStyle BackColor="#EFF3FB" />
                                                    <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                </asp:DataList>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>&nbsp;
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <table width="95%">
                                                    <tr>
                                                        <td align="left">
                                                            <b style="text-align: left">
                                                                <asp:Label ID="Label13" runat="server" Text="<%$ Resources:lang,QueXianPingShenGongZuoLiu%>"></asp:Label>:</b>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <table style="width: 100%" cellpadding="3" cellspacing="0" class="formBgStyle">
                                                                <tr style="font-size: 10pt">
                                                                    <td style="text-align: left; width: 100%;" class="formItemBgStyle">
                                                                        <asp:Label ID="Label14" runat="server" Text="<%$ Resources:lang,MingCheng%>"></asp:Label>：<asp:TextBox ID="TB_WLName" runat="server" Width="234px"></asp:TextBox>&nbsp;
                                                                    <asp:Label ID="Label15" runat="server" Text="<%$ Resources:lang,LeiXing%>"></asp:Label>：
                                                                        <asp:DropDownList ID="DL_WFType" runat="server">
                                                                            <asp:ListItem Value="缺陷评审" Text="<%$ Resources:lang,QueXianPingSheng%>" />
                                                                        </asp:DropDownList>
                                                                        &nbsp;&nbsp;<asp:Label ID="Label17" runat="server" Text="<%$ Resources:lang,GongZuoLiuMuBan%>"></asp:Label>：<asp:DropDownList ID="DL_TemName" runat="server" DataTextField="TemName"
                                                                            DataValueField="TemName" Width="180px">
                                                                        </asp:DropDownList>
                                                                        &nbsp; &nbsp;<asp:Label ID="Label16" runat="server" Text="<%$ Resources:lang,ChaXunGuanJianZi%>"></asp:Label>：<asp:TextBox ID="TB_KeyWord" runat="server" Width="60px"></asp:TextBox>
                                                                        <asp:Button ID="BT_Refrash" runat="server" Text="<%$ Resources:lang,ShuaXin%>" OnClick="BT_Refrash_Click" CssClass="inpu" />
                                                                    </td>
                                                                </tr>
                                                                <tr style="font-size: 10pt" class="formItemBgStyle">
                                                                    <td style="text-align: left; width: 100%; height: 51px;">
                                                                        <asp:Label ID="Label19" runat="server" Text="<%$ Resources:lang,ShuoMing%>"></asp:Label>：<asp:TextBox ID="TB_Description" runat="server" TextMode="MultiLine" Width="564px"
                                                                            Height="79px"></asp:TextBox>&nbsp;
                                                                    </td>
                                                                </tr>
                                                                <tr style="font-size: 10pt" class="formItemBgStyle">
                                                                    <td style="text-align: left; width: 100%;">
                                                                        <span style="font-size: 10pt">（<asp:Label ID="Label18" runat="server" Text="<%$ Resources:lang,YaoQiuShouDaoXinXi%>"></asp:Label>：<asp:CheckBox ID="CB_Mail" runat="server"
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
                                                </table>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <table width="95%" cellpadding="3" cellspacing="3">
                                                    <tr>
                                                        <td align="left">
                                                            <b>
                                                                <asp:Label ID="Label20" runat="server" Text="<%$ Resources:lang,DuiYingGongZuoLiuLieBiao%>"></asp:Label>：</b>
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
                                                                                <td width="10%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label21" runat="server" Text="<%$ Resources:lang,BianHao%>"></asp:Label></strong>
                                                                                </td>
                                                                                <td width="45%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label22" runat="server" Text="<%$ Resources:lang,GongZuoLiu%>"></asp:Label></strong>
                                                                                </td>
                                                                                <td width="20%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label23" runat="server" Text="<%$ Resources:lang,ShenQingShiJian%>"></asp:Label></strong>
                                                                                </td>
                                                                                <td width="15%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label24" runat="server" Text="<%$ Resources:lang,ZhuangTai%>"></asp:Label></strong>
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
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="45%" />
                                                                    </asp:HyperLinkColumn>
                                                                    <asp:BoundColumn DataField="CreateTime" HeaderText="申请时间">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="20%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:TemplateColumn HeaderText="状态">
                                                                        <ItemTemplate>
                                                                            <%# ShareClass. GetStatusHomeNameByOtherStatus(Eval("Status").ToString()) %>
                                                                        </ItemTemplate>
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="15%" />
                                                                    </asp:TemplateColumn>
                                                                    <asp:TemplateColumn>
                                                                        <ItemTemplate>
                                                                            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# DataBinder.Eval(Container, "DataItem.WLID", "TTWLRelatedDoc.aspx?DocType=审核&WLID={0}") %>'
                                                                                Target="_blank"><img src="ImagesSkin/Doc.gif" class="noBorder"/></asp:HyperLink>
                                                                        </ItemTemplate>
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                    </asp:TemplateColumn>
                                                                </Columns>
                                                            </asp:DataGrid>
                                                        </td>
                                                    </tr>
                                                </table>
                                                <br />
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </div>
                    <asp:Panel ID="Panel1" runat="server" CssClass="modalPopup" Style="display: none;"
                        Width="500px">
                        <div>
                            <table>
                                <tr>
                                    <td style="width: 420px; padding: 5px 5px 5px 5px;" valign="top" align="left">
                                        <asp:Label ID="Label25" runat="server" Text="<%$ Resources:lang,LCSQSCHYLJDLCJHYMQJHM%>"></asp:Label>
                                </tr>
                                <tr>
                                    <td style="width: 420px; padding: 5px 5px 5px 5px;" valign="top" align="left">
                                        &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;<asp:Button ID="BT_ActiveYes" runat="server" CssClass="inpu" Text="<%$ Resources:lang,Shi%>" OnClick="BT_ActiveYes_Click" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Button
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
<script type="text/javascript" language="javascript">var cssDirectory = '<%=Session["CssDirectory"] %>'; var oLink = document.getElementById('mainCss'); oLink.href = 'css/' + cssDirectory + '/' + 'bluelightmain.css';</script></html>
