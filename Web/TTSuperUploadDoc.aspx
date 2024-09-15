<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTSuperUploadDoc.aspx.cs" Inherits="TTSuperUploadDoc" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Assembly="Brettle.Web.NeatUpload" Namespace="Brettle.Web.NeatUpload"
    TagPrefix="Upload" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link id="mainCss" href="css/bluelightmain.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        #AboveDiv {
            min-width: 1100px;
            width: expression (document.body.clientWidth <= 1100? "1100px" : "auto" ));
        }

        .auto-style1 {
            color: red;
        }
    </style>
    <script type="text/javascript" src="lhgdialog/lhgcore.min.js"></script>
    <script type="text/javascript" src="lhgdialog/lhgdialog.min.js"> </script>
    <script type="text/javascript">
        function opim(id, chatterName, htmlText) {

            var dg = new J.dialog({ id: id, title: chatterName, width: 730, height: 420, btnBar: false, cancelBtn: false, page: htmlText, autoPos: { left: 'center', top: 'top' }, fixed: false, left: 'center', top: 'top', rang: true });

            dg.ShowDialog();
        }
    </script>
    <script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="js/allAHandler.js"></script>
    <script type="text/javascript" language="javascript">
        $(function () {

            if (top.location != self.location) { } else { CloseWebPage(); }

        });


        function LoadProjectList() {
            //alert("调用成功");
            document.getElementById("BT_RelaceLoad").click();
        }

        function AddAttachment() {
            tr = document.all.table5.insertRow();
            tr.setAttribute("align", "left");

            //tr.insertCell(0).innerHTML = "&nbsp;";

            tr.insertCell(0).innerHTML = "<input name='File' style='width:300px' type='file'>&nbsp;<input class=btn type=button value='删除' style='width:50px' onclick='delAttachment(this.parentElement.parentElement.rowIndex)'>";
        }

        function delAttachment(index) {
            document.getElementById('table5').deleteRow(index);
        }

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
                                                <table width="345" border="0" align="left" cellpadding="0" cellspacing="0">
                                                    <tr>
                                                        <td width="29">
                                                            <%--<img src="Logo/main_top_l.jpg" alt="" width="29" height="31" />--%>
                                                        </td>
                                                        <td align="center" background="ImagesSkin/main_top_bj.jpg" class="titlezi">
                                                            <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,ShangChuanWenJian%>"></asp:Label>
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
                                    <table style="width: 100%;" cellpadding="0" cellspacing="0">
                                        <tr>
                                            <td style="width: 220px; text-align: left; padding: 5px 5px 0px 5px; border-right: solid 1px #D8D8D8; vertical-align: top;"
                                                rowspan="5">
                                                <asp:TreeView ID="TreeView1" runat="server" Font-Bold="False" Font-Names="宋体" Font-Size="10pt"
                                                    NodeWrap="True" OnSelectedNodeChanged="TreeView1_SelectedNodeChanged" ShowLines="True"
                                                    Width="220px">
                                                    <RootNodeStyle CssClass="rootNode" />
                                                    <NodeStyle CssClass="treeNode" />
                                                    <LeafNodeStyle CssClass="leafNode" />
                                                    <SelectedNodeStyle CssClass="selectNode" ForeColor="Red" />
                                                </asp:TreeView>
                                            </td>
                                            <td style="width: 82%; text-align: left;">
                                                <asp:Label ID="LB_FindCondition" runat="server" Font-Bold="False"></asp:Label>

                                                <asp:Label ID="LB_UserCode" runat="server" Visible="False"></asp:Label>

                                                <asp:Label ID="LB_UserName" runat="server" Visible="False"></asp:Label>

                                                <asp:Label ID="LB_ProjectID" runat="server" Visible="False"></asp:Label>
                                            </td>

                                        </tr>
                                        <tr>
                                            <td valign="top" align="center">
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
                                                                            <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,XuHao %>"></asp:Label></strong>
                                                                    </td>
                                                                    <%-- <td width="7%" align="center">
                                                                        <strong>
                                                                            <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,DaLei %>"></asp:Label></strong>
                                                                    </td>--%>
                                                                    <td align="center">
                                                                        <strong>
                                                                            <%-- <asp:Label ID="Label21" runat="server" Text="<%$ Resources:lang,FuLei %>"></asp:Label></strong>--%>
                                                                    </td>
                                                                    <td width="10%" align="center">
                                                                        <strong>
                                                                            <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,LeiXing %>"></asp:Label></strong>
                                                                    </td>
                                                                    <td width="15%" align="center">
                                                                        <strong>
                                                                            <asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,WenJianMing %>"></asp:Label></strong>
                                                                    </td>
                                                                    <td width="9%" align="center">
                                                                        <strong>
                                                                            <asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,ZuoZhe %>"></asp:Label></strong>
                                                                    </td>
                                                                    <td width="9%" align="center">
                                                                        <strong>
                                                                            <asp:Label ID="Label8" runat="server" Text="<%$ Resources:lang,ShangChuanZhe %>"></asp:Label></strong>
                                                                    </td>
                                                                    <td width="13%" align="center">
                                                                        <strong>
                                                                            <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,ShangChuanShiJian %>"></asp:Label></strong>
                                                                    </td>
                                                                    <td width="7%" align="center">
                                                                        <strong>
                                                                            <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,QuanXian %>"></asp:Label></strong>
                                                                    </td>
                                                                    <td width="12%" align="center">
                                                                        <strong></strong>
                                                                    </td>
                                                                    <td width="5%" align="center">
                                                                        <strong>
                                                                            <asp:Label ID="Label14" runat="server" Text="<%$ Resources:lang,ShanChu %>"></asp:Label></strong>
                                                                    </td>
                                                                    <td width="8%" align="center">
                                                                        <strong>
                                                                            <asp:Label ID="Label9" runat="server" Text="<%$ Resources:lang,ZhuangTai %>"></asp:Label></strong>
                                                                    </td>

                                                                    <td align="center">
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
                                                <asp:DataGrid runat="server" AllowPaging="True" AutoGenerateColumns="False" CellPadding="4"
                                                    ShowHeader="False" GridLines="None" ForeColor="#333333" Height="1px" Width="98%"
                                                    ID="DataGrid1" OnItemCommand="DataGrid1_ItemCommand" OnPageIndexChanged="DataGrid1_PageIndexChanged">
                                                    <AlternatingItemStyle BackColor="White"></AlternatingItemStyle>
                                                    <Columns>
                                                        <asp:BoundColumn DataField="DocID" HeaderText="序号">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                                        </asp:BoundColumn>
                                                        <%-- <asp:BoundColumn DataField="RelatedType" HeaderText="类型">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="7%" />
                                                        </asp:BoundColumn>--%>
                                                        <asp:TemplateColumn>
                                                            <ItemTemplate>
                                                                <asp:CheckBox ID="CB_Select" runat="server" Checked="false" />
                                                            </ItemTemplate>
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" />
                                                        </asp:TemplateColumn>
                                                        <asp:BoundColumn DataField="DocType" HeaderText="类型">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                        </asp:BoundColumn>
                                                        <asp:BoundColumn DataField="DocName" HeaderText="文件名" Visible="false">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" />
                                                        </asp:BoundColumn>
                                                        <asp:TemplateColumn>
                                                            <ItemTemplate>
                                                                <a href='<%#DataBinder.Eval(Container.DataItem, "Address")%>' class="address-cell">
                                                                    <%#DataBinder.Eval(Container.DataItem, "DocID")%>_<%#DataBinder.Eval(Container.DataItem, "DocName")%>
                                                                </a>
                                                            </ItemTemplate>
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="15%" />
                                                        </asp:TemplateColumn>
                                                        <asp:BoundColumn DataField="Author" HeaderText="作者">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="9%" />
                                                        </asp:BoundColumn>
                                                        <asp:BoundColumn DataField="UploadManName" HeaderText="上传者">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="9%" />
                                                        </asp:BoundColumn>
                                                        <asp:BoundColumn DataField="UploadTime" HeaderText="上传时间">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="15%" />
                                                        </asp:BoundColumn>
                                                        <asp:BoundColumn DataField="Visible" HeaderText="权限">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="7%" />
                                                        </asp:BoundColumn>
                                                        <asp:TemplateColumn>
                                                            <ItemTemplate>
                                                                <a href='TTDocRelatedUser.aspx?DocID= <%#DataBinder.Eval(Container.DataItem, "DocID")%>'>
                                                                    <asp:Label ID="Label8" runat="server" Text="<%$ Resources:lang,QiTaKeShiRenYuan%>"></asp:Label>
                                                                </a>
                                                            </ItemTemplate>
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="12%" />
                                                        </asp:TemplateColumn>
                                                        <asp:TemplateColumn HeaderText="Delete">
                                                            <ItemTemplate>
                                                                <asp:LinkButton ID="LBT_Delete" CommandName="Delete" runat="server" OnClientClick="return confirm(getDeleteMsgByLangCode())" Text="&lt;div&gt;&lt;img src=ImagesSkin/Delete.png border=0 alt='删除' /&gt;&lt;/div&gt;"></asp:LinkButton>
                                                            </ItemTemplate>
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                        </asp:TemplateColumn>
                                                        <asp:BoundColumn DataField="Address" Visible="False"></asp:BoundColumn>
                                                        <asp:TemplateColumn HeaderText="评审状态">
                                                            <ItemTemplate>
                                                                            <%# DataBinder.Eval(Container.DataItem, "Status").ToString() %>
                                                            </ItemTemplate>
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                        </asp:TemplateColumn>
                                                        <asp:TemplateColumn>
                                                            <ItemTemplate>
                                                                <asp:Button ID="BT_Review" runat="server" CssClass="inpu" Text="<%$ Resources:lang,PingShen%>" CommandName="Review" />
                                                            </ItemTemplate>
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" />
                                                        </asp:TemplateColumn>
                                                    </Columns>
                                                    <EditItemStyle BackColor="#2461BF"></EditItemStyle>
                                                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White"></FooterStyle>
                                                    <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />
                                                    <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333"></SelectedItemStyle>
                                                </asp:DataGrid>

                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="left" style="width: 98%; height: 12px; padding-left: 10px;">
                                                <asp:Label ID="LB_TotalCount" runat="server"></asp:Label>
                                                <asp:Label ID="LB_Sql" runat="server" Visible="False"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width: 100%; height: 1px; text-align: left">
                                                <asp:RadioButtonList ID="RadioButtonList1" runat="server" RepeatDirection="Horizontal"
                                                    AutoPostBack="True" OnSelectedIndexChanged="RadioButtonList1_SelectedIndexChanged"
                                                    Width="160px">
                                                    <asp:ListItem Value="0" Selected="True" Text="<%$ Resources:lang,ShangChuan%>" />
                                                    <asp:ListItem Value="1" Text="<%$ Resources:lang,PingShen%>" />
                                                </asp:RadioButtonList>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width: 100%; height: 12px; text-align: :center;">
                                                <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0">
                                                    <asp:View ID="View1" runat="server">
                                                        <table class="FullBorderTable" style="width: 98%">
                                                            <tr>
                                                                <td style="width: 100%; height: 21px; text-align: left;">
                                                                    <asp:Label ID="Label10" runat="server" Text="<%$ Resources:lang,WenJianShangChuan%>"></asp:Label>：
                                                                <asp:Label ID="LB_DocID" runat="server"></asp:Label>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td style="width: 100%; height: 13px; text-align: left;">

                                                                    <asp:Label ID="Label11" runat="server" Text="<%$ Resources:lang,LeiXing%>"></asp:Label>：<asp:Label ID="LB_DocTypeID" runat="server"></asp:Label>
                                                                    <asp:TextBox ID="TB_DocType" runat="server" Width="125px"></asp:TextBox>
                                                                    <cc1:ModalPopupExtender ID="TB_DocType_ModalPopupExtender" runat="server"
                                                                        Enabled="True" TargetControlID="TB_DocType" PopupControlID="Panel3"
                                                                        CancelControlID="IMBT_Close" BackgroundCssClass="modalBackground" Y="150">
                                                                    </cc1:ModalPopupExtender>

                                                                    <asp:Label ID="Label12" runat="server" Text="<%$ Resources:lang,QuanXian%>"></asp:Label>：
                                                                    <asp:DropDownList ID="DL_Visible" runat="server" DataTextField="HomeName" AutoPostBack="true"
                                                                        DataValueField="GroupName" CssClass="DDList" OnSelectedIndexChanged="DL_Visible_SelectedIndexChanged">
                                                                    </asp:DropDownList>
                                                                    <asp:Label ID="LB_SelectCompany" Text="<%$ Resources:lang,GongSi%>" runat="server" Visible="false"></asp:Label>
                                                                    <asp:Label ID="LB_RelatedDepartCode" runat="server" Visible="false"></asp:Label>
                                                                    <asp:TextBox ID="TB_RelatedDepartName" runat="server" Width="80px" Visible="false"></asp:TextBox>
                                                                    <cc1:ModalPopupExtender ID="TB_RelatedDepartName_ModalPopupExtender" runat="server"
                                                                        Enabled="True" TargetControlID="TB_RelatedDepartName" PopupControlID="Panel2"
                                                                        CancelControlID="IMBT_Close" BackgroundCssClass="modalBackground" Y="150">
                                                                    </cc1:ModalPopupExtender>

                                                                    <asp:Label ID="Label13" runat="server" Text="<%$ Resources:lang,ZuoZhe%>"></asp:Label>：<asp:TextBox ID="TB_Author" runat="server" Width="65px"></asp:TextBox>
                                                                    <asp:Button ID="BT_EditSave" runat="server" CssClass="inpu" OnClick="BT_EditSave_Click" Text="<%$ Resources:lang,BaoCun%>" Enabled="false" />
                                                                </td>
                                                            </tr>
                                                            <tr style="font-size: 10pt">
                                                                <td style="text-align: left; width: 100%;">

                                                                    <br />
                                                                    <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
                                                                        <ContentTemplate>
                                                                            <div style="width: 100%; text-align: left;">

                                                                                <asp:FileUpload ID="FileUpload1" runat="server" /><asp:Button ID="BtnUP" runat="server" OnClick="BtnUP_Click" Text="<%$ Resources:lang,ShangChuan%>" />

                                                                            </div>
                                                                        </ContentTemplate>
                                                                        <Triggers>
                                                                            <asp:PostBackTrigger ControlID="BtnUP" />
                                                                        </Triggers>
                                                                    </asp:UpdatePanel>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td style="width: 100%; text-align: left">
                                                                    <br />
                                                                    <asp:CheckBox ID="CB_Mail" runat="server" Text="<%$ Resources:lang,FaYouJian%>" />
                                                                    <asp:CheckBox ID="CB_SMS" runat="server" Text="<%$ Resources:lang,FaXinXi%>" />
                                                                    <asp:Label ID="Label17" runat="server" Text="<%$ Resources:lang,TongZhiJueSeZuChengYuan%>"></asp:Label><asp:TextBox ID="TB_Message" runat="server" Width="224px"></asp:TextBox>
                                                                    <asp:Button ID="BT_Send" runat="server" OnClick="BT_Send_Click" Text="<%$ Resources:lang,FaSong%>" CssClass="ButtonCss" />
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </asp:View>
                                                    <asp:View ID="View2" runat="server">
                                                        <table style="width: 98%" cellpadding="3" cellspacing="0" class="formBgStyle">
                                                            <tr>
                                                                <td style="background-color: ButtonFace; width: 100%; text-align: left; height: 11px;"
                                                                    class="formItemBgStyle">
                                                                    <asp:Label ID="Label18" runat="server" Text="<%$ Resources:lang,WenJianPingShenShenQing%>"></asp:Label>：
                                                                </td>
                                                            </tr>
                                                            <tr style="font-size: 10pt">
                                                                <td style="text-align: left; width: 100%;" class="formItemBgStyle">
                                                                    <asp:Label ID="Label19" runat="server" Text="<%$ Resources:lang,MingCheng%>"></asp:Label>：<asp:TextBox ID="TB_WLName" runat="server" Width="309px"></asp:TextBox>
                                                                    <asp:Label ID="Label21" runat="server" Text="<%$ Resources:lang,LeiXing%>"></asp:Label>：
                                                                    <asp:DropDownList ID="DL_WFType" runat="server">
                                                                        <asp:ListItem Value="文件评审" Text="<%$ Resources:lang,WenJianPingSheng%>" />
                                                                    </asp:DropDownList>
                                                                    <asp:Label ID="Label20" runat="server" Text="<%$ Resources:lang,GongZuoLiuMuBan%>"></asp:Label>：<asp:DropDownList ID="DL_TemName" runat="server" DataTextField="TemName"
                                                                        DataValueField="TemName" Width="144px">
                                                                    </asp:DropDownList>
                                                                    <asp:HyperLink ID="HL_WLTem" runat="server" NavigateUrl="~/TTWorkFlowTemplate.aspx"
                                                                        Target="_blank">
                                                                        <asp:Label ID="Label22" runat="server" Text="<%$ Resources:lang,MuBanWeiHu%>"></asp:Label>
                                                                    </asp:HyperLink>
                                                                    <asp:Button ID="BT_Refrash" runat="server" Text="<%$ Resources:lang,ShuaXin%>" CssClass="inpu" OnClick="BT_Refrash_Click" />
                                                                </td>
                                                            </tr>
                                                            <tr style="font-size: 10pt">
                                                                <td style="text-align: left; width: 100%; height: 51px;" class="formItemBgStyle">
                                                                    <asp:Label ID="Label23" runat="server" Text="<%$ Resources:lang,ShuoMing%>"></asp:Label>：<asp:TextBox ID="TB_Description" runat="server" TextMode="MultiLine" Width="441px"
                                                                        Height="48px"></asp:TextBox>
                                                                </td>
                                                            </tr>
                                                            <tr style="font-size: 10pt">
                                                                <td style="text-align: left; width: 100%;" class="formItemBgStyle">
                                                                    <span style="font-size: 10pt">（<asp:Label ID="Label24" runat="server" Text="<%$ Resources:lang,YaoQiuShouDaoXinXi%>"></asp:Label>：<asp:CheckBox ID="CB_RequiredMail" runat="server"
                                                                        Font-Size="10pt" Text="<%$ Resources:lang,YouJian%>" />
                                                                        <asp:CheckBox ID="CB_RequiredSMS" runat="server" Font-Size="10pt" Text="<%$ Resources:lang,DuanXin%>" />）
                                                                    </span>
                                                                    <asp:Button ID="BT_SubmitApply" runat="server" Text="<%$ Resources:lang,TiJiaoShenQing%>" CssClass="inpu" Enabled="false" />
                                                                    <cc1:ModalPopupExtender ID="BT_SubmitApply_ModalPopupExtender" runat="server" Enabled="True"
                                                                        TargetControlID="BT_SubmitApply" PopupControlID="Panel1" BackgroundCssClass="modalBackground" Y="150"
                                                                        DynamicServicePath="">
                                                                    </cc1:ModalPopupExtender>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                        <table cellpadding="0" cellspacing="0" width="98%">
                                                            <tr>
                                                                <td align="left" style="padding: 5px 0px 5px 0px;">
                                                                    <asp:Label ID="Label25" runat="server" Text="<%$ Resources:lang,DuiYingPingShenJiLu%>"></asp:Label>：
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <table width="100%" border="0" cellpadding="0" align="center" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                                                        <tr>
                                                                            <td width="7">
                                                                                <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" />
                                                                            </td>
                                                                            <td>
                                                                                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                                    <tr>
                                                                                        <td width="8%" align="center">
                                                                                            <strong>
                                                                                                <asp:Label ID="Label26" runat="server" Text="<%$ Resources:lang,BianHao%>"></asp:Label></strong>
                                                                                        </td>
                                                                                        <td width="52%" align="center">
                                                                                            <strong>
                                                                                                <asp:Label ID="Label27" runat="server" Text="<%$ Resources:lang,GongZuoLiu%>"></asp:Label></strong>
                                                                                        </td>
                                                                                        <td width="20%" align="center">
                                                                                            <strong>
                                                                                                <asp:Label ID="Label28" runat="server" Text="<%$ Resources:lang,ShenQingShiJian%>"></asp:Label></strong>
                                                                                        </td>
                                                                                        <td width="10%" align="center">
                                                                                            <strong>
                                                                                                <asp:Label ID="Label29" runat="server" Text="<%$ Resources:lang,ZhuangTai%>"></asp:Label></strong>
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
                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                                            </asp:BoundColumn>
                                                                            <asp:HyperLinkColumn DataNavigateUrlField="WLID" DataNavigateUrlFormatString="TTMyWorkDetailMain.aspx?WLID={0}"
                                                                                DataTextField="WLName" HeaderText="工作流" Target="_blank">
                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="52%" />
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
                                                                                        Target="_blank"><img src="ImagesSkin/Doc.gif" class="noBorder"/></asp:HyperLink>
                                                                                </ItemTemplate>
                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                            </asp:TemplateColumn>
                                                                        </Columns>
                                                                    </asp:DataGrid>
                                                                    <br />
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </asp:View>
                                                </asp:MultiView>
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
                                        <asp:Label ID="Label30" runat="server" Text="<%$ Resources:lang,LCSQSCHYLJDLCJHYMQJHM%>"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 420px; padding: 5px 5px 5px 5px;" valign="top" align="left">&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;<asp:Button ID="BT_ActiveYes" runat="server" CssClass="inpu" Text="<%$ Resources:lang,Shi%>" OnClick="BT_ActiveYes_Click" />
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Button
                                            ID="BT_ActiveNo" runat="server" CssClass="inpu" Text="<%$ Resources:lang,Fou%>" OnClick="BT_ActiveNo_Click" />
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </asp:Panel>
                    <asp:Panel ID="Panel2" runat="server" CssClass="modalPopup" Style="display: none;">
                        <div class="modalPopup-text" style="width: 273px; height: 400px; overflow: auto;">
                            <table>
                                <tr>
                                    <td style="width: 220px; padding: 5px 5px 5px 5px;" valign="top" align="left">
                                        <asp:TreeView ID="TreeView2" runat="server" NodeWrap="True" OnSelectedNodeChanged="TreeView2_SelectedNodeChanged"
                                            ShowLines="True" Width="220px">
                                            <RootNodeStyle CssClass="rootNode" />
                                            <NodeStyle CssClass="treeNode" />
                                            <LeafNodeStyle CssClass="leafNode" />
                                            <SelectedNodeStyle CssClass="selectNode" ForeColor="Red" />
                                        </asp:TreeView>
                                    </td>
                                    <td style="width: 60px; padding: 5px 5px 5px 5px;" valign="top" align="center">
                                        <asp:ImageButton ID="IMBT_Close" ImageUrl="ImagesSkin/Close4.jpg" runat="server" />
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </asp:Panel>

                    <asp:Panel ID="Panel3" runat="server" CssClass="modalPopup" Style="display: none;">
                        <div class="modalPopup-text" style="width: 273px; height: 400px; overflow: auto;">
                            <table>
                                <tr>
                                    <td style="width: 220px; padding: 5px 5px 5px 5px;" valign="top" align="left">
                                        <asp:TreeView ID="TreeView3" runat="server" NodeWrap="True" OnSelectedNodeChanged="TreeView3_SelectedNodeChanged"
                                            ShowLines="True" Width="220px">
                                            <RootNodeStyle CssClass="rootNode" />
                                            <NodeStyle CssClass="treeNode" />
                                            <LeafNodeStyle CssClass="leafNode" />
                                            <SelectedNodeStyle CssClass="selectNode" ForeColor="Red" />
                                        </asp:TreeView>
                                    </td>
                                    <td style="width: 60px; padding: 5px 5px 5px 5px;" valign="top" align="center">
                                        <asp:ImageButton ID="IMBT_Close1" ImageUrl="ImagesSkin/Close4.jpg" runat="server" />
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </asp:Panel>

                    <asp:Button ID="BT_RelaceLoad" runat="server" Text="<%$ Resources:lang,ChongXinJiaZaiLieBiao%>" OnClick="BT_RelaceLoad_Click" CssClass="inpu" Style="display: none;" />
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
