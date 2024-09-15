<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTCustomerQuestionRecord.aspx.cs"
    Inherits="TTCustomerQuestionRecord" %>

<%@ Register Assembly="NickLee.Web.UI" Namespace="NickLee.Web.UI" TagPrefix="NickLee" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc2" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link id="mainCss" href="css/bluelightmain.css" rel="stylesheet" type="text/css" />

    <style type="text/css">
        /*#AboveDiv {
            min-width: 1240px;
            width: expression (document.body.clientWidth <= 1240? "1240px" : "auto" ));
        }*/
        .auto-style1 {
            color: #FF3300;
        }
    </style>


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
            <%--  <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="True" EnableScriptLocalization="True">--%>
            <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="True" EnableScriptLocalization="True">
            </asp:ScriptManager>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>

                    <div id="AboveDiv">
                        <table cellpadding="0" cellspacing="0" width="100%" class="bian">
                            <tr>
                                <td height="31" class="page_topbj">
                                    <table width="96%" border="0" align="center" cellpadding="0" cellspacing="0">
                                        <tr>
                                            <td align="left">
                                                <table width="300" border="0" align="left" cellpadding="0" cellspacing="0">
                                                    <tr>
                                                        <td width="29">
                                                            <%--<img src="Logo/main_top_l.jpg" alt="" width="29" height="31" />--%></td>
                                                        <td align="center" background="ImagesSkin/main_top_bj.jpg" class="titlezi">
                                                            <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,KeHuXuQiuJiLu%>"></asp:Label>
                                                        </td>
                                                        <td width="5">
                                                            <%-- <img src="ImagesSkin/main_top_r.jpg" width="5" height="31" />--%></td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <table style="width: 100%;">
                                        <tr>

                                            <td style="padding: 5px 0px 0px 5px" valign="top" align="left">

                                                <table width="100%" border="0" cellpadding="0" cellspacing="0">
                                                    <tr>
                                                        <td align="right" style="padding-bottom: 5px;">
                                                            <asp:Button ID="BT_Create" runat="server" Text="<%$ Resources:lang,New%>" CssClass="inpuYello" OnClick="BT_Create_Click" />
                                                        </td>
                                                    </tr>
                                                </table>

                                                <table background="ImagesSkin/main_n_bj.jpg" border="0" cellpadding="0" cellspacing="0" width="100%">
                                                    <tr>
                                                        <td width="7">
                                                            <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" />
                                                        </td>
                                                        <td>
                                                            <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                                <tr>
                                                                   <td width="5%" align="center">
                                                                        <strong>
                                                                            <asp:Label ID="Label18" runat="server" Text="<%$ Resources:lang,BianJi %>" /></strong>
                                                                    </td>
                                                                    <td width="5%" align="center">
                                                                        <strong>
                                                                            <asp:Label ID="Label63" runat="server" Text="<%$ Resources:lang,ShanChu %>" /></strong>
                                                                    </td>
                                                                   
                                                                    <td align="center" width="5%"><strong>
                                                                        <asp:Label ID="Label37" runat="server" Text="<%$ Resources:lang,BianHao%>"></asp:Label>
                                                                    </strong></td>
                                                                    <td align="center" width="6%"><strong>
                                                                        <asp:Label ID="Label38" runat="server" Text="<%$ Resources:lang,LeiXing%>"></asp:Label>
                                                                    </strong></td>
                                                                    <td align="center" width="18%"><strong>
                                                                        <asp:Label ID="Label39" runat="server" Text="<%$ Resources:lang,FuWuXuQiu%>"></asp:Label>
                                                                    </strong></td>
                                                                    <td align="center" width="8%"><strong>
                                                                        <asp:Label ID="Label40" runat="server" Text="<%$ Resources:lang,YaoQiuDaFuShiJian%>"></asp:Label>
                                                                    </strong></td>
                                                                    <td align="center" width="11%"><strong>
                                                                        <asp:Label ID="Label41" runat="server" Text="<%$ Resources:lang,TiJiaoShiJian%>"></asp:Label>
                                                                    </strong></td>
                                                                    <td align="center" width="8%"><strong>
                                                                        <asp:Label ID="Label42" runat="server" Text="<%$ Resources:lang,TiChuZhe%>"></asp:Label>
                                                                    </strong></td>
                                                                    <%-- <td align="center" width="14%"><strong>
                                                                        <asp:Label ID="Label43" runat="server" Text="<%$ Resources:lang,GongSi%>"></asp:Label>
                                                                    </strong></td>--%>

                                                                    <td align="center" width="6%"><strong>
                                                                        <asp:Label ID="Label45" runat="server" Text="<%$ Resources:lang,ShouLiRen%>"></asp:Label>
                                                                    </strong></td>
                                                                    <td align="center" width="5%"><strong>
                                                                        <asp:Label ID="Label46" runat="server" Text="<%$ Resources:lang,ZhuangTai%>"></asp:Label>
                                                                    </strong></td>
                                                                    <td align="center" width="3%"><strong>&nbsp;</strong> </td>
                                                                    <td align="center" width="3%"><strong>&nbsp;</strong> </td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                        <td align="right" width="6">
                                                            <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" />
                                                        </td>
                                                    </tr>
                                                </table>
                                                <asp:DataGrid ID="DataGrid4" runat="server" AutoGenerateColumns="False" GridLines="None"
                                                    OnItemCommand="DataGrid4_ItemCommand" OnPageIndexChanged="DataGrid4_PageIndexChanged"
                                                    AllowCustomPaging="false" AllowPaging="true" PageSize="28" ShowHeader="False"
                                                    Width="100%">
                                                    <ItemStyle CssClass="itemStyle" />
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
                                                        <asp:BoundColumn DataField="ID" HeaderText="编号">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                        </asp:BoundColumn>
                                                        <asp:BoundColumn DataField="Type" HeaderText="类型">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                                        </asp:BoundColumn>
                                                        <asp:HyperLinkColumn DataNavigateUrlField="ID" DataNavigateUrlFormatString="TTCustomerQuestionHandleDetail.aspx?ID={0}" DataTextField="Question" HeaderText="服务需求" Target="_blank">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="18%" />
                                                        </asp:HyperLinkColumn>
                                                        <asp:BoundColumn DataField="AnswerTime" DataFormatString="{0:yyyy/MM/dd}" HeaderText="要求答复时间">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                        </asp:BoundColumn>
                                                        <asp:BoundColumn DataField="SummitTime" DataFormatString="{0:yyyy/MM/dd hh:mm:ss}" HeaderText="提交时间">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="11%" />
                                                        </asp:BoundColumn>
                                                        <asp:BoundColumn DataField="ContactPerson" HeaderText="提出者">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                        </asp:BoundColumn>
                                                        <%--  <asp:BoundColumn DataField="Company" HeaderText="公司">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="14%" />
                                                        </asp:BoundColumn>
                                                        --%>
                                                        <asp:HyperLinkColumn DataNavigateUrlField="OperatorCode" DataNavigateUrlFormatString="TTUserInforSimple.aspx?UserCode={0}" DataTextField="OperatorName" HeaderText="受理人" Target="_blank">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                                        </asp:HyperLinkColumn>
                                                        <asp:BoundColumn DataField="OperatorStatus" HeaderText="受理状态">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="5%" />
                                                        </asp:BoundColumn>
                                                        <asp:ButtonColumn CommandName="Detail" Text="&lt;div&gt;&lt;img src=ImagesSkin/Detail.png border=0 alt='明细' /&gt;&lt;/div&gt;">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="3%" />
                                                        </asp:ButtonColumn>
                                                        <asp:TemplateColumn>
                                                            <ItemTemplate>
                                                                <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl='<%# DataBinder.Eval(Container, "DataItem.ID", "TTCustomerQuestionRelatedDoc.aspx?RelatedID={0}") %>' Target="_blank"><img src="ImagesSkin/UpLoad.jpg"  class="noBorder"/></asp:HyperLink>
                                                                &nbsp;&nbsp;
                                                                <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# DataBinder.Eval(Container, "DataItem.ID", "TTDocumentTreeView.aspx?RelatedType=CustomerQuestion&RelatedID={0}") %>' Target="_blank"><img src="ImagesSkin/Doc.gif"  class="noBorder"/></asp:HyperLink>
                                                            </ItemTemplate>
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="3%" />
                                                        </asp:TemplateColumn>
                                                    </Columns>
                                                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                    <EditItemStyle BackColor="#2461BF" />
                                                    <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                    <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />
                                                </asp:DataGrid>

                                            </td>

                                            <%-- <td style="width: 220px; border-right: solid 1px #D8D8D8; padding: 5px 0px 0px 5px; display :none;"
                                                valign="top" align="left">
                                                <div id="DivID" style="width: 100%; height: 800px; overflow: auto;">
                                                   
                                                </div>
                                            </td>--%>
                                        </tr>
                                    </table>

                                    <br />
                                    <br />

                                    <table width="100%">
                                        <tr>
                                            <td>
                                                <div class="renyList">
                                                    <asp:Repeater ID="RP_ChartList" runat="server">
                                                        <ItemTemplate>
                                                            <asp:Label ID="LB_ChartName" runat="server" Text='<%# DataBinder.Eval(Container.DataItem,"ChartName") %>' Visible="false"></asp:Label>
                                                            <asp:Label ID="LB_ChartType" runat="server" Text='<%# DataBinder.Eval(Container.DataItem,"ChartType") %>' Visible="false"></asp:Label>
                                                            <asp:Label ID="LB_SqlCode" runat="server" Text='<%# DataBinder.Eval(Container.DataItem,"SqlCode") %>' Visible="false"></asp:Label>
                                                            
                                                            <iframe src="TTTakeTopAnalystChartSet.aspx?FormType=<%# DataBinder.Eval(Container.DataItem,"FormType") %>&ChartType=<%# DataBinder.Eval(Container.DataItem,"ChartType") %>&ChartName=<%# DataBinder.Eval(Container.DataItem,"ChartName") %>" style="width: 300px; height: 295px; border: 1px solid white; text-align: center; overflow: hidden;"></iframe>
                                                        </ItemTemplate>
                                                    </asp:Repeater>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="center" style="vertical-align: bottom;">
                                                <asp:HyperLink ID="HL_SystemAnalystChartRelatedUserSet" runat="server" Text="<%$ Resources:lang,FenXiTuSheZhi%>"></asp:HyperLink>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </div>



                    <div class="layui-layer layui-layer-iframe" id="popwindow"
                        style="z-index: 9999; width: 800px; height: 530px; position: absolute; overflow: hidden; display: none; border-radius: 10px;">
                        <div class="layui-layer-title" style="background: #e7e7e8;" id="popwindow_title">
                            <asp:Label ID="Label3" runat="server" Text="&lt;div&gt;&lt;img src=ImagesSkin/Update.png border=0 width=30px height=30px alt='BusinessForm' /&gt;&lt;/div&gt;"></asp:Label>
                        </div>
                        <div id="popwindow_content" class="layui-layer-content" style="overflow: auto; text-align: left;">
                            <table width="100%" cellpadding="3" cellspacing="0" class="formBgStyle">
                                <tr>
                                    <td align="center" colspan="4" class="formItemBgStyle">
                                        <table>
                                            <tr>
                                                <td align="right">
                                                    <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,FuWuXuQiuLeiBie%>"></asp:Label>
                                                    ：</td>
                                                <td align="left">
                                                    <asp:DropDownList ID="DL_CustomerQuestionType" runat="server" CssClass="DDList" DataTextField="Type" DataValueField="Type">
                                                    </asp:DropDownList>
                                                </td>
                                                <td align="right">
                                                    <asp:Label ID="Label8" runat="server" Text="<%$ Resources:lang,CYHSJ%>"></asp:Label>
                                                    ：</td>
                                                <td align="left">
                                                    <asp:DropDownList ID="DL_IsImportant" runat="server">
                                                        <asp:ListItem>NO</asp:ListItem>
                                                        <asp:ListItem>YES</asp:ListItem>
                                                    </asp:DropDownList>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="text-align: right;" class="formItemBgStyle">
                                        <asp:Label ID="Label19" runat="server" Text="<%$ Resources:lang,XuQiuShangJiMiaoShu%>"></asp:Label>： </td>
                                    <td colspan="3" align="left" class="formItemBgStyle">
                                        <CKEditor:CKEditorControl ID="TB_Question" runat="server" Width="99%" Height="120px" Visible="False" /><CKEditor:CKEditorControl runat="server" ID="HT_Question" Width="99%" Height="120px" Visible="False" />
                                        <span class="auto-style1">*</span>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 15%; text-align: right;" class="formItemBgStyle">
                                        <asp:Label ID="Label21" runat="server" Text="<%$ Resources:lang,KeHuMingCheng%>"></asp:Label>： </td>
                                    <td colspan="3" style="text-align: left;" class="formItemBgStyle">
                                        <asp:TextBox ID="TB_Company" runat="server" Width="70%"></asp:TextBox><span class="auto-style1">*</span>
                                        <asp:Button ID="BT_FindExistSame" runat="server" CssClass="inpuLong" OnClick="BT_FindExistSame_Click" Text="<%$ Resources:lang,CXSFYCZ%>" />

                                    </td>
                                </tr>
                                <tr>
                                    <td width="15%" style="text-align: right;" class="formItemBgStyle">
                                        <asp:Label ID="Label17" runat="server" Text="<%$ Resources:lang,LianXiRen%>"></asp:Label>： </td>
                                    <td width="30%" class="formItemBgStyle" align="left">
                                        <asp:TextBox ID="TB_ContactPerson" runat="server" Width="95%"></asp:TextBox><span class="auto-style1">*</span>
                                    </td>

                                    <td width="15%" style="text-align: right;" class="formItemBgStyle">
                                        <asp:Label ID="Label16" runat="server" Text="<%$ Resources:lang,LianXiFangFa%>"></asp:Label>
                                    </td>
                                    <td style="text-align: left;" class="formItemBgStyle">
                                        <asp:TextBox ID="TB_PhoneNumber" runat="server" Width="95%"></asp:TextBox><span class="auto-style1">*</span>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="text-align: right;" class="formItemBgStyle">
                                        <asp:Label ID="Label20" runat="server" Text="<%$ Resources:lang,YaoQiuDaFuShiJian%>"></asp:Label>： </td>
                                    <td style="text-align: left;" class="formItemBgStyle">
                                        <asp:TextBox ID="DLC_AnswerTime" runat="server"></asp:TextBox>
                                        <ajaxToolkit:CalendarExtender Format="yyyy-MM-dd" ID="CalendarExtender1" runat="server" TargetControlID="DLC_AnswerTime" Enabled="True"></ajaxToolkit:CalendarExtender>
                                    </td>
                                    <td style="text-align: right;" class="formItemBgStyle">
                                        <asp:Label ID="Label15" runat="server" Text="<%$ Resources:lang,LianXiDiZhi%>"></asp:Label>： </td>
                                    <td style="text-align: left;" class="formItemBgStyle">
                                        <asp:TextBox ID="TB_Address" runat="server" Width="99%"></asp:TextBox></td>
                                </tr>
                                <tr>
                                    <td style="text-align: right;" class="formItemBgStyle">
                                        <asp:Label ID="Label34" runat="server" Text="<%$ Resources:lang,EMail%>"></asp:Label>： </td>
                                    <td style="text-align: left;" class="formItemBgStyle">
                                        <asp:TextBox ID="TB_EMail" runat="server" Width="220px"></asp:TextBox>&#160;&#160;</td>
                                    <td style="text-align: right;" class="formItemBgStyle">
                                        <asp:Label ID="Label14" runat="server" Text="<%$ Resources:lang,YouBian%>"></asp:Label>： </td>
                                    <td style="text-align: left;" class="formItemBgStyle">
                                        <asp:TextBox ID="TB_PostCode" runat="server" Width="100px"></asp:TextBox></td>
                                </tr>

                                <tr>
                                    <td style="text-align: center;" colspan="4" class="formItemBgStyle">
                                        <asp:Label ID="Label47" runat="server" Text="<%$ Resources:lang,SHANGJIXINXI%>"></asp:Label>

                                    </td>
                                </tr>

                                <tr>

                                    <td style="text-align: right; width: 15%;" class="formItemBgStyle">
                                        <asp:Label ID="Label12" runat="server" Text="<%$ Resources:lang,YIQICHENGJIAOSHIJIAN%>"></asp:Label>：
                                    </td>
                                    <td style="text-align: left;" class="formItemBgStyle">
                                        <asp:TextBox ID="DLC_ExpectedTime" runat="server"></asp:TextBox>
                                        <cc2:CalendarExtender ID="CalendarExtender2" runat="server" Enabled="True" Format="yyyy-MM-dd" TargetControlID="DLC_ExpectedTime">
                                        </cc2:CalendarExtender>
                                    </td>

                                    <td style="text-align: right; width: 15%;" class="formItemBgStyle">
                                        <asp:Label ID="Label29" runat="server" Text="<%$ Resources:lang,YIQICHENGJIAOJINGE%>"></asp:Label>
                                        ：
                                    </td>
                                    <td style="text-align: left;" class="formItemBgStyle">
                                        <NickLee:NumberBox ID="NB_ExpectedEarnings" runat="server" MaxAmount="1000000000000" MinAmount="-1000000000000" Width="150px">0.00</NickLee:NumberBox>
                                    </td>
                                </tr>

                                <tr>
                                    <td style="text-align: right; width: 15%;" class="formItemBgStyle">
                                        <asp:Label ID="Label32" runat="server" Text="<%$ Resources:lang,CHENGGONGGANJIANYINGSHU%>"></asp:Label>：
                                    </td>
                                    <td width="25%" class="formItemBgStyle">
                                        <asp:TextBox ID="TB_SucessKeyReason" runat="server" Width="99%" />
                                    </td>
                                    <td style="text-align: right; width: 15%;" class="formItemBgStyle">
                                        <asp:Label ID="Label33" runat="server" Text="<%$ Resources:lang,SHIBAIGANJIANYINGSHU%>"></asp:Label>：
                                    </td>
                                    <td style="text-align: left;" class="formItemBgStyle">
                                        <asp:TextBox ID="TB_FailedKeyReason" runat="server" Width="99%"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="formItemBgStyle" style="text-align: right; width: 15%;">
                                        <asp:Label ID="Label48" runat="server" Text="<%$ Resources:lang,ShangJiJieDuan%>"></asp:Label>：
                                    </td>
                                    <td class="formItemBgStyle" width="25%" align="left">
                                        <asp:DropDownList ID="DL_Stage" runat="server" CssClass="DDList" AutoPostBack="true" DataTextField="Stage" DataValueField="Stage" OnSelectedIndexChanged="DL_Stage_SelectedIndexChanged">
                                        </asp:DropDownList>
                                    </td>
                                    <td class="formItemBgStyle" style="text-align: right; width: 15%;">
                                        <asp:Label ID="Label11" runat="server" Text="<%$ Resources:lang,YingLu%>"></asp:Label>：
                                    </td>
                                    <td class="formItemBgStyle" style="text-align: left;">
                                        <NickLee:NumberBox ID="NB_Possibility" runat="server" MaxAmount="1000000000000" MinAmount="-1000000000000" Precision="0" Width="50px">0</NickLee:NumberBox>
                                        %
                                    </td>
                                </tr>

                                <tr>
                                    <td class="formItemBgStyle" style="text-align: right; width: 15%;">
                                        <asp:Label ID="Label35" runat="server" Text="客户商机阶段"></asp:Label>：
                                    </td>
                                    <td class="formItemBgStyle" width="25%" align="left">
                                        <asp:DropDownList ID="DL_CustomerStage" runat="server" CssClass="DDList" DataTextField="Stage" DataValueField="Stage">
                                        </asp:DropDownList>
                                    </td>
                                    <td class="formItemBgStyle" style="text-align: right; width: 15%;">
                                        <asp:Label ID="Label31" runat="server" Text="<%$ Resources:lang,SHANGJIDAILI%>"></asp:Label>
                                        ：</td>
                                    <td class="formItemBgStyle" style="text-align: left;">
                                        <asp:TextBox ID="TB_AgencyName" runat="server" Width="99%" />
                                    </td>
                                </tr>

                                <tr>
                                    <td style="text-align: right; width: 15%;" class="formItemBgStyle">
                                        <asp:Label ID="Label30" runat="server" Text="<%$ Resources:lang,SHANGJILAIYUAN%>"></asp:Label>
                                        ：</td>
                                    <td width="25%" align="left" class="formItemBgStyle" colspan="3">
                                        <asp:TextBox ID="TB_BusinessSource" runat="server" Width="99%" />
                                    </td>

                                </tr>

                                <tr style="display: none;">
                                    <td class="formItemBgStyle" style="text-align: right; width: 15%;">
                                        <asp:Label ID="Label13" runat="server" Text="<%$ Resources:lang,SHANGJIXINXI%>"></asp:Label>
                                        ： </td>
                                    <td align="left" class="formItemBgStyle" width="25%">
                                        <asp:TextBox ID="TB_BusinessName" runat="server" Width="99%"></asp:TextBox>
                                    </td>
                                    <td class="formItemBgStyle" style="text-align: right; width: 15%;">
                                        <asp:Label ID="Label22" runat="server" Text="<%$ Resources:lang,KeHuMingCheng%>"></asp:Label>
                                        ： </td>
                                    <td class="formItemBgStyle">
                                        <asp:TextBox ID="TB_CustomerName" runat="server" Width="99%" />
                                    </td>
                                </tr>
                                <tr style="display: none;">
                                    <td class="formItemBgStyle" style="text-align: right; width: 15%;">
                                        <asp:Label ID="Label28" runat="server" Text="<%$ Resources:lang,KeHuJingLi%>"></asp:Label>
                                    </td>
                                    <td class="formItemBgStyle" align="left">
                                        <asp:TextBox ID="TB_CustomerManager" runat="server"></asp:TextBox>
                                    </td>
                                    <td class="formItemBgStyle" style="text-align: right; width: 15%;">
                                        <asp:Label ID="LB_UserCode" runat="server" Visible="False"></asp:Label>
                                    </td>
                                    <td align="left" class="formItemBgStyle" width="25%">
                                        <asp:Label ID="LB_UserName" runat="server" Visible="False"></asp:Label>
                                        <asp:Label ID="LB_Sql4" runat="server" Visible="False"></asp:Label>
                                        <asp:Label ID="LB_ID" runat="server" Visible="False"></asp:Label>

                                    </td>
                                </tr>
                            </table>


                        </div>

                        <div id="popwindow_footer" class="layui-layer-btn" style="border-top: 1px solid #ccc;">
                            <asp:LinkButton ID="LinkButton1" runat="server" class="layui-layer-btn notTab" OnClick="BT_New_Click" Text="<%$ Resources:lang,BaoCun%>"></asp:LinkButton><a class="layui-layer-btn notTab" onclick="return popClose();"><asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,GuanBi%>" /></a>
                        </div>
                        <span class="layui-layer-setwin"><a onclick="return popClose();" class="layui-layer-ico layui-layer-close layui-layer-close1 notTab" href="javascript:;"></a></span>
                    </div>


                    <div class="layui-layer layui-layer-iframe" id="popDetailWindow" name="noConfirm"
                        style="z-index: 9999; width: 800px; height: 530px; position: absolute; overflow: hidden; display: none; border-radius: 10px;">
                        <div class="layui-layer-title" style="background: #e7e7e8;" id="popwindow_title1">
                            <asp:Label ID="Label9" runat="server" Text="&lt;div&gt;&lt;img src=ImagesSkin/Update.png border=0 width=30px height=30px alt='BusinessForm' /&gt;&lt;/div&gt;"></asp:Label>
                        </div>
                        <div id="popwindow_content1" class="layui-layer-content" style="overflow: auto; text-align: left;">

                            <asp:DataList runat="server" HorizontalAlign="Center" CellPadding="0" ForeColor="#333333" Height="1px" Width="98%"
                                ID="DataList3">
                                <AlternatingItemStyle BackColor="White"></AlternatingItemStyle>
                                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White"></FooterStyle>
                                <HeaderTemplate>
                                    <table width="100%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                        <tr>
                                            <td width="7">
                                                <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" /></td>
                                            <td>
                                                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                    <tr>
                                                        <td width="7%" align="center">
                                                            <strong>
                                                                <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,BianHao%>"></asp:Label></strong>
                                                        </td>
                                                        <td width="10%" align="center">
                                                            <strong>
                                                                <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,LianXiRen%>"></asp:Label></strong>
                                                        </td>
                                                        <td width="20%" align="center">
                                                            <strong>
                                                                <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,LianXiFangShi%>"></asp:Label></strong>
                                                        </td>
                                                        <td width="15%" align="center">
                                                            <strong>
                                                                <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,FuWuFangFa%>"></asp:Label></strong>
                                                        </td>
                                                        <td width="20%" align="center">
                                                            <strong>
                                                                <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,ChuLiShiJian%>"></asp:Label></strong>
                                                        </td>
                                                        <td width="8%" align="center">
                                                            <strong>
                                                                <asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,YongShiChangDu%>"></asp:Label></strong>
                                                        </td>
                                                        <td width="10%" align="center">
                                                            <strong>
                                                                <asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,ZhuangTai%>"></asp:Label></strong>
                                                        </td>
                                                        <td width="10%" align="center">
                                                            <strong>
                                                                <asp:Label ID="Label8" runat="server" Text="<%$ Resources:lang,ShouLiRen%>"></asp:Label></strong>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                            <td width="6" align="right">
                                                <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" /></td>
                                        </tr>
                                    </table>
                                </HeaderTemplate>
                                <ItemStyle CssClass="itemStyle"></ItemStyle>
                                <ItemTemplate>
                                    <table cellpadding="4" cellspacing="0" width="100%">
                                        <tr>
                                            <td class="tdLeft" style="width: 7%; text-align: center;">
                                                <%#DataBinder .Eval (Container .DataItem ,"ID") %> 
                                            </td>
                                            <td class="tdLeft" style="width: 10%; padding-left: 5px; text-align: left;">
                                                <%#DataBinder.Eval(Container.DataItem, "CustomerAcceptor")%>
                                            </td>
                                            <td class="tdLeft" style="width: 20%; text-align: center;">
                                                <%#DataBinder.Eval(Container.DataItem, "AcceptorContactWay")%>
                                            </td>
                                            <td class="tdLeft" style="width: 15%; text-align: center;">
                                                <%#DataBinder.Eval(Container.DataItem, "HandleWay")%>
                                            </td>
                                            <td class="tdLeft" style="width: 20%; text-align: center;">
                                                <%#DataBinder.Eval(Container.DataItem, "HandleTime","{0:yyyy/MM/dd hh:MM:ss}")%>
                                            </td>
                                            <td class="tdLeft" style="width: 8%; text-align: center;">
                                                <%#DataBinder .Eval (Container .DataItem ,"UsedTime") %>
                                                <%#DataBinder .Eval (Container .DataItem ,"TimeUnit") %>       
                                            </td>
                                            <td class="tdLeft" style="width: 10%; text-align: center;">
                                                <%#DataBinder .Eval (Container .DataItem ,"HandleStatus") %>
                                            </td>
                                            <td class="tdRight" style="width: 10%; text-align: center;">
                                                <%#DataBinder .Eval (Container .DataItem ,"OperatorName") %>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="tdLeft" style="width: 5%; text-align: center; font-size: 10pt;">
                                                <asp:Label ID="Label24" runat="server" Text="<%$ Resources:lang,ChuLiNeiRong%>"></asp:Label>
                                            </td>
                                            <td class="tdRight" colspan="7" style="width: 95%; text-align: left; padding-left: 5px">
                                                <%#DataBinder.Eval(Container.DataItem, "HandleDetail")%>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="tdLeft" style="width: 5%; text-align: center; font-size: 10pt;">
                                                <asp:Label ID="Label25" runat="server" Text="<%$ Resources:lang,KeFangPingJia%>"></asp:Label>
                                            </td>
                                            <td class="tdRight" colspan="7" style="width: 95%; text-align: left; padding-left: 5px">
                                                <%#DataBinder.Eval(Container.DataItem, "CustomerComment")%>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="tdLeft" style="width: 5%; text-align: center; font-size: 10pt;">
                                                <asp:Label ID="Label26" runat="server" Text="<%$ Resources:lang,XiaCiFuWuShiJian%>"></asp:Label>
                                            </td>
                                            <td class="tdRight" style="width: 10%; text-align: left; padding-left: 5px">
                                                <%#DataBinder.Eval(Container.DataItem, "NextServiceTime")%>                   
                                            </td>
                                            <td class="tdLeft" style="width: 20%; text-align: center; font-size: 10pt;">
                                                <asp:Label ID="Label27" runat="server" Text="<%$ Resources:lang,TiQianTongZhiTianShu%>"></asp:Label>
                                            </td>
                                            <td class="tdRight" colspan="6" style="text-align: left; padding-left: 5px">
                                                <%#DataBinder.Eval(Container.DataItem, "PreDays")%>                   
                                            </td>
                                        </tr>
                                    </table>
                                </ItemTemplate>
                                <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333"></SelectedItemStyle>
                            </asp:DataList>


                        </div>

                        <div id="popwindow_footer1" class="layui-layer-btn" style="border-top: 1px solid #ccc;">
                            <a class="layui-layer-btn notTab" onclick="return popClose();">
                                <asp:Label ID="Label10" runat="server" Text="<%$ Resources:lang,GuanBi%>" /></a>
                        </div>
                        <span class="layui-layer-setwin"><a onclick="return popClose();" class="layui-layer-ico layui-layer-close layui-layer-close1 notTab" href="javascript:;"></a></span>
                    </div>

                    <div class="layui-layer-shade" id="popwindow_shade" style="z-index: 9998; background-color: #000; opacity: 0.3; filter: alpha(opacity=30); display: none;"></div>



                    <asp:TreeView ID="TreeView1" runat="server" NodeWrap="True" Visible="false" OnSelectedNodeChanged="TreeView1_SelectedNodeChanged"
                        ShowLines="True" Width="220px">
                        <RootNodeStyle CssClass="rootNode" />
                        <NodeStyle CssClass="treeNode" />
                        <LeafNodeStyle CssClass="leafNode" />
                        <SelectedNodeStyle CssClass="selectNode" ForeColor="Red" />
                    </asp:TreeView>


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
