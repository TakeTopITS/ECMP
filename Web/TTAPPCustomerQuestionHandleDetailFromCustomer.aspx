<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTAPPCustomerQuestionHandleDetailFromCustomer.aspx.cs" Inherits="TTAPPCustomerQuestionHandleDetailFromCustomer" %>


<meta name="viewport" content="width=device-width; initial-scale=1.0; maximum-scale=1.0; minimum-scale=0.1; user-scalable=1" />
<%@ Register Assembly="Brettle.Web.NeatUpload" Namespace="Brettle.Web.NeatUpload"
    TagPrefix="Upload" %>

<%@ Register Assembly="NickLee.Web.UI" Namespace="NickLee.Web.UI" TagPrefix="NickLee" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc2" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link id="mainCss" href="css/bluelightmain.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        #AboveDiv {
            min-width: 1240px;
            width: expression (document.body.clientWidth <= 1240? "1240px" : "auto" ));
        }
    </style>
    <script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="js/allAHandler.js"></script>
    <script src="js/exif.js" type="text/javascript"></script>
    <script type="text/javascript" language="javascript">

        //页面加载完成,ajax回发加载完成后执行的操作，传入一个funtion
        //$load调用示例
        //$load(function () {
        //    //需要页面加载完成执行的代码
        //});
        var $load = function (loadFunc) {
            $(function () {
                if (typeof (Sys) != 'undefined') {
                    Sys.WebForms.PageRequestManager.getInstance().add_pageLoaded(loadFunc);
                }
                else {
                    loadFunc();
                }
            });
        };

        $load(function () {
             /*  if (top.location != self.location) { } else { CloseWebPage(); }*/

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

                        $(document.getElementsByTagName("iframe")[2]).contents().find("body").append(data);
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

        function displayXuQiu() {
            if (this.document.getElementById('div_xuqiu').style.display == "block") {

                this.document.getElementById('div_xuqiu').style.display = "none";

            }
            else {

                this.document.getElementById('div_xuqiu').style.display = "block"

            }
        }

    </script>
</head>
<body>
    <canvas id="myCanvas" style="display: none;"></canvas>
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
                                            <td align="left" width="175">
                                                <table width="165" border="0" align="left" cellpadding="0" cellspacing="0">
                                                    <tr>
                                                        <td width="29">
                                                            <%--<img src="Logo/main_top_l.jpg" alt="" width="29" height="31" />--%></td>
                                                        <td align="center" background="ImagesSkin/main_top_bj.jpg" class="titlezi">
                                                            <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,KeHuFuWuChuLi%>"></asp:Label>
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
                                    <table width="100%">
                                        <tr>
                                            <td>
                                                <div id="div_xuqiu" runat="server" > 
                                                    <table width="100%">
                                                        <tr>
                                                            <td align="left" valign="top" >
                                                                <div style="width: 97vw; text-align:right;">
                                                                    <asp:Button ID="BT_Create" runat="server" CssClass="inpu" OnClick="BT_Create_Click" Text="+需求" />
                                                                </div>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td align="left" valign="top" style="font-weight: bold; height: 24px; color: #394f66; background-image: url('ImagesSkin/titleBG.jpg')">
                                                               
                                                                <asp:DataGrid ID="DataGrid4" runat="server" AutoGenerateColumns="False" GridLines="None"
                                                                    OnItemCommand="DataGrid4_ItemCommand"
                                                                    AllowCustomPaging="false" ShowHeader="False"
                                                                    Width="100%">
                                                                    <ItemStyle CssClass="itemStyle" />
                                                                    <Columns>
                                                                        <asp:ButtonColumn ButtonType="LinkButton" CommandName="Update" Text="&lt;div&gt;&lt;img src=ImagesSkin/Update.png border=0 alt='修改' /&gt;&lt;/div&gt;">
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                                                        </asp:ButtonColumn>
                                                                        <asp:TemplateColumn HeaderText="Delete">
                                                                            <ItemTemplate>
                                                                                <asp:LinkButton ID="LBT_Delete" CommandName="Delete" runat="server" OnClientClick="return confirm(getDeleteMsgByLangCode())" Text="&lt;div&gt;&lt;img src=ImagesSkin/Delete.png border=0 alt='删除' /&gt;&lt;/div&gt;"></asp:LinkButton>
                                                                            </ItemTemplate>
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="right" Width="3%" />
                                                                        </asp:TemplateColumn>
                                                                        <asp:BoundColumn DataField="ID" HeaderText="编号">
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                        </asp:BoundColumn>
                                                                        <asp:BoundColumn DataField="Type" HeaderText="类型">
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                        </asp:BoundColumn>
                                                                        <asp:HyperLinkColumn DataNavigateUrlField="ID" DataNavigateUrlFormatString="TTCustomerQuestionHandleDetail.aspx?ID={0}" DataTextField="Question" HeaderText="服务需求" Target="_blank">
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" />
                                                                        </asp:HyperLinkColumn>
                                                                        <asp:HyperLinkColumn DataNavigateUrlField="OperatorCode" DataNavigateUrlFormatString="TTUserInforSimple.aspx?UserCode={0}" DataTextField="OperatorName" HeaderText="受理人" Target="_blank">
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                        </asp:HyperLinkColumn>
                                                                        <asp:BoundColumn DataField="OperatorStatus" HeaderText="受理状态">
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="5%" />
                                                                        </asp:BoundColumn>
                                                                        <asp:TemplateColumn>
                                                                            <ItemTemplate>
                                                                                <table>
                                                                                    <tr>
                                                                                        <td style="text-align:left;width:50px;">
                                                                                            <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl='<%# DataBinder.Eval(Container, "DataItem.ID", "TTCustomerQuestionRelatedDoc.aspx?RelatedID={0}") %>' Target="_blank"><img src="ImagesSkin/UpLoad.jpg"  class="noBorder" /></asp:HyperLink>

                                                                                        </td>
                                                                                        <td>
                                                                                            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# DataBinder.Eval(Container, "DataItem.ID", "TTDocumentTreeView.aspx?RelatedType=CustomerQuestion&RelatedID={0}") %>' Target="_blank"><img src="ImagesSkin/Doc.gif"  class="noBorder" /></asp:HyperLink>
                                                                                        </td>
                                                                                    </tr>
                                                                                </table>
                                                                            </ItemTemplate>
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="6%" />
                                                                        </asp:TemplateColumn>
                                                                    </Columns>
                                                                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                                    <EditItemStyle BackColor="#2461BF" />
                                                                    <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                                    <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />
                                                                </asp:DataGrid>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td align="left" valign="top" style="font-weight: bold; height: 24px; color: #394f66; background-image: url('ImagesSkin/titleBG.jpg')">
                                                                <table width="100%">
                                                                    <tr>
                                                                        <td align="left">
                                                                            <table>
                                                                                <tr>
                                                                                   
                                                                                    <td>
                                                                                        <asp:Label ID="Label48" runat="server" Text="<%$ Resources:lang,FuWuChuLiXiJie%>"></asp:Label>
                                                                                        ：</td>
                                                                                    <td style="text-align:center;">
                                                                                        <asp:Button ID="BT_Accept" runat="server" CssClass="inpu" OnClick="BT_Accept_Click"
                                                                                            Text="<%$ Resources:lang,ShouLi%>" />
                                                                                    </td>
                                                                                    <td style="text-align:center;">
                                                                                        <asp:Button ID="BT_Exit" runat="server" CssClass="inpu" OnClick="BT_Exit_Click" Text="<%$ Resources:lang,TuiChuShouLi%>" />
                                                                                    </td>
                                                                               
                                                                                    <td>
                                                                                        <asp:Label ID="Label51" runat="server" Text="<%$ Resources:lang,CYHSJ%>"></asp:Label>
                                                                                        ：</td>
                                                                                    <td>
                                                                                        <asp:DropDownList ID="DL_IsImportant" runat="server" Width="99%" AutoPostBack="true" OnSelectedIndexChanged="DL_IsImportant_SelectedIndexChanged">
                                                                                            <asp:ListItem>NO</asp:ListItem>
                                                                                            <asp:ListItem>YES</asp:ListItem>
                                                                                        </asp:DropDownList>
                                                                                    </td>
                                                                                        <td style="text-align:center;">
                                                                                        <asp:Button ID="BT_Finish" runat="server" CssClass="inpu" OnClick="BT_Finish_Click" Text="<%$ Resources:lang,WanCheng%>" />
                                                                                    </td>
                                                                              
                                                                                    <td>
                                                                                        <asp:Label ID="Label49" runat="server" Text="<%$ Resources:lang,ZhiJieChengYuan%>"></asp:Label>
                                                                                        ：</td>
                                                                                    <td>
                                                                                        <asp:DropDownList ID="DL_Operator" runat="server" DataTextField="UserName" DataValueField="UserCode">
                                                                                        </asp:DropDownList>
                                                                                    </td>
                                                                                    <td style="text-align:center;">
                                                                                        <asp:Button ID="BT_TransferOperator" runat="server" CssClass="inpuLong" OnClick="BT_TransferOperator_Click" Text="<%$ Resources:lang,ZhiDingWeiShouLiRen%>" />
                                                                                    </td>
                                                                                </tr>
                                                                            </table>
                                                                        </td>
                                                                    </tr>
                                                                    <tr >
                                                                        <td align="right">
                                                                            <table>
                                                                                <tr  style="display:none;">
                                                                                    <td style="padding-left: 5px;">
                                                                                        <asp:HyperLink ID="HL_RelatedDoc" runat="server" NavigateUrl="TTCollaborationRelatedDoc.aspx" Text="<%$ Resources:lang,XiangGuanWenJian%>"
                                                                                            Target="_blank">
                                                                                        </asp:HyperLink>
                                                                                    </td>
                                                                                    <td style="padding-left: 5px;">
                                                                                        <asp:HyperLink ID="HL_Expense" runat="server" NavigateUrl="TTProExpense.aspx" Text="<%$ Resources:lang,FeiYongMingXiYuBaoXiao%>" Target="_blank"></asp:HyperLink>
                                                                                    </td>

                                                                                    <%-- <td style="padding-left: 5px;">
                                                                                        <asp:HyperLink ID="HL_CustomerCollector" runat="server" NavigateUrl="TTRelatedDIYWorkflowForm.aspx?RelatedType=CustomerService&RelatedID=2" Text="信息收集" Target="_blank"></asp:HyperLink>
                                                                                    </td>--%>

                                                                                    <td style="padding-left: 5px;">
                                                                                        <asp:HyperLink ID="HL_ResoveResultReview"
                                                                                            runat="server" NavigateUrl="TTCustomerQuestionResultReviewWF.aspx" Text="<%$ Resources:lang,TiJiaoPingShen%>" Target="_blank">
                                                                                        </asp:HyperLink>
                                                                                    </td>
                                                                                </tr>
                                                                            </table>
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </td>
                                                        </tr>
                                                     </table>
                                                 </div>
                                                <br />
                                                 <table width="100%">
                                                    <tr>
                                                        <td align="left" valign="top" >
                                                            <div style="width: 97vw; text-align:right;">
                                                            <asp:Button ID="BT_CreateRecord" runat="server" Text="<%$ Resources:lang,New%>" CssClass="inpuYello" OnClick="BT_CreateRecord_Click" />
                                                            <asp:Label ID="LB_QuestionID" runat="server" Visible="false"></asp:Label>
                                                                </div>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td  align="left" valign="top">
                                                            <asp:DataList ID="DataList3" runat="server" CellPadding="0" ForeColor="#333333" OnItemCommand="DataList3_ItemCommand"
                                                                            Height="1px" Width="100%">

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

                                                                                            <strong></strong>
                                                                                        </td>

                                                                                        <td width="10%" align="center">

                                                                                            <strong>

                                                                                                <asp:Label ID="Label27" runat="server" Text="<%$ Resources:lang,BianHao%>"></asp:Label></strong>
                                                                                        </td>

                                                                                        <td width="10%" align="center">

                                                                                            <strong>

                                                                                                <asp:Label ID="Label28" runat="server" Text="<%$ Resources:lang,LianXiRen%>"></asp:Label></strong>
                                                                                        </td>

                                                                                        <td width="10%" align="center">

                                                                                            <strong>

                                                                                                <asp:Label ID="Label29" runat="server" Text="<%$ Resources:lang,LianXiFangShi%>"></asp:Label></strong>
                                                                                        </td>

                                                                                        <td width="10%" align="center">

                                                                                            <strong>

                                                                                                <asp:Label ID="Label30" runat="server" Text="<%$ Resources:lang,FuWuFangFa%>"></asp:Label></strong>
                                                                                        </td>

                                                                                        <td width="15%" align="center">

                                                                                            <strong>

                                                                                                <asp:Label ID="Label31" runat="server" Text="<%$ Resources:lang,ChuLiShiJian%>"></asp:Label></strong>
                                                                                        </td>

                                                                                        <td width="10%" align="center">

                                                                                            <strong>

                                                                                                <asp:Label ID="Label32" runat="server" Text="<%$ Resources:lang,YongShiChangDu%>"></asp:Label></strong>
                                                                                        </td>

                                                                                        <td width="10%" align="center">

                                                                                            <strong>

                                                                                                <asp:Label ID="Label33" runat="server" Text="<%$ Resources:lang,ZhuangTai%>"></asp:Label></strong>
                                                                                        </td>

                                                                                        <td width="10%" align="center">

                                                                                            <strong>

                                                                                                <asp:Label ID="Label34" runat="server" Text="<%$ Resources:lang,ShouLiRen%>"></asp:Label></strong>
                                                                                        </td>
                                                                                    </tr>
                                                                                </table>
                                                                            </td>

                                                                            <td width="6" align="right">

                                                                                <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" /></td>
                                                                        </tr>
                                                                    </table>
                                                                </HeaderTemplate>

                                                                <ItemTemplate>

                                                                    <table cellpadding="4" cellspacing="0" width="100%">

                                                                        <tr>

                                                                            <td class="tdLeft" style="width: 5%; text-align: center;">

                                                                                <asp:LinkButton ID="LinkButton1" runat="server" Text="&lt;div&gt;&lt;img src=ImagesSkin/Update.png border=0 alt='修改' /&gt;&lt;/div&gt;" CssClass="inpu" CommandName="Update" />
                                                                            </td>

                                                                            <%-- <td class="tdLeft" style="width: 5%; text-align: center;">

                                                                                <asp:LinkButton ID="LinkButton2" CommandName="Delete" runat="server" OnClientClick="return confirm(getDeleteMsgByLangCode())" Text="&lt;div&gt;&lt;img src=ImagesSkin/Delete.png border=0 alt='删除' /&gt;&lt;/div&gt;" />
                                                                            </td>--%>

                                                                            <td class="tdLeft" style="width: 10%; text-align: center;">

                                                                                <asp:Label ID="BT_ID" runat="server" Text=' <%#DataBinder .Eval (Container .DataItem ,"ID") %> ' />
                                                                            </td>

                                                                            <td class="tdLeft" style="width: 10%; padding-left: 5px; text-align: left;">

                                                                                <%#DataBinder.Eval(Container.DataItem, "CustomerAcceptor")%>
                                                                            </td>

                                                                            <td class="tdLeft" style="width: 10%; text-align: center;">

                                                                                <%#DataBinder.Eval(Container.DataItem, "AcceptorContactWay")%>
                                                                            </td>

                                                                            <td class="tdLeft" style="width: 10%; text-align: center;">

                                                                                <%#DataBinder.Eval(Container.DataItem, "HandleWay")%>
                                                                            </td>

                                                                            <td class="tdLeft" style="width: 15%; text-align: center;">

                                                                                <%#DataBinder.Eval(Container.DataItem, "HandleTime","{0:yyyy/MM/dd hh:MM:ss}")%>
                                                                            </td>

                                                                            <td class="tdLeft" style="width: 10%; text-align: center;">

                                                                                <%#DataBinder .Eval (Container .DataItem ,"UsedTime") %>

                                                                                <%#DataBinder .Eval (Container .DataItem ,"TimeUnit") %>
                                                                            </td>

                                                                            <td class="tdLeft" style="width: 10%; text-align: center;">

                                                                                <%#DataBinder .Eval (Container .DataItem ,"HandleStatus") %>
                                                                            </td>

                                                                            <td class="tdRight" style="width: 10%; text-align: center;">

                                                                                <%#DataBinder .Eval (Container .DataItem ,"OperatorName") %>
                                                                            </td>
                                                                        </tr>

                                                                        <tr>

                                                                            <td class="tdLeft" style="width: 5%; text-align: center; font-size: 10pt;">

                                                                                <asp:Label ID="Label35" runat="server" Text="<%$ Resources:lang,KeFangYiJian%>"></asp:Label>
                                                                            </td>

                                                                            <td class="tdRight" colspan="10" style="width: 95%; text-align: left; padding-left: 5px">

                                                                                <%#DataBinder.Eval(Container.DataItem, "CustomerComment")%>
                                                                            </td>
                                                                        </tr>

                                                                        <tr>

                                                                            <td class="tdLeft" style="width: 5%; text-align: center; font-size: 10pt;">

                                                                                <asp:Label ID="Label36" runat="server" Text="<%$ Resources:lang,ChuLiNeiRong%>"></asp:Label>
                                                                            </td>

                                                                            <td class="tdRight" colspan="10" style="width: 95%; text-align: left; padding-left: 5px">

                                                                                <%#DataBinder.Eval(Container.DataItem, "HandleDetail")%>
                                                                            </td>
                                                                        </tr>

                                                                        <tr>

                                                                            <td class="tdLeft" style="width: 5%; text-align: center; font-size: 10pt;">

                                                                                <asp:Label ID="Label37" runat="server" Text="<%$ Resources:lang,XiaCiFuWuShiJian%>"></asp:Label>
                                                                            </td>

                                                                            <td class="tdRight" style="text-align: left; padding-left: 5px">

                                                                                <%#DataBinder.Eval(Container.DataItem, "NextServiceTime")%>
                                                                            </td>

                                                                            <td class="tdLeft" style="text-align: center; font-size: 10pt;">

                                                                                <asp:Label ID="Label38" runat="server" Text="<%$ Resources:lang,TiQianTongZhiTianShu%>"></asp:Label>
                                                                            </td>

                                                                            <td class="tdRight" colspan="6" style="text-align: left; padding-left: 5px">

                                                                                <%#DataBinder.Eval(Container.DataItem, "PreDays")%>
                                                                            </td>
                                                                        </tr>
                                                                    </table>
                                                                </ItemTemplate>

                                                                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />

                                                                <ItemStyle CssClass="itemStyle" />
                                                            </asp:DataList>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                            <td style="width: 220px; border-right: solid 1px #D8D8D8; padding: 5px 0px 0px 5px;"
                                                valign="top" align="left">
                                                <div id="DivID" style="width: 100%; height: 800px; overflow: auto;">
                                                    <asp:TreeView ID="TreeView1" runat="server" NodeWrap="True" OnSelectedNodeChanged="TreeView1_SelectedNodeChanged"
                                                        ShowLines="True" Width="220px">
                                                        <RootNodeStyle CssClass="rootNode" />
                                                        <NodeStyle CssClass="treeNode" />
                                                        <LeafNodeStyle CssClass="leafNode" />
                                                        <SelectedNodeStyle CssClass="selectNode" />
                                                    </asp:TreeView>
                                                </div>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </div>

                    <div class="layui-layer layui-layer-iframe" id="popwindow" name="fixedDiv"
                        style="z-index: 9999; width: 98%; height: 500px; position: absolute; overflow: hidden; display: none; border-radius:10px;">
                        <div class="layui-layer-title" style="background: #e7e7e8;" id="popwindow_title">
                            <asp:Label ID="Label6" runat="server" Text="&lt;div&gt;&lt;img src=ImagesSkin/Update.png border=0 width=30px height=30px alt='BusinessForm' /&gt;&lt;/div&gt;"></asp:Label>
                        </div>
                        <div id="popwindow_content" class="layui-layer-content" style="overflow: auto; padding: 0px 5px 0px 5px;">

                            <table width="100%">
                               <tr>
                                    <td align="left">
                                        <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,FuWuXuQiuLeiBie%>"></asp:Label>
                                        </td>
                                    </tr>
                                <tr>
                                    <td align="left">
                                        <asp:DropDownList ID="DL_CustomerQuestionTypeNew" runat="server" CssClass="DDList" DataTextField="Type" DataValueField="Type" width="99%">
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="left">
                                        <asp:Label ID="Label8" runat="server" Text="<%$ Resources:lang,CYHSJ%>"></asp:Label>
                                       </td>
                                     </tr>
                                <tr>
                                    <td align="left">
                                        <asp:DropDownList ID="DL_IsImportantNew" runat="server" width="99%">
                                            <asp:ListItem>NO</asp:ListItem>
                                            <asp:ListItem>YES</asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td width="15%" align="left">
                                        <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,XuQiuShangJiMiaoShu%>"></asp:Label>
                                        </td>
                                     </tr>
                                <tr>
                                    <td  align="left">

                                        <CKEditor:CKEditorControl runat="server" ID="HT_Question" Width="90%" Height="120px" Visible="False" />
                                        <span class="auto-style1">*</span>
                                        
                                    </td>
                                </tr>
                              
                               </tr>
                                <tr>
                                    <td style="width: 15%; text-align: left;" class="formItemBgStyle">
                                        <asp:Label ID="Label11" runat="server" Text="<%$ Resources:lang,KeHuMingCheng%>"></asp:Label> </td>
                                    </tr>
                                <tr>
                                    <td  style="text-align: left;" class="formItemBgStyle">
                                        <asp:TextBox ID="TB_Company" runat="server" Width="99%"></asp:TextBox><span class="auto-style1">*</span>
                                    </td>
                                </tr>
                                <tr>
                                    <td width="15%" style="text-align: left;" class="formItemBgStyle">
                                        <asp:Label ID="Label12" runat="server" Text="<%$ Resources:lang,LianXiRen%>"></asp:Label> </td>
                                      </tr>
                                <tr>
                                    <td width="30%" class="formItemBgStyle" align="left">
                                        <asp:TextBox ID="TB_ContactPerson" runat="server" Width="90%"></asp:TextBox><span class="auto-style1">*</span>
                                    </td>
                                </tr>
                                <tr>
                                    <td width="15%" style="text-align: left;" class="formItemBgStyle">
                                        <asp:Label ID="Label13" runat="server" Text="<%$ Resources:lang,LianXiFangFa%>"></asp:Label>
                                    </td>
                                   </tr>
                                <tr>
                                    <td style="text-align: left;" class="formItemBgStyle">
                                        <asp:TextBox ID="TB_PhoneNumber" runat="server" Width="99%"></asp:TextBox><span class="auto-style1">*</span>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="text-align: left;" class="formItemBgStyle">
                                        <asp:Label ID="Label14" runat="server" Text="<%$ Resources:lang,YaoQiuDaFuShiJian%>"></asp:Label> </td>
                                    </tr>
                                <tr>
                                    <td style="text-align: left;" class="formItemBgStyle">
                                        <asp:TextBox ID="DLC_AnswerTime" runat="server" width="99%"></asp:TextBox>
                                        <ajaxToolkit:CalendarExtender Format="yyyy-MM-dd" ID="CalendarExtender2" runat="server" TargetControlID="DLC_AnswerTime" Enabled="True"></ajaxToolkit:CalendarExtender>
                                    </td>
                                    </tr>
                                            <tr>
                                    <td style="text-align: left;" class="formItemBgStyle">
                                        <asp:Label ID="Label15" runat="server" Text="<%$ Resources:lang,LianXiDiZhi%>"></asp:Label> </td>
                                     </tr>
                                <tr>
                                                <td style="text-align: left;" class="formItemBgStyle">
                                        <asp:TextBox ID="TB_Address" runat="server" Width="99%"></asp:TextBox></td>
                                </tr>
                                <tr>
                                    <td style="text-align: left;" class="formItemBgStyle">
                                        <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,EMail%>"></asp:Label> </td>
                                     </tr>
                                <tr>
                                    <td style="text-align: left;" class="formItemBgStyle">
                                        <asp:TextBox ID="TB_EMail" runat="server" width="99%"></asp:TextBox>&#160;&#160;</td>
                                   </tr>
                                            <tr>
                                    
                                    <td style="text-align: left;" class="formItemBgStyle">
                                        <asp:Label ID="Label39" runat="server" Text="<%$ Resources:lang,YouBian%>"></asp:Label> </td>
                                   </tr>
                                <tr>
                                      <td style="text-align: left;" class="formItemBgStyle">
                                        <asp:TextBox ID="TB_PostCode" runat="server" width="99%"></asp:TextBox></td>
                                </tr>

                                <tr>
                                    <td style="text-align: center;" colspan="2" class="formItemBgStyle">
                                        <asp:Label ID="Label41" runat="server" Text="<%$ Resources:lang,SHANGJIXINXI%>"></asp:Label>
                                    </td>
                                </tr>

                                <tr>

                                    <td style="text-align: left; width: 15%;" class="formItemBgStyle">
                                        <asp:Label ID="Label50" runat="server" Text="<%$ Resources:lang,YIQICHENGJIAOSHIJIAN%>"></asp:Label>
                                    </td>
                                     </tr>
                                <tr>
                                    <td style="text-align: left;" class="formItemBgStyle">
                                        <asp:TextBox ID="DLC_ExpectedTime" runat="server" width="99%"></asp:TextBox>
                                        <cc2:CalendarExtender ID="CalendarExtender3" runat="server" Enabled="True" Format="yyyy-MM-dd" TargetControlID="DLC_ExpectedTime">
                                        </cc2:CalendarExtender>
                                    </td>
                                    </tr>
                                            <tr>
                                    <td style="text-align: left; width: 15%;" class="formItemBgStyle">
                                        <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,YIQICHENGJIAOJINGE%>"></asp:Label>
                                       
                                    </td>
                                </tr>
                                <tr>
                                    <td style="text-align: left;" class="formItemBgStyle">
                                        <NickLee:NumberBox ID="NB_ExpectedEarnings" runat="server" MaxAmount="1000000000000" MinAmount="-1000000000000" width="99%">0.00</NickLee:NumberBox>
                                    </td>
                                </tr>

                                <tr>
                                    <td style="text-align: left; width: 15%;" class="formItemBgStyle">
                                        <asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,CHENGGONGGANJIANYINGSHU%>"></asp:Label>
                                    </td>
                                     </tr>
                                <tr>
                                    <td width="25%" class="formItemBgStyle">
                                        <asp:TextBox ID="TB_SucessKeyReason" runat="server" Width="99%" />
                                    </td>

                                    </tr>
                                            <tr>
                                    <td style="text-align: left; width: 15%;" class="formItemBgStyle">
                                        <asp:Label ID="Label9" runat="server" Text="<%$ Resources:lang,SHIBAIGANJIANYINGSHU%>"></asp:Label>
                                    </td>
                                                 </tr>
                                <tr>
                                    <td style="text-align: left;" class="formItemBgStyle">
                                        <asp:TextBox ID="TB_FailedKeyReason" runat="server" Width="99%"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="formItemBgStyle" style="text-align: left; width: 15%;">
                                        <asp:Label ID="Label52" runat="server" Text="<%$ Resources:lang,ShangJiJieDuan%>"></asp:Label>
                                    </td>
                                     </tr>
                                <tr>
                                    <td class="formItemBgStyle" width="25%" align="left">
                                        <asp:DropDownList ID="DL_Stage" runat="server" CssClass="DDList" width="99%" AutoPostBack="true" DataTextField="Stage" DataValueField="Stage" OnSelectedIndexChanged="DL_Stage_SelectedIndexChanged">
                                        </asp:DropDownList>
                                    </td>
                                    </tr>
                                   <tr>
                                    <td class="formItemBgStyle" style="text-align: left; width: 15%;">
                                        <asp:Label ID="Label53" runat="server" Text="<%$ Resources:lang,YingLu%>"></asp:Label>
                                    </td>
                                                 </tr>
                                <tr>
                                    <td class="formItemBgStyle" style="text-align: left;">
                                        <NickLee:NumberBox ID="NB_Possibility" runat="server" MaxAmount="1000000000000" MinAmount="-1000000000000" Precision="0" width="90%">0</NickLee:NumberBox>
                                        %
                                    </td>
                                </tr>

                                <tr>
                                    <td class="formItemBgStyle" style="text-align: left; width: 15%;">
                                        <asp:Label ID="Label10" runat="server" Text="客户商机阶段"></asp:Label>
                                    </td>
                                     </tr>
                                <tr>
                                    <td class="formItemBgStyle" width="25%" align="left">
                                        <asp:DropDownList ID="DL_CustomerStage" runat="server" CssClass="DDList" DataTextField="Stage" DataValueField="Stage" width="99%">
                                        </asp:DropDownList>
                                    </td>
                                    </tr>
                                            <tr>
                                    <td class="formItemBgStyle" style="text-align: left; width: 15%;">
                                        <asp:Label ID="Label16" runat="server" Text="<%$ Resources:lang,SHANGJIDAILI%>"></asp:Label>
                                        </td>
                                                 </tr>
                                <tr>
                                    <td class="formItemBgStyle" style="text-align: left;">
                                        <asp:TextBox ID="TB_AgencyName" runat="server" Width="99%" />
                                    </td>
                                </tr>

                                <tr>
                                    <td style="text-align: left; width: 15%;" class="formItemBgStyle">
                                        <asp:Label ID="Label17" runat="server" Text="<%$ Resources:lang,SHANGJILAIYUAN%>"></asp:Label>
                                      </td>
                                     </tr>
                                <tr>
                                    <td  align="left" class="formItemBgStyle" colspan="3">
                                        <asp:TextBox ID="TB_BusinessSource" runat="server" Width="99%" />
                                    </td>
                                </tr>

                                <tr style="display: none;">
                                    <td class="formItemBgStyle" style="text-align: left; width: 15%;">
                                        <asp:Label ID="Label54" runat="server" Text="<%$ Resources:lang,SHANGJIXINXI%>"></asp:Label>
                                        </td>
                                     </tr>
                                <tr>
                                    <td align="left" class="formItemBgStyle" width="25%">
                                        <asp:TextBox ID="TB_BusinessName" runat="server" Width="99%"></asp:TextBox>
                                    </td>
                                </tr>

                                <tr>
                                    <td class="formItemBgStyle" style="text-align: left; width: 15%;">
                                        <asp:Label ID="Label55" runat="server" Text="<%$ Resources:lang,KeHuMingCheng%>"></asp:Label>
                                    </td>
                                     </tr>
                                <tr>
                                    <td class="formItemBgStyle">
                                        <asp:TextBox ID="TB_CustomerName" runat="server" Width="99%" />
                                    </td>
                                </tr>
                                <tr style="display: none;">
                                    <td class="formItemBgStyle" style="text-align: left; width: 15%;">
                                        <asp:Label ID="Label18" runat="server" Text="<%$ Resources:lang,KeHuJingLi%>"></asp:Label>
                                    </td>
                                     </tr>
                                <tr>
                                    <td class="formItemBgStyle" align="left">
                                        <asp:TextBox ID="TB_CustomerManager" runat="server" width="99%"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="formItemBgStyle" style="text-align: left; width: 15%;">
                                        <asp:Label ID="LB_UserCode" runat="server" Visible="False"></asp:Label>
                                    </td>
                                     </tr>
                                <tr>
                                    <td align="left" class="formItemBgStyle" width="25%">
                                        <asp:Label ID="LB_UserName" runat="server" Visible="False"></asp:Label>
                                        <asp:Label ID="LB_Sql4" runat="server" Visible="False"></asp:Label>
                                        <asp:Label ID="Label56" runat="server" Visible="False"></asp:Label>
                                    </td>
                                </tr>
                            </table>

                            <table width="100%" style="display: none;">
                                <tr>
                                    <td width="100px">
                                        <asp:Label ID="Label19" runat="server" Text="<%$ Resources:lang,FuWuXuQiuLeiBie%>"></asp:Label>
                                        </td>
                                    <td width="205px">
                                        <asp:DropDownList ID="DL_CustomerQuestionType" runat="server" CssClass="DDList" DataTextField="Type" DataValueField="Type" Width="200px" AutoPostBack="true" OnSelectedIndexChanged="DL_CustomerQuestionType_SelectedIndexChanged">
                                        </asp:DropDownList>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td width="100px">
                                        <asp:Label ID="Label20" runat="server" Text="<%$ Resources:lang,FuWuXuQiuMiaoShu%>"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:Label ID="LB_Question" runat="server" Width="70%"></asp:Label></td>
                                </tr>
                            </table>
                            <br />
                            <br />
                        </div>

                        <div id="popwindow_footer" class="layui-layer-btn" style="border-top: 1px solid #ccc;">
                            <asp:LinkButton ID="BT_New" runat="server" class="layui-layer-btn notTab" OnClick="BT_New_Click" Text="<%$ Resources:lang,BaoCun%>"></asp:LinkButton><a class="layui-layer-btn notTab" onclick="return popClose();"><asp:Label ID="Label21" runat="server" Text="<%$ Resources:lang,GuanBi%>" /></a>
                        </div>
                        <span class="layui-layer-setwin"><a onclick="return popClose();" class="layui-layer-ico layui-layer-close layui-layer-close1 notTab" href="javascript:;"></a></span>
                    </div>

                    <div class="layui-layer layui-layer-iframe" id="popDetailWindow" name="fixedDiv"
                        style="z-index: 9999; width: 98%; height: 500px; position: absolute; overflow: hidden; display: none; border-radius:10px;">
                        <div class="layui-layer-title" style="background: #e7e7e8;" id="popwindow_title1">
                            <asp:Label ID="Label22" runat="server" Text="&lt;div&gt;&lt;img src=ImagesSkin/Update.png border=0 width=30px height=30px alt='BusinessForm' /&gt;&lt;/div&gt;"></asp:Label>
                        </div>
                        <div id="popwindow_content1" class="layui-layer-content" style="overflow: auto; padding: 0px 5px 0px 5px;">

                            <table style="width: 100%; padding: 5px 0px 0px 5px" cellpadding="0" cellspacing="0">
                                <tr>
                                    <td style="width: 10%; text-align: left;" class="formItemBgStyle">
                                        <asp:Label ID="LB_ID" runat="server" Visible="false"></asp:Label>
                                        <asp:Label ID="Label23" runat="server" Text="<%$ Resources:lang,KeHuYiJian%>"></asp:Label>
                                    </td>
                                     </tr>
                                <tr>
                                    <td  style="text-align: left;" class="formItemBgStyle">
                                        <CKEditor:CKEditorControl ID="HE_CustomerComment" runat="server" Width="99%" Height="80px" Visible="false" />
                                        <CKEditor:CKEditorControl ID="HT_CustomerComment" runat="server" Width="99%" Height="80px" Visible="False" />
                                    </td>
                                </tr>
                                <tr>
                                    <td style="text-align: left;" class="formItemBgStyle">
                                        <asp:Label ID="Label24" runat="server" Text="<%$ Resources:lang,ChuLiFangShi%>"></asp:Label>
                                    </td>
                                     </tr>
                                <tr>
                                    <td style="text-align: left;" class="formItemBgStyle">
                                        <asp:TextBox ID="TB_HandleWay" runat="server" width="60%"></asp:TextBox>
                                        <asp:DropDownList ID="DL_HandleWay" runat="server" AutoPostBack="true" OnSelectedIndexChanged="DL_ContactWay_SelectedIndexChanged">
                                            <asp:ListItem Value="" Text="<%$ Resources:lang,QingXuanZe%>" />
                                            <asp:ListItem Value="电话" Text="<%$ Resources:lang,DianHua%>" />
                                            <asp:ListItem Value="IM" Text="<%$ Resources:lang,IM%>" />
                                            <asp:ListItem Value="远程控制" Text="<%$ Resources:lang,YuanChengKongZhi%>" />
                                            <asp:ListItem Value="EMail" Text="<%$ Resources:lang,EMail%>" />
                                            <asp:ListItem Value="上门拜访" Text="<%$ Resources:lang,ShangMenBaiFang%>" />
                                            <asp:ListItem Value="其它方式" Text="<%$ Resources:lang,QiTaFangShi%>" />
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="text-align: left;" class="formItemBgStyle">
                                        <asp:Label ID="Label25" runat="server" Text="<%$ Resources:lang,ChuLiZhuangTai%>"></asp:Label>
                                    </td>
                                     </tr>
                                <tr>
                                    <td style="text-align: left;" class="formItemBgStyle">
                                        <asp:DropDownList ID="DL_HandleStatus" runat="server" width="99%">
                                            <asp:ListItem Value="处理中" Text="<%$ Resources:lang,ChuLiZhong%>" />
                                            <asp:ListItem Value="评审中" Text="<%$ Resources:lang,PingShenZhong%>" />
                                            <asp:ListItem Value="挂起" Text="<%$ Resources:lang,GuaQi%>" />
                                            <asp:ListItem Value="完成" Text="<%$ Resources:lang,WanCheng%>" />
                                            <asp:ListItem Value="取消" Text="<%$ Resources:lang,QuXiao%>" />
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="text-align: left;" class="formItemBgStyle">
                                        <asp:Label ID="Label40" runat="server" Text="<%$ Resources:lang,YongShi%>"></asp:Label>
                                    </td>
                                     </tr>
                                <tr>
                                    <td style="text-align: left;" class="formItemBgStyle">
                                        <NickLee:NumberBox MaxAmount="1000000000000" MinAmount="-1000000000000" ID="NB_UsedTime" runat="server" width="60%" Amount="1">1.00</NickLee:NumberBox>
                                        <asp:DropDownList ID="DL_TimeUnit" runat="server">
                                            <asp:ListItem Value="分钟" Text="<%$ Resources:lang,FenZhong%>" />
                                            <asp:ListItem Value="小时" Text="<%$ Resources:lang,XiaoShi%>" />
                                            <asp:ListItem Value="天" Text="<%$ Resources:lang,Tian%>" />
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="text-align: left;" class="formItemBgStyle">
                                        <asp:Label ID="Label57" runat="server" Text="<%$ Resources:lang,LianLuoRen%>"></asp:Label>
                                    </td>
                                     </tr>
                                <tr>
                                    <td style="text-align: left;" class="formItemBgStyle">
                                        <asp:TextBox ID="TB_CustomerAcceptor" runat="server" width="99%"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="text-align: left;" class="formItemBgStyle">
                                        <asp:Label ID="Label58" runat="server" Text="<%$ Resources:lang,LianXiFangFa%>"></asp:Label>
                                    </td>
                                     </tr>
                                <tr>
                                    <td style="text-align: left;"  class="formItemBgStyle">
                                        <asp:TextBox ID="TB_AcceptorContactWay" runat="server" width="99%"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="text-align: left;" class="formItemBgStyle">
                                        <asp:Label ID="Label59" runat="server" Text="<%$ Resources:lang,ChuLiNeiRong%>"></asp:Label>
                                    </td>
                                     </tr>
                                <tr>
                                    <td style="text-align: left;" class="formItemBgStyle">
                                        <CKEditor:CKEditorControl ID="HE_HandleDetail" runat="server" Width="90%" Height="80px" Visible="false" />
                                        <CKEditor:CKEditorControl ID="HT_HandleDetail" runat="server" Width="90%" Height="80px" Visible="False" />

                                    </td>
                                </tr>
                                 
                                <tr>
                                   <td >
                                        <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
                                                <ContentTemplate>
                                                    <div>
                                                        <Upload:InputFile ID="AttachFile" runat="server"  name="photo" accept="image/*;capture=camera"  Width="180px" />
                                                        <input  type="hidden" val="" id="imgData"  runat="server" />
                                                        &nbsp;<input type="button" id="BtnUP" onclick="upload()"  value="Upload" />
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

                                   </td>
                                </tr>
                                <tr>
                                    <td style="text-align: left;" class="formItemBgStyle">
                                        <asp:Label ID="Label60" runat="server" Text="<%$ Resources:lang,XiaCiFuWuShiJian%>"></asp:Label>
                                    </td>
                                     </tr>
                                <tr>
                                    <td style="text-align: left;" class="formItemBgStyle">
                                        <asp:TextBox ID="DLC_NextServiceTime" ReadOnly="false" runat="server" width="99%"></asp:TextBox>
                                        <ajaxToolkit:CalendarExtender Format="yyyy-MM-dd" ID="CalendarExtender1" runat="server" TargetControlID="DLC_NextServiceTime">
                                        </ajaxToolkit:CalendarExtender>
                                    </td>
                                 </tr>
                                <tr>

                                    <td style="text-align: left;" class="formItemBgStyle">
                                        <asp:Label ID="Label61" runat="server" Text="<%$ Resources:lang,TiQianTongZhiTianShu%>"></asp:Label>
                                    </td>
                                     </tr>
                                <tr>
                                    <td style="text-align: left;"  class="formItemBgStyle">
                                        <NickLee:NumberBox ID="NB_PreDays" runat="server" MaxAmount="1000000000000" MinAmount="-1000000000000" Width="90%" Precision="0">0</NickLee:NumberBox>
                                        <asp:Label ID="Label62" runat="server" Text="<%$ Resources:lang,Tian%>"></asp:Label>
                                    </td>
                                </tr>
                            </table>
                            <br />
                            <br />
                        </div>

                        <div id="popwindow_footer1" class="layui-layer-btn" style="border-top: 1px solid #ccc;">
                            <asp:LinkButton ID="BT_NewRecord" runat="server" class="layui-layer-btn notTab" OnClick="BT_NewRecord_Click" Text="<%$ Resources:lang,BaoCun%>"></asp:LinkButton><a class="layui-layer-btn notTab" onclick="return popClose();"><asp:Label ID="Label63" runat="server" Text="<%$ Resources:lang,GuanBi%>" /></a>
                        </div>
                        <span class="layui-layer-setwin"><a onclick="return popClose();" class="layui-layer-ico layui-layer-close layui-layer-close1 notTab" href="javascript:;"></a></span>
                    </div>

                    <div class="layui-layer-shade" id="popwindow_shade" style="z-index: 9998; background-color: #000; opacity: 0.3; filter: alpha(opacity=30); display: none;"></div>
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
