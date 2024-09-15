<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TakeTopSoftRent_TakeTopSoftCloudForInner.aspx.cs" Inherits="TakeTopSoftRent_TakeTopSoftCloudForInner" %>

<meta name="viewport" content="width=device-width; initial-scale=1.0; maximum-scale=1.0; minimum-scale=0.1; user-scalable=1" />
<meta content="企业云、企业管理软件、在线租用" name="keywords">
<meta content="企业云，提供企业管理软件在线租用服务。" name="description">
<meta charset="utf-8" />
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>在线租用---云平台</title>
    <link href="Logo/website/css/media.css" rel="stylesheet" type="text/css" />
    <link href="Logo/website/css/qudaohezuo.css" rel="stylesheet" type="text/css" />
    <link href="Logo/website/css/zuyong.css" rel="stylesheet" type="text/css" />

    <script type="text/javascript" src="Logo/website/js/jquery-1.3.1.js"></script>
    <script src="js/jquery.min.js" type="text/javascript"></script>
    <script src="js/jquery-1.7.2.min.js" type="text/javascript"></script>
    <script src="js/allAHandler.js" type="text/javascript"></script>

    <script type="text/javascript">
        $(document).ready(function () {

            if (top.location != self.location) {

            }
            else {

                window.location.href = 'https://www.taketopits.com';
            }


            aHandler();

        });

        function checkEmailFormat(tbEmail) {

            var strEmail = this.document.getElementById(tbEmail).value;

            if (strEmail.search(/^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/) != -1)
                return true;
            else
                this.document.getElementById(LB_MailMsg).value = "EMail格式不正确！";

        }
    </script>

    <style type="text/css">
        a {
            color: #333;
            text-decoration: none;
        }

        #CB_IsOEM
        {
            height:15px;
            width:15px;
        }
    </style>

