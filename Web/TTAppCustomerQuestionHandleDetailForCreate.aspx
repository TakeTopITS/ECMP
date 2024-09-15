<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTAppCustomerQuestionHandleDetailForCreate.aspx.cs" Inherits="TTAppCustomerQuestionHandleDetailForCreate" %>

<meta name="viewport" content="width=device-width; initial-scale=1.0; maximum-scale=1.0; minimum-scale=0.1; user-scalable=1" />

<%@ Register Assembly="Brettle.Web.NeatUpload" Namespace="Brettle.Web.NeatUpload"
    TagPrefix="Upload" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register Assembly="NickLee.Web.UI" Namespace="NickLee.Web.UI" TagPrefix="NickLee" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc2" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link id="mainCss" href="css/bluelightmain.css" rel="stylesheet" type="text/css" />
    <%-- <style type="text/css">
        body {
            /*margin-top: 5px;*/
            /*background-image: url(Images/login_bj.jpg);*/
            background-repeat: repeat-x;
            font: normal 100% Helvetica, Arial, sans-serif;
        }
    </style>--%>

    <style type="text/css">
        #AboveDiv {
            max-width: 1024px;
            width: expression (document.body.clientWidth >= 1024? "1024px" : "auto" ));
            min-width: 277px;
            width: expression (document.body.clientWidth <= 277? "277px" : "auto" ));
        }

        .auto-style1 {
            border-style: none;
            background-image: url('ImagesSkin/butbj.jpg');
            width: 71px;
            text-align: center;
            margin-left: 0px;
            margin-right: 0px;
            font-size: 12px;
            color: #000000;
            font-family: "microsoft yahei";
            cursor: pointer;
            height: 21px;
            margin-left: 0;
            margin-right: 0;
            margin-bottom: 2px;
        }
    </style>

    <script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="js/allAHandler.js"></script>
    <script type="text/javascript" language="javascript">
        $(function () {

        });
    </script>
