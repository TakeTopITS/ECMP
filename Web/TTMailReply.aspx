<%@ Page Language="C#"  ValidateRequest="false" CodeFile="TTMailReply.aspx.cs" Inherits="TTMailReply" %>

<%@ Register Assembly="Brettle.Web.NeatUpload" Namespace="Brettle.Web.NeatUpload"
    TagPrefix="Upload" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>发送邮件</title>
    <link id="mainCss" href="css/bluelightmain.css" rel="stylesheet" type="text/css" />
    <script language="javascript" type="text/javascript">
        function addFile() {
            var filebutton = '<br><input type="file"  name="File"  style="width:400px;" />';
            document.getElementById('FileList').insertAdjacentHTML("beforeEnd", filebutton);
        }
        function client_click() {

            document.getElementById("IMG_Running").style.width = 150;

        }
    </script>
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

    <form id="form1" runat="server">
        <%--  <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="True" EnableScriptLocalization="True">--%>
        <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="True" EnableScriptLocalization="True">
        </asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <table id="AboveTable" cellpadding="0" width="100%" cellspacing="0" class="bian">
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
                                                    <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,HuiFuYouJian%>"></asp:Label>
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
                        <td valign="top" style="padding: 10px 5px 10px 5px;">
                            <table align="center" cellspacing="0" cellpadding="3" width="98%" border="0" class="formBgStyle">
                                <tr style="line-height: 2;">
                                    <td style="width: 8%" align="right" class="formItemBgStyle">
                                        <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,ShouJianRen%>"></asp:Label>:
                                    </td>
                                    <td align="left" class="formItemBgStyle">

                                        <table width="100%">
                                            <tr>
                                                <td width="80%">
                                                    <asp:TextBox ID="To" runat="server" Width="99%"></asp:TextBox>
                                                </td>
                                                <td><a onclick="popShow('popwindow','true')">
                                                    <img src="ImagesSkin/MailContactList.gif" alt="Contact List" width="22" height="22" /></a></td>
                                            </tr>
                                        </table>


                                    </td>
                                </tr>
                                <tr style="line-height: 2;">
                                    <td style="width: 108px" align="right" class="formItemBgStyle">
                                        <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,ChaoSong%>"></asp:Label>:
                                    </td>
                                    <td align="left" class="formItemBgStyle">
                                        <asp:TextBox ID="CC" runat="server" Width="60%"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr style="line-height: 2;">
                                    <td style="width: 108px" align="right" class="formItemBgStyle">
                                        <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,ZhuTi%>"></asp:Label>:
                                    </td>
                                    <td align="left" class="formItemBgStyle">
                                        <asp:TextBox ID="Title" runat="server" Width="50%"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr style="line-height: 2;">
                                    <td style="width: 108px" align="right" class="formItemBgStyle">
                                        <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,YouJianGeShi%>"></asp:Label>:
                                    </td>
                                    <td align="left" class="formItemBgStyle">
                                        <input id="HtmlCB" type="checkbox" runat="server" checked="CHECKED" /><asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,HTMLGeShi%>"></asp:Label>
                                    </td>
                                </tr>
                                <tr style="line-height: 2;">
                                    <td style="width: 108px; height: 1px;" align="right" valign="top" class="formItemBgStyle">
                                        <asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,NeiRong%>"></asp:Label>:
                                    </td>
                                    <td style="height: 1px" align="left" class="formItemBgStyle">
                                        <CKEditor:CKEditorControl ID="CKEditor1" runat="server" Height="500px" Width="98%" Visible="False">
                                        </CKEditor:CKEditorControl>
                                        <CKEditor:CKEditorControl runat="server" ID="HTEditor1" Width="98%" Height="500px" Visible="False" />
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 108px" align="right" class="formItemBgStyle">
                                        <asp:Label ID="Label8" runat="server" Text="<%$ Resources:lang,YouJianFuJian%>"></asp:Label>:
                                    </td>
                                    <td align="left" class="formItemBgStyle">
                                        <asp:Label ID="LB_IdentifyString" runat="server" Visible="false"></asp:Label>
                                        <table width="80%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                            <tr>
                                                <td width="7">
                                                    <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" />
                                                </td>
                                                <td>
                                                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                        <tr>
                                                            <td width="10%" align="center">
                                                                <strong>
                                                                    <asp:Label ID="Label9" runat="server" Text="<%$ Resources:lang,BianHao%>"></asp:Label></strong>
                                                            </td>
                                                            <td width="80%" align="center">
                                                                <strong>
                                                                    <asp:Label ID="Label13" runat="server" Text="<%$ Resources:lang,WenJianMing%>"></asp:Label></strong>
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
                                        <asp:DataGrid ID="DataGrid4" runat="server" AutoGenerateColumns="False" Font-Bold="False"
                                            Height="1px" OnItemCommand="DataGrid4_ItemCommand" ShowHeader="False" Width="80%"
                                            CellPadding="4" ForeColor="#333333" GridLines="None">
                                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                            <EditItemStyle BackColor="#2461BF" />
                                            <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                            <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />

                                            <ItemStyle CssClass="itemStyle" />
                                            <Columns>
                                                <asp:BoundColumn DataField="AttachmentID" HeaderText="编号">
                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                </asp:BoundColumn>
                                                <asp:TemplateColumn>
                                                    <ItemTemplate>
                                                        <a href='<%# DataBinder.Eval(Container, "DataItem.Url") %>' target='_blank'>
                                                            <%# DataBinder.Eval(Container, "DataItem.Name") %></a>
                                                    </ItemTemplate>
                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="80%" />
                                                </asp:TemplateColumn>
                                                <asp:TemplateColumn>
                                                    <ItemTemplate>
                                                        <asp:Button ID="BT_Delete" runat="server" CssClass="inpu" Text="<%$ Resources:lang,ShanChu%>" />
                                                    </ItemTemplate>
                                                    <ItemStyle CssClass="itemBorder" Width="10%" />
                                                </asp:TemplateColumn>
                                            </Columns>
                                            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" HorizontalAlign="Center" />
                                        </asp:DataGrid>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 108px" align="right" class="formItemBgStyle"></td>
                                    <td align="left" class="formItemBgStyle">
                                        <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
                                            <ContentTemplate>
                                                <div>
                                                    <Upload:InputFile ID="AttachFile" runat="server" Width="300px" />
                                                    &nbsp;<asp:Button ID="BtnUP" runat="server" OnClick="BtnUP_Click" Text="<%$ Resources:lang,ShangChuan%>" />
                                                    <br />
                                                    <span style="font-size: xx-small; color: #FF3300;">（<asp:Label ID="Label14" runat="server" Text="<%$ Resources:lang,ZWBJMBNCG10GHZ%>"></asp:Label>）<br />
                                                    </span>
                                                    <br />
                                                    <div id="ProgressBar">
                                                        <Upload:ProgressBar ID="ProgressBar1" runat='server' Width="500px" Height="100px">
                                                        </Upload:ProgressBar>
                                                    </div>
                                                </div>
                                            </ContentTemplate>
                                            <Triggers>
                                                <asp:PostBackTrigger ControlID="BtnUP" />
                                            </Triggers>
                                        </asp:UpdatePanel>
                                        <asp:Panel ID="Panel_BigAttachment" runat="server" Style="width: 90%;" Visible="true">
                                            <div>
                                                <asp:CheckBox ID="CB_BigAttachment" Text="<%$ Resources:lang,DaFuJianMoShi%>" runat="server"></asp:CheckBox>
                                                <span style="font-size: xx-small; color: #FF3300;">（<asp:Label ID="Label12" runat="server" Text="<%$ Resources:lang,DaFuJian%>"></asp:Label>[</span><span
                                                    style="font-size: xx-small; color: #3333CC;"><asp:Label ID="Label11" runat="server" Text="<%$ Resources:lang,YBDY2M%>"></asp:Label></span>]<span
                                                        style="font-size: xx-small; color: #FF3300;"><asp:Label ID="Label10" runat="server" Text="<%$ Resources:lang,XTHZDZYJZWDBZJLJGSJFXZ%>"></asp:Label>） </span>
                                            </div>
                                        </asp:Panel>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 108px;" align="right" class="formItemBgStyle"></td>
                                    <td align="left" class="formItemBgStyle">
                                        <asp:Button ID="SenderBtn" runat="server" Text="<%$ Resources:lang,FaSong%>" CssClass="inpu" OnClick="NewBtn_Click" />&nbsp;&nbsp;
                                    <asp:Button ID="BT_SaveDraft" runat="server" CssClass="inpu" Text="<%$ Resources:lang,BaoCun%>" OnClick="BT_SaveDraft_Click" />
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        <asp:Button
                                            ID="ReturnBtn" runat="server" Text="<%$ Resources:lang,FanHui%>" CssClass="inpu" OnClick="ReturnBtn_Click"
                                            CausesValidation="False" />
                                    </td>
                                </tr>
                            </table>
                            <br />
                        </td>
                    </tr>
                </table>


                <div class="layui-layer layui-layer-iframe" id="popwindow" name="fixedDiv"
                    style="z-index: 9999; width: 720px; height: 630px; position: absolute; overflow: hidden; display: none; border-radius: 10px;">
                    <div class="layui-layer-title" style="background: #e7e7e8; text-align: center;" id="popwindow_title">
                        <asp:Label ID="Label27" runat="server" Text="&lt;div&gt;&lt;img src=ImagesSkin/Update.png border=0 width=30px height=30px alt='BusinessForm' /&gt;&lt;/div&gt;"></asp:Label>
                    </div>
                    <div id="popwindow_content" class="layui-layer-content" style="overflow: auto; padding: 0px 5px 0px 5px;">

                        <table cellpadding="0" cellspacing="0" width="100%" class="bian">
                            <tr>
                                <td height="31" class="page_topbj">
                                    <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
                                        <tr>
                                            <td align="left">
                                                <table width="345" border="0" align="left" cellpadding="0" cellspacing="0">
                                                    <tr>
                                                        <td width="29">
                                                            <%--<img src="Logo/main_top_l.jpg" alt="" width="29" height="31" />--%>
                                                        </td>
                                                        <td align="center" background="ImagesSkin/main_top_bj.jpg" class="titlezi">
                                                            <asp:Label ID="Label15" runat="server" Text="<%$ Resources:lang,TongXunLu%>"></asp:Label>
                                                        </td>
                                                        <td width="5">
                                                            <%-- <img src="ImagesSkin/main_top_r.jpg" width="5" height="31" />--%>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                            <td align="right"></td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <table style="width: 100%">
                                        <tr>
                                            <td width="100%" align="left">
                                                <table width="100%" cellpadding="4" cellspacing="0">
                                                    <tr>
                                                        <td width="20%" align="left">
                                                            <span style="font-size: 10pt">
                                                                <asp:Label ID="Label16" runat="server" Text="<%$ Resources:lang,LeiXing%>"></asp:Label>：</span>
                                                            <asp:DropDownList ID="DL_ContactType" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DL_ContactType_SelectedIndexChanged">
                                                                <asp:ListItem Value="客户" Text="<%$ Resources:lang,KeHu%>" />
                                                                <asp:ListItem Value="供应商" Text="<%$ Resources:lang,GongYingShang%>" />
                                                                <asp:ListItem Value="同事" Text="<%$ Resources:lang,TongShi%>" />
                                                                <asp:ListItem Value="朋友" Text="<%$ Resources:lang,PengYou%>" />
                                                                <asp:ListItem Value="同学" Text="<%$ Resources:lang,TongXue%>" />
                                                                <asp:ListItem Value="亲属" Text="<%$ Resources:lang,QinShu%>" />
                                                                <asp:ListItem Value="其它" Text="<%$ Resources:lang,QiTa%>" />
                                                            </asp:DropDownList>
                                                            <span style="font-size: 10pt">
                                                                <asp:Label ID="Label17" runat="server" Text="<%$ Resources:lang,MingCheng%>"></asp:Label>：</span><asp:TextBox ID="TB_HazyName" runat="server"
                                                                    Width="100px"></asp:TextBox>
                                                            <asp:Button ID="BT_HazyFind" runat="server" CssClass="inpu" Font-Size="9pt" Height="22px"
                                                                OnClick="BT_HazyFind_Click" Text="<%$ Resources:lang,MoHuChaXun%>" />
                                                            <span style="font-size: 9pt">
                                                                <asp:Label ID="Label18" runat="server" Text="<%$ Resources:lang,GongSi%>"></asp:Label>：<asp:TextBox ID="TB_HazyCompany" runat="server" Width="150px"></asp:TextBox>
                                                                <asp:Button ID="BT_FindCompany" runat="server" CssClass="inpu" OnClick="BT_FindCompany_Click"
                                                                    Text="<%$ Resources:lang,MoHuChaXun%>" />
                                                            </span>
                                                        </td>
                                                    </tr>
                                                </table>
                                                <asp:DataGrid ID="DataGrid1" runat="server" AllowPaging="False" AutoGenerateColumns="False"
                                                    Font-Bold="True" Height="1px"
                                                    ShowHeader="true" OnItemCommand="DataGrid1_ItemCommand" Width="100%"
                                                    CellPadding="4" ForeColor="#333333" GridLines="None">
                                                    <Columns>
                                                        <asp:BoundColumn DataField="FirstName" HeaderText="<%$ Resources:lang,Xingming%>">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="15%" />
                                                        </asp:BoundColumn>
                                                        <asp:BoundColumn DataField="Email1" HeaderText="Email">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="30%" />
                                                        </asp:BoundColumn>
                                                        <asp:BoundColumn DataField="Gender" HeaderText="<%$ Resources:lang,XingBie%>">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                        </asp:BoundColumn>
                                                        <asp:BoundColumn DataField="Company" HeaderText="<%$ Resources:lang,GongSi%>">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="25%" />
                                                        </asp:BoundColumn>
                                                        <asp:BoundColumn DataField="Type" HeaderText="<%$ Resources:lang,LeiXing%>">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="12%" />
                                                        </asp:BoundColumn>
                                                        <asp:TemplateColumn>
                                                            <ItemTemplate>
                                                                <asp:Button ID="BT_Delete" runat="server" CssClass="inpu" Text="<%$ Resources:lang,XuanZe%>" />
                                                            </ItemTemplate>
                                                            <ItemStyle CssClass="itemBorder" Width="8%" />
                                                        </asp:TemplateColumn>
                                                    </Columns>

                                                    <EditItemStyle BackColor="#2461BF" />
                                                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                    <HeaderStyle HorizontalAlign="Center" Font-Bold="true" />
                                                    <ItemStyle BackColor="#EFF3FB" Font-Bold="False" HorizontalAlign="Center" />
                                                    <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />
                                                    <SelectedItemStyle BackColor="#D1DDF1" ForeColor="#333333" />
                                                </asp:DataGrid>
                                            </td>
                                        </tr>
                                        <tr style="display: none;">
                                            <td style="text-align: left;">
                                                <asp:Label ID="LB_Sql" runat="server" Visible="False"></asp:Label>
                                                <asp:Label ID="LB_UserCode" runat="server" Visible="False"></asp:Label>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>

                    </div>

                    <div id="popwindow_footer" class="layui-layer-btn" style="border-top: 1px solid #ccc;">
                        <a class="layui-layer-btn notTab" onclick="return popCloseNoPromt();">
                            <asp:Label ID="Label28" runat="server" Text="<%$ Resources:lang,GuanBi%>" /></a>
                    </div>
                    <span class="layui-layer-setwin"><a onclick="return popCloseNoPromt();" class="layui-layer-ico layui-layer-close layui-layer-close1 notTab" href="javascript:;"></a></span>
                </div>

                <div class="layui-layer-shade" id="popwindow_shade" style="z-index: 9998; background-color: #000; opacity: 0.3; filter: alpha(opacity=30); display: none;"></div>

            </ContentTemplate>
        </asp:UpdatePanel>
        <div style="position: absolute; left: 40%; top: 80%;">
            <asp:UpdateProgress ID="TakeTopUp" runat="server" AssociatedUpdatePanelID="UpdatePanel1">
                <ProgressTemplate>
                    <img src="Images/MailSend.gif" alt="请稍候，处理中..." />
                </ProgressTemplate>
            </asp:UpdateProgress>
        </div>
    </form>
</body>
<script type="text/javascript" language="javascript">var cssDirectory = '<%=Session["CssDirectory"] %>'; var oLink = document.getElementById('mainCss'); oLink.href = 'css/' + cssDirectory + '/' + 'bluelightmain.css';</script></html>
