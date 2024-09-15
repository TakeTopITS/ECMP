<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TakeTopSoftBuy_TakeTopSoftCloud.aspx.cs" Inherits="TakeTopSoftBuy_TakeTopSoftCloud" %>

<meta name="viewport" content="width=device-width; initial-scale=1.0; maximum-scale=1.0; minimum-scale=0.1; user-scalable=1" />

<meta content="企业云、企业管理软件、在线租用" name="keywords">
<meta content="企业云，提供企业管理软件在线租用服务。" name="description">
<meta charset="utf-8" />
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>在线购买---泰顶拓鼎</title>
    <link href="Logo/website/css/zuyong.css" rel="stylesheet" type="text/css" />
    <link href="Logo/website/css/website.css" rel="stylesheet" type="text/css" />
    <link href="Logo/website/css/goumai.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="Logo/website/js/jquery-1.3.1.js"></script>
    <script src="js/jquery.min.js" type="text/javascript"></script>
    <script src="js/jquery-1.7.2.min.js" type="text/javascript"></script>
    <script src="js/allAHandler.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(document).ready(function () {

            if (top.location != self.location)
            {

            }
            else {

                window.location.href = 'https://www.taketopits.com';
            }


            aHandler();

            $('.bigbox').hover(function () {
                $(".pointer", this).stop().animate({ top: '190px' }, { queue: false, duration: 160 });
            }, function () {
                $(".pointer", this).stop().animate({ top: '278px' }, { queue: false, duration: 160 });
            });

        });
    </script>
    <style type="text/css">
        a {
            color: #333;
            text-decoration: none;
        }
    </style>
