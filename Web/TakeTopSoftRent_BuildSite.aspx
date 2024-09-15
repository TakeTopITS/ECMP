<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TakeTopSoftRent_BuildSite.aspx.cs" Inherits="TakeTopSoftRent_BuildSite" %>

<meta name="viewport" content="width=device-width; initial-scale=1.0; maximum-scale=1.0; minimum-scale=0.1; user-scalable=1" />
<meta content="企业云、企业管理软件、在线租用" name="keywords">
<meta content="企业云，提供企业管理软件在线租用服务。" name="description">
<meta charset="utf-8" />

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>在线租用---云平台</title>
    <link id="mainCss" href="css/bluelightmain.css" rel="stylesheet" type="text/css" />
    <link href="Logo/website/css/media.css" rel="stylesheet" type="text/css" />
    <link href="Logo/website/css/qudaohezuo.css" rel="stylesheet" type="text/css" />
    <link href="Logo/website/css/zuyong.css" rel="stylesheet" type="text/css" />

    <script type="text/javascript" src="Logo/website/js/jquery-1.3.1.js"></script>
    <script src="js/jquery.min.js" type="text/javascript"></script>
    <script src="js/jquery-1.7.2.min.js" type="text/javascript"></script>
    <script src="js/allAHandler.js" type="text/javascript"></script>

    <script type="text/javascript">
        $(document).ready(function () {

            //aHandler();

        });

        function openMDIFrom(strMDIPageName) {

            window.open(strMDIPageName, '_top');

        }

        function hideRelatedUI() {
            this.parent.window.document.getElementById("DIV_SiteMsg").style.display = "none";
        }

        function displayRelatedUI() {

            this.document.getElementById("Img_Message").style.display = "block";
            this.document.getElementById("Span_Message").style.display = "block";

            this.parent.window.document.getElementById("DIV_SiteMsg").style.display = "none";
            this.document.getElementById("DIV_Top").style.display = "none";
            this.document.getElementById("DIV_Message").style.display = "block";
        }
    </script>

    <style type="text/css">
        a {
            color: #333;
            text-decoration: none;
        }
    </style>

</head>
<body>
    <form id="form1" runat="server">
        <center>
            <table style="text-align: left;">
                <tr>
                    <td class="formItemBgStyle">
                        <div style="top: 29px; width: 100%;">
                            <table width="100%">
                                <tr>
                                    <td width="70%">

                                        <div id="DIV_Message"  style="text-align:center;padding-top:100px;display:none;">
                                             <table>
                                                 <tr>
                                                    <td style="color:red;">正在创建你的应用站点，大概需要5分钟，请耐心等候......

                                                         <asp:Label ID="Label1" runat="server" ForeColor="Red"></asp:Label>
                                                    </td>
                                                 </tr>
                                                   <tr>
                                                     <td style="text-align:center;font-size:small;">
                                                        <asp:HyperLink ID="HL_SiteURL" runat="server"></asp:HyperLink>
                                                     </td>
                                                 </tr>
                                                 <tr>
                                                     <td style="text-align:center;font-size:small;">（请不要关闭此页面）</td>
                                                 </tr>
                                             </table>
                                        </div> 
                                            
                                        <div id="DIV_Top">
                                            <h3>3&nbsp;站点信息</h3>
                                            <table class="ziti5" border="0" cellpadding="0" cellspacing="3" width="100%">
                                                 <tr>
                                                    <td colspan ="2" class="formItemBgStyle">
                                                        <br />
                                                        <asp:CheckBox ID="CB_IsOEM" runat="server" Checked="true" Text="OEM版"></asp:CheckBox>
                                                        <br />
                                                        <br />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td colspan="2" class="formItemBgStyle" style="text-align:left;" >
                                                        平台名称  &nbsp;<font color="#FF0000">*</font>
                                                        <br />
                                                        <asp:TextBox ID="TB_SiteAppSystemName" runat="server" ForeColor="#000000"  Style="width: 350px; height: 30px;" ></asp:TextBox>
                                                      
                                                        <br />
                                                        <span style="font-size :xx-small;">注：***项目管理平台，只能由字母或汉字组成！</span> 
                                                    </td>
                                                </tr>
                                                <tr>
                                                       <td colspan ="2" class="formItemBgStyle" style="text-align:left;" >
                                                           站点名称&nbsp;<font color="#FF0000">*</font>
                                                           <br />
                                                        <asp:TextBox ID="TB_SiteAppName" runat="server" ForeColor="#000000" Style="width: 350px; height: 30px;" ></asp:TextBox>
                                                        
                                                        <br />
                                                        <span style="font-size :xx-small;">注：***PMP ,只能由字母组成！</span> 
                                                    </td>
                                                </tr>
                                               
                                                <tr >
                                                   <td class="formItemBgStyle" align="left" style="width:100px;" >
                                                        <asp:Button ID="BT_Summit" runat="server" CssClass="inpu"  Height="30px" OnClientClick ="displayRelatedUI()"  OnClick="BT_Summit_Click"  Text="创建站点" />
                                                   </td>
                                                   <td class="formItemBgStyle" align="left">
                                                        <img id="Img_Message" src="Images/Processing.gif" alt="Building,please wait..." style="display:none;"/>
                                                        <span id="Span_Message" style="color:red;display:none;">正在创建站点，大概需要几分钟，请稍候！ </span>
                                                        <asp:Label ID="LB_Message" runat="server" ForeColor="Red"></asp:Label>
                                                      
                                                    </td>
                                                </tr>
                                            </table>

                                             <br/>

                                            <li>因为要复制站点文件和初始化数据，预计要10分钟才能完成并出现登录界面，请耐心等候！</li>
                                            <li>如有问题，请直接联系客服：<br />
                                                <a href="tencent://message/?uin=3166455252&amp;Site=&amp;Menu=yes"><img align="absmiddle" src="images/qq.png" />客服QQ</a>，电话：<a href="tel:02151085119" class="call">021-51085119</a><br />
                                            </li>

                                        </div>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </td>
                </tr>
            </table>
        </center>
    </form>
</body>
<script type="text/javascript" language="javascript">var cssDirectory = '<%=Session["CssDirectory"] %>'; var oLink = document.getElementById('mainCss'); oLink.href = 'css/' + cssDirectory + '/' + 'bluelightmain.css';</script>
</html>
