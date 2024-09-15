<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTConfirmDailyWorkBonus.aspx.cs"
    Inherits="TTConfirmDailyWorkBonus" %>

<%@ Register Assembly="NickLee.Web.UI" Namespace="NickLee.Web.UI" TagPrefix="NickLee" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link id="mainCss" href="css/bluelightmain.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        #AboveDiv {
            min-width: 980px;
            width: expression (document.body.clientWidth <= 980? "980px" : "auto" ));
        }
    </style>
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
                    <div id="AboveDiv">
                        <table id="AboveTable" cellpadding="0" width="100%" cellspacing="0" class="bian">
                            <tr>
                                <td height="31" class="page_topbj">
                                    <table width="96%" border="0" align="center" cellpadding="0" cellspacing="0">
                                        <tr>
                                            <td align="left">
                                                <table width="450" border="0" align="left" cellpadding="0" cellspacing="0">
                                                    <tr>
                                                        <td width="29">
                                                            <%--<img src="Logo/main_top_l.jpg" alt="" width="29" height="31" />--%>
                                                        </td>
                                                        <td align="center" background="ImagesSkin/main_top_bj.jpg" class="titlezi">
                                                            <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,XiangMu%>"></asp:Label>：
                                                        <asp:Label ID="LB_ProjectID" runat="server"></asp:Label>
                                                            &nbsp;<asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,GongZuoRiZhiJiangJinQueRen%>"></asp:Label>
                                                            （<asp:HyperLink ID="HL_ProjectDailyWorkBonusReport" runat="server" Target="_blank">
                                                                <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,GongZuoRiZhiJiangJinBaoBiao%>"></asp:Label>工
                                                            </asp:HyperLink>
                                                            ）
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
                                <td valign="top">
                                    <table width="100%" cellpadding="0" cellspacing="0">
                                        <tr>
                                            <td width="200px" style="padding: 5px 5px 0px 5px; border-right: solid 1px #D8D8D8; vertical-align: top; text-align: left;">
                                                <asp:Button ID="BT_AllMember" runat="server" CssClass="inpuLong" OnClick="BT_AllMember_Click"
                                                    Text="<%$ Resources:lang,SuoYouChengYuanJiangJin%>" /><br />
                                                <asp:TreeView ID="TreeView1" runat="server" NodeWrap="True" OnSelectedNodeChanged="TreeView1_SelectedNodeChanged"
                                                    ShowLines="True" Width="100%">
                                                    <RootNodeStyle CssClass="rootNode" />
                                                    <NodeStyle CssClass="treeNode" />
                                                    <LeafNodeStyle CssClass="leafNode" />
                                                    <SelectedNodeStyle CssClass="selectNode" ForeColor ="Red" />
                                                </asp:TreeView>
                                                <br />
                                            </td>
                                            <td>
                                                <table cellpadding="0" cellspacing="0" width="98%" style="margin-top: 5px">
                                                    <tr>
                                                        <td align="left" style="padding-left: 20px; font-weight: bold; height: 24px; color: #394f66; background-image: url('ImagesSkin/titleBG.jpg')">
                                                            <table style="width: 98%;">
                                                                <tr>
                                                                    <td style="background: #f0f0f0; text-align: left; width: 55%; height: 25px;" colspan="2">
                                                                        <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,ChaXunFanWeiShi%>"></asp:Label>：<asp:Label ID="LB_QueryScope" runat="server"  Font-Names="Arial,宋体"
                                                                            Font-Size="9pt"></asp:Label>
                                                                        <asp:Label ID="LB_Sql" runat="server" Font-Bold="False" Font-Italic="False" Font-Size="11pt"
                                                                            Height="16px"  Visible="False" Width="46px"></asp:Label>

                                                                        <asp:Label ID="LB_UserCode" runat="server" Visible="False"></asp:Label>
                                                                        <asp:Label ID="LB_UserName" runat="server" Font-Size="9pt" Height="19px"
                                                                             Visible="False"></asp:Label>
                                                                    </td>
                                                                    <td style="background: #f0f0f0; text-align: right; width: 45%; height: 25px;" colspan="2">
                                                                        <asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,YuanJiangJinZongE%>"></asp:Label>：<asp:Label ID="LB_Bonus" runat="server"></asp:Label>
                                                                        &nbsp;&nbsp;
                                                                        <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,QueRenJiangJinZongE%>"></asp:Label>：<asp:Label ID="LB_ConfirmBonus" runat="server"></asp:Label>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td valign="top">
                                                            <table style="width: 100%;" cellpadding="0" cellspacing="0">
                                                                <tr>
                                                                    <td style="padding: 5px 5px 0px 5px;">
                                                                        <asp:DataList ID="DataList1" runat="server" Width="100%" OnItemCommand="DataList1_ItemCommand"
                                                                            DataKeyField="WorkID" CellPadding="0" ForeColor="#333333">
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
                                                                                                    <td width="10%" align="center">
                                                                                                        <strong>
                                                                                                            <asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,BianHao%>"></asp:Label></strong>
                                                                                                    </td>
                                                                                                    <td width="15%" align="center">
                                                                                                        <strong>
                                                                                                            <asp:Label ID="Label8" runat="server" Text="<%$ Resources:lang,RiQi%>"></asp:Label></strong>
                                                                                                    </td>
                                                                                                    <td width="35%" align="center">
                                                                                                        <strong>
                                                                                                            <asp:Label ID="Label9" runat="server" Text="<%$ Resources:lang,XiangMu%>"></asp:Label></strong>
                                                                                                    </td>
                                                                                                    <td width="15%" align="center">
                                                                                                        <strong>
                                                                                                            <asp:Label ID="Label10" runat="server" Text="<%$ Resources:lang,YuanJiangJin%>"></asp:Label></strong>
                                                                                                    </td>
                                                                                                    <td width="15%" align="center">
                                                                                                        <strong>
                                                                                                            <asp:Label ID="Label11" runat="server" Text="<%$ Resources:lang,QueRenJiangJin%>"></asp:Label></strong>
                                                                                                    </td>
                                                                                                    <td width="10%" align="center">
                                                                                                        <strong>
                                                                                                            <asp:Label ID="Label12" runat="server" Text="<%$ Resources:lang,WanChengBaiFenBi%>"></asp:Label></strong>
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
                                                                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                                            <ItemTemplate>
                                                                                <table cellpadding="0" cellspacing="0" style="width: 100%">
                                                                                    <tr>
                                                                                        <td style="width: 10%; text-align: center" class="tdLeft">
                                                                                            <%#DataBinder .Eval (Container .DataItem ,"WorkID") %>
                                                                                        </td>
                                                                                        <td style="width: 15%; text-align: center" class="tdLeft">
                                                                                            <%#DataBinder .Eval (Container .DataItem ,"WorkDate","{0:yyyy/MM/dd}") %>
                                                                                        </td>
                                                                                        <td style="width: 35%; text-align: left" class="tdLeft">
                                                                                            <%#DataBinder .Eval (Container .DataItem ,"ProjectName") %>
                                                                                        </td>
                                                                                        <td style="width: 15%; text-align: center" class="tdLeft">
                                                                                            <%#DataBinder.Eval(Container.DataItem, "Bonus", "{0:N2}")%>
                                                                                        </td>
                                                                                        <td style="width: 15%; text-align: center" class="tdLeft">
                                                                                            <asp:TextBox ID="TB_ConfirmBonus" runat="server" Text='<%#DataBinder .Eval (Container .DataItem ,"ConfirmBonus") %>'
                                                                                                Width="90%"></asp:TextBox>
                                                                                        </td>
                                                                                        <td style="width: 10%; text-align: center" class="tdRight">
                                                                                            <%#DataBinder .Eval (Container .DataItem ,"FinishPercent")%>
                                                                                        %
                                                                                        </td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td style="width: 10%; text-align: center" class="tdLeft">
                                                                                            <span style="font-size: 10pt">
                                                                                                <asp:Label ID="Label13" runat="server" Text="<%$ Resources:lang,MeiRiZongJie%>"></asp:Label></span>
                                                                                        </td>
                                                                                        <td colspan="2" style="text-align: left; width: 56%" class="tdLeft">
                                                                                            <span style="font-size: 9pt">&nbsp;<%#DataBinder .Eval (Container .DataItem ,"DailySummary") %></span></td>
                                                                                        <td style="width: 15%; text-align: center" class="tdLeft">
                                                                                            <span style="font-size: 10pt;">
                                                                                                <%#DataBinder .Eval (Container .DataItem ,"UserName") %>
                                                                                            </span>
                                                                                        </td>
                                                                                        <td style="width: 15%;" align="center" class="tdLeft">
                                                                                            <asp:Button ID="BT_Update" runat="server" CssClass="inpu" Text="<%$ Resources:lang,BaoCun%>" CommandName="Update" />
                                                                                        </td>
                                                                                        <td style="width: 10%; text-align: center" class="tdRight">
                                                                                            <a href='TTDailyWorkTaskView.aspx?ProjectID=<%#DataBinder.Eval(Container.DataItem, "ProjectID")%>&UserCode=<%#DataBinder.Eval(Container.DataItem, "UserCode")%>&WorkDate=<%#DataBinder.Eval(Container.DataItem, "WorkDate")%>'
                                                                                                target="_Blank">
                                                                                                <asp:Label ID="Label14" runat="server" Text="<%$ Resources:lang,DangRiRenWu%>"></asp:Label></a><br />
                                                                                            <a href='TTDailyUploadDoc.aspx?ProjectID=<%#DataBinder.Eval(Container.DataItem, "ProjectID")%>&UserCode=<%#DataBinder.Eval(Container.DataItem, "UserCode")%>&WorkDate=<%#DataBinder.Eval(Container.DataItem, "WorkDate")%>'
                                                                                                target="_Blank">
                                                                                                <asp:Label ID="Label15" runat="server" Text="<%$ Resources:lang,DangRiWenDang%>"></asp:Label></a>
                                                                                        </td>
                                                                                    </tr>
                                                                                </table>
                                                                            </ItemTemplate>
                                                                            
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
                                                            </table>
                                                            <br />
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

