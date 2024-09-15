<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTAppCreateProjectTaskDetail.aspx.cs" Inherits="TTAppCreateProjectTaskDetail" %>

<meta name="viewport" content="width=device-width; initial-scale=1.0; maximum-scale=1.0; user-scalable=1" />

<%@ Register Assembly="NickLee.Web.UI" Namespace="NickLee.Web.UI" TagPrefix="NickLee" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link id="mainCss" href="css/bluelightmain.css" rel="stylesheet" type="text/css" />
    <link id="flxappCss" href="css/flxapp.css" rel="stylesheet" type="text/css" />

    <style type="text/css">
        body {
            /*margin-top: 5px;*/
            /*background-image: url(Images/login_bj.jpg);*/
            background-repeat: repeat-x;
            font: normal 100% Helvetica, Arial, sans-serif;
        }
    </style>

    <style type="text/css">
        #AboveDiv {
            max-width: 1024px;
            width: expression (document.body.clientWidth >= 1024? "1024px" : "auto" ));
            min-width: 277px;
            width: expression (document.body.clientWidth <= 277? "277px" : "auto" ));
        }
    </style>
    <script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="js/allAHandler.js"></script>
    <script src="js/My97DatePicker/WdatePicker.js"></script>

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

                                <table cellpadding="0" cellspacing="0" width="100%">
                                    <tr>
                                        <td height="31" class="page_topbj">
                                            <table width="96%" border="0" align="center" cellpadding="0" cellspacing="0">
                                                <tr>
                                                    <td align="left">
                                                        <a href="TTAppTask.aspx" onclick="javascript:document.getElementById('IMG_Waiting').style.display = 'block';">

                                                            <table width="245" border="0" align="left" cellpadding="0" cellspacing="0">
                                                                <tr>
                                                                    <td width="29">
                                                                        <img src="ImagesSkin/return.png" alt="" />
                                                                    </td>
                                                                    <td align="center" background="ImagesSkin/main_top_bj.jpg" class="titleziAPP">
                                                                        <asp:Label runat="server" Text="<%$ Resources:lang,Back%>" />
                                                                    </td>
                                                                    <td width="5">
                                                                        <%-- <img src="ImagesSkin/main_top_r.jpg" width="5" height="31" />--%>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                            <img id="IMG_Waiting" src="Images/Processing.gif" alt="请稍候，处理中..." style="display: none;" />
                                                        </a>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td valign="top" style="padding: 0px 5px 5px 5px;" align="left">
                                            <table style="width: 100%; height: 1px;">

                                                <tr>
                                                    <td style="text-align: center;">

                                                        <div class="napbox">
                                                            <div class="npbx">
                                                                <div class="cline"></div>

                                                                <table class="formBgStyle" style="width: 99%;" cellpadding="3" cellspacing="0">
                                                                    <tr style="display: none;">
                                                                        <td style="text-align: left;" class="formItemBgStyle">
                                                                            <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,BianHao%>"></asp:Label>
                                                                            <asp:Label ID="LB_TaskNO" runat="server"></asp:Label>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td style="text-align: left;" class="formItemBgStyle">
                                                                            <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,LeiXing%>"></asp:Label></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td style="text-align: left;" class="formItemBgStyle">
                                                                            <asp:DropDownList ID="DL_Type" runat="server" DataTextField="Type" DataValueField="Type" Width="99%">
                                                                            </asp:DropDownList>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td class="formItemBgStyle" style="text-align: left;">
                                                                            <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,YouXianJi%>"></asp:Label></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td class="formItemBgStyle" style="text-align: left;">
                                                                            <asp:DropDownList ID="DL_Priority" runat="server" DataTextField="Priority" DataValueField="Priority" Width="99%">

                                                                                <asp:ListItem>Normal</asp:ListItem>
                                                                                <asp:ListItem>High</asp:ListItem>
                                                                                <asp:ListItem>Low</asp:ListItem>

                                                                            </asp:DropDownList>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td style="text-align: left;" class="formItemBgStyle">
                                                                            <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,RenWu%>"></asp:Label>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td style="text-align: left" class="formItemBgStyle">
                                                                            <asp:TextBox ID="TB_Task" runat="server" Width="99%" Height="50px" TextMode="MultiLine"></asp:TextBox>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td class="formItemBgStyle" style="text-align: left;">
                                                                            <asp:Label ID="Label9" runat="server" Text="<%$ Resources:lang,KaiShiShiJian%>"></asp:Label>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td class="formItemBgStyle" style="text-align: left">
                                                                            <asp:TextBox ID="DLC_BeginDate" runat="server" ReadOnly="false" Width="99%" onClick="WdatePicker({dateFmt:'yyyy-MM-dd'})" onFocus="WdatePicker({lang:'auto'})"></asp:TextBox>

                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td class="formItemBgStyle" style="text-align: left;">
                                                                            <asp:Label ID="Label10" runat="server" Text="<%$ Resources:lang,JieShuShiJian%>"></asp:Label>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td class="formItemBgStyle" style="text-align: left">
                                                                            <asp:TextBox ID="DLC_EndDate" runat="server" ReadOnly="false" Width="99%" onClick="WdatePicker({dateFmt:'yyyy-MM-dd'})" onFocus="WdatePicker({lang:'auto'})"></asp:TextBox>

                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td style="text-align: left;" class="formItemBgStyle">
                                                                            <asp:Label ID="Label12" runat="server" Text="<%$ Resources:lang,WanChengChengDu%>"></asp:Label>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td style="text-align: left;" class="formItemBgStyle">
                                                                            <NickLee:NumberBox ID="TB_FinishPercent" runat="server" MaxAmount="1000000000000" MinAmount="-1000000000000" OnBlur="" OnFocus="" OnKeyPress="" PositiveColor="" Width="90%">0.00</NickLee:NumberBox>
                                                                            &nbsp;%</td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td class="formItemBgStyle" style="text-align: left;">
                                                                            <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,FeiYongYuSuan%>"></asp:Label>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td class="formItemBgStyle" style="text-align: left;">
                                                                            <NickLee:NumberBox ID="TB_Budget" runat="server" MaxAmount="1000000000000" MinAmount="-1000000000000" OnBlur="" OnFocus="" OnKeyPress="" PositiveColor="" Width="99%">0.00</NickLee:NumberBox>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td style="text-align: left;" class="formItemBgStyle">
                                                                            <asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,ShiJiFeiYong%>"></asp:Label>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td style="text-align: left;" class="formItemBgStyle">
                                                                            <NickLee:NumberBox ID="TB_Expense" runat="server" Enabled="False" MaxAmount="1000000000000" MinAmount="-1000000000000" OnBlur="" OnFocus="" OnKeyPress="" PositiveColor="" Width="99%">0.00</NickLee:NumberBox>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td class="formItemBgStyle" style="text-align: left;">
                                                                            <asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,GongShiYuSuan%>"></asp:Label>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td class="formItemBgStyle" style="text-align: left;">
                                                                            <NickLee:NumberBox ID="NB_ManHour" runat="server" MaxAmount="1000000000000" MinAmount="-1000000000000" OnBlur="" OnFocus="" OnKeyPress="" PositiveColor="" Width="99%">0.00</NickLee:NumberBox>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td class="formItemBgStyle" style="text-align: left;">
                                                                            <asp:Label ID="Label8" runat="server" Text="<%$ Resources:lang,ShiJiGongShi%>"></asp:Label>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td class="formItemBgStyle" style="text-align: left;">
                                                                            <NickLee:NumberBox ID="NB_RealManHour" runat="server" Enabled="False" MaxAmount="1000000000000" MinAmount="-1000000000000" OnBlur="" OnFocus="" OnKeyPress="" PositiveColor="" Width="99%">0.00</NickLee:NumberBox>
                                                                        </td>
                                                                    </tr>


                                                                    <tr>
                                                                        <td class="formItemBgStyle" style="text-align: left;">
                                                                            <asp:Label ID="Label11" runat="server" Text="<%$ Resources:lang,JianLiShiJian%>"></asp:Label>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td class="formItemBgStyle" style="text-align: left">
                                                                            <asp:Label ID="LB_MakeDate" runat="server" Font-Size="10pt" Width="99%"></asp:Label>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td style="text-align: left;" class="formItemBgStyle">
                                                                            <asp:Label ID="Label13" runat="server" Text="<%$ Resources:lang,ZhuangTai%>"></asp:Label>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td style="text-align: left;" class="formItemBgStyle">
                                                                            <asp:DropDownList ID="DL_Status" runat="server" DataTextField="HomeName" DataValueField="Status" Width="99%">
                                                                            </asp:DropDownList>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td style="text-align: center; height: 2px;" class="formItemBgStyle" colspan="2">

                                                                            <div class="npbtn">
                                                                                <asp:Button ID="BT_Update" runat="server" CssClass="inpu" Enabled="False" OnClick="BT_Update_Click" Text="<%$ Resources:lang,BaoCun%>" />

                                                                                <asp:Button ID="BT_Delete" runat="server" CssClass="inpu" Enabled="False" OnClick="BT_Delete_Click" OnClientClick="return confirm(getDeleteMsgByLangCode())" Text="<%$ Resources:lang,ShanChu%>" />

                                                                                &nbsp;
                                                                         <asp:Button ID="BT_Close" runat="server" CssClass="inpuClose" ToolTip="<%$ Resources:lang,GuanBi%>" Enabled="False" Visible="false" OnClick="BT_Close_Click" />
                                                                                &nbsp;
                                                                         <asp:Button ID="BT_Active" runat="server" CssClass="inpuActive" ToolTip="<%$ Resources:lang,JiHuo%>" Enabled="False" OnClick="BT_Active_Click" Visible="false" />
                                                                            </div>

                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </div>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="left">

                                                        <div class="napbox">
                                                            <div class="npbx">
                                                                <div class="cline"></div>
                                                                <table class="formBgStyle" style="width: 99%" cellpadding="3" cellspacing="0">
                                                                    <tr style="display: none;">
                                                                        <td style="text-align: left;" class="formItemBgStyle">
                                                                            <strong>
                                                                                <asp:Label ID="Label14" runat="server" Text="<%$ Resources:lang,FenPaiXiangMuRenWuGeiXiangMuZuChengYuan%>"></asp:Label>：</strong>
                                                                            <asp:Label ID="LB_Status" runat="server" Visible="False"></asp:Label>
                                                                            <asp:Label ID="LB_TaskID" runat="server" Visible="False"></asp:Label>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td style="width: 80px; text-align: left;" class="formItemBgStyle">
                                                                            <asp:Label ID="Label15" runat="server" Text="<%$ Resources:lang,ShouLiRen%>"></asp:Label>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td style="text-align: left;" class="formItemBgStyle">
                                                                            <asp:DropDownList ID="DL_OperatorCode" runat="server" DataTextField="UserName" DataValueField="UserCode" Width="99%">
                                                                            </asp:DropDownList>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td class="formItemBgStyle" style="text-align: left;">
                                                                            <asp:Label ID="Label16" runat="server" Text="<%$ Resources:lang,LeiXingShi%>"></asp:Label>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td class="formItemBgStyle" style="text-align: left;">
                                                                            <asp:DropDownList ID="DL_RecordType" runat="server" DataTextField="Type" DataValueField="Type" Width="99%">
                                                                            </asp:DropDownList>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td style="text-align: left;" class="formItemBgStyle">
                                                                            <asp:Label ID="Label17" runat="server" Text="<%$ Resources:lang,GongZuoYaoQiu%>"></asp:Label>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td align="left" class="formItemBgStyle">
                                                                            <CKEditor:CKEditorControl ID="HE_Operation" runat="server" Width="99%" Toolbar="" Height="170px" Visible="false" />
                                                                            <CKEditor:CKEditorControl runat="server" ID="HT_Operation" Width="99%" Toolbar="" Height="170px" Visible="False" />
                                                                            <asp:DropDownList ID="DL_WorkRequest" runat="server" AutoPostBack="True" DataTextField="Operation"
                                                                                DataValueField="Operation" OnSelectedIndexChanged="DL_WorkRequest_SelectedIndexChanged">
                                                                            </asp:DropDownList>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td style="text-align: left;" class="formItemBgStyle">
                                                                            <asp:Label ID="Label18" runat="server" Text="<%$ Resources:lang,KaiShiShiJian%>"></asp:Label>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td style="text-align: left;" class="formItemBgStyle">

                                                                            <asp:TextBox ID="DLC_TaskBegin" ReadOnly="false" runat="server" Width="99%" onClick="WdatePicker({dateFmt:'yyyy-MM-dd'})" onFocus="WdatePicker({lang:'auto'})"></asp:TextBox>

                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td class="formItemBgStyle" style="text-align: left;">
                                                                            <asp:Label ID="Label19" runat="server" Text="<%$ Resources:lang,JieShuShiJian%>"></asp:Label>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td class="formItemBgStyle" style="text-align: left;">
                                                                            <asp:TextBox ID="DLC_TaskEnd" runat="server" ReadOnly="false" Width="99%" onClick="WdatePicker({dateFmt:'yyyy-MM-dd'})" onFocus="WdatePicker({lang:'auto'})"></asp:TextBox>

                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td style="text-align: center;" class="formItemBgStyle">
                                                                            <div class="npbtn">
                                                                                <asp:Button ID="BT_UpdateAssign" runat="server" CssClass="inpu" Enabled="False" OnClick="BT_UpdateAssign_Click" Text="<%$ Resources:lang,BaoCun%>" />
                                                                                &nbsp;<asp:Button ID="BT_DeleteAssign" runat="server" CssClass="inpu" Enabled="False" OnClick="BT_DeleteAssign_Click" OnClientClick="return confirm(getDeleteMsgByLangCode())" Text="<%$ Resources:lang,ShanChu%>" />
                                                                                &nbsp;<asp:Button ID="BT_Assign" runat="server" CssClass="inpu" Enabled="False" OnClick="BT_Assign_Click" Text="<%$ Resources:lang,FenPai%>" />
                                                                            </div>
                                                                        </td>
                                                                    </tr>
                                                                    <tr style="display: none;">
                                                                        <td style="height: 19px; text-align: left;" class="formItemBgStyle">


                                                                            <asp:CheckBox ID="CB_SendMsg" runat="server" Font-Bold="False" Font-Size="10pt" Text="<%$ Resources:lang,FaXinXi%>" />
                                                                            <asp:CheckBox ID="CB_SendMail" runat="server" Font-Bold="False" Font-Size="10pt" Text="<%$ Resources:lang,FaYouJian%>" />
                                                                            <span style="font-size: 10pt">
                                                                                <asp:Label ID="Label20" runat="server" Text="<%$ Resources:lang,TongZhiShouLiRen%>"></asp:Label><asp:TextBox ID="TB_Message" runat="server" Width="45%"></asp:TextBox>
                                                                                <asp:Button ID="BT_Send" runat="server" CssClass="inpu" OnClick="BT_Send_Click" Text="<%$ Resources:lang,FaSong%>" />
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </div>
                                                        </div>

                                                        <div class="napbox">


                                                            <div class="npbx">
                                                                <div class="cline">
                                                                </div>
                                                                <br />
                                                                <strong>
                                                                    <asp:Label ID="LB_ID" runat="server"></asp:Label>
                                                                    <asp:Label ID="LB_TaskName" runat="server" Visible="False"></asp:Label>
                                                                </strong>
                                                                <br />
                                                                <br />
                                                                <asp:DataGrid ID="DataGrid2" runat="server" AutoGenerateColumns="False" CellPadding="4"
                                                                    ShowHeader="false" ForeColor="#333333" GridLines="None" Height="1px" OnItemCommand="DataGrid2_ItemCommand"
                                                                    Width="99%">
                                                                    <Columns>

                                                                        <asp:TemplateColumn HeaderText="">
                                                                            <ItemTemplate>

                                                                                <div class="npb npbs">
                                                                                    <div class="nplef">
                                                                                        <%# DataBinder.Eval(Container.DataItem,"ID") %>
                                                                                    </div>
                                                                                    <div class="nprig">

                                                                                        <h5><%# DataBinder.Eval(Container.DataItem,"OperatorName") %>  <sub></sub></h5>
                                                                                        <h6><%# DataBinder.Eval(Container.DataItem,"Operation") %></h6>

                                                                                    </div>
                                                                                </div>

                                                                            </ItemTemplate>
                                                                        </asp:TemplateColumn>

                                                                    </Columns>
                                                                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                                    <EditItemStyle BackColor="#2461BF" />
                                                                    <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                                    <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />

                                                                    <ItemStyle CssClass="itemStyle" />
                                                                </asp:DataGrid>
                                                            </div>
                                                        </div>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr style="display: none;">
                            <td>
                                <asp:Label ID="LB_ProjectID" runat="server" Visible="False"></asp:Label>
                                <asp:Label ID="LB_UserCode" runat="server" Visible="False"></asp:Label>
                                <asp:Label ID="LB_Sql" runat="server" Visible="False"></asp:Label>
                            </td>
                        </tr>

                        <tr style="display: none;">
                            <td>
                                <asp:HyperLink ID="HL_RunTaskByWF" runat="server" Enabled="False">---&gt;<asp:Label ID="Label24" runat="server" Text="<%$ Resources:lang,RenWuChuLiLiuChengMoShi%>"></asp:Label>）</asp:HyperLink>
                                &nbsp;
                                                                    <asp:HyperLink ID="HL_TaskReview" runat="server" Enabled="False">---&gt;<asp:Label ID="Label25" runat="server" Text="<%$ Resources:lang,RenWuPingShen%>"></asp:Label></asp:HyperLink>
                                &nbsp;&nbsp;<asp:HyperLink ID="HL_RelatedWorkFlowTemplate" runat="server" NavigateUrl="TTProRelatedWFTemplate.aspx"
                                    Enabled="False">
                                    <asp:Label ID="Label26" runat="server" Text="<%$ Resources:lang,GuanLianGongZuoLiuMuBan%>"></asp:Label>
                                </asp:HyperLink>
                                &nbsp;
                                                                    <asp:HyperLink ID="HL_ActorGroup" runat="server" Font-Size="10pt" NavigateUrl="~/TTProjectRelatedActorGroup.aspx"
                                                                        Enabled="False">
                                                                        <asp:Label ID="Label27" runat="server" Text="<%$ Resources:lang,JueSeZuSheZhi%>"></asp:Label>
                                                                    </asp:HyperLink>
                                &nbsp;
                                                                    <asp:HyperLink ID="HL_WLTem" runat="server" NavigateUrl="~/TTWorkFlowTemplate.aspx"
                                                                        Enabled="False">
                                                                        <asp:Label ID="Label28" runat="server" Text="<%$ Resources:lang,MuBanWeiHu%>"></asp:Label>
                                                                    </asp:HyperLink>&nbsp;&nbsp;
                                                                    <asp:HyperLink ID="HL_TaskRelatedDoc" runat="server" Enabled="False" NavigateUrl="TTProTaskRelatedDoc.aspx">
                                                                        <asp:Label ID="Label29" runat="server" Text="<%$ Resources:lang,XiangGuanWenDang%>"></asp:Label>
                                                                    </asp:HyperLink>
                                &nbsp;
                                                                    <asp:HyperLink ID="HL_TestCase" runat="server" Enabled="False" NavigateUrl="TTMakeTaskTestCase.aspx">
                                                                        <asp:Label ID="Label30" runat="server" Text="<%$ Resources:lang,CeShiYongLi%>"></asp:Label>
                                                                    </asp:HyperLink>
                            </td>
                        </tr>
                    </table>

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
