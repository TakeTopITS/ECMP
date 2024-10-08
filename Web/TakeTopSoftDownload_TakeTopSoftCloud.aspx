<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TakeTopSoftDownload_TakeTopSoftCloud.aspx.cs" Inherits="TakeTopSoftDownload_TakeTopSoftCloud" %>


<meta name="viewport" content="width=device-width; initial-scale=1.0; maximum-scale=1.0; minimum-scale=0.1; user-scalable=1" />
<meta content="企业云、企业管理软件、在线租用" name="keywords">
<meta content="企业云，提供企业管理软件在线租用服务。" name="description">
<meta charset="utf-8" />


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>在线加盟</title>
    <link href="Logo/website/css/media.css" rel="stylesheet" type="text/css" />
    <link href="Logo/website/css/qudaohezuo.css" rel="stylesheet" type="text/css" />
    <link href="Logo/website/css/zuyong.css" rel="stylesheet" type="text/css" />

    <style type="text/css">
        a {
            color: #333;
            text-decoration: none;
        }

        .auto-style1 {
            height: 28px;
        }
    </style>

    <script type="text/javascript">
        $(document).ready(function () {

            if (top.location != self.location) {

            }
            else {

                window.location.href = 'https://www.taketopits.com';
            }
        });
    </script>

</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="True" EnableScriptLocalization="True">
        </asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <center>
                    <table style="text-align: left;">
                        <tr>
                            <td class="formItemBgStyle">
                                <div style="top: 29px; width: 980px;">
                                    <table width="100%">
                                        <tr>
                                            <td width="50%">

                                                <div class="qudaohezuo">
                                                    <div class="wenzi">
                                                        <p class="zuyong">
                                                              &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;行业矩献，为促进业界项目管理软件的发展和提升企业项目管理水平，泰顶拓鼎集团推行开放战略，提供自有知识产权，上千用户，功能俱全，成熟可靠的泰顶项目管理软件[综合版]全套源码下载，含测试数据，内有一键安装使用说明，源码请用visual studio 2022编译，注意仅供学习研究，如要商用需申请！                                                       
                                                        </p>

                                                        <div id="id5" style="padding-left: 20px;">
                                                            <h3>&nbsp;&nbsp;&nbsp;请在下面填写你的联系信息，提交成功后下载链接会自动显示</h3>
                                                            <table class="ziti5" border="0" cellpadding="0" cellspacing="3" width="100%">
                                                                <tr>
                                                                    <td class="formItemBgStyle">公司</td>
                                                                    <td class="formItemBgStyle">
                                                                        <asp:TextBox ID="TB_Company" runat="server" ForeColor="#000000" Style="width: 350px; height: 30px;"></asp:TextBox>
                                                                        &nbsp;<font color="#FF0000">*</font> </td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="formItemBgStyle">联系人</td>
                                                                    <td class="formItemBgStyle">
                                                                        <asp:TextBox ID="TB_ContactPerson" runat="server" ForeColor="#000000" Style="width: 350px; height: 30px;"></asp:TextBox>
                                                                        &nbsp;<font color="#FF0000">*</font> &nbsp;&nbsp;</td>
                                                                </tr>

                                                                <tr>
                                                                    <td class="formItemBgStyle">电话</td>
                                                                    <td class="formItemBgStyle">
                                                                        <asp:TextBox ID="TB_PhoneNumber" runat="server" ForeColor="#000000" Style="width: 350px; height: 30px;"></asp:TextBox>
                                                                        &nbsp;<font color="#FF0000">*</font> </td>
                                                                </tr>



                                                                <tr>
                                                                    <td align="left" class="formItemBgStyle">验证码</td>
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
                                                                    <td class="formItemBgStyle">&nbsp;</td>
                                                                    <td class="formItemBgStyle">
                                                                        <asp:Button ID="BT_Summit" runat="server" OnClick="BT_Summit_Click" Style="width: 130px; height: 30px;" Text="提 交" />
                                                                        <asp:Label ID="LB_Message" runat="server" ForeColor="Red"></asp:Label>
                                                                        <br />
                                                                    </td>
                                                                </tr>

                                                                <tr style="display: none;">
                                                                    <td class="formItemBgStyle" width="100px">产品</td>
                                                                    <td class="formItemBgStyle">
                                                                        <asp:DropDownList ID="DL_Type" runat="server" Style="height: 50px;">
                                                                            <asp:ListItem>下载</asp:ListItem>
                                                                        </asp:DropDownList>
                                                                    </td>
                                                                </tr>
                                                                <tr style="display: none;">
                                                                    <td class="auto-style1">版本</td>
                                                                    <td class="auto-style1">
                                                                        <asp:DropDownList ID="DL_Version" runat="server" Style="height: 50px;">
                                                                            <asp:ListItem>综合管理平台</asp:ListItem>
                                                                        </asp:DropDownList>
                                                                    </td>
                                                                </tr>
                                                                <tr style="display: none;">
                                                                    <td class="formItemBgStyle">用户数</td>
                                                                    <td class="formItemBgStyle">
                                                                        <asp:TextBox ID="TB_UserNumber" runat="server" ForeColor="#000000" Style="width: 150px; height: 30px;" Text="100"></asp:TextBox>
                                                                        <strong>人</strong> <font color="#FF0000">*</font> </td>
                                                                </tr>
                                                                <tr style="display: none;">

                                                                    <td class="formItemBgStyle">Email </td>
                                                                    <td class="formItemBgStyle">
                                                                        <asp:TextBox ID="TB_EMail" runat="server" Style="width: 350px; height: 30px;"></asp:TextBox>
                                                                        &nbsp;<font color="#FF0000">*</font> </td>
                                                                </tr>
                                                                <tr style="display: none;">

                                                                    <td class="formItemBgStyle">联系地址</td>
                                                                    <td class="formItemBgStyle">
                                                                        <asp:TextBox ID="TB_Address" runat="server" Style="width: 350px; height: 30px;"></asp:TextBox>
                                                                        &nbsp;<font color="#FF0000">*</font>
                                                                    </td>
                                                                </tr>
                                                                <tr style="display: none;">

                                                                    <td class="formItemBgStyle">存储容量</td>
                                                                    <td class="formItemBgStyle">
                                                                        <asp:DropDownList ID="DL_ServerType" runat="server" AutoPostBack="true" OnSelectedIndexChanged="DL_ServerType_SelectedIndexChanged">
                                                                            <asp:ListItem>申请</asp:ListItem>

                                                                        </asp:DropDownList>
                                                                        <asp:TextBox ID="TB_StorageCapacity" runat="server" Style="width: 50px;" Text="10"></asp:TextBox><strong style="font-size: medium;">GB</strong>
                                                                        <font color="#FF0000">*</font> </td>
                                                                </tr>
                                                            </table>

                                                            <br />

                                                            <li>下载链接：<asp:HyperLink ID="HL_SourceCodeDownload" runat="server" Text="源码下载" Visible="false"></asp:HyperLink>
                                                                <br />
                                                                要协助请联系泰顶客服（电话：021-51085119）
                                                           
                                                                </br>
                                                                     <p style="text-align: left;">
                                                                         <img alt="" src="Logo/ECMP.png" style="width: 640px; height: 600px;" />

                                                                     </p>
                                                                <%--  &nbsp;&nbsp;<a href="tencent://message/?uin=3166455252&amp;Site=&amp;Menu=yes"><img align="absmiddle" src="images/qq.png" />客服QQ</a>，电话：<a href="tel:02151085119" class="call">021-51085119</a><br />--%>
                                                            </li>

                                                        </div>


                                                    </div>
                                                </div>


                                            </td>
                                        </tr>
                                    </table>
                                </div>
                            </td>
                        </tr>
                    </table>
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
<script type="text/javascript" language="javascript">var cssDirectory = '<%=Session["CssDirectory"] %>'; var oLink = document.getElementById('mainCss'); oLink.href = 'css/' + cssDirectory + '/' + 'bluelightmain.css';</script>
</html>
