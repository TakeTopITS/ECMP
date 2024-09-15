<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTAppProjectDetail.aspx.cs" Inherits="TTAppProjectDetail" %>

<meta name="viewport" content="width=device-width; initial-scale=1.0; maximum-scale=1.0; user-scalable=1" />

<%@ Import Namespace="System.Globalization" %>

<%@ Register Assembly="Brettle.Web.NeatUpload" Namespace="Brettle.Web.NeatUpload"
    TagPrefix="Upload" %>

<%@ Register Assembly="NickLee.Web.UI" Namespace="NickLee.Web.UI" TagPrefix="NickLee" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%--<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">--%>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link id="mainCss" href="css/bluelightmain.css" rel="stylesheet" type="text/css" />
    <link id="flxappCss" href="css/flxapp.css" rel="stylesheet" type="text/css" />

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
    <script src="js/exif.js" type="text/javascript"></script>
    <script type="text/javascript" language="javascript">
        $(function () {



            //选择图片后压缩图片
            $("#AttachFile").change(function () {

                //alert("KKK");

                //console.log(this.files[0]);
                var _ua = window.navigator.userAgent;
                var _simpleFile = this.files[0];
                //判断是否为图片
                if (!/\/(?:jpeg|png|gif|png|bmp)/i.test(_simpleFile.type)) return;

                //插件exif.js获取ios图片的方向信息
                var _orientation;
                //if (_ua.indexOf('iphone') > 0) {
                EXIF.getData(_simpleFile, function () {
                    _orientation = EXIF.getTag(this, 'Orientation');
                });
                //}



                //1.读取文件，通过FileReader，将图片文件转化为DataURL，即data:img/png;base64，开头的url，可以直接放在image.src中;
                var _reader = new FileReader(),
                    _img = new Image(),
                    _url;

                _reader.onload = function () {
                    _img.onload = function () {
                        var data = compress(_img);
                        $("#imgData").val(compress(_img, _orientation));
                    };
                    _url = this.result;
                    _img.src = _url;
                };
                _reader.readAsDataURL(_simpleFile);
            });

        });



        /**
         * 计算图片的尺寸，根据尺寸压缩
         * 1. iphone手机html5上传图片方向问题，借助exif.js
         * 2. 安卓UC浏览器不支持 new Blob()，使用BlobBuilder
         * @param {Object} _img     图片
         * @param {Number} _orientation 照片信息
         * @return {String}       压缩后base64格式的图片
         */
        function compress(_img, _orientation) {
            //2.计算符合目标尺寸宽高值，若上传图片的宽高都大于目标图，对目标图等比压缩；如果有一边小于，对上传图片等比放大。
            var _goalWidth = 640,         //目标宽度
                _goalHeight = 480,         //目标高度
                _imgWidth = _img.naturalWidth,   //图片宽度
                _imgHeight = _img.naturalHeight,  //图片高度
                _tempWidth = _imgWidth,      //放大或缩小后的临时宽度
                _tempHeight = _imgHeight,     //放大或缩小后的临时宽度
                _r = 0;              //压缩比

            if (_imgWidth > _goalWidth || _imgHeight > _goalHeight) {//宽或高大于目标图，需等比压缩
                _r = _imgWidth / _goalWidth;
                if (_imgHeight / _goalHeight < _r) {
                    _r = _imgHeight / _goalHeight;
                }
                _tempWidth = Math.ceil(_imgWidth / _r);
                _tempHeight = Math.ceil(_imgHeight / _r);
            }

            //3.利用canvas对图片进行裁剪，等比放大或缩小后进行居中裁剪
            var _canvas = $("#myCanvas")[0];

            var _context = _canvas.getContext('2d');
            _canvas.width = _tempWidth;
            _canvas.height = _tempHeight;
            var _degree;

            //ios bug，iphone手机上可能会遇到图片方向错误问题
            switch (_orientation) {
                //iphone横屏拍摄，此时home键在左侧
                case 3:
                    _degree = 180;
                    _tempWidth = -_imgWidth;
                    _tempHeight = -_imgHeight;
                    break;
                //iphone竖屏拍摄，此时home键在下方(正常拿手机的方向)
                case 6:
                    _canvas.width = _imgHeight;
                    _canvas.height = _imgWidth;
                    _degree = 90;
                    _tempWidth = _imgWidth;
                    _tempHeight = -_imgHeight;
                    break;
                //iphone竖屏拍摄，此时home键在上方
                case 8:
                    _canvas.width = _imgHeight;
                    _canvas.height = _imgWidth;
                    _degree = 270;
                    _tempWidth = -_imgWidth;
                    _tempHeight = _imgHeight;
                    break;
            }
            //if (window.navigator.userAgent.indexOf('iphone') > 0 && !!_degree) {
            if (!!_degree) {
                _context.rotate(_degree * Math.PI / 180);
                _context.drawImage(_img, 0, 0, _tempWidth, _tempHeight);
            } else {
                _context.drawImage(_img, 0, 0, _tempWidth, _tempHeight);
            }
            //toDataURL方法，可以获取格式为"data:image/png;base64,***"的base64图片信息；
            var _data = _canvas.toDataURL('image/jpeg');
            return _data;
        }

        function upload() {
            $.ajax({
                //提交数据的类型 POST GET
                type: "POST",
                //提交的网址
                url: "Handler/UploadPhotoToServerSite.ashx",
                //提交的数据
                data: { FileData: $("#imgData").val(), FileName: $("#AttachFile").val() },
                //返回数据的格式
                //在请求之前调用的函数
                beforeSend: function () {
                    $("#IMG_Waiting").show();
                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                    console.log(XMLHttpRequest);
                },
                //成功返回之后调用的函数             
                success: function (data) {
                    if (data.indexOf("img") > 0) {

                        $(document.getElementsByTagName("iframe")[0]).contents().find("body").append(data);
                    }
                    else {
                        alert(data);
                    }
                },
                //调用执行后调用的函数
                complete: function (XMLHttpRequest, textStatus) {
                    $("#IMG_Waiting").hide();
                }
            });
        }
    </script>
