<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTProjectReviewWL.aspx.cs"
    Inherits="TTProjectReviewWL" %>

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
                                                        <asp:Label ID="LB_tiReviewProject" runat="server" Text="<%$ Resources:lang,ReviewProject%>"></asp:Label>
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
                                <table width="100%">
                                    <tr>
                                        <td>
                                            <asp:DataList ID="DataList1" runat="server" Height="1px" CellPadding="0" Width="100%"
                                                ForeColor="#333333">
                                                <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                <HeaderTemplate>
                                                    <table width="98%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                                        <tr>
                                                            <td width="7">
                                                                <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" />
                                                            </td>
                                                            <td>
                                                                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                    <tr>
                                                                        <td width="6%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="LB_dlProjectID" runat="server" Text="<%$ Resources:lang,ProjectID%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="18%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="LB_dlProjectName" runat="server" Text="<%$ Resources:lang,ProjectName%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="8%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="LB_dlCreator" runat="server" Text="<%$ Resources:lang,Creator%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="8%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="LB_dlExpenseBudget" runat="server" Text="<%$ Resources:lang,ExpenseBudget%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="8%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="LB_dlManhourBudget" runat="server" Text="<%$ Resources:lang,ManhourBudget%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="8%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="LB_dlManpowerBudget" runat="server" Text="<%$ Resources:lang,ManpowerBudget%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="12%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="LB_dlStartTime" runat="server" Text="<%$ Resources:lang,StartTime%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="12%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="LB_dlEndTime" runat="server" Text="<%$ Resources:lang,EndTime%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="12%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="LB_dlCreateTime" runat="server" Text="<%$ Resources:lang,CreateTime%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="8%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="LB_dlStatus" runat="server" Text="<%$ Resources:lang,Status%>"></asp:Label></strong>
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
                                                    <table width="98%" cellspacing="0" cellpadding="2">
                                                        <tr>
                                                            <td style="width: 6%; text-align: center;" class="tdLeft">
                                                                <%#DataBinder .Eval (Container .DataItem ,"ProjectID") %>
                                                            </td>
                                                            <td style="width: 18%; text-align: left" class="tdLeft">
                                                                <%#DataBinder .Eval (Container .DataItem,"ProjectName") %>
                                                            </td>
                                                            <td style="width: 8%; text-align: center" class="tdLeft">
                                                                <%#DataBinder .Eval (Container .DataItem,"UserName") %>
                                                            </td>
                                                            <td style="width: 8%; text-align: center" class="tdLeft">
                                                                <%#DataBinder .Eval (Container .DataItem,"Budget") %>
                                                            </td>
                                                            <td style="width: 8%; text-align: center" class="tdLeft">
                                                                <%#DataBinder .Eval (Container .DataItem,"ManHour") %>
                                                            </td>
                                                            <td style="width: 8%; text-align: center" class="tdLeft">
                                                                <%#DataBinder .Eval (Container .DataItem,"ManNumber") %>
                                                            </td>
                                                            <td style="width: 12%; text-align: center" class="tdLeft">
                                                                <%#DataBinder .Eval (Container .DataItem, "BeginDate","{0:yyyy/MM/dd}") %>
                                                            </td>
                                                            <td style="width: 12%; text-align: center" class="tdLeft">
                                                                <%#DataBinder.Eval(Container.DataItem, "EndDate", "{0:yyyy/MM/dd}")%>
                                                            </td>
                                                            <td style="width: 12%; text-align: center" class="tdLeft">
                                                                <%#DataBinder.Eval(Container.DataItem, "MakeDate", "{0:yyyy/MM/dd}")%>
                                                            </td>
                                                            <td style="width: 8%; text-align: center" class="tdRight">
                                                                <%#DataBinder .Eval (Container .DataItem, "Status") %>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td style="width: 6%; text-align: center; font-size: 10pt" class="tdLeft">
                                                                <asp:Label ID="dlDescription" runat="server" Text="<%$ Resources:lang,Description%>"></asp:Label>
                                                            </td>
                                                            <td colspan="9" style="text-align: left" class="tdRight">
                                                                <span style="font-size: 9pt">
                                                                    <%#DataBinder .Eval (Container .DataItem,"ProjectDetail") %>
                                                            </td>
                                                        </tr>
                                                        <%-- <tr>
                                                            <td style="width: 6%; text-align: center; font-size: 10pt" class="tdLeft">
                                                                <asp:Label ID="LB_dlAcceptanceStandard" runat="server" Text="<%$ Resources:lang,AcceptanceStandard%>"></asp:Label>
                                                            </td>
                                                            <td colspan="9" style="text-align: left" class="tdRight">
                                                                <span style="font-size: 9pt">
                                                                    <%#DataBinder .Eval (Container .DataItem,"AcceptStandard") %>
                                                            </td>
                                                        </tr>--%>
                                                        <tr>
                                                            <td colspan="10" style="text-align: left; padding-left: 20px;" class="tdRight">
                                                                <a href='TTDocumentTreeView.aspx?RelatedType=Project&RelatedID=<%#DataBinder .Eval (Container .DataItem ,"ProjectID") %>'
                                                                    target="_blank">
                                                                    <asp:Label ID="LB_dlRelatedDoc" runat="server" Text="<%$ Resources:lang,RelatedDoc%>"></asp:Label>
                                                                </a>
                                                                &nbsp;&nbsp;<a href='TTWorkPlanViewMain.aspx?ProjectID=<%#DataBinder .Eval (Container .DataItem ,"ProjectID") %>'
                                                                    target="DetailArea"><asp:Label ID="Label41" runat="server" Text="<%$ Resources:lang,XiangMuJiHua%>"></asp:Label></a>&nbsp;&nbsp;<a href='TTProjectSummaryAnalystChart.aspx?ProjectID=<%#DataBinder .Eval (Container .DataItem ,"ProjectID") %>'
                                                                        target="DetailArea"><asp:Label ID="Label42" runat="server" Text="<%$ Resources:lang,XiangMuShiTu%>"></asp:Label></a>
                                                                &nbsp;&nbsp;<a href='TTProRelatedUserSummary.aspx?ProjectID=<%#DataBinder .Eval (Container .DataItem ,"ProjectID") %>'
                                                                    target="DetailArea"><asp:Label ID="Label246" runat="server" Text="<%$ Resources:lang,XiangMuChengYuan%>"></asp:Label></a>
                                                                &nbsp;&nbsp;<a href='TTProjectBudgetReport.aspx?ProjectID=<%#DataBinder .Eval (Container .DataItem ,"ProjectID") %>'
                                                                    target="DetailArea"><asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,XiangMuYuSuan%>"></asp:Label></a>
                                                                &nbsp;&nbsp;
                                                                <a href='TTRelatedDIYBusinessForm.aspx?RelatedType=Project&RelatedID=<%#DataBinder .Eval (Container .DataItem ,"ProjectID") %>&IdentifyString= <%# ShareClass.GetWLTemplateIdentifyString(ShareClass.getBusinessFormTemName("Project", Eval("ProjectID").ToString())) %>' target="DetailArea">
                                                                    <asp:Label ID="Label248" runat="server" Text="<%$ Resources:lang,XiangGuanYeWuDan%>"></asp:Label>
                                                                </a>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </ItemTemplate>
                                                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                <ItemStyle CssClass="itemStyle" />
                                            </asp:DataList>

                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: left;">&nbsp;&nbsp;&nbsp;&nbsp; <b>
                                            <asp:Label ID="LB_tbReviewWorkflow" runat="server" Text="<%$ Resources:lang,ReviewWorkflow%>"></asp:Label>
                                        </b>&nbsp;&nbsp;(<asp:HyperLink ID="HL_RelatedWorkFlowTemplate" runat="server" NavigateUrl="TTProRelatedWFTemplate.aspx"
                                            Target="_self" Enabled="false" Text="<%$ Resources:lang,RelatedWFTemplate%>"></asp:HyperLink>)
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: center;">
                                            <table style="width: 98%" cellpadding="2" cellspacing="0" class="formBgStyle">
                                                <tr style="font-size: 10pt">
                                                    <td style="text-align: left; width: 100%;" class="formItemBgStyle">
                                                        <asp:Label ID="LB_tbName" runat="server" Text="<%$ Resources:lang,Name%>"></asp:Label>:<asp:TextBox
                                                            ID="TB_WLName" runat="server" Width="250px"></asp:TextBox>&nbsp;
                                                    <asp:Label ID="LB_tbType" runat="server" Text="<%$ Resources:lang,Type%>"></asp:Label>:<asp:TextBox
                                                        ID="TB_WLKey" runat="server" Width="60px" Enabled="False"></asp:TextBox>
                                                        &nbsp;
                                                    <asp:Label ID="LB_tbWFTemplate" runat="server" Text="<%$ Resources:lang,WFTemplate%>"></asp:Label>:<asp:DropDownList
                                                        ID="DL_TemName" runat="server" DataTextField="TemName" DataValueField="TemName"
                                                        Width="144px">
                                                    </asp:DropDownList>
                                                        &nbsp; &nbsp;<asp:HyperLink ID="HL_WLTem" runat="server" Target="_blank" Text="<%$ Resources:lang,WFTemplate%>"></asp:HyperLink>&nbsp;&nbsp;
                                                    <asp:Label ID="LB_tbKeyWord" runat="server" Text="<%$ Resources:lang,KeyWord%>"></asp:Label>:&nbsp;<asp:TextBox
                                                        ID="TB_KeyWord" Width="80px" runat="server"></asp:TextBox>
                                                        &nbsp;<asp:Button ID="BT_Refrash" runat="server" Text="<%$ Resources:lang,Refresh%>"
                                                            OnClick="BT_Refrash_Click" CssClass="inpu" />
                                                    </td>
                                                </tr>
                                                <tr style="font-size: 10pt">
                                                    <td style="width: 100%; height: 51px;" class="formItemBgStyle" align="left">
                                                        <asp:Label ID="LB_tbDescription" runat="server" Text="<%$ Resources:lang,Description%>"></asp:Label>:<asp:TextBox
                                                            ID="TB_Description" runat="server" TextMode="MultiLine" Width="486px" Height="58px"></asp:TextBox>
                                                    </td>
                                                </tr>
                                                <tr style="font-size: 10pt">
                                                    <td style="text-align: left; width: 100%;" class="formItemBgStyle">
                                                        <span style="font-size: 10pt">（
                                                        <asp:Label ID="LB_tbRequestFeedback" runat="server" Text="<%$ Resources:lang,RequestFeedback%>"></asp:Label>:<asp:CheckBox
                                                            ID="CB_Mail" runat="server" Font-Size="10pt" Text="<%$ Resources:lang,SendEMail%>" />
                                                            <asp:CheckBox ID="CB_SMS" runat="server" Text="<%$ Resources:lang,SendSMS%>" />）
                                                        </span>
                                                        <asp:Button ID="BT_SubmitApply" runat="server" Text="<%$ Resources:lang,TiJiaoShenQing%>"
                                                            CssClass="inpu" />
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
                                <table width="98%" align="center">
                                    <tr>
                                        <td style="text-align: left">
                                            <b>
                                                <asp:Label ID="LB_tbWorkflowList" runat="server" Text="<%$ Resources:lang,WorkflowList%>"></asp:Label>:</b>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="left">
                                            <table width="90%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                                <tr>
                                                    <td width="7">
                                                        <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" />
                                                    </td>
                                                    <td>
                                                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                            <tr>
                                                                <td width="10%" align="center">
                                                                    <strong>
                                                                        <asp:Label ID="LB_dgWorkflowID" runat="server" Text="<%$ Resources:lang,ID%>"></asp:Label></strong>
                                                                </td>
                                                                <td width="50%" align="center">
                                                                    <strong>
                                                                        <asp:Label ID="LB_dgWorkflow" runat="server" Text="<%$ Resources:lang,Workflow%>"></asp:Label></strong>
                                                                </td>
                                                                <td width="20%" align="center">
                                                                    <strong>
                                                                        <asp:Label ID="LB_dgApplyTime" runat="server" Text="<%$ Resources:lang,ApplyTime%>"></asp:Label></strong>
                                                                </td>
                                                                <td width="10%" align="center">
                                                                    <strong>
                                                                        <asp:Label ID="LB_dgStatus" runat="server" Text="<%$ Resources:lang,Status%>"></asp:Label></strong>
                                                                </td>
                                                                <td width="10%" align="center">
                                                                    <strong>&nbsp;</strong>
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
                                                ShowHeader="false" PageSize="5" Width="90%" CellPadding="4" ForeColor="#333333"
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
                                                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" HorizontalAlign="Center" />
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
                                        <asp:Label ID="LB_tbWFActiveMessage" runat="server" Text="<%$ Resources:lang,WFActiveMessage%>"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 420px; padding: 5px 5px 5px 5px;" valign="top" align="left">
                                        <asp:Button ID="BT_ActiveYes" runat="server" CssClass="inpu" Text="<%$ Resources:lang,YES%>"
                                            OnClick="BT_ActiveYes_Click" />&nbsp;&nbsp;<asp:Button ID="BT_ActiveNo" runat="server"
                                                CssClass="inpu" Text="<%$ Resources:lang,NO%>" OnClick="BT_ActiveNo_Click" />
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
