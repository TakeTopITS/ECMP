<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTWorkFlowCommonDataViewForBrowse.aspx.cs" Inherits="TTWorkFlowCommonDataViewForBrowse" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link id="mainCss" href="css/bluelightmain.css" rel="stylesheet" type="text/css" />

    <script src="js/jquery-1.7.2.min.js"></script>

    <style type="text/css">
        .ToolBar {
            position: fixed !important;
            bottom: 0px;
            left: 0px;
            margin: 0 auto;
            position: absolute;
            top: expression(offsetParent.scrollTop+0);
            border: 1px solid #dddddd;
            border-bottom: 1px solid #dddddd;
            background-color: ButtonFace;
            width: 100%;
            height: 30px;
        }
    </style>

    <script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>

    <script type="text/javascript">
        var preFrameW = '850,*';
        var FrameHide = 0;

        var i = 850;
        var j = 150;

        var decreaseTimer;
        var creaseTimer;

        function ChangeMenu(way) {

            var fcol = window.parent.document.getElementById("bodyFrame").cols;

            clearInterval(decreaseTimer);
            clearInterval(creaseTimer);

            if (FrameHide == 0) {
                preFrameW = window.parent.document.getElementById("bodyFrame").cols;

                if (preFrameW != '150,*') {

                    window.parent.document.getElementById("bodyFrame").cols = '150,*';

                    //decreaseTimer = setInterval(decreaseLeftWidth, 1);
                    i = 850;

                    FrameHide = 1;
                    return;
                }
                else {

                    window.parent.document.getElementById("bodyFrame").cols = '850,*';

                    FrameHide = 1;
                    return;
                }
            } else {

                window.parent.document.getElementById("bodyFrame").cols = preFrameW;

                //creaseTimer = setInterval(creaseLeftWidth, 1);
                j = 150;

                FrameHide = 0;
                return;
            }
        }

        if (way != 2) {
            fcols = fcol.split(',');
            fcols[0] = parseInt(fcols[0]) + addwidth;
            window.parent.document.getElementById("bodyFrame").cols = fcols[0] + ',*';
        }

        function decreaseLeftWidth() {
            i = i - 10;
            if (i >= 150) {
                window.parent.document.getElementById("bodyFrame").cols = i.toString() + ",*";
            }
        }
        function creaseLeftWidth() {
            j = j + 10;
            if (j <= 850) {
                window.parent.document.getElementById("bodyFrame").cols = j.toString() + ",*";
            }
        }

        function previewAll() {

            iframeURL = document.getElementById("DetailArea").contentWindow.location.href;

            var win = window.open(iframeURL, "DetailArea");      //打开一个空页面
            win.moveTo(100, 100);                           //移动到指定位置
            win.location = document.getElementById("DetailArea").contentWindow.location.href;     //指定页面的内容
            iframeHTML = win.document.body.innerHTML;

            bdhtml = window.document.body.innerHTML;
            sprnstr = "<!--startprintAll-->";
            eprnstr = "<!--endprintAll-->";
            prnhtml = bdhtml.substr(bdhtml.indexOf(sprnstr) + 21);
            prnhtml = prnhtml.substring(0, prnhtml.indexOf(eprnstr));

            win.document.body.innerHTML = prnhtml + iframeHTML;
            win.print();

            //window.document.body.innerHTML = prnhtml;
            //window.print();

            document.body.innerHTML = bdhtml;
            return false;
        }

        function preview1() {

            iframeURL = document.getElementById("DetailArea").contentWindow.location.href;

            var win = window.open(iframeURL, "DetailArea");      //打开一个空页面
            win.moveTo(100, 100);                           //移动到指定位置
            win.location = document.getElementById("DetailArea").contentWindow.location.href;     //指定页面的内容
            iframeHTML = win.document.body.innerHTML;

            bdhtml = window.document.body.innerHTML;
            sprnstr = "<!--startprint1-->";
            eprnstr = "<!--endprint1-->";
            prnhtml = bdhtml.substr(bdhtml.indexOf(sprnstr) + 18);
            prnhtml = prnhtml.substring(0, prnhtml.indexOf(eprnstr));

            win.document.body.innerHTML = prnhtml + iframeHTML;
            win.print();

            //window.document.body.innerHTML = prnhtml;
            //window.print();

            document.body.innerHTML = bdhtml;
            return false;
        }

        function preview2() {

            iframeURL = document.getElementById("DetailArea").contentWindow.location.href;

            var win = window.open(iframeURL, "DetailArea");      //打开一个空页面
            win.moveTo(100, 100);                           //移动到指定位置
            win.location = document.getElementById("DetailArea").contentWindow.location.href;     //指定页面的内容
            iframeHTML = win.document.body.innerHTML;

            bdhtml = window.document.body.innerHTML;
            sprnstr = "<!--startprint2-->";
            eprnstr = "<!--endprint2-->";
            prnhtml = bdhtml.substr(bdhtml.indexOf(sprnstr) + 18);
            prnhtml = prnhtml.substring(0, prnhtml.indexOf(eprnstr));

            win.document.body.innerHTML = prnhtml + iframeHTML;
            win.print();

            //window.document.body.innerHTML = prnhtml;
            //window.print();

            document.body.innerHTML = bdhtml;
            return false;
        }

        function setValue(m_strValue) {
            if (m_strValue != null && m_strValue != undefined) {
                txtReturnValue.value = m_strValue;
            }
        }
    </script>

    <script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="js/allAHandler.js"></script>
    <script type="text/javascript" language="javascript">
        $(function () {

            if (top.location != self.location) { } else { CloseWebPage(); }

            //依流程模板步骤定义的此函数设置表单各种属性
            try {
                setWorkflowForm();
            }
            catch (error) {
            }
            finally {
            }

        });


        function iFrameHeight() {
            var ifm = document.getElementById("DetailArea");
            var subWeb = document.frames ? document.frames["DetailArea"].document : ifm.contentDocument;
            if (ifm != null && subWeb != null) {
                ifm.height = subWeb.body.scrollHeight;
                ifm.width = subWeb.body.scrollWidth;
            }

            if (document.getElementById("DetailArea").height == 0) {
                document.getElementById("DetailArea").height = 500;
                document.getElementById("DetailArea").width = 800;
            }
        }

        //显示或隐藏其它流程相关文档
        function changeProjectDocDataGridVisible() {
            if (document.getElementById('TR_OtherDoc').style.display == 'block') {
                document.getElementById('TR_OtherDoc').style.display = "none";
            }
            else {
                document.getElementById('TR_OtherDoc').style.display = 'block';
            }
        }

        //自动点击明细链接
        function aClick() {

            if (document.all) {
                // For IE
                document.getElementById('aDetailView').click();

            } else if (document.createEvent) {
                //FOR DOM2
                var ev = document.createEvent('MouseEvents');
                ev.initEvent('click', false, true);
                document.getElementById('aDetailView').dispatchEvent(ev);
            }

            document.getElementById('aDetailView').style.display = "none";
        }

    </script>
