<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTProPlanRelatedDocSAAS.aspx.cs" Inherits="TTProPlanRelatedDocSAAS" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Assembly="Brettle.Web.NeatUpload" Namespace="Brettle.Web.NeatUpload"
    TagPrefix="Upload" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link id="mainCss" href="css/bluelightmain.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="js/allAHandler.js"></script>

    <link href="WebUploader/webuploader.css" rel="stylesheet" />
    <script type="text/javascript" src="WebUploader/webuploader.js"></script>

    <script type="text/javascript">

        var i = 0;
        var j = 0;

        // 文件上传
        jQuery(function () {
            var $ = jQuery,
                $list = $('#thelist'),
                $btn = $('#ctlBtn'),
                state = 'pending',
                uploader;

            uploader = WebUploader.create({

                // 不压缩image
                resize: false,

                // swf文件路径
                swf: 'WebUploader/Uploader.swf',

                // 文件接收服务端。
                server: 'Handler/UploadHandler.ashx',

                // 选择文件的按钮。可选。
                // 内部根据当前运行是创建，可能是input元素，也可能是flash.
                pick: '#picker'
            });

            //上传前附件参数
            uploader.on('uploadBeforeSend', function (obj, data) {

                //判断文档类型是否为空
                if (document.getElementById("TabContainer1_TabPanel1_TB_DocType").value == "") {
                    alert("警告，请选择文件类型（Warning,Doc type can not be null）！")
                    return;
                }

                //传入表单参数
                data = $.extend(data, {

                    relatedType: "计划",
                    relatedID: $("#TabContainer1_TabPanel1_LB_PlanID").text(),
                    docTypeID: $("#TabContainer1_TabPanel1_LB_DocTypeID").text(),
                    docType: $("#TabContainer1_TabPanel1_TB_DocType").val(),
                    author: $("#TabContainer1_TabPanel1_TB_Author").val(),
                    userVisible: $('#TabContainer1_TabPanel1_DL_Visible option:selected').val()

                });

            });

            // 当有文件添加进来的时候
            uploader.on('fileQueued', function (file) {
                $list.append('<div id="' + file.id + '" class="item">' +
                    '<h4 class="info">' + file.name + '</h4>' +
                    '<p class="state">等待上传...</p>' +
                    '</div>');

                i = i + 1;
            });

            // 文件上传过程中创建进度条实时显示。
            uploader.on('uploadProgress', function (file, percentage) {
                var $li = $('#' + file.id),
                    $percent = $li.find('.progress .progress-bar');

                // 避免重复创建
                if (!$percent.length) {
                    $percent = $('<div class="progress progress-striped active">' +
                        '<div class="progress-bar" role="progressbar" style="width: 0%">' +
                        '</div>' +
                        '</div>').appendTo($li).find('.progress-bar');
                }

                $li.find('p.state').text('上传中');

                $percent.css('width', percentage * 100 + '%');
            });

            uploader.on('uploadSuccess', function (file) {
                $('#' + file.id).find('p.state').text('已上传');
            });

            uploader.on('uploadError', function (file) {
                $('#' + file.id).find('p.state').text('上传出错');
            });

            uploader.on('uploadComplete', function (file) {
                $('#' + file.id).find('.progress').fadeOut();
                j++;

                if (j == i) {
                    $("#TabContainer1_TabPanel1_BT_LoadDoc").click();

                    i = 0;
                    j = 0;
                }
            });

            uploader.on('all', function (type) {
                if (type === 'startUpload') {
                    state = 'uploading';
                } else if (type === 'stopUpload') {
                    state = 'paused';
                } else if (type === 'uploadFinished') {
                    state = 'done';
                }

                if (state === 'uploading') {
                    $btn.text('暂停上传');
                } else {
                    $btn.text('开始上传');
                }
            });

            $btn.on('click', function () {

                if (state === 'uploading') {
                    uploader.stop();
                } else {
                    uploader.upload();
                }

            });

        });
    </script>

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
                                                        <%--<img src="Logo/main_top_l.jpg" alt="" width="29" height="31" />--%></td>
                                                    <td align="center" background="ImagesSkin/main_top_bj.jpg" class="titlezi">
                                                        <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,XiangGuanWenDang%>"></asp:Label>
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
                            <td style="text-align: left; padding-left: 10px; padding-top: 10px;">
                                <cc1:TabContainer CssClass="ajax_tab_menu" ID="TabContainer1" runat="server" ActiveTabIndex="0"
                                    Width="99%">
                                    <cc1:TabPanel ID="TabPanel1" runat="server" HeaderText="文档上传">
                                        <ContentTemplate>
                                            <table style="width: 100%">
                                                <tr>
                                                    <td style="width: 19%; text-align: left; vertical-align: top; padding: 5px 5px 0px 5px; border-right: solid 1px #D8D8D8;"
                                                        rowspan="5">
                                                        <asp:UpdatePanel ID="UpdatePanel5" runat="server" UpdateMode="Conditional">
                                                            <ContentTemplate>
                                                                <asp:TreeView ID="TreeView1" runat="server" Font-Bold="False" Font-Names="宋体" Font-Size="10pt"
                                                                    NodeWrap="True" OnSelectedNodeChanged="TreeView1_SelectedNodeChanged" ShowLines="True"
                                                                    Width="100%">
                                                                    <LeafNodeStyle CssClass="leafNode" />
                                                                    <NodeStyle CssClass="treeNode" />
                                                                    <RootNodeStyle CssClass="rootNode" />
                                                                    <SelectedNodeStyle CssClass="selectNode" ForeColor="Red" />
                                                                </asp:TreeView>
                                                            </ContentTemplate>
                                                            <Triggers>
                                                                <asp:PostBackTrigger ControlID="TreeView1" />
                                                            </Triggers>
                                                        </asp:UpdatePanel>
                                                    </td>
                                                    <td style="width: 82%; text-align: left; display: none;">
                                                        <asp:Label ID="LB_FindCondition" runat="server"></asp:Label>
                                                        <asp:Label ID="LB_UserCode" runat="server" Visible="False"></asp:Label>
                                                        <asp:Label ID="LB_UserName" runat="server" Visible="False"></asp:Label>
                                                        <asp:Label ID="LB_PlanID" runat="server"></asp:Label>
                                                        <asp:Label ID="LB_ProjectID" runat="server"></asp:Label>
                                                        <asp:UpdatePanel ID="UpdatePanel8" runat="server" UpdateMode="Conditional">
                                                            <ContentTemplate>
                                                                <asp:Button ID="BT_LoadDoc" runat="server" CssClass="ButtonCss" Height="22px" OnClick="BT_LoadDoc_Click" Text="<%$ Resources:lang,refresh %>" />
                                                            </ContentTemplate>
                                                            <Triggers>
                                                                <asp:PostBackTrigger ControlID="BT_LoadDoc" />
                                                            </Triggers>
                                                        </asp:UpdatePanel>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="center" valign="top">
                                                        <asp:Label ID="Label52" runat="server" Text="<%$ Resources:lang,WenJianMing %>"></asp:Label>:<asp:TextBox ID="TB_DocName" Width="200px" runat="server"></asp:TextBox>
                                                        <asp:Button ID="BT_Find" runat="server" CssClass="inpu" OnClick="BT_Find_Click" Text="<%$ Resources:lang,Find %>" />
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
                                                                            <td width="7%" align="center">
                                                                                <strong>
                                                                                    <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,DaLei %>"></asp:Label></strong>
                                                                            </td>
                                                                            <td align="center" width="2%">
                                                                                <strong>
                                                                                    <%-- <asp:Label ID="Label21" runat="server" Text="<%$ Resources:lang,FuLei %>"></asp:Label></strong>--%>
                                                                            </td>
                                                                            <td width="7%" align="center">
                                                                                <strong>
                                                                                    <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,LeiXing %>"></asp:Label></strong>
                                                                            </td>
                                                                            <td width="12%" align="center">
                                                                                <strong>
                                                                                    <asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,WenJianMing %>"></asp:Label></strong>
                                                                            </td>
                                                                            <td width="10%" align="center">
                                                                                <strong>
                                                                                    <asp:Label ID="Label53" runat="server" Text="<%$ Resources:lang,MustBeUploadDoc%>"></asp:Label></strong>
                                                                            </td>
                                                                            <td width="9%" align="center">
                                                                                <strong>
                                                                                    <asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,ZuoZhe %>"></asp:Label></strong>
                                                                            </td>
                                                                            <td width="9%" align="center">
                                                                                <strong>
                                                                                    <asp:Label ID="Label8" runat="server" Text="<%$ Resources:lang,ShangChuanZhe %>"></asp:Label></strong>
                                                                            </td>
                                                                            <td width="12%" align="center">
                                                                                <strong>
                                                                                    <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,ShangChuanShiJian %>"></asp:Label></strong>
                                                                            </td>
                                                                            <td width="10%" align="center">
                                                                                <strong></strong>
                                                                            </td>
                                                                            <td width="4%" align="center">
                                                                                <strong>
                                                                                    <asp:Label ID="Label42" runat="server" Text="<%$ Resources:lang,ShanChu %>"></asp:Label></strong>
                                                                            </td>
                                                                          <%--  <td width="5%" align="center">
                                                                                <strong>
                                                                                    <asp:Label ID="Label50" runat="server" Text="<%$ Resources:lang,ZhuangTai %>"></asp:Label></strong>
                                                                            </td>

                                                                            <td align="center" width="8%">
                                                                                <strong>&nbsp;</strong>
                                                                            </td>--%>
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
                                                                <asp:BoundColumn DataField="RelatedType" HeaderText="类型">
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="7%" />
                                                                </asp:BoundColumn>
                                                                <asp:TemplateColumn>
                                                                    <ItemTemplate>
                                                                        <asp:CheckBox ID="CB_Select" runat="server" Checked="false" />
                                                                    </ItemTemplate>
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="2%" />
                                                                </asp:TemplateColumn>
                                                                <asp:BoundColumn DataField="DocType" HeaderText="类型">
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="7%" />
                                                                </asp:BoundColumn>
                                                                <asp:HyperLinkColumn DataNavigateUrlField="Address" DataNavigateUrlFormatString="{0}"
                                                                    DataTextField="DocName" Target="_blank" HeaderText="文件名" Visible="false">
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" />
                                                                </asp:HyperLinkColumn>
                                                                <asp:TemplateColumn>
                                                                    <ItemTemplate>
                                                                        <a href='<%#DataBinder.Eval(Container.DataItem, "Address")%>' class="address-cell">
                                                                            <%#DataBinder.Eval(Container.DataItem, "DocID")%>_<%#DataBinder.Eval(Container.DataItem, "DocName")%>
                                                                        </a>
                                                                    </ItemTemplate>
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="15%" />
                                                                </asp:TemplateColumn>
                                                                <asp:BoundColumn DataField="MustUploadDoc" HeaderText="必传文件">
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                </asp:BoundColumn>
                                                                <asp:BoundColumn DataField="Author" HeaderText="作者">
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="9%" />
                                                                </asp:BoundColumn>
                                                                <asp:BoundColumn DataField="UploadManName" HeaderText="上传者">
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="9%" />
                                                                </asp:BoundColumn>
                                                                <asp:BoundColumn DataField="UploadTime" HeaderText="上传时间">
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="15%" />
                                                                </asp:BoundColumn>
                                                                <asp:TemplateColumn>
                                                                    <ItemTemplate>
                                                                        <a href='TTDocRelatedUser.aspx?DocID= <%#DataBinder.Eval(Container.DataItem, "DocID")%>'>
                                                                            <asp:Label ID="Label8" runat="server" Text="<%$ Resources:lang,QiTaKeShiRenYuan%>"></asp:Label>
                                                                        </a>
                                                                    </ItemTemplate>
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                </asp:TemplateColumn>
                                                                <asp:TemplateColumn HeaderText="Delete">
                                                                    <ItemTemplate>
                                                                        <asp:LinkButton ID="LBT_Delete" CommandName="Delete" runat="server" OnClientClick="return confirm(getDeleteMsgByLangCode())" Text="&lt;div&gt;&lt;img src=ImagesSkin/Delete.png border=0 alt='删除' /&gt;&lt;/div&gt;"></asp:LinkButton>
                                                                    </ItemTemplate>
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                </asp:TemplateColumn>
                                                                <asp:BoundColumn DataField="Address" Visible="False"></asp:BoundColumn>
                                                          <%--      <asp:TemplateColumn HeaderText="评审状态">
                                                                    <ItemTemplate>
                                                                         <%# DataBinder.Eval(Container.DataItem, "Status").ToString() %>
                                                                    </ItemTemplate>
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                </asp:TemplateColumn>
                                                                <asp:TemplateColumn>
                                                                    <ItemTemplate>
                                                                        <asp:Button ID="BT_Review" runat="server" CssClass="inpu" Text="<%$ Resources:lang,PingShen%>" CommandName="Review" />
                                                                    </ItemTemplate>
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="7%" />
                                                                </asp:TemplateColumn>--%>
                                                            </Columns>
                                                            <EditItemStyle BackColor="#2461BF"></EditItemStyle>
                                                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White"></FooterStyle>
                                                            <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />
                                                            <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333"></SelectedItemStyle>
                                                        </asp:DataGrid>

                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="width: 100%; height: 12px; text-align: left;">
                                                        <asp:Label ID="LB_TotalCount" runat="server"></asp:Label>
                                                        <asp:Label ID="LB_Sql" runat="server" Visible="False"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="width: 100%; height: 1px; text-align: left">
                                                        <asp:UpdatePanel ID="UpdatePanel9" runat="server" UpdateMode="Conditional">
                                                            <ContentTemplate>
                                                                <asp:RadioButtonList ID="RadioButtonList1" runat="server" RepeatDirection="Horizontal"
                                                                    AutoPostBack="True" OnSelectedIndexChanged="RadioButtonList1_SelectedIndexChanged"
                                                                    Width="160px">
                                                                    <asp:ListItem Value="0" Selected="True" Text="<%$ Resources:lang,ShangChuan%>" />
                                                                  <%--  <asp:ListItem Value="1" Text="<%$ Resources:lang,PingShen%>" />--%>
                                                                </asp:RadioButtonList>
                                                            </ContentTemplate>
                                                            <Triggers>
                                                                <asp:PostBackTrigger ControlID="RadioButtonList1" />
                                                            </Triggers>
                                                        </asp:UpdatePanel>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0">
                                                            <asp:View ID="View1" runat="server">
                                                                <table class="FullBorderTable" style="width: 100%">
                                                                    <tr>
                                                                        <td style="width: 100%; height: 21px; text-align: left;">
                                                                            <span><strong>
                                                                                <asp:Label ID="Label36" runat="server" Text="<%$ Resources:lang,WenJianShangChuan %>"></asp:Label>：</strong>
                                                                                （<asp:Label ID="Label51" runat="server" Text="必传文档"></asp:Label>：
                                                                                <asp:DropDownList ID="DL_ProPlanRelatedDocForTemplate" runat="server" DataValueField="DocName" DataTextField="DocName">
                                                                                </asp:DropDownList>
                                                                                &nbsp;&nbsp; 
                                                                                <asp:HyperLink ID="HL_DocumentForProjectPlanTemplate" runat="server" Text="模板参照" Target="_blank"></asp:HyperLink>
                                                                                ）
                                                                            </span>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td style="width: 100%; height: 25px; text-align: left;">
                                                                            <asp:Label ID="Label11" runat="server" Text="<%$ Resources:lang,LeiXing %>"></asp:Label>： 
                                                                           <asp:Label ID="LB_DocTypeID" runat="server"></asp:Label>
                                                                            <asp:TextBox ID="TB_DocType" runat="server" Width="125px"></asp:TextBox>

                                                                            <cc1:ModalPopupExtender ID="TB_DocType_ModalPopupExtender" runat="server"
                                                                                Enabled="True" TargetControlID="TB_DocType" PopupControlID="Panel3"
                                                                                CancelControlID="IMBT_Close" BackgroundCssClass="modalBackground" Y="150" DynamicServicePath="">
                                                                            </cc1:ModalPopupExtender>

                                                                            <asp:Label ID="Label12" runat="server" Text="<%$ Resources:lang,QuanXian %>"></asp:Label>：
                                                                            <asp:DropDownList ID="DL_Visible" runat="server" CssClass="DDList"
                                                                                DataTextField="HomeName" DataValueField="GroupName">
                                                                            </asp:DropDownList>
                                                                            <asp:Label ID="Label13" runat="server" Text="<%$ Resources:lang,ZuoZhe %>"></asp:Label>：<asp:TextBox ID="TB_Author" runat="server" Width="74px"></asp:TextBox>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td style="width: 100%; text-align: left;">

                                                                            <div>
                                                                                <asp:Label ID="Label9" Text="<%$ Resources:lang,WenJianShangChuan%>" runat="server"></asp:Label>：<br />
                                                                                <asp:UpdatePanel ID="UpdatePanel12" runat="server" UpdateMode="Conditional">
                                                                                    <ContentTemplate>
                                                                                        <div>
                                                                                            <Upload:InputFile ID="AttachFile" runat="server" Width="300px" Height="22px" />

                                                                                            <asp:Button ID="BtnUP" runat="server" OnClick="BtnUP_Click" Text="<%$ Resources:lang,ShangChuan%>" />
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
                                                                            </div>
                                                                            <br />
                                                                            <div id="uploader" class="wu-example">
                                                                                <div id="thelist" class="uploader-list">
                                                                                    <asp:Label ID="Label10" Text="<%$ Resources:lang,DuWenJianShangZhuan%>" runat="server"></asp:Label>：
                                                                                </div>
                                                                                <div id="btns" class="btns">
                                                                                    <table>
                                                                                        <tr>
                                                                                            <td>
                                                                                                <div id="picker">
                                                                                                    <asp:Label ID="Label38" runat="server" Text="<%$ Resources:lang,XuanZeWenJian%>"></asp:Label>
                                                                                                </div>
                                                                                            </td>
                                                                                            <td style="padding-top: 10px; padding-left: 20px;">
                                                                                                <button id="ctlBtn" class="btn btn-default">
                                                                                                    <asp:Label ID="Label49" runat="server" Text="<%$ Resources:lang,ShangChuan%>"></asp:Label>
                                                                                                </button>
                                                                                            </td>
                                                                                        </tr>
                                                                                    </table>
                                                                                </div>
                                                                            </div>
                                                                        </td>
                                                                    </tr>
                                                                    <tr id="TR_UnUploadForMustDocList" runat="server">
                                                                        <td style="width: 100%; height: 1px; text-align: left; padding: 5px 5px 5px 5px;">

                                                                            <asp:Label ID="Label111" runat="server" Text="<%$ Resources:lang,YCMCDWD%>"></asp:Label>：
                                                                            <table width="100%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                                                                <tr>
                                                                                    <td width="7">
                                                                                        <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" /></td>
                                                                                    <td>
                                                                                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                                            <tr>

                                                                                                <td width="7%" align="center">
                                                                                                    <strong>
                                                                                                        <asp:Label ID="Label54" runat="server" Text="<%$ Resources:lang,XuHao%>"></asp:Label></strong>
                                                                                                </td>
                                                                                               
                                                                                                <td width="10%" align="center">
                                                                                                    <strong>
                                                                                                        <asp:Label ID="Label55" runat="server" Text="<%$ Resources:lang,LeiXing%>"></asp:Label></strong>
                                                                                                </td>
                                                                                                <td width="27%" align="center">
                                                                                                    <strong>
                                                                                                        <asp:Label ID="Label56" runat="server" Text="<%$ Resources:lang,WenJianMing%>"></asp:Label></strong>
                                                                                                </td>
                                                                                           
                                                                                                <td width="10%" align="center">
                                                                                                    <strong>
                                                                                                        <asp:Label ID="Label57" runat="server" Text="<%$ Resources:lang,ShangChuanZhe%>"></asp:Label></strong>
                                                                                                </td>
                                                                                                <td width="15%" align="center">
                                                                                                    <strong>
                                                                                                        <asp:Label ID="Label58" runat="server" Text="<%$ Resources:lang,ShangChuanShiJian%>"></asp:Label></strong>
                                                                                                </td>
                                                                                                <td width="8%" align="center">
                                                                                                    <strong>
                                                                                                        <asp:Label ID="Label59" runat="server" Text="<%$ Resources:lang,XiangGuan%>"></asp:Label></strong>
                                                                                                </td>
                                                                                            </tr>
                                                                                        </table>
                                                                                    </td>
                                                                                    <td width="6" align="right">
                                                                                        <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" /></td>
                                                                                </tr>
                                                                            </table>
                                                                            <asp:DataGrid runat="server" AllowPaging="False" AutoGenerateColumns="False" CellPadding="4"
                                                                                ShowHeader="False" GridLines="None" ForeColor="#333333" Height="1px" Width="100%"
                                                                                ID="DataGrid5">
                                                                                <Columns>
                                                                                    <asp:BoundColumn DataField="DocID" HeaderText="序号">
                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="7%" />
                                                                                    </asp:BoundColumn>
                                                                                 
                                                                                    <asp:BoundColumn DataField="DocType" HeaderText="类型">
                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                                    </asp:BoundColumn>
                                                                                    <asp:HyperLinkColumn DataNavigateUrlField="Address" DataNavigateUrlFormatString="{0}"
                                                                                        DataTextField="DocName" HeaderText="文件名" Target="_blank">
                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="27%" />
                                                                                    </asp:HyperLinkColumn>
                    
                                                                                    <asp:HyperLinkColumn DataNavigateUrlField="UploadManCode" DataNavigateUrlFormatString="TTUserInforSimple.aspx?UserCode={0}"
                                                                                        DataTextField="UploadManName" HeaderText="上传者" Target="_blank">
                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                                    </asp:HyperLinkColumn>
                                                                                    <asp:BoundColumn DataField="UploadTime" HeaderText="上传时间">
                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="15%" />
                                                                                    </asp:BoundColumn>
                                                                                    <asp:BoundColumn DataField="Address" Visible="False"></asp:BoundColumn>
                                                                                    <asp:HyperLinkColumn DataNavigateUrlField="DocID" DataNavigateUrlFormatString="TTRelatedFormView.aspx?Type=Doc&ID={0}"
                                                                                        DataTextField="RelatedID" HeaderText="相关" Target="_blank">
                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                                                    </asp:HyperLinkColumn>
                                                                                </Columns>

                                                                                <EditItemStyle BackColor="#2461BF"></EditItemStyle>
                                                                                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White"></FooterStyle>
                                                                                <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />
                                                                                <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333"></SelectedItemStyle>
                                                                            </asp:DataGrid>

                                                                            &nbsp;&nbsp;
                                                                           <asp:Label ID="LB_UnUploadMustDocCount" runat="server"></asp:Label>：
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </asp:View>
                                                            <asp:View ID="View2" runat="server">
                                                                <table style="width: 98%" align="center" cellpadding="2" cellspacing="0" class="formBgStyle">
                                                                    <tr>
                                                                        <td style="background-color: ButtonFace; width: 100%; text-align: left; height: 11px;" class="formItemBgStyle">
                                                                            <asp:Label ID="Label14" runat="server" Text="<%$ Resources:lang,WenJianPingShenShenQing %>"></asp:Label>：<asp:Label ID="LB_DocID" runat="server"></asp:Label>
                                                                        </td>
                                                                    </tr>
                                                                    <tr style="font-size: 10pt">
                                                                        <td style="text-align: left; width: 100%;" class="formItemBgStyle">
                                                                            <asp:Label ID="Label37" runat="server" Text="<%$ Resources:lang,MingCheng %>"></asp:Label>：<asp:TextBox ID="TB_WLName" runat="server" Width="309px"></asp:TextBox>
                                                                            <asp:Label ID="Label15" runat="server" Text="<%$ Resources:lang,LeiXing %>"></asp:Label>：
                                                                            <asp:DropDownList ID="DL_WFType" runat="server">
                                                                                <asp:ListItem Value="文件评审" />
                                                                            </asp:DropDownList>
                                                                            <asp:Label ID="Label16" runat="server" Text="<%$ Resources:lang,GongZuoLiuMuBan %>"></asp:Label>：<asp:DropDownList ID="DL_TemName" runat="server" DataTextField="TemName" DataValueField="TemName"
                                                                                Width="144px">
                                                                            </asp:DropDownList>
                                                                            <asp:HyperLink ID="HL_WLTem" runat="server" NavigateUrl="~/TTWorkFlowTemplate.aspx"
                                                                                Target="_blank">
                                                                                <asp:Label ID="Label17" runat="server" Text="<%$ Resources:lang,MuBanWeiHu %>"></asp:Label>
                                                                            </asp:HyperLink>

                                                                            <asp:UpdatePanel ID="UpdatePanel4" runat="server" UpdateMode="Conditional">
                                                                                <ContentTemplate>
                                                                                    <asp:Button ID="BT_Refrash" runat="server" Text="<%$ Resources:lang,ShuaXin %>" CssClass="inpu" OnClick="BT_Refrash_Click" />
                                                                                </ContentTemplate>
                                                                                <Triggers>
                                                                                    <asp:PostBackTrigger ControlID="BT_Refrash" />
                                                                                </Triggers>
                                                                            </asp:UpdatePanel>

                                                                        </td>
                                                                    </tr>
                                                                    <tr style="font-size: 10pt">
                                                                        <td style="text-align: left; width: 100%; height: 51px;" class="formItemBgStyle">
                                                                            <asp:Label ID="Label18" runat="server" Text="<%$ Resources:lang,ShuoMing %>"></asp:Label>：<asp:TextBox ID="TB_Description" runat="server" TextMode="MultiLine" Width="441px"
                                                                                Height="48px"></asp:TextBox>
                                                                        </td>
                                                                    </tr>
                                                                    <tr style="font-size: 10pt">
                                                                        <td style="text-align: left; width: 100%;" class="formItemBgStyle">
                                                                            <span style="font-size: 10pt">（<asp:Label ID="Label20" runat="server" Text="<%$ Resources:lang,YaoQiuShouDaoXinXi %>"></asp:Label>：<asp:CheckBox ID="CB_RequiredMail" runat="server"
                                                                                Font-Size="10pt" Text="<%$ Resources:lang,YouJian %>" />
                                                                                <asp:CheckBox ID="CB_RequiredSMS" runat="server" Font-Size="10pt" Text="<%$ Resources:lang,DuanXin %>" />）
                                                                            </span>
                                                                            <asp:UpdatePanel ID="UpdatePanel7" runat="server" UpdateMode="Conditional">
                                                                                <ContentTemplate>

                                                                                    <asp:Button ID="BT_SubmitApply" runat="server" Enabled="False" OnClick="BT_SubmitApply_Click"
                                                                                        Text="<%$ Resources:lang,SubmitApplication %>" CssClass="inpu" />
                                                                                </ContentTemplate>
                                                                                <Triggers>
                                                                                    <asp:PostBackTrigger ControlID="BT_SubmitApply" />
                                                                                </Triggers>
                                                                            </asp:UpdatePanel>
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                                <table width="98%" align="center" cellpadding="0" cellspacing="0">
                                                                    <tr>
                                                                        <td align="left" style="padding-top: 10px;">
                                                                            <asp:Label ID="Label19" runat="server" Text="<%$ Resources:lang,DuiYingPingShenJiLu %>"></asp:Label>：
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>
                                                                            <table style="width: 100%" align="left">
                                                                                <tr>
                                                                                    <td>
                                                                                        <table width="100%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                                                                            <tr>
                                                                                                <td width="7">
                                                                                                    <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" /></td>
                                                                                                <td>
                                                                                                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                                                        <tr>
                                                                                                            <td width="10%" align="center">
                                                                                                                <strong>
                                                                                                                    <asp:Label ID="Label21" runat="server" Text="<%$ Resources:lang,BianHao %>"></asp:Label></strong>
                                                                                                            </td>
                                                                                                            <td width="50%" align="center">
                                                                                                                <strong>
                                                                                                                    <asp:Label ID="Label22" runat="server" Text="<%$ Resources:lang,GongZuoLiu %>"></asp:Label></strong>
                                                                                                            </td>
                                                                                                            <td width="20%" align="center">
                                                                                                                <strong>
                                                                                                                    <asp:Label ID="Label23" runat="server" Text="<%$ Resources:lang,ShenQingShiJian %>"></asp:Label></strong>
                                                                                                            </td>
                                                                                                            <td width="10%" align="center">
                                                                                                                <strong>
                                                                                                                    <asp:Label ID="Label24" runat="server" Text="<%$ Resources:lang,ZhuangTai %>"></asp:Label></strong>
                                                                                                            </td>
                                                                                                            <td width="10%" align="center">
                                                                                                                <strong></strong>
                                                                                                            </td>
                                                                                                        </tr>
                                                                                                    </table>
                                                                                                </td>
                                                                                                <td width="6" align="right">
                                                                                                    <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" /></td>
                                                                                            </tr>
                                                                                        </table>
                                                                                        <asp:DataGrid ID="DataGrid4" runat="server" AutoGenerateColumns="False"
                                                                                            Height="1px" ShowHeader="False"
                                                                                            PageSize="5" Width="100%" CellPadding="4" ForeColor="#333333"
                                                                                            GridLines="None">
                                                                                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />

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
                                                                                                            Target="_blank"><img src="ImagesSkin/Doc.gif" class="noBorder"/></asp:HyperLink>
                                                                                                    </ItemTemplate>
                                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                                                </asp:TemplateColumn>
                                                                                            </Columns>
                                                                                            <EditItemStyle BackColor="#2461BF" />
                                                                                            <ItemStyle CssClass="itemStyle" />
                                                                                            <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />
                                                                                            <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                                                        </asp:DataGrid>
                                                                                    </td>
                                                                                </tr>
                                                                            </table>
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </asp:View>
                                                        </asp:MultiView>
                                                    </td>
                                                </tr>
                                            </table>
                                        </ContentTemplate>
                                    </cc1:TabPanel>
                                    <cc1:TabPanel ID="TabPanel3" runat="server" HeaderText="模板下载" Visible="false">
                                        <HeaderTemplate>
                                            <asp:Label ID="Label39" runat="server" Text="<%$ Resources:lang,LeiXunWenDangMoBan%>"></asp:Label>
                                        </HeaderTemplate>
                                        <ContentTemplate>
                                            <table style="width: 100%;">
                                                <tr>
                                                    <td valign="top" style="width: 18%; text-align: left; padding: 5px 5px 0px 5px; border-right: solid 1px #D8D8D8;"
                                                        rowspan="5">
                                                        <asp:UpdatePanel ID="UpdatePanel11" runat="server" UpdateMode="Conditional">
                                                            <ContentTemplate>
                                                                <asp:TreeView ID="TreeView4" runat="server" Font-Bold="False" Font-Names="宋体" Font-Size="10pt"
                                                                    NodeWrap="True" ShowLines="True" OnSelectedNodeChanged="TreeView4_SelectedNodeChanged"
                                                                    Width="100%">
                                                                    <LeafNodeStyle CssClass="leafNode" />
                                                                    <NodeStyle CssClass="treeNode" />
                                                                    <RootNodeStyle CssClass="rootNode" />
                                                                    <SelectedNodeStyle CssClass="selectNode" ForeColor="Red" />
                                                                </asp:TreeView>
                                                            </ContentTemplate>
                                                            <Triggers>
                                                                <asp:PostBackTrigger ControlID="TreeView4" />
                                                            </Triggers>
                                                        </asp:UpdatePanel>
                                                    </td>
                                                    <td style="width: 82%; text-align: left; padding: 5px 5px 5px 5px; display: none;"></td>
                                                </tr>
                                                <tr>
                                                    <td style="width: 100%; height: 23px; text-align: center;">
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
                                                                                    <asp:Label ID="Label40" runat="server" Text="<%$ Resources:lang,XuHao %>"></asp:Label></strong>
                                                                            </td>
                                                                            <td width="7%" align="center">
                                                                                <strong>
                                                                                    <asp:Label ID="Label41" runat="server" Text="<%$ Resources:lang,DaLei %>"></asp:Label></strong>
                                                                            </td>
                                                                            <td width="8%" align="center">
                                                                                <strong>
                                                                                    <asp:Label ID="Label43" runat="server" Text="<%$ Resources:lang,FuLei %>"></asp:Label></strong>
                                                                            </td>
                                                                            <td width="10%" align="center">
                                                                                <strong>
                                                                                    <asp:Label ID="Label44" runat="server" Text="<%$ Resources:lang,LeiXing %>"></asp:Label></strong>
                                                                            </td>
                                                                            <td width="20%" align="center">
                                                                                <strong>
                                                                                    <asp:Label ID="Label45" runat="server" Text="<%$ Resources:lang,WenJianMing %>"></asp:Label></strong>
                                                                            </td>
                                                                            <td width="9%" align="center">
                                                                                <strong>
                                                                                    <asp:Label ID="Label46" runat="server" Text="<%$ Resources:lang,ZuoZhe %>"></asp:Label></strong>
                                                                            </td>
                                                                            <td width="9%" align="center">
                                                                                <strong>
                                                                                    <asp:Label ID="Label47" runat="server" Text="<%$ Resources:lang,ShangChuanZhe %>"></asp:Label></strong>
                                                                            </td>
                                                                            <td width="15%" align="center">
                                                                                <strong>
                                                                                    <asp:Label ID="Label48" runat="server" Text="<%$ Resources:lang,ShangChuanShiJian %>"></asp:Label></strong>
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
                                                            ID="DataGrid3">
                                                            <AlternatingItemStyle BackColor="White"></AlternatingItemStyle>
                                                            <Columns>
                                                                <asp:BoundColumn DataField="DocID" HeaderText="序号">
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                                                </asp:BoundColumn>
                                                                <asp:BoundColumn DataField="RelatedType" HeaderText="大类">
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="7%" />
                                                                </asp:BoundColumn>
                                                                <asp:TemplateColumn HeaderText="父类">
                                                                    <ItemTemplate>
                                                                        <%# ShareClass . getDocParentTypeByID(Eval("DocTypeID").ToString()) %>
                                                                    </ItemTemplate>
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                                </asp:TemplateColumn>
                                                                <asp:BoundColumn DataField="DocType" HeaderText="类型">
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                </asp:BoundColumn>
                                                                <asp:HyperLinkColumn DataNavigateUrlField="Address" DataNavigateUrlFormatString="{0}"
                                                                    DataTextField="DocName" Target="_blank" HeaderText="文件名">
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="20%" />
                                                                </asp:HyperLinkColumn>
                                                                <asp:BoundColumn DataField="Author" HeaderText="作者">
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="9%" />
                                                                </asp:BoundColumn>
                                                                <asp:BoundColumn DataField="UploadManName" HeaderText="上传者">
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="9%" />
                                                                </asp:BoundColumn>
                                                                <asp:BoundColumn DataField="UploadTime" HeaderText="上传时间">
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="15%" />
                                                                </asp:BoundColumn>
                                                            </Columns>
                                                            <EditItemStyle BackColor="#2461BF"></EditItemStyle>
                                                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White"></FooterStyle>
                                                            <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />
                                                            <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333"></SelectedItemStyle>
                                                        </asp:DataGrid>
                                                    </td>
                                                </tr>
                                            </table>
                                        </ContentTemplate>
                                    </cc1:TabPanel>
                                    <cc1:TabPanel ID="TabPanel2" runat="server" HeaderText="模板下载" Visible="false">
                                        <HeaderTemplate>
                                            <asp:Label ID="LB_tabTemplateDoc" runat="server" Text="<%$ Resources:lang,JiHuaWenDangMoBan%>"></asp:Label>
                                        </HeaderTemplate>
                                        <ContentTemplate>
                                            <table style="width: 100%;">
                                                <tr>
                                                    <td valign="top" style="width: 20%; text-align: left; padding: 5px 5px 0px 5px; border-right: solid 1px #D8D8D8;">

                                                        <asp:UpdatePanel ID="UpdatePanel6" runat="server" UpdateMode="Conditional">
                                                            <ContentTemplate>
                                                                <asp:TreeView ID="TreeView2" runat="server" NodeWrap="True" OnSelectedNodeChanged="TreeView2_SelectedNodeChanged"
                                                                    Width="100%" ShowLines="True" Font-Size="10pt" Font-Bold="False" Font-Names="宋体">
                                                                    <RootNodeStyle CssClass="rootNode" />
                                                                    <NodeStyle CssClass="treeNode" />
                                                                    <LeafNodeStyle CssClass="leafNode" />
                                                                    <SelectedNodeStyle CssClass="selectNode" ForeColor="Red" />
                                                                </asp:TreeView>

                                                            </ContentTemplate>
                                                            <Triggers>
                                                                <asp:PostBackTrigger ControlID="TreeView2" />
                                                            </Triggers>
                                                        </asp:UpdatePanel>
                                                    </td>
                                                    <td style="width: 80%; text-align: left;" valign="top">
                                                        <asp:Label ID="Label25" runat="server" Text="<%$ Resources:lang,MuBanXiangMu %>"></asp:Label>：<asp:Label ID="LB_TemplateProjectID" runat="server"></asp:Label>
                                                        <asp:Label ID="Label26" runat="server" Text="<%$ Resources:lang,JiHuaBanBen %>"></asp:Label>：<asp:Label ID="LB_TemplatePlanVerID" runat="server"></asp:Label>
                                                        <asp:Label ID="Label27" runat="server" Text="<%$ Resources:lang,JiHua %>"></asp:Label>：<asp:Label ID="LB_TemplatePlanID" runat="server"></asp:Label>
                                                        <asp:Label ID="Label28" runat="server" Text="<%$ Resources:lang,DeWenDangLieBiao %>"></asp:Label>：
                                                    
                                                    <table width="98%" align="center" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                                        <tr>
                                                            <td width="7">
                                                                <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" /></td>
                                                            <td>
                                                                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                    <tr>
                                                                        <td width="7%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="Label29" runat="server" Text="<%$ Resources:lang,XuHao %>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="10%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="Label30" runat="server" Text="<%$ Resources:lang,DaLei %>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="10%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="Label31" runat="server" Text="<%$ Resources:lang,LeiXing %>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="33%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="Label32" runat="server" Text="<%$ Resources:lang,WenJianMing %>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="10%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="Label33" runat="server" Text="<%$ Resources:lang,ZuoZhe %>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="10%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="Label34" runat="server" Text="<%$ Resources:lang,ShangChuanZhe %>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="20%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="Label35" runat="server" Text="<%$ Resources:lang,ShangChuanShiJian %>"></asp:Label></strong>
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </td>
                                                            <td width="6" align="right">
                                                                <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" /></td>
                                                        </tr>
                                                    </table>
                                                        <asp:DataGrid ID="DataGrid2" runat="server" AutoGenerateColumns="False"
                                                            Height="1px" HorizontalAlign="Center" ShowHeader="False"
                                                            Width="98%" AllowPaging="True" CellPadding="4" ForeColor="#333333"
                                                            GridLines="None">

                                                            <Columns>
                                                                <asp:BoundColumn DataField="DocID" HeaderText="序号">
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="7%" />
                                                                </asp:BoundColumn>
                                                                <asp:BoundColumn DataField="RelatedType" HeaderText="大类">
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                </asp:BoundColumn>
                                                                <asp:BoundColumn DataField="DocType" HeaderText="类型">
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                </asp:BoundColumn>
                                                                <asp:HyperLinkColumn DataNavigateUrlField="Address" DataNavigateUrlFormatString="{0}"
                                                                    DataTextField="DocName" HeaderText="文件名" Target="_blank">
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="33%" />
                                                                </asp:HyperLinkColumn>
                                                                <asp:BoundColumn DataField="Author" HeaderText="作者">
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                </asp:BoundColumn>
                                                                <asp:BoundColumn DataField="UploadManName" HeaderText="上传者">
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                </asp:BoundColumn>
                                                                <asp:BoundColumn DataField="UploadTime" HeaderText="上传时间">
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="20%" />
                                                                </asp:BoundColumn>
                                                            </Columns>
                                                            <EditItemStyle BackColor="#2461BF" />
                                                            <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />
                                                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                            <ItemStyle CssClass="itemStyle" />
                                                            <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                        </asp:DataGrid>
                                                    </td>
                                                </tr>
                                            </table>
                                        </ContentTemplate>
                                    </cc1:TabPanel>
                                </cc1:TabContainer>
                                <br />
                            </td>
                        </tr>
                    </table>
                    <asp:Panel ID="Panel3" runat="server" CssClass="modalPopup" Style="display: none;">
                        <div class="modalPopup-text" style="width: 273px; height: 400px; overflow: auto;">
                            <table>
                                <tr>
                                    <td style="width: 220px; padding: 5px 5px 5px 5px;" valign="top" align="left">
                                        <asp:UpdatePanel ID="UpdatePanel3" runat="server" UpdateMode="Conditional">
                                            <ContentTemplate>
                                                <asp:TreeView ID="TreeView3" runat="server" NodeWrap="True" OnSelectedNodeChanged="TreeView3_SelectedNodeChanged"
                                                    ShowLines="True" Width="220px">
                                                    <RootNodeStyle CssClass="rootNode" />
                                                    <NodeStyle CssClass="treeNode" />
                                                    <LeafNodeStyle CssClass="leafNode" />
                                                    <SelectedNodeStyle CssClass="selectNode" ForeColor="Red" />
                                                </asp:TreeView>
                                            </ContentTemplate>
                                            <Triggers>
                                                <asp:PostBackTrigger ControlID="TreeView3" />
                                            </Triggers>
                                        </asp:UpdatePanel>
                                    </td>
                                    <td style="width: 60px; padding: 5px 5px 5px 5px;" valign="top" align="center">
                                        <asp:ImageButton ID="IMBT_Close" ImageUrl="ImagesSkin/Close4.jpg" runat="server" />
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