</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="True" EnableScriptLocalization="True">
        </asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <center>
                 
                    <div style="top: 29px; text-align:left; width: 100%;">
                        <div id="id5">
                            <h3>1&nbsp;&nbsp;建站信息</h3>
                            <table class="ziti5" border="0" cellpadding="0" cellspacing="3" width="100%">
                                <tr>
                                    <td class="formItemBgStyle" width="100px">
                                        产品</td>
                                    <td class="formItemBgStyle">
                                        <asp:DropDownList ID="DL_Type" runat="server" Style="height: 50px;">
                                            <asp:ListItem>项目宝</asp:ListItem>
                                            <asp:ListItem>系统集成项目管理平台</asp:ListItem>
                                            <asp:ListItem>研发项目管理平台</asp:ListItem>
                                            <asp:ListItem>工程项目管理平台</asp:ListItem>
                                            <asp:ListItem>政务项目管理平台</asp:ListItem>
                                            <asp:ListItem>软件实施项目管理平台</asp:ListItem>
                                            <asp:ListItem>项目型ERP平台</asp:ListItem>
                                            <asp:ListItem>综合平台</asp:ListItem>
                                            <asp:ListItem>------</asp:ListItem>
                                            <asp:ListItem>项目管理平台</asp:ListItem>
                                            <asp:ListItem>协同OA平台</asp:ListItem>
                                            <asp:ListItem>客户关系管理平台</asp:ListItem>
                                            <asp:ListItem>------</asp:ListItem>
                                            <asp:ListItem>演示测试平台</asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                    <tr>
                                    <td class="formItemBgStyle">
                                        版本</td>
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
                                                <td>&nbsp;</td>
                                                <td style ="vertical-align:middle;">
                                                    <a href="TakeTopSoftModuleChart_TakeTopSoftCloud.html" target ="_blank">模块与价格</a>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="formItemBgStyle" >
                                        单位</td>
                                    <td class="formItemBgStyle" >
                                        <asp:TextBox ID="TB_Company" runat="server" ForeColor="#000000"  Style="width: 350px; height: 30px;" ></asp:TextBox>
                                        &nbsp;<font color="#FF0000">*</font> </td>
                                </tr>
                                <tr>
                                    <td class="formItemBgStyle">
                                        联系人</td>
                                    <td class="formItemBgStyle" >
                                        <asp:TextBox ID="TB_ContactPerson" runat="server" ForeColor="#000000" Style="width: 350px; height: 30px;" ></asp:TextBox>
                                        &nbsp;<font color="#FF0000">*</font> &nbsp;&nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="formItemBgStyle"  style="padding-bottom:25px;" >
                                        手机</td>
                                    <td class="formItemBgStyle">
                                        <asp:TextBox ID="TB_PhoneNumber" runat="server" ForeColor="#000000"  Style="width: 350px; height: 30px;" ></asp:TextBox>
                                        &nbsp;<font color="#FF0000">*</font> 
                                        <br />
                                        <span style="font-size :xx-small;">注：要接收重要信息，请正确填写！</span> 
                                    </td>
                                </tr>
                                <tr>
                                    <td class="formItemBgStyle"  style="padding-bottom:25px;" >
                                        Email </td>
                                    <td class="formItemBgStyle">
                                        <asp:TextBox ID="TB_EMail" runat="server" Style="width: 350px; height: 30px;" onclick ="checkEmailFormat('TB_EMail')" ></asp:TextBox>
                                        &nbsp;<font color="#FF0000">*</font> 
                                        <br />
                                        <span style="font-size :xx-small;">注：要接收重要信息，请正确填写！</span> 
                                        </td>
                                </tr>
                                <tr>
                                    <td class="formItemBgStyle">
                                        用户数</td>
                                    <td class="formItemBgStyle">
                                        <asp:TextBox ID="TB_UserNumber" runat="server" ForeColor="#000000"  Style="width: 150px; height: 30px;" ></asp:TextBox>
                                        <strong>人</strong> <font color="#FF0000">*</font> </td>
                                </tr>
                               
                              
                               
                                <tr >
                                    <td class="formItemBgStyle">
                                       </td>
                                    <td class="formItemBgStyle">
                                        <br />
                                        <asp:Button ID="BT_Summit" runat="server" OnClick="BT_Summit_Click"  Style="width:130px; height: 30px;" Text="提 交" />
                                        <asp:Label ID="LB_Message" runat="server" ForeColor="Red"></asp:Label>
                                        <br />
                                    </td>
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
                                            <asp:ListItem>租用</asp:ListItem>
                                            <asp:ListItem>自备</asp:ListItem>
                                        </asp:DropDownList>
                                        <asp:TextBox ID="TB_StorageCapacity" runat="server" Style="width: 50px;" Text="10"></asp:TextBox><strong style="font-size: medium;">GB</strong>
                                        <font color="#FF0000">*</font> 
                                    </td>
                                </tr>
                                 <tr style="display: none;">
                                    <td align="left" class="formItemBgStyle">
                                        验证码</td>
                                    <td align="left" class="formItemBgStyle">
                                        <table>
                                            <tr>
                                                <td>
                                                    <asp:TextBox ID="TB_CheckCode" runat="server" ForeColor="#000000"  Style="width: 150px; height: 40px;" ></asp:TextBox>
                                                </td>
                                                <td>
                                                    <asp:Image ID="IM_CheckCode" runat="server" src="TTCheckCode.aspx" Style="width: 150px;height:40px;" />
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>

                    <div class="layui-layer layui-layer-iframe" id="popwindow"  name="fixedDiv"
                        style="z-index: 9999; width: 680px; height: 530px; position: absolute; overflow: hidden; display: none; border-radius: 10px;">
                        <div class="layui-layer-title" style="background: #e7e7e8;" id="popwindow_title">
                            <asp:Label ID="Label205" runat="server" Text="&lt;div&gt;&lt;img src=ImagesSkin/Update.png border=0 width=30px height=30px alt='BusinessForm' /&gt;&lt;/div&gt;"></asp:Label>
                        </div>
                        <div id="popwindow_content" class="layui-layer-content" style="overflow: auto; padding: 0px 5px 0px 5px;">

                             <iframe id="IFrame_BuildSite" src="TakeTopSoftRent_BuildSite.aspx" style="width:520px;height :540px; border :none;" runat="server"></iframe>

                        </div>
                        <div id="popwindow_footer" class="layui-layer-btn" style="border-top: 1px solid #ccc;">
                           <a class="layui-layer-btn notTab" onclick="return popClose();"><asp:Label ID="Label206" runat="server" Text="<%$ Resources:lang,GuanBi%>" /></a>
                        </div>
                        <span class="layui-layer-setwin"><a onclick="return popClose();" class="layui-layer-ico layui-layer-close layui-layer-close1 notTab" href="javascript:;"></a></span>
                    </div>

                     <div class="layui-layer-shade" id="popwindow_shade" style="z-index: 9998; background-color: #000; opacity: 0.3; filter: alpha(opacity=30); display: none;"></div>

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
