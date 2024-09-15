<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TakeTopSoftTry_TakeTopSoftCloud.aspx.cs" Inherits="TakeTopSoftTry_TakeTopSoftCloud" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <link href="Logo/website/css/ziliaoxiazai.css" rel="stylesheet" type="text/css" />
    <link href="Logo/website/css/qudaohezuo.css" rel="stylesheet" type="text/css" />

    <script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="js/allAHandler.js"></script>
    <script type="text/javascript" src="js/layer/layer/layer.js"></script>
    <script type="text/javascript" src="js/popwindow.js"></script>

    <script type="text/javascript" language="javascript">

        $(function () {

            if (top.location != self.location) {

            }
            else {

                window.location.href = 'https://www.taketopits.com';
            }

            aHandlerForPopFixedSizeWindow();

        });
    </script>

</head>
<body>
    <form id="form1" runat="server">
        <div class="fw_list">
            <p class="fw_zlxz">
                我们拓鼎所有管理软件平台产品【企业版】提供免费在线试用，试用中如遇到问题，请即时联系客服， <a href="tencent://message/?uin=3166455252&amp;Site=&amp;Menu=yes">
                    <img align="absmiddle" src="images/qq.png" />客服QQ</a>。
            </p>

            <div class="wenzi">
                <ul class="clearfix">

                    <li style="font-size: larger;"><a href="https://www.taketopits.com/taketopmis/TTCustomerRegisterFromWebSite_TakeTopSoft.aspx?WebSite=WWW.TAKETOPSOFT.COM&amp;SystemType=SIMP" target="_blank">在线试用</a>系统集成项目管理平台</li>
                    <li style="font-size: larger;"><a href="https://www.taketopits.com/taketopmis/TTCustomerRegisterFromWebSite_TakeTopSoft.aspx?WebSite=WWW.TAKETOPSOFT.COM&amp;SystemType=RDPMP" target="_blank">在线试用</a>研发项目管理平台</li>
                    <li style="font-size: larger;"><a href="https://www.taketopits.com/taketopmis/TTCustomerRegisterFromWebSite_TakeTopSoft.aspx?WebSite=WWW.TAKETOPSOFT.COM&amp;SystemType=SIMP" target="_blank">在线试用</a>软件实施项目管理平台</li>
                    <li style="font-size: larger;"><a href="https://www.taketopits.com/taketopmis/TTCustomerRegisterFromWebSite_TakeTopSoft.aspx?WebSite=WWW.TAKETOPSOFT.COM&amp;SystemType=ENPMP" target="_blank">在线试用</a>工程项目管理平台</li>
                    <li style="font-size: larger;"><a href="https://www.taketopits.com/taketopMIS/TTCustomerRegisterFromWebSite_TakeTopSoft.aspx?WebSite=WWW.TAKETOPSOFT.COM&amp;SystemType=ERP" target="_blank">在线试用</a>项目型ERP平台</li>
                    <%--  <li style="font-size: larger;"><a href="https://www.taketopits.com/taketopmis/TTCustomerRegisterFromWebSite_TakeTopSoft.aspx?WebSite=WWW.TAKETOPSOFT.COM&amp;SystemType=CRM" target="_blank">在线试用</a>CRM平台</li>
                    <li style="font-size: larger;"><a href="https://www.taketopits.com/taketopmis/TTCustomerRegisterFromWebSite_TakeTopSoft.aspx?WebSite=WWW.TAKETOPSOFT.COM&amp;SystemType=CMP" target="_blank">在线试用</a>协同OA平台</li>
                    <li style="font-size: larger;"><a href="https://www.taketopits.com/taketopmis/TTCustomerRegisterFromWebSite_TakeTopSoft.aspx?WebSite=WWW.TAKETOPSOFT.COM&amp;SystemType=ECMP" target="_blank">在线试用</a>企业综合管理平台</li>--%>
                </ul>
            </div>
        </div>
    </form>
</body>
<script type="text/javascript" language="javascript">var cssDirectory = '<%=Session["CssDirectory"] %>'; var oLink = document.getElementById('mainCss'); oLink.href = 'css/' + cssDirectory + '/' + 'bluelightmain.css';</script></html>