</head>
<body>
    <canvas id="myCanvas" style="display: none;"></canvas>
    <center>
        <form id="form1" runat="server" method="post" enctype="multipart/form-data">
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
                                            <%-- <a href="TTAppProject.aspx" onclick="javascript:document.getElementById('IMG_Waiting').style.display = 'block';">--%>
                                            <a href="javascript:window.history.go(-1)" target="_top" onclick="javascript:document.getElementById('IMG_Waiting').style.display = 'block';">
                                                <table width="245" border="0" align="left" cellpadding="0" cellspacing="0">
                                                    <tr>
                                                        <td width="29">
                                                            <img src="ImagesSkin/return.png" alt="" />
                                                        </td>
                                                        <td align="center" background="ImagesSkin/main_top_bj.jpg" class="titleziAPP">
                                                            <asp:Label runat="server" Text="<%$ Resources:lang,Back%>" />
                                                        </td>
                                                        <td width="5">
                                                            <%-- <img src="ImagesSkin/main_top_r.jpg" width="5" height="31" />--%>
                                                        </td>
                                                    </tr>
                                                </table>
                                                <img id="IMG_Waiting" src="Images/Processing.gif" alt="请稍候，处理中..." style="display: none;" />
                                            </a>
                                        </td>
                                        <td align="left" style="padding-top: 3px;">
                                            <asp:ImageButton ID="IB_ProPlanGanttNew" CssClass="inpu" ImageUrl="ImagesSkin/plan.png" Width="32px" Height="32px" runat="server" OnClick="IB_ProPlanGanttNew_Click"></asp:ImageButton>

                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td style="padding-top: 5px">
                                <table width="98%">
                                    <tr>
                                        <td style="text-align: left;">

                                            <table cellpadding="0" cellspacing="0" border="0" width="100%">

                                                <tr>
                                                    <td style="padding-top: 5px">
                                                        <div class="napbox">
                                                            <div class="npbx">
                                                                <div class="cline"></div>
                                                                <div class="npbxs">
                                                                    <h3>
                                                                        <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,TodaySummary%>" /></h3>

                                                                    <div class="mline">
                                                                        <h4>
                                                                            <asp:Label ID="LB_Progress" runat="server" Text="<%$ Resources:lang,Progress%>" /></h4>
                                                                        <NickLee:NumberBox ID="NB_FinishPercent" runat="server" Width="70%" MaxAmount="100" MinAmount="0">0.00</NickLee:NumberBox>
                                                                        <asp:Label ID="Label5" runat="server" Font-Bold="True" Text="%"></asp:Label>
                                                                    </div>
                                                                    <div class="mline">
                                                                        <h4>
                                                                            <asp:Label ID="LB_ManHour" runat="server" Text="<%$ Resources:lang,ManHour%>" /></h4>
                                                                        <NickLee:NumberBox MaxAmount="1000000000000" ID="NB_ManHour" runat="server" Width="80%" MinAmount="0">0.00</NickLee:NumberBox>
                                                                    </div>
                                                                </div>

                                                                <div class="npbxs">

                                                                    <h3>
                                                                        <asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,ZongJie %>"></asp:Label></h3>
                                                                    <CKEditor:CKEditorControl ID="HE_TodaySummary" runat="server" Toolbar="" Width="99%" Height="170" Visible="false" />
                                                                    <CKEditor:CKEditorControl runat="server" ID="HT_TodaySummary" Toolbar="" Width="99%" Height="170px" Visible="false" />
                                                                    <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
                                                                        <ContentTemplate>
                                                                            <div class="nmar">

                                                                                <Upload:InputFile ID="AttachFile" runat="server" name="photo" Accept="image/*;capture=camera" Width="180px" />
                                                                                <input type="hidden" val="" id="imgData" runat="server" />
                                                                                &nbsp;<input type="button" id="BtnUP" onclick="upload()" value="Upload" />
                                                                                <img id="IMG_Uploading" src="Images/Processing.gif" alt="请稍候，处理中..." style="display: none;" />


                                                                                <br />

                                                                                <%--<div id="ProgressBar">
                                                                                                <Upload:ProgressBar ID="ProgressBar1" runat='server' Width="500px" Height="100px">
                                                                                                </Upload:ProgressBar>
                                                                                            </div>--%>
                                                                            </div>
                                                                        </ContentTemplate>
                                                                        <Triggers>
                                                                            <%--  <asp:PostBackTrigger ControlID="BtnUP" />--%>
                                                                        </Triggers>
                                                                    </asp:UpdatePanel>

                                                                    <div class="manyspan" style="display: none;">

                                                                        <asp:CheckBox ID="CB_ReturnMsg" runat="server" Font-Bold="False" Text="<%$ Resources:lang,SendSMS%>" /><asp:CheckBox
                                                                            ID="CB_ReturnMail" runat="server" Font-Bold="False" Text="<%$ Resources:lang,SendEMail%>" />
                                                                        <asp:Label ID="LB_NoticeProjectCreator" runat="server" Text="<%$ Resources:lang,NoticeProjectCreator%>" />
                                                                        <br />
                                                                        <asp:TextBox ID="TB_Message" runat="server" Width="45%"></asp:TextBox>
                                                                        <asp:Button ID="BT_Send" runat="server" CssClass="inpu" OnClick="BT_Send_Click" Text="<%$ Resources:lang,Send%>" />
                                                                    </div>

                                                                    <div class="npbtn">
                                                                        <asp:Button ID="BT_Summit" runat="server" CssClass="inpu" OnClick="BT_Summit_Click" Text="<%$ Resources:lang,Submit%>" />
                                                                        <asp:Button ID="BT_Receive" runat="server" Text="<%$ Resources:lang,ProjectAgree%>"
                                                                            CssClass="inpu" OnClick="BT_Receive_Click" Visible="false" />
                                                                        <asp:Button ID="BT_Refuse" runat="server" Text="<%$ Resources:lang,Refuse%>" OnClick="BT_Refuse_Click"
                                                                            CssClass="inpu" Visible="false" />
                                                                        <asp:Button ID="BT_Activity" runat="server" Text="<%$ Resources:lang,ChuLiZhong%>" CssClass="inpu"
                                                                            OnClick="BT_Activity_Click" Visible="false" />
                                                                    </div>

                                                                    <div style="width: 100%; text-align: center; vertical-align: bottom;">
                                                                        <h4>
                                                                            <br />
                                                                            <br />
                                                                            <br />
                                                                            <asp:HyperLink ID="HL_DailyWorkReport" runat="server" Text="<%$ Resources:lang,hlDailyWorkReport%>"></asp:HyperLink>

                                                                        </h4>
                                                                    </div>

                                                                </div>
                                                            </div>

                                                            <table>
                                                                <tr style="height: 15px; display: none;">

                                                                    <td style="height: 13px; text-align: left">

                                                                        <table width="80%">
                                                                            <tr>
                                                                                <td width="40px">
                                                                                    <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,ChengGuo%>"></asp:Label>：</td>
                                                                                <td style="padding-left: 10px;">
                                                                                    <asp:TextBox ID="TB_Achievement" runat="server" Height="40px" TextMode="MultiLine" Width="99%"></asp:TextBox>
                                                                                </td>
                                                                            </tr>
                                                                        </table>

                                                                        <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,DiDian%>"></asp:Label>
                                                                        <asp:TextBox ID="TB_WorkAddress" runat="server" Width="250px"></asp:TextBox>

                                                                        <asp:DropDownList ID="DL_Authority" runat="server">
                                                                            <asp:ListItem Value="NO" Text="<%$ Resources:lang,BaoMi%>" />
                                                                            <asp:ListItem Value="YES" Text="<%$ Resources:lang,GongKai%>" />
                                                                        </asp:DropDownList>

                                                                        &nbsp;<NickLee:NumberBox ID="TB_Charge" runat="server" MaxAmount="1000000000000" MinAmount="-1000000000000" Visible="False" Width="71px">0.00</NickLee:NumberBox>
                                                                        <asp:HyperLink ID="HL_RelatedUser"
                                                                            runat="server" NavigateUrl="TTProRelatedUser.aspx" Font-Bold="True"
                                                                            Text="<%$ Resources:lang,hlBuildTeam%>"></asp:HyperLink>
                                                                        &nbsp;<asp:HyperLink ID="HL_ProjectItemBom" runat="server" NavigateUrl="TTProjectItemBom.aspx"
                                                                            Font-Bold="True" Text="<%$ Resources:lang,BOMWBSPlanning%>"></asp:HyperLink>
                                                                        &nbsp;<asp:HyperLink ID="HyperLink1" runat="server" Font-Bold="True" Text="<%$ Resources:lang,XiangMuWenKong%>"></asp:HyperLink>
                                                                        &nbsp;<asp:HyperLink ID="HL_MakePlan" runat="server" NavigateUrl="TTWorkPlan.aspx"
                                                                            Font-Bold="True" Text="<%$ Resources:lang,hlMakePlan%>"></asp:HyperLink>
                                                                        &nbsp;<asp:HyperLink ID="HyperLink3" runat="server" Font-Bold="True" Text="<%$ Resources:lang,XiangMuRenLiZiYuanGuanLi%>"></asp:HyperLink>
                                                                        &nbsp;<asp:HyperLink ID="HL_RunProjectByWF" runat="server" NavigateUrl="TTProAssignTask"
                                                                            Font-Bold="True" Text="<%$ Resources:lang,hlRunProjectByWF%>"></asp:HyperLink>&nbsp;<asp:HyperLink
                                                                                ID="HL_AssignTask" runat="server" NavigateUrl="TTProAssignTask"
                                                                                Font-Bold="True" Text="<%$ Resources:lang,hlAssignTask%>"></asp:HyperLink>
                                                                        &nbsp;<asp:HyperLink
                                                                            ID="HL_MeetingArrange" runat="server" Font-Bold="True" NavigateUrl="~/TTAddMeeting.aspx"
                                                                            Text="<%$ Resources:lang,hlArrangeMeeting%>"></asp:HyperLink>&nbsp;<asp:HyperLink
                                                                                ID="HL_ExpenseApplyWL" runat="server" Font-Bold="True" Text="<%$ Resources:lang,hlApplyFunding%>"></asp:HyperLink>
                                                                        &nbsp;<asp:HyperLink ID="HyperLink2" runat="server" Font-Bold="True" Text="<%$ Resources:lang,XiangMuChengBen%>"></asp:HyperLink>

                                                                        &nbsp;<asp:HyperLink ID="HL_ConfirmManHour" runat="server" NavigateUrl="TTProjectSummaryAnalystChart.aspx"
                                                                            Font-Bold="True" Text="<%$ Resources:lang,hlConfirmManhour%>">
                                                                            --&gt;<asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,GongShiQueRen%>"></asp:Label>
                                                                        </asp:HyperLink>
                                                                        &nbsp;<asp:HyperLink ID="HL_IncomeAndExpense" runat="server" Font-Bold="True" NavigateUrl="~/TTProjectIncomeAndExpenseReport.aspx"
                                                                            Text="<%$ Resources:lang,hlInComeAndExpense%>"></asp:HyperLink>
                                                                        &nbsp;<span style="font-size: 10pt"><asp:HyperLink ID="HL_ProjectReviewWL" runat="server"
                                                                            Font-Bold="True" Text="<%$ Resources:lang,hlReviewProject%>"></asp:HyperLink>
                                                                    </td>
                                                                </tr>
                                                                <tr style="height: 15px; display: none;">
                                                                    <td style="height: 13px; text-align: left">

                                                                        <asp:HyperLink ID="HL_Expense" runat="server" NavigateUrl="TTProExpense.aspx"
                                                                            Text="<%$ Resources:lang,ExpenseDetailAndReimburse%>"></asp:HyperLink>
                                                                        <asp:Label ID="LB_WorkID" runat="server" Text="-1" Visible="False"></asp:Label>
                                                                        &nbsp;<asp:HyperLink ID="HL_RelatedDoc" runat="server" NavigateUrl="TTProRelatedDoc.aspx"
                                                                            Text="<%$ Resources:lang,ProjectDocument%>"></asp:HyperLink>
                                                                        &nbsp;<asp:HyperLink ID="HL_RelatedReq" runat="server" NavigateUrl="TTProRelatedReqSummary.aspx"
                                                                            Text="<%$ Resources:lang,ProjectReq%>"></asp:HyperLink>
                                                                        &nbsp;<asp:HyperLink ID="HL_RelatedRisk" runat="server" NavigateUrl="TTProRelatedRisk.aspx"
                                                                            Text="<%$ Resources:lang,ProjectRisk%>"></asp:HyperLink>
                                                                        &nbsp;<asp:HyperLink ID="HL_RelatedContactInfor" runat="server" Text="<%$ Resources:lang,ContactList%>"></asp:HyperLink>
                                                                        &nbsp;<asp:HyperLink ID="HL_WLTem" runat="server" Text="<%$ Resources:lang,WFTemplate%>"></asp:HyperLink>
                                                                        &nbsp;<asp:HyperLink ID="HL_RelatedWorkFlowTemplate" runat="server" Enabled="false"
                                                                            NavigateUrl="TTProRelatedWFTemplate.aspx" Text="<%$ Resources:lang,RelatedWFTemplate%>"></asp:HyperLink>
                                                                        &nbsp;</span><asp:HyperLink ID="HL_ActorGroup" runat="server" NavigateUrl="~/TTProjectRelatedActorGroup.aspx"
                                                                            Text="<%$ Resources:lang,ActorGroup%>"></asp:HyperLink>
                                                                        &nbsp;

                                                                &nbsp; &nbsp;<asp:HyperLink ID="HL_MakeCollaboration" runat="server" NavigateUrl="~/TTMakeCollaboration.aspx"
                                                                    Text="<%$ Resources:lang,hlMakeCollaboration%>"></asp:HyperLink>
                                                                    </td>
                                                                </tr>
                                                                <tr style="height: 15px; display: none;">
                                                                    <td style="text-align: left; height: 9px;">
                                                                        <span>
                                                                            <asp:HyperLink ID="HL_RelatedConstract" runat="server" NavigateUrl="TTProjectRelatedConstract.aspx"
                                                                                Text="<%$ Resources:lang,Constract%>"></asp:HyperLink>
                                                                            &nbsp;<asp:HyperLink ID="HL_CustomerInfo" runat="server" NavigateUrl="~/TTCustomerInfo.aspx"
                                                                                Text="<%$ Resources:lang,Customer%>"></asp:HyperLink>
                                                                            &nbsp;<asp:HyperLink ID="HL_VendorInfo" runat="server" NavigateUrl="~/TTVendorInfo.aspx"
                                                                                Text="<%$ Resources:lang,Supplier%>"></asp:HyperLink>
                                                                            &nbsp;<asp:HyperLink ID="HL_ProjectAssetPurchase" runat="server"
                                                                                Text="<%$ Resources:lang,AssetPurchaseRequest%>"></asp:HyperLink>
                                                                            &nbsp;<asp:HyperLink ID="HL_ProjectAssetApplication" runat="server"
                                                                                Text="<%$ Resources:lang,AssetApplication%>"></asp:HyperLink>
                                                                            &nbsp;
                                                                <asp:HyperLink ID="HL_AssetShipmentReport" runat="server" NavigateUrl="~/TTAssetShipmentReport.aspx"
                                                                    Text="<%$ Resources:lang,AssetShipmentReport%>"></asp:HyperLink>
                                                                            &nbsp;<asp:HyperLink ID="HL_ExpenseApplySummary" runat="server" Text="<%$ Resources:lang,ExpenseApplySummary%>"></asp:HyperLink>
                                                                            &nbsp;<asp:HyperLink ID="HL_ExpenseClaimSummary" runat="server" Text="<%$ Resources:lang,ExpenseClaimSummary%>"></asp:HyperLink>
                                                                            &nbsp;<asp:HyperLink ID="HL_RelatedWorkFlow" runat="server" Text="<%$ Resources:lang,RelatedWorkFlow%>"></asp:HyperLink>
                                                                            &nbsp;<asp:HyperLink ID="HL_ProjectChildTree" runat="server" NavigateUrl="~/TTProjectChildTree.aspx"
                                                                                Text="<%$ Resources:lang,ChildProjectTree%>"></asp:HyperLink>
                                                                    </td>
                                                                </tr>
                                                                <tr style="height: 15px; display: none;">
                                                                    <td style="text-align: left; height: 28px;">
                                                                        <asp:HyperLink ID="HL_DailyWork" runat="server" NavigateUrl="TTProjectSummaryAnalystChart.aspx"
                                                                            Text="<%$ Resources:lang,DailyWorkSummary%>"></asp:HyperLink><span style="font-size: 10pt">&nbsp;&nbsp;<asp:HyperLink
                                                                                ID="HL_TaskSummary" runat="server" Text="<%$ Resources:lang,TaskSummary%>"></asp:HyperLink>
                                                                                &nbsp;<asp:HyperLink ID="HL_TaskRecordAssignSummary" runat="server"
                                                                                    Text="<%$ Resources:lang,TaskRecordAssignSummary%>"></asp:HyperLink>
                                                                                &nbsp;<asp:HyperLink ID="HL_LeadReview" runat="server" NavigateUrl="TTLeadReviewSummary.aspx"
                                                                                    Text="<%$ Resources:lang,LeadReviewSummary%>"></asp:HyperLink>
                                                                                &nbsp;<asp:HyperLink ID="HL_ExpenseSummary" runat="server" NavigateUrl="~/TTProjectExpenseReport.aspx"
                                                                                    Text="<%$ Resources:lang,ExpenseSummary%>"></asp:HyperLink>
                                                                                &nbsp;<asp:HyperLink ID="HL_StatusChangeRecord" runat="server" NavigateUrl="TTUserFeebackSummary.aspx"
                                                                                    Text="<%$ Resources:lang,StatusChangeRecord%>"></asp:HyperLink>
                                                                                &nbsp;<asp:HyperLink ID="HL_TransferProject" runat="server" NavigateUrl="~/TTTransferProjectRecord.aspx"
                                                                                    Text="<%$ Resources:lang,PMChangeRecord%>"></asp:HyperLink>&nbsp;
                                                                    </td>
                                                                </tr>
                                                                <tr style="display: none;">
                                                                    <td>
                                                                        <asp:DataList ID="DataList1" runat="server" Height="1px" CellPadding="0" ForeColor="#333333"
                                                                            Width="100%" Style="display: none;">
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
                                                                                                    <td width="23%" align="center">
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
                                                                                <table cellpadding="5" cellspacing="0" width="100%">
                                                                                    <tr>
                                                                                        <td style="width: 5%; text-align: center;" class="tdLeft">
                                                                                            <%#DataBinder .Eval (Container .DataItem ,"ProjectID") %><br />
                                                                                            <%#DataBinder .Eval (Container .DataItem ,"ProjectCode") %>
                                                                                        </td>
                                                                                        <td style="width: 23%; text-align: left; padding-left: 5px" class="tdLeft">
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
                                                                                            <asp:Label ID="LB_DLAcceptanceStandard" runat="server" Text="<%$ Resources:lang,AcceptanceStandard%>" />
                                                                                        </td>
                                                                                        <td colspan="10" style="text-align: left; padding-left: 5px" class="tdRight">
                                                                                            <%#DataBinder .Eval (Container .DataItem,"AcceptStandard") %>
                                                                                        </td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td style="width: 5%; text-align: center; font-size: 10pt" class="tdLeft">
                                                                                            <asp:Label ID="LB_DLStatus" runat="server" Text="<%$ Resources:lang,Status%>" />
                                                                                        </td>
                                                                                        <td colspan="10" style="text-align: left; padding-left: 5px" class="tdRight">
                                                                                            <%#DataBinder .Eval (Container .DataItem,"Status") %>
                                                                                            <asp:Label
                                                                                                ID="LB_StatusValue" runat="server" Text="<%$ Resources:lang,StatusValue%>" />:<%#DataBinder .Eval (Container .DataItem,"StatusValue") %></td>
                                                                                    </tr>
                                                                                </table>
                                                                            </ItemTemplate>
                                                                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />

                                                                            <ItemStyle CssClass="itemStyle" />
                                                                        </asp:DataList>

                                                                        <asp:Label ID="LB_Status" runat="server" Visible="False"></asp:Label>
                                                                        <asp:Label ID="LB_CreatorCode" runat="server" Visible="False"></asp:Label>
                                                                        <asp:Label ID="LB_UserCode" runat="server" Visible="False"></asp:Label>
                                                                        <asp:Label ID="LB_UserName" runat="server" Visible="False"></asp:Label>
                                                                        <asp:Label ID="LB_ProjectID" runat="server" T Visible="False"></asp:Label>
                                                                    </td>
                                                                </tr>
                                                            </table>
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
<script type="text/javascript" language="javascript">var cssDirectory = '<%=Session["CssDirectory"] %>'; var oLink = document.getElementById('mainCss'); oLink.href = 'css/' + cssDirectory + '/' + 'bluelightmain.css';</script>
</html>