</head>
<body>
    <center>
        <form id="form1" runat="server">
            <%--  <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="True" EnableScriptLocalization="True">--%>
            <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="True" EnableScriptLocalization="True">
            </asp:ScriptManager>

            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>

                        <table id="AboveTable" cellpadding="0" width="100%" cellspacing="0" class="bian">
                            <tr>
                                <td>

                                    <table cellpadding="0" cellspacing="0" border="0" width="100%">
                                        <tr>
                                            <td height="31" class="page_topbj">
                                                <table width="96%" border="0" align="center" cellpadding="0" cellspacing="0">
                                                    <tr>
                                                        <td align="left">
                                                            <%--<a href="TTAppCustomerQuestionRecord.aspx" onclick="javascript:document.getElementById('IMG_Waiting').style.display = 'block';">--%>
                                                             <a href="javascript:window.history.go(-1)" target ="_top" onclick="javascript:document.getElementById('IMG_Waiting').style.display = 'block';">
                                                                <table width="245" border="0" align="left" cellpadding="0" cellspacing="0">
                                                                    <tr>
                                                                        <td width="29">
                                                                            <img src="ImagesSkin/return.png" alt="" />
                                                                        </td>
                                                                        <td align="center" background="ImagesSkin/main_top_bj.jpg" class="titleziAPP"><asp:Label runat ="server" Text="<%$ Resources:lang,Back%>" />
                                                                        </td>
                                                                        <td width="5">
                                                                            <%-- <img src="ImagesSkin/main_top_r.jpg" width="5" height="31" />--%>
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                                  <img id="IMG_Waiting" src="Images/Processing.gif" alt="请稍候，处理中..." style ="display :none;" />
                                                            </a>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="padding-top: 5px">
                                                <table width="99%">
                                                    <tr>
                                                        <td colspan ="2" style="text-align: left; padding-left: 5px;">
                                                            <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,XuQiuMingCheng%>"></asp:Label>：<asp:Label ID="LB_ServiceID" runat="server"></asp:Label>
                                                            &nbsp;
                                                            <asp:Label ID="LB_ServiceName" runat="server"></asp:Label>
                                                            <br />
                                                            <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,KeHuMingCheng%>"></asp:Label>：<asp:Label ID="LB_CompanyName" runat="server"></asp:Label>
                                                             <br />
                                                            <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,LeiXing%>"></asp:Label>：<asp:Label ID="LB_Type" runat="server"></asp:Label>

                                                               <br />
                                                            <asp:Label ID="Label42" runat="server" Text="<%$ Resources:lang,LianXiRen%>"></asp:Label>
                                                            ：<asp:Label ID="LB_ContactPerson" runat="server"></asp:Label>
                                                            &nbsp;
                                                            <asp:HyperLink ID="HL_PhoneNumber" runat="server" Text =""></asp:HyperLink>
                                                        </td>
                                                    </tr>
                                                     <tr>
                                                        <td colspan="2" style="text-align: left; font-weight: bold; height: 24px; color: #394f66; background-image: url('ImagesSkin/titleBG.jpg')">
                                                             <table width="100%">
                                                                 <tr>
                                                                     <td align="center">
                                                                            <asp:Button ID="BT_Accept" runat="server" CssClass="inpu" OnClick="BT_Accept_Click"
                                                                    Text="<%$ Resources:lang,ShouLi%>" />
                                                                     </td>
                                                                         <td align="center">
                                                                              <asp:Button ID="BT_Exit" runat="server" CssClass="inpu" OnClick="BT_Exit_Click"
                                                                    Text="<%$ Resources:lang,TuiChuShouLi%>" />
                                                                     </td>
                                                                        <td align="center">
                                                                        <asp:DropDownList ID="DL_IsImportant" runat="server" AutoPostBack="true" OnSelectedIndexChanged="DL_IsImportant_SelectedIndexChanged">
                                                                            <asp:ListItem Value ="NO"  Text ="<%$ Resources:lang,PuTong%>" />
                                                                            <asp:ListItem Value ="YES" Text ="<%$ Resources:lang,ShangJi%>" />
                                                                        </asp:DropDownList>
                                                                     </td>
                                                                        <td align="center">

                                                                          <asp:Button ID="BT_Finish" runat="server" CssClass="auto-style1" OnClick="BT_Finish_Click"  Text="<%$ Resources:lang,WanCheng%>" />

                                                                          <asp:Button ID="BT_DeleteQuestion" runat="server" CssClass="inpu" Visible ="false"  Text="<%$ Resources:lang,ShanChu%>" OnClick="BT_DeleteQuestion_Click" OnClientClick="return confirm(getDeleteMsgByLangCode())" />
                                                                     </td>
                                                                 </tr>
                                                            </table>
                                                            </td>
                                                        </tr>
                                                     <tr>
                                                        <td colspan ="2" style="text-align: right;height :10px;" class="formItemBgStyle">
                                                        </td>
                                                    </tr>
                                                   <tr align ="left">
                                                         <td colspan="2" style="text-align: left; font-weight: bold; height: 24px; color: #394f66; background-image: url('ImagesSkin/titleBG.jpg')">
                                                            <table>
                                                                <tr>
                                                                    <td style ="padding-top :3px;">
                                                                        <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,ZhiJieChengYuan%>"></asp:Label>：
                                                                    </td>
                                                                    <td style ="padding-top :5px;">
                                                                        <asp:DropDownList ID="DL_Operator" DataTextField="UserName" DataValueField="UserCode" runat="server" >
                                                                        </asp:DropDownList></td>
                                                                    <td style ="padding-bottom :6px;">
                                                                        <asp:Button ID="BT_TransferOperator" runat="server" CssClass="inpuLong" Text="<%$ Resources:lang,ZhiDingWeiShouLiRen%>" OnClick="BT_TransferOperator_Click" /></td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>                                                     <tr>
                                                        <td align="right" style="width: 70px; " class="formItemBgStyle"> </td>
                                                        <td style=" text-align: right;" class="formItemBgStyle">
                                                            <asp:Button ID="BT_Create" runat="server" Text="<%$ Resources:lang,New%>" CssClass="inpuYello" OnClick="BT_Create_Click" />
                                                        </td>
                                                    </tr>

                                                    <tr>
                                                        <td colspan="2" align="left">

                                                            <asp:Label ID="Label16" runat="server" Text="<%$ Resources:lang,KeFuJiLu%>"></asp:Label>：<br />
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

                                                                                        <td width="20%" align="center">

                                                                                            <strong><asp:Label ID="Label17" runat="server" Text="<%$ Resources:lang,BianHao%>"></asp:Label></strong>
                                                                                        </td>

                                                                                        <td width="40%" align="center">

                                                                                            <strong><asp:Label ID="Label18" runat="server" Text="<%$ Resources:lang,LianXiRen%>"></asp:Label></strong>
                                                                                        </td>

                                                                                        <td  colspan ="2" align="center">

                                                                                            <strong><asp:Label ID="Label19" runat="server" Text="<%$ Resources:lang,ShouLiRen%>"></asp:Label></strong>
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

                                                                            <td class="tdLeft" style="width: 20%; text-align: center;">

                                                                                <asp:Button ID="BT_ID" runat="server" Text=' <%#DataBinder .Eval (Container .DataItem ,"ID") %> ' CssClass="inpu" CommandName="Update" />
                                                                            </td>

                                                                            <td class="tdLeft" style="width: 40%; padding-left: 5px; text-align: left;">

                                                                                <%#DataBinder.Eval(Container.DataItem, "CustomerAcceptor")%>
                                                                            </td>
                                                                            <td class="tdRight" colspan ="2" style="text-align: center;">

                                                                                <%#DataBinder .Eval (Container .DataItem ,"OperatorName") %>
                                                                            </td>
                                                                        </tr>

                                                                        <tr>

                                                                            <td class="tdLeft" style="text-align: center; font-size: 10pt;"><asp:Label ID="Label20" runat="server" Text="<%$ Resources:lang,KeFangYiJian%>"></asp:Label>
                                                                            </td>

                                                                            <td class="tdRight" colspan="2" style=" text-align: left; padding-left: 5px">

                                                                                <%#DataBinder.Eval(Container.DataItem, "CustomerComment")%>
                                                                            </td>
                                                                        </tr>
                                                                          <tr>
                                                                    <td class="tdLeft" style="text-align: center; font-size: 10pt;">
                                                                        <asp:Label ID="Label43" runat="server" Text="<%$ Resources:lang,LianXiRen%>"></asp:Label>
                                                                    </td>
                                                                    <td class="tdRight" colspan="2" style="text-align: left; padding-left: 5px">
                                                                        <%#DataBinder.Eval(Container.DataItem, "CustomerAcceptor")%> &nbsp;  
                                                                        
                                                                        <a href='tel:<%#DataBinder.Eval(Container.DataItem, "AcceptorContactWay")%>' target ="_blank"> <%#DataBinder .Eval (Container .DataItem,"AcceptorContactWay") %>  </a>
                                                                    </td>
                                                                </tr>
                                                                        <tr>

                                                                            <td class="tdLeft" style=" text-align: center; font-size: 10pt;"><asp:Label ID="Label21" runat="server" Text="<%$ Resources:lang,ChuLiNeiRong%>"></asp:Label>
                                                                            </td>

                                                                            <td class="tdRight" colspan="2" style="text-align: left; padding-left: 5px">

                                                                                <%#DataBinder.Eval(Container.DataItem, "HandleDetail")%>
                                                                            </td>
                                                                        </tr>

                                                                        <tr>

                                                                            <td class="tdLeft" style=" text-align: center; "><asp:Label ID="Label22" runat="server" Text="<%$ Resources:lang,XiaCiFuWuShiJian%>"></asp:Label>
                                                                            </td>

                                                                            <td class="tdRight" colspan ="2" style="text-align: left; padding-left: 5px">

                                                                                <%#DataBinder.Eval(Container.DataItem, "NextServiceTime")%>
                                                                            </td>
                                                                        </tr>
                                                                         <tr>

                                                                            <td class="tdLeft" style="text-align: center; "><asp:Label ID="Label23" runat="server" Text="<%$ Resources:lang,TiQianTongZhiTianShu%>"></asp:Label>
                                                                            </td>

                                                                            <td class="tdRight"  colspan ="2" style="text-align: left; padding-left: 5px">

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
                                                <br />
                                            </td>
                                        </tr>
                                        <tr style="display: none;">
                                            <td style="text-align: Right;" colspan="2">
                                                <asp:DataList ID="DataList2" runat="server" CellPadding="0" ForeColor="#333333" Height="1px"
                                                    Width="100%" Style="display: none;">
                                                    <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                    <HeaderTemplate>
                                                        <table width="100%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                                            <tr>
                                                                <td width="7">
                                                                    <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" /></td>
                                                                <td>
                                                                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                        <tr>
                                                                            <td width="5%" align="center">
                                                                                <strong><asp:Label ID="Label24" runat="server" Text="<%$ Resources:lang,BianHao%>"></asp:Label></strong>
                                                                            </td>
                                                                            <td width="10%" align="center">
                                                                                <strong><asp:Label ID="Label25" runat="server" Text="<%$ Resources:lang,FuWuLeiXing%>"></asp:Label></strong>
                                                                            </td>
                                                                            <td width="10%" align="center">
                                                                                <strong><asp:Label ID="Label26" runat="server" Text="<%$ Resources:lang,LianXiRen%>"></asp:Label></strong>
                                                                            </td>
                                                                            <td width="10%" align="center">
                                                                                <strong><asp:Label ID="Label27" runat="server" Text="<%$ Resources:lang,YaoQiuDaFuShiJian%>"></asp:Label></strong>
                                                                            </td>
                                                                            <td width="13%" align="center">
                                                                                <strong><asp:Label ID="Label28" runat="server" Text="<%$ Resources:lang,KeHuMingCheng%>"></asp:Label></strong>
                                                                            </td>
                                                                            <td width="10%" align="center">
                                                                                <strong><asp:Label ID="Label29" runat="server" Text="<%$ Resources:lang,LianXiFangFa%>"></asp:Label></strong>
                                                                            </td>
                                                                            <td width="10%" align="center">
                                                                                <strong><asp:Label ID="Label30" runat="server" Text="<%$ Resources:lang,EMail%>"></asp:Label></strong>
                                                                            </td>
                                                                            <td width="5%" align="center">
                                                                                <strong><asp:Label ID="Label31" runat="server" Text="<%$ Resources:lang,YouBian%>"></asp:Label></strong>
                                                                            </td>
                                                                            <td width="10%" align="center">
                                                                                <strong><asp:Label ID="Label32" runat="server" Text="<%$ Resources:lang,TiJiaoShiJian%>"></asp:Label></strong>
                                                                            </td>
                                                                            <td width="5%" align="center">
                                                                                <strong><asp:Label ID="Label33" runat="server" Text="<%$ Resources:lang,ZhuangTai%>"></asp:Label></strong>
                                                                            </td>
                                                                            <td width="7%" align="center">
                                                                                <strong><asp:Label ID="Label34" runat="server" Text="<%$ Resources:lang,ShouLiRen%>"></asp:Label></strong>
                                                                            </td>
                                                                            <td width="5%" align="center">
                                                                                <strong><asp:Label ID="Label35" runat="server" Text="<%$ Resources:lang,JiLuRen%>"></asp:Label></strong>
                                                                            </td>
                                                                        </tr>
                                                                    </table>
                                                                </td>
                                                                <td width="7" align="right">
                                                                    <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" /></td>
                                                            </tr>
                                                        </table>
                                                    </HeaderTemplate>
                                                    <ItemTemplate>
                                                        <table border="0" cellpadding="4" cellspacing="0" width="100%">
                                                            <tr>
                                                                <td class="tdLeft" style="width: 5%; text-align: center;">
                                                                    <%#DataBinder .Eval (Container .DataItem ,"ID") %>
                                                                </td>
                                                                <td class="tdLeft" style="width: 10%; padding-left: 5px; text-align: center;">
                                                                    <%#DataBinder .Eval (Container .DataItem,"Type") %>
                                                                </td>
                                                                <td class="tdLeft" style="width: 10%; text-align: center;">
                                                                    <%#DataBinder .Eval (Container .DataItem,"ContactPerson") %>
                                                                </td>
                                                                <td class="tdLeft" style="width: 10%; text-align: center;">
                                                                    <%#DataBinder.Eval(Container.DataItem, "AnswerTime", "{0:yyyy/MM/dd}")%>
                                                                </td>
                                                                <td class="tdLeft" style="width: 13%; text-align: center;">
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
                                                                <td class="tdLeft" style="width: 10%; text-align: center;">
                                                                    <%#DataBinder.Eval(Container.DataItem, "SummitTime", "{0:yyyy/MM/dd hh:MM:ss}")%>
                                                                </td>
                                                                <td class="tdLeft" style="width: 5%; text-align: center;">
                                                                    <%#DataBinder .Eval (Container .DataItem, "Status") %>
                                                                </td>
                                                                <td class="tdRight" style="width: 7%; text-align: center;">
                                                                    <%#DataBinder .Eval (Container .DataItem, "OperatorName") %>
                                                                </td>
                                                                <td class="tdRight" style="width: 5%; text-align: center;">
                                                                    <%#DataBinder .Eval (Container .DataItem, "RecorderCode") %>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td class="tdLeft" style="width: 5%; text-align: center; font-size: 10pt;"><asp:Label ID="Label36" runat="server" Text="<%$ Resources:lang,WenTi%>"></asp:Label>
                                                                </td>
                                                                <td class="tdRight" colspan="7" style="width: 95%; text-align: left; padding-left: 5px">

                                                                    <%#DataBinder .Eval (Container .DataItem,"Question") %>
                                                                </td>
                                                                <td class="tdLeft" style="text-align: Center;">
                                                                    <%#DataBinder .Eval (Container .DataItem, "UserIP") %>
                                                                </td>
                                                                <td class="tdRight" colspan="3" style="text-align: Left;">
                                                                    <%#DataBinder .Eval (Container .DataItem, "UserPosition") %>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </ItemTemplate>
                                                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />

                                                    <ItemStyle CssClass="itemStyle" />
                                                </asp:DataList>
                                                <table cellpadding="5" cellspacing="0" border="0" width="100%">
                                                    <tr>
                                                        <td colspan="11" class="tdTopLine"></td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr style="display: none;">
                                            <td align="left">
                                                <asp:HyperLink ID="HL_RelatedDoc" runat="server" NavigateUrl="TTCollaborationRelatedDoc.aspx"
                                                    ><asp:Label ID="Label37" runat="server" Text="<%$ Resources:lang,XiangGuanWenJian%>"></asp:Label></asp:HyperLink>

                                                &nbsp;

                                                                         <asp:HyperLink ID="HL_Expense" runat="server" NavigateUrl="TTProExpense.aspx" >---><asp:Label ID="Label38" runat="server" Text="<%$ Resources:lang,FeiYongMingXiYuBaoXiao%>"></asp:Label></asp:HyperLink>

                                                &nbsp;

                                                                        <asp:HyperLink ID="HL_ResoveResultReview"
                                                                            runat="server" NavigateUrl="TTCustomerQuestionResultReviewWF.aspx" >---><asp:Label ID="Label39" runat="server" Text="<%$ Resources:lang,TiJiaoPingShen%>"></asp:Label></asp:HyperLink>

                                                &nbsp;
                                                <asp:HyperLink ID="HL_QuestionToCustomer" runat="server" >--><asp:Label ID="Label40" runat="server" Text="<%$ Resources:lang,ZhuanChengKeHuHuoGuanLianKeHu%>"></asp:Label></asp:HyperLink>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>

                    <div class="layui-layer layui-layer-iframe" id="popDetailWindow" name="fixedDiv"
                        style="z-index: 9999; width: 98%; height: 500px; position: absolute; overflow: hidden; display: none; border-radius:10px;">
                        <div class="layui-layer-title"  style="background:#e7e7e8;" id="popwindow_title">
                            <asp:Label ID="Label5" runat="server" Text="&lt;div&gt;&lt;img src=ImagesSkin/Update.png border=0 width=30px height=30px alt='BusinessForm' /&gt;&lt;/div&gt;"></asp:Label>
                        </div>
                        <div id="popwindow_content" class="layui-layer-content" style="overflow: auto; padding :0px 5px 0px 5px;">

                            <table style="width: 100%; padding: 5px 0px 0px 5px" cellpadding="3" cellspacing="0" class="formBgStyle">

                                <tr>
                                    <td style="text-align: left;" class="formItemBgStyle"><asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,KeHuYiJian%>"></asp:Label>
                                    </td>
                               </tr>
                                <tr>
                                    <td style="text-align: left;" class="formItemBgStyle">

                                        <CKEditor:CKEditorControl ID="HE_CustomerComment" runat="server" Width="99%" Height="170px" Visible="false" />
                                        <CKEditor:CKEditorControl runat="server" ID="HT_CustomerComment" Width="99%" Height="170px" Visible="False" />
                                    </td>
                                </tr>
                                <tr>
                                    <td style="text-align: left;" class="formItemBgStyle"><asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,ChuLiFangShi%>"></asp:Label>
                                    </td>
                                  </tr>
                                <tr>
                                    <td style="text-align: left;" class="formItemBgStyle">
                                        <asp:TextBox ID="TB_HandleWay" runat="server" Width="60%"></asp:TextBox>
                                        <asp:DropDownList ID="DL_HandleWay" runat="server"  AutoPostBack="true" OnSelectedIndexChanged="DL_ContactWay_SelectedIndexChanged">
                                            <asp:ListItem Value="" Text="<%$ Resources:lang,QingXuanZe%>" />
                                            <asp:ListItem Value="电话" Text="<%$ Resources:lang,DianHua%>" />
                                            <asp:ListItem Value="即时通讯" Text="<%$ Resources:lang,IM%>" />
                                            <asp:ListItem Value="远程控制" Text="<%$ Resources:lang,YuanChengKongZhi%>" />
                                            <asp:ListItem Value="EMail" Text="<%$ Resources:lang,EMail%>" />
                                            <asp:ListItem Value="上门拜访" Text="<%$ Resources:lang,ShangMenBaiFang%>" />
                                            <asp:ListItem Value="其它方式" Text="<%$ Resources:lang,QiTaFangShi%>" />
                                        </asp:DropDownList>
                                            <asp:Label ID="LB_ID" runat="server" Visible ="false" ></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="formItemBgStyle" style="text-align: left;"><asp:Label ID="Label8" runat="server" Text="<%$ Resources:lang,ZhuangTai%>"></asp:Label> </td>
                                    </tr>
                                <tr>
                                    
                                    <td class="formItemBgStyle" style="text-align: left;">
                                        <asp:DropDownList ID="DL_HandleStatus" runat="server"  Width="99%">
                                            <asp:ListItem Value="处理中" Text="<%$ Resources:lang,ChuLiZhong%>" />
                                            <asp:ListItem Value="评审中" Text="<%$ Resources:lang,PingShenZhong%>" />
                                            <asp:ListItem Value="挂起" Text="<%$ Resources:lang,GuaQi%>" />
                                            <asp:ListItem Value="完成" Text="<%$ Resources:lang,WanCheng%>" />
                                            <asp:ListItem Value="取消" Text="<%$ Resources:lang,QuXiao%>" />
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="formItemBgStyle" style="text-align: left;"><asp:Label ID="Label9" runat="server" Text="<%$ Resources:lang,YongShi%>"></asp:Label> </td>
                                 
                                  </tr>
                                <tr>    
                                    <td class="formItemBgStyle" style="text-align: left;">
                                        <NickLee:NumberBox ID="NB_UsedTime" runat="server" MaxAmount="1000000000000" MinAmount="-1000000000000" Width="60%" Amount="1">1.00</NickLee:NumberBox>
                                        <asp:DropDownList ID="DL_TimeUnit" runat="server"  >
                                            <asp:ListItem Value="分钟" Text="<%$ Resources:lang,FenZhong%>" />
                                            <asp:ListItem Value="小时" Text="<%$ Resources:lang,XiaoShi%>" />
                                            <asp:ListItem Value="天" Text="<%$ Resources:lang,Tian%>" />
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="text-align: left;" class="formItemBgStyle"><asp:Label ID="Label10" runat="server" Text="<%$ Resources:lang,LianLuoRen%>"></asp:Label>
                                    </td>
                                  </tr>
                                <tr>
                                    
                                    <td style="text-align: left;" class="formItemBgStyle">
                                        <asp:TextBox ID="TB_CustomerAcceptor" runat="server" Width="60%"></asp:TextBox>
                                        <asp:HyperLink ID="HL_AcceptorContactWay" runat="server"></asp:HyperLink>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="formItemBgStyle" style="text-align: left;"><asp:Label ID="Label11" runat="server" Text="<%$ Resources:lang,LianXiFangFa%>"></asp:Label> </td>
                                  </tr>
                                <tr>
                                    
                                    <td class="formItemBgStyle" style="text-align: left;">
                                        <asp:TextBox ID="TB_AcceptorContactWay" runat="server" Width="90%"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="text-align: left;" class="formItemBgStyle"><asp:Label ID="Label12" runat="server" Text="<%$ Resources:lang,ChuLiNeiRong%>"></asp:Label>
                                    </td>
                                    </tr>
                                <tr> 
                                    
                                    <td style="text-align: left;" class="formItemBgStyle">
                                        <CKEditor:CKEditorControl ID="HE_HandleDetail" runat="server" Width="90%" Height="170" Visible="false" />
                                        <CKEditor:CKEditorControl runat="server" ID="HT_HandleDetail" Width="90%" Height="170" Visible="False" />
                                            <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional" Visible ="false">
                                            <ContentTemplate>
                                                <div>
                                                    <Upload:InputFile ID="AttachFile" runat="server" Width="180px" />

                                                    &nbsp;<asp:Button ID="BtnUP" runat="server" OnClick="BtnUP_Click" OnClientClick="javascript:document.getElementById('IMG_Uploading').style.display = 'block';" Text="<%$ Resources:lang,ShiYong%>" />
                                                    <img id="IMG_Uploading" src="Images/Processing.gif" alt="请稍候，处理中..." style="display: none;" />

                                                    <br />

                                                        <%--
                                                        <div id="ProgressBar">
                                                        <Upload:ProgressBar ID="ProgressBar1" runat='server' Width="500px" Height="100px">
                                                        </Upload:ProgressBar>
                                                        </div>
                                                        --%>
                                                </div>
                                            </ContentTemplate>
                                            <Triggers>
                                                <asp:PostBackTrigger ControlID="BtnUP" />
                                            </Triggers>
                                        </asp:UpdatePanel>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="text-align: left;" class="formItemBgStyle"><asp:Label ID="Label13" runat="server" Text="<%$ Resources:lang,XiaCi%>"></asp:Label>
                                    </td>
                                   </tr>
                                <tr>
                                    
                                    <td style="text-align: left;" class="formItemBgStyle">
                                        <asp:TextBox ID="DLC_NextServiceTime" ReadOnly="false" runat="server" Width="99%"></asp:TextBox>
                                        <ajaxToolkit:CalendarExtender Format="yyyy-MM-dd" ID="CalendarExtender1" runat="server" TargetControlID="DLC_NextServiceTime">
                                        </ajaxToolkit:CalendarExtender>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="formItemBgStyle" style="text-align: left;"><asp:Label ID="Label14" runat="server" Text="<%$ Resources:lang,TiQian%>"></asp:Label> </td>
                                    </tr>
                                <tr>
                                    
                                    <td class="formItemBgStyle" style="text-align: left;">
                                        <NickLee:NumberBox ID="NB_PreDays" runat="server" MaxAmount="1000000000000" MinAmount="-1000000000000" Precision="0" Width="90%">0</NickLee:NumberBox>
                                        <asp:Label ID="Label15" runat="server" Text="<%$ Resources:lang,Tian%>"></asp:Label></td>
                                </tr>
                                <tr style ="display :none;">
                                    <td style="text-align: center;" class="formItemBgStyle" colspan="2">
                                        <asp:Button ID="BT_Add" runat="server" CssClass="inpu" OnClick="BT_Add_Click" Text="<%$ Resources:lang,XinJian%>" />
                                        <asp:Button ID="BT_Update" runat="server" CssClass="inpu" Enabled="false" OnClick="BT_Update_Click" Text="<%$ Resources:lang,BaoCun%>" />
                                        <asp:Button ID="BT_Delete" runat="server" CssClass="inpu" Enabled="false" OnClick="BT_Delete_Click" OnClientClick="return confirm(getDeleteMsgByLangCode())" Text="<%$ Resources:lang,ShanChu%>" />
                                    </td>
                                </tr>
                            </table>
                        </div>

                        <div id="popwindow_footer" class="layui-layer-btn" style="border-top: 1px solid #ccc;">
                            <asp:LinkButton ID="BT_New" runat="server" class="layui-layer-btn notTab" OnClick="BT_New_Click" Text="<%$ Resources:lang,BaoCun%>"></asp:LinkButton><a class="layui-layer-btn notTab" onclick="return popClose();"><asp:Label ID="Label41" runat="server" Text="<%$ Resources:lang,GuanBi%>" /></a>
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
