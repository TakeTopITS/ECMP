<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTInvolvedProDetail.aspx.cs"
    Inherits="TTInvolvedProDetail" %>


<%@ Register Assembly="NickLee.Web.UI" Namespace="NickLee.Web.UI" TagPrefix="NickLee" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit.HTMLEditor"
    TagPrefix="cc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link id="mainCss" href="css/bluelightmain.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        #AboveDiv {
            min-width: 1380px;
            width: expression (document.body.clientWidth <= 1380? "1380px" : "auto" ));
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
                        <table id="AboveTable" cellpadding="0" width="100%" cellspacing="0">
                            <tr>
                                <td>
                                    <table cellpadding="0" cellspacing="0" width="100%">
                                        <tr>
                                            <td height="31" class="page_topbj">
                                                <table width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
                                                    <tr>
                                                        <td width="350" align="left">
                                                            <table width="345" border="0" align="left" cellpadding="0" cellspacing="0">
                                                                <tr>
                                                                    <td width="29">
                                                                        <%--<img src="Logo/main_top_l.jpg" alt="" width="29" height="31" />--%>
                                                                    </td>
                                                                    <td align="center" background="ImagesSkin/main_top_bj.jpg" class="titlezi">
                                                                        <asp:Label ID="LB_RunInvolvedProject" runat="server" Text="<%$ Resources:lang,RunInvolvedProject%>" />
                                                                    </td>
                                                                    <td width="5">
                                                                        <%-- <img src="ImagesSkin/main_top_r.jpg" width="5" height="31" />--%>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                        <td align="center" style="padding-top: 5px;">
                                                            <asp:HyperLink ID="HL_ProjectDetailView" runat="server" Text="<%$ Resources:lang,XiangMuXinXi%>"></asp:HyperLink>
                                                            &nbsp;&nbsp;&nbsp;&nbsp;
                                                             <asp:HyperLink ID="HL_BusinessForm" runat="server" Text="<%$ Resources:lang,XiangGuanYeWuDan%>"></asp:HyperLink>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="left" style="padding: 5px 5px 5px 5px;">
                                                <table cellpadding="0" cellspacing="0" width="100%" align="center">
                                                    <tr id="trProjectView" style="display: none;">
                                                        <td style="text-align: left;" width="100%">
                                                            <asp:DataList ID="DataList1" runat="server" Height="1px" CellPadding="0" ForeColor="#333333"
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
                                                                                        <td width="5%" align="center">
                                                                                            <strong>
                                                                                                <asp:Label ID="LB_DLProjectID" runat="server" Text="<%$ Resources:lang,ProjectID%>" /></strong>
                                                                                        </td>
                                                                                        <td width="18%" align="center">
                                                                                            <strong>
                                                                                                <asp:Label ID="LB_DLProjectName" runat="server" Text="<%$ Resources:lang,ProjectName%>" /></strong>
                                                                                        </td>
                                                                                        <td width="6%" align="center">
                                                                                            <strong>
                                                                                                <asp:Label ID="LB_DLProjectType" runat="server" Text="<%$ Resources:lang,ProjectType%>" /></strong>
                                                                                        </td>
                                                                                        <td width="6%" align="center">
                                                                                            <strong>
                                                                                                <asp:Label ID="LB_DLProjectCreator" runat="server" Text="<%$ Resources:lang,ProjectCreator%>" /></strong>
                                                                                        </td>
                                                                                        <td width="6%" align="center">
                                                                                            <strong>
                                                                                                <asp:Label ID="LB_CustomerPM" runat="server" Text="<%$ Resources:lang,CustomerPM%>" /></strong>
                                                                                        </td>
                                                                                        <td width="6%" align="center">
                                                                                            <strong>
                                                                                                <asp:Label ID="LB_DLBudget" runat="server" Text="<%$ Resources:lang,Budget%>" /></strong>
                                                                                        </td>
                                                                                        <td width="5%" align="center">
                                                                                            <strong>
                                                                                                <asp:Label ID="LB_DLManHour" runat="server" Text="<%$ Resources:lang,ManHour%>" /></strong>
                                                                                        </td>
                                                                                        <td width="5%" align="center">
                                                                                            <strong>
                                                                                                <asp:Label ID="LB_DLManPower" runat="server" Text="<%$ Resources:lang,ManPower%>" /></strong>
                                                                                        </td>
                                                                                        <td width="6%" align="center">
                                                                                            <strong>
                                                                                                <asp:Label ID="LB_DLStartTime" runat="server" Text="<%$ Resources:lang,StartTime%>" /></strong>
                                                                                        </td>
                                                                                        <td width="6%" align="center">
                                                                                            <strong>
                                                                                                <asp:Label ID="LB_DLEndTime" runat="server" Text="<%$ Resources:lang,EndTime%>" /></strong>
                                                                                        </td>
                                                                                        <td width="6%" align="center">
                                                                                            <strong>
                                                                                                <asp:Label ID="LB_DLCreateTime" runat="server" Text="<%$ Resources:lang,CreateTime%>" /></strong>
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
                                                                            <td style="width: 5%; text-align: center;" class="tdLeft">
                                                                                <%#DataBinder .Eval (Container .DataItem ,"ProjectID") %>
                                                                            </td>
                                                                            <td style="width: 18%; text-align: left; padding-left: 5px" class="tdLeft">
                                                                                <%#DataBinder .Eval (Container .DataItem,"ProjectName") %>
                                                                            </td>
                                                                            <td style="width: 6%; text-align: center" class="tdLeft">
                                                                                <%#DataBinder .Eval (Container .DataItem,"ProjectType") %>
                                                                            </td>
                                                                            <td style="width: 6%; text-align: center" class="tdLeft">
                                                                                <%#DataBinder .Eval (Container .DataItem,"UserName") %>
                                                                            </td>
                                                                            <td style="width: 6%; text-align: center" class="tdLeft">
                                                                                <%#DataBinder .Eval (Container .DataItem,"CustomerPMName") %>
                                                                            </td>
                                                                            <td style="width: 6%; text-align: center" class="tdLeft">
                                                                                <%#DataBinder .Eval (Container .DataItem,"Budget") %>
                                                                            </td>
                                                                            <td style="width: 5%; text-align: center" class="tdLeft">
                                                                                <%#DataBinder .Eval (Container .DataItem,"ManHour") %>
                                                                            </td>
                                                                            <td style="width: 5%; text-align: center" class="tdLeft">
                                                                                <%#DataBinder .Eval (Container .DataItem,"ManNumber") %>
                                                                            </td>
                                                                            <td style="width: 6%; text-align: center" class="tdLeft">
                                                                                <%#DataBinder .Eval (Container .DataItem, "BeginDate","{0:yyyy/MM/dd}") %>
                                                                            </td>
                                                                            <td style="width: 6%; text-align: center" class="tdLeft">
                                                                                <%#DataBinder.Eval(Container.DataItem, "EndDate", "{0:yyyy/MM/dd}")%>
                                                                            </td>
                                                                            <td style="width: 6%; text-align: center" class="tdRight">
                                                                                <%#DataBinder.Eval(Container.DataItem, "MakeDate", "{0:yyyy/MM/dd}")%>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td style="width: 5%; text-align: center; font-size: 10pt" class="tdLeft">
                                                                                <asp:Label ID="LB_DLDescription" runat="server" Text="<%$ Resources:lang,Description%>" />
                                                                            </td>
                                                                            <td colspan="10" style="text-align: left; padding-left: 5px" class="tdRight">
                                                                                <%#DataBinder .Eval (Container .DataItem,"ProjectDetail") %>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td style="width: 5%; text-align: center; font-size: 10pt" class="tdLeft">
                                                                                <asp:Label ID="LB_DLStatus" runat="server" Text="<%$ Resources:lang,Status%>" />
                                                                            </td>
                                                                            <td style="text-align: left; padding-left: 5px" class="tdLeft">
                                                                                <%#DataBinder .Eval (Container .DataItem,"Status") %>&nbsp;&nbsp;
                                                                            </td>
                                                                            <td style="width: 5%; text-align: center; font-size: 10pt" class="tdLeft">
                                                                                <asp:Label ID="LB_StatusValue" runat="server" Text="<%$ Resources:lang,StatusValue%>" />:
                                                                            </td>
                                                                            <td colspan="8" style="text-align: left; padding-left: 5px" class="tdRight">
                                                                                <%#DataBinder .Eval (Container .DataItem,"StatusValue") %>
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
                                                        <td align="left">
                                                            <table cellpadding="0" cellspacing="0" width="100%" align="center">
                                                                <tr>
                                                                    <td align="left">
                                                                        <asp:DataList ID="DataList2" runat="server" Height="1px" CellPadding="0" ForeColor="#333333"
                                                                            Width="98%">
                                                                            <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                                            <ItemTemplate>
                                                                                <table cellpadding="4" cellspacing="0" width="100%">
                                                                                    <tr>
                                                                                        <td style="text-align: left;" width="30%" class="tdLeft">
                                                                                            <asp:Label ID="LB_MyWorkAndStatus" runat="server" Text="<%$ Resources:lang,MyWorkAndStatus%>" />:
                                                                                            <%#DataBinder .Eval (Container .DataItem,"WorkDetail") %>
                                                                                        &nbsp;&nbsp;&nbsp;&nbsp;
                                                                                            <asp:Label ID="LB_WorkStatus" runat="server" Text="<%$ Resources:lang,WorkStatus%>" />:<span><%#DataBinder .Eval (Container .DataItem,"Status") %></td>
                                                                                    </tr>

                                                                                </table>
                                                                            </ItemTemplate>
                                                                            <ItemStyle CssClass="itemStyle" />
                                                                            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                                                            <SelectedItemStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                                                            <AlternatingItemStyle BackColor="White" ForeColor="#284775" />
                                                                        </asp:DataList>

                                                                        <table width="95%" cellpadding="3" cellspacing="0" class="formBgStyle">
                                                                            <tr>
                                                                                <td style="text-align: left; padding-top: 10px; width: 280px" class="formItemBgStyle">

                                                                                    <asp:Button ID="BT_Receive" runat="server" Text="<%$ Resources:lang,ProjectAgree%>"
                                                                                        CssClass="inpu" OnClick="BT_Receive_Click" />&nbsp;
                                                                                    <asp:Button ID="BT_Refuse" runat="server" Text="<%$ Resources:lang,Refuse%>" OnClick="BT_Refuse_Click"
                                                                                        CssClass="inpu" />&nbsp;
                                                                                    <asp:Button ID="BT_Activity" runat="server" Text="<%$ Resources:lang,Running%>" CssClass="inpu"
                                                                                        OnClick="BT_Activity_Click" />
                                                                                </td>
                                                                                <td class="formItemBgStyle">
                                                                                    <asp:Repeater ID="Repeater1" runat="server">
                                                                                        <ItemTemplate>

                                                                                            <a href='<%# DataBinder.Eval(Container.DataItem,"ModulePage") %>' target="iframe">
                                                                                                <b><%# DataBinder.Eval(Container.DataItem,"HomeModuleName") %> &nbsp; </b>
                                                                                            </a>
                                                                                        </ItemTemplate>
                                                                                    </asp:Repeater>
                                                                                    <br />
                                                                                    &nbsp;

                                                                                      <asp:Repeater ID="Repeater2" runat="server">
                                                                                          <ItemTemplate>
                                                                                              <a href='<%# DataBinder.Eval(Container.DataItem,"ModulePage") %>' target="iframe">
                                                                                                  <%# DataBinder.Eval(Container.DataItem,"HomeModuleName") %> &nbsp;
                                                                                              </a>
                                                                                          </ItemTemplate>
                                                                                      </asp:Repeater>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td colspan="2" style="padding-left: 20px; font-weight: bold; height: 24px; color: #394f66; background-image: url('ImagesSkin/titleBG.jpg')">
                                                                                    <asp:Label ID="LB_TodaySummary" runat="server" Text="<%$ Resources:lang,TodaySummary%>" />
                                                                                    <asp:Label ID="LB_WorkID" runat="server" Text="-1" Visible="False"></asp:Label>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td colspan="2" align="left" class="formItemBgStyle">
                                                                                    <table>
                                                                                        <tr>
                                                                                            <td></td>
                                                                                            <td>
                                                                                                <asp:Label ID="LB_Progress" runat="server" Text="<%$ Resources:lang,Progress%>" />:<NickLee:NumberBox
                                                                                                    ID="NB_FinishPercent" runat="server" Width="60px" MaxAmount="100" MinAmount="0">0.00</NickLee:NumberBox>
                                                                                                <asp:Label ID="Label1" runat="server" Font-Bold="True" Text="%"></asp:Label>
                                                                                                &nbsp;<asp:Label ID="LB_ManHour" runat="server" Text="<%$ Resources:lang,ManHour%>" />:<NickLee:NumberBox MaxAmount="1000000000000"
                                                                                                    ID="NB_ManHour" runat="server" Width="67px" MinAmount="0">0.00</NickLee:NumberBox>&nbsp;
                                                                                             
                                                                                            </td>
                                                                                            <td align="left">
                                                                                                <asp:HyperLink ID="HL_CurrentDailyWorkTask" runat="server" Text="&lt;div&gt;&lt;img src=ImagesSkin/renwu.png border=0 width=20 height=20 alt='DailyTask' /&gt;&lt;/div&gt;"></asp:HyperLink>
                                                                                            </td>
                                                                                            <td>
                                                                                                <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,DiDian%>"></asp:Label>：</td>
                                                                                            <td>
                                                                                                <asp:TextBox ID="TB_WorkAddress" runat="server" Width="250px"></asp:TextBox></td>
                                                                                            <td>
                                                                                                <asp:Repeater ID="Repeater3" runat="server">
                                                                                                    <ItemTemplate>
                                                                                                        <a href='<%# DataBinder.Eval(Container.DataItem,"ModulePage") %>' target="iframe">
                                                                                                            <%# DataBinder.Eval(Container.DataItem,"HomeModuleName") %> &nbsp;
                                                                                                        </a>
                                                                                                    </ItemTemplate>
                                                                                                </asp:Repeater>
                                                                                            </td>
                                                                                        </tr>
                                                                                    </table>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td colspan="2" align="left" class="formItemBgStyle">
                                                                                    <table width="80%">
                                                                                        <tr>
                                                                                            <td width="40px">
                                                                                                <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,RiZhi%>"></asp:Label>：</td>
                                                                                            <td>
                                                                                                <CKEditor:CKEditorControl ID="HE_TodaySummary" runat="server" Width="100%" Height="150" Visible="false" />
                                                                                                <CKEditor:CKEditorControl runat="server" ID="HT_TodaySummary" Width="100%" Height="150px" Visible="false" />
                                                                                            </td>
                                                                                            <td>
                                                                                                <asp:DropDownList ID="DL_Authority" runat="server">
                                                                                                    <asp:ListItem Value="NO" Text="<%$ Resources:lang,BuBaoMi%>" />
                                                                                                    <asp:ListItem Value="YES" Text="<%$ Resources:lang,BaoMi%>" />
                                                                                                </asp:DropDownList>
                                                                                            </td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td width="40px">
                                                                                                <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,ChengGuo%>"></asp:Label>：</td>
                                                                                            <td align="left" style="padding-left: 2px;">
                                                                                                <asp:TextBox ID="TB_Achievement" runat="server" Height="50px" TextMode="MultiLine" Width="95%"></asp:TextBox>
                                                                                            </td>
                                                                                            <td>&nbsp;</td>
                                                                                        </tr>
                                                                                    </table>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td colspan="2" style="text-align: left" class="formItemBgStyle">
                                                                                    <asp:CheckBox ID="CB_ReturnMsg" runat="server" Font-Bold="False" Text="<%$ Resources:lang,SendSMS%>" /><asp:CheckBox
                                                                                        ID="CB_ReturnMail" runat="server" Font-Bold="False" Text="<%$ Resources:lang,SendEMail%>" />
                                                                                    <asp:Label ID="LB_NoticeProjectCreator" runat="server" Text="<%$ Resources:lang,NoticeProjectCreator%>" />
                                                                                    &nbsp;<asp:TextBox ID="TB_Message" runat="server" Width="450px"></asp:TextBox><asp:Button
                                                                                        ID="BT_Send" runat="server" CssClass="inpu" OnClick="BT_Send_Click" Text="<%$ Resources:lang,Send%>" />
                                                                                </td>
                                                                            </tr>
                                                                        </table>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                            <br />
                                                        </td>
                                                    </tr>
                                                    <tr style="height: 15px" class="formItemBgStyle">
                                                        <td style="text-align: left; padding-left: 30px;">
                                                            <asp:Button ID="BT_Summit" runat="server" Text="<%$ Resources:lang,Submit%>" CssClass="inpu"
                                                                OnClick="BT_Summit_Click" Height="21px" />
                                                        </td>
                                                    </tr>
                                                </table>
                                                <br />
                                                <table width="100%" cellpadding="4" cellspacing="0">
                                                    <tr style="height: 15px">
                                                        <td style="text-align: left; height: 5px; padding-left: 40px;">
                                                            <asp:Repeater ID="Repeater4" runat="server">
                                                                <ItemTemplate>
                                                                    <a href='<%# DataBinder.Eval(Container.DataItem,"ModulePage") %>' target="iframe">
                                                                        <%# DataBinder.Eval(Container.DataItem,"HomeModuleName") %> &nbsp;
                                                                    </a>
                                                                </ItemTemplate>
                                                            </asp:Repeater>
                                                         </td>
                                                    </tr>
                                                </table>
                                                <br />

                                                <asp:HyperLink ID="HL_Expense" runat="server" NavigateUrl="TTProExpense.aspx" Target="_blank" Visible="false"
                                                    Text="<%$ Resources:lang,ExpenseDetailAndReimburse%>"></asp:HyperLink>
                                                <NickLee:NumberBox MaxAmount="1000000000000" ID="TB_Charge" runat="server" Width="67px" Visible="False">0.00</NickLee:NumberBox>&nbsp;

                                                <asp:Label ID="LB_UserCode" runat="server" Visible="False"></asp:Label><asp:Label
                                                    ID="LB_UserName" runat="server" Visible="False"></asp:Label><asp:Label
                                                        ID="LB_ProjectID" runat="server" Visible="False"></asp:Label>
                                                <asp:Label ID="LB_PMCode" runat="server" Visible="False"></asp:Label>
                                            </td>
                                        </tr>
                                    </table>
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
<script type="text/javascript" language="javascript">var cssDirectory = '<%=Session["CssDirectory"] %>'; var oLink = document.getElementById('mainCss'); oLink.href = 'css/' + cssDirectory + '/' + 'bluelightmain.css';</script></html>