</head>
<body onload="aClick();">
    <center>
        <form id="form1" runat="server">
            <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="True" EnableScriptLocalization="True">
            </asp:ScriptManager>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <!--startprintAll-->
                    <!--startprint1-->
                    <div style="width: 100%; position: relative; top: 1px; text-align: left;">
                        <table width="100%" cellpadding="4" cellspacing="0">
                            <tr>
                                <td align="left" style="padding-left: 30px;">
                                    <asp:DataList ID="DataList1" runat="server" Width="900px" CellPadding="0" CellSpacing="0">
                                        <ItemTemplate>
                                            <table class="bian" cellpadding="4" cellspacing="0" style="border-collapse: collapse; width: 900px;">
                                                <tr>
                                                    <td style="width: 100px; text-align: left">
                                                        <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,CaiGouDanHao%>"></asp:Label>：
                                                    </td>
                                                    <td style="text-align: left">
                                                        <%#DataBinder.Eval(Container.DataItem, "POID")%>
                                                    </td>
                                                    <td style="width: 100px; text-align: left;">
                                                        <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,MingCheng%>"></asp:Label>：
                                                    </td>
                                                    <td style="text-align: left">
                                                        <%#DataBinder.Eval(Container.DataItem, "POName")%>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="text-align: left">
                                                        <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,CaiGouShiJian%>"></asp:Label>：
                                                    </td>
                                                    <td style="text-align: left">
                                                        <%#DataBinder.Eval(Container.DataItem, "PurTime", "{0:yyyy/MM/dd}")%>
                                                    </td>
                                                    <td style="text-align: left">
                                                        <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,DaoHuoShiJian%>"></asp:Label>：
                                                    </td>
                                                    <td style="text-align: left">
                                                        <%#DataBinder.Eval(Container.DataItem, "ArrivalTime", "{0:yyyy/MM/dd}")%>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="text-align: left">
                                                        <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,ZongJinE%>"></asp:Label>：
                                                    </td>
                                                    <td style="text-align: left">
                                                        <%#DataBinder.Eval(Container.DataItem, "Amount")%>
                                                    </td>
                                                    <td style="text-align: left">
                                                        <asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,CaiGouYuan%>"></asp:Label>：
                                                    </td>
                                                    <td style="height: 18px; text-align: left">
                                                        <a href='TTUserInforSimple.aspx?UserCode=<%#DataBinder .Eval (Container .DataItem ,"PurManCode") %>'
                                                            target="DetailArea">
                                                            <%#DataBinder.Eval(Container.DataItem, "PurManName")%></a>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="text-align: left">
                                                        <asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,BeiZhu%>"></asp:Label>：
                                                    </td>
                                                    <td style="height: 18px; text-align: left">
                                                        <%#DataBinder.Eval(Container.DataItem, "Comment")%>
                                                    </td>
                                                    <td style="text-align: left">
                                                        <asp:Label ID="Label8" runat="server" Text="<%$ Resources:lang,ZhuangTai%>"></asp:Label>：
                                                    </td>
                                                    <td style="text-align: left">
                                                        <%#DataBinder.Eval(Container.DataItem, "Status")%>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="text-align: right"></td>
                                                    <td colspan="4" align="left">
                                                        <a id="aDetailView" href='TTAssetPurchaseOrderDetailView.aspx?POID=<%#DataBinder.Eval(Container.DataItem, "DetailPOID")%>&NoPop=YES'
                                                            target="DetailArea">
                                                            <asp:Label ID="Label11" runat="server" Text="<%$ Resources:lang,CaiGouMingXi%>"></asp:Label></a>
                                                        &nbsp;&nbsp;&nbsp;&nbsp;
                                                            <asp:HyperLink ID="HL_WLBusinessUpdate" runat="server" NavigateUrl='<%#"TTMakeAssetPurchase.aspx?BusinessID=" + DataBinder.Eval(Container.DataItem, "POID") + "&WLID=" + strWLID + "&WLStepDetailID=" + strID  %>' Text="&lt;div&gt;&lt;img src=ImagesSkin/Update.png border=0 alt='修改' /&gt;&lt;/div&gt;"></asp:HyperLink>

                                                    </td>
                                                </tr>
                                            </table>
                                        </ItemTemplate>
                                    </asp:DataList>
                                    <asp:DataList ID="DataList2" runat="server" Height="1px" Width="700px" CellPadding="0"
                                        CellSpacing="0">
                                        <ItemTemplate>
                                            <table class="bian" style="width: 700px;" cellpadding="4" cellspacing="0">
                                                <tr style="color: #000000">
                                                    <td align="right" style="width: 100px">
                                                        <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,ShenQingRen%>"></asp:Label>：
                                                    </td>
                                                    <td align="left" style="width: 600px">
                                                        <%#DataBinder.Eval(Container.DataItem, "ApplicantCode")%>
                                                        <%#DataBinder.Eval(Container.DataItem, "ApplicantName")%>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="right" style="width: 100px">
                                                        <asp:Label ID="Label18" runat="server" Text="<%$ Resources:lang,FeiYongMingCheng%>"></asp:Label>：
                                                    </td>
                                                    <td align="left" style="width: 600px">
                                                        <%#DataBinder.Eval(Container.DataItem, "ExpenseName")%>
                                                    </td>
                                                </tr>
                                                <tr style="color: #000000">
                                                    <td align="right" style="width: 100px; height: 9px">
                                                        <asp:Label ID="Label19" runat="server" Text="<%$ Resources:lang,JinE%>"></asp:Label>：
                                                    </td>
                                                    <td align="left" style="width: 600px; height: 9px">
                                                        <%#DataBinder.Eval(Container.DataItem, "Amount")%>
                                                    </td>
                                                </tr>
                                                <tr style="color: #000000">
                                                    <td align="right" style="width: 100px">
                                                        <asp:Label ID="Label20" runat="server" Text="<%$ Resources:lang,GuiHuanShiJian%>"></asp:Label>：
                                                    </td>
                                                    <td align="left" style="width: 600px">
                                                        <%# Convert.ToDateTime(DataBinder.Eval(Container.DataItem, "PayBackTime")).ToString("yyyy/MM/dd")%>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="right" style="width: 100px; height: 30px">
                                                        <asp:Label ID="Label21" runat="server" Text="<%$ Resources:lang,ZhuYaoYongTu%>"></asp:Label>：
                                                    </td>
                                                    <td align="left" style="width: 600px; height: 30px">
                                                        <%#DataBinder.Eval(Container.DataItem, "Purpose")%>
                                                    </td>
                                                </tr>
                                                <tr style="color: #000000">
                                                    <td align="right" style="width: 100px">
                                                        <asp:Label ID="Label22" runat="server" Text="<%$ Resources:lang,GuanLianYeWu%>"></asp:Label>：
                                                    </td>
                                                    <td align="left" style="width: 600px">
                                                        <a href='TTRelatedFormView.aspx?Type=ExpenseApply&ID=<%#DataBinder.Eval(Container.DataItem, "ID")%>'
                                                            target="DetailArea">
                                                            <%#DataBinder.Eval(Container.DataItem, "RelatedType")%>
                                                             :<%#DataBinder.Eval(Container.DataItem, "RelatedID")%></a></td>
                                                </tr>

                                                <tr>
                                                    <td align="right" style="width: 100px; height: 6px">
                                                        <asp:Label ID="Label24" runat="server" Text="<%$ Resources:lang,ShenQingShiJian%>"></asp:Label>：
                                                    </td>
                                                    <td align="left" style="width: 600px; height: 6px">
                                                        <%# Convert.ToDateTime(DataBinder.Eval(Container.DataItem, "ApplyTime")).ToString("yyyy/MM/dd")%>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="text-align: right"></td>
                                                    <td align="left">
                                                        <asp:HyperLink ID="HL_WLBusinessUpdate" runat="server" NavigateUrl='<%#"TTExpenseApplyWF.aspx?BusinessID=" + DataBinder.Eval(Container.DataItem, "ID") + "&WLID=" + strWLID + "&WLStepDetailID=" + strID  %>' Text="&lt;div&gt;&lt;img src=ImagesSkin/Update.png border=0 alt='修改' /&gt;&lt;/div&gt;" />

                                                    </td>
                                                </tr>
                                            </table>
                                        </ItemTemplate>
                                    </asp:DataList>
                                    <asp:DataList ID="DataList3" runat="server" Height="1px" Width="700px" CellPadding="0"
                                        CellSpacing="0">
                                        <ItemTemplate>
                                            <table class="bian" style="width: 700px;" cellpadding="4" cellspacing="0">
                                                <tr style="color: #000000">
                                                    <td align="right" style="width: 100px">
                                                        <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,ShenQingRen%>"></asp:Label>：
                                                    </td>
                                                    <td align="left" style="width: 600px">
                                                        <%#DataBinder.Eval(Container.DataItem, "UploadManCode")%>
                                                        <%#DataBinder.Eval(Container.DataItem, "UploadManName")%>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="right" style="width: 100px">
                                                        <asp:Label ID="Label25" runat="server" Text="<%$ Resources:lang,WenJianMing%>"></asp:Label>：
                                                    </td>
                                                    <td align="left" style="width: 600px">
                                                        <a href='<%#DataBinder.Eval(Container.DataItem, "Address")%>' target="_blank">
                                                            <%#DataBinder.Eval(Container.DataItem, "DocName")%></a>
                                                    </td>
                                                </tr>
                                                <tr style="color: #000000">
                                                    <td align="right" style="width: 100px; height: 9px">
                                                        <asp:Label ID="Label26" runat="server" Text="<%$ Resources:lang,LeiXing%>"></asp:Label>：
                                                    </td>
                                                    <td align="left" style="width: 600px; height: 9px">
                                                        <%#DataBinder.Eval(Container.DataItem, "DocType")%>
                                                    </td>
                                                </tr>
                                                <tr style="color: #000000">
                                                    <td align="right" style="width: 100px">
                                                        <asp:Label ID="Label27" runat="server" Text="<%$ Resources:lang,ShangChuanShiJian%>"></asp:Label>：
                                                    </td>
                                                    <td align="left" style="width: 600px">
                                                        <%--<%#DataBinder.Eval(Container.DataItem, "UploadTime", "{0:yyyy/MM/dd}")%>--%>
                                                        <%# Convert.ToDateTime(DataBinder.Eval(Container.DataItem, "UploadTime")).ToString("yyyy/MM/dd")%>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="right" style="width: 100px; height: 30px">
                                                        <asp:Label ID="Label28" runat="server" Text="<%$ Resources:lang,ZuoZhe%>"></asp:Label>：
                                                    </td>
                                                    <td align="left" style="width: 600px; height: 30px">
                                                        <%#DataBinder.Eval(Container.DataItem, "Author")%>
                                                    </td>
                                                </tr>
                                            </table>
                                        </ItemTemplate>
                                    </asp:DataList>
                                    <asp:DataList ID="DataList4" runat="server" Width="980px" Height="1px" CellPadding="0"
                                        CellSpacing="0">
                                        <HeaderTemplate>
                                            <table width="100%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                                <tr>
                                                    <td width="7">
                                                        <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" />
                                                    </td>
                                                    <td>
                                                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                            <tr>
                                                                <td width="8%" align="center">
                                                                    <strong>
                                                                        <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,BianHao%>"></asp:Label></strong>
                                                                </td>
                                                                <td width="14%" align="center">
                                                                    <strong>
                                                                        <asp:Label ID="Label30" runat="server" Text="<%$ Resources:lang,XiangMuMingCheng%>"></asp:Label></strong>
                                                                </td>
                                                                <td width="10%" align="center">
                                                                    <strong>
                                                                        <asp:Label ID="Label31" runat="server" Text="<%$ Resources:lang,LiXiangRen%>"></asp:Label></strong>
                                                                </td>
                                                                <td width="10%" align="center">
                                                                    <strong>
                                                                        <asp:Label ID="Label32" runat="server" Text="<%$ Resources:lang,FeiYongYuSuan%>"></asp:Label></strong>
                                                                </td>
                                                                <td width="10%" align="center">
                                                                    <strong>
                                                                        <asp:Label ID="Label33" runat="server" Text="<%$ Resources:lang,GongShiYuSuan%>"></asp:Label></strong>
                                                                </td>
                                                                <td width="10%" align="center">
                                                                    <strong>
                                                                        <asp:Label ID="Label34" runat="server" Text="<%$ Resources:lang,RenLiYuSuan%>"></asp:Label></strong>
                                                                </td>
                                                                <td width="10%" align="center">
                                                                    <strong>
                                                                        <asp:Label ID="Label35" runat="server" Text="<%$ Resources:lang,KaiShiRiQi%>"></asp:Label></strong>
                                                                </td>
                                                                <td width="10%" align="center">
                                                                    <strong>
                                                                        <asp:Label ID="Label36" runat="server" Text="<%$ Resources:lang,JieShuRiQi%>"></asp:Label></strong>
                                                                </td>
                                                                <td width="10%" align="center">
                                                                    <strong>
                                                                        <asp:Label ID="Label37" runat="server" Text="<%$ Resources:lang,ZhiDingRiQi%>"></asp:Label></strong>
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
                                            <table width="100%" cellpadding="4" cellspacing="0">
                                                <tr>
                                                    <td style="width: 8%; text-align: center;"
                                                        class="tdLeft">
                                                        <%#DataBinder .Eval (Container .DataItem ,"ProjectID") %>
                                                    </td>
                                                    <td style="width: 14%; text-align: left"
                                                        class="tdLeft">
                                                        <%#DataBinder .Eval (Container .DataItem,"ProjectName") %>
                                                    </td>
                                                    <td style="width: 10%; text-align: center"
                                                        class="tdLeft">
                                                        <%#DataBinder .Eval (Container .DataItem,"UserName") %>
                                                    </td>
                                                    <td style="width: 10%; text-align: center"
                                                        class="tdLeft">
                                                        <%#DataBinder .Eval (Container .DataItem,"Budget") %>
                                                    </td>
                                                    <td style="width: 10%; text-align: center"
                                                        class="tdLeft">
                                                        <%#DataBinder .Eval (Container .DataItem,"ManHour") %>
                                                    </td>
                                                    <td style="width: 10%; text-align: center"
                                                        class="tdLeft">
                                                        <%#DataBinder .Eval (Container .DataItem,"ManNumber") %>
                                                    </td>
                                                    <td style="width: 10%; text-align: center"
                                                        class="tdLeft">
                                                        <%--<%#DataBinder.Eval(Container.DataItem, "BeginDate", "{0:yyyy/MM/dd}")%>--%>
                                                        <%# Convert.ToDateTime(DataBinder.Eval(Container.DataItem, "BeginDate")).ToString("yyyy/MM/dd")%>
                                                    </td>
                                                    <td style="width: 10%; text-align: center"
                                                        class="tdLeft">
                                                        <%--<%#DataBinder.Eval(Container.DataItem, "EndDate", "{0:yyyy/MM/dd}")%>--%>
                                                        <%# Convert.ToDateTime(DataBinder.Eval(Container.DataItem, "EndDate")).ToString("yyyy/MM/dd")%>
                                                    </td>
                                                    <td style="width: 10%; text-align: center"
                                                        class="tdLeft">
                                                        <%--<%#DataBinder.Eval(Container.DataItem, "MakeDate", "{0:yyyy/MM/dd}")%>--%>
                                                        <%# Convert.ToDateTime(DataBinder.Eval(Container.DataItem, "MakeDate")).ToString("yyyy/MM/dd")%>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="width: 8%; text-align: center; font-size: 10pt"
                                                        class="tdLeft">
                                                        <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,XiangXiYaoQiu%>"></asp:Label>
                                                    </td>
                                                    <td colspan="8" style="text-align: left" class="tdRight">
                                                        <span style="font-size: 9pt">
                                                            <%#DataBinder .Eval (Container .DataItem,"ProjectDetail") %>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="width: 8%; text-align: center; font-size: 10pt"
                                                        class="tdLeft">
                                                        <asp:Label ID="Label39" runat="server" Text="<%$ Resources:lang,YanShouBiaoZhun%>"></asp:Label>
                                                    </td>
                                                    <td colspan="8" style="text-align: left" class="tdRight">
                                                        <span style="font-size: 9pt">
                                                            <%#DataBinder .Eval (Container .DataItem,"AcceptStandard") %>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td colspan="9" style="text-align: left" class="tdRight">
                                                        <a href='TTNoTitleDocumentTreeView.aspx?RelatedType=Project&RelatedID=<%#DataBinder .Eval (Container .DataItem ,"ProjectID") %>'
                                                            target="DetailArea">
                                                            <asp:Label ID="Label40" runat="server" Text="<%$ Resources:lang,XiangGuanWenDang%>"></asp:Label></a>&nbsp;&nbsp;<a href='TTWorkPlanViewMain.aspx?ProjectID=<%#DataBinder .Eval (Container .DataItem ,"ProjectID") %>'
                                                                target="DetailArea"><asp:Label ID="Label41" runat="server" Text="<%$ Resources:lang,XiangMuJiHua%>"></asp:Label></a>&nbsp;&nbsp;<a href='TTProjectSummaryAnalystChart.aspx?ProjectID=<%#DataBinder .Eval (Container .DataItem ,"ProjectID") %>'
                                                                    target="DetailArea"><asp:Label ID="Label42" runat="server" Text="<%$ Resources:lang,XiangMuShiTu%>"></asp:Label></a>
                                                        &nbsp;&nbsp;<a href='TTProRelatedUserSummary.aspx?ProjectID=<%#DataBinder .Eval (Container .DataItem ,"ProjectID") %>'
                                                            target="DetailArea"><asp:Label ID="Label246" runat="server" Text="<%$ Resources:lang,XiangMuChengYuan%>"></asp:Label></a>
                                                        &nbsp;&nbsp;<a href='TTProjectBudgetReport.aspx?ProjectID=<%#DataBinder .Eval (Container .DataItem ,"ProjectID") %>'
                                                            target="DetailArea"><asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,XiangMuYuSuan%>"></asp:Label></a>
                                                    </td>
                                                </tr>
                                            </table>
                                        </ItemTemplate>
                                        <ItemStyle />
                                    </asp:DataList>
                                    <asp:DataList ID="DataList5" runat="server" Width="850px" CellPadding="0" CellSpacing="0">
                                        <ItemTemplate>
                                            <table class="bian" style="width: 850px;" cellpadding="4" cellspacing="0">
                                                <tr>
                                                    <td style="width: 130px; text-align: right;">
                                                        <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,BianHao%>"></asp:Label>：
                                                    </td>
                                                    <td style="width: 100px; text-align: left;">
                                                        <%#DataBinder .Eval (Container .DataItem ,"ReqID") %>
                                                    </td>
                                                    <td style="width: 128px; text-align: right;">
                                                        <asp:Label ID="Label43" runat="server" Text="<%$ Resources:lang,LeiXing%>"></asp:Label>：
                                                    </td>
                                                    <td style="text-align: center">
                                                        <%#DataBinder .Eval (Container .DataItem ,"ReqType") %>
                                                    </td>
                                                    <td style="text-align: right; width: 209px;">
                                                        <asp:Label ID="Label44" runat="server" Text="<%$ Resources:lang,ShenQingRen%>"></asp:Label>：
                                                    </td>
                                                    <td style="text-align: left">
                                                        <a href='TTUserInforSimple.aspx?UserCode=<%#DataBinder .Eval (Container .DataItem ,"ApplicantCode") %>'
                                                            target="DetailArea">
                                                            <%#DataBinder .Eval (Container .DataItem ,"ApplicantName") %>
                                                        </a>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="width: 130px; text-align: right; height: 21px;">
                                                        <asp:Label ID="Label45" runat="server" Text="<%$ Resources:lang,MingCheng%>"></asp:Label>：
                                                    </td>
                                                    <td colspan="5" style="height: 21px; text-align: left;">
                                                        <%#DataBinder .Eval (Container .DataItem ,"ReqName") %>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="width: 130px; text-align: right;">
                                                        <asp:Label ID="Label46" runat="server" Text="<%$ Resources:lang,MiaoShu%>"></asp:Label>：
                                                    </td>
                                                    <td colspan="5" style="text-align: left">
                                                        <%#DataBinder .Eval (Container .DataItem ,"ReqDetail") %>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="width: 130px; text-align: right;">
                                                        <asp:Label ID="Label47" runat="server" Text="<%$ Resources:lang,YanShouBiaoZhun%>"></asp:Label>：
                                                    </td>
                                                    <td colspan="5" style="text-align: left">
                                                        <%#DataBinder .Eval (Container .DataItem ,"AcceptStandard") %>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="width: 130px; height: 20px; text-align: right;">
                                                        <asp:Label ID="Label48" runat="server" Text="<%$ Resources:lang,YaoQiuWanChengRiQi%>"></asp:Label>:
                                                    </td>
                                                    <td colspan="2" style="height: 20px; text-align: left;">
                                                        <%--<%#DataBinder .Eval (Container .DataItem ,"ReqFinishedDate","{0:yyyy/MM/dd}") %>--%>
                                                        <%# Convert.ToDateTime(DataBinder.Eval(Container.DataItem, "ReqFinishedDate")).ToString("yyyy/MM/dd")%>
                                                    </td>
                                                    <td style="width: 83px; height: 20px; text-align: right;">
                                                        <asp:Label ID="Label49" runat="server" Text="<%$ Resources:lang,JianLiRiQi%>"></asp:Label>：<td colspan="2" style="height: 20px; text-align: left; width: 212px;">
                                                            <%--<%#DataBinder .Eval (Container .DataItem ,"MakeDate","{0:yyyy/MM/dd}") %>--%>
                                                            <%# Convert.ToDateTime(DataBinder.Eval(Container.DataItem, "MakeDate")).ToString("yyyy/MM/dd")%>
                                                        </td>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="width: 130px; text-align: right;"></td>
                                                    <td colspan="4" style="text-align: left">

                                                        <span style="color: #0000ff;"><a href='TTNoTitleDocumentTreeView.aspx?RelatedType=Req&RelatedID=<%#DataBinder .Eval (Container .DataItem ,"ReqID")%>'
                                                            target="DetailArea">
                                                            <asp:Label ID="Label51" runat="server" Text="<%$ Resources:lang,XiangGuanWenJian%>"></asp:Label></a> &nbsp;<a href='TTReqAssignRecord.aspx?ReqID=<%#DataBinder .Eval (Container .DataItem ,"ReqID")%>'
                                                                target="DetailArea"><asp:Label ID="Label52" runat="server" Text="<%$ Resources:lang,PingShenJiLu%>"></asp:Label></a> </span>
                                                    </td>
                                                </tr>
                                            </table>
                                        </ItemTemplate>
                                    </asp:DataList>

                                    <asp:DataList ID="DataList7" runat="server" Height="1px" Width="700px" CellPadding="0"
                                        CellSpacing="0">
                                        <ItemTemplate>
                                            <table class="bian" cellpadding="4" cellspacing="0" style="border-collapse: collapse; width: 700px">
                                                <tr>
                                                    <td style="width: 105px; text-align: right;">
                                                        <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,XuHao%>"></asp:Label>:
                                                    </td>
                                                    <td style="width: 100px">
                                                        <%# DataBinder.Eval(Container.DataItem,"TaskID") %>
                                                    </td>
                                                    <td style="width: 149px; text-align: right;">
                                                        <asp:Label ID="Label59" runat="server" Text="<%$ Resources:lang,ChuanJianZhe%>"></asp:Label>：
                                                    </td>
                                                    <td style="width: 100px;">
                                                        <%# DataBinder.Eval(Container.DataItem,"MakeManName") %>
                                                    </td>
                                                    <td style="width: 100px; text-align: right;">
                                                        <asp:Label ID="Label60" runat="server" Text="<%$ Resources:lang,XiangGuanXiangMu%>"></asp:Label>：
                                                    </td>
                                                    <td style="width: 100px">
                                                        <a href='<%#"TTProjectDetailView.aspx?ProjectID="+DataBinder.Eval(Container.DataItem,"ProjectID")%>'
                                                            target="DetailArea">
                                                            <%# DataBinder.Eval(Container.DataItem,"ProjectID") %></a>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="width: 105px; text-align: right;">
                                                        <asp:Label ID="Label61" runat="server" Text="<%$ Resources:lang,RenWu%>"></asp:Label>:
                                                    </td>
                                                    <td colspan="5" style="text-align: left">
                                                        <%# DataBinder.Eval(Container.DataItem,"Task") %>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="width: 105px; text-align: right;">
                                                        <asp:Label ID="Label62" runat="server" Text="<%$ Resources:lang,KaiShiShiJian%>"></asp:Label>:
                                                    </td>
                                                    <td style="width: 100px">
                                                        <%--<%# DataBinder.Eval(Container.DataItem,"BeginDate","{0:yyyy/MM/dd}") %>--%>
                                                        <%# Convert.ToDateTime(DataBinder.Eval(Container.DataItem, "BeginDate")).ToString("yyyy/MM/dd")%>
                                                    </td>
                                                    <td style="width: 149px; text-align: right;">
                                                        <asp:Label ID="Label63" runat="server" Text="<%$ Resources:lang,JieShuShiJian%>"></asp:Label>:
                                                    </td>
                                                    <td style="width: 100px">
                                                        <%--<%# DataBinder.Eval(Container.DataItem,"EndDate","{0:yyyy/MM/dd}") %>--%>
                                                        <%# Convert.ToDateTime(DataBinder.Eval(Container.DataItem, "EndDate")).ToString("yyyy/MM/dd")%>
                                                    </td>
                                                    <td style="width: 100px; text-align: right;">
                                                        <asp:Label ID="Label64" runat="server" Text="<%$ Resources:lang,YuSuan%>"></asp:Label>:
                                                    </td>
                                                    <td style="width: 100px">
                                                        <%# DataBinder.Eval(Container.DataItem,"Budget") %>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="width: 105px; height: 18px; text-align: right;">
                                                        <asp:Label ID="Label65" runat="server" Text="<%$ Resources:lang,FeiYong%>"></asp:Label>:
                                                    </td>
                                                    <td style="width: 100px; height: 18px">
                                                        <%# DataBinder.Eval(Container.DataItem,"Expense") %>
                                                    </td>
                                                    <td style="width: 149px; height: 18px; text-align: right;">
                                                        <asp:Label ID="Label66" runat="server" Text="<%$ Resources:lang,YuSuanRenLi%>"></asp:Label>:
                                                    </td>
                                                    <td style="width: 100px; height: 18px">
                                                        <%# DataBinder.Eval(Container.DataItem,"ManHour") %>
                                                    </td>
                                                    <td style="width: 100px; height: 18px; text-align: right;">
                                                        <asp:Label ID="Label67" runat="server" Text="<%$ Resources:lang,ShiJiRenLi%>"></asp:Label>:
                                                    </td>
                                                    <td style="width: 100px; height: 18px">
                                                        <%# DataBinder.Eval(Container.DataItem,"RealManHour") %>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="width: 105px; text-align: right;">
                                                        <asp:Label ID="Label68" runat="server" Text="<%$ Resources:lang,YouXianJi%>"></asp:Label>:
                                                    </td>
                                                    <td style="width: 100px">
                                                        <%# DataBinder.Eval(Container.DataItem,"Priority") %>
                                                    </td>
                                                    <td style="width: 149px; text-align: right;">
                                                        <asp:Label ID="Label69" runat="server" Text="<%$ Resources:lang,WanChengChengDu%>"></asp:Label>:
                                                    </td>
                                                    <td style="width: 100px">
                                                        <%# DataBinder.Eval(Container.DataItem,"FinishPercent") %>
                                            %
                                                    </td>
                                                    <td style="width: 100px; text-align: right;"></td>
                                                    <td style="width: 100px"></td>
                                                </tr>
                                            </table>
                                        </ItemTemplate>
                                        <ItemStyle />
                                    </asp:DataList>
                                    <asp:DataList ID="DataList8" runat="server" Height="1px" Width="700px" CellPadding="0"
                                        CellSpacing="0">
                                        <ItemTemplate>
                                            <table class="bian" style="border-collapse: collapse;" cellpadding="4"
                                                cellspacing="0">
                                                <tr>
                                                    <td style="text-align: right">
                                                        <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,DanHao%>"></asp:Label>：
                                                    </td>
                                                    <td style="text-align: left">
                                                        <%#DataBinder.Eval(Container.DataItem, "AAID")%>
                                                    </td>
                                                    <td style="width: 106px; text-align: right">
                                                        <asp:Label ID="Label71" runat="server" Text="<%$ Resources:lang,MingCheng%>"></asp:Label>：
                                                    </td>
                                                    <td colspan="3" style="text-align: left">
                                                        <%#DataBinder.Eval(Container.DataItem, "AAName")%>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="text-align: right">
                                                        <asp:Label ID="Label72" runat="server" Text="<%$ Resources:lang,LeiXing%>"></asp:Label>：
                                                    </td>
                                                    <td colspan="2" style="text-align: left">
                                                        <%#DataBinder.Eval(Container.DataItem, "Type")%>
                                                    </td>
                                                    <td style="width: 121px; text-align: right"></td>
                                                    <td style="width: 113px; text-align: left"></td>
                                                    <td style="width: 100px"></td>
                                                </tr>
                                                <tr>
                                                    <td style="text-align: right">
                                                        <asp:Label ID="Label73" runat="server" Text="<%$ Resources:lang,ShenQingShiJian%>"></asp:Label>：
                                                    </td>
                                                    <td colspan="2" style="text-align: left">
                                                        <%--<%#DataBinder.Eval(Container.DataItem, "ApplyTime", "{0:yyyy/MM/dd}")%>--%>
                                                        <%# Convert.ToDateTime(DataBinder.Eval(Container.DataItem, "ApplyTime")).ToString("yyyy/MM/dd")%>
                                                    </td>
                                                    <td style="width: 121px; text-align: right">
                                                        <asp:Label ID="Label74" runat="server" Text="<%$ Resources:lang,YaoQiuWanChengShiJian%>"></asp:Label>：
                                                    </td>
                                                    <td style="text-align: left" colspan="2">
                                                        <%#DataBinder.Eval(Container.DataItem, "FinishTime")%>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="text-align: right">
                                                        <asp:Label ID="Label75" runat="server" Text="<%$ Resources:lang,LingYongLiYou%>"></asp:Label>：
                                                    </td>
                                                    <td colspan="5" style="height: 18px; text-align: left">
                                                        <%#DataBinder.Eval(Container.DataItem, "ApplyReason")%>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="text-align: right">
                                                        <asp:Label ID="Label76" runat="server" Text="<%$ Resources:lang,LingYongRen%>"></asp:Label>：
                                                    </td>
                                                    <td colspan="2" style="height: 18px; text-align: left">
                                                        <a href='TTUserInforSimple.aspx?UserCode=<%#DataBinder .Eval (Container .DataItem ,"ApplicantCode") %>'
                                                            target="DetailArea">
                                                            <%#DataBinder.Eval(Container.DataItem, "ApplicantName")%></a>
                                                    </td>
                                                    <td style="width: 121px; height: 18px; text-align: right"></td>
                                                    <td colspan="2" style="height: 18px; text-align: left"></td>
                                                </tr>

                                                <tr>
                                                    <td style="text-align: right"></td>
                                                    <td style="text-align: left;" colspan="5">
                                                        <a id="aDetailView" href='TTAssetApplicationDetailView.aspx?AAID=<%#DataBinder.Eval(Container.DataItem, "DetailAAID")%>&NoPop=YES'
                                                            target="DetailArea">
                                                            <asp:Label ID="Label78" runat="server" Text="<%$ Resources:lang,ZhiChanLingYongMingXi%>"></asp:Label></a>
                                                        &nbsp;&nbsp;&nbsp;&nbsp;
                                                        <asp:HyperLink ID="HL_WLBusinessUpdate" runat="server" NavigateUrl='<%#"TTAssetApplicationWF.aspx?BusinessID=" + DataBinder.Eval(Container.DataItem, "AAID") + "&WLID=" + strWLID + "&WLStepDetailID=" + strID  %>'
                                                            Text="&lt;div&gt;&lt;img src=ImagesSkin/Update.png border=0 alt='修改' /&gt;&lt;/div&gt;" />
                                                    </td>
                                                </tr>
                                            </table>
                                        </ItemTemplate>
                                    </asp:DataList>
                                    <asp:DataList ID="DataList9" runat="server" Height="1px" CellPadding="0" ForeColor="#333333"
                                        Width="980">
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
                                                                <td width="7%" align="center">
                                                                    <strong>
                                                                        <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,DaiMa%>"></asp:Label></strong>
                                                                </td>
                                                                <td width="15%" align="center">
                                                                    <strong>
                                                                        <asp:Label ID="Label79" runat="server" Text="<%$ Resources:lang,MingCheng%>"></asp:Label></strong>
                                                                </td>
                                                                <td width="7%" align="center">
                                                                    <strong>
                                                                        <asp:Label ID="Label80" runat="server" Text="<%$ Resources:lang,LeiXing%>"></asp:Label></strong>
                                                                </td>
                                                                <td width="7%" align="center">
                                                                    <strong>
                                                                        <asp:Label ID="Label81" runat="server" Text="<%$ Resources:lang,ZeRenRen%>"></asp:Label></strong>
                                                                </td>
                                                                <td width="7%" align="center">
                                                                    <strong>
                                                                        <asp:Label ID="Label82" runat="server" Text="<%$ Resources:lang,HeTongE%>"></asp:Label></strong>
                                                                </td>

                                                                <td width="10%" align="center">
                                                                    <strong>
                                                                        <asp:Label ID="Label84" runat="server" Text="<%$ Resources:lang,JiaFangDanWei%>"></asp:Label></strong>
                                                                </td>
                                                                <td width="10%" align="center">
                                                                    <strong>
                                                                        <asp:Label ID="Label85" runat="server" Text="<%$ Resources:lang,YiFangDaiWei%>"></asp:Label></strong>
                                                                </td>
                                                                <td width="8%" align="center">
                                                                    <strong>
                                                                        <asp:Label ID="Label86" runat="server" Text="<%$ Resources:lang,KaiShiRiQi%>"></asp:Label></strong>
                                                                </td>
                                                                <td width="8%" align="center">
                                                                    <strong>
                                                                        <asp:Label ID="Label87" runat="server" Text="<%$ Resources:lang,JieZhiRiQi%>"></asp:Label></strong>
                                                                </td>
                                                                <td width="8%" align="center">
                                                                    <strong>
                                                                        <asp:Label ID="Label88" runat="server" Text="<%$ Resources:lang,QianDingRiQi%>"></asp:Label></strong>
                                                                </td>
                                                                <td width="7%" align="center">
                                                                    <strong>
                                                                        <asp:Label ID="Label89" runat="server" Text="<%$ Resources:lang,JiLuRen%>"></asp:Label></strong>
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
                                                    <td style="width: 7%; text-align: center;"
                                                        class="tdLeft">
                                                        <%#DataBinder .Eval (Container .DataItem ,"ConstractCode") %>
                                                    </td>
                                                    <td style="width: 20%; text-align: left; padding-left: 5px"
                                                        class="tdLeft">
                                                        <%#DataBinder .Eval (Container .DataItem,"ConstractName") %>
                                                    </td>
                                                    <td style="width: 7%; text-align: center"
                                                        class="tdLeft">
                                                        <%#DataBinder .Eval (Container .DataItem,"Type") %>
                                                    </td>
                                                    <td style="width: 7%; text-align: center"
                                                        class="tdLeft">
                                                        <%#DataBinder .Eval (Container .DataItem,"Amount") %>
                                                    </td>

                                                    <td style="width: 11%; text-align: center"
                                                        class="tdLeft">
                                                        <%#DataBinder .Eval (Container .DataItem,"PartA") %>
                                                    </td>
                                                    <td style="width: 11%; text-align: center"
                                                        class="tdLeft">
                                                        <%#DataBinder .Eval (Container .DataItem,"PartB") %>
                                                    </td>
                                                    <td style="width: 8%; text-align: center"
                                                        class="tdLeft">
                                                        <%--<%#DataBinder .Eval (Container .DataItem, "StartDate","{0:yyyy/MM/dd}") %>--%>
                                                        <%# Convert.ToDateTime(DataBinder.Eval(Container.DataItem, "StartDate")).ToString("yyyy/MM/dd")%>
                                                    </td>
                                                    <td style="width: 8%; text-align: center"
                                                        class="tdLeft">
                                                        <%--<%#DataBinder.Eval(Container.DataItem, "EndDate", "{0:yyyy/MM/dd}")%>--%>
                                                        <%# Convert.ToDateTime(DataBinder.Eval(Container.DataItem, "EndDate")).ToString("yyyy/MM/dd")%>
                                                    </td>
                                                    <td style="width: 8%; text-align: center"
                                                        class="tdLeft">
                                                        <%--<%#DataBinder.Eval(Container.DataItem, "SignDate", "{0:yyyy/MM/dd}")%>--%>
                                                        <%# Convert.ToDateTime(DataBinder.Eval(Container.DataItem, "SignDate")).ToString("yyyy/MM/dd")%>
                                                    </td>
                                                    <td style="width: 7%; text-align: center"
                                                        class="tdRight">
                                                        <%#DataBinder .Eval (Container .DataItem, "RecorderName") %>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="width: 7%; text-align: center; font-size: 10pt"
                                                        class="tdLeft">
                                                        <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,ZhuYaoNeiRong%>"></asp:Label>
                                                    </td>
                                                    <td colspan="9" style="text-align: left; padding-left: 5px"
                                                        class="tdRight">
                                                        <%#DataBinder .Eval (Container .DataItem,"MainContent") %>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="width: 7%; text-align: center; font-size: 10pt"
                                                        class="tdLeft">
                                                        <asp:Label ID="Label90" runat="server" Text="<%$ Resources:lang,YiChangMiaoShu%>"></asp:Label>
                                                    </td>
                                                    <td colspan="9" style="text-align: left; padding-left: 5px"
                                                        class="tdRight">
                                                        <%#DataBinder .Eval (Container .DataItem,"Exception") %>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td colspan="10" style="text-align: left" class="tdRight">
                                                        <a href='TTConstractRelatedDocView.aspx?RelatedID=<%#DataBinder .Eval (Container .DataItem ,"ConstractID") %>'
                                                            target="DetailArea">
                                                            <asp:Label ID="Label91" runat="server" Text="<%$ Resources:lang,XiangGuanWenDang%>"></asp:Label></a>
                                                    </td>
                                                </tr>
                                            </table>
                                        </ItemTemplate>
                                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />

                                        <ItemStyle CssClass="itemStyle" />
                                    </asp:DataList>
                                    <asp:DataList ID="DataList10" runat="server" Width="850px" CellPadding="0" CellSpacing="0">
                                        <ItemTemplate>
                                            <table class="bian" style="width: 850px;" cellpadding="4" cellspacing="0">
                                                <tr>
                                                    <td style="width: 130px; text-align: right;">
                                                        <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,BianHao%>"></asp:Label>：
                                                    </td>
                                                    <td style="width: 100px; text-align: left;">
                                                        <%#DataBinder .Eval (Container .DataItem ,"ID") %>
                                                    </td>
                                                    <td style="width: 128px; text-align: right;"></td>
                                                    <td style="text-align: center"></td>
                                                    <td style="text-align: right; width: 209px;"></td>
                                                    <td style="text-align: left"></td>
                                                </tr>
                                                <tr>
                                                    <td style="width: 130px; text-align: right; height: 21px;">
                                                        <asp:Label ID="Label92" runat="server" Text="<%$ Resources:lang,MingCheng%>"></asp:Label>：
                                                    </td>
                                                    <td colspan="5" style="height: 21px; text-align: left;">
                                                        <%#DataBinder .Eval (Container .DataItem ,"Risk") %>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="width: 130px; text-align: right;">
                                                        <asp:Label ID="Label93" runat="server" Text="<%$ Resources:lang,MiaoShu%>"></asp:Label>：
                                                    </td>
                                                    <td colspan="5" style="text-align: left">
                                                        <%#DataBinder .Eval (Container .DataItem ,"Detail") %>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="width: 130px; text-align: right;"></td>
                                                    <td colspan="5" style="text-align: left"></td>
                                                </tr>
                                                <tr>
                                                    <td style="width: 130px; height: 20px; text-align: right;">
                                                        <asp:Label ID="Label94" runat="server" Text="<%$ Resources:lang,ShengXiaoRiQi%>"></asp:Label>:
                                                    </td>
                                                    <td colspan="2" style="height: 20px; text-align: left;">
                                                        <%#DataBinder.Eval(Container.DataItem, "EffectDate", "{0:yyyy/MM/dd}")%>
                                                    </td>
                                                    <td style="width: 83px; height: 20px; text-align: right;">
                                                        <asp:Label ID="Label95" runat="server" Text="<%$ Resources:lang,FaXianRiQi%>"></asp:Label>：<td colspan="2" style="height: 20px; text-align: left; width: 212px;">
                                                            <%--<%#DataBinder .Eval (Container .DataItem ,"FindDate","{0:yyyy/MM/dd}") %>--%>
                                                            <%# Convert.ToDateTime(DataBinder.Eval(Container.DataItem, "FindDate")).ToString("yyyy/MM/dd")%>
                                                        </td>
                                                    </td>
                                                </tr>

                                                <tr>
                                                    <td style="width: 130px; text-align: right;">&nbsp;
                                                    </td>
                                                    <td colspan="3" style="text-align: left">
                                                        <a href='TTNoTitleDocumentTreeView.aspx?RelatedType=Risk&RelatedID=<%#DataBinder .Eval (Container .DataItem ,"ID")%>'
                                                            target="DetailArea">
                                                            <asp:Label ID="Label97" runat="server" Text="<%$ Resources:lang,XiangGuanWenJian%>"></asp:Label></a>
                                                    </td>
                                                    <td colspan="2" style="text-align: center">&nbsp;
                                                    </td>
                                                </tr>
                                            </table>
                                        </ItemTemplate>
                                    </asp:DataList>
                                    <asp:DataList ID="DataList11" runat="server" CellPadding="0" ForeColor="#333333"
                                        Height="1px" Width="98%">
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
                                                                        <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,BianHao%>"></asp:Label></strong>
                                                                </td>
                                                                <td width="10%" align="center">
                                                                    <strong>
                                                                        <asp:Label ID="Label98" runat="server" Text="<%$ Resources:lang,FuWuLeiBie%>"></asp:Label></strong>
                                                                </td>
                                                                <td width="10%" align="center">
                                                                    <strong>
                                                                        <asp:Label ID="Label99" runat="server" Text="<%$ Resources:lang,LianXiRen%>"></asp:Label></strong>
                                                                </td>
                                                                <td width="10%" align="center">
                                                                    <strong>
                                                                        <asp:Label ID="Label100" runat="server" Text="<%$ Resources:lang,YaoQiuDaFuShiJian%>"></asp:Label></strong>
                                                                </td>
                                                                <td width="15%" align="center">
                                                                    <strong>
                                                                        <asp:Label ID="Label101" runat="server" Text="<%$ Resources:lang,KeHuMingCheng%>"></asp:Label></strong>
                                                                </td>
                                                                <td width="10%" align="center">
                                                                    <strong>
                                                                        <asp:Label ID="Label102" runat="server" Text="<%$ Resources:lang,LianXiDianHua%>"></asp:Label></strong>
                                                                </td>
                                                                <td width="10%" align="center">
                                                                    <strong>EMail</strong>
                                                                </td>
                                                                <td width="5%" align="center">
                                                                    <strong>
                                                                        <asp:Label ID="Label103" runat="server" Text="<%$ Resources:lang,YouBian%>"></asp:Label></strong>
                                                                </td>
                                                                <td width="15%" align="center">
                                                                    <strong>
                                                                        <asp:Label ID="Label104" runat="server" Text="<%$ Resources:lang,TiJianShiJian%>"></asp:Label></strong>
                                                                </td>

                                                                <td width="5%" align="center">
                                                                    <strong>
                                                                        <asp:Label ID="Label106" runat="server" Text="<%$ Resources:lang,JiLuRen%>"></asp:Label></strong>
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
                                                    <td class="tdLeft" style="width: 5%; text-align: center;">
                                                        <%#DataBinder .Eval (Container .DataItem ,"ID") %>
                                                    </td>
                                                    <td class="tdLeft" style="width: 10%; padding-left: 5px; text-align: left;">
                                                        <%#DataBinder .Eval (Container .DataItem,"Type") %>
                                                    </td>
                                                    <td class="tdLeft" style="width: 10%; text-align: center;">
                                                        <%#DataBinder .Eval (Container .DataItem,"ContactPerson") %>
                                                    </td>
                                                    <td class="tdLeft" style="width: 10%; text-align: center;">
                                                        <%--<%#DataBinder.Eval(Container.DataItem, "AnswerTime", "{0:yyyy/MM/dd}")%>--%>
                                                        <%# Convert.ToDateTime(DataBinder.Eval(Container.DataItem, "AnswerTime")).ToString("yyyy/MM/dd")%>
                                                    </td>
                                                    <td class="tdLeft" style="width: 15%; text-align: center;">
                                                        <%#DataBinder .Eval (Container .DataItem,"Company") %>
                                                    </td>
                                                    <td class="tdLeft" style="width: 10%; text-align: center;">
                                                        <%#DataBinder .Eval (Container .DataItem,"PhoneNumber") %>
                                                    </td>
                                                    <td class="tdLeft" style="width: 10%; text-align: center;">
                                                        <%#DataBinder .Eval (Container .DataItem,"EMail") %>
                                                    </td>
                                                    <td class="tdLeft" style="width: 5%; text-align: center;">
                                                        <%#DataBinder .Eval (Container .DataItem,"PostCode") %>
                                                    </td>
                                                    <td class="tdLeft" style="width: 15%; text-align: center;">
                                                        <%--<%#DataBinder.Eval(Container.DataItem, "SummitTime", "{0:yyyy/MM/dd hh:MM:ss}")%>--%>
                                                        <%# Convert.ToDateTime(DataBinder.Eval(Container.DataItem, "SummitTime")).ToString("yyyy/MM/dd HH:mm:ss")%>
                                                    </td>

                                                    <td class="tdRight" style="width: 5%; text-align: center;">
                                                        <%#DataBinder .Eval (Container .DataItem, "RecorderCode") %>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="tdLeft" style="width: 5%; text-align: center; font-size: 10pt;">
                                                        <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,WenTi%>"></asp:Label>
                                                    </td>
                                                    <td class="tdRight" colspan="9" style="width: 95%; text-align: left; padding-left: 5px">
                                                        <span style="font-size: 9pt"></span>
                                                        <%#DataBinder .Eval (Container .DataItem,"Question") %>
                                                    </td>
                                                </tr>

                                                <tr>
                                                    <td class="tdLeft" style="width: 5%; text-align: center; font-size: 10pt;"></td>
                                                    <td class="tdRight" colspan="9" style="width: 95%; text-align: left; padding-left: 5px">
                                                        <a href='TTCustomerQuestionHandleRecord.aspx?QuestionID=<%#DataBinder .Eval (Container .DataItem ,"ID")%>'
                                                            target="DetailArea">
                                                            <asp:Label ID="Label107" runat="server" Text="<%$ Resources:lang,KeFuJiLu%>"></asp:Label></a>
                                                    </td>
                                                </tr>
                                            </table>
                                        </ItemTemplate>
                                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />

                                        <ItemStyle CssClass="itemStyle" />
                                    </asp:DataList>
                                    <asp:DataList ID="DataList12" runat="server" Height="1px" Width="700px" CellPadding="0"
                                        CellSpacing="0">
                                        <ItemTemplate>
                                            <table class="bian" style="border-collapse: collapse;" cellpadding="4"
                                                cellspacing="0">
                                                <tr>
                                                    <td style="text-align: right">
                                                        <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,DanHao%>"></asp:Label>：
                                                    </td>
                                                    <td style="text-align: left">
                                                        <%#DataBinder.Eval(Container.DataItem, "ID")%>
                                                    </td>
                                                    <td style="width: 106px; text-align: right">
                                                        <asp:Label ID="Label108" runat="server" Text="<%$ Resources:lang,ShenQinCheXing%>"></asp:Label>：
                                                    </td>
                                                    <td colspan="3" style="text-align: left">
                                                        <%#DataBinder.Eval(Container.DataItem, "CarType")%>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="text-align: right">
                                                        <asp:Label ID="Label109" runat="server" Text="<%$ Resources:lang,ShenQingBuMen%>"></asp:Label>：
                                                    </td>
                                                    <td colspan="2" style="text-align: left">
                                                        <%#DataBinder.Eval(Container.DataItem, "DepartName")%>
                                                    </td>
                                                    <td style="width: 121px; text-align: right">
                                                        <asp:Label ID="Label235" runat="server" Text="<%$ Resources:lang,ShenQingRen%>"></asp:Label>
                                                    </td>
                                                    <td style="width: 113px; text-align: left">
                                                        <a href='TTUserInforSimple.aspx?UserCode=<%#DataBinder .Eval (Container .DataItem ,"ApplicantCode") %>'
                                                            target="DetailArea">
                                                            <%#DataBinder.Eval(Container.DataItem, "ApplicantName")%></a>
                                                    </td>
                                                    <td style="width: 100px"></td>
                                                </tr>
                                                <tr>
                                                    <td style="text-align: right">
                                                        <asp:Label ID="Label110" runat="server" Text="<%$ Resources:lang,YongCheShiJian%>"></asp:Label>：
                                                    </td>
                                                    <td colspan="2" style="text-align: left">
                                                        <%--<%#DataBinder.Eval(Container.DataItem, "DepartTime", "{0:yyyy/MM/dd HH:MM}")%>--%>
                                                        <%# Convert.ToDateTime(DataBinder.Eval(Container.DataItem, "DepartTime")).ToString("yyyy/MM/dd HH:mm")%>
                                                    </td>
                                                    <td style="width: 121px; text-align: right">
                                                        <asp:Label ID="Label111" runat="server" Text="<%$ Resources:lang,HuanCheShiJian%>"></asp:Label>：
                                                    </td>
                                                    <td style="text-align: left" colspan="2">
                                                        <%--<%#DataBinder.Eval(Container.DataItem, "BackTime", "{0:yyyy/MM/dd HH:MM}")%>--%>
                                                        <%# Convert.ToDateTime(DataBinder.Eval(Container.DataItem, "BackTime")).ToString("yyyy/MM/dd HH:mm")%>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="text-align: right">
                                                        <asp:Label ID="Label112" runat="server" Text="<%$ Resources:lang,ShangCheDiDian%>"></asp:Label>：
                                                    </td>
                                                    <td style="text-align: left">
                                                        <%#DataBinder.Eval(Container.DataItem, "BoardingSite")%>
                                                    </td>
                                                    <td style="width: 106px; text-align: right">
                                                        <asp:Label ID="Label113" runat="server" Text="<%$ Resources:lang,MuDiDi%>"></asp:Label>：
                                                    </td>
                                                    <td colspan="3" style="text-align: left">
                                                        <%#DataBinder.Eval(Container.DataItem, "Destination")%>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="text-align: right">
                                                        <asp:Label ID="Label114" runat="server" Text="<%$ Resources:lang,SuiCheRen%>"></asp:Label>：
                                                    </td>
                                                    <td colspan="5" style="height: 18px; text-align: left">
                                                        <%#DataBinder.Eval(Container.DataItem, "Attendant")%>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="text-align: right">
                                                        <asp:Label ID="Label115" runat="server" Text="<%$ Resources:lang,ShenQingYuanYin%>"></asp:Label>：
                                                    </td>
                                                    <td colspan="5" style="height: 18px; text-align: left">
                                                        <%#DataBinder.Eval(Container.DataItem, "ApplyReason")%>
                                                    </td>
                                                </tr>
                                            </table>
                                        </ItemTemplate>
                                    </asp:DataList>
                                    <asp:DataList ID="DataList21" runat="server" Height="1px" Width="900px" CellPadding="0"
                                        CellSpacing="0">
                                        <ItemTemplate>
                                            <table class="bian" style="border-collapse: collapse;" cellpadding="4" width="100%"
                                                cellspacing="0">
                                                <tr>
                                                    <td style="text-align: right">
                                                        <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,XingMing%>"></asp:Label>：</td>
                                                    <td style="text-align: left">
                                                        <asp:Label ID="LB_ApplicantCode" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "Creator")%>'></asp:Label>
                                                        <%#DataBinder.Eval(Container.DataItem, "UserName")%>
                                                    </td>
                                                    <td style="text-align: right">
                                                        <asp:Label ID="Label117" runat="server" Text="<%$ Resources:lang,SuoShuBuMen%>"></asp:Label>：</td>
                                                    <td style="text-align: left"><%#DataBinder.Eval(Container.DataItem, "DepartName")%></td>
                                                    <td style="text-align: right">
                                                        <asp:Label ID="Label118" runat="server" Text="<%$ Resources:lang,ZhiWei%>"></asp:Label>：</td>
                                                    <td style="text-align: left"><%#DataBinder.Eval(Container.DataItem, "Duty")%></td>
                                                    <td style="text-align: right">
                                                        <asp:Label ID="Label119" runat="server" Text="<%$ Resources:lang,TianXieRiQi%>"></asp:Label>：</td>
                                                    <td style="text-align: left">
                                                        <%# Convert.ToDateTime(DataBinder.Eval(Container.DataItem, "CreateTime")).ToString("yyyy/MM/dd HH:mm:ss")%>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="text-align: right">
                                                        <asp:Label ID="Label23" runat="server" Text="<%$ Resources:lang,QingJiaLeiXing%>"></asp:Label>
                                                        ：</td>
                                                    <td style="text-align: left" colspan="7">
                                                        <asp:Label ID="LB_LeaveType" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "LeaveType")%>'></asp:Label>
                                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                        <asp:Label ID="Label10" runat="server" Text="<%$ Resources:lang,BenNianDuChiLeiXingYiQingJiaZongTianShu%>"></asp:Label>：

                                                        当月：<asp:Label ID="LB_TotalLeaveDaysForCurrrentMonth" runat="server"></asp:Label>
                                                        当年：<asp:Label ID="LB_TotalLeaveDaysForCurrrentYear" runat="server"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="text-align: right">
                                                        <asp:Label ID="Label121" runat="server" Text="<%$ Resources:lang,QingJiaShiYou%>"></asp:Label>：</td>
                                                    <td style="text-align: left" colspan="7"><%#DataBinder.Eval(Container.DataItem, "ApplyBecause")%></td>
                                                </tr>
                                                <tr>
                                                    <td style="text-align: right">
                                                        <asp:Label ID="Label122" runat="server" Text="<%$ Resources:lang,QingJiaShiJian%>"></asp:Label>：</td>
                                                    <td style="text-align: left" colspan="7">
                                                        <asp:Label ID="Label123" runat="server" Text="<%$ Resources:lang,Cong%>"></asp:Label>

                                                        <asp:Label ID="LB_StartTime" runat="server" Text='<%# Convert.ToDateTime(DataBinder.Eval(Container.DataItem, "StartTime")).ToString("yyyy-MM-dd HH:mm")%>'></asp:Label>

                                                        <asp:Label ID="Label124" runat="server" Text="<%$ Resources:lang,Zhi%>"></asp:Label>
                                                        <%# Convert.ToDateTime(DataBinder.Eval(Container.DataItem, "EndTime")).ToString("yyyy-MM-dd HH:mm")%>
                                                        <asp:Label ID="Label125" runat="server" Text="<%$ Resources:lang,Zhi2%>"></asp:Label>
                                                        &nbsp;&nbsp;
                                                        <asp:Label ID="Label126" runat="server" Text="<%$ Resources:lang,Gong%>"></asp:Label>:<%#DataBinder.Eval(Container.DataItem, "HourNum")%><asp:Label ID="Label236" runat="server" Text="<%$ Resources:lang,XiaoShi%>"></asp:Label>&nbsp;&nbsp;
                                                    </td>
                                                </tr>

                                                <tr>
                                                    <td style="text-align: right"></td>
                                                    <td align="left">
                                                        <asp:HyperLink ID="HL_WLBusinessUpdate" runat="server" NavigateUrl='<%#"TTLeaveApplyFormWF.aspx?BusinessID=" + DataBinder.Eval(Container.DataItem, "ID") + "&WLID=" + strWLID + "&WLStepDetailID=" + strID  %>' Text="&lt;div&gt;&lt;img src=ImagesSkin/Update.png border=0 alt='修改' /&gt;&lt;/div&gt;" />

                                                    </td>
                                                </tr>
                                            </table>
                                        </ItemTemplate>
                                    </asp:DataList>
                                    <asp:DataList ID="DataList43" runat="server" Height="1px" Width="900px" CellPadding="0"
                                        CellSpacing="0">
                                        <ItemTemplate>
                                            <table class="bian" style="border-collapse: collapse;" cellpadding="4" width="100%"
                                                cellspacing="0">
                                                <tr>
                                                    <td style="text-align: right">
                                                        <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,XingMing%>"></asp:Label>：</td>
                                                    <td style="text-align: left">
                                                        <asp:Label ID="LB_ApplicantCode" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "Creator")%>'></asp:Label>
                                                        <%#DataBinder.Eval(Container.DataItem, "UserName")%>
                                                    </td>
                                                    <td style="text-align: right">
                                                        <asp:Label ID="Label117" runat="server" Text="<%$ Resources:lang,SuoShuBuMen%>"></asp:Label>：</td>
                                                    <td style="text-align: left"><%#DataBinder.Eval(Container.DataItem, "DepartName")%></td>
                                                    <td style="text-align: right">
                                                        <asp:Label ID="Label118" runat="server" Text="<%$ Resources:lang,ZhiWei%>"></asp:Label>：</td>
                                                    <td style="text-align: left"><%#DataBinder.Eval(Container.DataItem, "Duty")%></td>
                                                    <td style="text-align: right">
                                                        <asp:Label ID="Label119" runat="server" Text="<%$ Resources:lang,TianXieRiQi%>"></asp:Label>：</td>
                                                    <td style="text-align: left">
                                                        <%# Convert.ToDateTime(DataBinder.Eval(Container.DataItem, "CreateTime")).ToString("yyyy/MM/dd")%>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="text-align: right">
                                                        <asp:Label ID="Label23" runat="server" Text="加班类型"></asp:Label>
                                                        ：</td>
                                                    <td style="text-align: left" colspan="7">
                                                        <asp:Label ID="LB_OvertimeType" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "OvertimeType")%>'></asp:Label>
                                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                        <asp:Label ID="Label10" runat="server" Text="本年度此类型已加班总天数"></asp:Label>：

                                                        当月：<asp:Label ID="LB_TotalOvertimeDaysForCurrrentMonth" runat="server"></asp:Label>
                                                        当年：<asp:Label ID="LB_TotalOvertimeDaysForCurrrentYear" runat="server"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="text-align: right">
                                                        <asp:Label ID="Label121" runat="server" Text="加班事由"></asp:Label>：</td>
                                                    <td style="text-align: left" colspan="7"><%#DataBinder.Eval(Container.DataItem, "ApplyBecause")%></td>
                                                </tr>
                                                <tr>
                                                    <td style="text-align: right">
                                                        <asp:Label ID="Label122" runat="server" Text="加班时间"></asp:Label>：</td>
                                                    <td style="text-align: left" colspan="7">
                                                        <asp:Label ID="Label123" runat="server" Text="<%$ Resources:lang,Cong%>"></asp:Label>

                                                        <asp:Label ID="LB_StartTime" runat="server" Text='<%# Convert.ToDateTime(DataBinder.Eval(Container.DataItem, "StartTime")).ToString("yyyy-MM-dd HH:mm")%>'></asp:Label>

                                                        <asp:Label ID="Label124" runat="server" Text="<%$ Resources:lang,Zhi%>"></asp:Label>
                                                        <%# Convert.ToDateTime(DataBinder.Eval(Container.DataItem, "EndTime")).ToString("yyyy-MM-dd HH:mm")%>
                                                        <asp:Label ID="Label125" runat="server" Text="<%$ Resources:lang,Zhi2%>"></asp:Label>
                                                        &nbsp;&nbsp;
                                                        <asp:Label ID="Label126" runat="server" Text="<%$ Resources:lang,Gong%>"></asp:Label>:<%#DataBinder.Eval(Container.DataItem, "HourNum")%><asp:Label ID="Label236" runat="server" Text="<%$ Resources:lang,XiaoShi%>"></asp:Label>&nbsp;&nbsp;
                                                    </td>
                                                </tr>


                                            </table>
                                        </ItemTemplate>
                                    </asp:DataList>
                                    <asp:DataList ID="DataList13" runat="server" Height="1px" Width="100%" CellPadding="0"
                                        ForeColor="#333333">
                                        <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                        <ItemTemplate>
                                            <table cellpadding="4" cellspacing="0" style="width: 100%;" class="bian">
                                                <tr>
                                                    <td style="width: 10%; text-align: right;">
                                                        <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,DaiMa%>"></asp:Label>：
                                                    </td>
                                                    <td style="width: 20%" align="left">
                                                        <%# DataBinder.Eval(Container.DataItem,"CustomerCode") %>
                                                    </td>
                                                    <td style="width: 10%; text-align: right;">
                                                        <asp:Label ID="Label128" runat="server" Text="<%$ Resources:lang,MingCheng%>"></asp:Label>：
                                                    </td>
                                                    <td colspan="3" align="left">
                                                        <%# DataBinder.Eval(Container.DataItem,"CustomerName") %>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="width: 100px; text-align: right;">
                                                        <asp:Label ID="Label129" runat="server" Text="<%$ Resources:lang,YingWenMing%>"></asp:Label>：
                                                    </td>
                                                    <td colspan="5" style="text-align: left">
                                                        <%# DataBinder.Eval(Container.DataItem,"CustomerEnglishName") %>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="width: 100px; text-align: right;">
                                                        <asp:Label ID="Label130" runat="server" Text="<%$ Resources:lang,HangYeLeiXing%>"></asp:Label>：
                                                    </td>
                                                    <td style="width: 100px" align="left">
                                                        <%# DataBinder.Eval(Container.DataItem,"Type") %>
                                                    </td>
                                                    <td style="width: 100px; text-align: right;">
                                                        <asp:Label ID="Label131" runat="server" Text="<%$ Resources:lang,ZhuYaoLianXiRen%>"></asp:Label>：
                                                    </td>
                                                    <td align="left">
                                                        <%# DataBinder.Eval(Container.DataItem, "ContactName")%>
                                                    </td>
                                                    <td style="text-align: right;">
                                                        <asp:Label ID="Label132" runat="server" Text="<%$ Resources:lang,YeWuYuan%>"></asp:Label>：
                                                    </td>
                                                    <td style="width: 135px; text-align: left;">
                                                        <%# DataBinder.Eval(Container.DataItem,"SalesPerson") %>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="width: 100px; text-align: right;">
                                                        <asp:Label ID="Label133" runat="server" Text="<%$ Resources:lang,FaPiaoDiZhi%>"></asp:Label>：
                                                    </td>
                                                    <td colspan="3" style="text-align: left">
                                                        <%# DataBinder.Eval(Container.DataItem,"InvoiceAddress") %>
                                                    </td>
                                                    <td style="text-align: right">
                                                        <asp:Label ID="Label134" runat="server" Text="<%$ Resources:lang,BiBie%>"></asp:Label>：
                                                    </td>
                                                    <td align="left">
                                                        <%# DataBinder.Eval(Container.DataItem,"Currency") %>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="text-align: right">
                                                        <asp:Label ID="Label135" runat="server" Text="<%$ Resources:lang,YinHangZhangHao%>"></asp:Label>：
                                                    </td>
                                                    <td colspan="3" style="text-align: left">
                                                        <%# DataBinder.Eval(Container.DataItem,"BankAccount") %>
                                                    </td>
                                                    <td style="text-align: right">
                                                        <asp:Label ID="Label136" runat="server" Text="<%$ Resources:lang,ZheKouLv%>"></asp:Label>：
                                                    </td>
                                                    <td align="left">
                                                        <%# DataBinder.Eval(Container.DataItem,"Discount") %>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="width: 100px; text-align: right">
                                                        <asp:Label ID="Label137" runat="server" Text="<%$ Resources:lang,KaiHuYinHang%>"></asp:Label>：
                                                    </td>
                                                    <td colspan="3" style="text-align: left">
                                                        <%# DataBinder.Eval(Container.DataItem,"Bank") %>
                                                    </td>
                                                    <td style="text-align: right">
                                                        <asp:Label ID="Label138" runat="server" Text="<%$ Resources:lang,XingYongDengJi%>"></asp:Label>：
                                                    </td>
                                                    <td align="left">
                                                        <%# DataBinder.Eval(Container.DataItem,"CreditRate") %>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="width: 100px; height: 20px; text-align: right">
                                                        <asp:Label ID="Label139" runat="server" Text="<%$ Resources:lang,DianHuaYi%>"></asp:Label>：
                                                    </td>
                                                    <td style="height: 20px; text-align: left">
                                                        <%# DataBinder.Eval(Container.DataItem,"Tel1") %>
                                                    </td>
                                                    <td style="height: 20px; text-align: right">
                                                        <asp:Label ID="Label140" runat="server" Text="<%$ Resources:lang,DianHuaEr%>"></asp:Label>：
                                                    </td>
                                                    <td style="text-align: left" class="style3">
                                                        <%# DataBinder.Eval(Container.DataItem,"Tel2") %>
                                                    </td>
                                                    <td style="height: 20px; text-align: right">
                                                        <asp:Label ID="Label141" runat="server" Text="<%$ Resources:lang,ChuanZhen%>"></asp:Label>：
                                                    </td>
                                                    <td style="height: 20px; text-align: left">
                                                        <%# DataBinder.Eval(Container.DataItem,"Fax") %>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="width: 100px; text-align: right">E_Mail：
                                                    </td>
                                                    <td colspan="3" style="text-align: left">
                                                        <%# DataBinder.Eval(Container.DataItem,"EmailAddress") %>
                                                    </td>
                                                    <td></td>
                                                    <td></td>
                                                </tr>
                                                <tr>
                                                    <td style="width: 100px; height: 20px; text-align: right">
                                                        <asp:Label ID="Label142" runat="server" Text="<%$ Resources:lang,WangZhi%>"></asp:Label>：
                                                    </td>
                                                    <td style="height: 20px; text-align: left">
                                                        <%# DataBinder.Eval(Container.DataItem,"WebSite") %>
                                                    </td>
                                                    <td style="height: 20px; text-align: right">
                                                        <asp:Label ID="Label143" runat="server" Text="<%$ Resources:lang,YouZhengBianMa%>"></asp:Label>：
                                                    </td>
                                                    <td style="text-align: left" class="style3">
                                                        <%# DataBinder.Eval(Container.DataItem,"ZP") %>
                                                    </td>
                                                    <td style="height: 20px; text-align: right"></td>
                                                    <td style="height: 20px; text-align: left"></td>
                                                </tr>
                                                <tr>
                                                    <td style="width: 100px; height: 20px; text-align: right">
                                                        <asp:Label ID="Label144" runat="server" Text="<%$ Resources:lang,GuoJia%>"></asp:Label>：
                                                    </td>
                                                    <td style="height: 20px; text-align: left">
                                                        <%# DataBinder.Eval(Container.DataItem,"Country") %>
                                                    </td>
                                                    <td style="height: 20px; text-align: right">
                                                        <asp:Label ID="Label145" runat="server" Text="<%$ Resources:lang,ShengFen%>"></asp:Label>：
                                                    </td>
                                                    <td style="text-align: left" class="style3">
                                                        <%# DataBinder.Eval(Container.DataItem,"State") %>
                                                    </td>
                                                    <td style="height: 20px; text-align: right">
                                                        <asp:Label ID="Label146" runat="server" Text="<%$ Resources:lang,ChengShi%>"></asp:Label>：
                                                    </td>
                                                    <td style="height: 20px; text-align: left">
                                                        <%# DataBinder.Eval(Container.DataItem,"City") %>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="width: 100px; height: 20px; text-align: right">
                                                        <asp:Label ID="Label147" runat="server" Text="<%$ Resources:lang,XianggXiDiZhiZhong%>"></asp:Label>：
                                                    </td>
                                                    <td style="height: 20px; text-align: left"
                                                        colspan="5">
                                                        <%# DataBinder.Eval(Container.DataItem,"RegistrationAddressCN") %>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="width: 100px; height: 20px; text-align: right">
                                                        <asp:Label ID="Label148" runat="server" Text="<%$ Resources:lang,XiangXiDiZhiYing%>"></asp:Label>：
                                                    </td>
                                                    <td colspan="5" style="height: 20px; text-align: left">
                                                        <%# DataBinder.Eval(Container.DataItem,"RegistrationAddressEN") %>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="width: 100px; height: 20px; text-align: right">
                                                        <asp:Label ID="Label149" runat="server" Text="<%$ Resources:lang,BeiZhu%>"></asp:Label>：
                                                    </td>
                                                    <td colspan="3" style="height: 20px; text-align: left">
                                                        <%# DataBinder.Eval(Container.DataItem,"Comment") %>
                                                    </td>
                                                    <td style="height: 20px; text-align: right">
                                                        <asp:Label ID="Label150" runat="server" Text="<%$ Resources:lang,JianLiRiQi%>"></asp:Label>：
                                                    </td>
                                                    <td style="height: 20px; text-align: left">
                                                        <%# DataBinder.Eval(Container.DataItem,"CreateDate") %>
                                                    </td>
                                                </tr>
                                            </table>
                                        </ItemTemplate>
                                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                        <ItemStyle CssClass="itemStyle" />
                                    </asp:DataList>
                                    <asp:DataList ID="DataList14" runat="server" Height="1px" Width="700px" CellPadding="0"
                                        CellSpacing="0">
                                        <ItemTemplate>
                                            <table class="bian" style="border-collapse: collapse;" cellpadding="4"
                                                cellspacing="0">
                                                <tr>
                                                    <td style="text-align: right">
                                                        <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,BianHao%>"></asp:Label>：
                                                    </td>
                                                    <td style="text-align: left">
                                                        <%#DataBinder.Eval(Container.DataItem, "ID")%>
                                                    </td>
                                                    <td style="width: 106px; text-align: right">
                                                        <asp:Label ID="Label151" runat="server" Text="<%$ Resources:lang,HuiYiMingCheng%>"></asp:Label>：
                                                    </td>
                                                    <td colspan="3" style="text-align: left">
                                                        <%#DataBinder.Eval(Container.DataItem, "Name")%>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="text-align: right">
                                                        <asp:Label ID="Label152" runat="server" Text="<%$ Resources:lang,HuiYiLeiXing%>"></asp:Label>：
                                                    </td>
                                                    <td colspan="2" style="text-align: left">
                                                        <%#DataBinder.Eval(Container.DataItem, "Type")%>
                                                    </td>
                                                    <td style="width: 121px; text-align: right">
                                                        <asp:Label ID="Label153" runat="server" Text="<%$ Resources:lang,HuiYiDiDian%>"></asp:Label>：
                                                    </td>
                                                    <td style="width: 113px; text-align: left">
                                                        <%#DataBinder.Eval(Container.DataItem, "Address")%>
                                                    </td>
                                                    <td style="width: 100px"></td>
                                                </tr>
                                                <tr>
                                                    <td style="text-align: right">
                                                        <asp:Label ID="Label154" runat="server" Text="<%$ Resources:lang,ZhuChiRen%>"></asp:Label>：
                                                    </td>
                                                    <td colspan="2" style="text-align: left">
                                                        <%#DataBinder.Eval(Container.DataItem, "Host")%>
                                                    </td>
                                                    <td style="width: 121px; text-align: right">
                                                        <asp:Label ID="Label155" runat="server" Text="<%$ Resources:lang,ZhaoJiRen%>"></asp:Label>：
                                                    </td>
                                                    <td style="text-align: left" colspan="2">
                                                        <%#DataBinder.Eval(Container.DataItem, "Organizer")%>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="text-align: right">
                                                        <asp:Label ID="Label156" runat="server" Text="<%$ Resources:lang,JiLuRen%>"></asp:Label>：
                                                    </td>
                                                    <td style="text-align: left">
                                                        <%#DataBinder.Eval(Container.DataItem, "Recorder")%>
                                                    </td>
                                                    <td style="width: 106px; text-align: right">
                                                        <asp:Label ID="Label157" runat="server" Text="<%$ Resources:lang,KaiShiShiJian%>"></asp:Label>：
                                                    </td>
                                                    <td colspan="3" style="text-align: left">
                                                        <%--<%#DataBinder.Eval(Container.DataItem, "BeginTime", "{0:yyyy/MM/dd hh:mm:ss}")%>--%>
                                                        <%# Convert.ToDateTime(DataBinder.Eval(Container.DataItem, "BeginTime")).ToString("yyyy/MM/dd HH:mm:ss")%>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="text-align: right">
                                                        <asp:Label ID="Label158" runat="server" Text="<%$ Resources:lang,JieShuShiJian%>"></asp:Label>：
                                                    </td>
                                                    <td colspan="5" style="height: 18px; text-align: left">
                                                        <%--<%#DataBinder.Eval(Container.DataItem, "EndTime", "{0:yyyy/MM/dd hh:mm:ss}")%>--%>
                                                        <%# Convert.ToDateTime(DataBinder.Eval(Container.DataItem, "EndTime")).ToString("yyyy/MM/dd HH:mm:ss")%>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="text-align: right">
                                                        <asp:Label ID="Label159" runat="server" Text="<%$ Resources:lang,ChuanJianRen%>"></asp:Label>：
                                                    </td>
                                                    <td colspan="5" style="height: 18px; text-align: left">
                                                        <%#DataBinder.Eval(Container.DataItem, "BuilderCode")%>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="text-align: right">
                                                        <asp:Label ID="Label160" runat="server" Text="<%$ Resources:lang,HuiYiNeiRong%>"></asp:Label>：
                                                    </td>
                                                    <td colspan="5" style="height: 18px; text-align: left">
                                                        <%#DataBinder.Eval(Container.DataItem, "Content")%>
                                                    </td>
                                                </tr>
                                            </table>
                                        </ItemTemplate>
                                    </asp:DataList>
                                    <asp:DataList ID="DataList15" runat="server" Height="1px" Width="700px" CellPadding="0"
                                        CellSpacing="0">
                                        <ItemTemplate>
                                            <table class="bian" style="border-collapse: collapse;" cellpadding="4"
                                                cellspacing="0">
                                                <tr>
                                                    <td style="text-align: right">
                                                        <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,YaoQingHanBianHao%>"></asp:Label>：
                                                    </td>
                                                    <td style="text-align: left">
                                                        <%#DataBinder.Eval(Container.DataItem, "ID")%>
                                                    </td>
                                                    <td style="width: 106px; text-align: right">
                                                        <asp:Label ID="Label161" runat="server" Text="<%$ Resources:lang,YaoQingHan%>"></asp:Label>：
                                                    </td>
                                                    <td colspan="3" style="text-align: left">
                                                        <%#DataBinder.Eval(Container.DataItem, "Name")%>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="text-align: right">
                                                        <asp:Label ID="Label162" runat="server" Text="<%$ Resources:lang,BianZhiBuMen%>"></asp:Label>：
                                                    </td>
                                                    <td colspan="2" style="text-align: left">
                                                        <%#DataBinder.Eval(Container.DataItem, "EnterUnit")%>
                                                    </td>
                                                    <td style="text-align: right">
                                                        <asp:Label ID="Label163" runat="server" Text="<%$ Resources:lang,BianZhiRen%>"></asp:Label>：
                                                    </td>
                                                    <td style="width: 113px; text-align: left">
                                                        <a href='TTUserInforSimple.aspx?UserCode=<%#DataBinder.Eval(Container.DataItem ,"EnterCode") %>'
                                                            target="DetailArea">
                                                            <%#DataBinder.Eval(Container.DataItem, "EnterPer")%></a>
                                                    </td>
                                                    <td style="width: 100px"></td>
                                                </tr>
                                                <tr>
                                                    <td style="text-align: right">
                                                        <asp:Label ID="Label164" runat="server" Text="<%$ Resources:lang,ZhaoBiaoFangShi%>"></asp:Label>：
                                                    </td>
                                                    <td colspan="2" style="text-align: left">
                                                        <%#DataBinder.Eval(Container.DataItem, "BidWay")%>
                                                    </td>
                                                    <td style="text-align: right">
                                                        <asp:Label ID="Label165" runat="server" Text="<%$ Resources:lang,BianZhiRiQi%>"></asp:Label>：
                                                    </td>
                                                    <td style="text-align: left" colspan="2">
                                                        <%# Convert.ToDateTime(DataBinder.Eval(Container.DataItem, "EnterDate")).ToString("yyyy-MM-dd")%>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="text-align: right">
                                                        <asp:Label ID="Label166" runat="server" Text="<%$ Resources:lang,YaoQingHanNeiRong%>"></asp:Label>：
                                                    </td>
                                                    <td colspan="5" style="text-align: left">
                                                        <%#DataBinder.Eval(Container.DataItem, "Remark")%>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="text-align: right"></td>
                                                    <td style="text-align: left;" colspan="5">
                                                        <a href='TTBMWinResultView.aspx?AnnID=<%#DataBinder.Eval(Container.DataItem, "ID")%>' target="DetailArea">
                                                            <asp:Label ID="Label167" runat="server" Text="专家意见"></asp:Label>
                                                        </a>
                                                    </td>
                                                </tr>
                                            </table>
                                        </ItemTemplate>
                                    </asp:DataList>
                                    <asp:DataList ID="DataList16" runat="server" Height="1px" Width="700px" CellPadding="0"
                                        CellSpacing="0">
                                        <ItemTemplate>
                                            <table class="bian" style="border-collapse: collapse;" cellpadding="4"
                                                cellspacing="0">
                                                <tr>
                                                    <td style="text-align: right">
                                                        <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,BianHao%>"></asp:Label>：
                                                    </td>
                                                    <td style="text-align: left">
                                                        <%#DataBinder.Eval(Container.DataItem, "ID")%>
                                                    </td>
                                                    <td style="width: 106px; text-align: right">
                                                        <asp:Label ID="Label168" runat="server" Text="<%$ Resources:lang,FangAn%>"></asp:Label>：
                                                    </td>
                                                    <td colspan="3" style="text-align: left">
                                                        <%#DataBinder.Eval(Container.DataItem, "Name")%>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="text-align: right">
                                                        <asp:Label ID="Label169" runat="server" Text="<%$ Resources:lang,BianZhiBuMen%>"></asp:Label>：
                                                    </td>
                                                    <td colspan="2" style="text-align: left">
                                                        <%#DataBinder.Eval(Container.DataItem, "EnterDepart")%>
                                                    </td>
                                                    <td style="text-align: right">
                                                        <asp:Label ID="Label170" runat="server" Text="<%$ Resources:lang,BianZhiRen%>"></asp:Label>：
                                                    </td>
                                                    <td style="text-align: left">
                                                        <a href='TTUserInforSimple.aspx?UserCode=<%#DataBinder.Eval(Container.DataItem ,"EnterCode") %>'
                                                            target="DetailArea">
                                                            <%#DataBinder.Eval(Container.DataItem, "EnterPer")%></a>
                                                    </td>
                                                    <td style="width: 100px"></td>
                                                </tr>
                                                <tr>
                                                    <td style="text-align: right">
                                                        <asp:Label ID="Label171" runat="server" Text="<%$ Resources:lang,ZhaoBiaoLeiXing%>"></asp:Label>：
                                                    </td>
                                                    <td colspan="2" style="text-align: left">
                                                        <%#DataBinder.Eval(Container.DataItem, "BidType")%>
                                                    </td>
                                                    <td style="text-align: right">
                                                        <asp:Label ID="Label172" runat="server" Text="<%$ Resources:lang,ZhaoBiaoFangShi%>"></asp:Label>：
                                                    </td>
                                                    <td style="text-align: left" colspan="2">
                                                        <%#DataBinder.Eval(Container.DataItem, "BidWay")%>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="text-align: right">
                                                        <asp:Label ID="Label173" runat="server" Text="<%$ Resources:lang,KaiShiRiQi%>"></asp:Label>：
                                                    </td>
                                                    <td colspan="2" style="text-align: left">
                                                        <%#Convert.ToDateTime(DataBinder.Eval(Container.DataItem, "BidStartDate")).ToString("yyyy-MM-dd")%>
                                                    </td>
                                                    <td style="text-align: right">
                                                        <asp:Label ID="Label174" runat="server" Text="<%$ Resources:lang,JieShuRiQi%>"></asp:Label>：
                                                    </td>
                                                    <td style="text-align: left" colspan="2">
                                                        <%#Convert.ToDateTime(DataBinder.Eval(Container.DataItem, "BidEndDate")).ToString("yyyy-MM-dd")%>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="text-align: right">
                                                        <asp:Label ID="Label175" runat="server" Text="<%$ Resources:lang,BianZhiRiQi%>"></asp:Label>：
                                                    </td>
                                                    <td style="text-align: left" colspan="2">
                                                        <%#Convert.ToDateTime(DataBinder.Eval(Container.DataItem, "EnterDate")).ToString("yyyy-MM-dd")%>
                                                    </td>
                                                    <td style="text-align: right">
                                                        <asp:Label ID="Label176" runat="server" Text="<%$ Resources:lang,ZhaoBiaoDiDian%>"></asp:Label>：
                                                    </td>
                                                    <td colspan="2" style="height: 18px; text-align: left">
                                                        <%#DataBinder.Eval(Container.DataItem, "BidAddress")%>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="text-align: right">
                                                        <asp:Label ID="Label177" runat="server" Text="<%$ Resources:lang,FangAnNeiRong%>"></asp:Label>：
                                                    </td>
                                                    <td colspan="5" style="text-align: left">
                                                        <%#DataBinder.Eval(Container.DataItem, "BidRemark")%>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="text-align: right"></td>
                                                    <td style="text-align: left;" colspan="5">
                                                        <a href='TTBMBidFileView.aspx?BidPlanID=<%#DataBinder.Eval(Container.DataItem, "ID")%>'
                                                            target="DetailArea">
                                                            <asp:Label ID="Label178" runat="server" Text="<%$ Resources:lang,ZhaoBiaoWenJian%>"></asp:Label></a>
                                                    </td>
                                                </tr>
                                            </table>
                                        </ItemTemplate>
                                    </asp:DataList>

                                    <asp:DataList ID="DataList18" runat="server" Width="700px" CellPadding="0" CellSpacing="0">
                                        <ItemTemplate>
                                            <table class="bian" style="border-collapse: collapse;" cellpadding="4"
                                                cellspacing="0">
                                                <tr>
                                                    <td style="text-align: right;">
                                                        <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,DanHao%>"></asp:Label>：
                                                    </td>
                                                    <td style="text-align: left">
                                                        <%#DataBinder.Eval(Container.DataItem, "POID")%>
                                                    </td>
                                                    <td style="width: 106px; text-align: right">
                                                        <asp:Label ID="Label183" runat="server" Text="<%$ Resources:lang,MingCheng%>"></asp:Label>：
                                                    </td>
                                                    <td colspan="3" style="text-align: left">
                                                        <%#DataBinder.Eval(Container.DataItem, "GPOName")%>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="text-align: right">
                                                        <asp:Label ID="Label184" runat="server" Text="<%$ Resources:lang,CaiGouShiJian%>"></asp:Label>：
                                                    </td>
                                                    <td colspan="2" style="text-align: left">
                                                        <%--<%#DataBinder.Eval(Container.DataItem, "PurTime", "{0:yyyy/MM/dd}")%>--%>
                                                        <%# Convert.ToDateTime(DataBinder.Eval(Container.DataItem, "PurTime")).ToString("yyyy/MM/dd")%>
                                                    </td>
                                                    <td style="width: 121px; text-align: right">
                                                        <asp:Label ID="Label185" runat="server" Text="<%$ Resources:lang,DaoHuoShiJian%>"></asp:Label>：
                                                    </td>
                                                    <td style="text-align: left" colspan="2">
                                                        <%#DataBinder.Eval(Container.DataItem, "ArrivalTime")%>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="text-align: right">
                                                        <asp:Label ID="Label186" runat="server" Text="<%$ Resources:lang,ZongJinE%>"></asp:Label>：
                                                    </td>
                                                    <td style="text-align: left">
                                                        <%#DataBinder.Eval(Container.DataItem, "Amount")%>
                                                        <td style="width: 121px; text-align: right">
                                                            <asp:Label ID="Label187" runat="server" Text="<%$ Resources:lang,BiBie%>"></asp:Label></td>
                                                        <td style="width: 113px; text-align: left"><%#DataBinder.Eval(Container.DataItem, "CurrencyType")%></td>
                                                        <td style="width: 100px"></td>
                                                        <td style="width: 100px"></td>
                                                </tr>
                                                <tr>
                                                    <td style="text-align: right">
                                                        <asp:Label ID="Label188" runat="server" Text="<%$ Resources:lang,CaiGouYuan%>"></asp:Label>：
                                                    </td>
                                                    <td colspan="2" style="height: 18px; text-align: left">
                                                        <a href='TTUserInforSimple.aspx?UserCode=<%#DataBinder .Eval (Container .DataItem ,"PurManCode") %>'
                                                            target="DetailArea">
                                                            <%#DataBinder.Eval(Container.DataItem, "PurManName")%></a>
                                                    </td>
                                                    <td style="width: 121px; height: 18px; text-align: right"></td>
                                                    <td colspan="2" style="height: 18px; text-align: left"></td>
                                                </tr>
                                                <tr>
                                                    <td style="text-align: right">
                                                        <asp:Label ID="Label189" runat="server" Text="<%$ Resources:lang,BeiZhu%>"></asp:Label>：
                                                    </td>
                                                    <td colspan="5" style="height: 18px; text-align: left">
                                                        <%#DataBinder.Eval(Container.DataItem, "Comment")%>
                                                    </td>
                                                </tr>

                                                <tr>
                                                    <td style="text-align: right"></td>
                                                    <td style="text-align: left;" colspan="5">
                                                        <a id="aDetailView" href='TTGoodsPurchaseOrderDetailView.aspx?POID=<%#DataBinder.Eval(Container.DataItem, "DetailPOID")%>&NoPop=YES'
                                                            target="DetailArea">
                                                            <asp:Label ID="Label191" runat="server" Text="<%$ Resources:lang,CaiGouMingXi%>"></asp:Label></a>
                                                        &nbsp;&nbsp;&nbsp;&nbsp;
                                                        <asp:HyperLink ID="HL_WLBusinessUpdate" runat="server" NavigateUrl='<%#"TTMakeGoodsPurchase.aspx?BusinessID=" + DataBinder.Eval(Container.DataItem, "POID") + "&WLID=" + strWLID + "&WLStepDetailID=" + strID  %>'
                                                            Text="&lt;div&gt;&lt;img src=ImagesSkin/Update.png border=0 alt='修改' /&gt;&lt;/div&gt;" />
                                                    </td>
                                                </tr>
                                            </table>
                                        </ItemTemplate>
                                    </asp:DataList>


                                    <asp:DataList ID="DataList19" runat="server" Height="1px" Width="700px" CellPadding="0"
                                        CellSpacing="0">
                                        <ItemTemplate>
                                            <table class="bian" style="border-collapse: collapse;" cellpadding="4"
                                                cellspacing="0">
                                                <tr>
                                                    <td style="text-align: right">
                                                        <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,DanHao%>"></asp:Label>：
                                                    </td>
                                                    <td style="text-align: left">
                                                        <%#DataBinder.Eval(Container.DataItem, "AAID")%>
                                                    </td>
                                                    <td style="width: 106px; text-align: right">
                                                        <asp:Label ID="Label192" runat="server" Text="<%$ Resources:lang,MingCheng%>"></asp:Label>：
                                                    </td>
                                                    <td colspan="3" style="text-align: left">
                                                        <%#DataBinder.Eval(Container.DataItem, "GAAName")%>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="text-align: right">
                                                        <asp:Label ID="Label193" runat="server" Text="<%$ Resources:lang,LeiXing%>"></asp:Label>：
                                                    </td>
                                                    <td colspan="2" style="text-align: left">
                                                        <%#DataBinder.Eval(Container.DataItem, "Type")%>
                                                    </td>
                                                    <td style="width: 121px; text-align: right"></td>
                                                    <td style="width: 113px; text-align: left"></td>
                                                    <td style="width: 100px"></td>
                                                </tr>
                                                <tr>
                                                    <td style="text-align: right">
                                                        <asp:Label ID="Label194" runat="server" Text="<%$ Resources:lang,ShenQingShiJian%>"></asp:Label>：
                                                    </td>
                                                    <td colspan="2" style="text-align: left">
                                                        <%--<%#DataBinder.Eval(Container.DataItem, "ApplyTime", "{0:yyyy/MM/dd}")%>--%>
                                                        <%# Convert.ToDateTime(DataBinder.Eval(Container.DataItem, "ApplyTime")).ToString("yyyy/MM/dd")%>
                                                    </td>
                                                    <td style="width: 121px; text-align: right">
                                                        <asp:Label ID="Label195" runat="server" Text="<%$ Resources:lang,YaoQiuWanChengShiJian%>"></asp:Label>：
                                                    </td>
                                                    <td style="text-align: left" colspan="2">
                                                        <%#DataBinder.Eval(Container.DataItem, "FinishTime")%>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="text-align: right">
                                                        <asp:Label ID="Label196" runat="server" Text="<%$ Resources:lang,LingYongLiYou%>"></asp:Label>：
                                                    </td>
                                                    <td colspan="5" style="height: 18px; text-align: left">
                                                        <%#DataBinder.Eval(Container.DataItem, "ApplyReason")%>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="text-align: right">
                                                        <asp:Label ID="Label197" runat="server" Text="<%$ Resources:lang,LingYongRen%>"></asp:Label>：
                                                    </td>
                                                    <td colspan="2" style="height: 18px; text-align: left">
                                                        <a href='TTUserInforSimple.aspx?UserCode=<%#DataBinder .Eval (Container .DataItem ,"ApplicantCode") %>'
                                                            target="DetailArea">
                                                            <%#DataBinder.Eval(Container.DataItem, "ApplicantName")%></a>
                                                    </td>
                                                    <td style="width: 121px; height: 18px; text-align: right"></td>
                                                    <td colspan="2" style="height: 18px; text-align: left"></td>
                                                </tr>

                                                <tr>
                                                    <td style="text-align: right"></td>
                                                    <td style="text-align: left;" colspan="5">
                                                        <a id="aDetailView" href='TTGoodsApplicationDetailView.aspx?AAID=<%#DataBinder.Eval(Container.DataItem, "DetailAAID")%>&NoPop=YES'
                                                            target="DetailArea">
                                                            <asp:Label ID="Label199" runat="server" Text="<%$ Resources:lang,ShangPingLingYongMingXi%>"></asp:Label></a>

                                                        &nbsp;&nbsp;&nbsp;&nbsp;
                                                        <asp:HyperLink ID="HL_WLBusinessUpdate" runat="server" NavigateUrl='<%#"TTGoodsApplicationOrderForFilling.aspx?BusinessID=" + DataBinder.Eval(Container.DataItem, "FillingAAID") + "&WLID=" + strWLID + "&WLStepDetailID=" + strID  %>'
                                                            Text="&lt;div&gt;&lt;img src=ImagesSkin/Update.png border=0 alt='修改' /&gt;&lt;/div&gt;" />
                                                    </td>
                                                </tr>
                                            </table>
                                        </ItemTemplate>
                                    </asp:DataList>


                                    <asp:DataList ID="DataList36" runat="server" Height="1px" Width="700px" CellPadding="0"
                                        CellSpacing="0">
                                        <ItemTemplate>
                                            <table class="bian" style="border-collapse: collapse;" cellpadding="4"
                                                cellspacing="0">
                                                <tr>
                                                    <td style="text-align: right">
                                                        <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,DanHao%>"></asp:Label>：
                                                    </td>
                                                    <td style="text-align: left">
                                                        <%#DataBinder.Eval(Container.DataItem, "ProductionAAID")%>
                                                    </td>
                                                    <td style="width: 106px; text-align: right">
                                                        <asp:Label ID="Label192" runat="server" Text="<%$ Resources:lang,MingCheng%>"></asp:Label>：
                                                    </td>
                                                    <td colspan="3" style="text-align: left">
                                                        <%#DataBinder.Eval(Container.DataItem, "GAAName")%>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="text-align: right">
                                                        <asp:Label ID="Label193" runat="server" Text="<%$ Resources:lang,LeiXing%>"></asp:Label>：
                                                    </td>
                                                    <td colspan="2" style="text-align: left">
                                                        <%#DataBinder.Eval(Container.DataItem, "Type")%>
                                                    </td>
                                                    <td style="width: 121px; text-align: right"></td>
                                                    <td style="width: 113px; text-align: left"></td>
                                                    <td style="width: 100px"></td>
                                                </tr>
                                                <tr>
                                                    <td style="text-align: right">
                                                        <asp:Label ID="Label194" runat="server" Text="<%$ Resources:lang,ShenQingShiJian%>"></asp:Label>：
                                                    </td>
                                                    <td colspan="2" style="text-align: left">
                                                        <%--<%#DataBinder.Eval(Container.DataItem, "ApplyTime", "{0:yyyy/MM/dd}")%>--%>
                                                        <%# Convert.ToDateTime(DataBinder.Eval(Container.DataItem, "ApplyTime")).ToString("yyyy/MM/dd")%>
                                                    </td>
                                                    <td style="width: 121px; text-align: right">
                                                        <asp:Label ID="Label195" runat="server" Text="<%$ Resources:lang,YaoQiuWanChengShiJian%>"></asp:Label>：
                                                    </td>
                                                    <td style="text-align: left" colspan="2">
                                                        <%#DataBinder.Eval(Container.DataItem, "FinishTime")%>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="text-align: right">
                                                        <asp:Label ID="Label196" runat="server" Text="<%$ Resources:lang,LingYongLiYou%>"></asp:Label>：
                                                    </td>
                                                    <td colspan="5" style="height: 18px; text-align: left">
                                                        <%#DataBinder.Eval(Container.DataItem, "ApplyReason")%>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="text-align: right">
                                                        <asp:Label ID="Label197" runat="server" Text="<%$ Resources:lang,LingYongRen%>"></asp:Label>：
                                                    </td>
                                                    <td colspan="2" style="height: 18px; text-align: left">
                                                        <a href='TTUserInforSimple.aspx?UserCode=<%#DataBinder .Eval (Container .DataItem ,"ApplicantCode") %>'
                                                            target="DetailArea">
                                                            <%#DataBinder.Eval(Container.DataItem, "ApplicantName")%></a>
                                                    </td>
                                                    <td style="width: 121px; height: 18px; text-align: right"></td>
                                                    <td colspan="2" style="height: 18px; text-align: left"></td>
                                                </tr>

                                                <tr>
                                                    <td style="text-align: right"></td>
                                                    <td style="text-align: left;" colspan="5">
                                                        <a id="aDetailView" href='TTGoodsApplicationDetailView.aspx?AAID=<%#DataBinder.Eval(Container.DataItem, "DetailAAID")%>&NoPop=YES'
                                                            target="DetailArea">
                                                            <asp:Label ID="Label199" runat="server" Text="<%$ Resources:lang,ShangPingLingYongMingXi%>"></asp:Label></a>

                                                        &nbsp;&nbsp;&nbsp;&nbsp;
                                                        <asp:HyperLink ID="HL_WLBusinessUpdate" runat="server" NavigateUrl='<%#"TTGoodsApplicationOrderForProduction.aspx?BusinessID=" + DataBinder.Eval(Container.DataItem, "ProductionAAID") + "&WLID=" + strWLID + "&WLStepDetailID=" + strID  %>'
                                                            Text="&lt;div&gt;&lt;img src=ImagesSkin/Update.png border=0 alt='修改' /&gt;&lt;/div&gt;" />
                                                    </td>
                                                </tr>
                                            </table>
                                        </ItemTemplate>
                                    </asp:DataList>

                                    <asp:DataList ID="DataList37" runat="server" Height="1px" Width="700px" CellPadding="0"
                                        CellSpacing="0">
                                        <ItemTemplate>
                                            <table class="bian" style="border-collapse: collapse;" cellpadding="4"
                                                cellspacing="0">
                                                <tr>
                                                    <td style="text-align: right">
                                                        <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,DanHao%>"></asp:Label>：
                                                    </td>
                                                    <td style="text-align: left">
                                                        <%#DataBinder.Eval(Container.DataItem, "SaleAAID")%>
                                                    </td>
                                                    <td style="width: 106px; text-align: right">
                                                        <asp:Label ID="Label192" runat="server" Text="<%$ Resources:lang,MingCheng%>"></asp:Label>：
                                                    </td>
                                                    <td colspan="3" style="text-align: left">
                                                        <%#DataBinder.Eval(Container.DataItem, "GAAName")%>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="text-align: right">
                                                        <asp:Label ID="Label193" runat="server" Text="<%$ Resources:lang,LeiXing%>"></asp:Label>：
                                                    </td>
                                                    <td colspan="2" style="text-align: left">
                                                        <%#DataBinder.Eval(Container.DataItem, "Type")%>
                                                    </td>
                                                    <td style="width: 121px; text-align: right"></td>
                                                    <td style="width: 113px; text-align: left"></td>
                                                    <td style="width: 100px"></td>
                                                </tr>
                                                <tr>
                                                    <td style="text-align: right">
                                                        <asp:Label ID="Label194" runat="server" Text="<%$ Resources:lang,ShenQingShiJian%>"></asp:Label>：
                                                    </td>
                                                    <td colspan="2" style="text-align: left">
                                                        <%--<%#DataBinder.Eval(Container.DataItem, "ApplyTime", "{0:yyyy/MM/dd}")%>--%>
                                                        <%# Convert.ToDateTime(DataBinder.Eval(Container.DataItem, "ApplyTime")).ToString("yyyy/MM/dd")%>
                                                    </td>
                                                    <td style="width: 121px; text-align: right">
                                                        <asp:Label ID="Label195" runat="server" Text="<%$ Resources:lang,YaoQiuWanChengShiJian%>"></asp:Label>：
                                                    </td>
                                                    <td style="text-align: left" colspan="2">
                                                        <%#DataBinder.Eval(Container.DataItem, "FinishTime")%>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="text-align: right">
                                                        <asp:Label ID="Label196" runat="server" Text="<%$ Resources:lang,LingYongLiYou%>"></asp:Label>：
                                                    </td>
                                                    <td colspan="5" style="height: 18px; text-align: left">
                                                        <%#DataBinder.Eval(Container.DataItem, "ApplyReason")%>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="text-align: right">
                                                        <asp:Label ID="Label197" runat="server" Text="<%$ Resources:lang,LingYongRen%>"></asp:Label>：
                                                    </td>
                                                    <td colspan="2" style="height: 18px; text-align: left">
                                                        <a href='TTUserInforSimple.aspx?UserCode=<%#DataBinder .Eval (Container .DataItem ,"ApplicantCode") %>'
                                                            target="DetailArea">
                                                            <%#DataBinder.Eval(Container.DataItem, "ApplicantName")%></a>
                                                    </td>
                                                    <td style="width: 121px; height: 18px; text-align: right"></td>
                                                    <td colspan="2" style="height: 18px; text-align: left"></td>
                                                </tr>

                                                <tr>
                                                    <td style="text-align: right"></td>
                                                    <td style="text-align: left;" colspan="5">
                                                        <a id="aDetailView" href='TTGoodsApplicationDetailView.aspx?AAID=<%#DataBinder.Eval(Container.DataItem, "DetailAAID")%>&NoPop=YES'
                                                            target="DetailArea">
                                                            <asp:Label ID="Label199" runat="server" Text="<%$ Resources:lang,ShangPingLingYongMingXi%>"></asp:Label></a>

                                                        &nbsp;&nbsp;&nbsp;&nbsp;
                                                        <asp:HyperLink ID="HL_WLBusinessUpdate" runat="server" NavigateUrl='<%#"TTGoodsApplicationOrderForSale.aspx?BusinessID=" + DataBinder.Eval(Container.DataItem, "SaleAAID") + "&WLID=" + strWLID + "&WLStepDetailID=" + strID  %>'
                                                            Text="&lt;div&gt;&lt;img src=ImagesSkin/Update.png border=0 alt='修改' /&gt;&lt;/div&gt;" />
                                                    </td>
                                                </tr>
                                            </table>
                                        </ItemTemplate>
                                    </asp:DataList>

                                    <asp:DataList ID="DataList38" runat="server" Height="1px" Width="700px" CellPadding="0"
                                        CellSpacing="0">
                                        <ItemTemplate>
                                            <table class="bian" style="border-collapse: collapse;" cellpadding="4"
                                                cellspacing="0">
                                                <tr>
                                                    <td style="text-align: right">
                                                        <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,DanHao%>"></asp:Label>：
                                                    </td>
                                                    <td style="text-align: left">
                                                        <%#DataBinder.Eval(Container.DataItem, "OtherAAID")%>
                                                    </td>
                                                    <td style="width: 106px; text-align: right">
                                                        <asp:Label ID="Label192" runat="server" Text="<%$ Resources:lang,MingCheng%>"></asp:Label>：
                                                    </td>
                                                    <td colspan="3" style="text-align: left">
                                                        <%#DataBinder.Eval(Container.DataItem, "GAAName")%>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="text-align: right">
                                                        <asp:Label ID="Label193" runat="server" Text="<%$ Resources:lang,LeiXing%>"></asp:Label>：
                                                    </td>
                                                    <td colspan="2" style="text-align: left">
                                                        <%#DataBinder.Eval(Container.DataItem, "Type")%>
                                                    </td>
                                                    <td style="width: 121px; text-align: right"></td>
                                                    <td style="width: 113px; text-align: left"></td>
                                                    <td style="width: 100px"></td>
                                                </tr>
                                                <tr>
                                                    <td style="text-align: right">
                                                        <asp:Label ID="Label194" runat="server" Text="<%$ Resources:lang,ShenQingShiJian%>"></asp:Label>：
                                                    </td>
                                                    <td colspan="2" style="text-align: left">
                                                        <%--<%#DataBinder.Eval(Container.DataItem, "ApplyTime", "{0:yyyy/MM/dd}")%>--%>
                                                        <%# Convert.ToDateTime(DataBinder.Eval(Container.DataItem, "ApplyTime")).ToString("yyyy/MM/dd")%>
                                                    </td>
                                                    <td style="width: 121px; text-align: right">
                                                        <asp:Label ID="Label195" runat="server" Text="<%$ Resources:lang,YaoQiuWanChengShiJian%>"></asp:Label>：
                                                    </td>
                                                    <td style="text-align: left" colspan="2">
                                                        <%#DataBinder.Eval(Container.DataItem, "FinishTime")%>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="text-align: right">
                                                        <asp:Label ID="Label196" runat="server" Text="<%$ Resources:lang,LingYongLiYou%>"></asp:Label>：
                                                    </td>
                                                    <td colspan="5" style="height: 18px; text-align: left">
                                                        <%#DataBinder.Eval(Container.DataItem, "ApplyReason")%>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="text-align: right">
                                                        <asp:Label ID="Label197" runat="server" Text="<%$ Resources:lang,LingYongRen%>"></asp:Label>：
                                                    </td>
                                                    <td colspan="2" style="height: 18px; text-align: left">
                                                        <a href='TTUserInforSimple.aspx?UserCode=<%#DataBinder .Eval (Container .DataItem ,"ApplicantCode") %>'
                                                            target="DetailArea">
                                                            <%#DataBinder.Eval(Container.DataItem, "ApplicantName")%></a>
                                                    </td>
                                                    <td style="width: 121px; height: 18px; text-align: right"></td>
                                                    <td colspan="2" style="height: 18px; text-align: left"></td>
                                                </tr>

                                                <tr>
                                                    <td style="text-align: right"></td>
                                                    <td style="text-align: left;" colspan="5">
                                                        <a id="aDetailView" href='TTGoodsApplicationDetailView.aspx?AAID=<%#DataBinder.Eval(Container.DataItem, "DetailAAID")%>&NoPop=YES'
                                                            target="DetailArea">
                                                            <asp:Label ID="Label199" runat="server" Text="<%$ Resources:lang,ShangPingLingYongMingXi%>"></asp:Label></a>

                                                        &nbsp;&nbsp;&nbsp;&nbsp;
                                                        <asp:HyperLink ID="HL_WLBusinessUpdate" runat="server" NavigateUrl='<%#"TTGoodsApplicationWFForOther.aspx?BusinessID=" + DataBinder.Eval(Container.DataItem, "OtherAAID") + "&WLID=" + strWLID + "&WLStepDetailID=" + strID  %>'
                                                            Text="&lt;div&gt;&lt;img src=ImagesSkin/Update.png border=0 alt='修改' /&gt;&lt;/div&gt;" />
                                                    </td>
                                                </tr>
                                            </table>
                                        </ItemTemplate>
                                    </asp:DataList>

                                    <asp:DataList ID="DataList20" runat="server" Height="1px" Width="700px" CellPadding="0"
                                        CellSpacing="0">
                                        <ItemTemplate>
                                            <table class="bian" style="border-collapse: collapse;" cellpadding="4"
                                                cellspacing="0">
                                                <tr>
                                                    <td style="text-align: right">
                                                        <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,DanHao%>"></asp:Label>：
                                                    </td>
                                                    <td style="text-align: left">
                                                        <%#DataBinder.Eval(Container.DataItem, "SOID")%>
                                                    </td>
                                                    <td style="width: 106px; text-align: right">
                                                        <asp:Label ID="Label200" runat="server" Text="<%$ Resources:lang,MingCheng%>"></asp:Label>：
                                                    </td>
                                                    <td colspan="3" style="text-align: left">
                                                        <%#DataBinder.Eval(Container.DataItem, "SOName")%>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="text-align: right">
                                                        <asp:Label ID="Label201" runat="server" Text="<%$ Resources:lang,KeHu%>"></asp:Label>：
                                                    </td>
                                                    <td colspan="5" style="text-align: left">
                                                        <a href='TTCustomerInfoView.aspx?CustomerCode=<%#DataBinder .Eval (Container .DataItem ,"CustomerCode") %>'
                                                            target="DetailArea">
                                                            <%#DataBinder.Eval(Container.DataItem, "SalesName")%></a>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="text-align: right">
                                                        <asp:Label ID="Label202" runat="server" Text="<%$ Resources:lang,YeWuYuan%>"></asp:Label>：
                                                    </td>
                                                    <td colspan="2" style="height: 18px; text-align: left">
                                                        <a href='TTUserInforSimple.aspx?UserCode=<%#DataBinder .Eval (Container .DataItem ,"SalesCode") %>'
                                                            target="DetailArea">
                                                            <%#DataBinder.Eval(Container.DataItem, "SalesName")%></a>
                                                    </td>
                                                    <td style="width: 121px; height: 18px; text-align: right">
                                                        <asp:Label ID="Label203" runat="server" Text="<%$ Resources:lang,JinE%>"></asp:Label>：</td>
                                                    <td style="height: 18px; text-align: left"><%#DataBinder.Eval(Container.DataItem, "Amount")%> </td>

                                                    <td style="text-align: left"><%#DataBinder.Eval(Container.DataItem, "CurrencyType")%></td>

                                                </tr>
                                                <tr>
                                                    <td style="text-align: right">
                                                        <asp:Label ID="Label204" runat="server" Text="<%$ Resources:lang,XiaoShouShiJian%>"></asp:Label>：
                                                    </td>
                                                    <td colspan="2" style="text-align: left">
                                                        <%--<%#DataBinder.Eval(Container.DataItem, "SaleTime", "{0:yyyy/MM/dd}")%>--%>
                                                        <%# Convert.ToDateTime(DataBinder.Eval(Container.DataItem, "SaleTime")).ToString("yyyy/MM/dd")%>
                                                    </td>
                                                    <td style="width: 121px; text-align: right">
                                                        <asp:Label ID="Label205" runat="server" Text="<%$ Resources:lang,YuJiDaoHuoShiJian%>"></asp:Label>：
                                                    </td>
                                                    <td style="text-align: left" colspan="2">
                                                        <%#DataBinder.Eval(Container.DataItem, "ArrivalTime")%>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="text-align: right">
                                                        <asp:Label ID="Label207" runat="server" Text="<%$ Resources:lang,BeiZhu%>"></asp:Label>：
                                                    </td>
                                                    <td colspan="5" style="height: 18px; text-align: left">
                                                        <%#DataBinder.Eval(Container.DataItem, "Comment")%>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="text-align: right"></td>
                                                    <td style="text-align: left;" colspan="5">
                                                        <a id="aDetailView" href='TTGoodsSaleOrderDetailView.aspx?SOID=<%#DataBinder.Eval(Container.DataItem, "DetailSOID")%>&NoPop=YES'
                                                            target="DetailArea">
                                                            <asp:Label ID="Label208" runat="server" Text="<%$ Resources:lang,ShangPingXiaoShouMingXi%>"></asp:Label></a>
                                                        &nbsp;&nbsp;&nbsp;&nbsp;
                                                        <asp:HyperLink ID="HL_WLBusinessUpdate" runat="server" NavigateUrl='<%#"TTGoodsSaleOrderWF.aspx?BusinessID=" + DataBinder.Eval(Container.DataItem, "SOID") + "&WLID=" + strWLID + "&WLStepDetailID=" + strID  %>'
                                                            Text="&lt;div&gt;&lt;img src=ImagesSkin/Update.png border=0 alt='修改' /&gt;&lt;/div&gt;" />
                                                    </td>
                                                </tr>
                                            </table>
                                        </ItemTemplate>
                                    </asp:DataList>
                                    <asp:DataList ID="DataList22" runat="server" Height="1px" Width="700px" CellPadding="0" CellSpacing="0">
                                        <ItemTemplate>
                                            <table class="bian" style="border-collapse: collapse;" cellpadding="4" cellspacing="0">
                                                <tr>
                                                    <td style="text-align: right">
                                                        <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,DanHao%>"></asp:Label>：
                                                    </td>
                                                    <td style="text-align: left">
                                                        <%#DataBinder.Eval(Container.DataItem, "QOID")%>
                                                    </td>
                                                    <td style="width: 106px; text-align: right">
                                                        <asp:Label ID="Label209" runat="server" Text="<%$ Resources:lang,MingCheng%>"></asp:Label>：
                                                    </td>
                                                    <td colspan="3" style="text-align: left">
                                                        <%#DataBinder.Eval(Container.DataItem, "QOName")%>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="text-align: right">
                                                        <asp:Label ID="Label210" runat="server" Text="<%$ Resources:lang,KeHu%>"></asp:Label>：
                                                    </td>
                                                    <td colspan="5" style="text-align: left">
                                                        <a href='TTCustomerInfoView.aspx?CustomerCode=<%#DataBinder .Eval (Container .DataItem ,"CustomerCode") %>'
                                                            target="DetailArea">
                                                            <%#DataBinder.Eval(Container.DataItem, "CustomerName")%></a>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="text-align: right">
                                                        <asp:Label ID="Label211" runat="server" Text="<%$ Resources:lang,KeHu%>"></asp:Label>：
                                                    </td>
                                                    <td style="text-align: right">
                                                        <asp:Label ID="Label212" runat="server" Text="<%$ Resources:lang,YeWuYuan%>"></asp:Label>：
                                                    </td>
                                                    <td colspan="2" style="height: 18px; text-align: left">
                                                        <a href='TTUserInforSimple.aspx?UserCode=<%#DataBinder .Eval (Container .DataItem ,"SalesCode") %>'
                                                            target="DetailArea">
                                                            <%#DataBinder.Eval(Container.DataItem, "SalesName")%></a>
                                                    </td>
                                                    <td style="width: 121px; height: 18px; text-align: right">
                                                        <asp:Label ID="Label213" runat="server" Text="<%$ Resources:lang,JinE%>"></asp:Label>：</td>
                                                    <td style="height: 18px; text-align: left"><%#DataBinder.Eval(Container.DataItem, "Amount")%> </td>

                                                    <td style="text-align: left"><%#DataBinder.Eval(Container.DataItem, "CurrencyType")%></td>
                                                </tr>
                                                <tr>
                                                    <td style="text-align: right">
                                                        <asp:Label ID="Label214" runat="server" Text="<%$ Resources:lang,BaoJiaShiJian%>"></asp:Label>：
                                                    </td>
                                                    <td colspan="2" style="text-align: left">
                                                        <%#DataBinder.Eval(Container.DataItem, "QuotationTime", "{0:yyyy/MM/dd}")%>
                                                    </td>
                                                    <td style="width: 121px; text-align: right"></td>
                                                    <td style="text-align: left" colspan="2"></td>
                                                </tr>

                                                <tr>
                                                    <td style="text-align: right">
                                                        <asp:Label ID="Label216" runat="server" Text="<%$ Resources:lang,BeiZhu%>"></asp:Label>：
                                                    </td>
                                                    <td colspan="5" style="height: 18px; text-align: left">
                                                        <%#DataBinder.Eval(Container.DataItem, "Comment")%>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="text-align: right"></td>
                                                    <td style="text-align: left;" colspan="5">
                                                        <a id="aDetailView" href='TTGoodsSaleQuotationOrderDetailView.aspx?QOID=<%#DataBinder.Eval(Container.DataItem, "DetailQOID")%>&NoPop=YES'
                                                            target="DetailArea">
                                                            <asp:Label ID="Label217" runat="server" Text="<%$ Resources:lang,ShangPingBaoJiaMingXi%>"></asp:Label></a>
                                                        &nbsp;&nbsp;&nbsp;&nbsp;
                                                        <asp:HyperLink ID="HL_WLBusinessUpdate" runat="server" NavigateUrl='<%#"TTGoodsSaleQuotationOrder.aspx?BusinessID=" + DataBinder.Eval(Container.DataItem, "QOID") + "&WLID=" + strWLID + "&WLStepDetailID=" + strID  %>'
                                                            Text="&lt;div&gt;&lt;img src=ImagesSkin/Update.png border=0 alt='修改' /&gt;&lt;/div&gt;" />

                                                    </td>
                                                </tr>
                                            </table>
                                        </ItemTemplate>
                                    </asp:DataList>
                                    <asp:DataList ID="DataList23" runat="server" Width="700px" CellPadding="0" CellSpacing="0">
                                        <ItemTemplate>
                                            <table class="bian" style="border-collapse: collapse;" cellpadding="4"
                                                cellspacing="0">
                                                <tr>
                                                    <td style="text-align: right;">
                                                        <asp:Label ID="Label212" runat="server" Text="<%$ Resources:lang,DanHao%>"></asp:Label>：
                                                    </td>
                                                    <td style="text-align: left">
                                                        <%#DataBinder.Eval(Container.DataItem, "SUID")%>
                                                    </td>
                                                    <td style="width: 106px; text-align: right">
                                                        <asp:Label ID="Label218" runat="server" Text="<%$ Resources:lang,MingCheng%>"></asp:Label>：
                                                    </td>
                                                    <td colspan="3" style="text-align: left">
                                                        <%#DataBinder.Eval(Container.DataItem, "SUName")%>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="text-align: right">
                                                        <asp:Label ID="Label219" runat="server" Text="<%$ Resources:lang,GongHuoShiJian%>"></asp:Label>：
                                                    </td>
                                                    <td style="text-align: left">
                                                        <%# Convert.ToDateTime(DataBinder.Eval(Container.DataItem, "SupplyTime")).ToString("yyyy/MM/dd")%>
                                                    </td>
                                                    <td style="width: 121px; text-align: right">
                                                        <asp:Label ID="Label220" runat="server" Text="<%$ Resources:lang,GongYingShang%>"></asp:Label>：
                                                    </td>
                                                    <td style="text-align: left" colspan="2">
                                                        <%#DataBinder.Eval(Container.DataItem, "Supplier")%>
                                               电话： <%#DataBinder.Eval(Container.DataItem, "SupplierPhone")%>
                                                    </td>
                                                </tr>

                                                <tr>
                                                    <td style="text-align: right"></td>
                                                    <td style="text-align: left;" colspan="5">
                                                        <a id="aDetailView" href='TTGoodsSupplyOrderDetailView.aspx?SUID=<%#DataBinder.Eval(Container.DataItem, "DetailSUID")%>&NoPop=YES'
                                                            target="DetailArea">
                                                            <asp:Label ID="Label222" runat="server" Text="<%$ Resources:lang,GongHuoMingXi%>"></asp:Label></a>
                                                        &nbsp;&nbsp;&nbsp;&nbsp;
                                                        <asp:HyperLink ID="HL_WLBusinessUpdate" runat="server" NavigateUrl='<%#"TTGoodsSupplyOrder.aspx?BusinessID=" + DataBinder.Eval(Container.DataItem, "SUID") + "&WLID=" + strWLID + "&WLStepDetailID=" + strID  %>'
                                                            Text="&lt;div&gt;&lt;img src=ImagesSkin/Update.png border=0 alt='修改' /&gt;&lt;/div&gt;" />

                                                    </td>
                                                </tr>
                                            </table>
                                        </ItemTemplate>
                                    </asp:DataList>
                                    <asp:DataList ID="DataList24" runat="server" Width="700px" CellPadding="0" CellSpacing="0">
                                        <ItemTemplate>
                                            <table class="bian" style="border-collapse: collapse;" cellpadding="4"
                                                cellspacing="0">
                                                <tr>
                                                    <td style="text-align: right;">
                                                        <asp:Label ID="Label212" runat="server" Text="<%$ Resources:lang,DanHao%>"></asp:Label>：
                                                    </td>
                                                    <td style="text-align: left">
                                                        <%#DataBinder.Eval(Container.DataItem, "PDID")%>
                                                    </td>
                                                    <td style="width: 106px; text-align: right">
                                                        <asp:Label ID="Label223" runat="server" Text="<%$ Resources:lang,MingCheng%>"></asp:Label>：
                                                    </td>
                                                    <td style="text-align: left">
                                                        <%#DataBinder.Eval(Container.DataItem, "PDName")%>
                                                    </td>
                                                    <td style="width: 106px; text-align: right">
                                                        <asp:Label ID="Label50" runat="server" Text="<%$ Resources:lang,GongYi%>"></asp:Label>：
                                                    </td>
                                                    <td colspan="3" style="text-align: left">
                                                        <%#DataBinder.Eval(Container.DataItem, "RouteName")%>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="text-align: right">
                                                        <asp:Label ID="Label224" runat="server" Text="<%$ Resources:lang,ShiJian%>"></asp:Label>：
                                                    </td>
                                                    <td style="text-align: left">
                                                        <%# Convert.ToDateTime(DataBinder.Eval(Container.DataItem, "ProductionDate")).ToString("yyyy/MM/dd")%>
                                                    </td>
                                                    <td style="width: 121px; text-align: right">
                                                        <asp:Label ID="Label225" runat="server" Text="<%$ Resources:lang,XiangGuan%>">  </asp:Label>：
                                                    </td>
                                                    <td style="text-align: left" colspan="2">
                                                        <%#DataBinder.Eval(Container.DataItem, "RelatedType")%>
                                                        ID: <%#DataBinder.Eval(Container.DataItem, "RelatedID")%>
                                                    </td>
                                                </tr>

                                                <tr>
                                                    <td style="text-align: right"></td>
                                                    <td style="text-align: left;" colspan="5">
                                                        <a id="aDetailView" href='TTGoodsProductionOrderDetailView.aspx?PDID=<%#DataBinder.Eval(Container.DataItem, "DetailPDID")%>&NoPop=YES'
                                                            target="DetailArea">
                                                            <asp:Label ID="Label227" runat="server" Text="<%$ Resources:lang,ShengChanDanMingXi%>"></asp:Label></a>

                                                        &nbsp;&nbsp;&nbsp;&nbsp;
                                                        <asp:HyperLink ID="HL_WLBusinessUpdate" runat="server" NavigateUrl='<%#"TTGoodsProductionOrder.aspx?BusinessID=" + DataBinder.Eval(Container.DataItem, "PDID") + "&WLID=" + strWLID + "&WLStepDetailID=" + strID  %>'
                                                            Text="&lt;div&gt;&lt;img src=ImagesSkin/Update.png border=0 alt='修改' /&gt;&lt;/div&gt;" />

                                                    </td>
                                                </tr>
                                            </table>
                                        </ItemTemplate>
                                    </asp:DataList>
                                    <asp:DataList ID="DataList25" runat="server" Width="700px" CellPadding="0" CellSpacing="0">
                                        <ItemTemplate>
                                            <table class="bian" style="border-collapse: collapse;" cellpadding="4"
                                                cellspacing="0">
                                                <tr>
                                                    <td style="text-align: right;">
                                                        <asp:Label ID="Label212" runat="server" Text="<%$ Resources:lang,DanHao%>"></asp:Label>：
                                                    </td>
                                                    <td style="text-align: left">
                                                        <%#DataBinder.Eval(Container.DataItem, "ShipmentNO")%>
                                                    </td>
                                                    <td style="width: 106px; text-align: right">
                                                        <asp:Label ID="Label228" runat="server" Text="<%$ Resources:lang,ChuKuYuanYin%>"></asp:Label>：
                                                    </td>
                                                    <td colspan="3" style="text-align: left">
                                                        <%#DataBinder.Eval(Container.DataItem, "ApplicationReason")%>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="text-align: right">
                                                        <asp:Label ID="Label229" runat="server" Text="<%$ Resources:lang,ChuKuShiJian%>"></asp:Label>：
                                                    </td>
                                                    <td style="text-align: left">
                                                        <%# Convert.ToDateTime(DataBinder.Eval(Container.DataItem, "ShipTime")).ToString("yyyy/MM/dd")%>
                                                    </td>
                                                    <td style="width: 121px; text-align: right">
                                                        <asp:Label ID="Label230" runat="server" Text="<%$ Resources:lang,GuanLian%>"></asp:Label>：
                                                    </td>
                                                    <td style="text-align: left" colspan="2">

                                                        <%#DataBinder.Eval(Container.DataItem, "RelatedType")%>
                                                ID: <%#DataBinder.Eval(Container.DataItem, "RelatedID")%>
                                                    </td>
                                                </tr>

                                                <tr>
                                                    <td style="text-align: right">
                                                        <asp:Label ID="Label231" runat="server" Text="<%$ Resources:lang,ShenQingRen%>"></asp:Label>：
                                                    </td>
                                                    <td colspan="5" style="height: 18px; text-align: left">
                                                        <%#DataBinder.Eval(Container.DataItem, "Applicant")%>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="text-align: left;" colspan="6">
                                                        <a href='TTGoodsShipmentApplicationOrderDetailView.aspx?ShipmentNO=<%#DataBinder.Eval(Container.DataItem, "ShipmentNO")%>'
                                                            target="DetailArea">
                                                            <asp:Label ID="Label232" runat="server" Text="<%$ Resources:lang,ChuHuoShenQingDanMingXi%>"></asp:Label></a>
                                                    </td>
                                                </tr>
                                            </table>
                                        </ItemTemplate>
                                    </asp:DataList>

                                    <asp:DataList ID="DataList26" runat="server" Width="700px" CellPadding="0" CellSpacing="0">
                                        <ItemTemplate>
                                            <table class="bian" style="border-collapse: collapse;" cellpadding="4"
                                                cellspacing="0">
                                                <tr>
                                                    <td style="text-align: right;">
                                                        <asp:Label ID="Label12" runat="server" Text="<%$ Resources:lang,TuiHuoDanHao%>"></asp:Label>：
                                                    </td>
                                                    <td style="text-align: left">
                                                        <%#DataBinder.Eval(Container.DataItem, "BorrowROID")%>
                                                    </td>
                                                    <td style="width: 106px; text-align: right">
                                                        <asp:Label ID="Label13" runat="server" Text="<%$ Resources:lang,MingCheng%>"></asp:Label>：
                                                    </td>
                                                    <td colspan="3" style="text-align: left">
                                                        <%#DataBinder.Eval(Container.DataItem, "ReturnName")%>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="text-align: right">
                                                        <asp:Label ID="Label14" runat="server" Text="<%$ Resources:lang,TuiHuoShiJian%>"></asp:Label>：
                                                    </td>
                                                    <td colspan="2" style="text-align: left">
                                                        <%#DataBinder.Eval(Container.DataItem, "ReturnTime", "{0:yyyy/MM/dd}")%>
                                                    </td>
                                                    <td style="width: 121px; text-align: right">
                                                        <asp:Label ID="Label212" runat="server" Text="<%$ Resources:lang,LeiXing%>"></asp:Label>：</td>
                                                    <td style="text-align: left" colspan="2"><%#DataBinder.Eval(Container.DataItem, "Type")%></td>
                                                </tr>
                                                <tr>
                                                    <td style="text-align: right">
                                                        <asp:Label ID="Label15" runat="server" Text="<%$ Resources:lang,ZongJinE%>"></asp:Label>：
                                                    </td>
                                                    <td style="text-align: left">
                                                        <%#DataBinder.Eval(Container.DataItem, "Amount")%>
                                                        <td style="width: 121px; text-align: right">
                                                            <asp:Label ID="Label17" runat="server" Text="<%$ Resources:lang,BiBie%>"></asp:Label>：</td>
                                                        <td style="width: 113px; text-align: left"><%#DataBinder.Eval(Container.DataItem, "CurrencyType")%></td>
                                                        <td style="width: 100px"></td>
                                                        <td style="width: 100px"></td>
                                                </tr>
                                                <tr>
                                                    <td style="text-align: right">
                                                        <asp:Label ID="Label16" runat="server" Text="<%$ Resources:lang,ShenQingRen%>"></asp:Label>：
                                                    </td>
                                                    <td colspan="3" style="height: 18px; text-align: left">
                                                        <%#DataBinder.Eval(Container.DataItem, "Applicant")%>
                                                    </td>
                                                    <td style="text-align: right"></td>
                                                    <td style="height: 18px; text-align: left"></td>
                                                </tr>
                                                <tr>
                                                    <td style="text-align: right"></td>
                                                    <td style="text-align: left;" colspan="5">
                                                        <a id="aDetailView" href='TTGoodsReturnOrderDetailView.aspx?ROID=<%#DataBinder.Eval(Container.DataItem, "DetailROID")%>&NoPop=YES'
                                                            target="DetailArea">
                                                            <asp:Label ID="Label233" runat="server" Text="<%$ Resources:lang,MingXi%>"></asp:Label></a>

                                                        &nbsp;&nbsp;&nbsp;&nbsp;
                                                        <asp:HyperLink ID="HL_WLBusinessUpdate" runat="server" NavigateUrl='<%#"TTGoodsReturnOrderForBorrow.aspx?BusinessID=" + DataBinder.Eval(Container.DataItem, "BorrowROID") + "&WLID=" + strWLID + "&WLStepDetailID=" + strID  %>'
                                                            Text="&lt;div&gt;&lt;img src=ImagesSkin/Update.png border=0 alt='修改' /&gt;&lt;/div&gt;" />

                                                    </td>
                                                </tr>
                                            </table>
                                        </ItemTemplate>
                                    </asp:DataList>

                                    <asp:DataList ID="DataList39" runat="server" Width="700px" CellPadding="0" CellSpacing="0">
                                        <ItemTemplate>
                                            <table class="bian" style="border-collapse: collapse;" cellpadding="4"
                                                cellspacing="0">
                                                <tr>
                                                    <td style="text-align: right;">
                                                        <asp:Label ID="Label12" runat="server" Text="<%$ Resources:lang,TuiHuoDanHao%>"></asp:Label>：
                                                    </td>
                                                    <td style="text-align: left">
                                                        <%#DataBinder.Eval(Container.DataItem, "ProductionROID")%>
                                                    </td>
                                                    <td style="width: 106px; text-align: right">
                                                        <asp:Label ID="Label13" runat="server" Text="<%$ Resources:lang,MingCheng%>"></asp:Label>：
                                                    </td>
                                                    <td colspan="3" style="text-align: left">
                                                        <%#DataBinder.Eval(Container.DataItem, "ReturnName")%>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="text-align: right">
                                                        <asp:Label ID="Label14" runat="server" Text="<%$ Resources:lang,TuiHuoShiJian%>"></asp:Label>：
                                                    </td>
                                                    <td colspan="2" style="text-align: left">
                                                        <%#DataBinder.Eval(Container.DataItem, "ReturnTime", "{0:yyyy/MM/dd}")%>
                                                    </td>
                                                    <td style="width: 121px; text-align: right">
                                                        <asp:Label ID="Label212" runat="server" Text="<%$ Resources:lang,LeiXing%>"></asp:Label>：</td>
                                                    <td style="text-align: left" colspan="2"><%#DataBinder.Eval(Container.DataItem, "Type")%></td>
                                                </tr>
                                                <tr>
                                                    <td style="text-align: right">
                                                        <asp:Label ID="Label15" runat="server" Text="<%$ Resources:lang,ZongJinE%>"></asp:Label>：
                                                    </td>
                                                    <td style="text-align: left">
                                                        <%#DataBinder.Eval(Container.DataItem, "Amount")%>
                                                        <td style="width: 121px; text-align: right">
                                                            <asp:Label ID="Label17" runat="server" Text="<%$ Resources:lang,BiBie%>"></asp:Label>：</td>
                                                        <td style="width: 113px; text-align: left"><%#DataBinder.Eval(Container.DataItem, "CurrencyType")%></td>
                                                        <td style="width: 100px"></td>
                                                        <td style="width: 100px"></td>
                                                </tr>
                                                <tr>
                                                    <td style="text-align: right">
                                                        <asp:Label ID="Label16" runat="server" Text="<%$ Resources:lang,ShenQingRen%>"></asp:Label>：
                                                    </td>
                                                    <td colspan="3" style="height: 18px; text-align: left">
                                                        <%#DataBinder.Eval(Container.DataItem, "Applicant")%>
                                                    </td>
                                                    <td style="text-align: right"></td>
                                                    <td style="height: 18px; text-align: left"></td>
                                                </tr>
                                                <tr>
                                                    <td style="text-align: right"></td>
                                                    <td style="text-align: left;" colspan="5">
                                                        <a id="aDetailView" href='TTGoodsReturnOrderDetailView.aspx?ROID=<%#DataBinder.Eval(Container.DataItem, "DetailROID")%>&NoPop=YES'
                                                            target="DetailArea">
                                                            <asp:Label ID="Label233" runat="server" Text="<%$ Resources:lang,MingXi%>"></asp:Label></a>

                                                        &nbsp;&nbsp;&nbsp;&nbsp;
                                                        <asp:HyperLink ID="HL_WLBusinessUpdate" runat="server" NavigateUrl='<%#"TTGoodsReturnOrderForProduction.aspx?BusinessID=" + DataBinder.Eval(Container.DataItem, "ProductionROID") + "&WLID=" + strWLID + "&WLStepDetailID=" + strID  %>'
                                                            Text="&lt;div&gt;&lt;img src=ImagesSkin/Update.png border=0 alt='修改' /&gt;&lt;/div&gt;" />
                                                    </td>
                                                </tr>
                                            </table>
                                        </ItemTemplate>
                                    </asp:DataList>

                                    <asp:DataList ID="DataList40" runat="server" Width="700px" CellPadding="0" CellSpacing="0">
                                        <ItemTemplate>
                                            <table class="bian" style="border-collapse: collapse;" cellpadding="4"
                                                cellspacing="0">
                                                <tr>
                                                    <td style="text-align: right;">
                                                        <asp:Label ID="Label12" runat="server" Text="<%$ Resources:lang,TuiHuoDanHao%>"></asp:Label>：
                                                    </td>
                                                    <td style="text-align: left">
                                                        <%#DataBinder.Eval(Container.DataItem, "PurchaseROID")%>
                                                    </td>
                                                    <td style="width: 106px; text-align: right">
                                                        <asp:Label ID="Label13" runat="server" Text="<%$ Resources:lang,MingCheng%>"></asp:Label>：
                                                    </td>
                                                    <td colspan="3" style="text-align: left">
                                                        <%#DataBinder.Eval(Container.DataItem, "ReturnName")%>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="text-align: right">
                                                        <asp:Label ID="Label14" runat="server" Text="<%$ Resources:lang,TuiHuoShiJian%>"></asp:Label>：
                                                    </td>
                                                    <td colspan="2" style="text-align: left">
                                                        <%#DataBinder.Eval(Container.DataItem, "ReturnTime", "{0:yyyy/MM/dd}")%>
                                                    </td>
                                                    <td style="width: 121px; text-align: right">
                                                        <asp:Label ID="Label212" runat="server" Text="<%$ Resources:lang,LeiXing%>"></asp:Label>：</td>
                                                    <td style="text-align: left" colspan="2"><%#DataBinder.Eval(Container.DataItem, "Type")%></td>
                                                </tr>
                                                <tr>
                                                    <td style="text-align: right">
                                                        <asp:Label ID="Label15" runat="server" Text="<%$ Resources:lang,ZongJinE%>"></asp:Label>：
                                                    </td>
                                                    <td style="text-align: left">
                                                        <%#DataBinder.Eval(Container.DataItem, "Amount")%>
                                                        <td style="width: 121px; text-align: right">
                                                            <asp:Label ID="Label17" runat="server" Text="<%$ Resources:lang,BiBie%>"></asp:Label>：</td>
                                                        <td style="width: 113px; text-align: left"><%#DataBinder.Eval(Container.DataItem, "CurrencyType")%></td>
                                                        <td style="width: 100px"></td>
                                                        <td style="width: 100px"></td>
                                                </tr>
                                                <tr>
                                                    <td style="text-align: right">
                                                        <asp:Label ID="Label16" runat="server" Text="<%$ Resources:lang,ShenQingRen%>"></asp:Label>：
                                                    </td>
                                                    <td colspan="3" style="height: 18px; text-align: left">
                                                        <%#DataBinder.Eval(Container.DataItem, "Applicant")%>
                                                    </td>
                                                    <td style="text-align: right"></td>
                                                    <td style="height: 18px; text-align: left"></td>
                                                </tr>
                                                <tr>
                                                    <td style="text-align: right"></td>
                                                    <td style="text-align: left;" colspan="5">
                                                        <a id="aDetailView" href='TTGoodsReturnOrderDetailView.aspx?ROID=<%#DataBinder.Eval(Container.DataItem, "DetailROID")%>&NoPop=YES'
                                                            target="DetailArea">
                                                            <asp:Label ID="Label233" runat="server" Text="<%$ Resources:lang,MingXi%>"></asp:Label></a>
                                                        &nbsp;&nbsp;&nbsp;&nbsp;
                                                        <asp:HyperLink ID="HL_WLBusinessUpdate" runat="server" NavigateUrl='<%#"TTGoodsReturnOrderForPurchase.aspx?BusinessID=" + DataBinder.Eval(Container.DataItem, "PurchaseROID") + "&WLID=" + strWLID + "&WLStepDetailID=" + strID  %>'
                                                            Text="&lt;div&gt;&lt;img src=ImagesSkin/Update.png border=0 alt='修改' /&gt;&lt;/div&gt;" />

                                                    </td>
                                                </tr>
                                            </table>
                                        </ItemTemplate>
                                    </asp:DataList>

                                    <asp:DataList ID="DataList41" runat="server" Width="700px" CellPadding="0" CellSpacing="0">
                                        <ItemTemplate>
                                            <table class="bian" style="border-collapse: collapse;" cellpadding="4"
                                                cellspacing="0">
                                                <tr>
                                                    <td style="text-align: right;">
                                                        <asp:Label ID="Label12" runat="server" Text="<%$ Resources:lang,TuiHuoDanHao%>"></asp:Label>：
                                                    </td>
                                                    <td style="text-align: left">
                                                        <%#DataBinder.Eval(Container.DataItem, "SaleROID")%>
                                                    </td>
                                                    <td style="width: 106px; text-align: right">
                                                        <asp:Label ID="Label13" runat="server" Text="<%$ Resources:lang,MingCheng%>"></asp:Label>：
                                                    </td>
                                                    <td colspan="3" style="text-align: left">
                                                        <%#DataBinder.Eval(Container.DataItem, "ReturnName")%>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="text-align: right">
                                                        <asp:Label ID="Label14" runat="server" Text="<%$ Resources:lang,TuiHuoShiJian%>"></asp:Label>：
                                                    </td>
                                                    <td colspan="2" style="text-align: left">
                                                        <%#DataBinder.Eval(Container.DataItem, "ReturnTime", "{0:yyyy/MM/dd}")%>
                                                    </td>
                                                    <td style="width: 121px; text-align: right">
                                                        <asp:Label ID="Label212" runat="server" Text="<%$ Resources:lang,LeiXing%>"></asp:Label>：</td>
                                                    <td style="text-align: left" colspan="2"><%#DataBinder.Eval(Container.DataItem, "Type")%></td>
                                                </tr>
                                                <tr>
                                                    <td style="text-align: right">
                                                        <asp:Label ID="Label15" runat="server" Text="<%$ Resources:lang,ZongJinE%>"></asp:Label>：
                                                    </td>
                                                    <td style="text-align: left">
                                                        <%#DataBinder.Eval(Container.DataItem, "Amount")%>
                                                        <td style="width: 121px; text-align: right">
                                                            <asp:Label ID="Label17" runat="server" Text="<%$ Resources:lang,BiBie%>"></asp:Label>：</td>
                                                        <td style="width: 113px; text-align: left"><%#DataBinder.Eval(Container.DataItem, "CurrencyType")%></td>
                                                        <td style="width: 100px"></td>
                                                        <td style="width: 100px"></td>
                                                </tr>
                                                <tr>
                                                    <td style="text-align: right">
                                                        <asp:Label ID="Label16" runat="server" Text="<%$ Resources:lang,ShenQingRen%>"></asp:Label>：
                                                    </td>
                                                    <td colspan="3" style="height: 18px; text-align: left">
                                                        <%#DataBinder.Eval(Container.DataItem, "Applicant")%>
                                                    </td>
                                                    <td style="text-align: right"></td>
                                                    <td style="height: 18px; text-align: left"></td>
                                                </tr>
                                                <tr>
                                                    <td style="text-align: right"></td>
                                                    <td style="text-align: left;" colspan="5">
                                                        <a id="aDetailView" href='TTGoodsReturnOrderDetailView.aspx?ROID=<%#DataBinder.Eval(Container.DataItem, "DetailROID")%>&NoPop=YES'
                                                            target="DetailArea">
                                                            <asp:Label ID="Label233" runat="server" Text="<%$ Resources:lang,MingXi%>"></asp:Label></a>
                                                        &nbsp;&nbsp;&nbsp;&nbsp;
                                                        <asp:HyperLink ID="HL_WLBusinessUpdate" runat="server" NavigateUrl='<%#"TTGoodsReturnOrderForSale.aspx?BusinessID=" + DataBinder.Eval(Container.DataItem, "SaleROID") + "&WLID=" + strWLID + "&WLStepDetailID=" + strID  %>'
                                                            Text="&lt;div&gt;&lt;img src=ImagesSkin/Update.png border=0 alt='修改' /&gt;&lt;/div&gt;" />

                                                    </td>
                                                </tr>
                                            </table>
                                        </ItemTemplate>
                                    </asp:DataList>

                                    <asp:DataList ID="DataList27" runat="server" Width="700px" CellPadding="0" CellSpacing="0">
                                        <ItemTemplate>
                                            <table class="bian" style="border-collapse: collapse;" cellpadding="4"
                                                cellspacing="0">
                                                <tr>
                                                    <td style="text-align: right;">
                                                        <asp:Label ID="Label12" runat="server" Text="<%$ Resources:lang,JiHuaID%>"></asp:Label>：
                                                    </td>
                                                    <td style="text-align: left">
                                                        <%#DataBinder.Eval(Container.DataItem, "PlanVerID")%>
                                                    </td>
                                                    <td style="width: 106px; text-align: right">
                                                        <asp:Label ID="Label13" runat="server" Text="<%$ Resources:lang,JiHuaMing%>"></asp:Label>：
                                                    </td>
                                                    <td colspan="3" style="text-align: left">
                                                        <%#DataBinder.Eval(Container.DataItem, "PlanVerName")%>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="text-align: right">
                                                        <asp:Label ID="Label14" runat="server" Text="<%$ Resources:lang,GuiShuBuMen%>"></asp:Label>：
                                                    </td>
                                                    <td colspan="2" style="text-align: left">
                                                        <%#DataBinder.Eval(Container.DataItem, "BelongDepartCode")%> <%#DataBinder.Eval(Container.DataItem, "BelongDepartName")%>
                                                    </td>
                                                    <td style="text-align: right">
                                                        <asp:Label ID="Label15" runat="server" Text="<%$ Resources:lang,ChuangJianZhe%>"></asp:Label>：
                                                    </td>
                                                    <td colspan="2" style="text-align: left">
                                                        <%#DataBinder.Eval(Container.DataItem, "CreatorCode")%>    <%#DataBinder.Eval(Container.DataItem, "CreatorName")%>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="text-align: left;" colspan="6">
                                                        <a id="aDetailView" href='TTGoodsMRPPlanDetailView.aspx?PlanMRPID=<%#DataBinder.Eval(Container.DataItem, "ID")%>&NoPop=YES'
                                                            target="DetailArea">
                                                            <asp:Label ID="Label234" runat="server" Text="<%$ Resources:lang,MingXi%>"></asp:Label></a>
                                                    </td>
                                                </tr>
                                            </table>
                                        </ItemTemplate>
                                    </asp:DataList>
                                    <asp:DataList ID="DataList28" runat="server" Width="1080px" CellPadding="0" CellSpacing="0">
                                        <ItemTemplate>
                                            <table class="bian" style="border-collapse: collapse;" cellpadding="4"
                                                cellspacing="0">
                                                <tr>
                                                    <td style="text-align: right;">
                                                        <asp:Label ID="Label212" runat="server" Text="<%$ Resources:lang,DanHao%>"></asp:Label>：
                                                    </td>
                                                    <td width="150px" style="text-align: left">
                                                        <%#DataBinder.Eval(Container.DataItem, "BorrowNO")%>
                                                    </td>
                                                    <td style="width: 121px; text-align: right">
                                                        <asp:Label ID="Label230" runat="server" Text="<%$ Resources:lang,MingCheng%>"></asp:Label>：
                                                    </td>
                                                    <td style="width: 250px; text-align: left">
                                                        <%#DataBinder.Eval(Container.DataItem, "BOName")%>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="text-align: right">
                                                        <asp:Label ID="Label231" runat="server" Text="<%$ Resources:lang,ShenQingRen%>"></asp:Label>：
                                                    </td>
                                                    <td style="text-align: left">
                                                        <%#DataBinder.Eval(Container.DataItem, "Applicant")%>
                                                    </td>

                                                    <td style="text-align: right">
                                                        <asp:Label ID="Label228" runat="server" Text="<%$ Resources:lang,JieChuYuanYin%>"></asp:Label>：
                                                    </td>
                                                    <td style="text-align: left">
                                                        <%#DataBinder.Eval(Container.DataItem, "ApplicationReason")%>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="text-align: right"></td>
                                                    <td style="text-align: left;" colspan="3">
                                                        <a id="aDetailView" href='TTGoodsBorrowOrderDetailView.aspx?BorrowNO=<%#DataBinder.Eval(Container.DataItem, "DetailBorrowNO")%>&NoPop=YES'
                                                            target="DetailArea">
                                                            <asp:Label ID="Label232" runat="server" Text="<%$ Resources:lang,MingXi%>"></asp:Label></a>

                                                        &nbsp;&nbsp;&nbsp;&nbsp;
                                                        <asp:HyperLink ID="HL_WLBusinessUpdate" runat="server" NavigateUrl='<%#"TTGoodsBorrowOrder.aspx?BusinessID=" + DataBinder.Eval(Container.DataItem, "BorrowNO") + "&WLID=" + strWLID + "&WLStepDetailID=" + strID  %>'
                                                            Text="&lt;div&gt;&lt;img src=ImagesSkin/Update.png border=0 alt='修改' /&gt;&lt;/div&gt;" />

                                                    </td>
                                                </tr>
                                            </table>
                                        </ItemTemplate>
                                    </asp:DataList>

                                    <asp:DataList ID="DataList30" runat="server" Width="1080px" CellPadding="0" CellSpacing="0">
                                        <ItemTemplate>
                                            <table class="bian" style="border-collapse: collapse;" cellpadding="4"
                                                cellspacing="0">
                                                <tr>

                                                    <td colspan="6" style="text-align: left">
                                                        <%#DataBinder.Eval(Container.DataItem, "Content")%>
                                                    </td>
                                                </tr>
                                                <tr>

                                                    <td style="width: 121px; text-align: right">
                                                        <asp:Label ID="Label230" runat="server" Text="<%$ Resources:lang,MingCheng%>"></asp:Label>：
                                                    </td>
                                                    <td style="width: 300px; text-align: left">
                                                        <%#DataBinder.Eval(Container.DataItem, "Title")%>
                                                    </td>
                                                    <td style="width: 121px; text-align: right">
                                                        <asp:Label ID="Label29" runat="server" Text="<%$ Resources:lang,ZuoZhe%>"></asp:Label>：
                                                    </td>
                                                    <td style="text-align: left">
                                                        <%#DataBinder.Eval(Container.DataItem, "PublisherName")%>
                                                    </td>
                                                    <td style="width: 121px; text-align: right">
                                                        <asp:Label ID="Label38" runat="server" Text="<%$ Resources:lang,fabushijian%>"></asp:Label>：
                                                    </td>
                                                    <td style="text-align: left">
                                                        <%# DateTime .Parse ( DataBinder.Eval(Container.DataItem, "PublishTime").ToString ()).ToString("yyyy-MM-dd")%>
                                                    </td>
                                                </tr>
                                            </table>
                                        </ItemTemplate>
                                    </asp:DataList>

                                    <asp:DataList ID="DataList6" runat="server" Width="980px" CellPadding="0" CellSpacing="0" DataKeyField="ECID">
                                        <ItemTemplate>
                                            <table class="bian" style="width: 700px;" cellpadding="4" cellspacing="0">
                                                <tr style="color: #000000">
                                                    <td align="left" style="width: 100px">
                                                        <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,ShenQingRen%>"></asp:Label>：
                                                    </td>
                                                    <td align="left" style="width: 600px">
                                                        <%#DataBinder.Eval(Container.DataItem, "ApplicantCode")%>
                                                        <%#DataBinder.Eval(Container.DataItem, "ApplicantName")%>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="left" style="width: 100px">
                                                        <asp:Label ID="Label53" runat="server" Text="<%$ Resources:lang,FeiYongMingCheng%>"></asp:Label>：
                                                    </td>
                                                    <td align="left" style="width: 600px">
                                                        <%#DataBinder.Eval(Container.DataItem, "ECID")%>&nbsp;&nbsp; <%#DataBinder.Eval(Container.DataItem, "ExpenseName")%>
                                                    </td>
                                                </tr>
                                                <tr style="color: #000000">
                                                    <td align="left" style="width: 100px; height: 9px">
                                                        <asp:Label ID="Label54" runat="server" Text="<%$ Resources:lang,JinE%>"></asp:Label>：
                                                    </td>
                                                    <td align="left" style="width: 600px; height: 9px">
                                                        <%#DataBinder.Eval(Container.DataItem, "Amount")%>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="left" style="width: 100px; height: 30px">
                                                        <asp:Label ID="Label55" runat="server" Text="<%$ Resources:lang,ZhuYaoYongTu%>"></asp:Label>：
                                                    </td>
                                                    <td align="left" style="width: 600px; height: 30px">
                                                        <%#DataBinder.Eval(Container.DataItem, "Purpose")%>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="left" style="width: 100px; height: 6px">
                                                        <asp:Label ID="Label57" runat="server" Text="<%$ Resources:lang,ShenQingShiJian%>"></asp:Label>：
                                                    </td>
                                                    <td align="left" style="width: 600px; height: 6px">
                                                        <%# Convert.ToDateTime(DataBinder.Eval(Container.DataItem, "ApplyTime")).ToString("yyyy/MM/dd")%>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="left" style="width: 100px; height: 30px">
                                                        <asp:Label ID="Label240" runat="server" Text="<%$ Resources:lang,ZhuangTai%>"></asp:Label>：
                                                    </td>
                                                    <td align="left" style="width: 600px; height: 30px">
                                                        <asp:Label ID="LB_Status" runat="server"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr style="color: #000000">
                                                    <td align="left" style="width: 100px"></td>
                                                    <td align="left" style="width: 600px">
                                                        <a id="aDetailView" href='TTExpenseClaimListView.aspx?RelatedID=<%#DataBinder.Eval(Container.DataItem, "DetailECID")%>&NoPop=YES'
                                                            target="DetailArea">
                                                            <asp:Label ID="Label58" runat="server" Text="<%$ Resources:lang,FeiYongMingXi%>"></asp:Label></a>


                                                        &nbsp;&nbsp;&nbsp;&nbsp;
                                                        <asp:HyperLink ID="HL_WLBusinessUpdate" runat="server" NavigateUrl='<%#"TTExpenseClaimWF.aspx?BusinessID=" + DataBinder.Eval(Container.DataItem, "ECID") + "&WLID=" + strWLID + "&WLStepDetailID=" + strID  %>'
                                                            Text="&lt;div&gt;&lt;img src=ImagesSkin/Update.png border=0 alt='修改' /&gt;&lt;/div&gt;" />

                                                    </td>

                                                </tr>
                                            </table>
                                        </ItemTemplate>
                                    </asp:DataList>

                                    <asp:DataList ID="DataList31" runat="server" Width="980px" CellPadding="0" CellSpacing="0" DataKeyField="AOID">
                                        <ItemTemplate>
                                            <table style="width: 980px;">
                                                <tr>
                                                    <td style="width: 100%; height: 80px; font-size: xx-large; text-align: center;">
                                                        <table width="100%">
                                                            <tr>
                                                                <td width="200px">
                                                                    <img src="Logo/FormLogo.png" /></td>
                                                                <td width="550px" style="font-size: xx-large; text-align: center;"
                                                                    class="auto-style1">
                                                                    <br />
                                                                    <asp:Label ID="LB_ReportName" runat="server" Text="<%$ Resources:lang,XiangMuWuZhiCaiGouShengQing%>"></asp:Label>
                                                                    <br />
                                                                </td>
                                                                <td>&nbsp;</td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="text-align: center; width: 980px;">
                                                        <table width="98%" cellpadding="3" cellspacing="0" class="formBgStyle">
                                                            <tr>
                                                                <td class="formItemBgStyle" style="text-align: left" width="15%">
                                                                    <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,DanHao%>"></asp:Label>：
                                                                </td>
                                                                <td class="formItemBgStyle" style="width: 35%; text-align: left">
                                                                    <%#DataBinder.Eval(Container.DataItem, "AOID")%> &nbsp;&nbsp;  <%#DataBinder.Eval(Container.DataItem, "AOName")%>
                                                                </td>
                                                                <td class="formItemBgStyle" style="width: 15%; text-align: left">
                                                                    <asp:Label ID="Label8" runat="server" Text="<%$ Resources:lang,ShengQingRen%>"></asp:Label>：
                                                                </td>
                                                                <td class="formItemBgStyle" style="text-align: left">
                                                                    <%#DataBinder.Eval(Container.DataItem, "UserName")%>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td class="formItemBgStyle" style="text-align: left" width="15%">
                                                                    <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,XiangMu%>"></asp:Label>：
                                                                </td>
                                                                <td class="formItemBgStyle" style="width: 35%; text-align: left">
                                                                    <%#DataBinder.Eval(Container.DataItem, "ProjectID")%>
                                                                    <%#DataBinder.Eval(Container.DataItem, "ProjectName")%>
                                                                </td>
                                                                <td class="formItemBgStyle" style="width: 15%; text-align: left">
                                                                    <asp:Label ID="Label9" runat="server" Text="<%$ Resources:lang,ShenQingShiJian%>"></asp:Label>：
                                                                </td>
                                                                <td class="formItemBgStyle" style="text-align: left">

                                                                    <%#DataBinder.Eval(Container.DataItem, "CreateTime", "{0:yyyy/MM/dd}")%>
                                                                </td>
                                                            </tr>
                                                            <tr style="display: none;">
                                                                <td class="formItemBgStyle" style="text-align: left">
                                                                    <asp:Label ID="Label15" runat="server" Text="<%$ Resources:lang,XiangMu%>"></asp:Label>：
                                                                </td>
                                                                <td colspan="3" align="left" class="formItemBgStyle">

                                                                    <%#DataBinder.Eval(Container.DataItem, "ProjectID")%>

                                                                    <%#DataBinder.Eval(Container.DataItem, "ProjectName")%>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td class="formItemBgStyle" style="text-align: left">
                                                                    <asp:Label ID="Label45" runat="server" Text="<%$ Resources:lang,HeTongQianYueFang%>"></asp:Label>： </td>
                                                                <td class="formItemBgStyle" align="left">
                                                                    <%#DataBinder.Eval(Container.DataItem, "PartA")%>
                                                                </td>
                                                                <td class="formItemBgStyle" style="text-align: left">
                                                                    <asp:Label ID="Label23" runat="server" Text="<%$ Resources:lang,LianXiFangShi%>"></asp:Label>： </td>
                                                                <td class="formItemBgStyle" colspan="3" align="left">
                                                                    <%#DataBinder.Eval(Container.DataItem, "PartAContactInformation")%>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td class="formItemBgStyle" style="text-align: left">
                                                                    <asp:Label ID="Label103" runat="server" Text="<%$ Resources:lang,KaiHuYingHang%>"></asp:Label>：</td>
                                                                <td class="formItemBgStyle" style="text-align: left">
                                                                    <%#DataBinder.Eval(Container.DataItem, "BankName")%></td>
                                                                <td class="formItemBgStyle" style="text-align: left">
                                                                    <asp:Label ID="Label111" runat="server" Text="<%$ Resources:lang,YinHangZhangHao %>"></asp:Label>：</td>
                                                                <td class="formItemBgStyle" align="left">
                                                                    <%#DataBinder.Eval(Container.DataItem, "BankCode")%></td>
                                                            </tr>
                                                            <tr>
                                                                <td class="formItemBgStyle" style="text-align: left">
                                                                    <asp:Label ID="Label1112212" runat="server" Text="<%$ Resources:lang,HeTongFuKuanTiaoJianHeYuJiMiaoShu %>"></asp:Label>：</td>
                                                                <td colspan="3" class="formItemBgStyle" style="text-align: left">

                                                                    <%#DataBinder.Eval(Container.DataItem, "ContractPayCondition")%></td>
                                                            </tr>

                                                            <tr>
                                                                <td class="formItemBgStyle" style="text-align: left">
                                                                    <asp:Label ID="Label46" runat="server" Text="<%$ Resources:lang,YingJiaoFuJian %>"></asp:Label>： </td>
                                                                <td class="formItemBgStyle" colspan="3" align="left">
                                                                    <%#DataBinder.Eval(Container.DataItem, "Attachment")%>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td class="formItemBgStyle" style="text-align: left">
                                                                    <asp:Label ID="Label47" runat="server" Text="<%$ Resources:lang,ZhiFuFangShi %>"></asp:Label>：</td>
                                                                <td colspan="3" class="formItemBgStyle" style="text-align: left">
                                                                    <%#DataBinder.Eval(Container.DataItem, "PaymentMethod")%>

                                                                    &nbsp;&nbsp;&nbsp;&nbsp;
                                                                    <asp:Label ID="Label48" runat="server" Text="<%$ Resources:lang,LeiJiYuJiaoFaPiao %>"></asp:Label>：

                                                                     <%#DataBinder.Eval(Container.DataItem, "AleadyTotalInvoice")%>
                                                                    &nbsp;&nbsp;
                                                                    <asp:Label ID="Label10" runat="server" Text="<%$ Resources:lang,LeiJiYingJiaoFaPiao %>"></asp:Label>：
                                                                       <%#DataBinder.Eval(Container.DataItem, "ShouldTotalInvoice")%>
                                                                </td>
                                                            </tr>
                                                            <tr style="font-weight: 600;">
                                                                <td class="formItemBgStyle" style="text-align: left">
                                                                    <asp:Label ID="Label11" runat="server" Text="<%$ Resources:lang,BenChiQingKuanJinE %>"></asp:Label>：
                                                                </td>
                                                                <td colspan="3" class="formItemBgStyle" style="text-align: left;">
                                                                    <%#DataBinder.Eval(Container.DataItem, "CurrentTotalPaymentAmount")%>

                                                                          &nbsp;&nbsp;
                                                                        <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,DaXie %>"></asp:Label>：

                                                                        <%#  ShareClass.RMBCapitalization.RMBAmount(double.Parse(DataBinder.Eval(Container.DataItem, "CurrentTotalPaymentAmount").ToString()))%>

                                                                       &nbsp;&nbsp;
                                                                            <asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,BiBie%>"></asp:Label>：

                                                                            <%#DataBinder.Eval(Container.DataItem, "CurrencyType")%>
                                                                      &nbsp;&nbsp;

                                                                       <asp:Label ID="Label244" runat="server" Text="<%$ Resources:lang,BenChiXiangMuLeiJiJinE%>"></asp:Label>：

                                                                     <%# GetTotalProjectMaterialPaymentApplicantAmount(DataBinder.Eval(Container.DataItem, "PartA").ToString (),DataBinder.Eval(Container.DataItem, "ProjectID").ToString())%>

                                                                     &nbsp;&nbsp;
                                                                    <asp:Label ID="Label243" runat="server" Text="<%$ Resources:lang,YiFuKuanJinE%>"></asp:Label>：

                                                                        <%# GetProjectTotalAleadyMaterialPaymentApplicantAmount(DataBinder.Eval(Container.DataItem, "PartA").ToString (),DataBinder.Eval(Container.DataItem, "ProjectID").ToString())%>


                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td align="left" class="formItemBgStyle" style="width: 100px; height: 30px">
                                                                    <asp:Label ID="Label240" runat="server" Text="<%$ Resources:lang,ZhuangTai%>"></asp:Label>：
                                                                </td>
                                                                <td colspan="3" class="formItemBgStyle" align="left">
                                                                    <asp:Label ID="LB_Status" runat="server"></asp:Label>
                                                                </td>
                                                            </tr>

                                                            <tr>
                                                                <td class="formItemBgStyle" style="text-align: left;"></td>
                                                                <td class="formItemBgStyle" style="text-align: left" colspan="3">
                                                                    <a id="aDetailView" href='TTProjectMaterialPaymentApplicantDetailView.aspx?AOID=<%#DataBinder.Eval(Container.DataItem, "DetailAOID")%>&NoPop=YES'
                                                                        target="DetailArea">
                                                                        <asp:Label ID="Label232" runat="server" Text="<%$ Resources:lang,MingXi%>"></asp:Label></a>


                                                                    &nbsp;&nbsp;&nbsp;&nbsp;
                                                        <asp:HyperLink ID="HL_WLBusinessUpdate" runat="server" NavigateUrl='<%#"TTProjectMaterialPaymentApplicant.aspx?BusinessID=" + DataBinder.Eval(Container.DataItem, "AOID") + "&WLID=" + strWLID + "&WLStepDetailID=" + strID  %>'
                                                            Text="&lt;div&gt;&lt;img src=ImagesSkin/Update.png border=0 alt='修改' /&gt;&lt;/div&gt;" />

                                                                </td>

                                                            </tr>
                                                        </table>
                                                    </td>
                                                </tr>
                                            </table>
                                        </ItemTemplate>
                                    </asp:DataList>

                                    <asp:DataList ID="DataList17" runat="server" Height="1px" Width="700px" CellPadding="0"
                                        CellSpacing="0">
                                        <ItemTemplate>
                                            <table class="bian" border="1" style="border-collapse: collapse;" cellpadding="4"
                                                cellspacing="0">
                                                <tr>
                                                    <td colspan="6" style="width: 100%; height: 80px; font-size: xx-large; text-align: center;">
                                                        <br />
                                                        <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,LaoWuFenBaoShengQingBiao%>"></asp:Label>
                                                        <br />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="width: 10%; text-align: left">
                                                        <asp:Label ID="Label222" runat="server" Text="<%$ Resources:lang,BianHao%>"></asp:Label>：
                                                    </td>
                                                    <td style="width: 40%; text-align: left">
                                                        <%#DataBinder.Eval(Container.DataItem, "BMACode")%>
                                                    </td>
                                                    <td style="width: 10%; text-align: left">
                                                        <asp:Label ID="Label181" runat="server" Text="<%$ Resources:lang,ShenQingRen%>"></asp:Label>：
                                                    </td>
                                                    <td style="text-align: left">
                                                        <a href='TTUserInforSimple.aspx?UserCode=<%#DataBinder.Eval(Container.DataItem ,"EnterCode") %>'
                                                            target="DetailArea">
                                                            <%#DataBinder.Eval(Container.DataItem, "Application")%></a>
                                                    </td>

                                                    <td style="width: 10%; text-align: left">
                                                        <asp:Label ID="Label180" runat="server" Text="<%$ Resources:lang,ShenQingRiQi%>"></asp:Label>：
                                                    </td>
                                                    <td style="text-align: left">
                                                        <%#Convert.ToDateTime(DataBinder.Eval(Container.DataItem, "ApplicationDate")).ToString("yyyy-MM-dd")%>
                                                    </td>
                                                </tr>

                                                <tr>

                                                    <td style="width: 10%; text-align: left">
                                                        <asp:Label ID="Label179" runat="server" Text="<%$ Resources:lang,XiangMuMingCheng%>"></asp:Label>：
                                                    </td>
                                                    <td style="width: 40%; text-align: left">
                                                        <%#DataBinder.Eval(Container.DataItem, "ProjectID")%>&nbsp;&nbsp;<%#DataBinder.Eval(Container.DataItem, "Name")%></td>

                                                    <td style="width: 10%; text-align: left">
                                                        <asp:Label ID="Label206" runat="server" Text="<%$ Resources:lang,FenBaoShang%>"></asp:Label>：
                                                    </td>
                                                    <td colspan="3" style="text-align: left">
                                                        <%#DataBinder.Eval(Container.DataItem, "SupplierCode")%><%#DataBinder.Eval(Container.DataItem, "SupplierName")%>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="width: 10%; text-align: left">
                                                        <asp:Label ID="Label77" runat="server" Text="<%$ Resources:lang,GongChengDiDian%>"></asp:Label>：
                                                    </td>
                                                    <td colspan="5" style="text-align: left">
                                                        <%#DataBinder.Eval(Container.DataItem, "EngineeringAddress")%>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="text-align: left">
                                                        <asp:Label ID="Label182" runat="server" Text="<%$ Resources:lang,FenBaoNeiRong%>"></asp:Label>：
                                                    </td>
                                                    <td colspan="5" style="text-align: left">
                                                        <%#DataBinder.Eval(Container.DataItem, "Remark")%>
                                                    </td>
                                                </tr>

                                                <tr>

                                                    <td style="width: 10%; text-align: left">
                                                        <asp:Label ID="Label83" runat="server" Text="<%$ Resources:lang,GongChengShuLiang%>"></asp:Label>：
                                                    </td>
                                                    <td style="text-align: left">
                                                        <%#DataBinder.Eval(Container.DataItem, "EngineeringNUmber")%>
                                                    </td>

                                                    <td style="width: 10%; text-align: left">
                                                        <asp:Label ID="Label96" runat="server" Text="<%$ Resources:lang,JiHuaKaiGongShiJian%>"></asp:Label>：
                                                    </td>
                                                    <td style="text-align: left">
                                                        <%#Convert.ToDateTime(DataBinder.Eval(Container.DataItem, "PlanStartTime")).ToString("yyyy-MM-dd")%>
                                                    </td>
                                                    <td style="text-align: left">
                                                        <asp:Label ID="Label105" runat="server" Text="<%$ Resources:lang,ShiGongZongZhouQi%>"></asp:Label>：
                                                    </td>
                                                    <td style="text-align: left">
                                                        <%#DataBinder.Eval(Container.DataItem, "TotalDuration")%>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="width: 10%; text-align: left">
                                                        <asp:Label ID="Label116" runat="server" Text="<%$ Resources:lang,SheBeiShuLiang%>"></asp:Label>：
                                                    </td>
                                                    <td style="text-align: left">
                                                        <%#DataBinder.Eval(Container.DataItem, "DeviceNUmber")%>
                                                    </td>

                                                    <td style="width: 10%; text-align: left">
                                                        <asp:Label ID="Label120" runat="server" Text="<%$ Resources:lang,ManPower%>"></asp:Label>：
                                                    </td>
                                                    <td style="text-align: left">
                                                        <%#DataBinder.Eval(Container.DataItem, "ManHour")%>
                                                    </td>
                                                    <td style="text-align: left">
                                                        <asp:Label ID="Label127" runat="server" Text="<%$ Resources:lang,YuJiGongChengE%>"></asp:Label>：
                                                    </td>
                                                    <td style="text-align: left">
                                                        <%#DataBinder.Eval(Container.DataItem, "ExpectedAmount")%>
                                                    </td>
                                                </tr>
                                                <tr>

                                                    <td style="text-align: left">
                                                        <asp:Label ID="Label190" runat="server" Text="<%$ Resources:lang,XianChangShiGongTiaoJian%>"></asp:Label>：
                                                    </td>
                                                    <td colspan="5" style="width: 113px; text-align: left">

                                                        <%#DataBinder.Eval(Container.DataItem, "SiteCondition")%>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="text-align: left">
                                                        <asp:Label ID="Label198" runat="server" Text="<%$ Resources:lang,QTYQ%>"></asp:Label>：
                                                    </td>
                                                    <td colspan="5" style="width: 113px; text-align: left">

                                                        <%#DataBinder.Eval(Container.DataItem, "OtherComment")%>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="text-align: left">
                                                        <asp:Label ID="Label237" runat="server" Text="<%$ Resources:lang,ZhuangTai%>"></asp:Label>：
                                                    </td>
                                                    <td colspan="5" style="width: 113px; text-align: left">

                                                        <%#DataBinder.Eval(Container.DataItem, "Status")%>
                                                    </td>
                                                </tr>
                                            </table>
                                        </ItemTemplate>
                                    </asp:DataList>

                                    <asp:DataList ID="DataList32" runat="server" Width="980px" CellPadding="0" CellSpacing="0" DataKeyField="ID">
                                        <ItemTemplate>
                                            <table class="bian" border="1" style="border-collapse: collapse;" cellpadding="4"
                                                cellspacing="0">
                                                <tr>
                                                    <td colspan="6" style="width: 100%; height: 80px; font-size: xx-large; text-align: center;">
                                                        <br />
                                                        <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,LaoWuFenBaoFuKuanShengQingBiao%>"></asp:Label>
                                                        <br />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="width: 10%; text-align: left">
                                                        <asp:Label ID="Label222" runat="server" Text="<%$ Resources:lang,BianHao%>"></asp:Label>：
                                                    </td>
                                                    <td style="width: 40%; text-align: left">
                                                        <%#DataBinder.Eval(Container.DataItem, "ID")%>&nbsp;&nbsp;   <%#DataBinder.Eval(Container.DataItem, "BMACCode")%>
                                                    </td>
                                                    <td style="width: 10%; text-align: left">
                                                        <asp:Label ID="Label181" runat="server" Text="<%$ Resources:lang,ShenQingRen%>"></asp:Label>：
                                                    </td>
                                                    <td style="text-align: left">
                                                        <a href='TTUserInforSimple.aspx?UserCode=<%#DataBinder.Eval(Container.DataItem ,"EnterCode") %>'
                                                            target="DetailArea">
                                                            <%#DataBinder.Eval(Container.DataItem, "Application")%></a>
                                                    </td>

                                                    <td style="width: 13%; text-align: left">
                                                        <asp:Label ID="Label180" runat="server" Text="<%$ Resources:lang,ShenQingRiQi%>"></asp:Label>：
                                                    </td>
                                                    <td style="text-align: left">
                                                        <%#Convert.ToDateTime(DataBinder.Eval(Container.DataItem, "ApplicationDate")).ToString("yyyy-MM-dd")%>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="width: 10%; text-align: left">
                                                        <asp:Label ID="Label179" runat="server" Text="<%$ Resources:lang,XiangMuMingCheng%>"></asp:Label>：
                                                    </td>
                                                    <td style="width: 40%; text-align: left">
                                                        <%#DataBinder.Eval(Container.DataItem, "ProjectID")%>&nbsp;&nbsp;<%#DataBinder.Eval(Container.DataItem, "Name")%></td>

                                                    <td style="width: 10%; text-align: left">
                                                        <asp:Label ID="Label206" runat="server" Text="<%$ Resources:lang,FenBaoShang%>"></asp:Label>：
                                                    </td>
                                                    <td colspan="3" style="text-align: left">
                                                        <%#DataBinder.Eval(Container.DataItem, "SupplierCode")%><%#DataBinder.Eval(Container.DataItem, "SupplierName")%>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="width: 10%; text-align: left">
                                                        <asp:Label ID="Label77" runat="server" Text="<%$ Resources:lang,GongChengDiDian%>"></asp:Label>：
                                                    </td>
                                                    <td colspan="5" style="text-align: left">
                                                        <%#DataBinder.Eval(Container.DataItem, "EngineeringAddress")%>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="text-align: left">
                                                        <asp:Label ID="Label182" runat="server" Text="<%$ Resources:lang,FenBaoNeiRong%>"></asp:Label>：
                                                    </td>
                                                    <td colspan="5" style="text-align: left">
                                                        <%#DataBinder.Eval(Container.DataItem, "Remark")%>
                                                    </td>
                                                </tr>
                                                <tr>

                                                    <td style="width: 10%; text-align: left">
                                                        <asp:Label ID="Label83" runat="server" Text="<%$ Resources:lang,GongChengShuLiang%>"></asp:Label>：
                                                    </td>
                                                    <td style="text-align: left">
                                                        <%#DataBinder.Eval(Container.DataItem, "EngineeringNumber")%>
                                                    </td>

                                                    <td style="width: 10%; text-align: left">
                                                        <asp:Label ID="Label96" runat="server" Text="<%$ Resources:lang,JiHuaKaiGongShiJian%>"></asp:Label>：
                                                    </td>
                                                    <td style="text-align: left">
                                                        <%#Convert.ToDateTime(DataBinder.Eval(Container.DataItem, "PlanStartTime")).ToString("yyyy-MM-dd")%>
                                                    </td>
                                                    <td style="text-align: left">
                                                        <asp:Label ID="Label105" runat="server" Text="<%$ Resources:lang,ShiGongZongZhouQi%>"></asp:Label>：
                                                    </td>
                                                    <td style="text-align: left">
                                                        <%#DataBinder.Eval(Container.DataItem, "TotalDuration")%>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="width: 10%; text-align: left">
                                                        <asp:Label ID="Label116" runat="server" Text="<%$ Resources:lang,SheBeiShuLiang%>"></asp:Label>：
                                                    </td>
                                                    <td style="text-align: left">
                                                        <%#DataBinder.Eval(Container.DataItem, "DeviceNUmber")%>
                                                    </td>

                                                    <td style="width: 10%; text-align: left">
                                                        <asp:Label ID="Label120" runat="server" Text="<%$ Resources:lang,ManPower%>"></asp:Label>：
                                                    </td>
                                                    <td style="text-align: left">
                                                        <%#DataBinder.Eval(Container.DataItem, "ManHour")%>
                                                    </td>
                                                    <td style="text-align: left">
                                                        <asp:Label ID="Label127" runat="server" Text="<%$ Resources:lang,YuJiGongChengE%>"></asp:Label>：
                                                    </td>
                                                    <td style="text-align: left">
                                                        <%#DataBinder.Eval(Container.DataItem, "ExpectedAmount")%>
                                                    </td>
                                                </tr>
                                                <tr>

                                                    <td style="text-align: left">
                                                        <asp:Label ID="Label190" runat="server" Text="<%$ Resources:lang,XianChangShiGongTiaoJian%>"></asp:Label>：
                                                    </td>
                                                    <td colspan="5" style="width: 113px; text-align: left">

                                                        <%#DataBinder.Eval(Container.DataItem, "SiteCondition")%>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="text-align: left">
                                                        <asp:Label ID="Label198" runat="server" Text="<%$ Resources:lang,DuiLaoWuFenBaoDeQiTaYaoQiu%>"></asp:Label>：
                                                    </td>
                                                    <td colspan="5" style="width: 113px; text-align: left">

                                                        <%#DataBinder.Eval(Container.DataItem, "OtherComment")%>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="text-align: left">
                                                        <asp:Label ID="Label237" runat="server" Text="<%$ Resources:lang,ZhuangTai%>"></asp:Label>：
                                                    </td>
                                                    <td colspan="5" style="width: 113px; text-align: left">

                                                        <%#DataBinder.Eval(Container.DataItem, "Status")%>
                                                    </td>
                                                </tr>

                                                <%-- <tr style="color: #000000">

                                                    <td colspan="6" align="left">&nbsp;
                                                    </td>
                                                </tr>--%>
                                                <tr style="color: #000000">
                                                    <td colspan="6" align="center">
                                                        <b>
                                                            <asp:Label ID="Label39" runat="server" Text="<%$ Resources:lang,FuKuanXinXi%>"></asp:Label>
                                                        </b>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="width: 10%; text-align: left">
                                                        <asp:Label ID="Label215" runat="server" Text="<%$ Resources:lang,ShiJiGongShi%>"></asp:Label>：
                                                    </td>
                                                    <td style="text-align: left">
                                                        <b><%#DataBinder.Eval(Container.DataItem, "ActualManHour")%> </b>
                                                    </td>

                                                    <td style="width: 10%; text-align: left">
                                                        <asp:Label ID="Label221" runat="server" Text="<%$ Resources:lang,DanJia%>"></asp:Label>：
                                                    </td>
                                                    <td style="text-align: left">
                                                        <b><%#DataBinder.Eval(Container.DataItem, "UnitPrice")%></b>
                                                    </td>
                                                    <td style="text-align: left">
                                                        <asp:Label ID="Label226" runat="server" Text="<%$ Resources:lang,ShiJiGongChengE%>"></asp:Label>：
                                                    </td>
                                                    <td style="text-align: left">
                                                        <b><%#DataBinder.Eval(Container.DataItem, "ActualAmount")%> </b>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="width: 10%; text-align: left">
                                                        <asp:Label ID="Label238" runat="server" Text="<%$ Resources:lang,HeTongWaiYingFuKuanHeJi%>"></asp:Label>：
                                                    </td>
                                                    <td style="text-align: left">
                                                        <b><%#DataBinder.Eval(Container.DataItem, "OutContractPayAmount")%></b>
                                                    </td>

                                                    <td style="width: 10%; text-align: left">
                                                        <asp:Label ID="Label239" runat="server" Text="<%$ Resources:lang,YingKouZhanKouJinEHeJi%>"></asp:Label>：
                                                    </td>
                                                    <td colspan="3" style="text-align: left">
                                                        <b><%#DataBinder.Eval(Container.DataItem, "DeductedAmount")%> </b>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="left" style="width: 100px; height: 30px">
                                                        <asp:Label ID="Label240" runat="server" Text="<%$ Resources:lang,ZhuangTai%>"></asp:Label>：
                                                    </td>
                                                    <td colspan="3" align="left">
                                                        <asp:Label ID="LB_Status" runat="server"></asp:Label>
                                                    </td>
                                                </tr>

                                                <tr>
                                                    <td style="width: 10%; text-align: left">
                                                        <asp:Label ID="Label242" runat="server" Text="<%$ Resources:lang,BeiZhu%>"></asp:Label>：
                                                    </td>
                                                    <td colspan="5" style="text-align: left">
                                                        <%#DataBinder.Eval(Container.DataItem, "Comment")%>
                                                    </td>
                                                </tr>

                                                <tr>
                                                    <td style="width: 10%; text-align: left"></td>
                                                    <td style="width: 10%; text-align: left">
                                                        <asp:Label ID="Label241" runat="server" Text="<%$ Resources:lang,YingFuZongJi%>"></asp:Label>：
                                                    </td>

                                                    <td colspan="3" style="text-align: left">
                                                        <b><%#DataBinder.Eval(Container.DataItem, "TotalPayAmount")%>  &nbsp;&nbsp;<%#DataBinder.Eval(Container.DataItem, "CurrencyType")%></b>&nbsp;&nbsp;

                                                        &nbsp;&nbsp;
                                                        <asp:Label ID="Label11" runat="server" Text="<%$ Resources:lang,BenXiangMuLeiJiZongE%>"></asp:Label>：  <%# GetTotalBMPurchaseApplicationAmount(DataBinder.Eval(Container.DataItem, "SupplierName").ToString(),DataBinder.Eval(Container.DataItem, "ProjectID").ToString())%>

                                                        &nbsp;&nbsp;
                                                       <asp:Label ID="Label243" runat="server" Text="<%$ Resources:lang,YiFuKuanZongE%>"></asp:Label>：

                                                        <%# GetTotalAleadyBMPurchaseApplicationAmount(DataBinder.Eval(Container.DataItem, "SupplierName").ToString(),DataBinder.Eval(Container.DataItem, "ProjectID").ToString())%>
                                                    </td>


                                                </tr>
                                            </table>
                                        </ItemTemplate>
                                    </asp:DataList>

                                    <asp:DataList ID="DataList33" runat="server" Width="980px" CellPadding="0" CellSpacing="0" DataKeyField="AOID">
                                        <ItemTemplate>
                                            <table style="width: 980px;">
                                                <tr>
                                                    <td style="width: 100%; height: 80px; font-size: xx-large; text-align: center;">
                                                        <table width="100%">
                                                            <tr>
                                                                <td width="200px">
                                                                    <img src="Logo/FormLogo.png" /></td>
                                                                <td width="550px" style="font-size: xx-large; text-align: center;"
                                                                    class="auto-style1">
                                                                    <br />
                                                                    <asp:Label ID="LB_ReportName" runat="server" Text="<%$ Resources:lang,LiaoPingCaiGouFuKuanShengQing%>"></asp:Label>
                                                                    <br />
                                                                </td>
                                                                <td>&nbsp;</td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="text-align: center; width: 980px;">
                                                        <table width="98%" cellpadding="3" cellspacing="0" class="formBgStyle">
                                                            <tr>
                                                                <td class="formItemBgStyle" style="text-align: left" width="15%">
                                                                    <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,DanHao%>"></asp:Label>：
                                                                </td>
                                                                <td class="formItemBgStyle" style="width: 35%; text-align: left">
                                                                    <%#DataBinder.Eval(Container.DataItem, "AOID")%>& <%#DataBinder.Eval(Container.DataItem, "SAOName")%>
                                                                </td>
                                                                <td class="formItemBgStyle" style="width: 15%; text-align: left">
                                                                    <asp:Label ID="Label8" runat="server" Text="<%$ Resources:lang,ShengQingRen%>"></asp:Label>：
                                                                </td>
                                                                <td class="formItemBgStyle" style="text-align: left">
                                                                    <%#DataBinder.Eval(Container.DataItem, "UserName")%>
                                                                </td>
                                                            </tr>
                                                            <tr>

                                                                <td class="formItemBgStyle" style="width: 15%; text-align: left">
                                                                    <asp:Label ID="Label9" runat="server" Text="<%$ Resources:lang,ShenQingShiJian%>"></asp:Label>：
                                                                </td>
                                                                <td colspan="3" class="formItemBgStyle" style="text-align: left">

                                                                    <%#DataBinder.Eval(Container.DataItem, "CreateTime", "{0:yyyy/MM/dd}")%>
                                                                </td>
                                                            </tr>

                                                            <tr>
                                                                <td class="formItemBgStyle" style="text-align: left">
                                                                    <asp:Label ID="Label45" runat="server" Text="<%$ Resources:lang,HeTongQianYueFang%>"></asp:Label>： </td>
                                                                <td class="formItemBgStyle" align="left">
                                                                    <%#DataBinder.Eval(Container.DataItem, "PartA")%>
                                                                </td>
                                                                <td class="formItemBgStyle" style="text-align: left">
                                                                    <asp:Label ID="Label23" runat="server" Text="<%$ Resources:lang,LianXiFangShi%>"></asp:Label>： </td>
                                                                <td class="formItemBgStyle" colspan="3" align="left">
                                                                    <%#DataBinder.Eval(Container.DataItem, "PartAContactInformation")%>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td class="formItemBgStyle" style="text-align: left">
                                                                    <asp:Label ID="Label103" runat="server" Text="<%$ Resources:lang,KaiHuYingHang%>"></asp:Label>：</td>
                                                                <td class="formItemBgStyle" style="text-align: left">
                                                                    <%#DataBinder.Eval(Container.DataItem, "BankName")%></td>
                                                                <td class="formItemBgStyle" style="text-align: left">
                                                                    <asp:Label ID="Label111" runat="server" Text="<%$ Resources:lang,YinHangZhangHao%>"></asp:Label>：</td>
                                                                <td class="formItemBgStyle" align="left">
                                                                    <%#DataBinder.Eval(Container.DataItem, "BankCode")%></td>
                                                            </tr>
                                                            <tr>
                                                                <td class="formItemBgStyle" style="text-align: left">
                                                                    <asp:Label ID="Label1112212" runat="server" Text="<%$ Resources:lang,HeTongFuKuanTiaoJianHeYuJiMiaoShu%>"></asp:Label>：</td>
                                                                <td colspan="3" class="formItemBgStyle" style="text-align: left">

                                                                    <%#DataBinder.Eval(Container.DataItem, "ContractPayCondition")%></td>
                                                            </tr>

                                                            <tr>
                                                                <td class="formItemBgStyle" style="text-align: left">
                                                                    <asp:Label ID="Label46" runat="server" Text="<%$ Resources:lang,YingJiaoFuJian%>"></asp:Label>： </td>
                                                                <td class="formItemBgStyle" colspan="3" align="left">
                                                                    <%#DataBinder.Eval(Container.DataItem, "Attachment")%>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td class="formItemBgStyle" style="text-align: left">
                                                                    <asp:Label ID="Label47" runat="server" Text="<%$ Resources:lang,ZhiFuFangShi%>"></asp:Label>：</td>
                                                                <td colspan="3" class="formItemBgStyle" style="text-align: left">
                                                                    <%#DataBinder.Eval(Container.DataItem, "PaymentMethod")%>

                                                                    &nbsp;&nbsp;&nbsp;&nbsp;
                                                                    <asp:Label ID="Label48" runat="server" Text="<%$ Resources:lang,LeiJiYuJiaoFaPiao%>"></asp:Label>：

                                                                     <%#DataBinder.Eval(Container.DataItem, "AleadyTotalInvoice")%>
                                                                    &nbsp;&nbsp;
                                                                    <asp:Label ID="Label10" runat="server" Text="<%$ Resources:lang,LeiJiYingJiaoFaPiao%>"></asp:Label>：
                                                                       <%#DataBinder.Eval(Container.DataItem, "ShouldTotalInvoice")%>
                                                                </td>
                                                            </tr>
                                                            <tr style="font-weight: 600;">
                                                                <td class="formItemBgStyle" style="text-align: left">
                                                                    <asp:Label ID="Label11" runat="server" Text="<%$ Resources:lang,BenChiQingKuanJinE%>"></asp:Label>：
                                                                </td>
                                                                <td colspan="3" class="formItemBgStyle" style="text-align: left;">
                                                                    <%#DataBinder.Eval(Container.DataItem, "CurrentTotalPaymentAmount")%>

                                                                          &nbsp;&nbsp;
                                                                        <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,DaXie%>"></asp:Label>：

                                                                        <%#  ShareClass.RMBCapitalization.RMBAmount(double.Parse(DataBinder.Eval(Container.DataItem, "CurrentTotalPaymentAmount").ToString()))%>

                                                                       &nbsp;&nbsp;
                                                                            <asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,BiBie%>"></asp:Label>：

                                                                            <%#DataBinder.Eval(Container.DataItem, "CurrencyType")%>

                                                                      &nbsp;&nbsp;

                                                                       <asp:Label ID="Label244" runat="server" Text="<%$ Resources:lang,LeiJiJinE%>"></asp:Label>：

                                                                     <%# GetTotalProjectMaterialPaymentApplicantAmount(DataBinder.Eval(Container.DataItem, "PartA").ToString (),DataBinder.Eval(Container.DataItem, "ProjectID").ToString())%>

                                                                     &nbsp;&nbsp;
                                                                    <asp:Label ID="Label243" runat="server" Text="<%$ Resources:lang,YiFuKuanJinE%>"></asp:Label>：

                                                                        <%# GetProjectTotalAleadyMaterialPaymentApplicantAmount(DataBinder.Eval(Container.DataItem, "PartA").ToString (),DataBinder.Eval(Container.DataItem, "ProjectID").ToString())%>
                                                               
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td align="left" class="formItemBgStyle" style="width: 100px; height: 30px">
                                                                    <asp:Label ID="Label240" runat="server" Text="<%$ Resources:lang,ZhuangTai%>"></asp:Label>：
                                                                </td>
                                                                <td colspan="3" class="formItemBgStyle" align="left">
                                                                    <asp:Label ID="LB_Status" runat="server"></asp:Label>
                                                                </td>
                                                            </tr>
                                                            <tr>

                                                                <td class="formItemBgStyle" style="text-align: left;"></td>
                                                                <td class="formItemBgStyle" style="text-align: left;" colspan="3">
                                                                    <a id="aDetailView" href='TTProjectMaterialPaymentApplicantDetailView.aspx?AOID=<%#DataBinder.Eval(Container.DataItem, "DetailAOID")%>&NoPop=YES'
                                                                        target="DetailArea">
                                                                        <asp:Label ID="Label232" runat="server" Text="<%$ Resources:lang,MingXi%>"></asp:Label></a>

                                                                    &nbsp;&nbsp;&nbsp;&nbsp;
                                                        <asp:HyperLink ID="HL_WLBusinessUpdate" runat="server" NavigateUrl='<%#"TTSupplierMaterialPaymentApplicant.aspx?BusinessID=" + DataBinder.Eval(Container.DataItem, "AOID") + "&WLID=" + strWLID + "&WLStepDetailID=" + strID  %>'
                                                            Text="&lt;div&gt;&lt;img src=ImagesSkin/Update.png border=0 alt='修改' /&gt;&lt;/div&gt;" />


                                                                </td>

                                                            </tr>

                                                        </table>
                                                    </td>
                                                </tr>
                                            </table>
                                        </ItemTemplate>
                                    </asp:DataList>

                                    <asp:DataList ID="DataList34" runat="server" Width="980px" CellPadding="0" CellSpacing="0" DataKeyField="AOID">
                                        <ItemTemplate>
                                            <table style="width: 980px;">
                                                <tr>
                                                    <td style="width: 100%; height: 80px; font-size: xx-large; text-align: center;">
                                                        <table width="100%">
                                                            <tr>
                                                                <td width="200px">
                                                                    <img src="Logo/FormLogo.png" /></td>
                                                                <td width="550px" style="font-size: xx-large; text-align: center;"
                                                                    class="auto-style1">
                                                                    <br />
                                                                    <asp:Label ID="LB_ReportName" runat="server" Text="<%$ Resources:lang,GongYingShangZiChanCaiGouFuKuanShengQing%>"></asp:Label>
                                                                    <br />
                                                                </td>
                                                                <td>&nbsp;</td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="text-align: center; width: 980px;">
                                                        <table width="98%" cellpadding="3" cellspacing="0" class="formBgStyle">
                                                            <tr>
                                                                <td class="formItemBgStyle" style="text-align: left" width="15%">
                                                                    <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,DanHao%>"></asp:Label>：
                                                                </td>
                                                                <td class="formItemBgStyle" style="width: 35%; text-align: left">
                                                                    <%#DataBinder.Eval(Container.DataItem, "AOID")%>&nbsp;&nbsp; <%#DataBinder.Eval(Container.DataItem, "AssetAOName")%>
                                                                </td>
                                                                <td class="formItemBgStyle" style="width: 15%; text-align: left">
                                                                    <asp:Label ID="Label8" runat="server" Text="<%$ Resources:lang,ShengQingRen%>"></asp:Label>：
                                                                </td>
                                                                <td class="formItemBgStyle" style="text-align: left">
                                                                    <%#DataBinder.Eval(Container.DataItem, "UserName")%>
                                                                </td>
                                                            </tr>
                                                            <tr>

                                                                <td class="formItemBgStyle" style="width: 15%; text-align: left">
                                                                    <asp:Label ID="Label9" runat="server" Text="<%$ Resources:lang,ShenQingShiJian%>"></asp:Label>：
                                                                </td>
                                                                <td colspan="3" class="formItemBgStyle" style="text-align: left">

                                                                    <%#DataBinder.Eval(Container.DataItem, "CreateTime", "{0:yyyy/MM/dd}")%>
                                                                </td>
                                                            </tr>

                                                            <tr>
                                                                <td class="formItemBgStyle" style="text-align: left">
                                                                    <asp:Label ID="Label45" runat="server" Text="<%$ Resources:lang,HeTongQianYueFang%>"></asp:Label>： </td>
                                                                <td class="formItemBgStyle" align="left">
                                                                    <%#DataBinder.Eval(Container.DataItem, "PartA")%>
                                                                </td>
                                                                <td class="formItemBgStyle" style="text-align: left">
                                                                    <asp:Label ID="Label23" runat="server" Text="<%$ Resources:lang,LianXiFangShi%>"></asp:Label>： </td>
                                                                <td class="formItemBgStyle" colspan="3" align="left">
                                                                    <%#DataBinder.Eval(Container.DataItem, "PartAContactInformation")%>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td class="formItemBgStyle" style="text-align: left">
                                                                    <asp:Label ID="Label103" runat="server" Text="<%$ Resources:lang,KaiHuYingHang%>"></asp:Label>：</td>
                                                                <td class="formItemBgStyle" style="text-align: left">
                                                                    <%#DataBinder.Eval(Container.DataItem, "BankName")%></td>
                                                                <td class="formItemBgStyle" style="text-align: left">
                                                                    <asp:Label ID="Label111" runat="server" Text="<%$ Resources:lang,YinHangZhangHao%>"></asp:Label>：</td>
                                                                <td class="formItemBgStyle" align="left">
                                                                    <%#DataBinder.Eval(Container.DataItem, "BankCode")%></td>
                                                            </tr>
                                                            <tr>
                                                                <td class="formItemBgStyle" style="text-align: left">
                                                                    <asp:Label ID="Label1112212" runat="server" Text="<%$ Resources:lang,HeTongFuKuanTiaoJianHeYuJiMiaoShu%>"></asp:Label>：</td>
                                                                <td colspan="3" class="formItemBgStyle" style="text-align: left">

                                                                    <%#DataBinder.Eval(Container.DataItem, "ContractPayCondition")%></td>
                                                            </tr>

                                                            <tr>
                                                                <td class="formItemBgStyle" style="text-align: left">
                                                                    <asp:Label ID="Label46" runat="server" Text="<%$ Resources:lang,YingJiaoFuJian%>"></asp:Label>： </td>
                                                                <td class="formItemBgStyle" colspan="3" align="left">
                                                                    <%#DataBinder.Eval(Container.DataItem, "Attachment")%>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td class="formItemBgStyle" style="text-align: left">
                                                                    <asp:Label ID="Label47" runat="server" Text="<%$ Resources:lang,ZhiFuFangShi%>"></asp:Label>：</td>
                                                                <td colspan="3" class="formItemBgStyle" style="text-align: left">
                                                                    <%#DataBinder.Eval(Container.DataItem, "PaymentMethod")%>

                                                                    &nbsp;&nbsp;&nbsp;&nbsp;
                                                                    <asp:Label ID="Label48" runat="server" Text="<%$ Resources:lang,LeiJiYuJiaoFaPiao%>">></asp:Label>：

                                                                     <%#DataBinder.Eval(Container.DataItem, "AleadyTotalInvoice")%>
                                                                    &nbsp;&nbsp;
                                                                    <asp:Label ID="Label10" runat="server" Text="<%$ Resources:lang,LeiJiYingJiaoFaPiao%>"></asp:Label>：
                                                                       <%#DataBinder.Eval(Container.DataItem, "ShouldTotalInvoice")%>
                                                                </td>
                                                            </tr>
                                                            <tr style="font-weight: 600;">
                                                                <td class="formItemBgStyle" style="text-align: left">
                                                                    <asp:Label ID="Label11" runat="server" Text="<%$ Resources:lang,BenChiQingKuanJinE%>"></asp:Label>：
                                                                </td>
                                                                <td colspan="3" class="formItemBgStyle" style="text-align: left;">
                                                                    <%#DataBinder.Eval(Container.DataItem, "CurrentTotalPaymentAmount")%>

                                                                          &nbsp;&nbsp;
                                                                        <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,DaXie%>"></asp:Label>：

                                                                        <%#  ShareClass.RMBCapitalization.RMBAmount(double.Parse(DataBinder.Eval(Container.DataItem, "CurrentTotalPaymentAmount").ToString()))%>

                                                                       &nbsp;&nbsp;
                                                                            <asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,BiBie%>"></asp:Label>：

                                                                            <%#DataBinder.Eval(Container.DataItem, "CurrencyType")%>


                                                                         &nbsp;&nbsp;

                                                                       <asp:Label ID="Label244" runat="server" Text="<%$ Resources:lang,LeiJiJinE%>"></asp:Label>：

                                                                     <%# GetSupplierAssetAleadyMaterialPaymentApplicantAmount(DataBinder.Eval(Container.DataItem, "PartA").ToString (),DataBinder.Eval(Container.DataItem, "ProjectID").ToString())%>

                                                                     &nbsp;&nbsp;
                                                                    <asp:Label ID="Label243" runat="server" Text="<%$ Resources:lang,YiFuKuanJinE%>"></asp:Label>：

                                                                        <%# GetTotalSupplierAssetPaymentApplicantAmount(DataBinder.Eval(Container.DataItem, "PartA").ToString (),DataBinder.Eval(Container.DataItem, "ProjectID").ToString())%>
                                                               
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td align="left" class="formItemBgStyle" style="width: 100px; height: 30px">
                                                                    <asp:Label ID="Label240" runat="server" Text="<%$ Resources:lang,ZhuangTai%>"></asp:Label>：
                                                                </td>
                                                                <td colspan="3" class="formItemBgStyle" align="left">
                                                                    <asp:Label ID="LB_Status" runat="server"></asp:Label>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td class="formItemBgStyle" style="text-align: left;"></td>
                                                                <td class="formItemBgStyle" style="text-align: left;" colspan="3">
                                                                    <a id="aDetailView" href='TTSupplierAssetPaymentApplicantDetailView.aspx?AOID=<%#DataBinder.Eval(Container.DataItem, "DetailAOID")%>&NoPop=YES'
                                                                        target="DetailArea">
                                                                        <asp:Label ID="Label232" runat="server" Text="<%$ Resources:lang,MingXi%>"></asp:Label></a>

                                                                    &nbsp;&nbsp;&nbsp;&nbsp;
                                                                    <asp:HyperLink ID="HL_WLBusinessUpdate" runat="server" NavigateUrl='<%#"TTSupplierAssetPaymentApplicant.aspx?BusinessID=" + DataBinder.Eval(Container.DataItem, "AOID") + "&WLID=" + strWLID + "&WLStepDetailID=" + strID  %>'
                                                                        Text="&lt;div&gt;&lt;img src=ImagesSkin/Update.png border=0 alt='修改' /&gt;&lt;/div&gt;" />


                                                                </td>


                                                            </tr>
                                                        </table>
                                                    </td>
                                                </tr>
                                            </table>
                                        </ItemTemplate>
                                    </asp:DataList>

                                    <asp:DataList ID="DataList35" runat="server" Width="980px" CellPadding="0" CellSpacing="0" DataKeyField="ID">
                                        <ItemTemplate>
                                            <table style="width: 980px;">
                                                <tr>
                                                    <td style="text-align: center; width: 980px;">
                                                        <table width="98%" cellpadding="3" cellspacing="0" class="formBgStyle">
                                                            <tr>
                                                                <td class="formItemBgStyle" style="text-align: left" width="15%">
                                                                    <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,DanHao%>"></asp:Label>：
                                                                </td>
                                                                <td class="formItemBgStyle" style="width: 35%; text-align: left">
                                                                    <%#DataBinder.Eval(Container.DataItem, "ID")%>&nbsp;&nbsp; <%#DataBinder.Eval(Container.DataItem, "VisaName")%>
                                                                </td>
                                                                <td class="formItemBgStyle" style="width: 15%; text-align: left">
                                                                    <asp:Label ID="Label8" runat="server" Text="签证人"></asp:Label>：
                                                                </td>
                                                                <td class="formItemBgStyle" style="text-align: left">
                                                                    <%#DataBinder.Eval(Container.DataItem, "VisaSignMan")%>
                                                                </td>
                                                            </tr>
                                                            <tr>

                                                                <td class="formItemBgStyle" style="width: 15%; text-align: left">
                                                                    <asp:Label ID="Label9" runat="server" Text="<%$ Resources:lang,ShiJian%>"></asp:Label>：
                                                                </td>
                                                                <td colspan="3" class="formItemBgStyle" style="text-align: left">
                                                                    <%#DataBinder.Eval(Container.DataItem, "VisaSignTime", "{0:yyyy/MM/dd}")%>
                                                                </td>
                                                            </tr>

                                                            <tr>
                                                                <td class="formItemBgStyle" style="text-align: left">
                                                                    <asp:Label ID="Label45" runat="server" Text="金额"></asp:Label>： </td>
                                                                <td class="formItemBgStyle" align="left">
                                                                    <%#DataBinder.Eval(Container.DataItem, "VisaAmount")%>
                                                                </td>
                                                                <td class="formItemBgStyle" style="text-align: left">
                                                                    <asp:Label ID="Label23" runat="server" Text="币别"></asp:Label>： </td>
                                                                <td class="formItemBgStyle" colspan="3" align="left">
                                                                    <%#DataBinder.Eval(Container.DataItem, "CurrencyType")%>
                                                                </td>
                                                            </tr>

                                                            <tr>
                                                                <td class="formItemBgStyle" style="text-align: left">
                                                                    <asp:Label ID="Label1112212" runat="server" Text="备注"></asp:Label>：</td>
                                                                <td colspan="3" class="formItemBgStyle" style="text-align: left">

                                                                    <%#DataBinder.Eval(Container.DataItem, "Comment")%></td>
                                                            </tr>

                                                            <tr>
                                                                <td class="formItemBgStyle" style="text-align: left">
                                                                    <asp:Label ID="Label46" runat="server" Text="<%$ Resources:lang,ZhuangTai%>"></asp:Label>： </td>
                                                                <td class="formItemBgStyle" colspan="3" align="left">
                                                                    <%#DataBinder.Eval(Container.DataItem, "Status")%>
                                                                </td>
                                                            </tr>

                                                            <tr style="font-weight: 600;">
                                                                <td class="formItemBgStyle" style="text-align: left">
                                                                    <asp:Label ID="Label11" runat="server" Text="关联项目"></asp:Label>：
                                                                </td>
                                                                <td colspan="2" class="formItemBgStyle" style="text-align: left;">
                                                                    <%#DataBinder.Eval(Container.DataItem, "ProjectID")%>
                                                                    <asp:Label ID="LB_ProjectName" runat="server"></asp:Label>
                                                                    &nbsp;&nbsp;
                                                                    <asp:Label ID="Label2" runat="server" Text="关联合同应付计划"></asp:Label>：
                                                                    <%#DataBinder.Eval(Container.DataItem, "ConstractPayableID")%>
                                                                    <asp:Label ID="LB_ConstractPayablePlanName" runat="server"></asp:Label>
                                                                </td>
                                                                <td class="formItemBgStyle" style="text-align: left;">
                                                                    <a href='TTConstractPayableVisaDetailView.aspx?VisaID=<%#DataBinder.Eval(Container.DataItem, "ID")%>&NoPop=YES'
                                                                        target="DetailArea">
                                                                        <asp:Label ID="Label232" runat="server" Text="<%$ Resources:lang,MingXi%>"></asp:Label></a>
                                                                </td>
                                                            </tr>
                                                            <tr style="font-weight: 600;">
                                                                <td class="formItemBgStyle" style="text-align: left">
                                                                    <asp:Label ID="Label56" runat="server" Text="相关影响"></asp:Label>：
                                                                </td>
                                                                <td colspan="3" class="formItemBgStyle" style="text-align: left;">
                                                                    <asp:TextBox ID="TB_RelatedImpact" TextMode="MultiLine" Style="width: 99%; height: 80px;" runat="server"> </asp:TextBox>
                                                                    <asp:Button ID="BT_SaveImpact" CommandName="SaveImpact" CssClass="inpu" runat="server" Text="<%$ Resources:lang,BaoCun%>" />

                                                                </td>

                                                            </tr>
                                                            <tr style="font-weight: 600;">
                                                                <td class="formItemBgStyle" style="text-align: left">
                                                                    <asp:Label ID="Label245" runat="server" Text="处理结论"></asp:Label>：
                                                                </td>
                                                                <td colspan="3" class="formItemBgStyle" style="text-align: left;">
                                                                    <asp:TextBox ID="TB_RelatedResult" TextMode="MultiLine" Style="width: 99%; height: 80px;" runat="server"> </asp:TextBox>
                                                                    <asp:Button ID="BT_SaveResult" CommandName="SaveResult" CssClass="inpu" runat="server" Text="<%$ Resources:lang,BaoCun%>" />

                                                                </td>

                                                            </tr>
                                                            <tr>
                                                                <td align="left" class="formItemBgStyle" style="width: 100px; height: 30px">
                                                                    <asp:Label ID="Label240" runat="server" Text="<%$ Resources:lang,ZhuangTai%>"></asp:Label>：
                                                                </td>
                                                                <td colspan="3" class="formItemBgStyle" align="left">
                                                                    <asp:Label ID="LB_Status" runat="server"></asp:Label>
                                                                </td>
                                                            </tr>

                                                            <tr>
                                                                <td align="right" class="formItemBgStyle"></td>
                                                                <td colspan="3" class="formItemBgStyle" align="left">
                                                                    <a id="aDetailView" href='TTConstractPayableVisaDetailView.aspx?VisaID=<%#DataBinder.Eval(Container.DataItem, "DetailVisaID")%>&NoPop=YES'
                                                                        target="DetailArea">
                                                                        <asp:Label ID="Label247" runat="server" Text="<%$ Resources:lang,MingXi%>"></asp:Label></a>

                                                                    &nbsp;&nbsp;&nbsp;&nbsp;
                                                                    <asp:HyperLink ID="HL_WLBusinessUpdate" runat="server" NavigateUrl='<%#"TTConstractPayableVisaEdit.aspx?BusinessID=" + DataBinder.Eval(Container.DataItem, "ID") + "&WLID=" + strWLID + "&WLStepDetailID=" + strID  %>'
                                                                        Text="&lt;div&gt;&lt;img src=ImagesSkin/Update.png border=0 alt='修改' /&gt;&lt;/div&gt;" />

                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                </tr>
                                            </table>
                                        </ItemTemplate>
                                    </asp:DataList>


                                    <asp:DataList ID="DataList42" runat="server" Width="700px" CellPadding="0" CellSpacing="0">
                                        <ItemTemplate>
                                            <table align="center" cellpadding="3" cellspacing="0" class="formBgStyle" style="width: 98%;">
                                                <tr>
                                                    <td class="formItemBgStyle" style="text-align: right;" width="15%">

                                                        <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,DanHao%>"></asp:Label>
                                                        ： </td>
                                                    <td align="left" class="formItemBgStyle" style="width: 35%">

                                                        <%# DataBinder.Eval(Container.DataItem,"COOName") %>
                                                    </td>
                                                    <td class="formItemBgStyle" style="text-align: right;" width="20%">
                                                        <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,LeiXing%>"></asp:Label>
                                                        ： </td>
                                                    <td align="left" class="formItemBgStyle">
                                                        <%# DataBinder.Eval(Container.DataItem,"Type") %>
                                                                   
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="formItemBgStyle" style="text-align: right;">
                                                        <asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,ShenQingYuanYin%>"></asp:Label>
                                                        ： </td>
                                                    <td align="left" class="formItemBgStyle" colspan="3">
                                                        <%# DataBinder.Eval(Container.DataItem,"ApplyReason") %>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="formItemBgStyle" style="text-align: right;">
                                                        <asp:Label ID="Label8" runat="server" Text="<%$ Resources:lang,ZongJinE%>"></asp:Label>
                                                        ：</td>
                                                    <td align="left" class="formItemBgStyle">
                                                        <%# DataBinder.Eval(Container.DataItem,"Amount") %>
                                                                   
                                                    </td>
                                                    <td align="right" class="formItemBgStyle">
                                                        <asp:Label ID="Label9" runat="server" Text="<%$ Resources:lang,BiBie%>"></asp:Label>
                                                        ：</td>
                                                    <td align="left" class="formItemBgStyle">
                                                        <%# DataBinder.Eval(Container.DataItem,"CurrencyType") %>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="formItemBgStyle" style="text-align: right;">
                                                        <asp:Label ID="Label10" runat="server" Text="<%$ Resources:lang,ShenQingShiJian%>"></asp:Label>
                                                        ： </td>
                                                    <td align="left" class="formItemBgStyle">
                                                        <%# DataBinder.Eval(Container.DataItem,"ApplyTime") %>
                                                    </td>
                                                    <td align="right" class="formItemBgStyle">
                                                        <asp:Label ID="Label11" runat="server" Text="<%$ Resources:lang,YaoQiuWanChengShiJian%>"></asp:Label>
                                                        ： </td>
                                                    <td align="left" class="formItemBgStyle">
                                                        <%# DataBinder.Eval(Container.DataItem,"FinishTime") %>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="right" class="formItemBgStyle">
                                                        <asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,ShenQingRen%>"></asp:Label>
                                                        ： </td>
                                                    <td align="left" class="formItemBgStyle">
                                                        <%# DataBinder.Eval(Container.DataItem,"ApplicantCode") %> <%# DataBinder.Eval(Container.DataItem,"ApplicantName") %>
                                                    </td>
                                                    <td class="formItemBgStyle" style="text-align: right;">
                                                        <asp:Label ID="Label79" runat="server" Text="<%$ Resources:lang,ZhuangTai%>"></asp:Label>
                                                        ： </td>
                                                    <td align="left" class="formItemBgStyle">
                                                        <%# DataBinder.Eval(Container.DataItem,"Status") %>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="right" class="formItemBgStyle"></td>
                                                    <td colspan="3" class="formItemBgStyle" align="left">
                                                        <a id="aDetailView" href='TTGoodsCheckOutNoticeOrderDetailView.aspx?COOID=<%#DataBinder.Eval(Container.DataItem, "DetailCOOID")%>&NoPop=YES'
                                                            target="DetailArea">
                                                            <asp:Label ID="Label232" runat="server" Text="<%$ Resources:lang,MingXi%>"></asp:Label></a>

                                                        &nbsp;&nbsp;&nbsp;&nbsp;
                                                        <asp:HyperLink ID="HL_WLBusinessUpdate" runat="server" NavigateUrl='<%#"TTGoodsCheckOutNoticeOrder.aspx?BusinessID=" + DataBinder.Eval(Container.DataItem, "COOID") + "&WLID=" + strWLID + "&WLStepDetailID=" + strID  %>'
                                                            Text="&lt;div&gt;&lt;img src=ImagesSkin/Update.png border=0 alt='修改' /&gt;&lt;/div&gt;" />

                                                    </td>
                                                </tr>
                                            </table>
                                        </ItemTemplate>
                                        <ItemStyle CssClass="itemStyle" />
                                        <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                    </asp:DataList>


                                        <asp:DataList ID="DataList44" runat="server" Width="850px" CellPadding="0" CellSpacing="0">
                                        <ItemTemplate>
                                            <table style="width: 100%;" cellpadding="0" cellspacing="0">
                                                <tr>
                                                    <td valign="middle" style="width: 50%; border-right: solid 1px #D8D8D8; padding: 2px 2px 2px 2px;">
                                                        <table class="formBgStyle" cellpadding="3" cellspacing="0" style="width: 98%; margin-top: 2px; background-color: white;"
                                                            align="center">
                                                            <tr>
                                                                <td style="text-align: left; width: 15%;">
                                                                    <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,ZhaoBiaoBianHao%>"></asp:Label>：
                                                                </td>
                                                                <td align="left">

                                                                    <%# DataBinder.Eval(Container.DataItem,"TenderCode") %>
                                                         
                                                                </td>
                                                                <td style="text-align: left; width: 10%;">
                                                                    <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,XiangMuMingCheng%>"></asp:Label>：</td>
                                                                <td align="left" style="width: 30%;">
                                                                    <%# DataBinder.Eval(Container.DataItem,"ProjectName") %>
                                                                </td>
                                                                <td style="text-align: left;">
                                                                    <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,HeTongHao%>"></asp:Label>：</td>
                                                                <td align="left" colspan="2">

                                                                    <%# DataBinder.Eval(Container.DataItem,"CompactCode") %>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td style="text-align: left;">
                                                                    <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,ZhaoBianDaiLi%>"></asp:Label>：</td>
                                                                <td align="left" colspan="3">
                                                                    <%# DataBinder.Eval(Container.DataItem,"BiddingAgent") %>
                                                                </td>
                                                                <td style="text-align: left;">
                                                                    <asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,LianXiDianHua%>"></asp:Label>：</td>
                                                                <td align="left">
                                                                    <%# DataBinder.Eval(Container.DataItem,"BiddingAgentPhone") %>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td style="text-align: left;">
                                                                    <asp:Label ID="Label7" runat="server" Text="招标人"></asp:Label>：</td>
                                                                <td align="left" colspan="3">

                                                                    <%# DataBinder.Eval(Container.DataItem,"UserCode") %>
                                                                </td>
                                                                <td style="text-align: left; width: 15%;">
                                                                    <asp:Label ID="Label8" runat="server" Text="<%$ Resources:lang,LianXiDianHua%>"></asp:Label>：</td>
                                                                <td align="left">

                                                                    <%# DataBinder.Eval(Container.DataItem,"UserCodePhone") %>
                                                                </td>
                                                            </tr>
                                                            <tr style="display: none;">

                                                                <td style="text-align: left;">
                                                                    <asp:Label ID="Label44" runat="server" Text="<%$ Resources:lang,XiaoShou%>"></asp:Label>：</td>
                                                                <td align="left" colspan="3">

                                                                    <%# DataBinder.Eval(Container.DataItem,"SalesCode") %>
                                                                </td>
                                                                <td style="text-align: left;">
                                                                    <asp:Label ID="Label45" runat="server" Text="<%$ Resources:lang,LianXiDianHua%>"></asp:Label>：</td>
                                                                <td align="left">
                                                                    <%# DataBinder.Eval(Container.DataItem,"SalesCodePhone") %>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td style="text-align: left;">
                                                                    <asp:Label ID="Label9" runat="server" Text="项目经理"></asp:Label>：</td>
                                                                <td align="right" colspan="2">
                                                                    <table width="100%">
                                                                        <tr>
                                                                            <td style="text-align: right; width: 30%;">

                                                                                <%# DataBinder.Eval(Container.DataItem,"PMCode") %>
                                                                            </td>
                                                                            <td style="text-align: right; width: 50%;">
                                                                                <%# DataBinder.Eval(Container.DataItem,"PMName") %>
                                                                            </td>
                                                                        </tr>
                                                                    </table>
                                                                </td>
                                                                <td style="text-align: left;">
                                                                    <asp:Label ID="Label10" runat="server" Text="技术负责人"></asp:Label>：</td>
                                                                <td colspan="2" style="text-align: left;">
                                                                    <table>
                                                                        <tr>
                                                                            <td>
                                                                                <%# DataBinder.Eval(Container.DataItem,"TechnicalDirectorCode") %>
                                                                            </td>
                                                                            <td>
                                                                                <%# DataBinder.Eval(Container.DataItem,"TechnicalDirectorName") %>

                                                                            </td>
                                                                        </tr>
                                                                    </table>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td style="text-align: left;">
                                                                    <asp:Label ID="Label46" runat="server" Text="项目经办人"></asp:Label>：</td>
                                                                <td align="right" colspan="2">
                                                                    <table width="100%">
                                                                        <tr>
                                                                            <td style="text-align: right; width: 30%;">

                                                                                <%# DataBinder.Eval(Container.DataItem,"PrincipalCode") %>
                                                                            </td>
                                                                            <td style="text-align: right; width: 50%;">
                                                                                <%# DataBinder.Eval(Container.DataItem,"PrincipalName") %>
                                                                            </td>
                                                                        </tr>
                                                                    </table>
                                                                </td>
                                                                <td style="text-align: left;">
                                                                    <asp:Label ID="Label49" runat="server" Text="内外属性"></asp:Label>：</td>
                                                                <td align="left" colspan="2">


                                                                    <%# DataBinder.Eval(Container.DataItem,"InternalandExternal") %>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td style="text-align: left;">
                                                                    <asp:Label ID="Label11" runat="server" Text="<%$ Resources:lang,BiaoShuGouMaiRiQi%>"></asp:Label>：</td>
                                                                <td align="left">

                                                                    <%# DataBinder.Eval(Container.DataItem,"TenderBuyTime") %>
                                                                </td>
                                                                <td style="text-align: left;">
                                                                    <asp:Label ID="Label12" runat="server" Text="<%$ Resources:lang,TiQianYuJingTianShu%>"></asp:Label>：</td>
                                                                <td align="left">

                                                                    <%# DataBinder.Eval(Container.DataItem,"TenderBuyDay") %>
                                                                </td>
                                                                <td align="left" colspan="3">

                                                                    <%# DataBinder.Eval(Container.DataItem,"IsTender") %>

                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td style="text-align: left;">
                                                                    <asp:Label ID="Label47" runat="server" Text="投标报价"></asp:Label>：</td>
                                                                <td align="left" colspan="3">

                                                                    <%# DataBinder.Eval(Container.DataItem,"BiddingPrice") %>
                                                                </td>
                                                                <td style="text-align: left;">
                                                                    <asp:Label ID="Label48" runat="server" Text="控制价"></asp:Label>：</td>
                                                                <td align="left" colspan="3">

                                                                    <%# DataBinder.Eval(Container.DataItem,"ControlPrice") %>
                                                       
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td style="text-align: left;">
                                                                    <asp:Label ID="Label14" runat="server" Text="<%$ Resources:lang,BaoZhengJin%>"></asp:Label>：</td>
                                                                <td align="left">

                                                                    <%# DataBinder.Eval(Container.DataItem,"Margin") %>
                                                        
                                                                </td>
                                                                <td style="text-align: left;">
                                                                    <asp:Label ID="Label15" runat="server" Text="<%$ Resources:lang,BaoZhengJinZhiFuRiQi%>"></asp:Label>：</td>
                                                                <td align="left">

                                                                    <%# DataBinder.Eval(Container.DataItem,"MarginTime") %>
                                                       
                                                                </td>
                                                                <td align="left" colspan="3">
                                                                    <asp:Label ID="Label16" runat="server" Text="<%$ Resources:lang,TiQianYuJingTianShu%>"></asp:Label>：

                                                         <%# DataBinder.Eval(Container.DataItem,"MarginDay") %>

                                                                    <%# DataBinder.Eval(Container.DataItem,"IsMargin") %>

                                                                    <asp:Label ID="Label17" runat="server" Text="<%$ Resources:lang,ZhuangTaiShiFouWanCheng%>"></asp:Label>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td style="text-align: left;">
                                                                    <asp:Label ID="Label18" runat="server" Text="<%$ Resources:lang,BaoZhengJinShouHuiRiQi%>"></asp:Label>：</td>
                                                                <td align="left">

                                                                    <%# DataBinder.Eval(Container.DataItem,"ReceiveMarginTime") %>
                                                    
                                                                </td>
                                                                <td style="text-align: left;">
                                                                    <asp:Label ID="Label19" runat="server" Text="<%$ Resources:lang,BaoZhengJinShouHuiShu%>"></asp:Label>：</td>
                                                                <td align="left">
                                                                    <%# DataBinder.Eval(Container.DataItem,"ReceiveMargin") %>
                                                                </td>

                                                                <td align="left" colspan="3">
                                                                    <asp:Label ID="Label20" runat="server" Text="<%$ Resources:lang,TiQianYuJingTianShu%>"></asp:Label>：

                                                           <%# DataBinder.Eval(Container.DataItem,"ReceiveMarginDay") %>

                                                                    <%# DataBinder.Eval(Container.DataItem,"IsReceiveMargin") %>

                                                                    <asp:Label ID="Label21" runat="server" Text="<%$ Resources:lang,ZhuangTaiShiFouWanCheng%>"></asp:Label>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td style="text-align: left;">
                                                                    <asp:Label ID="Label22" runat="server" Text="<%$ Resources:lang,KaiBiaoRiQi%>"></asp:Label>：</td>
                                                                <td align="left">

                                                                    <%# DataBinder.Eval(Container.DataItem,"BidOpeningDate") %>
                                                                </td>
                                                                <td style="text-align: left;">
                                                                    <asp:Label ID="Label23" runat="server" Text="<%$ Resources:lang,TiQianYuJingTianShu%>"></asp:Label>：</td>
                                                                <td align="left">

                                                                    <%# DataBinder.Eval(Container.DataItem,"BidOpeningDay") %>
                                                                </td>
                                                                <td align="left" colspan="3">

                                                                    <%# DataBinder.Eval(Container.DataItem,"IsBidOpening") %>
                                                                    <asp:Label ID="Label24" runat="server" Text="<%$ Resources:lang,ZhuangTaiShiFouWanCheng%>"></asp:Label>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td style="text-align: left;">
                                                                    <asp:Label ID="Label25" runat="server" Text="<%$ Resources:lang,ZBFJNRQ%>"></asp:Label>：</td>
                                                                <td align="left">

                                                                    <%# DataBinder.Eval(Container.DataItem,"WinningFeeDate") %>
                                                       
                                                                </td>
                                                                <td style="text-align: left;">
                                                                    <asp:Label ID="Label26" runat="server" Text="<%$ Resources:lang,TiQianYuJingTianShu%>"></asp:Label>：</td>
                                                                <td align="left">
                                                                    <%# DataBinder.Eval(Container.DataItem,"WinningFeeDay") %>
                                                       
                                                      
                                                                </td>
                                                                <td align="left" colspan="3">

                                                                    <%# DataBinder.Eval(Container.DataItem,"IsWinningFee") %>
                                                                    <asp:Label ID="Label27" runat="server" Text="<%$ Resources:lang,ZhuangTaiShiFouWanCheng%>"></asp:Label>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td style="text-align: left;">
                                                                    <asp:Label ID="Label28" runat="server" Text="项目所属专业"></asp:Label>：</td>
                                                                <td colspan="6" align="left" class="formItemBgStyle">

                                                                    <%# DataBinder.Eval(Container.DataItem,"TenderContent") %>
                                                       
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td style="text-align: left;">
                                                                    <asp:Label ID="Label29" runat="server" Text="<%$ Resources:lang,BeiZhu%>"></asp:Label>：</td>
                                                                <td align="left" class="formItemBgStyle" colspan="6">

                                                                    <%# DataBinder.Eval(Container.DataItem,"Remarks") %>
                                                                </td>
                                                            </tr>

                                                            <tr>
                                                                <td align="right" class="formItemBgStyle"></td>
                                                                <td colspan="3" class="formItemBgStyle" align="left">

                                                                    <asp:HyperLink ID="HL_WLBusinessUpdate" runat="server" NavigateUrl='<%#"TTTenderList.aspx?BusinessID=" + DataBinder.Eval(Container.DataItem, "ID") + "&WLID=" + strWLID + "&WLStepDetailID=" + strID  %>'
                                                                        Text="&lt;div&gt;&lt;img src=ImagesSkin/Update.png border=0 alt='修改' /&gt;&lt;/div&gt;" />

                                                                </td>
                                                            </tr>

                                                        </table>
                                                    </td>
                                                </tr>
                                            </table>
                                        </ItemTemplate>
                                    </asp:DataList>


                                </td>
                            </tr>

                        </table>
                        <div style="width: 100%; text-align: left; padding: 5px 5px 5px 5px;">
                            <iframe id="DetailArea" name="DetailArea" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" width="1000px" onload="iFrameHeight()"></iframe>
                        </div>
                        <br />
                        <asp:Label ID="LB_WLID" runat="server" Style="display: none;"></asp:Label>
                        <asp:Label ID="LB_Owner" runat="server" Style="display: none;"></asp:Label>
                        <asp:Literal ID="LIT_AttachUserJSCode" runat="server"></asp:Literal>


                    </div>

                    <!--endprint1-->

                    <div style="width: 100%; text-align: left; padding: 5px 5px 5px 5px;">
                        <table width="100%">
                            <tr>
                                <td align="left" style="padding-left: 20px;">
                                    <a href="#" onclick="preview2()">
                                        <img src="ImagesSkin/print.gif" alt="打印" border="0" /><asp:Label ID="Label70" runat="server" Text="<%$ Resources:lang,JiLu%>"></asp:Label>
                                    </a>
                                </td>
                            </tr>
                        </table>
                        <!--startprint2-->
                        <table width="100%">
                            <tr>
                                <td align="left" style="padding-left: 10px;">
                                    <table width="700px" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                        <tr>
                                            <td width="7">
                                                <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" />
                                            </td>
                                            <td>
                                                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                    <tr>
                                                        <td width="10%" align="Left">
                                                            <strong>
                                                                <asp:Label ID="Label144556" runat="server" Text="<%$ Resources:lang,ID%>"></asp:Label>
                                                            </strong>
                                                        </td>

                                                        <td width="25%" align="Left">
                                                            <strong>
                                                                <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,FuJian%>"></asp:Label>
                                                            </strong>
                                                        </td>

                                                        <td width="10%" align="Left">
                                                            <strong>
                                                                <asp:Label ID="Label855635456" runat="server" Text="<%$ Resources:lang,ShangChuanZhe%>"></asp:Label>
                                                            </strong>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                            <td width="6" align="right">
                                                <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" />
                                            </td>
                                        </tr>
                                    </table>
                                    <asp:DataGrid ID="DataGrid2" runat="server" AutoGenerateColumns="False" CellPadding="4"
                                        GridLines="None" ForeColor="#333333" Height="1px" Width="700px" ShowHeader="False">
                                        <AlternatingItemStyle BackColor="White"></AlternatingItemStyle>
                                        <Columns>
                                            <asp:BoundColumn DataField="DocID" HeaderText="序号">
                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="left" Width="10%" />
                                            </asp:BoundColumn>

                                            <asp:HyperLinkColumn DataNavigateUrlField="Address" DataNavigateUrlFormatString="{0}"
                                                DataTextField="DocName" Target="downFrame" HeaderText="文件名">
                                                <ItemStyle HorizontalAlign="Left" Width="25%" CssClass="itemBorder"></ItemStyle>
                                            </asp:HyperLinkColumn>

                                            <asp:BoundColumn DataField="UploadManName" HeaderText="上传者">
                                                <ItemStyle HorizontalAlign="Left" Width="10%" CssClass="itemBorder"></ItemStyle>
                                            </asp:BoundColumn>
                                        </Columns>
                                        <EditItemStyle BackColor="#2461BF"></EditItemStyle>
                                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White"></FooterStyle>
                                        <ItemStyle CssClass="itemStyle"></ItemStyle>
                                        <PagerStyle HorizontalAlign="Center"></PagerStyle>
                                        <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333"></SelectedItemStyle>
                                    </asp:DataGrid>
                                    <hr />
                                    <a onclick="javascript:changeProjectDocDataGridVisible();">--Other Doc（<asp:Label ID="LB_ProjectDocNumber" runat="server"></asp:Label>）--</a>
                                    <table width="100%">
                                        <tr id="TR_OtherDoc" style="display: none;">
                                            <td align="left">
                                                <asp:DataGrid ID="DataGrid3" runat="server" AutoGenerateColumns="False" CellPadding="4"
                                                    GridLines="None" ForeColor="#333333" Height="1px" Width="700px" ShowHeader="False">
                                                    <AlternatingItemStyle BackColor="White"></AlternatingItemStyle>
                                                    <Columns>

                                                        <asp:BoundColumn DataField="DocID" HeaderText="序号">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="left" Width="10%" />
                                                        </asp:BoundColumn>

                                                        <asp:HyperLinkColumn DataNavigateUrlField="Address" DataNavigateUrlFormatString="{0}"
                                                            DataTextField="DocName" Target="downFrame" HeaderText="文件名">
                                                            <ItemStyle HorizontalAlign="Left" Width="25%" CssClass="itemBorder"></ItemStyle>
                                                        </asp:HyperLinkColumn>

                                                        <asp:BoundColumn DataField="UploadManName" HeaderText="上传者">
                                                            <ItemStyle HorizontalAlign="Left" Width="10%" CssClass="itemBorder"></ItemStyle>
                                                        </asp:BoundColumn>
                                                    </Columns>
                                                    <EditItemStyle BackColor="#2461BF"></EditItemStyle>
                                                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White"></FooterStyle>
                                                    <ItemStyle CssClass="itemStyle"></ItemStyle>
                                                    <PagerStyle HorizontalAlign="Center"></PagerStyle>
                                                    <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333"></SelectedItemStyle>
                                                </asp:DataGrid>

                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="left">
                                                <br />
                                                <br />
                                                <strong>---<asp:Label ID="Label9235636" runat="server" Text="<%$ Resources:lang,ShenPiJiLu%>"></asp:Label>---<asp:HyperLink ID="HL_ParentWorkflowApproveRecord" runat="server" Text="<%$ Resources:lang,GuanlianHuLiuCheng%>"></asp:HyperLink>
                                                </strong>
                                                <br />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="left">
                                                <asp:DataList ID="DataList29" runat="server" CellPadding="4" ForeColor="#333333" Width="800px">
                                                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                                    <ItemStyle CssClass="itemStyle" />
                                                    <SelectedItemStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                                    <ItemTemplate>
                                                        <table style="width: 100%; table-layout: fixed;">
                                                            <tr>
                                                                <td align="left" style="color: Blue; font-style: italic; text-decoration: none; width: 300px;">
                                                                    <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,BuZhou%>"></asp:Label>:
                                                                    <%# DataBinder.Eval(Container.DataItem,"SortNumber") %>&nbsp;<%# DataBinder.Eval(Container.DataItem,"StepName") %></td>
                                                                <td align="left" style="width: 35%; color: Blue; font-style: italic; text-decoration: none;">
                                                                    <a href='TTUserInforSimple.aspx?UserCode=<%# DataBinder.Eval(Container.DataItem,"OperatorCode") %>' target="_blank" style="text-decoration: none;"><%# DataBinder.Eval(Container.DataItem,"OperatorName") %></a>&nbsp;&nbsp;<%# DataBinder.Eval(Container.DataItem,"CheckingTime") %></td>
                                                                <td align="left" style="color: Blue; font-style: italic; text-decoration: none;">

                                                                    <a href='TTWorkFlowViewMain.aspx?WLID=<%# ShareClass.GetParentWorklowID(Eval("WLID").ToString()) %>' target="top.frames[0].frames[2].parent.frames['rightTabFrame']" style="text-decoration: none;">
                                                                        <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,GuanlianHuLiuCheng%>"></asp:Label>:<%# ShareClass.GetParentWorklowID(Eval("WLID").ToString()) %></a></td>
                                                                <td align="left" style="color: Blue; font-style: italic; text-decoration: none;">
                                                                    <a on href='TTWorkFlowViewMain.aspx?WLID=<%# ShareClass.GetChildWorklowIDByStepID(Eval("WLID").ToString(),Eval("StepID").ToString()) %>' target="top.frames[0].frames[2].parent.frames['rightTabFrame']" style="text-decoration: none;">
                                                                        <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,GuanLianZiLiuCheng%>"></asp:Label>:<%# ShareClass.GetParentWorklowID(Eval("WLID").ToString()) %></a>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td colspan="3" style="text-overflow: ellipsis; word-break: keep-all; overflow: hidden;">
                                                                    <%# DataBinder.Eval(Container.DataItem,"Operation") %>: <%# DataBinder.Eval(Container.DataItem,"OperatorCommand") %>
                                                                </td>
                                                                <td style="text-overflow: ellipsis; word-break: keep-all; overflow: hidden;">
                                                                    <a href='<%#"TTWorkFlowCommonDataViewForBrowse.aspx?WLID=" + strWLID + "&ID=" + DataBinder.Eval(Container.DataItem,"ID") %>'>相关数据</a>
                                                                </td>
                                                            </tr>

                                                        </table>
                                                    </ItemTemplate>
                                                    <ItemStyle CssClass="itemStyle" />
                                                    <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                </asp:DataList>
                                                <br />
                                                <a href="#" onclick="preview1()">
                                                    <asp:Label ID="LB_Sql" runat="server"></asp:Label>
                                            </td>
                                        </tr>



                                    </table>
                                    </a>
                                </td>
                            </tr>
                        </table>

                        <!--endprint2-->
                        <!--endprintAll-->
                    </div>

                    <div id="divToolBar" name="divTooBar" class="ToolBar" style="width: 100%;">
                        <center>
                            <asp:Panel ID="Panel_Head" runat="server">
                                <table width="100%" cellpadding="4" cellspacing="0">
                                    <tr>
                                        <td style="padding-left: 20px;">
                                            <table width="100%">
                                                <tr>
                                                    <td width="40%" align="center">
                                                        <a id="aPrintAll" runat="server" href="#" onclick="previewAll()">
                                                            <img src="ImagesSkin/print.gif" alt="打印" border="0" />
                                                            All
                                                        </a>
                                                    </td>
                                                    <td align="left">
                                                        <a id="aPrintForm" runat="server" href="#" onclick="preview1()">
                                                            <img src="ImagesSkin/print.gif" alt="打印" border="0" />Form
                                                        </a>
                                                    </td>
                                                    <td align="left" style="display: none;">
                                                        <a href="javascript:ChangeMenu(0)">
                                                            <asp:Image ID="IMG_LRArrow" ImageUrl="Images/LeftRightArrow.png" Width="18" Height="24" border="0" alt="隐藏右边栏" runat="server" /></a>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr style="display: none;">
                                        <td align="left">
                                            <table class="bian" style="width: 700px;" cellpadding="4" cellspacing="0">
                                                <tr style="color: #000000">
                                                    <td style="padding-left: 50px; font-size: xx-small;">
                                                        <asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,ChuLiZhuangTai%>"></asp:Label>:
                                                        <asp:Label ID="LB_WorkflowStatus" runat="server"></asp:Label>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                </table>
                            </asp:Panel>
                        </center>
                    </div>
                    <asp:Literal ID="LIT_AttachUserWFStepJSCode" runat="server"></asp:Literal>
                    <asp:Label ID="LB_UnVisibleFieldXMLFile" runat="server" Visible="false"></asp:Label>
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
