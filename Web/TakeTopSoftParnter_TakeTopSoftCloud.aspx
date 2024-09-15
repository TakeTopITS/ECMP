<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TakeTopSoftParnter_TakeTopSoftCloud.aspx.cs" Inherits="TakeTopSoftParnter_TakeTopSoftCloud" %>

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
                                                              &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;如果您所在的地区或者您公司目前所拥有的客户资源非常适合推广泰顶拓鼎软件，您可以申请成为我们的合作伙伴，共赢是我们的精神，在合作期您将获得我们全力的支持，包括全面的培训，技术支持，甚至我们会提供您所在地区的销售机会，以支持您的业务持续的发展！
                                                        </p>

                                                        <%-- <p style="text-indent: 20px;"><strong>渠道分成政策：</strong></p>

                                                        <p style="text-indent: 20px;">1、发展的代理每成一单，按此单软件和用户授权费代理商向我方采购额的10%提成，授权费一般占合同额的70%左右！</p>

                                                        <p style="text-indent: 20px;">2、介绍朋友去发展的第一层代理每成一单，可以按此单软件和用户授权费代理商向我方采购额的5%提成！</p>

                                                        <p style="text-indent: 20px;"><strong>销售分成政策：</strong></p>

                                                        <p style="text-indent: 20px;">1、提供商机给我们，并协助我们销售（我们主导）成单，可以按此单软件和用户授权费的20%提成！</p>

                                                        <p style="text-indent: 20px;">
                                                            2、直接销售（我们协助）分成按【销售代理分成协议】执行！<br />                                                          
                                                        </p>--%>


                                                        <div id="id5" style="padding-left: 20px;">
                                                            <h3>&nbsp;&nbsp;&nbsp;如有意向，请在下面填写你的联系信息</h3>
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
                                                                            <asp:ListItem>---</asp:ListItem>
                                                                        </asp:DropDownList>
                                                                    </td>
                                                                </tr>
                                                                <tr style="display: none;">
                                                                    <td class="auto-style1">版本</td>
                                                                    <td class="auto-style1">
                                                                        <asp:DropDownList ID="DL_Version" runat="server" Style="height: 50px;">
                                                                            <asp:ListItem>--------------</asp:ListItem>
                                                                        </asp:DropDownList>
                                                                    </td>
                                                                </tr>
                                                                <tr style="display: none;">
                                                                    <td class="formItemBgStyle">用户数</td>
                                                                    <td class="formItemBgStyle">
                                                                        <asp:TextBox ID="TB_UserNumber" runat="server" ForeColor="#000000" Style="width: 150px; height: 30px;" Text="0"></asp:TextBox>
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

                                                            <li>提交成功后，客服将会立刻联系你，你也可以直接联系客服：
                                                              <br />
                                                                &nbsp;&nbsp;<a href="tencent://message/?uin=3166455252&amp;Site=&amp;Menu=yes"><img align="absmiddle" src="images/qq.png" />客服QQ</a>，电话：<a href="tel:02151085119" class="call">021-51085119</a><br />
                                                            </li>

                                                        </div>

                                                        <p>&nbsp</p>

                                                        <p style="margin: 0px; padding: 0px; color: rgb(0, 0, 0); text-transform: none; text-indent: 20px; letter-spacing: normal; word-spacing: 0px; white-space: normal; font-size-adjust: none; font-stretch: normal; -webkit-text-stroke-width: 0px;"><strong>我们渠道六大体系</strong></p>

                                                        <div class="news-title" style="color: rgb(0, 0, 0); text-transform: none; text-indent: 0px; letter-spacing: normal; word-spacing: 0px; white-space: normal; font-size-adjust: none; font-stretch: normal; -webkit-text-stroke-width: 0px;">&nbsp;&nbsp;</div>

                                                        <div class="news-title" style="color: rgb(0, 0, 0); text-transform: none; text-indent: 20px; letter-spacing: normal; word-spacing: 0px; white-space: normal; font-size-adjust: none; font-stretch: normal; -webkit-text-stroke-width: 0px;">
                                                            <p style="margin: 0px; padding: 0px;">产品多元化、服务个性化的大中小型不限行业管理软件催生新型价值渠道体系,我们渠道六大伙伴体系构建独特的信息化渠道生态链：&nbsp;</p>

                                                            <p style="margin: 0px; padding: 0px;">&nbsp;</p>

                                                            <p style="margin: 0px; padding: 0px;"><strong>&nbsp;&nbsp;产品经销伙伴</strong></p>

                                                            <p style="margin: 0px; padding: 0px;">是指与签署产品代理协议，通过地区授权销售我们系列产品实现盈利的伙伴。</p>

                                                            <p style="margin: 0px; padding: 0px;">&nbsp;</p>

                                                            <p style="margin: 0px; padding: 0px;"><strong>&nbsp;&nbsp;增值分销伙伴</strong></p>

                                                            <p style="margin: 0px; padding: 0px;">是指与签署地区增值分销协议并通过自有分销渠道销售我们我们系列产品并实现盈利的伙伴。</p>

                                                            <p style="margin: 0px; padding: 0px;">&nbsp;</p>

                                                            <p style="margin: 0px; padding: 0px;"><strong>&nbsp;&nbsp;商机合作伙伴</strong></p>

                                                            <p style="margin: 0px; padding: 0px;">是指与签署商机合作协议，凭借自身客户资源优势，为提供产品销售商机或者帮助我们完成关系营销过程的法人单位或者个人。</p>

                                                            <p style="margin: 0px; padding: 0px;">&nbsp;</p>

                                                            <p style="margin: 0px; padding: 0px;"><strong>&nbsp;&nbsp;授权服务伙伴</strong></p>

                                                            <p style="margin: 0px; padding: 0px;">是指获得实施/服务体系的资格认证，并具备较强的管理软件服务实施、服务能力的伙伴。</p>

                                                            <p style="margin: 0px; padding: 0px;">&nbsp;</p>

                                                            <p style="margin: 0px; padding: 0px;"><strong>&nbsp;&nbsp;授权培训伙伴</strong></p>

                                                            <p style="margin: 0px; padding: 0px;">是指能结合系列产品在培训领域进行合作并按照约定比例进行利润分配的组织和机构。</p>

                                                            <p style="margin: 0px; padding: 0px;">&nbsp;</p>

                                                            <p style="margin: 0px; padding: 0px;"><strong>&nbsp;&nbsp;行业开发伙伴</strong></p>

                                                            <p style="margin: 0px; padding: 0px;">是指能够通过平台或可集成平台开发，形成与互补的行业模块产品的伙伴。该行业产品以约定的合作模式在我们渠道销售，并按比例获取利润。</p>
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
