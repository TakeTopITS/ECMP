<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTAppContactList.aspx.cs" Inherits="TTAppContactList" %>

<meta name="viewport" content="width=device-width; initial-scale=1.0; maximum-scale=1.0; minimum-scale=0.1; user-scalable=1" />

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register Assembly="NickLee.Web.UI" Namespace="NickLee.Web.UI" TagPrefix="NickLee" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link id="mainCss" href="css/bluelightmain.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        body {
            /*margin-top: 5px;*/
            /*background-image: url(Images/login_bj.jpg);*/
            background-repeat: repeat-x;
            font: normal 100% Helvetica, Arial, sans-serif;
        }
    </style>

    <style type="text/css">
        #AboveDiv {
            max-width: 1024px;
            width: expression (document.body.clientWidth >= 1024? "1024px" : "auto" ));
            min-width: 277px;
            width: expression (document.body.clientWidth <= 277? "277px" : "auto" ));
        }
    </style>

    <script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="js/allAHandler.js"></script>
    <script type="text/javascript" language="javascript">
        $(function () {

            //

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
                                                <%--<a href="javascript:window.history.go(-1)" target ="_top" onclick="javascript:document.getElementById('IMG_Waiting').style.display = 'block';">--%>
                                                    <a href="javascript:window.history.go(-1)" target ="_top" onclick="javascript:document.getElementById('IMG_Waiting').style.display = 'block';">
                                                    <table width="245" border="0" align="left" cellpadding="0" cellspacing="0">
                                                        <tr>
                                                            <td width="29">
                                                                <img src="ImagesSkin/return.png" alt="" width="29" height="31" /></td>
                                                            <td align="center" background="ImagesSkin/main_top_bj.jpg" class="titleziAPP"><asp:Label runat ="server" Text="<%$ Resources:lang,Back%>" />
                                                            </td>
                                                            <td width="5">
                                                                <%-- <img src="ImagesSkin/main_top_r.jpg" width="5" height="31" />--%></td>
                                                        </tr>
                                                    </table>
                                                     <img id="IMG_Waiting" src="Images/Processing.gif" alt="请稍候，处理中..." style="display: none;" />
                                                </a>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <table style="width: 98%">
                                        <tr>
                                            <td width="100%" align="left">
                                                <cc1:TabContainer CssClass="ajax_tab_menu" ID="TabContainer1" runat="server" ActiveTabIndex="0" Width="98%">
                                                    <cc1:TabPanel ID="TabPanel1" runat="server" HeaderText="联系人列表">
                                                        <ContentTemplate>
                                                              <table width="99%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                                                <tr>
                                                                    <td width="7">
                                                                        <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" /></td>
                                                                    <td>
                                                                            <table width="100%" cellpadding="4" cellspacing="0">
                                                                            <tr>
                                                                                <td width="100%" align="center">
                                                                                    <asp:TextBox ID="TB_ContactName" runat="server"
                                                                                        Width="60%"></asp:TextBox>
                                                                                    &nbsp;<asp:Button ID="BT_Find" runat="server" CssClass="inpu" OnClick="BT_Find_Click"
                                                                                        Text="<%$ Resources:lang,ChaXun %>" />
                                                                                    </span>
                                                                                </td>
                                                                            </tr>
                                                                        </table>
                                                                    </td>
                                                                    <td width="6" align="right">
                                                                        <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" /></td>
                                                                </tr>
                                                            </table> 
                                                            <asp:DataGrid ID="DataGrid1" runat="server" AutoGenerateColumns="False"
                                                                Font-Bold="True" Height="1px" OnPageIndexChanged="DataGrid1_PageIndexChanged"
                                                                ShowHeader="False" OnItemCommand="DataGrid1_ItemCommand" Width="99%"
                                                                CellPadding="4" ForeColor="#333333" GridLines="None">
                                                                <Columns>
                                                                    <asp:BoundColumn DataField="ID" HeaderText="序号" Visible="False">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:TemplateColumn HeaderText="姓名">
                                                                        <ItemTemplate>
                                                                            <asp:Button CssClass="inpuLongest" ID="BT_FirstName" runat="server" Text='<%# DataBinder.Eval(Container.DataItem,"FirstName") %>' />
                                                                        </ItemTemplate>
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="100%" />
                                                                    </asp:TemplateColumn>
                                                                </Columns>
                                                                
                                                                <ItemStyle CssClass="itemStyle" />
                                                                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                                <EditItemStyle BackColor="#2461BF" />
                                                                <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                            
                                                            </asp:DataGrid>
                                                            <br />
                                                        </ContentTemplate>
                                                    </cc1:TabPanel>
                                                    <cc1:TabPanel ID="TabPanel2" runat="server" HeaderText="联系人资料">
                                                        <ContentTemplate>
                                                            <table style="width: 99%" cellpadding="2" cellspacing="0" class="formBgStyle">
                                                                <tr>
                                                                    <td style=" text-align: right" class="formItemBgStyle"><asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,XingMing%>"></asp:Label>
                                                                    </td>
                                                                    <td align="left" class="formItemBgStyle">
                                                                        <asp:TextBox ID="TB_FirstName" runat="server" Width="99%"></asp:TextBox>
                                                                        <asp:Label ID="LB_ID" runat="server" Visible="False"></asp:Label>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td style=" text-align: right; height: 3px;" class="formItemBgStyle"><asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,LeiXing%>"></asp:Label>
                                                                    </td>
                                                                    <td  align="left" class="formItemBgStyle">
                                                                        <asp:DropDownList ID="DL_Type" runat="server">
                                                                            <asp:ListItem Value="客户" Text="<%$ Resources:lang,KeHu%>"/>
                                                                            <asp:ListItem Value="供应商" Text="<%$ Resources:lang,GongYingShang%>"/>
                                                                            <asp:ListItem Value="同事" Text="<%$ Resources:lang,TongShi%>"/>
                                                                            <asp:ListItem Value="朋友" Text="<%$ Resources:lang,PengYou%>"/>
                                                                            <asp:ListItem Value="同学" Text="<%$ Resources:lang,TongXue%>"/>
                                                                            <asp:ListItem Value="亲属" Text="<%$ Resources:lang,QinShu%>"/>
                                                                            <asp:ListItem Value="其它" Text="<%$ Resources:lang,QiTa%>"/>
                                                                        </asp:DropDownList>
                                                                        
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="formItemBgStyle" style="width: 90px; text-align: right; height: 3px;"><asp:Label ID="Label18" runat="server" Text="<%$ Resources:lang,XingBie%>"></asp:Label></td>
                                                                    <td align="left" class="formItemBgStyle" >
                                                                        <asp:DropDownList ID="DL_Gender" runat="server">
                                                                            <asp:ListItem Value="男" Text="<%$ Resources:lang,Nan%>"/>
                                                                            <asp:ListItem Value="女" Text="<%$ Resources:lang,Nv%>"/>
                                                                        </asp:DropDownList>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td style=" text-align: right;" class="formItemBgStyle"><asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,NianLing%>"></asp:Label>
                                                                    </td>
                                                                    <td align="left" class="formItemBgStyle">
                                                                        <NickLee:NumberBox ID="NB_Age" runat="server" MaxAmount="100" MinAmount="0" OnBlur=""
                                                                            OnFocus="" OnKeyPress="" PositiveColor="" Width="50px" Precision="0">0</NickLee:NumberBox>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="formItemBgStyle" style=" text-align: right;"><asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,BanGongDianHua%>"></asp:Label> </td>
                                                                    <td align="left" class="formItemBgStyle">
                                                                        <asp:TextBox ID="TB_OfficePhone" runat="server"></asp:TextBox>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td style=" text-align: right; height: 22px;" class="formItemBgStyle"><asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,JiaTingDianHua%>"></asp:Label>
                                                                    </td>
                                                                    <td style="height: 22px;" align="left" class="formItemBgStyle">
                                                                        <asp:TextBox ID="TB_HomePhone" runat="server"></asp:TextBox>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="formItemBgStyle" style=" text-align: right; height: 22px;"><asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,ShouJi%>"></asp:Label> </td>
                                                                    <td align="left" class="formItemBgStyle" style="height: 22px;">
                                                                        <asp:TextBox ID="TB_MobilePhone" runat="server"></asp:TextBox>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td style=" text-align: right;" class="formItemBgStyle">EMail
                                                                    </td>
                                                                    <td align="left" class="formItemBgStyle">
                                                                        <asp:TextBox ID="TB_EMail1" runat="server" Width="99%"></asp:TextBox>
                                                                    </td>
                                                                </tr>
                                                               <%-- <tr>
                                                                    <td style=" text-align: right" class="formItemBgStyle">EMail2
                                                                    </td>
                                                                    <td align="left" class="formItemBgStyle">
                                                                        <asp:TextBox ID="TB_EMail2" runat="server" Width="99%"></asp:TextBox>
                                                                    </td>
                                                                </tr>--%>
                                                                <tr>
                                                                    <td style=" text-align: right" class="formItemBgStyle"><asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,WangZhan%>"></asp:Label>
                                                                    </td>
                                                                    <td align="left" class="formItemBgStyle">
                                                                        <asp:TextBox ID="TB_WebSite" runat="server" Width="99%"></asp:TextBox>
                                                                    </td>
                                                                </tr>
                                                                <%--<tr>
                                                                    <td style=" text-align: right;" class="formItemBgStyle">MSN
                                                                    </td>
                                                                    <td align="left" class="formItemBgStyle">
                                                                        <asp:TextBox ID="TB_Msn" runat="server"></asp:TextBox>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="formItemBgStyle" style=" text-align: right;"><asp:Label ID="Label8" runat="server" Text="<%$ Resources:lang,YaHuTong%>"></asp:Label> </td>
                                                                    <td align="left" class="formItemBgStyle">
                                                                        <asp:TextBox ID="TB_Ysn" runat="server"></asp:TextBox>
                                                                    </td>
                                                                </tr>--%>
                                                                <tr>
                                                                    <td style=" text-align: right" class="formItemBgStyle"><asp:Label ID="Label8" runat="server" Text="<%$ Resources:lang,IM%>"></asp:Label>
                                                                    </td>
                                                                    <td align="left" class="formItemBgStyle">
                                                                        <asp:TextBox ID="TB_QQ" runat="server"></asp:TextBox>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td style=" text-align: right" class="formItemBgStyle"><asp:Label ID="Label9" runat="server" Text="<%$ Resources:lang,GongSi%>"></asp:Label>
                                                                    </td>
                                                                    <td align="left" class="formItemBgStyle">
                                                                        <asp:TextBox ID="TB_Company" runat="server" Width="99%"></asp:TextBox>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td style=" text-align: right;" class="formItemBgStyle"><asp:Label ID="Label10" runat="server" Text="<%$ Resources:lang,BuMen%>"></asp:Label>
                                                                    </td>
                                                                    <td align="left" class="formItemBgStyle">
                                                                        <asp:TextBox ID="TB_Department" runat="server"></asp:TextBox>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="formItemBgStyle" style=" text-align: right;"><asp:Label ID="Label11" runat="server" Text="<%$ Resources:lang,ZhiWu%>"></asp:Label> </td>
                                                                    <td align="left" class="formItemBgStyle">
                                                                        <asp:TextBox ID="TB_Duty" runat="server"></asp:TextBox>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td style=" text-align: right" class="formItemBgStyle"><asp:Label ID="Label12" runat="server" Text="<%$ Resources:lang,GongSiDiZhi%>"></asp:Label>
                                                                    </td>
                                                                    <td align="left" class="formItemBgStyle">
                                                                        <asp:TextBox ID="TB_CompanyAddress" runat="server" Width="99%"></asp:TextBox>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td style=" text-align: right" class="formItemBgStyle"><asp:Label ID="Label13" runat="server" Text="<%$ Resources:lang,YouZhengBianMa%>"></asp:Label>
                                                                    </td>
                                                                    <td align="left" class="formItemBgStyle">
                                                                        <asp:TextBox ID="TB_PostCode" runat="server"></asp:TextBox>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="formItemBgStyle" style=" text-align: right"><asp:Label ID="Label14" runat="server" Text="<%$ Resources:lang,GuoJia%>"></asp:Label> </td>
                                                                    <td align="left" class="formItemBgStyle">
                                                                        <asp:TextBox ID="TB_Country" runat="server"></asp:TextBox>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td style=" text-align: right" class="formItemBgStyle"><asp:Label ID="Label15" runat="server" Text="<%$ Resources:lang,ShengFen%>"></asp:Label>
                                                                    </td>
                                                                    <td align="left" class="formItemBgStyle">
                                                                        <asp:TextBox ID="TB_State" runat="server"></asp:TextBox>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="formItemBgStyle" style=" text-align: right"><asp:Label ID="Label16" runat="server" Text="<%$ Resources:lang,ChengShi%>"></asp:Label> </td>
                                                                    <td align="left" class="formItemBgStyle">
                                                                        <asp:TextBox ID="TB_City" runat="server"></asp:TextBox>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td style=" text-align: right" class="formItemBgStyle"><asp:Label ID="Label17" runat="server" Text="<%$ Resources:lang,JiaTingDiZhi%>"></asp:Label>
                                                                    </td>
                                                                    <td align="left" class="formItemBgStyle">
                                                                        <asp:TextBox ID="TB_HomeAddress" runat="server" Width="99%"></asp:TextBox>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td style="text-align: center;" class="formItemBgStyle" colspan="2">
                                                                        <asp:Button ID="BT_New" runat="server" CssClass="inpu" OnClick="BT_New_Click" Text="<%$ Resources:lang,XinZeng%>" />
                                                                        <asp:Button ID="BT_Update" runat="server" CssClass="inpu" Enabled="False" OnClick="BT_Update_Click" Text="<%$ Resources:lang,BaoCun%>" />
                                                                        <asp:Button ID="BT_Delete" runat="server" CssClass="inpu" Enabled="False" OnClick="BT_Delete_Click" OnClientClick="return confirm(getDeleteMsgByLangCode())" Text="<%$ Resources:lang,ShanChu%>" />
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </ContentTemplate>
                                                    </cc1:TabPanel>
                                                </cc1:TabContainer>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width: 200px; text-align: left;">
                                                <asp:Label ID="LB_Sql" runat="server" Visible="False"></asp:Label>
                                                <asp:Label ID="LB_UserCode" runat="server"  Visible="False"></asp:Label>
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
                        &nbsp;
                    </ProgressTemplate>
                </asp:UpdateProgress>
            </div>
        </form>
    </center>
</body>
<script type="text/javascript" language="javascript">var cssDirectory = '<%=Session["CssDirectory"] %>'; var oLink = document.getElementById('mainCss'); oLink.href = 'css/' + cssDirectory + '/' + 'bluelightmain.css';</script></html>

