<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TakeTopSoftRent_TakeTopSoftCloud.aspx.cs" Inherits="TakeTopSoftRent_TakeTopSoftCloud" %>

<meta name="viewport" content="width=device-width; initial-scale=1.0; maximum-scale=1.0; minimum-scale=0.1; user-scalable=1" />

<meta content="企业云、企业管理软件、在线租用" name="keywords">
<meta content="企业云，提供企业管理软件在线租用服务。" name="description">
<meta charset="utf-8" />
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>在线租用---泰顶拓鼎</title>
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
    </style>

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
                                                <p class="zuyong" style ="text-align:center;">
                                                   <strong>   泰鼎云 — 降低成本、即时开通、基于阿里云、安全可靠</strong>
                                                </p>
                                                <p class="zuyong" >
                                                    &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;在泰鼎云上租用泰顶拓鼎项目管理软件（SAAS模式，按人按月付费），请在下面填写申请，整个系统的开通和维护都由专业人员负责，我们将会提供远程实施指导服务！
                                                </p>
                                                <div id="id4">
                                                    <h3>1&nbsp;&nbsp;价格表   <h3>
                                                    <div class="main">
                                                        <p style="text-align :center;padding-bottom:30px; font-size :28px;">
                                                            <br />
                                                            <span style=" text-align :center; font-size:small;">
                                                              <a href="TakeTopSoftModuleChart_TakeTopSoftCloud.html" target="_blank">功能模块与价格</a>
                                                            </span>
                                                        </p>
                                                    </div>
                                                        <p>
                                                            &nbsp;各版本价格参见 
                                                        </p>
                                                        <table border="1" class="ziti" style="text-align: center; width: 95%; border-collapse: collapse; border: 1px dotted #C0C0C0;">
                                                            <tr>
                                                                <td width="25%">&nbsp;</td>
                                                                <td><strong>标准版</strong><br /> </td>
                                                                <td><strong>企业版</strong><br /> </td>
                                                                <td><strong>集团版</strong></td>
                                                            </tr>
                                                            <tr>
                                                                <td>价格</td>
                                                                <td>10元/人/月</td>
                                                                <td>15元/人/月</td>
                                                                <td>20元/人/月</td>
                                                            </tr>
                                                            <tr>
                                                                <td>模块</td>
                                                                <td><a href="TakeTopSoftModuleChart_TakeTopSoftCloud.html" target="_blank">查看</a></td>
                                                                <td><a href="TakeTopSoftModuleChart_TakeTopSoftCloud.html" target="_blank">查看</a></td>
                                                                <td><a href="TakeTopSoftModuleChart_TakeTopSoftCloud.html" target="_blank">查看</a></td>
                                                            </tr>
                                                            <tr>
                                                                <td>记录数</td>
                                                                <td>不限</td>
                                                                <td>不限</td>
                                                                <td>不限</td>
                                                            </tr>
                                                            <tr>
                                                                <td>微信/APP</td>
                                                                <td>支持</td>
                                                                <td>支持</td>
                                                                <td>支持</td>
                                                            </tr>
                                                            <tr>
                                                                <td>集团管控</td>
                                                                <td>不支持</td>
                                                                <td>不支持</td>
                                                                <td>支持</td>
                                                            </tr>
                                                            <tr>
                                                                <td>远程服务</td>
                                                                <td>支持</td>
                                                                <td>支持</td>
                                                                <td>支持</td>
                                                            </tr>
                                                            <tr>
                                                                <td>存储空间 </td>
                                                                <td colspan="3" style="text-align :center;">提供10G免费空间，扩容费5元/G/月 </td>
                                                            </tr>
                                                        </table>
                                                        <span style="font-size:small; color:grey;">&nbsp;&nbsp;*“人”指要登录使用系统的人，非企业员工总数</span>
                                                        <h3></h3>
                                                        <h3></h3>
                                                        <h3></h3>
                                                        <h3></h3>
                                                        <h3></h3>
                                                    </h3>
                                                </div>
                                                <div id="id5">
                                                    <h3>2&nbsp;&nbsp;租用申请</h3>
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
                                                                    <asp:ListItem>--------------</asp:ListItem>
                                                                    <asp:ListItem>协同OA平台</asp:ListItem>
                                                                    <asp:ListItem>客户关系管理平台</asp:ListItem>
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
                                                                公司</td>
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
                                                        <tr>
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
                                                        <tr >
                                                            <td class="formItemBgStyle">
                                                                &nbsp;</td>
                                                            <td class="formItemBgStyle">
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
                                                                <font color="#FF0000">*</font> </td>
                                                        </tr>
                                                    </table>

                                                       <br/>

                                                    <li>提交成功后，客服将会立刻联系你并为你开通平台！</li>
                                                    <li>你也可以直接联系客服：<br />
                                                        &nbsp;&nbsp;<a href="tencent://message/?uin=3166455252&amp;Site=&amp;Menu=yes"><img align="absmiddle" src="images/qq.png" />客服QQ</a>，电话：<a href="tel:02151085119" class="call">021-51085119</a>。<br />
                                                    </li>
                                                </div>
                                                <div id="id7" class="section">
                                                    <h2>3&nbsp;&nbsp;附加说明</h2>
                                                    <ul style="list-style: upper-alpha;">
                                                        <li>平台开通后，客服会培训你试用，试用期不超一周！</li>
                                                        <li>试用满意后，必须付费才能继续使用，如付费期间中断续费，系统会进入为期30天的封存保留期。封存期不能使用系统，但可以下载备份相关系统数据，继续使用需要续费。</li>
                                                       <li>可用支付宝( saas@taketopsoft.com )或银行转账方式缴费，方便快捷。</li>
                                                    </ul>

                                                      <table style ="font-size :large;">
                                                          <tr>
                                                            <td>
                                                              <asp:Image ID="IMG_TakeTopAliPay"  ImageUrl ="Images/TakeTopSAASAliPay.png" Width ="320" Height ="320" runat="server"></asp:Image>
                                                               </td>
                                                               <td style="vertical-align:middle;" class="section">
                                                                  开户行：招商银行股份有限公司上海浦东大道支行
                                                                <br />
                                                                <br />
                                                                   开户名：策顶信息科技（上海）有限公司 
                                                                <br />
                                                                <br />
                                                                  账号：121916330110501
                                                            </td>
                                                         </tr>
                                                      </table>
                                                     
                                                </div>

                                            </td>

                                        </tr>
                                    </table>
                                </div>
                            </td>
                        </tr>
                    </table>

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
