<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTWZSendList.aspx.cs" Inherits="TTWZSendList" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>发料单</title>
    <link id="mainCss" href="css/bluelightmain.css" rel="stylesheet" type="text/css" />
    <script src="js/jquery-1.7.2.min.js"></script>
    <script src="js/allAHandler.js"></script>
    <script language="javascript">

        $(function () { 

           

            ControlStatusCloseChange();

        });


        function ControlStatusChange(objProgress) {

            $("#BT_NewEdit").attr("class", "inpu");
            $("#BT_NewEdit").removeAttr("disabled");                          //编辑
            $("#BT_NewDelete").attr("class", "inpu");
            $("#BT_NewDelete").removeAttr("disabled");                          //删除
            $("#BT_NewPrint").attr("class", "inpu");
            $("#BT_NewPrint").removeAttr("disabled");                          //打印

            //alert(objProgress);
            if (objProgress == "录入") {
                $("#BT_NewSubmit").attr("class", "inpu");
                $("#BT_NewSubmit").removeAttr("disabled");                            //提交
                $("#BT_NewTicketReturn").attr("disabled", "disabled");
                $("#BT_NewTicketReturn").removeClass("inpu");                         //开票退回
                $("#BT_NewCheckReturn").attr("disabled", "disabled");
                $("#BT_NewCheckReturn").removeClass("inpu");                         //材检退回
            }
            else if (objProgress == "开票") {
                $("#BT_NewSubmit").attr("disabled", "disabled");
                $("#BT_NewSubmit").removeClass("inpu");                            //提交
                $("#BT_NewTicketReturn").attr("class", "inpu");
                $("#BT_NewTicketReturn").removeAttr("disabled");                         //开票退回
                $("#BT_NewCheckReturn").attr("disabled", "disabled");
                $("#BT_NewCheckReturn").removeClass("inpu");                          //材检退回
            }
            else if (objProgress == "材检") {
                $("#BT_NewSubmit").attr("disabled", "disabled");
                $("#BT_NewSubmit").removeClass("inpu");                            //提交
                $("#BT_NewTicketReturn").attr("disabled", "disabled");
                $("#BT_NewTicketReturn").removeClass("inpu");                         //开票退回
                $("#BT_NewCheckReturn").attr("class", "inpu");
                $("#BT_NewCheckReturn").removeAttr("disabled");                         //材检退回
            }
            else {
                $("#BT_NewEdit").attr("disabled", "disabled");
                $("#BT_NewEdit").removeClass("inpu");
                $("#BT_NewDelete").attr("disabled", "disabled");
                $("#BT_NewDelete").removeClass("inpu");
                $("#BT_NewSubmit").attr("disabled", "disabled");
                $("#BT_NewSubmit").removeClass("inpu");
                $("#BT_NewTicketReturn").attr("disabled", "disabled");
                $("#BT_NewTicketReturn").removeClass("inpu");
                $("#BT_NewCheckReturn").attr("disabled", "disabled");
                $("#BT_NewCheckReturn").removeClass("inpu");
                $("#BT_NewPrint").attr("disabled", "disabled");
                $("#BT_NewPrint").removeClass("inpu");
            }

        }



        function ControlStatusCloseChange() {
            $("#BT_NewEdit").attr("disabled", "disabled");
            $("#BT_NewEdit").removeClass("inpu");
            $("#BT_NewDelete").attr("disabled", "disabled");
            $("#BT_NewDelete").removeClass("inpu");
            $("#BT_NewSubmit").attr("disabled", "disabled");
            $("#BT_NewSubmit").removeClass("inpu");
            $("#BT_NewTicketReturn").attr("disabled", "disabled");
            $("#BT_NewTicketReturn").removeClass("inpu");
            $("#BT_NewCheckReturn").attr("disabled", "disabled");
            $("#BT_NewCheckReturn").removeClass("inpu");
            $("#BT_NewPrint").attr("disabled", "disabled");
            $("#BT_NewPrint").removeClass("inpu");
        }

    </script>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="True" EnableScriptLocalization="True">
        </asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <div>
                    <div id="AboveDiv">
                        <table id="AboveTable" cellpadding="0" width="100%" cellspacing="0" class="bian">
                            <tr>
                                <td height="31" class="page_topbj">
                                    <table width="96%" border="0" align="center" cellpadding="0" cellspacing="0">
                                        <tr>
                                            <td align="left">
                                                <table width="345" border="0" align="left" cellpadding="0" cellspacing="0">
                                                    <tr>
                                                        <td width="29">
                                                            <%--<img src="Logo/main_top_l.jpg" alt="" width="29" height="31" />--%>
                                                        </td>
                                                        <td align="center" background="ImagesSkin/main_top_bj.jpg" class="titlezi">
                                                            <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,FaLiaoDan%>"></asp:Label>
                                                        </td>
                                                        <td width="5">
                                                            <%-- <img src="ImagesSkin/main_top_r.jpg" width="5" height="31" />--%>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td style="padding: 0px 5px 5px 5px;" valign="top">
                                    <table width="100%" cellpadding="0" cellspacing="0">
                                        <tr>
                                            <td align="left" class="formItemBgStyle">
                                                <table class="formBgStyle" width="40%">
                                                    <tr>
                                                        <td class="formItemBgStyle">
                                                            <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,FaLiaoDanHao%>"></asp:Label>：
                                                        </td>
                                                        <td style="text-align: left" class="formItemBgStyle" colspan="5">
                                                            <asp:TextBox ID="TXT_SendCode" runat="server" ReadOnly="true"></asp:TextBox>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="text-align: left" class="formItemBgStyle">
                                                            <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,WuZiDaiMa%>"></asp:Label>：</td>
                                                        <td style="text-align: left" class="formItemBgStyle">
                                                            <asp:TextBox ID="TXT_ObjectCode" runat="server"></asp:TextBox>
                                                        </td>
                                                        <td style="text-align: left" class="formItemBgStyle">
                                                            <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,FaLiaoFangShi%>"></asp:Label>：</td>
                                                        <td style="text-align: left" class="formItemBgStyle">
                                                            <asp:DropDownList ID="DDL_SendMethod" runat="server" AutoPostBack="true" OnSelectedIndexChanged="DDL_SendMethod_SelectedIndexChanged">
                                                                <asp:ListItem Text="" Value=""/>
                                                                <asp:ListItem Text="<%$ Resources:lang,LanPiao%>" Value="蓝票"/>
                                                                <asp:ListItem Text="<%$ Resources:lang,HongPiao%>" Value="红票"/>
                                                            </asp:DropDownList>
                                                        </td>
                                                        <td style="text-align: left" class="formItemBgStyle">
                                                            <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,JianHao%>"></asp:Label>：</td>
                                                        <td style="text-align: left" class="formItemBgStyle">
                                                            <asp:TextBox ID="TXT_CheckCode" runat="server"></asp:TextBox>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="text-align: left" class="formItemBgStyle">
                                                            <asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,FaLiaoRiQi%>"></asp:Label>：</td>
                                                        <td style="text-align: left" class="formItemBgStyle">
                                                            <asp:TextBox ID="TXT_TicketTime" runat="server"></asp:TextBox>
                                                        </td>
                                                        <td style="text-align: left" class="formItemBgStyle">
                                                            <asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,HuoWeiHao%>"></asp:Label>：</td>
                                                        <td style="text-align: left" class="formItemBgStyle">
                                                            <asp:TextBox ID="TXT_GoodsCode" runat="server"></asp:TextBox>
                                                        </td>
                                                        <td style="text-align: left" class="formItemBgStyle">
                                                            <asp:Label ID="Label8" runat="server" Text="<%$ Resources:lang,KuBie%>"></asp:Label>：</td>
                                                        <td style="text-align: left" class="formItemBgStyle">
                                                            <asp:DropDownList ID="DDL_StoreRoom" runat="server" DataTextField="StockCode" DataValueField="StockCode"></asp:DropDownList>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="text-align: left" class="formItemBgStyle">
                                                            <asp:Label ID="Label9" runat="server" Text="<%$ Resources:lang,JiHuaDanJia%>"></asp:Label>：</td>
                                                        <td style="text-align: left" class="formItemBgStyle">
                                                            <asp:TextBox ID="TXT_PlanPrice" runat="server"></asp:TextBox>
                                                        </td>
                                                        <td style="text-align: left" class="formItemBgStyle">
                                                            <asp:Label ID="Label10" runat="server" Text="<%$ Resources:lang,JiHuaJinE%>"></asp:Label>：</td>
                                                        <td style="text-align: left" class="formItemBgStyle">
                                                            <asp:TextBox ID="TXT_PlanMoney" runat="server"></asp:TextBox>
                                                        </td>
                                                        <td style="text-align: left" class="formItemBgStyle">
                                                            <asp:Label ID="Label11" runat="server" Text="<%$ Resources:lang,JianZhiJinE%>"></asp:Label>：</td>
                                                        <td style="text-align: left" class="formItemBgStyle">
                                                            <asp:TextBox ID="TXT_DownMoney" runat="server"></asp:TextBox>&nbsp;
                                                            <asp:HiddenField ID="HF_DownRatio" runat="server" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="text-align: left" class="formItemBgStyle">
                                                            <asp:Label ID="Label12" runat="server" Text="<%$ Resources:lang,ShiFaShuLiang%>"></asp:Label>：</td>
                                                        <td style="text-align: left" class="formItemBgStyle">
                                                            <asp:TextBox ID="TXT_ActualNumber" runat="server"></asp:TextBox>&nbsp;
                                                            <asp:Button ID="BT_Calc" runat="server" Text="<%$ Resources:lang,JiSuan%>" CssClass="inpu" OnClick="BT_Calc_Click" />&nbsp;
                                                        </td>
                                                        <td style="text-align: left" class="formItemBgStyle">
                                                            <asp:Label ID="Label13" runat="server" Text="<%$ Resources:lang,XiaoShouDanJia%>"></asp:Label>：</td>
                                                        <td style="text-align: left" class="formItemBgStyle">
                                                            <asp:TextBox ID="TXT_SalePrice" runat="server" ReadOnly="true"></asp:TextBox>
                                                        </td>
                                                        <td style="text-align: left" class="formItemBgStyle">
                                                            <asp:Label ID="Label14" runat="server" Text="<%$ Resources:lang,GuanLiFeiLv%>"></asp:Label>：</td>
                                                        <td style="text-align: left" class="formItemBgStyle">
                                                            <asp:TextBox ID="TXT_ManageRate" runat="server" ReadOnly="true"></asp:TextBox>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="text-align: left" class="formItemBgStyle">
                                                            <asp:Label ID="Label15" runat="server" Text="<%$ Resources:lang,JingE%>"></asp:Label>：</td>
                                                        <td style="text-align: left" class="formItemBgStyle">
                                                            <asp:TextBox ID="TXT_CleanMoney" runat="server"></asp:TextBox>
                                                        </td>
                                                        <td style="text-align: left" class="formItemBgStyle">
                                                            <asp:Label ID="Label16" runat="server" Text="<%$ Resources:lang,JianZhiBianHao%>"></asp:Label>：</td>
                                                        <td style="text-align: left" class="formItemBgStyle">
                                                            <asp:TextBox ID="TXT_ReduceCode" runat="server"></asp:TextBox>
                                                        </td>
                                                        <td style="text-align: left" class="formItemBgStyle">
                                                            <asp:Label ID="Label17" runat="server" Text="<%$ Resources:lang,JiYaBianHao%>"></asp:Label>：</td>
                                                        <td style="text-align: left" class="formItemBgStyle">
                                                            <asp:TextBox ID="TXT_WearyCode" runat="server"></asp:TextBox>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                         <td style="text-align: left" class="formItemBgStyle">
                                                            <asp:Label ID="Label112" runat="server" Text="<%$ Resources:lang,ChePaiHaoMa%>"></asp:Label>：
                                                        </td>
                                                        <td align="left" class="formItemBgStyle">
                                                            <asp:DropDownList ID="DL_CarCode" runat="server" DataTextField="CarCode" DataValueField="CarCode"
                                                                Width="150px">
                                                            </asp:DropDownList>
                                                         
                                                        </td>
                                                        <td class="formItemBgStyle" style="text-align: left">
                                                              <asp:Label ID="Label113" runat="server" Text="<%$ Resources:lang,BeiZhu%>"></asp:Label>：
                                                        </td>
                                                        <td class="formItemBgStyle" style="text-align: left" colspan="3">
                                                            <asp:TextBox ID="TXT_Comment" runat="server" Width="99%"></asp:TextBox>
                                                         </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="text-align: center" class="formItemBgStyle" valign="top" colspan="6">
                                                            <asp:Button ID="BT_Save" runat="server" Text="<%$ Resources:lang,BaoCun%>" CssClass="inpu" OnClick="BT_Save_Click" />&nbsp;
                                                            <asp:Button ID="BT_Reset" runat="server" Text="<%$ Resources:lang,QuXiao%>" CssClass="inpu" OnClick="BT_Reset_Click" />&nbsp;
                                                            <asp:Button ID="BT_MoreAdd" runat="server" Text="<%$ Resources:lang,PiLiangTianJia%>" CssClass="inpu" OnClick="BT_MoreAdd_Click" />&nbsp;
                                                            <asp:Button ID="BT_Print" runat="server" Text="<%$ Resources:lang,DaYin%>" CssClass="inpu" OnClick="BT_MoreAdd_Click" Visible="false" />&nbsp;
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="formItemBgStyle" valign="top" colspan="6">
                                                            <asp:Button ID="BT_NewEdit" runat="server" Text="<%$ Resources:lang,BianJi%>" CssClass="inpu" OnClick="BT_NewEdit_Click" />&nbsp;
                                                            <asp:Button ID="BT_NewDelete" runat="server" Text="<%$ Resources:lang,ShanChu%>" CssClass="inpu" OnClick="BT_NewDelete_Click" OnClientClick="return confirm(getDeleteMsgByLangCode())"/>&nbsp;
                                                            <asp:Button ID="BT_NewSubmit" runat="server" Text="<%$ Resources:lang,TiJiao%>" CssClass="inpu" OnClick="BT_NewSubmit_Click" />&nbsp;
                                                            <asp:Button ID="BT_NewTicketReturn" runat="server" Text="<%$ Resources:lang,KaiPiaoTuiHui%>" CssClass="inpu" OnClick="BT_NewTicketReturn_Click" Visible="false" />&nbsp;
                                                            <asp:Button ID="BT_NewCheckReturn" runat="server" Text="<%$ Resources:lang,CaiJianTuiHui%>" CssClass="inpu" OnClick="BT_NewCheckReturn_Click" Visible="false" />&nbsp;
                                                            <asp:Button ID="BT_NewPrint" runat="server" Text="<%$ Resources:lang,DaYin%>" CssClass="inpu" OnClick="BT_NewPrint_Click" />&nbsp;
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td valign="top" style="padding-top: 5px;">
                                                <div style="width: 3600px; height: 200px; overflow-x: auto; overflow-y: auto;">
                                                    <table width="100%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                                        <tr>
                                                            <td width="7">
                                                                <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" />
                                                            </td>
                                                            <td>
                                                                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                    <tr>
                                                                        <td width="2%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="Label18" runat="server" Text="<%$ Resources:lang,CaoZuo%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="2%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="Label19" runat="server" Text="<%$ Resources:lang,FaLiaoDanHao%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="2%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="Label20" runat="server" Text="<%$ Resources:lang,JiHuaBianHao%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="2%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="Label21" runat="server" Text="<%$ Resources:lang,XiangMuBianMa%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="2%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="Label22" runat="server" Text="<%$ Resources:lang,KaiPiaoRiQi%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="2%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="Label23" runat="server" Text="<%$ Resources:lang,FaLiaoFangShi%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="2%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="Label24" runat="server" Text="<%$ Resources:lang,KuBie%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="2%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="Label25" runat="server" Text="<%$ Resources:lang,WuZiDaiMa%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="5%" align="left">
                                                                            <strong>
                                                                                <asp:Label ID="Label26" runat="server" Text="<%$ Resources:lang,WuZiMingCheng%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="2%" align="right">
                                                                            <strong>
                                                                                <asp:Label ID="Label27" runat="server" Text="<%$ Resources:lang,JiHuaShuLiang%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="2%" align="right">
                                                                            <strong>
                                                                                <asp:Label ID="Label28" runat="server" Text="<%$ Resources:lang,ShiFaShuLiang%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="2%" align="right">
                                                                            <strong>
                                                                                <asp:Label ID="Label29" runat="server" Text="<%$ Resources:lang,JiHuaDanJia%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="2%" align="right">
                                                                            <strong>
                                                                                <asp:Label ID="Label30" runat="server" Text="<%$ Resources:lang,JiHuaJinE%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="2%" align="right">
                                                                            <strong>
                                                                                <asp:Label ID="Label31" runat="server" Text="<%$ Resources:lang,XiaoShouDanJia%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="2%" align="right">
                                                                            <strong>
                                                                                <asp:Label ID="Label32" runat="server" Text="<%$ Resources:lang,XiaoShouJinE%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="2%" align="right">
                                                                            <strong>
                                                                                <asp:Label ID="Label33" runat="server" Text="<%$ Resources:lang,GuanLiFeiLv%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="2%" align="right">
                                                                            <strong>
                                                                                <asp:Label ID="Label34" runat="server" Text="<%$ Resources:lang,GuanLiFei%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="2%" align="right">
                                                                            <strong>
                                                                                <asp:Label ID="Label35" runat="server" Text="<%$ Resources:lang,HeJiJinE%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="2%" align="right">
                                                                            <strong>
                                                                                <asp:Label ID="Label36" runat="server" Text="<%$ Resources:lang,JianZhiJinE%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="2%" align="right">
                                                                            <strong>
                                                                                <asp:Label ID="Label37" runat="server" Text="<%$ Resources:lang,JingE%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="2%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="Label38" runat="server" Text="<%$ Resources:lang,JianZhiBianHao%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="2%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="Label39" runat="server" Text="<%$ Resources:lang,JiYaBianHao%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="2%" align="left">
                                                                            <strong>
                                                                                <asp:Label ID="Label40" runat="server" Text="<%$ Resources:lang,HuoWeiHao%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="2%" align="left">
                                                                            <strong>
                                                                                <asp:Label ID="Label41" runat="server" Text="<%$ Resources:lang,JianHao%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="2%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="Label42" runat="server" Text="<%$ Resources:lang,CaiJianRiQi%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="2%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="Label43" runat="server" Text="<%$ Resources:lang,CaiJianYuan%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="2%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="Label44" runat="server" Text="<%$ Resources:lang,FaLiaoRiQi%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="2%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="Label45" runat="server" Text="<%$ Resources:lang,BaoGuanYuan%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="2%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="Label46" runat="server" Text="<%$ Resources:lang,CaiGouGongChengShi%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="2%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="Label47" runat="server" Text="<%$ Resources:lang,DanWeiBianHao%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="4%" align="left">
                                                                            <strong>
                                                                                <asp:Label ID="Label48" runat="server" Text="<%$ Resources:lang,LingLiaoDanWei%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="2%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="Label49" runat="server" Text="<%$ Resources:lang,ZhuGuanLingDao%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="2%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="Label50" runat="server" Text="<%$ Resources:lang,JinDu%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="2%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="Label51" runat="server" Text="<%$ Resources:lang,JieShuanBiaoJi%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="2%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="Label114" runat="server" Text="<%$ Resources:lang,ChePaiHao%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="2%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="Label115" runat="server" Text="<%$ Resources:lang,BeiZhu%>"></asp:Label></strong>
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </td>
                                                            <td width="6" align="right">
                                                                <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" />
                                                            </td>
                                                        </tr>
                                                    </table>
                                                    <asp:DataGrid ID="DG_Send" runat="server" AllowPaging="false" AutoGenerateColumns="False"
                                                        CellPadding="4" ForeColor="#333333" GridLines="None" Height="1px" PageSize="3" ShowHeader="false"
                                                        Width="100%" OnItemCommand="DG_Send_ItemCommand" OnPageIndexChanged="DG_Send_PageIndexChanged">
                                                        <Columns>
                                                            <asp:TemplateColumn>
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="2%" />
                                                                <HeaderTemplate>
                                                                    <asp:Label ID="Label52" runat="server" Text="<%$ Resources:lang,CaoZuo%>"></asp:Label>
                                                                </HeaderTemplate>
                                                                <ItemTemplate>
                                                                  <%--  <input type="checkbox" name="cb_Send_Code" value='<%#Eval("SendCode") %>' />--%>
                                                                    <asp:LinkButton ID="LinkButton1" runat="server" CommandArgument='<%# Eval("SendCode")+"|"+Eval("Progress") %>' CommandName="click" CssClass="notTab"> <asp:Label ID="Label110" runat="server" Text="<%$ Resources:lang,XuanZhe%>"></asp:Label></asp:LinkButton>
                                                                   <%-- <asp:LinkButton ID="LinkButton2" runat="server" CommandArgument='<%# DataBinder.Eval(Container.DataItem,"SendCode") %>' CommandName="edit" CssClass="notTab">编辑</asp:LinkButton>--%>
                                                                    <asp:LinkButton ID="LinkButton3" runat="server" CommandArgument='<%# DataBinder.Eval(Container.DataItem,"SendCode") %>' CommandName="del" CssClass="notTab">删除</asp:LinkButton>
                                                                    <%--<asp:LinkButton ID="LinkButton3" runat="server" CommandArgument='<%# DataBinder.Eval(Container.DataItem,"SendCode") %>' CommandName="submit" CssClass="notTab" Visible='<%# Eval("Progress").ToString()=="录入" ? true : false %>'>提交</asp:LinkButton>--%>
                                                                    <asp:LinkButton ID="LinkButton4" runat="server" CommandArgument='<%# DataBinder.Eval(Container.DataItem,"SendCode") %>' CommandName="notSubmit1" CssClass="notTab" Visible='<%# Eval("Progress").ToString()=="开票" ? true : false %>'>退回</asp:LinkButton>
                                                                    <asp:LinkButton ID="LinkButton5" runat="server" CommandArgument='<%# DataBinder.Eval(Container.DataItem,"SendCode") %>' CommandName="notSubmit2" CssClass="notTab" Visible='<%# Eval("Progress").ToString()=="材检" ? true : false %>'>退回</asp:LinkButton>
                                                                    <a href='TTWZSendPrintPage.aspx?sendCode=<%# DataBinder.Eval(Container.DataItem,"SendCode") %>'>打印</a>
                                                                </ItemTemplate>
                                                            </asp:TemplateColumn>
                                                            <asp:BoundColumn DataField="SendCode" HeaderText="发料单号">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="2%" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="PlanCode" HeaderText="计划编号">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="2%" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="ProjectCode" HeaderText="项目编码">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="2%" />
                                                            </asp:BoundColumn>
                                                            <%--<asp:BoundColumn DataField="TicketTime" HeaderText="开票日期">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="2%" />
                                                            </asp:BoundColumn>--%>
                                                            <asp:TemplateColumn>
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="2%" />
                                                                <HeaderTemplate>
                                                                    <asp:Label ID="Label53" runat="server" Text="<%$ Resources:lang,KaiPiaoRiQi%>"></asp:Label>
                                                                </HeaderTemplate>
                                                                <ItemTemplate>
                                                                    <%#DataBinder.Eval(Container.DataItem, "TicketTime", "{0:yyyy/MM/dd}")%>
                                                                </ItemTemplate>
                                                            </asp:TemplateColumn>
                                                            <asp:BoundColumn DataField="SendMethod" HeaderText="发料方式">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="2%" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="StoreRoom" HeaderText="库别">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="2%" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="ObjectCode" HeaderText="物资代码">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="2%" />
                                                            </asp:BoundColumn>
                                                            <%--<asp:BoundColumn DataField="ObjectName" HeaderText="物资名称">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="5%" />
                                                            </asp:BoundColumn>--%>
                                                            <asp:TemplateColumn>
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="5%" />
                                                                <HeaderTemplate>
                                                                    <asp:Label ID="Label54" runat="server" Text="<%$ Resources:lang,WuZiMingCheng%>"></asp:Label>
                                                                </HeaderTemplate>
                                                                <ItemTemplate>
                                                                    <%# ShareClass.StringCutByRequire(Eval("ObjectName").ToString(), 190) %>
                                                                </ItemTemplate>
                                                            </asp:TemplateColumn>
                                                            <asp:BoundColumn DataField="PlanNumber" HeaderText="计划数量">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Right" Width="2%" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="ActualNumber" HeaderText="实发数量">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Right" Width="2%" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="PlanPrice" HeaderText="计划单价">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Right" Width="2%" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="PlanMoney" HeaderText="计划金额">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Right" Width="2%" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="SalePrice" HeaderText="销售单价">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Right" Width="2%" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="SaleMoney" HeaderText="销售金额">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Right" Width="2%" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="ManageRate" HeaderText="管理费率">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Right" Width="2%" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="ManageMoney" HeaderText="管理费">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Right" Width="2%" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="TotalMoney" HeaderText="合计金额">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Right" Width="2%" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="DownMoney" HeaderText="减值金额">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Right" Width="2%" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="CleanMoney" HeaderText="净额">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Right" Width="2%" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="ReduceCode" HeaderText="减值编号">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="2%" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="WearyCode" HeaderText="积压编号">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="2%" />
                                                            </asp:BoundColumn>
                                                            <%--<asp:BoundColumn DataField="GoodsCode" HeaderText="货位号">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="2%" />
                                                            </asp:BoundColumn>--%>
                                                            <asp:TemplateColumn>
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="2%" />
                                                                <HeaderTemplate>
                                                                    <asp:Label ID="Label55" runat="server" Text="<%$ Resources:lang,HuoWeiHao%>"></asp:Label>
                                                                </HeaderTemplate>
                                                                <ItemTemplate>
                                                                    <%# ShareClass.StringCutByRequire(Eval("GoodsCode").ToString(), 5) %>
                                                                </ItemTemplate>
                                                            </asp:TemplateColumn>
                                                            <%--<asp:BoundColumn DataField="CheckCode" HeaderText="检号">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="2%" />
                                                            </asp:BoundColumn>--%>
                                                            <asp:TemplateColumn>
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="2%" />
                                                                <HeaderTemplate>
                                                                    <asp:Label ID="Label56" runat="server" Text="<%$ Resources:lang,JianHao%>"></asp:Label>
                                                                </HeaderTemplate>
                                                                <ItemTemplate>
                                                                    <%# ShareClass.StringCutByRequire(Eval("CheckCode").ToString(), 192) %>
                                                                </ItemTemplate>
                                                            </asp:TemplateColumn>
                                                            <asp:BoundColumn DataField="CheckTime" HeaderText="材检日期">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="2%" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="CheckerName" HeaderText="材检员">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="2%" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="SendTime" HeaderText="发料日期">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="2%" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="SafekeeperName" HeaderText="保管员">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="2%" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="PurchaseEngineerName" HeaderText="采购工程师">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="2%" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="UnitCode" HeaderText="单位编号">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="2%" />
                                                            </asp:BoundColumn>
                                                            <%--<asp:BoundColumn DataField="PickingUnit" HeaderText="领料单位">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="4%" />
                                                            </asp:BoundColumn>--%>
                                                            <asp:TemplateColumn>
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="4%" />
                                                                <HeaderTemplate>
                                                                    <asp:Label ID="Label57" runat="server" Text="<%$ Resources:lang,LingLiaoDanWei%>"></asp:Label>
                                                                </HeaderTemplate>
                                                                <ItemTemplate>
                                                                    <%# ShareClass.StringCutByRequire(Eval("PickingUnit").ToString(), 8) %>
                                                                </ItemTemplate>
                                                            </asp:TemplateColumn>
                                                            <asp:BoundColumn DataField="UpLeaderName" HeaderText="主管领导">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="2%" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="Progress" HeaderText="进度">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="2%" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="IsMark" HeaderText="使用标记">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="2%" />
                                                            </asp:BoundColumn>
                                                             <asp:BoundColumn DataField="CarCode" HeaderText="车牌号">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="2%" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="Comment" HeaderText="备注">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="2%" />
                                                            </asp:BoundColumn>
                                                        </Columns>
                                                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                        <EditItemStyle BackColor="#2461BF" />
                                                        <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                        <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />
                                                        
                                                        <ItemStyle CssClass="itemStyle" />
                                                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" HorizontalAlign="Center" />
                                                    </asp:DataGrid>
                                                </div>
                                                <asp:Label ID="LB_SendSql" runat="server" Visible="False"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="formItemBgStyle">
                                                <div style="width: 2500px; overflow-x: auto; height: 150px; overflow-y: auto;">
                                                    <table width="100%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                                        <tr>
                                                            <td width="7">
                                                                <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" />
                                                            </td>
                                                            <td>
                                                                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                    <tr>
                                                                        <td width="2%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="Label58" runat="server" Text="<%$ Resources:lang,CaoZuo%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="3%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="Label59" runat="server" Text="<%$ Resources:lang,KuBie%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="3%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="Label60" runat="server" Text="<%$ Resources:lang,WuZiDaiMa%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="4%" align="left">
                                                                            <strong>
                                                                                <asp:Label ID="Label61" runat="server" Text="<%$ Resources:lang,WuZiMingCheng%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="4%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="Label62" runat="server" Text="<%$ Resources:lang,GuiGeXingHao%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="4%" align="right">
                                                                            <strong>
                                                                                <asp:Label ID="Label63" runat="server" Text="<%$ Resources:lang,KuCubShuLiang%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="4%" align="right">
                                                                            <strong>
                                                                                <asp:Label ID="Label64" runat="server" Text="<%$ Resources:lang,KuCunDanJia%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="4%" align="right">
                                                                            <strong>
                                                                                <asp:Label ID="Label65" runat="server" Text="<%$ Resources:lang,KuCunJinE%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="3%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="Label66" runat="server" Text="<%$ Resources:lang,JianHao%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="4%" align="left">
                                                                            <strong>
                                                                                <asp:Label ID="Label67" runat="server" Text="<%$ Resources:lang,BiaoZhun%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="4%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="Label68" runat="server" Text="<%$ Resources:lang,JiBie%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="4%" align="left">
                                                                            <strong>
                                                                                <asp:Label ID="Label69" runat="server" Text="<%$ Resources:lang,HuoWeiHao%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="4%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="Label70" runat="server" Text="<%$ Resources:lang,NianChuRiQi%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="4%" align="right">
                                                                            <strong>
                                                                                <asp:Label ID="Label71" runat="server" Text="<%$ Resources:lang,NianChuShuLiang%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="4%" align="right">
                                                                            <strong>
                                                                                <asp:Label ID="Label72" runat="server" Text="<%$ Resources:lang,NianChuDanJia%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="4%" align="right">
                                                                            <strong>
                                                                                <asp:Label ID="Label73" runat="server" Text="<%$ Resources:lang,NianChuJinE%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="3%" align="right">
                                                                            <strong>
                                                                                <asp:Label ID="Label74" runat="server" Text="<%$ Resources:lang,RuKuShuLiang%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="3%" align="right">
                                                                            <strong>
                                                                                <asp:Label ID="Label75" runat="server" Text="<%$ Resources:lang,RuKuJinE%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="3%" align="right">
                                                                            <strong>
                                                                                <asp:Label ID="Label76" runat="server" Text="<%$ Resources:lang,ChuKuShuLiang%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="3%" align="right">
                                                                            <strong>
                                                                                <asp:Label ID="Label77" runat="server" Text="<%$ Resources:lang,ChuKuJinE%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="3%" align="right">
                                                                            <strong>
                                                                                <asp:Label ID="Label78" runat="server" Text="<%$ Resources:lang,JianZhiJinE%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="3%" align="right">
                                                                            <strong>
                                                                                <asp:Label ID="Label79" runat="server" Text="<%$ Resources:lang,JianZhiXiShu%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="2%" align="right">
                                                                            <strong>
                                                                                <asp:Label ID="Label80" runat="server" Text="<%$ Resources:lang,JingE%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="3%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="Label81" runat="server" Text="<%$ Resources:lang,ShiYongBiaoJi%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="3%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="Label82" runat="server" Text="<%$ Resources:lang,DaLeiID%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="4%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="Label83" runat="server" Text="<%$ Resources:lang,ZhongLeiID%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="3%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="Label84" runat="server" Text="<%$ Resources:lang,XiaoLeiID%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="3%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="Label85" runat="server" Text="<%$ Resources:lang,JiYaBiaoJi%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="3%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="Label86" runat="server" Text="<%$ Resources:lang,JiYaBianHao%>"></asp:Label></strong>
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </td>
                                                            <td width="6" align="right">
                                                                <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" />
                                                            </td>
                                                        </tr>
                                                    </table>
                                                    <asp:DataGrid ID="DG_Store" runat="server" AllowPaging="False" AutoGenerateColumns="False"
                                                        CellPadding="4" ForeColor="#333333" GridLines="None" Height="1px" PageSize="5" ShowHeader="false"
                                                        Width="100%" OnItemCommand="DG_Store_ItemCommand" >
                                                        <Columns>
                                                            <asp:TemplateColumn>
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="2%" />
                                                                <HeaderTemplate>
                                                                    <asp:Label ID="Label87" runat="server" Text="<%$ Resources:lang,CaoZuo%>"></asp:Label>
                                                                </HeaderTemplate>
                                                                <ItemTemplate>

                                                                    <asp:LinkButton ID="LinkButton3" runat="server" CommandArgument='<%# DataBinder.Eval(Container.DataItem,"ID") %>' CommandName="add" CssClass="notTab">编辑</asp:LinkButton>
                                                                    <%--<asp:Button ID="Button5" runat="server" CssClass="inpu" Text="编辑" CommandName="add" CommandArgument='<%# Eval("ID") %>' />--%>
                                                                </ItemTemplate>
                                                            </asp:TemplateColumn>
                                                            <asp:BoundColumn DataField="StockCode" HeaderText="库别">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="3%" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="ObjectCode" HeaderText="物资代码">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="3%" />
                                                            </asp:BoundColumn>
                                                            <%--<asp:BoundColumn DataField="ObjectName" HeaderText="物资名称">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="4%" />
                                                            </asp:BoundColumn>--%>
                                                            <asp:TemplateColumn>
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="4%" />
                                                                <HeaderTemplate>
                                                                    <asp:Label ID="Label88" runat="server" Text="<%$ Resources:lang,WuZiMingCheng%>"></asp:Label>
                                                                </HeaderTemplate>
                                                                <ItemTemplate>
                                                                    <%# ShareClass.StringCutByRequire(Eval("ObjectName").ToString(), 192) %>
                                                                </ItemTemplate>
                                                            </asp:TemplateColumn>
                                                            <%--<asp:BoundColumn DataField="Model" HeaderText="规格型号">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="4%" />
                                                            </asp:BoundColumn>--%>
                                                            <asp:TemplateColumn>
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="4%" />
                                                                <HeaderTemplate>
                                                                    <asp:Label ID="Label89" runat="server" Text="<%$ Resources:lang,GuiGeXingHao%>"></asp:Label>
                                                                </HeaderTemplate>
                                                                <ItemTemplate>
                                                                    <%# ShareClass.StringCutByRequire(Eval("Model").ToString(), 192) %>
                                                                </ItemTemplate>
                                                            </asp:TemplateColumn>
                                                            <asp:BoundColumn DataField="StoreNumber" HeaderText="库存数量">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Right" Width="4%" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="StorePrice" HeaderText="库存单价">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Right" Width="4%" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="StoreMoney" HeaderText="库存金额">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Right" Width="4%" />
                                                            </asp:BoundColumn>
                                                            <%--<asp:BoundColumn DataField="CheckCode" HeaderText="检号">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="3%" />
                                                            </asp:BoundColumn>--%>
                                                            <asp:TemplateColumn>
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="3%" />
                                                                <HeaderTemplate>
                                                                    <asp:Label ID="Label90" runat="server" Text="<%$ Resources:lang,JianHao%>"></asp:Label>
                                                                </HeaderTemplate>
                                                                <ItemTemplate>
                                                                    <%# ShareClass.StringCutByRequire(Eval("CheckCode").ToString(), 192) %>
                                                                </ItemTemplate>
                                                            </asp:TemplateColumn>
                                                            <%--<asp:BoundColumn DataField="Criterion" HeaderText="标准">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="4%" />
                                                            </asp:BoundColumn>--%>
                                                            <asp:TemplateColumn>
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="4%" />
                                                                <HeaderTemplate>
                                                                    <asp:Label ID="Label91" runat="server" Text="<%$ Resources:lang,BiaoZhun%>"></asp:Label>
                                                                </HeaderTemplate>
                                                                <ItemTemplate>
                                                                    <%# ShareClass.StringCutByRequire(Eval("Criterion").ToString(), 5) %>
                                                                </ItemTemplate>
                                                            </asp:TemplateColumn>
                                                            <asp:BoundColumn DataField="Grade" HeaderText="级别">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="4%" />
                                                            </asp:BoundColumn>
                                                            <%--<asp:BoundColumn DataField="GoodsCode" HeaderText="货位号">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="4%" />
                                                            </asp:BoundColumn>--%>
                                                            <asp:TemplateColumn>
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="4%" />
                                                                <HeaderTemplate>
                                                                    <asp:Label ID="Label92" runat="server" Text="<%$ Resources:lang,HuoWeiHao%>"></asp:Label>
                                                                </HeaderTemplate>
                                                                <ItemTemplate>
                                                                    <%# ShareClass.StringCutByRequire(Eval("GoodsCode").ToString(), 5) %>
                                                                </ItemTemplate>
                                                            </asp:TemplateColumn>
                                                            <%--<asp:BoundColumn DataField="YearTime" HeaderText="年初日期">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="4%" />
                                                            </asp:BoundColumn>--%>
                                                            <asp:TemplateColumn>
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="4%" />
                                                                <HeaderTemplate>
                                                                    <asp:Label ID="Label93" runat="server" Text="<%$ Resources:lang,NianChuRiQi%>"></asp:Label>
                                                                </HeaderTemplate>
                                                                <ItemTemplate>
                                                                    <%#DataBinder.Eval(Container.DataItem, "YearTime", "{0:yyyy/MM/dd}")%>
                                                                </ItemTemplate>
                                                            </asp:TemplateColumn>
                                                            <asp:BoundColumn DataField="YearNumber" HeaderText="年初数量">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Right" Width="4%" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="YearPrice" HeaderText="年初单价">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Right" Width="4%" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="YearMoney" HeaderText="年初金额">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Right" Width="4%" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="InNumber" HeaderText="入库数量">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Right" Width="3%" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="InMoney" HeaderText="入库金额">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Right" Width="3%" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="OutNumber" HeaderText="出库数量">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Right" Width="3%" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="OutPrice" HeaderText="出库金额">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Right" Width="3%" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="DownMoney" HeaderText="减值金额">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Right" Width="3%" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="DownRatio" HeaderText="减值系数">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Right" Width="3%" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="CleanMoney" HeaderText="净额">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Right" Width="2%" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="IsMark" HeaderText="使用标记">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="3%" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="DLCode" HeaderText="大类ID">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="3%" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="ZLCode" HeaderText="中类ID">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="3%" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="XLCode" HeaderText="小类ID">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="3%" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="WearyDesc" HeaderText="积压标记">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="3%" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="WearyCode" HeaderText="积压编号">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="3%" />
                                                            </asp:BoundColumn>
                                                        </Columns>
                                                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                        <EditItemStyle BackColor="#2461BF" />
                                                        <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                        <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />
                                                        
                                                        <ItemStyle CssClass="itemStyle" />
                                                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" HorizontalAlign="Center" />
                                                    </asp:DataGrid>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="formItemBgStyle">
                                                <table>
                                                    <tr>
                                                        <td style="width: 180px;">
                                                            <span style="width: 180px;">
                                                                <asp:Label ID="Label94" runat="server" Text="<%$ Resources:lang,LingLiaoJiHua%>"></asp:Label>&nbsp;</span>
                                                        </td>
                                                        <td>
                                                            <span style="width: 180px;">
                                                                <asp:Label ID="Label95" runat="server" Text="<%$ Resources:lang,JiHuaMingXi%>"></asp:Label></span>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="formItemBgStyle">
                                                <table class="formBgStyle">
                                                    <tr>
                                                        <td class="formItemBgStyle">
                                                            <asp:ListBox ID="LB_Plan" name="LB_Plan" runat="server" Width="180px" Height="300px"
                                                                DataTextField="PlanCode" DataValueField="PlanCode" AutoPostBack="true" OnSelectedIndexChanged="LB_Plan_SelectedIndexChanged"></asp:ListBox>
                                                        </td>
                                                        <td class="formItemBgStyle" style="width: 1200px;">
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
                                                                                        <asp:Label ID="Label96" runat="server" Text="<%$ Resources:lang,CaoZuo%>"></asp:Label></strong>
                                                                                </td>
                                                                                <td width="5%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label97" runat="server" Text="<%$ Resources:lang,JiHuaBianHao%>"></asp:Label></strong>
                                                                                </td>
                                                                                <td width="5%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label98" runat="server" Text="<%$ Resources:lang,WuZiDaiMa%>"></asp:Label></strong>
                                                                                </td>
                                                                                <td width="9%" align="left">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label99" runat="server" Text="<%$ Resources:lang,WuZiMingCheng%>"></asp:Label></strong>
                                                                                </td>
                                                                                <td width="5%" align="right">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label100" runat="server" Text="<%$ Resources:lang,JiHuaShuLiang%>"></asp:Label></strong>
                                                                                </td>
                                                                                <td width="5%" align="right">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label101" runat="server" Text="<%$ Resources:lang,HuanSuanShuLiang%>"></asp:Label></strong>
                                                                                </td>
                                                                                <td width="5%" align="right">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label102" runat="server" Text="<%$ Resources:lang,YuJiFeiYong%>"></asp:Label></strong>
                                                                                </td>
                                                                                <td width="5%" align="left">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label103" runat="server" Text="<%$ Resources:lang,BeiZhu%>"></asp:Label></strong>
                                                                                </td>
                                                                                <td width="5%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label104" runat="server" Text="<%$ Resources:lang,JinDu%>"></asp:Label></strong>
                                                                                </td>
                                                                                <td width="5%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label105" runat="server" Text="<%$ Resources:lang,YuanDaiMa%>"></asp:Label></strong>
                                                                                </td>
                                                                                <td width="5%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label106" runat="server" Text="<%$ Resources:lang,ShiYongBiaoJi%>"></asp:Label></strong>
                                                                                </td>
                                                                            </tr>
                                                                        </table>
                                                                    </td>
                                                                    <td width="6" align="right">
                                                                        <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" />
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                            <asp:DataGrid ID="DG_PickingPlanDetail" runat="server" AllowPaging="False" AutoGenerateColumns="False"
                                                                CellPadding="4" ForeColor="#333333" GridLines="None" Height="1px" PageSize="5" ShowHeader="false"
                                                                Width="100%" OnItemCommand="DG_PickingPlanDetail_ItemCommand">
                                                                <Columns>
                                                                    <asp:TemplateColumn>
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                        <HeaderTemplate>
                                                                            <asp:Label ID="Label107" runat="server" Text="<%$ Resources:lang,CaoZuo%>"></asp:Label>
                                                                        </HeaderTemplate>
                                                                        <ItemTemplate>

                                                                            <input type="checkbox" name="cb_PlanDetail_ID" value='<%#Eval("ID") %>' />&nbsp;
                                                                            <asp:LinkButton runat="server" CommandArgument='<%#Eval("ID") %>' CommandName="add" CssClass="notTab"> <asp:Label ID="Label111" runat="server" Text="<%$ Resources:lang,XinZeng%>"></asp:Label></asp:LinkButton>
                                                                            <%--<asp:Button ID="Button5" runat="server" CssClass="inpu" Text="添加" CommandName="add" CommandArgument='<%# Eval("ID") %>' />--%>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateColumn>
                                                                    <asp:BoundColumn DataField="PlanCode" HeaderText="计划编号">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:BoundColumn DataField="ObjectCode" HeaderText="物资代码">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                    </asp:BoundColumn>
                                                                    <%--<asp:BoundColumn DataField="ObjectName" HeaderText="物资名称">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="9%" />
                                                                    </asp:BoundColumn>--%>
                                                                    <asp:TemplateColumn>
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="9%" />
                                                                        <HeaderTemplate>
                                                                            <asp:Label ID="Label108" runat="server" Text="<%$ Resources:lang,WuZiMingCheng%>"></asp:Label>
                                                                        </HeaderTemplate>
                                                                        <ItemTemplate>
                                                                            <%# ShareClass.StringCutByRequire(Eval("ObjectName").ToString(), 8) %>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateColumn>
                                                                    <asp:BoundColumn DataField="PlanNumber" HeaderText="计划数量">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Right" Width="5%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:BoundColumn DataField="ConvertNumber" HeaderText="换算数量">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Right" Width="5%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:BoundColumn DataField="PlanCost" HeaderText="预计费用">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Right" Width="5%" />
                                                                    </asp:BoundColumn>
                                                                    <%--<asp:BoundColumn DataField="Remark" HeaderText="备注">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="5%" />
                                                                    </asp:BoundColumn>--%>
                                                                    <asp:TemplateColumn>
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="5%" />
                                                                        <HeaderTemplate>
                                                                            <asp:Label ID="Label109" runat="server" Text="<%$ Resources:lang,BeiZhu%>"></asp:Label>
                                                                        </HeaderTemplate>
                                                                        <ItemTemplate>
                                                                            <%# ShareClass.StringCutByRequire(Eval("Remark").ToString(), 192) %>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateColumn>
                                                                    <asp:BoundColumn DataField="Progress" HeaderText="进度">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:BoundColumn DataField="OldCode" HeaderText="原代码">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:BoundColumn DataField="IsMark" HeaderText="使用标记">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                    </asp:BoundColumn>
                                                                </Columns>
                                                                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                                <EditItemStyle BackColor="#2461BF" />
                                                                <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                                <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />
                                                                
                                                                <ItemStyle CssClass="itemStyle" />
                                                                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" HorizontalAlign="Center" />
                                                            </asp:DataGrid>
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
                </div>
                <asp:HiddenField ID="HF_SendCode" runat="server" />

                <asp:HiddenField ID="HF_NewSendCode" runat="server" />
                <asp:HiddenField ID="HF_NewProgress" runat="server" />
            </ContentTemplate>
            <Triggers>
                <asp:PostBackTrigger ControlID="BT_Calc" />
            </Triggers>
        </asp:UpdatePanel>
    </form>
</body>
<script type="text/javascript" language="javascript">var cssDirectory = '<%=Session["CssDirectory"] %>'; var oLink = document.getElementById('mainCss'); oLink.href = 'css/' + cssDirectory + '/' + 'bluelightmain.css';</script></html>
