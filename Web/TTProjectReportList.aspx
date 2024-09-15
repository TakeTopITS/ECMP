<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTProjectReportList.aspx.cs"
    Inherits="TTProjectReportList" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link id="mainCss" href="css/bluelightmain.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="js/allAHandler.js"></script>
    <script type="text/javascript" language="javascript">$(function () { if (top.location != self.location) { } else { CloseWebPage(); } });</script>
</head>
<body>
    <center>
        <form id="form1" runat="server">
            <div>
                <br />
                <br />
                <%-- <table width="100%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                    <tr>
                        <td width="7">
                            <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" />
                        </td>
                        <td>
                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                    <td align="center">
                                        <strong>
                                            <asp:Label ID="LB_FindByStatus" runat="server" Text="报表列表"></asp:Label></strong>
                                    </td>
                                </tr>
                            </table>
                        </td>
                        <td width="6" align="right">
                            <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" />
                        </td>
                    </tr>
                </table>--%>
                <asp:DataGrid ID="DataGrid1" runat="server" AutoGenerateColumns="False"
                    ShowHeader="false" Height="1px" CellPadding="4"
                    ForeColor="#333333" GridLines="None">
                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <EditItemStyle BackColor="#2461BF" />
                    <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                    <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />
                    <ItemStyle CssClass="itemStyle" />
                    <Columns>
                        <asp:TemplateColumn HeaderText="报表列表">
                            <ItemTemplate>
                                <table>
                                    <tr>
                                        <td align="left" style="height: 25px;font-weight:800;">
                                            <a href='<%# DataBinder.Eval(Container.DataItem,"ModulePage") %>' target="iframe">
                                                <%# DataBinder.Eval(Container.DataItem,"HomeModuleName") %>  
                                            </a>
                                        </td>
                                    </tr>
                                </table>
                            </ItemTemplate>
                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" />
                        </asp:TemplateColumn>
                    </Columns>
                </asp:DataGrid>


                <%--     <table>
                    <tr>
                        <td>
                            <img src="ImagesSkin/docdtl.gif" alt="" />
                        </td>
                        <td style="height: 25px;">
                            <asp:HyperLink ID="HL_ProjectSummaryAnalystChart" runat="server" NavigateUrl="TTProjectSummaryAnalystChart.aspx"
                                Target="iframe">
                                <asp:Label ID="Label29" runat="server" Text="<%$ Resources:lang,XiangMuShiTu%>"></asp:Label>
                            </asp:HyperLink>
                        </td>
                    </tr>

                    <tr>
                        <td>
                            <img src="ImagesSkin/docdtl.gif" alt="" />
                        </td>
                        <td style="height: 25px;">
                            <asp:HyperLink ID="HL_IncomeExpense" runat="server" NavigateUrl="~/TTProjectIncomeExpense.aspx"
                                Target="iframe">
                                <asp:Label ID="Label13" runat="server" Text="<%$ Resources:lang,HeTongShouRuYuFeiYong%>"></asp:Label>
                            </asp:HyperLink>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <img src="ImagesSkin/docdtl.gif" alt="" />
                        </td>
                        <td style="height: 25px;">
                            <asp:HyperLink ID="HL_ExpenseSummary" runat="server" NavigateUrl="~/TTProjectExpenseReport.aspx"
                                Target="iframe">
                                <asp:Label ID="Label12" runat="server" Text="<%$ Resources:lang,YuSuanYiFeiYong%>"></asp:Label>
                            </asp:HyperLink>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <img src="ImagesSkin/docdtl.gif" alt="" />
                        </td>
                        <td style="height: 25px;">
                            <asp:HyperLink ID="HL_ProjectSummaryReport" runat="server" NavigateUrl="TTProjectSummaryReport.aspx"
                                Target="iframe">
                                <asp:Label ID="Label28" runat="server" Text="<%$ Resources:lang,GongZuoLiang%>"></asp:Label>
                            </asp:HyperLink>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <img src="ImagesSkin/docdtl.gif" alt="" />
                        </td>
                        <td style="height: 25px;">
                            <asp:HyperLink ID="HL_DailyWork" runat="server" Target="iframe">
                                <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,GongZuoRiZhi%>"></asp:Label>
                            </asp:HyperLink>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <img src="ImagesSkin/docdtl.gif" alt="" /></td>
                        <td style="height: 25px;">
                            <asp:HyperLink ID="HL_RelatedWorkFlow" runat="server" NavigateUrl="TTProRelatedWorkFlow.aspx"
                                Target="iframe">
                                <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,XiangGuanGongZuoLiu%>"></asp:Label>
                            </asp:HyperLink>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <img src="ImagesSkin/docdtl.gif" alt="" />
                        </td>
                        <td style="height: 25px;">
                            <asp:HyperLink ID="HL_RelatedTask" runat="server" NavigateUrl="TTProRelatedRisk.aspx"
                                Target="iframe">
                                <asp:Label ID="Label10" runat="server" Text="<%$ Resources:lang,XiangMuRenWu%>"></asp:Label>
                            </asp:HyperLink>
                        </td>
                    </tr>

                    <tr>
                        <td>
                            <img src="ImagesSkin/docdtl.gif" alt="" />
                        </td>
                        <td style="height: 25px;">
                            <asp:HyperLink ID="HL_TaskRecordAssignSummary" runat="server" Target="iframe">
                                <asp:Label ID="Label14" runat="server" Text="<%$ Resources:lang,RenWuFenPaiJiLuHuiZong%>"></asp:Label>
                            </asp:HyperLink>
                        </td>
                    </tr>

                    <tr>
                        <td>
                            <img src="ImagesSkin/docdtl.gif" alt="" />
                        </td>
                        <td style="height: 25px;">
                            <asp:HyperLink ID="HL_RelatedReq" runat="server" NavigateUrl="TTProRelatedReqSummary.aspx"
                                Target="iframe">
                                <asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,XiangGuanXuQiu%>"></asp:Label>
                            </asp:HyperLink>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <img src="ImagesSkin/docdtl.gif" alt="" />
                        </td>
                        <td style="height: 25px;">
                            <asp:HyperLink ID="HL_RelatedRisk" runat="server" NavigateUrl="TTProRelatedRisk.aspx"
                                Target="iframe">
                                <asp:Label ID="Label9" runat="server" Text="<%$ Resources:lang,XiangGuanFengXian%>"></asp:Label>
                            </asp:HyperLink>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <img src="ImagesSkin/docdtl.gif" alt="" />
                        </td>
                        <td style="height: 25px;">
                            <asp:HyperLink ID="HL_RelatedUser" runat="server" NavigateUrl="TTProRelatedUser.aspx"
                                Target="iframe">
                                <asp:Label ID="Label8" runat="server" Text="<%$ Resources:lang,XiangMuChengYuan%>"></asp:Label>
                            </asp:HyperLink>
                        </td>
                    </tr>

                    <tr>
                        <td>
                            <img src="ImagesSkin/docdtl.gif" alt="" />
                        </td>
                        <td style="height: 25px;">
                            <asp:HyperLink ID="HL_ImplePlan" runat="server" NavigateUrl="TTWorkPlanMain.aspx"
                                Target="iframe">
                                <asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,ShiShiJiHua%>"></asp:Label>
                            </asp:HyperLink>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <img src="ImagesSkin/docdtl.gif" alt="" />
                        </td>
                        <td style="height: 25px;">
                            <asp:HyperLink ID="HL_WorkSchedule" runat="server" Target="iframe">
                                <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,GongZuoRiCheng%>"></asp:Label>
                            </asp:HyperLink>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <img src="ImagesSkin/docdtl.gif" alt="" />
                        </td>
                        <td style="height: 25px;">
                            <asp:HyperLink ID="HL_WorkPlan" runat="server" Target="iframe">
                                <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,GongZuoJiHua%>"></asp:Label>
                            </asp:HyperLink>
                        </td>
                    </tr>

                    <tr>
                        <td>
                            <img src="ImagesSkin/docdtl.gif" alt="" />
                        </td>
                        <td style="height: 25px;">
                            <asp:HyperLink ID="HL_RelatedDoc" runat="server" NavigateUrl="TTProRelatedDoc.aspx"
                                Target="iframe">
                                <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,XiangGuanWenJian%>"></asp:Label>
                            </asp:HyperLink>
                        </td>
                    </tr>




                    <tr>
                        <td>
                            <img src="ImagesSkin/docdtl.gif" alt="" />
                        </td>
                        <td style="height: 25px;">
                            <asp:HyperLink ID="HL_RelatedMeeting" runat="server" NavigateUrl="TTProRelatedRisk.aspx"
                                Target="iframe">
                                <asp:Label ID="Label11" runat="server" Text="<%$ Resources:lang,XiangMuHuiYi%>"></asp:Label>
                            </asp:HyperLink>
                        </td>
                    </tr>

                    <tr>
                        <td>
                            <img src="ImagesSkin/docdtl.gif" alt="" />
                        </td>
                        <td style="height: 25px;">
                            <asp:HyperLink ID="HL_StatusChangeRecord" runat="server" NavigateUrl="TTUserFeebackSummary.aspx"
                                Target="iframe">
                                <asp:Label ID="Label15" runat="server" Text="<%$ Resources:lang,ZhuangTaiBianGengJiLu%>"></asp:Label>
                            </asp:HyperLink>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <img src="ImagesSkin/docdtl.gif" alt="" />
                        </td>
                        <td style="height: 25px;">
                            <asp:HyperLink ID="HL_LeadReview" runat="server" NavigateUrl="TTLeadReviewSummary.aspx"
                                Target="iframe">
                                <asp:Label ID="Label16" runat="server" Text="<%$ Resources:lang,ShangJiPingHeHuiZong%>"></asp:Label>
                            </asp:HyperLink>
                        </td>
                    </tr>

                    <tr>
                        <td>
                            <img src="ImagesSkin/docdtl.gif" alt="" />
                        </td>
                        <td style="height: 25px;">
                            <asp:HyperLink ID="HL_ProjectRelatedItemReport" NavigateUrl="TTProjectRelatedItemReport.aspx" runat="server" Text="<%$ Resources:lang,XiangMuGuanLianLiaoPing%>" Target="iframe"> </asp:HyperLink>

                        </td>
                    </tr>

                    <tr>
                        <td>
                            <img src="ImagesSkin/docdtl.gif" alt="" />
                        </td>
                        <td style="height: 25px;">
                            <asp:HyperLink ID="HL_ProjectGoodsPurchaseReport" runat="server" NavigateUrl="TTProjectGoodsPurchaseReport.aspx"
                                Target="iframe">
                                <asp:Label ID="Label25" runat="server" Text="<%$ Resources:lang,GoodsCaiGouShenQingBaoBiao%>"></asp:Label>
                            </asp:HyperLink>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <img src="ImagesSkin/docdtl.gif" alt="" />
                        </td>
                        <td style="height: 25px;">
                            <asp:HyperLink ID="HL_GoodsApplicationWL" runat="server" NavigateUrl="~/TTGoodsApplicationWF.aspx"
                                Target="iframe">
                                <asp:Label ID="Label26" runat="server" Text="<%$ Resources:lang,GoodsLingYongShenQingBaoBiao%>"></asp:Label>
                            </asp:HyperLink>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <img src="ImagesSkin/docdtl.gif" alt="" />
                        </td>
                        <td style="height: 25px;">
                            <asp:HyperLink ID="HL_GoodsShipmentReport" runat="server" NavigateUrl="~/TTGoodsShipmentReport.aspx"
                                Target="iframe">
                                <asp:Label ID="Label27" runat="server" Text="<%$ Resources:lang,GoodsChuKuBaoBiao%>"></asp:Label>
                            </asp:HyperLink>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <img src="ImagesSkin/docdtl.gif" alt="" />
                        </td>
                        <td style="height: 25px;">
                            <asp:HyperLink ID="HL_ProjectAssetPurchaseReport" runat="server" NavigateUrl="TTProjectAssetPurchaseReport.aspx"
                                Target="iframe">
                                <asp:Label ID="Label17" runat="server" Text="<%$ Resources:lang,ZiChanCaiGouShenQingBaoBiao%>"></asp:Label>
                            </asp:HyperLink>
                        </td>
                    </tr>

                    <tr>
                        <td>
                            <img src="ImagesSkin/docdtl.gif" alt="" />
                        </td>
                        <td style="height: 25px;">
                            <asp:HyperLink ID="HL_AssetApplicationWL" runat="server" NavigateUrl="~/TTAssetApplicationWF.aspx"
                                Target="iframe">
                                <asp:Label ID="Label18" runat="server" Text="<%$ Resources:lang,ZiChanLingYongShenQingBaoBiao%>"></asp:Label>
                            </asp:HyperLink>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <img src="ImagesSkin/docdtl.gif" alt="" />
                        </td>
                        <td style="height: 25px;">
                            <asp:HyperLink ID="HL_AssetShipmentReport" runat="server" NavigateUrl="~/TTAssetShipmentReport.aspx"
                                Target="iframe">
                                <asp:Label ID="Label19" runat="server" Text="<%$ Resources:lang,ZiChanChuKuBaoBiao%>"></asp:Label>
                            </asp:HyperLink>
                        </td>
                    </tr>

                    <tr>
                        <td>
                            <img src="ImagesSkin/docdtl.gif" alt="" />
                        </td>
                        <td style="height: 25px;">
                            <asp:HyperLink ID="HL_ContactListView" runat="server" NavigateUrl="TTContactListView.aspx"
                                Target="iframe">
                                <asp:Label ID="Label20" runat="server" Text="<%$ Resources:lang,XiangMuLianXiRenLieBian%>"></asp:Label>
                            </asp:HyperLink>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <img src="ImagesSkin/docdtl.gif" alt="" />
                        </td>
                        <td style="height: 25px;">
                            <asp:HyperLink ID="HL_CustomerInfo" runat="server" NavigateUrl="TTProjectCustomerView.aspx"
                                Target="iframe">
                                <asp:Label ID="Label21" runat="server" Text="<%$ Resources:lang,GuanLianKeHu%>"></asp:Label>
                            </asp:HyperLink>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <img src="ImagesSkin/docdtl.gif" alt="" />
                        </td>
                        <td style="height: 25px;">
                            <asp:HyperLink ID="HL_VendorInfo" runat="server" NavigateUrl="TTProjectVendorView.aspx"
                                Target="iframe">
                                <asp:Label ID="Label22" runat="server" Text="<%$ Resources:lang,GuanLianGongYingShang%>"></asp:Label>
                            </asp:HyperLink>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <img src="ImagesSkin/docdtl.gif" alt="" />
                        </td>
                        <td style="height: 25px;">
                            <asp:HyperLink ID="HL_TransferProject" runat="server" NavigateUrl="~/TTTransferProjectRecord.aspx"
                                Target="iframe">
                                <asp:Label ID="Label23" runat="server" Text="<%$ Resources:lang,ZhuYaoRenYuanBianGengJiLu%>"></asp:Label>
                            </asp:HyperLink>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <img src="ImagesSkin/docdtl.gif" alt="" />
                        </td>
                        <td style="height: 25px;">
                            <asp:HyperLink ID="HL_ProjectChildTree" runat="server" NavigateUrl="~/TTProjectChildTree.aspx"
                                Target="iframe">
                                <asp:Label ID="Label24" runat="server" Text="<%$ Resources:lang,ZiXiangMuShu%>"></asp:Label>
                            </asp:HyperLink>
                        </td>
                    </tr>
                </table>--%>
            </div>
        </form>
    </center>
</body>
<script type="text/javascript" language="javascript">var cssDirectory = '<%=Session["CssDirectory"] %>'; var oLink = document.getElementById('mainCss'); oLink.href = 'css/' + cssDirectory + '/' + 'bluelightmain.css';</script></html>
