<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTAllCustomerUsers.aspx.cs" Inherits="TTAllCustomerUsers" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Assembly="Brettle.Web.NeatUpload" Namespace="Brettle.Web.NeatUpload" TagPrefix="Upload" %>
<%@ Register Assembly="NickLee.Web.UI" Namespace="NickLee.Web.UI" TagPrefix="NickLee" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>我的人事</title>
    <link id="mainCss" href="css/bluelightmain.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        #AboveDiv {
            min-width: 1500px;
            width: expression (document.body.clientWidth <= 1500? "1500px" : "auto" ));
        }
    </style>
    <script type="text/javascript" src="js/Silverlight.js"></script>
    <script src="js/jquery-1.7.2.min.js" type="text/javascript"></script>
    <script src="js/allAHandler.js" type="text/javascript"></script>
    <script language="javascript" type="text/javascript">
        $(function () { if (top.location != self.location) { } else { CloseWebPage(); }
           
        });
    </script>
</head>
<body>
    <center>
        <form id="form1" runat="server">
            <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="True" EnableScriptLocalization="True">
            </asp:ScriptManager>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
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
                                                            <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,RenShiGuanLi%>"></asp:Label></td>
                                                        <td width="5">
                                                            <%--<img src="ImagesSkin/main_top_r.jpg" width="5" height="31" alt="" />--%>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td valign="top">
                                    <table cellpadding="0" cellspacing="0" width="100%">
                                        <tr>
                                            <td style="width: 180px; border-right: solid 1px #D8D8D8; padding: 5px 0px 0px 5px"
                                                valign="top" align="left">
                                                <asp:TreeView ID="TreeView1" runat="server" NodeWrap="True" OnSelectedNodeChanged="TreeView1_SelectedNodeChanged"
                                                    ShowLines="True" Width="180">
                                                    <RootNodeStyle CssClass="rootNode" />
                                                    <NodeStyle CssClass="treeNode" />
                                                    <LeafNodeStyle CssClass="leafNode" />
                                                    <SelectedNodeStyle CssClass="selectNode" ForeColor ="Red" />
                                                </asp:TreeView>
                                            </td>
                                            <td align="center" style="width: 165px; border-right: solid 1px #D8D8D8; padding: 5px 0px 0px 5px"
                                                valign="top">
                                                <table style="width: 100%; text-align: left;">
                                                    <tr>
                                                        <td style="text-align: center;">
                                                            <table width="100%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                                                <tr>
                                                                    <td>
                                                                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                            <tr>
                                                                                <td width="5%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,ChengYuanXinXi%>"></asp:Label></strong></td>
                                                                            </tr>
                                                                        </table>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                            <asp:DataGrid ID="DataGrid2" runat="server" AutoGenerateColumns="False" OnItemCommand="DataGrid2_ItemCommand"
                                                                Width="100%" Height="1px" CellPadding="4" ForeColor="#333333" GridLines="None"
                                                                ShowHeader="false">
                                                                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                                <EditItemStyle BackColor="#2461BF" />
                                                                <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />

                                                                <ItemStyle CssClass="itemStyle" />
                                                                <Columns>
                                                                    <asp:TemplateColumn HeaderText="部门人员：">
                                                                        <ItemTemplate>
                                                                            <asp:Button ID="BT_UserCode" runat="server" Text='<%# DataBinder.Eval(Container.DataItem,"UserCode") %>'
                                                                                CssClass="inpu" />
                                                                            <asp:Button ID="BT_UserName" runat="server" Text='<%# DataBinder.Eval(Container.DataItem,"UserName") %>'
                                                                                CssClass="inpu" />
                                                                        </ItemTemplate>
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" />
                                                                    </asp:TemplateColumn>
                                                                </Columns>
                                                            </asp:DataGrid>
                                                        </td>
                                                    </tr>
                                                </table>
                                                <asp:Label ID="LB_DepartCode" runat="server" Visible="False"></asp:Label>
                                                <br />
                                                <asp:Label ID="LB_UserCode" runat="server" Visible="False"></asp:Label>
                                                <br />
                                                <asp:Label ID="LB_DepartString" runat="server" Visible="False"></asp:Label>
                                            </td>
                                            <td align="left" valign="top" style="width: 40%">
                                                <table class="formBgStyle" style="width: 98%; text-align: left;" cellpadding="3"
                                                    cellspacing="0">
                                                    <tr>
                                                        <td style="width: 10%; text-align: right" class="formItemBgStyle">
                                                            <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,DaiMa%>"></asp:Label>：
                                                        </td>
                                                        <td class="formItemBgStyle" style="width: 20%">
                                                            <asp:TextBox ID="TB_UserCode" Width="100px" runat="server"></asp:TextBox>
                                                            <asp:Label ID="lbl_UserCode" runat="server" Visible="false"></asp:Label>
                                                            <span style="color: #ff0000">*</span>
                                                        </td>
                                                        <td align="center" rowspan="6" class="formItemBgStyle" colspan="2">
                                                            <asp:Image ID="IM_MemberPhoto" runat="server" Height="95%" Width="199px" AlternateText="<%$ Resources:lang,YuanGongZhaoPian%>" ImageAlign="Middle" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="text-align: right" class="formItemBgStyle">
                                                            <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,YongHuMing%>"></asp:Label>：
                                                        </td>
                                                        <td class="formItemBgStyle" style="width: 30%">
                                                            <asp:TextBox ID="TB_UserName" Width="100px" runat="server"></asp:TextBox>
                                                            <span style="color: #ff0000">*</span>
                                                            &nbsp;
                                                                    <asp:Button ID="BT_Find" runat="server" CssClass="inpu" OnClick="BT_Find_Click" Text="<%$ Resources:lang,ChaXun%>" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="text-align: right" class="formItemBgStyle">
                                                            <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,XingBie%>"></asp:Label>：
                                                        </td>
                                                        <td style="text-align: left" class="formItemBgStyle">
                                                            <asp:DropDownList ID="DL_Gender" runat="server">
                                                                <asp:ListItem Selected="True" Value="男" Text="<%$ Resources:lang,Nan%>" />
                                                                <asp:ListItem Value="女" Text="<%$ Resources:lang,Nv%>" />
                                                            </asp:DropDownList>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="text-align: right" class="formItemBgStyle">
                                                            <asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,NianLing%>"></asp:Label>：
                                                        </td>
                                                        <td style="text-align: left" class="formItemBgStyle">
                                                            <NickLee:NumberBox MaxAmount="1000000000000" MinAmount="-1000000000000" ID="TB_Age" runat="server" Precision="0" Width="50px" OnBlur=""
                                                                OnFocus="" OnKeyPress="" PositiveColor="">0</NickLee:NumberBox>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="text-align: right" class="formItemBgStyle">
                                                            <asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,MiMa%>"></asp:Label>：
                                                        </td>
                                                        <td class="formItemBgStyle">
                                                            <asp:TextBox ID="TB_Password" runat="server" Width="100px"></asp:TextBox>
                                                            <cc1:PasswordStrength ID="TB_Password_PasswordStrength" runat="server" Enabled="True"
                                                                TargetControlID="TB_Password">
                                                            </cc1:PasswordStrength>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="text-align: right" class="formItemBgStyle">
                                                            <asp:Label ID="Label8" runat="server" Text="<%$ Resources:lang,ZhiWu%>"></asp:Label>：
                                                        </td>
                                                        <td class="formItemBgStyle">
                                                            <asp:TextBox ID="TB_Duty" runat="server" Width="100px"></asp:TextBox>
                                                            <span style="color: #ff0000">*</span>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="text-align: right" class="formItemBgStyle">
                                                            <asp:Label ID="Label9" runat="server" Text="<%$ Resources:lang,ZhiCheng%>"></asp:Label>：
                                                        </td>
                                                        <td class="formItemBgStyle">
                                                            <asp:TextBox ID="TB_JobTitle" runat="server" Width="100px"></asp:TextBox>
                                                            <asp:DropDownList
                                                                ID="DDL_JobTitle" runat="server" DataTextField="Position" DataValueField="Position"
                                                                Width="100px" AutoPostBack="True" OnSelectedIndexChanged="DDL_JobTitle_SelectedIndexChanged">
                                                            </asp:DropDownList>
                                                        </td>
                                                        <td class="formItemBgStyle" colspan="2" align="center">
                                                            <asp:Button ID="BT_TakePhoto" runat="server" CssClass="inpu"
                                                                Enabled="False" OnClick="BT_TakePhoto_Click" Text="<%$ Resources:lang,PaiZhao%>"  Visible ="false" />
                                                            <cc1:ModalPopupExtender ID="BT_TakePhoto_ModalPopupExtender" runat="server"
                                                                BackgroundCssClass="modalBackground" Y="150" CancelControlID="IMBT_Close"
                                                                DynamicServicePath="" Enabled="True" PopupControlID="Panel2"
                                                                TargetControlID="BT_TakePhoto">
                                                            </cc1:ModalPopupExtender>
                                                            &nbsp;<asp:Button ID="BT_DeletePhoto" runat="server" CssClass="inpu"
                                                                Enabled="False" OnClick="BT_DeletePhoto_Click" OnClientClick="return confirm(getDeleteMsgByLangCode())" Text="<%$ Resources:lang,ShanChu%>" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="text-align: right" class="formItemBgStyle">
                                                            <asp:Label ID="Label10" runat="server" Text="<%$ Resources:lang,BuMen%>"></asp:Label>：
                                                        </td>
                                                        <td class="formItemBgStyle">
                                                            <asp:DropDownList ID="DL_Department" runat="server" DataTextField="DepartName"
                                                                DataValueField="DepartCode" CssClass="DDList" Enabled="false">
                                                            </asp:DropDownList>
                                                        </td>
                                                        <td class="formItemBgStyle" colspan="2" align="center">

                                                            <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
                                                                <ContentTemplate>
                                                                    <asp:FileUpload ID="FUP_File" runat="server" Width="180px" />
                                                                    <asp:Button ID="BT_UploadPhoto" runat="server" Text="<%$ Resources:lang,ShangChuan%>" OnClick="BT_UploadPhoto_Click"
                                                                        CssClass="inpu" Enabled="False" />
                                                                </ContentTemplate>
                                                                <Triggers>
                                                                    <asp:PostBackTrigger ControlID="BT_UploadPhoto"></asp:PostBackTrigger>
                                                                </Triggers>
                                                            </asp:UpdatePanel>

                                                            <asp:HyperLink ID="HL_MemberPhoto" runat="server" Visible="False">[HL_MemberPhoto]</asp:HyperLink>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="text-align: right" class="formItemBgStyle">
                                                            <asp:Label ID="Label11" runat="server" Text="<%$ Resources:lang,ZiBuMen%>"></asp:Label>：
                                                        </td>
                                                        <td class="formItemBgStyle">
                                                            <asp:TextBox ID="TB_ChildDepartment" runat="server" Width="100px"></asp:TextBox>
                                                        </td>
                                                        <td style="text-align: right; width: 10%" class="formItemBgStyle">
                                                            <asp:Label ID="Label12" runat="server" Text="<%$ Resources:lang,BanGongDianHua%>"></asp:Label>：
                                                        </td>
                                                        <td class="formItemBgStyle" style="width: 20%">
                                                            <asp:TextBox ID="TB_OfficePhone" runat="server" Width="100px"></asp:TextBox>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="height: 28px; text-align: right" class="formItemBgStyle">
                                                            <asp:Label ID="Label13" runat="server" Text="<%$ Resources:lang,ShouJi%>"></asp:Label>：
                                                        </td>
                                                        <td class="formItemBgStyle">
                                                            <asp:TextBox ID="TB_MobilePhone" runat="server" Width="100px"></asp:TextBox>
                                                            <span style="color: #ff0000">*</span>
                                                        </td>
                                                        <td style="text-align: right" class="formItemBgStyle">
                                                            <asp:Label ID="Label14" runat="server" Text="<%$ Resources:lang,Email%>"></asp:Label>：
                                                        </td>
                                                        <td class="formItemBgStyle">
                                                            <asp:TextBox ID="TB_EMail" runat="server" Width="120px"></asp:TextBox>
                                                            <span style="color: #ff0000">*</span>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="text-align: right" class="formItemBgStyle">
                                                            <asp:Label ID="Label15" runat="server" Text="<%$ Resources:lang,ZhuangTai%>"></asp:Label>：
                                                        </td>
                                                        <td style="text-align: left;" class="formItemBgStyle">
                                                            <asp:DropDownList ID="DL_Status" runat="server">
                                                                <asp:ListItem Value="在职" Text="<%$ Resources:lang,ZaiZhi%>" />
                                                                <asp:ListItem Value="离职" Text="<%$ Resources:lang,LiZhi%>" />
                                                                <asp:ListItem Value="终止" Text="<%$ Resources:lang,ZhongZhi%>" />
                                                            </asp:DropDownList>
                                                        </td>
                                                        <td style="height: 12px; text-align: right;" class="formItemBgStyle">
                                                            <asp:Label ID="Label16" runat="server" Text="<%$ Resources:lang,JiaRuRiQi%>"></asp:Label>：
                                                        </td>
                                                        <td style="height: 12px; text-align: left;" class="formItemBgStyle">
                                                            <asp:TextBox ID="DLC_JoinDate" ReadOnly="false" runat="server" Width="100px"></asp:TextBox>
                                                            <ajaxToolkit:CalendarExtender Format="yyyy-MM-dd" ID="CalendarExtender1"
                                                                runat="server" TargetControlID="DLC_JoinDate">
                                                            </ajaxToolkit:CalendarExtender>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="height: 23px; text-align: right" class="formItemBgStyle">
                                                            <asp:Label ID="Label17" runat="server" Text="<%$ Resources:lang,GongZuoFanWei%>"></asp:Label>：
                                                        </td>
                                                        <td style="height: 23px" class="formItemBgStyle" colspan="3">
                                                            <asp:TextBox ID="TB_WorkScope" runat="server" Height="35px" TextMode="MultiLine"
                                                                Width="90%"></asp:TextBox>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="formItemBgStyle" style="height: 12px; text-align: right;">
                                                            <asp:Label ID="Label18" runat="server" Text="<%$ Resources:lang,CanKaoGongHao%>"></asp:Label>：
                                                        </td>
                                                        <td class="formItemBgStyle" style="height: 12px; text-align: left;">
                                                            <asp:TextBox ID="TB_RefUserCode" runat="server" Width="100px"></asp:TextBox>
                                                        </td>
                                                        <td class="formItemBgStyle" style="height: 12px; text-align: right;">
                                                            <asp:Label ID="Label19" runat="server" Text="<%$ Resources:lang,RXTZhuangHu%>"></asp:Label>：</td>
                                                        <td class="formItemBgStyle" style="height: 12px; text-align: left;">
                                                            <asp:TextBox ID="TB_UserRTXCode" runat="server" Width="100px"></asp:TextBox>
                                                        </td>
                                                    </tr>

                                                    <tr style="display: none">
                                                        <td class="formItemBgStyle" style="height: 12px; text-align: right;">
                                                            <asp:Label ID="Label20" runat="server" Text="<%$ Resources:lang,xingzhi%>"></asp:Label>：
                                                        </td>
                                                        <td class="formItemBgStyle" style="height: 12px; text-align: left;">
                                                            <asp:DropDownList ID="DL_UserType"  Enabled="false" runat="server">
                                                                <asp:ListItem Value="OUTER" Text="<%$ Resources:lang,WaiBu%>" />
                                                                <asp:ListItem Value="INNER" Text="<%$ Resources:lang,NeiBu%>" />
                                                            </asp:DropDownList>
                                                        </td>
                                                        <td class="formItemBgStyle" style="height: 12px; text-align: right;">
                                                            <asp:Label ID="Label21" runat="server" Text="<%$ Resources:lang,YongGongLeiXing%>"></asp:Label>：&nbsp;
                                                        </td>
                                                        <td class="formItemBgStyle">
                                                            <asp:DropDownList ID="DL_WorkType" runat="server" DataTextField="TypeName" DataValueField="TypeName">
                                                            </asp:DropDownList>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="formItemBgStyle" style="height: 12px; text-align: right;">
                                                            <asp:Label ID="Label22" runat="server" Text="<%$ Resources:lang,ZhuJieMianFengGe%>"></asp:Label>：</td>
                                                        <td class="formItemBgStyle" style="height: 12px; text-align: left;">
                                                            <asp:DropDownList ID="DL_SystemMDIStyle" runat="server" Width="100px" DataTextField="MDIStyle" DataValueField="MDIStyle">
                                                            </asp:DropDownList>
                                                        </td>
                                                        <td class="formItemBgStyle" style="height: 12px; text-align: right;">
                                                            <asp:Label ID="Label23" runat="server" Text="<%$ Resources:lang,KeDengSheBei%>"></asp:Label>：</td>
                                                        <td class="formItemBgStyle" style="height: 12px; text-align: left;">
                                                            <asp:DropDownList ID="DL_AllowDevice" runat="server" Enabled="false">
                                                                <asp:ListItem Value="ALL" Text="<%$ Resources:lang,QuanBu%>" />
                                                                <asp:ListItem Value="PC" Text="<%$ Resources:lang,DianNao%>" />
                                                                <asp:ListItem Value="MOBILE" Text="<%$ Resources:lang,DianNaoSheBei%>" />
                                                            </asp:DropDownList>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="formItemBgStyle" style="height: 12px; text-align: right;">
                                                            <asp:Label ID="Label24" runat="server" Text="<%$ Resources:lang,ShunXuHao%>"></asp:Label>： </td>
                                                        <td class="formItemBgStyle" style="height: 12px; text-align: left;">
                                                            <NickLee:NumberBox ID="NB_SortNumber" runat="server" MaxAmount="1000000000000" MinAmount="-1000000000000" OnBlur="" OnFocus="" OnKeyPress="" PositiveColor="" Precision="0" Width="80px">0</NickLee:NumberBox>
                                                        </td>
                                                        <td class="formItemBgStyle" style="height: 12px; text-align: right;">&nbsp;</td>
                                                        <td class="formItemBgStyle" style="height: 12px; text-align: left;">&nbsp;</td>
                                                    </tr>
                                                    <tr>
                                                        <td class="formItemBgStyle" colspan="4" style="text-align: center">
                                                            <asp:Button ID="BT_New" runat="server" CssClass="inpu" Text="<%$ Resources:lang,XinJian%>" OnClick="BT_New_Click" />&nbsp;&nbsp;&nbsp;
                                                                    <asp:Button ID="BT_Update" runat="server" OnClick="BT_Update_Click" CssClass="inpu" Text="<%$ Resources:lang,BaoCun%>" Enabled="false" />&nbsp;&nbsp;&nbsp;
                                                                    <asp:Button ID="BT_Delete" runat="server" CssClass="inpu" OnClick="BT_Delete_Click" OnClientClick="return confirm(getDeleteMsgByLangCode())" Text="<%$ Resources:lang,ShanChu%>" Enabled="false" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="4" style="text-align: center" class="formItemBgStyle">
                                                            <span style="color: red; font-size: 8pt;">
                                                                <asp:Label ID="Label34" runat="server" Text="<%$ Resources:lang,DWBTXXGSMMWKJBGBYLMM%>"></asp:Label></span>
                                                        </td>
                                                    </tr>

                                                    <tr>
                                                        <td align="right" class="formItemBgStyle">
                                                            <asp:Label ID="Label25" runat="server" Text="<%$ Resources:lang,DaoRuXinZengChengYuanXinXi%>"></asp:Label>：</td>
                                                        <td align="left" class="formItemBgStyle" colspan="3">
                                                            <asp:UpdatePanel ID="UpdatePanel3" runat="server" UpdateMode="Conditional">
                                                                <ContentTemplate>
                                                                    <div>
                                                                        <Upload:InputFile ID="FileUpload_Training" runat="server" Width="400px" />
                                                                        <br />
                                                                        <asp:Button ID="btn_ExcelToDataTraining" runat="server" CssClass="inpu" OnClick="btn_ExcelToDataTraining_Click" Text="<%$ Resources:lang,DaoRuShuJu%>" />
                                                                        <asp:Label ID="Label26" runat="server" Text="<%$ Resources:lang,ShuJuXinZengMuBanGeShi%>"></asp:Label>：<a href="Template/成员数据导入新增模版.xls"><asp:Label ID="Label27" runat="server" Text="<%$ Resources:lang,ChengYuanShuJuDaoRuXinZengMoBan%>"></asp:Label></a>
                                                                        <div id="ProgressBar">
                                                                            <Upload:ProgressBar ID="ProgressBar1" runat="server" Height="100px" Width="500px">
                                                                            </Upload:ProgressBar>
                                                                        </div>
                                                                    </div>
                                                                </ContentTemplate>
                                                                <Triggers>
                                                                    <asp:PostBackTrigger ControlID="btn_ExcelToDataTraining" />
                                                                </Triggers>
                                                            </asp:UpdatePanel>
                                                            <asp:Label ID="LB_ErrorText" runat="server" ForeColor="Red"></asp:Label>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                            <td>
                                                <table width="100%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                                    <tr>
                                                        <td align="left" class="formItemBgStyle">
                                                            <asp:Label ID="Label28" runat="server" Text="<%$ Resources:lang,CaoZuoXinXi%>"></asp:Label>：<asp:TextBox ID="txt_SupplierInfo" runat="server" Width="80px"></asp:TextBox>
                                                            &nbsp;
                                                            <asp:Label ID="LB_Sql" runat="server" Visible="False"></asp:Label>
                                                        </td>
                                                        <td align="left" class="formItemBgStyle">
                                                            <asp:Button ID="BT_Query" runat="server" CssClass="inpu" Text="<%$ Resources:lang,ChaXun%>" OnClick="BT_Query_Click" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="2">
                                                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                <tr>
                                                                    <td width="10%" align="center">
                                                                        <strong>
                                                                            <asp:Label ID="Label29" runat="server" Text="<%$ Resources:lang,BianHao%>"></asp:Label></strong>
                                                                    </td>
                                                                    <td width="25%" align="center">
                                                                        <strong>
                                                                            <asp:Label ID="Label30" runat="server" Text="<%$ Resources:lang,ChengYuanZhangHao%>"></asp:Label></strong>
                                                                    </td>
                                                                    <td width="25%" align="center">
                                                                        <strong>
                                                                            <asp:Label ID="Label31" runat="server" Text="<%$ Resources:lang,ChengYuanXingMing%>"></asp:Label></strong>
                                                                    </td>
                                                                    <td width="15%" align="center">
                                                                        <strong>
                                                                            <asp:Label ID="Label32" runat="server" Text="<%$ Resources:lang,CaoZuoRen%>"></asp:Label></strong>
                                                                    </td>
                                                                    <td width="25%" align="center">
                                                                        <strong>
                                                                            <asp:Label ID="Label33" runat="server" Text="<%$ Resources:lang,GengXinShiJian%>"></asp:Label></strong>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                </table>
                                                <asp:DataGrid ID="DataGrid1" runat="server" AutoGenerateColumns="False"
                                                    Width="100%" AllowPaging="True" PageSize="10" OnPageIndexChanged="DataGrid1_PageIndexChanged"
                                                    ShowHeader="false" CellPadding="1" ForeColor="#333333" GridLines="None">
                                                    <Columns>
                                                        <asp:BoundColumn DataField="ID" HeaderText="编号">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                        </asp:BoundColumn>
                                                        <asp:BoundColumn DataField="UserCode" HeaderText="成员帐号">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="25%" />
                                                        </asp:BoundColumn>
                                                        <asp:BoundColumn DataField="UserName" HeaderText="成员姓名">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="25%" />
                                                        </asp:BoundColumn>
                                                        <asp:BoundColumn DataField="CreaterName" HeaderText="操作人">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="15%" />
                                                        </asp:BoundColumn>
                                                        <asp:BoundColumn DataField="CreateTime" HeaderText="更新时间" DataFormatString="{0:yyyy-MM-dd HH:mm:ss}">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="25%" />
                                                        </asp:BoundColumn>
                                                    </Columns>
                                                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                    <EditItemStyle BackColor="#2461BF" />
                                                    <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                    <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />

                                                    <ItemStyle CssClass="itemStyle" />
                                                </asp:DataGrid>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </div>
                    <asp:Panel ID="Panel2" runat="server" CssClass="modalPopup" Style="display: none; width: 710px; height: 320px;">
                        <%--   <div id="silverlightControlHost" class="modalPopup-text" style="width: 100%; height: 100%; float: left;">
                            <table width="100%">
                                <tr>
                                    <td style="width: 710px;" valign="top" align="left">
                                        <object data="data:application/x-silverlight-2," type="application/x-silverlight-2"
                                            width="710px" height="320px">
                                            <param name="source" value="ClientBin/TakeTopMakePhoto.xap" />
                                            <param name="onError" value="onSilverlightError" />
                                            <param name="background" value="white" />
                                            <param name="minRuntimeVersion" value="4.0.50826.0" />
                                            <param name="autoUpgrade" value="true" />
                                            <a href="http://go.microsoft.com/fwlink/?LinkID=149156&v=4.0.50826.0" style="text-decoration: none">
                                                <img src="http://go.microsoft.com/fwlink/?LinkId=161376" alt="Get Microsoft Silverlight"
                                                    style="border-style: none" />
                                            </a>
                                        </object>
                                        <iframe id="_sl_historyFrame" style="visibility: hidden; height: 0px; width: 0px; border: 0px"></iframe>
                                    </td>
                                    <td>
                                        <br />
                                        <asp:ImageButton ID="IMBT_Close" ImageUrl="ImagesSkin/Close4.jpg" runat="server" />
                                    </td>
                                </tr>
                            </table>
                        </div>--%>
                    </asp:Panel>
                    <br />
                    <asp:TextBox ID="TB_PhotoString1" runat="server" Style="visibility: hidden"></asp:TextBox>
                    <asp:TextBox ID="TB_PhotoString2" runat="server" Style="visibility: hidden"></asp:TextBox>
                    <asp:TextBox ID="TB_PhotoString3" runat="server" Style="visibility: hidden"></asp:TextBox>
                    <asp:TextBox ID="TB_PhotoString4" runat="server" Style="visibility: hidden"></asp:TextBox>
                    <asp:Button ID="BT_SavePhoto" runat="server" CssClass="inpuLong" OnClick="BT_SavePhoto_Click"
                        Style="visibility: hidden" />
                </ContentTemplate>
            </asp:UpdatePanel>
            <div style="position: absolute; left: 40%; top: 1%;">
                <asp:UpdateProgress ID="TakeTopUp" runat="server" AssociatedUpdatePanelID="UpdatePanel1">
                    <ProgressTemplate>
                        <img src="Images/Processing.gif" alt="Loading,please wait..." />
                    </ProgressTemplate>
                </asp:UpdateProgress>
            </div>
        </form>
    </center>
</body>
<script type="text/javascript" language="javascript">var cssDirectory = '<%=Session["CssDirectory"] %>'; var oLink = document.getElementById('mainCss'); oLink.href = 'css/' + cssDirectory + '/' + 'bluelightmain.css';</script></html>