</head>
<body style="background-color: white;">
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="True" EnableScriptLocalization="True">
        </asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <center>
                    <p>
                        &nbsp;
                    </p>
                    <div class="title">
                        企业级8款可扩展软件
                    </div>
                    <div class="title1">
                        积木化结构，可按需选配，自由组合
                    </div>
                    <div class="main">
                        <p style="text-align: center; padding-bottom: 30px; font-size: 28px;">
                            <br />
                            <span style="text-align: center; font-size: small;"><a href="TakeTopSoftModuleChart_TakeTopSoftCloud.html"
                                target="_blank">功能模块与价格</a> </span>
                        </p>
                    </div>
                    <div class="box">
                        <div id="list">
                            <ul id="smalllist">
                                <li class="bigbox">
                                    <div class="img">
                                        <a href="#">
                                            <img src="Logo/website/Images/201312231521547781.png" /></a>
                                    </div>
                                    <h3>
                                        <a href="#">项目宝</a></h3>
                                    <h3>
                                        <br />
                                        10000元，50用户
                                    </h3>
                                    <p>
                                        &nbsp;
                                    </p>
                                    <div class="pointer">
                                        <p class="pointer_one">
                                            <a href="#">提供项目计划、进度、任务、费用、文档管理功能，简单易用，10分钟学会</a>
                                        </p>
                                    </div>
                                </li>
                                <li class="bigbox">
                                    <div class="img">
                                        <a href="#">
                                            <img src="Logo/website/Images/201411328407512.png" /></a>
                                    </div>
                                    <h3>
                                        <a href="#">系统集成项目管理平台</a></h3>
                                    <h3>
                                        <br />
                                        40000元起
                                    </h3>
                                    <p>
                                        &nbsp;
                                    </p>
                                    <div class="pointer">
                                        <p class="pointer_one">
                                            <a href="#">系统集成项目管理平台</a>
                                        </p>
                                    </div>
                                </li>
                                <li class="bigbox">
                                    <div class="img">
                                        <a href="#">
                                            <img src="Logo/website/Images/2013122395112630.png" /></a>
                                    </div>
                                    <h3>
                                        <a href="#">研发项目管理平台</a></h3>
                                    <h3>
                                        <br />
                                        40000元起
                                    </h3>
                                    <p>
                                        &nbsp;
                                    </p>
                                    <div class="pointer">
                                        <p class="pointer_one">
                                            <a href="#">产品与技术研发管理</a>
                                        </p>
                                    </div>
                                </li>
                                <li class="bigbox">
                                    <div class="img">
                                        <a href="#">
                                            <img src="Logo/website/Images/201312181423536202.png" /></a>
                                    </div>
                                    <h3>
                                        <a href="#">工程项目管理平台</a></h3>
                                    <h3>
                                        <br />
                                        100000元起
                                    </h3>
                                    <p>
                                        &nbsp;
                                    </p>
                                    <div class="pointer">
                                        <p class="pointer_one">
                                            <a href="#">工程设计&施工项目管理</a>
                                        </p>
                                    </div>
                                </li>
                                <li class="bigbox">
                                    <div class="img">
                                        <a href="#">
                                            <img src="Logo/website/Images/20131218142463453.png" /></a>
                                    </div>

                                    <h3>
                                        <a href="#">软件实施项目管理平台</a></h3>
                                    <h3>
                                        <br />
                                        40000元起
                                    </h3>
                                    <p>
                                        &nbsp;
                                    </p>
                                    <div class="pointer">
                                        <p class="pointer_one">
                                            <a href="#">软件系统实施项目管理</a>
                                        </p>
                                    </div>
                                </li>
                                <li class="bigbox">
                                    <div class="img">
                                        <a href="#">
                                            <img src="Logo/website/Images/201312231521462477.png" /></a>
                                    </div>
                                    <h3>
                                        <a href="#">项目型ERP平台</a></h3>
                                    <h3>
                                        <br />
                                        60000元起
                                    </h3>
                                    <p>
                                        &nbsp;
                                    </p>
                                    <div class="pointer">
                                        <p class="pointer_one">
                                            <a href="#">项目型制造管理</a>
                                        </p>
                                    </div>
                                </li>
                                <li class="bigbox">
                                    <div class="img">
                                        <a href="#">
                                            <img src="Logo/website/Images/201312181423378443.png" /></a>
                                    </div>

                                    <h3>
                                        <a href="#">政务项目管理平台</a></h3>
                                    <h3>
                                        <br />
                                        100000元起
                                    </h3>
                                    <p>
                                        &nbsp;
                                    </p>
                                    <div class="pointer">
                                        <p class="pointer_one">
                                            <a href="#">政务项目管理</a>
                                        </p>
                                    </div>
                                </li>
                                <li class="bigbox">
                                    <div class="img">
                                        <a href="#">
                                            <img src="Logo/website/Images/201312181423459253.png" /></a>
                                    </div>


                                    <h3>
                                        <a href="#">项目管理咨询</a></h3>
                                    <h3>
                                        <br />
                                        30000元起
                                    </h3>
                                    <p>
                                        &nbsp;
                                    </p>
                                    <div class="pointer">
                                        <p class="pointer_one">
                                            <a href="#">项目管理咨询、培训、认证</a>
                                        </p>
                                    </div>
                                </li>
                                <%--  <li class="bigbox">
                                    <div class="img"><a href="#"><img src="Logo/website/Images/201312181423378443.png" /></a></div>

                                    <h3><a href="#">CRM、OA</a></h3>

                                    <h3>
                                        <br />
                                        15000元起
                                    </h3>

                                    <p>&nbsp;</p>

                                    <div class="pointer">
                                        <p class="pointer_one"><a href="#">CRM:客户&middot;售前售后服务&middot;进销存等</a></p>
                                        <p class="pointer_one"><a href="#">OA:流程&middot;资产&middot;知识&middot;车辆等</a></p>
                                    </div>
                                </li>
                               

                                 <li class="bigbox">
                                    <div class="img"><a href="#"><img src="Logo/website/Images/20131218142463453.png" /></a></div>

                                    <h3><a href="#">综合管理平台</a></h3>

                                    <h3>
                                        <br />
                                        100000元起
                                    </h3>

                                    <p>&nbsp;</p>

                                    <div class="pointer">
                                        <p class="pointer_one"><a href="#">常规行业&middot;工程行业&middot;石化行业</a></p>
                                    </div>
                                </li>--%>
                            </ul>
                            <p>
                                &nbsp;
                            </p>
                            <table style="text-align: left; width: 880px;">
                                <tr>
                                    <td class="formItemBgStyle">
                                        <div style="top: 29px; width: 99%;">
                                            <table width="100%">
                                                <tr>
                                                    <td width="50%">
                                                        <p class="zuyong">
                                                            &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;<strong>购买泰顶拓鼎管理软件</strong>（使用时间不限，软件安装在用户自备的服务器上）请在下面填写购买申请，我们将会提供现场实施指导和定制开发服务！
                                                        </p>
                                                        <div id="id5">
                                                            <table class="ziti5" border="0" cellpadding="0" cellspacing="3" width="100%">
                                                                <tr>
                                                                    <td class="formItemBgStyle" width="100px">产品
                                                                    </td>
                                                                    <td class="formItemBgStyle">
                                                                        <asp:DropDownList ID="DL_Type" runat="server" Style="height: 50px;">
                                                                            <asp:ListItem>项目宝</asp:ListItem>
                                                                            <asp:ListItem>系统集成项目管理平台</asp:ListItem>
                                                                            <asp:ListItem>研发项目管理平台</asp:ListItem>
                                                                            <asp:ListItem>工程项目管理平台</asp:ListItem>
                                                                            <asp:ListItem>政务项目管理平台</asp:ListItem>
                                                                            <asp:ListItem>软件实施项目管理平台</asp:ListItem>
                                                                            <asp:ListItem>项目型ERP平台</asp:ListItem>
                                                                            <asp:ListItem>项目综合管理平台</asp:ListItem>
                                                                            <asp:ListItem>--------------</asp:ListItem>
                                                                            <asp:ListItem>协同OA平台</asp:ListItem>
                                                                            <asp:ListItem>客户关系管理平台</asp:ListItem>
                                                                        </asp:DropDownList>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="formItemBgStyle">版本
                                                                    </td>
                                                                    <td class="formItemBgStyle">
                                                                        <table>
                                                                            <tr>
                                                                                <td>
                                                                                    <asp:DropDownList ID="DL_Version" runat="server" Style="height: 50px;">
                                                                                        <asp:ListItem>标准版</asp:ListItem>
                                                                                        <asp:ListItem>企业版</asp:ListItem>
                                                                                        <asp:ListItem>集团版</asp:ListItem>
                                                                                    </asp:DropDownList>
                                                                                </td>
                                                                                <td>&nbsp;
                                                                                </td>
                                                                                <td style="vertical-align: middle;">
                                                                                    <a href="TakeTopSoftModuleChart_TakeTopSoftCloud.html" target="_blank">模块与价格</a>
                                                                                </td>
                                                                            </tr>
                                                                        </table>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="formItemBgStyle">公司
                                                                    </td>
                                                                    <td class="formItemBgStyle">
                                                                        <asp:TextBox ID="TB_Company" runat="server" ForeColor="#000000" Style="width: 350px; height: 30px;"></asp:TextBox>
                                                                        &nbsp;<font color="#FF0000">*</font>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="formItemBgStyle">联系人
                                                                    </td>
                                                                    <td class="formItemBgStyle">
                                                                        <asp:TextBox ID="TB_ContactPerson" runat="server" ForeColor="#000000" Style="width: 350px; height: 30px;"></asp:TextBox>
                                                                        &nbsp;<font color="#FF0000">*</font> &nbsp;&nbsp;
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="formItemBgStyle" style="padding-bottom: 25px;">手机
                                                                    </td>
                                                                    <td class="formItemBgStyle">
                                                                        <asp:TextBox ID="TB_PhoneNumber" runat="server" ForeColor="#000000" Style="width: 350px; height: 30px;"></asp:TextBox>
                                                                        &nbsp;<font color="#FF0000">*</font>
                                                                        <br />
                                                                        <span style="font-size: xx-small;">注：要接收重要信息，请正确填写！</span>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="formItemBgStyle" style="padding-bottom: 25px;">Email
                                                                    </td>
                                                                    <td class="formItemBgStyle">
                                                                        <asp:TextBox ID="TB_EMail" runat="server" Style="width: 350px; height: 30px;" onclick="checkEmailFormat('TB_EMail')"></asp:TextBox>
                                                                        &nbsp;<font color="#FF0000">*</font>
                                                                        <br />
                                                                        <span style="font-size: xx-small;">注：要接收重要信息，请正确填写！</span>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="formItemBgStyle">用户数
                                                                    </td>
                                                                    <td class="formItemBgStyle">
                                                                        <asp:TextBox ID="TB_UserNumber" runat="server" ForeColor="#000000" Style="width: 150px; height: 30px;"></asp:TextBox>
                                                                        <strong>人</strong> <font color="#FF0000">*</font>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td align="left" class="formItemBgStyle">验证码
                                                                    </td>
                                                                    <td align="left" class="formItemBgStyle">
                                                                        <table>
                                                                            <tr>
                                                                                <td>
                                                                                    <asp:TextBox ID="TB_CheckCode" runat="server" ForeColor="#000000" Style="width: 150px; height: 40px;"></asp:TextBox>
                                                                                </td>
                                                                                <td>
                                                                                    <asp:Image ID="IM_CheckCode" runat="server" src="TTCheckCode.aspx" Style="width: 150px; height: 40px;" />
                                                                                </td>
                                                                            </tr>
                                                                        </table>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="formItemBgStyle">&nbsp;
                                                                    </td>
                                                                    <td class="formItemBgStyle">
                                                                        <asp:Button ID="BT_Summit" runat="server" OnClick="BT_Summit_Click" Style="width: 130px; height: 30px;"
                                                                            Text="提 交" />
                                                                        <asp:Label ID="LB_Message" runat="server" ForeColor="Red"></asp:Label>
                                                                        <br />
                                                                    </td>
                                                                </tr>
                                                                <tr style="display: none;">
                                                                    <td class="formItemBgStyle">联系地址
                                                                    </td>
                                                                    <td class="formItemBgStyle">
                                                                        <asp:TextBox ID="TB_Address" runat="server" Style="width: 350px; height: 30px;"></asp:TextBox>
                                                                        &nbsp;<font color="#FF0000">*</font>
                                                                    </td>
                                                                </tr>
                                                                <tr style="display: none;">
                                                                    <td class="formItemBgStyle">存储容量
                                                                    </td>
                                                                    <td class="formItemBgStyle">
                                                                        <asp:DropDownList ID="DL_ServerType" runat="server" AutoPostBack="true" OnSelectedIndexChanged="DL_ServerType_SelectedIndexChanged">
                                                                            <asp:ListItem>购买</asp:ListItem>
                                                                        </asp:DropDownList>
                                                                        <asp:TextBox ID="TB_StorageCapacity" runat="server" Style="width: 50px;" Text="10"></asp:TextBox><strong
                                                                            style="font-size: medium;">GB</strong> <font color="#FF0000">*</font>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                            <br />
                                                            <li>提交成功后，客服将会立刻联系你，你也可以直接联系主管：<br />
                                                                &nbsp;&nbsp;<a href="tencent://message/?uin=3166455252&amp;Site=&amp;Menu=yes"><img
                                                                    align="absmiddle" src="images/qq.png" />客服QQ</a>，电话：<a href="tel:02151085119"
                                                                        class="call">021-51085119</a></li>
                                                        </div>
                                                    </td>
                                                </tr>
                                            </table>
                                        </div>
                                    </td>
                                </tr>
                            </table>
                            <p>
                                &nbsp;
                            </p>
                            <p>
                                &nbsp;
                            </p>
                            <p>
                                &nbsp;
                            </p>
                        </div>
                    </div>
                    <div class="layui-layer layui-layer-iframe" id="popwindow" name="fixedDiv" style="z-index: 9999; width: 680px; height: 530px; position: absolute; overflow: hidden; display: none; border-radius: 10px;">
                        <div class="layui-layer-title" style="background: #e7e7e8;" id="popwindow_title">
                            <asp:Label ID="Label205" runat="server" Text="&lt;div&gt;&lt;img src=ImagesSkin/Update.png border=0 width=30px height=30px alt='BusinessForm' /&gt;&lt;/div&gt;"></asp:Label>
                        </div>
                        <div id="popwindow_content" class="layui-layer-content" style="overflow: auto; padding: 0px 5px 0px 5px;">
                            <iframe id="IFrame_BuildSite" src="TakeTopSoftRent_BuildSite.aspx" style="width: 520px; height: 540px; border: none;"
                                runat="server"></iframe>
                        </div>
                        <div id="popwindow_footer" class="layui-layer-btn" style="border-top: 1px solid #ccc;">
                            <a class="layui-layer-btn notTab" onclick="return popClose();">
                                <asp:Label ID="Label206" runat="server" Text="<%$ Resources:lang,GuanBi%>" /></a>
                        </div>
                        <span class="layui-layer-setwin"><a onclick="return popClose();" class="layui-layer-ico layui-layer-close layui-layer-close1 notTab"
                            href="javascript:;"></a></span>
                    </div>
                    <div class="layui-layer-shade" id="popwindow_shade" style="z-index: 9998; background-color: #000; opacity: 0.3; filter: alpha(opacity=30); display: none;">
                    </div>
                </center>
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
</body>
<script type="text/javascript" language="javascript">    var cssDirectory = '<%=Session["CssDirectory"] %>'; var oLink = document.getElementById('mainCss'); oLink.href = 'css/' + cssDirectory + '/' + 'bluelightmain.css';</script>
</html>
