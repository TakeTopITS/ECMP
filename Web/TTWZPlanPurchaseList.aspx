<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTWZPlanPurchaseList.aspx.cs" Inherits="TTWZPlanPurchaseList" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>采购工程师</title>
    <link id="mainCss" href="css/bluelightmain.css" rel="stylesheet" type="text/css" />
    <script src="js/jquery-1.7.2.min.js"></script>
    <script src="js/allAHandler.js"></script>
    <script src="js/dialog/lhgdialog.min.js"></script>
    <script language="javascript">

        $(function () { 

           

            //ControlStatusCloseChange();

        });



        function ControlStatusChange(objProgress, objPurchaseEngineer, objUserCode) {

            $("#BT_NewPlanBrowse").attr("class", "inpu");
            $("#BT_NewPlanBrowse").removeAttr("disabled");
            $("#BT_NewDetailBrowse").attr("class", "inpu");
            $("#BT_NewDetailBrowse").removeAttr("disabled");
            $("#BT_NewUnitChange").attr("class", "inpu");
            $("#BT_NewUnitChange").removeAttr("disabled");
            $("#BT_NewProjectChange").attr("class", "inpu");
            $("#BT_NewProjectChange").removeAttr("disabled");

            if (objProgress == "审核" && objPurchaseEngineer == objUserCode) {
                $("#BT_NewSign").attr("class", "inpu");
                $("#BT_NewSign").removeAttr("disabled");                            //签收
                $("#BT_NewSignReturn").attr("disabled", "disabled");
                $("#BT_NewSignReturn").removeClass("inpu");                            //签收退回
                $("#BT_NewPlanReturn").attr("class", "inpu");
                $("#BT_NewPlanReturn").removeAttr("disabled");                          //计划退回
                $("#BT_NewBalance").attr("class", "inpu");
                $("#BT_NewBalance").removeAttr("disabled");                          //平库
                $("#BT_NewCancel").attr("disabled", "disabled");
                $("#BT_NewCancel").removeClass("inpu");                                 //核销
                $("#BT_NewCancelReturn").attr("disabled", "disabled");
                $("#BT_NewCancelReturn").removeClass("inpu");                           //核销退回
            }
            else if (objProgress == "签收" && objPurchaseEngineer == objUserCode) {
                $("#BT_NewSign").attr("disabled", "disabled");
                $("#BT_NewSign").removeClass("inpu");                            //签收
                $("#BT_NewSignReturn").attr("class", "inpu");
                $("#BT_NewSignReturn").removeAttr("disabled");                          //签收退回
                $("#BT_NewPlanReturn").attr("disabled", "disabled");
                $("#BT_NewPlanReturn").removeClass("inpu");                            //计划退回
                $("#BT_NewBalance").attr("disabled", "disabled");
                $("#BT_NewBalance").removeClass("inpu");                            //平库
                $("#BT_NewCancel").attr("class", "inpu");
                $("#BT_NewCancel").removeAttr("disabled");                          //核销
                $("#BT_NewCancelReturn").attr("disabled", "disabled");
                $("#BT_NewCancelReturn").removeClass("inpu");                            //核销退回
            }
            else if (objProgress == "核销" && objPurchaseEngineer == objUserCode) {
                $("#BT_NewSign").attr("disabled", "disabled");
                $("#BT_NewSign").removeClass("inpu");                            //签收
                $("#BT_NewSignReturn").attr("disabled", "disabled");
                $("#BT_NewSignReturn").removeClass("inpu");                          //签收退回
                $("#BT_NewPlanReturn").attr("disabled", "disabled");
                $("#BT_NewPlanReturn").removeClass("inpu");                          //计划退回
                $("#BT_NewBalance").attr("disabled", "disabled");
                $("#BT_NewBalance").removeClass("inpu");                          //平库
                $("#BT_NewCancel").attr("disabled", "disabled");
                $("#BT_NewCancel").removeClass("inpu");                          //核销
                $("#BT_NewCancelReturn").attr("class", "inpu");
                $("#BT_NewCancelReturn").removeAttr("disabled");                            //核销退回
            }
            else {
                $("#BT_NewSign").attr("disabled", "disabled");
                $("#BT_NewSign").removeClass("inpu");                            //签收
                $("#BT_NewSignReturn").attr("disabled", "disabled");
                $("#BT_NewSignReturn").removeClass("inpu");                          //签收退回
                $("#BT_NewPlanReturn").attr("disabled", "disabled");
                $("#BT_NewPlanReturn").removeClass("inpu");                          //计划退回
                $("#BT_NewBalance").attr("disabled", "disabled");
                $("#BT_NewBalance").removeClass("inpu");                          //平库
                $("#BT_NewCancel").attr("disabled", "disabled");
                $("#BT_NewCancel").removeClass("inpu");                          //核销
                $("#BT_NewCancelReturn").attr("disabled", "disabled");
                $("#BT_NewCancelReturn").removeClass("inpu");                            //核销退回
            }

            if (objPurchaseEngineer == objUserCode) {
                $("#BT_NewDetail").attr("class", "inpu");
                $("#BT_NewDetail").removeAttr("disabled");                            //明细
            } else {
                $("#BT_NewDetail").attr("disabled", "disabled");
                $("#BT_NewDetail").removeClass("inpu");
            }
        }

        function ControlStatusCloseChange() {
            $("#BT_NewSign").attr("disabled", "disabled");
            $("#BT_NewSign").removeClass("inpu");
            $("#BT_NewSignReturn").attr("disabled", "disabled");
            $("#BT_NewSignReturn").removeClass("inpu");
            $("#BT_NewPlanReturn").attr("disabled", "disabled");
            $("#BT_NewPlanReturn").removeClass("inpu");
            $("#BT_NewPlanBrowse").attr("disabled", "disabled");
            $("#BT_NewPlanBrowse").removeClass("inpu");
            $("#BT_NewDetailBrowse").attr("disabled", "disabled");
            $("#BT_NewDetailBrowse").removeClass("inpu");

            $("#BT_NewBalance").attr("disabled", "disabled");
            $("#BT_NewBalance").removeClass("inpu");
            $("#BT_NewCancel").attr("disabled", "disabled");
            $("#BT_NewCancel").removeClass("inpu");
            $("#BT_NewCancelReturn").attr("disabled", "disabled");
            $("#BT_NewCancelReturn").removeClass("inpu");
            $("#BT_NewUnitChange").attr("disabled", "disabled");
            $("#BT_NewUnitChange").removeClass("inpu");
            $("#BT_NewProjectChange").attr("disabled", "disabled");
            $("#BT_NewProjectChange").removeClass("inpu");
            $("#BT_NewDetail").attr("disabled", "disabled");
            $("#BT_NewDetail").removeClass("inpu");
        }



        function ClickSignReturn(obj) {
            $.dialog({
                lock: true,
                content: "退回理由：<input type='text' id='txtReason' />",
                ok: function () {
                    //alert($("#txtReason").val());
                    //alert(obj);

                    $("#HF_PlanCodeValue").val(obj);
                    $("#HF_WriteText").val($("#txtReason").val());
                    document.getElementById("BT_HiddenButton").click();
                },
                cancel: true
            });
        }


        function ClickReturn(obj) {
            $.dialog({
                lock: true,
                content: "退回理由：<input type='text' id='txtReason2' />",
                ok: function () {
                    //alert($("#txtReason").val());
                    //alert(obj);

                    $("#HF_ReturnPlanCode").val(obj);
                    $("#HF_ReturnWriteText").val($("#txtReason2").val());
                    document.getElementById("BT_ReturnButton").click();
                },
                cancel: true
            });
        }



        function AlertCancel() {
            var cancelText = $("#HF_CancelText").val();
            if(confirm(cancelText))
            {
                document.getElementById("BT_HiddenCancel").click();
            }
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
                                                            <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,LingLiaoJiHuaQianShou%>"></asp:Label>
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
                                            <td valign="top" style="padding-top: 5px;">
                                                <table style="width: 100%;" cellpadding="2" cellspacing="0" class="formBgStyle">
                                                    <tr>
                                                        <td align="left" class="formItemBgStyle">
                                                            <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,JingDu%>"></asp:Label> <asp:DropDownList ID="DDL_Progress" runat="server" AutoPostBack="true" OnSelectedIndexChanged="DDL_Progress_SelectedIndexChanged">
                                                                <asp:ListItem Text="<%$ Resources:lang,QuanBu%>" Value=""/>
                                                             <%--   <asp:ListItem Text="<%$ Resources:lang,LuRu%>" Value="录入"/>
                                                                <asp:ListItem Text="<%$ Resources:lang,TiBao%>" Value="提报"/>--%>
                                                                <asp:ListItem Text="<%$ Resources:lang,ShenHe%>" Value="审核"/>
                                                                <asp:ListItem Text="<%$ Resources:lang,QianShou%>" Value="签收"/>
                                                                <asp:ListItem Text="<%$ Resources:lang,HeXiao%>" Value="核销"/>
                                                            </asp:DropDownList>&nbsp;
                                                            <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,XiangMuBianMa%>"></asp:Label> <asp:TextBox ID="TXT_ProjectCode" runat="server"></asp:TextBox>&nbsp;
                                                            <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,JiHuaMingChen%>"></asp:Label> <asp:TextBox ID="TXT_PlanName" runat="server"></asp:TextBox>&nbsp;
                                                            <asp:Button ID="BT_Search" runat="server" CssClass="inpu" OnClick="BT_Search_Click" Text="<%$ Resources:lang,ChaXun%>" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="left" class="formItemBgStyle">
                                                            &nbsp;
                                                            <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,JiLuCaoZuo%>"></asp:Label>
                                                            <asp:Button ID="BT_NewSign" runat="server" Text="<%$ Resources:lang,QianShou%>" CssClass="inpu" OnClick="BT_NewSign_Click" />&nbsp;
<%--                                                            <asp:Button ID="BT_NewSignReturn" runat="server" Text="<%$ Resources:lang,QianShouTuiHui%>" CssClass="inpu" OnClick="BT_NewSignReturn_Click" />--%>
                                                               <asp:Button ID="BT_NewSignReturn" runat="server" Text="<%$ Resources:lang,QianShouTuiHui%>" CssClass="inpu" OnClick="BT_HiddenButton_Click" />
                                                         <%--   <cc1:ModalPopupExtender ID="BT_NewSignReturn_ModalPopupExtender" runat="server" BackgroundCssClass="modalBackground" CancelControlID="IMBT_CloseSign" Enabled="True" PopupControlID="Panel1" TargetControlID="BT_NewSignReturn" Y="150">
                                                            </cc1:ModalPopupExtender>
                                                            --%>
                                                            &nbsp;
                                                          <%--  <asp:Button ID="BT_NewPlanReturn" runat="server" Text="<%$ Resources:lang,JiHuaTuiHui%>" CssClass="inpu" OnClick="BT_NewPlanReturn_Click" />--%>
                                                              <asp:Button ID="BT_NewPlanReturn" runat="server" Text="<%$ Resources:lang,JiHuaTuiHui%>" CssClass="inpu" OnClick="BT_NewPlanReturn_Click" />
                                                            <cc1:ModalPopupExtender ID="BT_NewPlanReturn_ModalPopupExtender" runat="server" BackgroundCssClass="modalBackground" CancelControlID="IMBT_ClosePlan" Enabled="True" PopupControlID="Panel2" TargetControlID="BT_NewPlanReturn" Y="150">
                                                            </cc1:ModalPopupExtender>
                                                            
                                                            &nbsp;
                                                            <asp:Button ID="BT_NewPlanBrowse" runat="server" Text="<%$ Resources:lang,JiHuaLiuLan%>" CssClass="inpu" OnClick="BT_NewPlanBrowse_Click" />&nbsp;
                                                            <asp:Button ID="BT_NewDetailBrowse" runat="server" Text="<%$ Resources:lang,MingXiLiuLan%>" CssClass="inpu" OnClick="BT_NewDetailBrowse_Click" />&nbsp;
                                                            <asp:Button ID="BT_NewBalance" runat="server" Text="<%$ Resources:lang,PingKu%>" CssClass="inpu" OnClick="BT_NewBalance_Click" />&nbsp;
                                                            <asp:Button ID="BT_NewCancel" runat="server" Text="<%$ Resources:lang,HeXiao%>" CssClass="inpu" OnClick="BT_NewCancel_Click" />&nbsp;
                                                            <asp:Button ID="BT_NewCancelReturn" runat="server" Text="<%$ Resources:lang,HeXiaoTuiHui%>" CssClass="inpu" OnClick="BT_NewCancelReturn_Click" />&nbsp;
                                                            <asp:Button ID="BT_NewUnitChange" runat="server" Text="<%$ Resources:lang,DanWeiBianGeng%>" CssClass="inpu" OnClick="BT_NewUnitChange_Click" />&nbsp;
                                                            <asp:Button ID="BT_NewProjectChange" runat="server" Text="<%$ Resources:lang,XiangMuBianGeng%>" CssClass="inpu" OnClick="BT_NewProjectChange_Click" />&nbsp;
                                                            <asp:Button ID="BT_NewDetail" runat="server" Text="<%$ Resources:lang,MingXi%>" CssClass="inpu" OnClick="BT_NewDetail_Click" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="left" class="formItemBgStyle">
                                                            &nbsp;
                                                            <asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,LingLiaoJiHuaJiLu%>"></asp:Label>&nbsp;共<asp:Label ID="LB_ShowRecordCount" runat="server" Text="**"></asp:Label>条&nbsp;&nbsp;
                                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                            <asp:Label ID="Label9" runat="server" Text="<%$ Resources:lang,LieBiaoPaiXu%>"></asp:Label><asp:Button ID="BT_SortPlanCode" runat="server" CssClass="inpu" OnClick="BT_SortPlanCode_Click" Text="计划编号" />&nbsp;
                                                            <asp:Button ID="BT_SortPlanName" runat="server" CssClass="inpu" OnClick="BT_SortPlanName_Click" Text="<%$ Resources:lang,JiHuaMingCheng%>" />&nbsp;
                                                            <asp:Button ID="BT_SortProjectCode" runat="server" CssClass="inpu" OnClick="BT_SortProjectCode_Click" Text="<%$ Resources:lang,XiangMuBianMa%>" />
                                                            <asp:HiddenField ID="HF_SortPlanCode" runat="server" />
                                                            <asp:HiddenField ID="HF_SortPlanName" runat="server" />
                                                            <asp:HiddenField ID="HF_SortProjectCode" runat="server" />

                                                            <asp:Button ID="BT_RelaceLoad" runat="server" Text="<%$ Resources:lang,ChongXinJiaZaiLieBiao%>" OnClick="BT_RelaceLoad_Click" CssClass="inpu" style="display:none;" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="formItemBgStyle" width="100%">
                                                            <div style="width: 2200px;">
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
                                                                                            <asp:Label ID="Label10" runat="server" Text="<%$ Resources:lang,CaoZuo%>"></asp:Label> </strong>
                                                                                    </td>
                                                                                    <td width="4%" align="center">
                                                                                        <strong>
                                                                                            <asp:Label ID="Label11" runat="server" Text="<%$ Resources:lang,JiHuaBianHao%>"></asp:Label></strong>
                                                                                    </td>
                                                                                    <td width="4%" align="left">
                                                                                        <strong>
                                                                                            <asp:Label ID="Label12" runat="server" Text="<%$ Resources:lang,ZiBianHao%>"></asp:Label></strong>
                                                                                    </td>
                                                                                    <td width="7%" align="left">
                                                                                        <strong>
                                                                                            <asp:Label ID="Label13" runat="server" Text="<%$ Resources:lang,JiHuaMingChen%>"></asp:Label> </strong>
                                                                                    </td>
                                                                                    <td width="4%" align="center">
                                                                                        <strong>
                                                                                            <asp:Label ID="Label14" runat="server" Text="<%$ Resources:lang,XiangMuBianMa%>"></asp:Label> </strong>
                                                                                    </td>
                                                                                    <td width="4%" align="center">
                                                                                        <strong>
                                                                                            <asp:Label ID="Label15" runat="server" Text="<%$ Resources:lang,KuBie%>"></asp:Label> </strong>
                                                                                    </td>
                                                                                    <td width="5%" align="left">
                                                                                        <strong>
                                                                                            <asp:Label ID="Label16" runat="server" Text="<%$ Resources:lang,LingLiaoDanWei%>"></asp:Label></strong>
                                                                                    </td>
                                                                                    <td width="4%" align="center">
                                                                                        <strong>
                                                                                            <asp:Label ID="Label17" runat="server" Text="<%$ Resources:lang,DanWeiBianHao%>"></asp:Label></strong>
                                                                                    </td>
                                                                                    <td width="4%" align="center">
                                                                                        <strong>
                                                                                            <asp:Label ID="Label18" runat="server" Text="<%$ Resources:lang,GongYingFangShi%>"></asp:Label></strong>
                                                                                    </td>
                                                                                    <td width="4%" align="right">
                                                                                        <strong>
                                                                                            <asp:Label ID="Label19" runat="server" Text="<%$ Resources:lang,MingXiTiaoShu%>"></asp:Label></strong>
                                                                                    </td>
                                                                                    <td width="4%" align="right">
                                                                                        <strong>
                                                                                            <asp:Label ID="Label20" runat="server" Text="<%$ Resources:lang,YuJiFeiYong%>"></asp:Label></strong>
                                                                                    </td>
                                                                                    <td width="4%" align="center">
                                                                                        <strong>
                                                                                            <asp:Label ID="Label21" runat="server" Text="<%$ Resources:lang,JiHuaBianZhi%>"></asp:Label></strong>
                                                                                    </td>
                                                                                    <td width="4%" align="center">
                                                                                        <strong>
                                                                                            <asp:Label ID="Label22" runat="server" Text="<%$ Resources:lang,BianZhiRiQi%>"></asp:Label></strong>
                                                                                    </td>
                                                                                    <td width="4%" align="center">
                                                                                        <strong>
                                                                                            <asp:Label ID="Label23" runat="server" Text="<%$ Resources:lang,TiaoJiaoRiQi%>"></asp:Label></strong>
                                                                                    </td>
                                                                                    <td width="4%" align="center">
                                                                                        <strong>
                                                                                            <asp:Label ID="Label24" runat="server" Text="<%$ Resources:lang,FeiKongZhuGuan%>"></asp:Label></strong>
                                                                                    </td>
                                                                                    <td width="4%" align="center">
                                                                                        <strong>
                                                                                            <asp:Label ID="Label25" runat="server" Text="<%$ Resources:lang,ShenHeRiQi%>"></asp:Label> </strong>
                                                                                    </td>
                                                                                    <td width="4%" align="center">
                                                                                        <strong>
                                                                                            <asp:Label ID="Label26" runat="server" Text="<%$ Resources:lang,CaiGouGongChengShi%>"></asp:Label></strong>
                                                                                    </td>
                                                                                    <td width="4%" align="center">
                                                                                        <strong>
                                                                                            <asp:Label ID="Label27" runat="server" Text="<%$ Resources:lang,QianShouRiQi%>"></asp:Label></strong>
                                                                                    </td>
                                                                                    <td width="4%" align="left">
                                                                                        <strong>
                                                                                            <asp:Label ID="Label28" runat="server" Text="<%$ Resources:lang,TuiHuiLiYou%>"></asp:Label></strong>
                                                                                    </td>
                                                                                    <td width="4%" align="center">
                                                                                        <strong>
                                                                                            <asp:Label ID="Label29" runat="server" Text="<%$ Resources:lang,HeXiaoRiQi%>"></asp:Label></strong>
                                                                                    </td>
                                                                                    <td width="4%" align="center">
                                                                                        <strong>
                                                                                            <asp:Label ID="Label30" runat="server" Text="<%$ Resources:lang,JingDu%>"></asp:Label></strong>
                                                                                    </td>
                                                                                    <td width="4%" align="center">
                                                                                        <strong>
                                                                                            <asp:Label ID="Label31" runat="server" Text="<%$ Resources:lang,ShiYongBiaoJi%>"></asp:Label> </strong>
                                                                                    </td>
                                                                                </tr>
                                                                            </table>
                                                                        </td>
                                                                        <td width="6" align="right">
                                                                            <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" />
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                                <asp:DataGrid ID="DG_List" runat="server" AllowPaging="true" AutoGenerateColumns="False"
                                                                    CellPadding="4" ForeColor="#333333" GridLines="None" Height="1px" PageSize="20" ShowHeader="false"
                                                                    Width="100%" OnItemCommand="DG_List_ItemCommand" OnPageIndexChanged="DG_List_PageIndexChanged">
                                                                    <Columns>
                                                                        <asp:TemplateColumn>
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="2%" />
                                                                            <HeaderTemplate>
                                                                                <asp:Label ID="Label32" runat="server" Text="<%$ Resources:lang,CaoZuo%>"></asp:Label> 
                                                                            </HeaderTemplate>
                                                                            <ItemTemplate>

                                                                                <asp:LinkButton ID="LinkButton0" runat="server" CommandArgument='<%# Eval("PlanCode") %>' CommandName="click" CssClass="notTab"> <asp:Label ID="Label56" runat="server" Text="<%$ Resources:lang,CaoZuo%>"></asp:Label> </asp:LinkButton>
                                                                               <%-- <asp:LinkButton ID="LinkButton1" runat="server" CommandArgument='<%# DataBinder.Eval(Container.DataItem,"PlanCode") %>' CommandName="sign" CssClass="notTab" Visible='<%# Eval("Progress").ToString()=="审核" ? true : false %>'>签收</asp:LinkButton>
                                                                                <asp:LinkButton ID="LinkButton2" runat="server" CommandArgument='<%# DataBinder.Eval(Container.DataItem,"PlanCode") %>' CommandName="signReturn" CssClass="notTab" Visible='<%# Eval("Progress").ToString()=="签收" ? true : false %>'>退回签收</asp:LinkButton>
                                                                                <asp:LinkButton ID="LinkButton3" runat="server" CommandArgument='<%# DataBinder.Eval(Container.DataItem,"PlanCode") %>' CommandName="returnPlan" CssClass="notTab" Visible='<%# Eval("Progress").ToString()=="审核" ? true : false %>'>退回</asp:LinkButton>
                                                                                <asp:LinkButton ID="LinkButton4" runat="server" CommandArgument='<%# DataBinder.Eval(Container.DataItem,"PlanCode") %>' CommandName="cancel" CssClass="notTab" Visible='<%# Eval("Progress").ToString()=="签收" ? true : false %>'>核销</asp:LinkButton>
                                                                                <asp:LinkButton ID="LinkButton5" runat="server" CommandArgument='<%# DataBinder.Eval(Container.DataItem,"PlanCode") %>' CommandName="cancelReturn" CssClass="notTab" Visible='<%# Eval("Progress").ToString()=="核销" ? true : false %>'>退回核销</asp:LinkButton>
                                                                                <asp:LinkButton ID="LinkButton6" runat="server" CommandArgument='<%# DataBinder.Eval(Container.DataItem,"PlanCode") %>' CommandName="balance" CssClass="notTab" Visible='<%# Eval("Progress").ToString()=="核销" ? true : false %>'>平库</asp:LinkButton>
                                                                                --%>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateColumn>
                                                                        <asp:BoundColumn DataField="PlanCode" HeaderText="计划编号">
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="4%" />
                                                                        </asp:BoundColumn>
                                                                        <asp:TemplateColumn>
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="4%" />
                                                                            <HeaderTemplate>
                                                                                <asp:Label ID="Label33" runat="server" Text="<%$ Resources:lang,ZiBianHao%>"></asp:Label> 
                                                                            </HeaderTemplate>
                                                                            <ItemTemplate>
                                                                                <%# ShareClass.StringCutByRequire(Eval("SinceNumber").ToString(), 190) %>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateColumn>
                                                                        <asp:TemplateColumn>
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="7%" />
                                                                            <HeaderTemplate>
                                                                                <asp:Label ID="Label34" runat="server" Text="<%$ Resources:lang,JiHuaMingChen%>"></asp:Label> 
                                                                            </HeaderTemplate>
                                                                            <ItemTemplate>
                                                                                <%# ShareClass.StringCutByRequire(Eval("PlanName").ToString(), 190) %>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateColumn>
                                                                        <asp:BoundColumn DataField="ProjectCode" HeaderText="项目编码">
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="4%" />
                                                                        </asp:BoundColumn>
                                                                        <asp:BoundColumn DataField="StoreRoom" HeaderText="库别">
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="4%" />
                                                                        </asp:BoundColumn>
                                                                        <asp:TemplateColumn>
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="5%" />
                                                                            <HeaderTemplate>
                                                                                <asp:Label ID="Label35" runat="server" Text="<%$ Resources:lang,LingLiaoDanWei%>"></asp:Label> 
                                                                            </HeaderTemplate>
                                                                            <ItemTemplate>
                                                                                <%# ShareClass.StringCutByRequire(Eval("PickingUnit").ToString(), 9) %>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateColumn>
                                                                        <asp:BoundColumn DataField="UnitCode" HeaderText="单位编号">
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="4%" />
                                                                        </asp:BoundColumn>
                                                                        <asp:BoundColumn DataField="SupplyMethod" HeaderText="供应方式">
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="4%" />
                                                                        </asp:BoundColumn>
                                                                        <asp:BoundColumn DataField="DetailCount" HeaderText="明细条数">
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Right" Width="4%" />
                                                                        </asp:BoundColumn>
                                                                        <asp:BoundColumn DataField="PlanCost" HeaderText="预计费用">
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Right" Width="4%" />
                                                                        </asp:BoundColumn>
                                                                        <asp:BoundColumn DataField="PlanMarkerName" HeaderText="计划编制">
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="4%" />
                                                                        </asp:BoundColumn>
                                                                        <asp:TemplateColumn>
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="4%" />
                                                                            <HeaderTemplate>
                                                                                <asp:Label ID="Label36" runat="server" Text="<%$ Resources:lang,BianZhiRiQi%>"></asp:Label> 
                                                                            </HeaderTemplate>
                                                                            <ItemTemplate>
                                                                                <%#DataBinder.Eval(Container.DataItem, "MarkerTime", "{0:yyyy/MM/dd}")%>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateColumn>
                                                                        <asp:TemplateColumn>
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="4%" />
                                                                            <HeaderTemplate>
                                                                                <asp:Label ID="Label37" runat="server" Text="<%$ Resources:lang,TiJiaoRiQi%>"></asp:Label> 
                                                                            </HeaderTemplate>
                                                                            <ItemTemplate>
                                                                                <%# ShareClass.StringCutByRequire(Eval("CommitTime").ToString(),10) %>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateColumn>
                                                                        <asp:BoundColumn DataField="FeeManageName" HeaderText="费控主管">
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="4%" />
                                                                        </asp:BoundColumn>
                                                                        <asp:TemplateColumn>
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="4%" />
                                                                            <HeaderTemplate>
                                                                                <asp:Label ID="Label38" runat="server" Text="<%$ Resources:lang,ShenHeRiQi%>"></asp:Label> 
                                                                            </HeaderTemplate>
                                                                            <ItemTemplate>
                                                                                <%# ShareClass.StringCutByRequire(Eval("ApproveTime").ToString(),10) %>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateColumn>
                                                                        <asp:BoundColumn DataField="PurchaseEngineerName" HeaderText="采购工程师">
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="4%" />
                                                                        </asp:BoundColumn>
                                                                        <asp:TemplateColumn>
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="4%" />
                                                                            <HeaderTemplate>
                                                                                <asp:Label ID="Label39" runat="server" Text="<%$ Resources:lang,DaiMa%>"></asp:Label> 
                                                                            </HeaderTemplate>
                                                                            <ItemTemplate>
                                                                                <%# ShareClass.StringCutByRequire(Eval("SignTime").ToString(),10) %>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateColumn>
                                                                        <asp:TemplateColumn>
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="4%" />
                                                                            <HeaderTemplate>
                                                                                <asp:Label ID="Label40" runat="server" Text="<%$ Resources:lang,TuiHuiLiYou%>"></asp:Label> 
                                                                            </HeaderTemplate>
                                                                            <ItemTemplate>
                                                                                <%# ShareClass.StringCutByRequire(Eval("ReturnReason").ToString(), 190) %>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateColumn>
                                                                        <asp:TemplateColumn>
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="4%" />
                                                                            <HeaderTemplate>
                                                                                <asp:Label ID="Label41" runat="server" Text="<%$ Resources:lang,HeXiaoRiQi%>"></asp:Label> 
                                                                            </HeaderTemplate>
                                                                            <ItemTemplate>
                                                                                <%# ShareClass.StringCutByRequire(Eval("CancelTime").ToString(),10) %>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateColumn>
                                                                        <asp:BoundColumn DataField="Progress" HeaderText="进度">
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="4%" />
                                                                        </asp:BoundColumn>
                                                                        <asp:BoundColumn DataField="IsMark" HeaderText="使用标记">
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="4%" />
                                                                        </asp:BoundColumn>
                                                                    </Columns>
                                                                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                                    <EditItemStyle BackColor="#2461BF" />
                                                                    <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                                    <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />
                                                                    
                                                                    <ItemStyle CssClass="itemStyle" />
                                                                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" HorizontalAlign="Center" />
                                                                </asp:DataGrid>
                                                                <asp:Label ID="LB_PlanSQL" runat="server" Visible="False"></asp:Label>
                                                            </div>
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
                  <asp:Panel ID="Panel1" runat="server" CssClass="modalPopup" Style="display: none;"
                    Width="500px">
                    <div>
                          <table width="420px">
                            <tr>
                                <td style="width: 420px; padding: 5px 5px 5px 5px;" valign="top" align="left">
                                    <asp:Label ID="Label100" runat="server" Text="<%$ Resources:lang,TuiHuiLiYou%>"></asp:Label><asp:TextBox ID="TB_SignReturnReason" runat="server" Width="99%"></asp:TextBox>
                                </td>
                                 <td style="width: 20px; padding: 5px 5px 5px 5px;" valign="top" align="left">

                                    <asp:ImageButton ID="IMBT_CloseSign" ImageUrl="ImagesSkin/Close4.jpg" runat="server" />

                                </td>
                            </tr>

                            <tr>
                                <td colspan ="2" style="width: 420px; padding: 5px 5px 5px 5px;" valign="top" align="left">
                                    <asp:Button ID="BT_SignReturn" runat="server" CssClass="inpu" Text="<%$ Resources:lang,BaoCun%>" OnClick="BT_HiddenButton_Click" />
                                </td>
                            </tr>
                        </table>
                    </div>
                </asp:Panel>
                   <asp:Panel ID="Panel2" runat="server" CssClass="modalPopup" Style="display: none;"
                    Width="500px">
                    <div>
                        <table width="420px">
                            <tr>
                                <td style="width: 400px; padding: 5px 5px 5px 5px;" valign="top" align="left">
                                    <asp:Label ID="Label42" runat="server" Text="<%$ Resources:lang,TuiHuiLiYou%>"></asp:Label><asp:TextBox ID="TB_PlanReturnReason" runat="server" Width="99%"></asp:TextBox>
                                </td>
                                <td style="width: 20px; padding: 5px 5px 5px 5px;" valign="top" align="left">

                                    <asp:ImageButton ID="IMBT_ClosePlan" ImageUrl="ImagesSkin/Close4.jpg" runat="server" />

                                </td>
                            </tr>

                            <tr>
                                <td colspan="2" style="width: 420px; padding: 5px 5px 5px 5px;" valign="top" align="left">
                                    <asp:Button ID="BT_PlanReturn" runat="server" CssClass="inpu" Text="<%$ Resources:lang,BaoCun%>" OnClick="BT_ReturnButton_Click" />
                                </td>
                            </tr>
                        </table>
                    </div>
                </asp:Panel>
                <asp:HiddenField ID="HF_PlanCodeValue" runat="server" />
                <asp:HiddenField ID="HF_WriteText" runat="server" />
                <asp:Button ID="BT_HiddenButton" runat="server" Text="Button" style="display:none;" OnClick="BT_HiddenButton_Click" />

                <asp:HiddenField ID="HF_PickingPlanCode" runat="server" />
                <asp:HiddenField ID="HF_CancelText" runat="server" />
                <asp:Button ID="BT_HiddenCancel" runat="server" Text="Button" style="display:none;" OnClick="BT_HiddenCancel_Click" />

                <asp:HiddenField ID="HF_ReturnPlanCode" runat="server" />
                <asp:HiddenField ID="HF_ReturnWriteText" runat="server" />
                <asp:Button ID="BT_ReturnButton" runat="server" Text="Button" style="display:none;" OnClick="BT_ReturnButton_Click" />

                
                <asp:HiddenField ID="HF_NewPlanCode" runat="server" />
                <asp:HiddenField ID="HF_NewProgress" runat="server" />
                <asp:HiddenField ID="HF_NewPurchaseEngineer" runat="server" />
            </ContentTemplate>
        </asp:UpdatePanel>
    </form>
</body>
<script type="text/javascript" language="javascript">var cssDirectory = '<%=Session["CssDirectory"] %>'; var oLink = document.getElementById('mainCss'); oLink.href = 'css/' + cssDirectory + '/' + 'bluelightmain.css';</script></html>
