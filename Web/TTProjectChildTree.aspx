<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTProjectChildTree.aspx.cs"
    Inherits="TTProjectChildTree" %>

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

                    <table cellpadding="0" cellspacing="0" width="100%" class="bian">
                        <tr>
                            <td height="31" class="page_topbj">
                                <table width="96%" border="0" align="center" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td align="left">
                                            <table width="345" border="0" align="left" cellpadding="0" cellspacing="0">
                                                <tr>
                                                    <td width="29">
                                                        <%--<img src="Logo/main_top_l.jpg" alt="" width="29" height="31" />--%></td>
                                                    <td align="center" background="ImagesSkin/main_top_bj.jpg" class="titlezi">
                                                        <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,XiangMuShuYuLan%>"></asp:Label>
                            <asp:Label ID="LB_ProjectID" Visible="false" runat="server" ></asp:Label>
                                                        <asp:Label ID="LB_ProjectName" Visible="false" runat="server" ></asp:Label>
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
                                <table width="100%" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td valign="top" width="220px" align="left" style="padding: 5px 5px 0px 5px; border-right: solid 1px #D8D8D8">
                                            <asp:TreeView ID="TreeView1" runat="server" OnSelectedNodeChanged="TreeView1_SelectedNodeChanged"
                                                ShowLines="True" Width="220px" NodeWrap="True">
                                                <RootNodeStyle CssClass="rootNode" /><NodeStyle CssClass="treeNode" /><LeafNodeStyle CssClass="leafNode" /><SelectedNodeStyle CssClass="selectNode" ForeColor ="Red" />
                                            </asp:TreeView>
                                        </td>
                                        <td style="width: 100%; height: 1px; vertical-align: top;">
                                            <table width="99%" cellpadding="0" cellspacing="5">
                                                <tr>
                                                    <td align="left">
                                                        <asp:Label ID="LB_ProDetail" runat="server" Font-Bold="False" Text="<%$ Resources:lang,XiangMuXiangXiNeiRong%>" Visible="False"></asp:Label>
                                                        <asp:Label ID="LB_UserCode" runat="server"  Visible="False"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:DataList ID="DataList1" runat="server" Width="100%" CellPadding="0" ForeColor="#333333">
                                                            <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                            <ItemTemplate>
                                                                <table style="width: 99%;" class="bian" cellpadding="4" cellspacing="0">
                                                                    <tr>
                                                                        <td style="width: 10%; height: 9px; text-align: right">
                                                                            <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,BianHao%>"></asp:Label>:
                                                                        </td>
                                                                        <td colspan="3" style="height: 9px; text-align: left">
                                                                            <%#DataBinder .Eval (Container .DataItem ,"ProjectID") %>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td style="text-align: right">
                                                                            <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,MingCheng%>"></asp:Label>:
                                                                        </td>
                                                                        <td style="text-align: left; height: 9px; width: 40%">
                                                                            <%#DataBinder .Eval (Container .DataItem,"ProjectName") %>
                                                                        </td>
                                                                        <td style="width: 10%; text-align: right">
                                                                            <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,FeiYongYuSuan%>"></asp:Label>:
                                                                        </td>
                                                                        <td style="width: 40%; text-align: left">
                                                                            <%#DataBinder .Eval (Container .DataItem,"Budget") %>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td style="text-align: right">
                                                                            <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,XiangMuJingLi%>"></asp:Label>:
                                                                        </td>
                                                                        <td style="text-align: left">
                                                                            <%#DataBinder .Eval (Container .DataItem,"PMName") %>
                                                                        </td>
                                                                        <td style="text-align: right">
                                                                            <asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,RenLiYuSuan%>"></asp:Label>:
                                                                        </td>
                                                                        <td style="text-align: left">
                                                                            <%#DataBinder .Eval (Container .DataItem,"ManNumber") %>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td style="text-align: right;">
                                                                            <asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,LiXiangRen%>"></asp:Label>:
                                                                        </td>
                                                                        <td style="text-align: left">
                                                                            <%#DataBinder .Eval (Container .DataItem,"UserName") %>
                                                                        </td>
                                                                        <td style="text-align: right;">
                                                                            <asp:Label ID="Label8" runat="server" Text="<%$ Resources:lang,GongShiYuSuan%>"></asp:Label>:
                                                                        </td>
                                                                        <td style="text-align: left">
                                                                            <%#DataBinder .Eval (Container .DataItem,"ManHour") %>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td style="text-align: right">
                                                                            <asp:Label ID="Label9" runat="server" Text="<%$ Resources:lang,KaiShiRiQi%>"></asp:Label>:
                                                                        </td>
                                                                        <td style="text-align: left">
                                                                            <%#DataBinder .Eval (Container .DataItem, "BeginDate","{0:yyyy/MM/dd}") %>
                                                                        </td>
                                                                        <td style="text-align: right">
                                                                            <asp:Label ID="Label10" runat="server" Text="<%$ Resources:lang,JieShuShiJian%>"></asp:Label>:
                                                                        </td>
                                                                        <td style="text-align: left">
                                                                            <%#DataBinder.Eval(Container.DataItem, "EndDate", "{0:yyyy/MM/dd}")%>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td style="text-align: right">
                                                                            <asp:Label ID="Label11" runat="server" Text="<%$ Resources:lang,LiXiangRiQi%>"></asp:Label>:
                                                                        </td>
                                                                        <td style="text-align: left">
                                                                            <%#DataBinder.Eval(Container.DataItem, "MakeDate", "{0:yyyy/MM/dd}")%>
                                                                        </td>
                                                                        <td style="text-align: right">
                                                                            <asp:Label ID="Label12" runat="server" Text="<%$ Resources:lang,ZhuangTai%>"></asp:Label>:
                                                                        </td>
                                                                        <td style="text-align: left">
                                                                            <%#DataBinder .Eval (Container .DataItem, "Status") %>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td style="text-align: right;">
                                                                            <asp:Label ID="Label13" runat="server" Text="<%$ Resources:lang,XiangXiYaoQiu%>"></asp:Label>:
                                                                        </td>
                                                                        <td colspan="7" style="width: 700px; text-align: left">
                                                                            <%#DataBinder .Eval (Container .DataItem,"ProjectDetail") %>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td style="text-align: right;">
                                                                            <asp:Label ID="Label14" runat="server" Text="<%$ Resources:lang,YanShouBiaoZhun%>"></asp:Label>:
                                                                        </td>
                                                                        <td colspan="7" style="width: 700px; text-align: left">
                                                                            <%#DataBinder .Eval (Container .DataItem,"AcceptStandard") %>
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </ItemTemplate>
                                                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                            
                                                            <ItemStyle BackColor="#EFF3FB" />
                                                        </asp:DataList>
                                                        <br />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="left">
                                                        <asp:Label ID="LB_DailyWork" runat="server" Text="<%$ Resources:lang,XiangMuWanChengQingKuang%>" Font-Bold="False" Visible="False"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <table width="98%" cellpadding="4" cellspacing="0">
                                                            <tr>
                                                                <td>
                                                                    <asp:HyperLink ID="HL_DailyWorkReport" runat="server" NavigateUrl="TTProjectDailyWorkReport.aspx"
                                                                        Target="_blank" Visible="False">
                                                                        <asp:Label ID="Label15" runat="server" Text="<%$ Resources:lang,XiangMuRiZhi%>"></asp:Label></asp:HyperLink>
                                                                </td>
                                                                <td>
                                                                    <asp:HyperLink ID="HL_TaskRecordAssignSummary" runat="server"
                                                                        Target="_blank" Visible="False">
                                                                        <asp:Label ID="Label16" runat="server" Text="<%$ Resources:lang,XiangMuRenWu%>"></asp:Label></asp:HyperLink>
                                                                </td>
                                                                <td>
                                                                    <asp:HyperLink ID="HL_RelatedDoc" runat="server"
                                                                        NavigateUrl="TTDocumentTreeView.aspx" Target="_blank" Visible="False">
                                                                        <asp:Label ID="Label17" runat="server" Text="<%$ Resources:lang,XiangMuWenDang%>"></asp:Label></asp:HyperLink>
                                                                </td>
                                                                <td>
                                                                    <asp:HyperLink ID="HL_ImplePlan" runat="server" NavigateUrl="TTWorkPlanMain.aspx"
                                                                        Target="_blank" Visible="False">
                                                                        <asp:Label ID="Label18" runat="server" Text="<%$ Resources:lang,ShiShiJiHua%>"></asp:Label></asp:HyperLink>
                                                                </td>
                                                                <td>
                                                                    <asp:HyperLink ID="HL_RelatedUser" runat="server" NavigateUrl="TTProRelatedUser.aspx"
                                                                        Target="_blank" Visible="False">
                                                                        <asp:Label ID="Label19" runat="server" Text="<%$ Resources:lang,XiangMuChengYuan%>"></asp:Label></asp:HyperLink>
                                                                </td>
                                                                <td>
                                                                    <asp:HyperLink ID="HL_ExpenseSummary" runat="server"
                                                                        NavigateUrl="~/TTProjectExpenseReport.aspx" Target="_blank" Visible="False">
                                                                        <asp:Label ID="Label20" runat="server" Text="<%$ Resources:lang,XiangMuFeiYong%>"></asp:Label></asp:HyperLink>
                                                                </td>
                                                                <td>
                                                                    <asp:HyperLink ID="HL_RelatedRisk" runat="server"
                                                                        NavigateUrl="TTProRelatedRisk.aspx" Target="_blank" Visible="False">
                                                                        <asp:Label ID="Label21" runat="server" Text="<%$ Resources:lang,XiangGuanFengXian%>"></asp:Label></asp:HyperLink>
                                                                </td>
                                                                <td>
                                                                    <asp:HyperLink ID="HL_RelatedReq" runat="server"
                                                                        NavigateUrl="TTProRelatedReqSummary.aspx" Target="_blank" Visible="False">
                                                                        <asp:Label ID="Label22" runat="server" Text="<%$ Resources:lang,XiangMuXuQiu%>"></asp:Label></asp:HyperLink>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <asp:HyperLink ID="HL_RelatedMeeting" runat="server"
                                                                        NavigateUrl="TTProRelatedRisk.aspx" Target="_blank" Visible="False">
                                                                        <asp:Label ID="Label23" runat="server" Text="<%$ Resources:lang,XiangMuHuiYi%>"></asp:Label></asp:HyperLink>
                                                                </td>
                                                                <td>
                                                                    <asp:HyperLink ID="HL_StatusChangeRecord" runat="server" NavigateUrl="TTUserFeebackSummary.aspx"
                                                                        Target="_blank" Visible="False">
                                                                        <asp:Label ID="Label24" runat="server" Text="<%$ Resources:lang,ZhuangTaiBianGengJiLu%>"></asp:Label></asp:HyperLink>
                                                                </td>
                                                                <td>
                                                                    <asp:HyperLink ID="HL_LeadReview" runat="server" NavigateUrl="TTLeadReviewSummary.aspx"
                                                                        Target="_blank" Visible="False">
                                                                        <asp:Label ID="Label33" runat="server" Text="<%$ Resources:lang,ShangJiPingHeHuiZong%>"></asp:Label></asp:HyperLink>
                                                                </td>
                                                                <td>
                                                                    <asp:HyperLink ID="HL_TransferProject" runat="server" NavigateUrl="~/TTTransferProjectRecord.aspx"
                                                                        Target="_blank" Visible="False">
                                                                        <asp:Label ID="Label25" runat="server" Text="<%$ Resources:lang,XiangMuJingLiBianGengJiLu%>"></asp:Label></asp:HyperLink>
                                                                </td>
                                                                <td>
                                                                    <asp:HyperLink ID="HL_CustomerInfo" runat="server" Font-Size="10pt" NavigateUrl="~/TTCustomerInfo.aspx"
                                                                        Target="_blank" Visible="False">
                                                                        <asp:Label ID="Label26" runat="server" Text="<%$ Resources:lang,KeHuZiLiao%>"></asp:Label></asp:HyperLink>
                                                                </td>
                                                                <td>
                                                                    <asp:HyperLink ID="HL_VendorInfo" runat="server" Font-Size="10pt" NavigateUrl="~/TTVendorInfo.aspx"
                                                                        Target="_blank" Visible="False">
                                                                        <asp:Label ID="Label27" runat="server" Text="<%$ Resources:lang,GongYingShangZiLiao%>"></asp:Label></asp:HyperLink>
                                                                </td>
                                                                <td>&nbsp;</td>
                                                                <td></td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:DataList ID="DataList2" runat="server" Width="98%" CellPadding="0" ForeColor="#333333">
                                                            <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                            <ItemTemplate>
                                                                <table style="width: 100%;" class="bian" cellpadding="4" cellspacing="0">
                                                                    <tr>
                                                                        <td style="width: 10%; height: 20px; text-align: right">
                                                                            <asp:Label ID="Label28" runat="server" Text="<%$ Resources:lang,ChengYuan%>"></asp:Label>:
                                                                        </td>
                                                                        <td style="width: 40%; height: 20px;" align="left">
                                                                            <%#DataBinder .Eval (Container .DataItem ,"UserName") %>
                                                                        </td>
                                                                        <td style="width: 10%; height: 20px; text-align: right">
                                                                            <asp:Label ID="Label29" runat="server" Text="<%$ Resources:lang,RiQi%>"></asp:Label>:
                                                                        </td>
                                                                        <td width="40%" align="left">
                                                                            <%#DataBinder .Eval (Container .DataItem, "WorkDate","{0:yyyy/MM/dd}") %>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td style="height: 20px; text-align: right">
                                                                            <asp:Label ID="Label30" runat="server" Text="<%$ Resources:lang,FeiYong%>"></asp:Label>:
                                                                        </td>
                                                                        <td style="height: 20px;" align="left">
                                                                            <%#DataBinder .Eval (Container .DataItem ,"Charge") %>
                                                                        </td>
                                                                        <td style="height: 20px; text-align: right">
                                                                            <asp:Label ID="Label31" runat="server" Text="<%$ Resources:lang,WanChengBaiFenBi%>"></asp:Label>:
                                                                        </td>
                                                                        <td align="left">
                                                                            <%#DataBinder .Eval (Container .DataItem ,"FinishPercent")%>%
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td style="text-align: right">
                                                                            <asp:Label ID="Label32" runat="server" Text="<%$ Resources:lang,MeiRiZongJie%>"></asp:Label>:
                                                                        </td>
                                                                        <td colspan="3" style="text-align: left">
                                                                            <%#DataBinder .Eval (Container .DataItem ,"DailySummary") %>
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </ItemTemplate>
                                                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                            
                                                            <ItemStyle CssClass="itemStyle" />
                                                        </asp:DataList>
                                                        <br />
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
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
