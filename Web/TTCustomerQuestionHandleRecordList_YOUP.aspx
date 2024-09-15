<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTCustomerQuestionHandleRecordList_YOUP.aspx.cs" Inherits="TTCustomerQuestionHandleRecordList_YOUP" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register Assembly="NickLee.Web.UI" Namespace="NickLee.Web.UI" TagPrefix="NickLee" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc2" %>
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
            <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="True" EnableScriptLocalization="True">
            </asp:ScriptManager>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <table cellpadding="0" cellspacing="0" border="0" width="100%" class="bian">
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
                                                        <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,KeHuFuWuChuLiJiLu%>"></asp:Label>
                                                    </td>
                                                    <td width="5">
                                                        <%--<img src="ImagesSkin/main_top_r.jpg" width="5" height="31" alt="" />--%></td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td style="padding-top: 5px">
                                <table width="98%">
                                    <tr>
                                        <td style="text-align: Right;">
                                            <asp:DataList ID="DataList2" runat="server" CellPadding="0" ForeColor="#333333" Height="1px"
                                                                Width="100%">
                                                                <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                                <HeaderTemplate>
                                                                    <table width="100%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                                                        <tr>
                                                                            <td>
                                                                                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                                    <tr>
                                                                                        <td width="5%" align="center">
                                                                                            <strong>
                                                                                                <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,BianHao%>"></asp:Label></strong>
                                                                                        </td>
                                                                                        <td width="10%" align="center">
                                                                                            <strong>
                                                                                                <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,XingMing%>"></asp:Label></strong>
                                                                                        </td>
                                                                                        <td width="13%" align="center">
                                                                                            <strong>
                                                                                                <asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,KeHuDengJi%>"></asp:Label></strong>
                                                                                        </td>
                                                                                        <td width="10%" align="center">
                                                                                            <strong>
                                                                                                <asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,KeHuLaiYuan%>"></asp:Label></strong>
                                                                                        </td>
                                                                                        <td width="10%" align="center">
                                                                                            <strong>
                                                                                                <asp:Label ID="Label8" runat="server" Text="<%$ Resources:lang,HangYeLeiXing%>"></asp:Label></strong>
                                                                                        </td>
                                                                                        <td width="5%" align="center">
                                                                                            <strong>
                                                                                                <asp:Label ID="Label9" runat="server" Text="<%$ Resources:lang,DianShu%>"></asp:Label></strong>
                                                                                        </td>
                                                                                        <td width="10%" align="center">
                                                                                            <strong>
                                                                                                <asp:Label ID="Label10" runat="server" Text="<%$ Resources:lang,ShouCiZiXun%>"></asp:Label></strong>
                                                                                        </td>
                                                                                        <td width="5%" align="center">
                                                                                            <strong>
                                                                                                <asp:Label ID="Label11" runat="server" Text="<%$ Resources:lang,XuQiuZiJin%>"></asp:Label></strong>
                                                                                        </td>
                                                                                    </tr>
                                                                                </table>
                                                                            </td>
                                                                        </tr>
                                                                    </table>
                                                                </HeaderTemplate>
                                                                <ItemTemplate>
                                                                    <table border="0" cellpadding="4" cellspacing="0" width="100%">
                                                                        <tr>
                                                                            <td class="tdLeft" style="width: 5%; text-align: center;">
                                                                                <%#DataBinder .Eval (Container .DataItem ,"ID") %>
                                                                            </td>
                                                                            <td class="tdLeft" style="width: 10%; padding-left: 5px; text-align: center;">
                                                                                <%#DataBinder .Eval (Container .DataItem,"Company") %>
                                                                            </td>
                                                                            <td class="tdLeft" style="width: 13%; text-align: center;">
                                                                                <%#DataBinder .Eval (Container .DataItem,"OperatorName") %>
                                                                            </td>
                                                                            <td class="tdLeft" style="width: 10%; text-align: center;">
                                                                                <%#DataBinder .Eval (Container .DataItem,"Address") %>
                                                                            </td>
                                                                            <td class="tdLeft" style="width: 10%; text-align: center;">
                                                                                <%#DataBinder .Eval (Container .DataItem,"UserPosition") %>
                                                                            </td>
                                                                            <td class="tdLeft" style="width: 5%; text-align: center;">
                                                                                <%#DataBinder .Eval (Container .DataItem,"PostCode") %>
                                                                            </td>
                                                                            <td class="tdLeft" style="width: 10%; text-align: center;">
                                                                                <%#DataBinder.Eval(Container.DataItem, "SummitTime","{0:yyyy-MM-dd}")%>
                                                                            </td>
                                                                            <td class="tdLeft" style="width: 5%; text-align: center;">
                                                                                <%#DataBinder .Eval (Container .DataItem, "Type") %>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td class="tdLeft" style="width: 5%; text-align: center; font-size: 10pt;">
                                                                                <asp:Label ID="Label12" runat="server" Text="<%$ Resources:lang,JiBenZiLiao%>"></asp:Label>
                                                                            </td>
                                                                            <td class="tdRight" colspan="9" style="width: 95%; text-align: left; padding-left: 5px">
                                                                                <%#DataBinder .Eval (Container .DataItem,"Question") %>
                                                                            </td>
                                                                        </tr>
                                                                    </table>
                                                                </ItemTemplate>
                                                                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                                
                                                                <ItemStyle CssClass="itemStyle" />
                                                            </asp:DataList>
                                            <table cellpadding="5" cellspacing="0" border="0" width="100%">
                                                <tr>
                                                    <td class="tdTopLine" align="left" width="300px">
                                                        <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,ZhiJieChengYuan%>"></asp:Label>：<asp:DropDownList ID="DL_Operator" DataTextField="UserName" DataValueField="UserCode" runat="server" Width="100px">
                                                    </asp:DropDownList>

                                                        <asp:Button ID="BT_TransferOperator" runat="server" CssClass="inpuLong" Text="<%$ Resources:lang,ZhiDingWeiShouLiRen%>" OnClick="BT_TransferOperator_Click" />
                                                    </td>
                                                    <td width="140px" align="left">
                                                        <asp:HyperLink ID="HL_QuestionToCustomer" runat="server" Target="_blank">--&gt;<asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,ZhuanChengKeHuHuoGuanLianKeHu%>"></asp:Label></asp:HyperLink></td>
                                                    <td align="left">

                                                        <asp:Button ID="BT_CancelDelete" runat="server" CssClass="inpu" OnClick="BT_CancelDelete_Click" Text="<%$ Resources:lang,QuXiaoShanChu%>" Visible="false" />
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="left">
                                            <cc2:TabContainer CssClass="ajax_tab_menu" ID="TabContainer1" runat="server" ActiveTabIndex="0" Width="100%">
                                                <cc2:TabPanel ID="TabPanel1" runat="server" HeaderText="协作日志" TabIndex="0">
                                                    <HeaderTemplate>
                                                        <asp:Label ID="Label13" runat="server" Text="<%$ Resources:lang,KeFuJiLu%>"></asp:Label></HeaderTemplate>
                                                    <ContentTemplate>
                                                        <asp:DataList ID="DataList3" runat="server" CellPadding="0" ForeColor="#333333" 
                                                                            Height="1px" Width="100%">
                                                                            <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                                            <HeaderTemplate>
                                                                                <table width="100%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                                                                    <tr>
                                                                                        <td>
                                                                                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                                                <tr>
                                                                                                    <td width="5%" align="center">
                                                                                                        <strong>
                                                                                                            <asp:Label ID="Label14" runat="server" Text="<%$ Resources:lang,BianHao%>"></asp:Label></strong>
                                                                                                    </td>
                                                                                                    <td width="7%" align="center">
                                                                                                        <strong>
                                                                                                            <asp:Label ID="Label15" runat="server" Text="<%$ Resources:lang,FuWuRiQi%>"></asp:Label></strong>
                                                                                                    </td>
                                                                                                    <td width="5%" align="center">
                                                                                                        <strong>
                                                                                                            <asp:Label ID="Label16" runat="server" Text="<%$ Resources:lang,YeWuRenYuan%>"></asp:Label></strong>
                                                                                                    </td>
                                                                                                    <td width="5%" align="center">
                                                                                                        <strong>
                                                                                                            <asp:Label ID="Label17" runat="server" Text="<%$ Resources:lang,TuiJianYinHang%>"></asp:Label></strong>
                                                                                                    </td>
                                                                                                    <td width="7%" align="center">
                                                                                                        <strong>
                                                                                                            <asp:Label ID="Label18" runat="server" Text="<%$ Resources:lang,ShangMenShiJian%>"></asp:Label></strong>
                                                                                                    </td>
                                                                                                    <td width="8%" align="center">
                                                                                                        <strong>
                                                                                                            <asp:Label ID="Label19" runat="server" Text="<%$ Resources:lang,BanLiYinHang%>"></asp:Label></strong>
                                                                                                    </td>
                                                                                                    <td width="5%" align="center">
                                                                                                        <strong>
                                                                                                            <asp:Label ID="Label20" runat="server" Text="<%$ Resources:lang,JingBanRen%>"></asp:Label></strong>
                                                                                                    </td>
                                                                                                    <td width="7%" align="center">
                                                                                                        <strong>
                                                                                                            <asp:Label ID="Label21" runat="server" Text="<%$ Resources:lang,TiJiaoShiJian%>"></asp:Label></strong>
                                                                                                    </td>
                                                                                                    <td width="5%" align="center">
                                                                                                        <strong>
                                                                                                            <asp:Label ID="Label22" runat="server" Text="<%$ Resources:lang,BanLiQingKuang%>"></asp:Label></strong>
                                                                                                    </td>
                                                                                                    <td width="7%" align="center">
                                                                                                        <strong>
                                                                                                            <asp:Label ID="Label23" runat="server" Text="<%$ Resources:lang,PiKuanShiJian%>"></asp:Label></strong>
                                                                                                    </td>
                                                                                                    <td width="5%" align="center">
                                                                                                        <strong>
                                                                                                            <asp:Label ID="Label24" runat="server" Text="<%$ Resources:lang,QianYue%>"></asp:Label></strong>
                                                                                                    </td>
                                                                                                    <td width="5%" align="center">
                                                                                                        <strong>
                                                                                                            <asp:Label ID="Label25" runat="server" Text="<%$ Resources:lang,FangKuan%>"></asp:Label></strong>
                                                                                                    </td>
                                                                                                    <td width="5%" align="center">
                                                                                                        <strong>
                                                                                                            <asp:Label ID="Label26" runat="server" Text="<%$ Resources:lang,ShouKuanRen%>"></asp:Label></strong>
                                                                                                    </td>
                                                                                                </tr>
                                                                                            </table>
                                                                                        </td>
                                                                                    </tr>
                                                                                </table>
                                                                            </HeaderTemplate>
                                                                            <ItemTemplate>
                                                                                <table cellpadding="4" cellspacing="0" width="100%">
                                                                                    <tr>
                                                                                        <td class="tdLeft" style="width: 5%; text-align: center;">
                                                                                            <asp:Button ID="BT_ID" runat="server" Text=' <%#DataBinder .Eval (Container .DataItem ,"ID") %> ' CssClass="inpu" CommandName="Update" Width="50px" />
                                                                                        </td>
                                                                                        <td class="tdLeft" style="width: 7%; text-align: center;">
                                                                                            <%#DataBinder.Eval(Container.DataItem, "HandleTime","{0:yyyy/MM/dd}")%>
                                                                                        </td>
                                                                                        <td class="tdLeft" style="width: 5%; padding-left: 5px; text-align: left;">
                                                                                            <%#DataBinder.Eval(Container.DataItem, "HandleWay")%>
                                                                                        </td>
                                                                                        <td class="tdLeft" style="width: 5%; text-align: center;">
                                                                                            <%#DataBinder.Eval(Container.DataItem, "AcceptorContactWay")%>
                                                                                        </td>
                                                                                        <td class="tdLeft" style="width: 7%; text-align: center;">
                                                                                            <%#DataBinder.Eval(Container.DataItem, "UpDoorDate","{0:yyyy/MM/dd}")%>
                                                                                        </td>
                                                                                        <td class="tdLeft" style="width: 8%; text-align: center;">
                                                                                            <%#DataBinder .Eval (Container .DataItem ,"CustomerComment") %>
                                                                                        </td>
                                                                                        <td class="tdLeft" style="width: 5%; text-align: center;">
                                                                                            <%#DataBinder .Eval (Container .DataItem ,"CustomerAcceptor") %>
                                                                                        </td>
                                                                                        <td class="tdRight" style="width: 7%; text-align: center;">
                                                                                            <%#DataBinder.Eval(Container.DataItem, "SumApplyTime","{0:yyyy/MM/dd}")%>
                                                                                        </td>
                                                                                        
                                                                                        <td class="tdLeft" style="width: 5%; text-align: center;">
                                                                                            <%#DataBinder .Eval (Container .DataItem ,"DealSituation") %>
                                                                                        </td>
                                                                                        <td class="tdRight" style="width: 7%; text-align: center;">
                                                                                            <%#DataBinder.Eval(Container.DataItem, "NewTime","{0:yyyy/MM/dd}")%>
                                                                                        </td>
                                                                                        <td class="tdLeft" style="width: 5%; text-align: center;">
                                                                                            <%#DataBinder .Eval (Container .DataItem ,"Signing") %>
                                                                                        </td>
                                                                                        <td class="tdLeft" style="width: 5%; text-align: center;">
                                                                                            <%#DataBinder .Eval (Container .DataItem ,"Lending") %>
                                                                                        </td>
                                                                                        <td class="tdLeft" style="width: 5%; text-align: center;">
                                                                                            <%#DataBinder .Eval (Container .DataItem ,"CollectionPer") %>
                                                                                        </td>
                                                                                    </tr>
                                                                                </table>
                                                                            </ItemTemplate>
                                                                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                                            
                                                                            <ItemStyle CssClass="itemStyle" />
                                                                        </asp:DataList>
                                                        <table cellpadding="5" cellspacing="0" border="0" width="100%">
                                                            <tr>
                                                                <td class="tdTopLine"></td>
                                                            </tr>
                                                        </table>
                                                    </ContentTemplate>
                                                </cc2:TabPanel>
                                                <cc2:TabPanel ID="TabPanel2" runat="server" HeaderText="相关文件" TabIndex="1">
                                                    <ContentTemplate>
                                                        <table width="100%" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                                            <tr>
                                                                <td width="7">
                                                                    <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" /></td>
                                                                <td>
                                                                    <table width="100%" cellspacing="0" cellpadding="0">
                                                                        <tr>
                                                                            <td width="10%" align="center"><strong>
                                                                                <asp:Label ID="Label27" runat="server" Text="<%$ Resources:lang,XuHao%>"></asp:Label></strong> </td>
                                                                            <td width="15%" align="center"><strong>
                                                                                <asp:Label ID="Label28" runat="server" Text="<%$ Resources:lang,LeiXing%>"></asp:Label></strong> </td>
                                                                            <td width="25%" align="center"><strong>
                                                                                <asp:Label ID="Label29" runat="server" Text="<%$ Resources:lang,WenJianMing%>"></asp:Label></strong> </td>
                                                                            <td width="15%" align="center"><strong>
                                                                                <asp:Label ID="Label30" runat="server" Text="<%$ Resources:lang,ZuoZhe%>"></asp:Label></strong> </td>
                                                                            <td width="15%" align="center"><strong>
                                                                                <asp:Label ID="Label31" runat="server" Text="<%$ Resources:lang,ShangChuanZhe%>"></asp:Label></strong> </td>
                                                                            <td width="20%" align="center"><strong>
                                                                                <asp:Label ID="Label32" runat="server" Text="<%$ Resources:lang,ShangChuanShiJian%>"></asp:Label></strong> </td>
                                                                        </tr>
                                                                    </table>
                                                                </td>
                                                                <td width="6" align="right">
                                                                    <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" /></td>
                                                            </tr>
                                                        </table>
                                                        <asp:DataGrid ID="DataGrid1" runat="server"
                                                            AutoGenerateColumns="False" ShowHeader="False"
                                                            CellPadding="4" ForeColor="#333333" GridLines="None" Height="1px"
                                                            Width="100%">
                                                            <Columns>
                                                                <asp:BoundColumn DataField="DocID" HeaderText="序号">
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                </asp:BoundColumn>
                                                                <asp:BoundColumn DataField="DocType" HeaderText="类型">
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="15%" />
                                                                </asp:BoundColumn>
                                                                <asp:HyperLinkColumn DataNavigateUrlField="Address" DataNavigateUrlFormatString="{0}"
                                                                    DataTextField="DocName" HeaderText="文件名" Target="_blank">
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="25%" />
                                                                </asp:HyperLinkColumn>
                                                                <asp:BoundColumn DataField="Author" HeaderText="作者">
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="15%" />
                                                                </asp:BoundColumn>
                                                                <asp:BoundColumn DataField="UploadManName" HeaderText="上传者">
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="15%" />
                                                                </asp:BoundColumn>
                                                                <asp:BoundColumn DataField="UploadTime" HeaderText="上传时间">
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="20%" />
                                                                </asp:BoundColumn>
                                                                <asp:BoundColumn DataField="Address" Visible="False"></asp:BoundColumn>
                                                            </Columns>
                                                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" Width="10%" />
                                                            <EditItemStyle BackColor="#2461BF" />
                                                            <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                            <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />
                                                            
                                                            <ItemStyle CssClass="itemStyle" />
                                                        </asp:DataGrid>
                                                    </ContentTemplate>
                                                </cc2:TabPanel>
                                            </cc2:TabContainer>
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
