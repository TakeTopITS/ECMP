<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTUserInfor_ThirtPart.aspx.cs" Inherits="TTUserInfor_ThirtPart" %>


<%@ Register Assembly="NickLee.Web.UI" Namespace="NickLee.Web.UI" TagPrefix="NickLee" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>项目成员资料</title>
    <link id="mainCss" href="css/bluelightmain.css" rel="stylesheet" type="text/css" />

    <script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="js/allAHandler.js"></script>
    <script type="text/javascript" src="js/layer/layer/layer.js"></script>
    <script type="text/javascript" src="js/popwindow.js"></script>
    <script type="text/javascript" language="javascript">
        $(function () {
            if (top.location != self.location) { } else { CloseWebPage(); }



        });

        function AdjustDivHeight() {

            document.getElementById("Div_TreeView").style.height = document.documentElement.clientHeight + "px";
        }

    </script>

     <script type="text/javascript">

         var disPostion = 0;

         function SaveScroll() {
             disPostion = Div_TreeView.scrollTop;
         }

         function RestoreScroll() {
             Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);
         }

         function EndRequestHandler(sender, args) {
             Div_TreeView.scrollTop = disPostion;
         }
    </script>


    <style type="text/css">
        .auto-style1 {
            /*border-bottom:dotted  1px #C6CFD4;
        height: 19px;
        line-height: 18px;*/
            border-bottom: 1px dotted #cccccc;
            background-color: #fff;
            background-repeat: no-repeat;
            padding-top: 10px;
            height: 23px;
        }
    </style>

</head>
<body>
    <center>
        <form id="form1" runat="server">
            <%--  <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="True" EnableScriptLocalization="True">--%>
            <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="True" EnableScriptLocalization="True">
            </asp:ScriptManager>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <table id="AboveTable" cellpadding="0" width="100%" cellspacing="0">
                        <tr>
                            <td>

                                <table cellpadding="0" cellspacing="0" width="100%" class="bian">
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
                                                                    <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,DiSanFangChengYuanSheZhi%>"></asp:Label>
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
                                        <td>
                                            <table cellpadding="0" cellspacing="0" width="100%">
                                                <tr>
                                                    <td width="220" style="border-right: solid 1px #D8D8D8;" valign="top" align="left">
                                                        <div id="Div_TreeView" style="overflow: auto; height:800px; ">
                                                            <asp:TreeView ID="TreeView1" runat="server" NodeWrap="True" ShowLines="True" Width="220"
                                                                OnSelectedNodeChanged="TreeView1_SelectedNodeChanged">
                                                                <RootNodeStyle CssClass="rootNode" />
                                                                <NodeStyle CssClass="treeNode" />
                                                                <LeafNodeStyle CssClass="leafNode" />
                                                                <SelectedNodeStyle CssClass="selectNode" ForeColor ="Red" />
                                                            </asp:TreeView>

                                                        </div>
                                                    </td>
                                                    <td align="center" style="border-right: solid 1px #D8D8D8;" valign="top">
                                                        <table style="width: 100%; height: 53px; text-align: left;">
                                                            <tr>
                                                                <td align="center" style="padding: 5px 5px 5px 5px;">
                                                                    <table width="100%">
                                                                        <tr>
                                                                            <td style="width: 20%; text-align: right;" class="formItemBgStyle">&nbsp;</td>
                                                                            <td style="width: 100px; text-align: right" class="formItemBgStyle">
                                                                                <asp:Label ID="Label114" runat="server" Text="<%$ Resources:lang,DaiMa %>"></asp:Label></td>
                                                                            <td class="formItemBgStyle">
                                                                                <asp:TextBox ID="TB_UserCodeFind" Width="100px" runat="server"></asp:TextBox></td>

                                                                            <td style="text-align: right" class="formItemBgStyle">
                                                                                <asp:Label ID="Label121" runat="server" Text="<%$ Resources:lang,YongHuMing %>"></asp:Label></td>
                                                                            <td class="formItemBgStyle">
                                                                                <asp:TextBox ID="TB_UserNameFind" Width="100px" runat="server"></asp:TextBox>
                                                                            </td>
                                                                            <td class="formItemBgStyle">
                                                                                <asp:Button ID="Button1" runat="server" CssClass="inpu" OnClick="BT_Find_Click" Text="<%$ Resources:lang,ChaXun %>" />
                                                                            </td>
                                                                            <td style="width: 20%; text-align: right;" class="formItemBgStyle">
                                                                                <asp:Button ID="BT_Create" runat="server" Text="<%$ Resources:lang,New%>" CssClass="inpuYello" OnClick="BT_Create_Click" />
                                                                            </td>
                                                                        </tr>
                                                                    </table>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td style="width: 100%; height: 14px; text-align: center">
                                                                    <table width="100%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                                                        <tr>
                                                                            <td width="7">
                                                                                <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" alt="" />
                                                                            </td>
                                                                            <td>
                                                                                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                                    <tr>
                                                                                       <td width="5%" align="center">
                                                                        <strong>
                                                                            <asp:Label ID="Label56" runat="server" Text="<%$ Resources:lang,BianJi %>" /></strong>
                                                                    </td>
                                                                    <td width="5%" align="center">
                                                                        <strong>
                                                                            <asp:Label ID="Label63" runat="server" Text="<%$ Resources:lang,ShanChu %>" /></strong>
                                                                    </td>
                                                                 
                                                                                        <td width="8%" align="center">
                                                                                            <strong>
                                                                                                <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,DaiMa%>"></asp:Label></strong>
                                                                                        </td>
                                                                                        <td width="6%" align="center">
                                                                                            <strong>
                                                                                                <asp:Label ID="Label47" runat="server" Text="<%$ Resources:lang,XingMing%>"></asp:Label></strong>
                                                                                        </td>
                                                                                        <td width="3%" align="center">
                                                                                            <strong>
                                                                                                <asp:Label ID="Label48" runat="server" Text="<%$ Resources:lang,XingBie%>"></asp:Label></strong>
                                                                                        </td>
                                                                                        <%--<td width="3%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label25" runat="server" Text="<%$ Resources:lang,NianLing%>"></asp:Label></strong>
                                                                                </td>--%>
                                                                                        <td width="6%" align="center">
                                                                                            <strong>
                                                                                                <asp:Label ID="Label49" runat="server" Text="<%$ Resources:lang,BuMenDaiMa%>"></asp:Label></strong>
                                                                                        </td>
                                                                                        <td width="7%" align="center">
                                                                                            <strong>
                                                                                                <asp:Label ID="Label50" runat="server" Text="<%$ Resources:lang,BuMenMingCheng%>"></asp:Label></strong>
                                                                                        </td>
                                                                                        <td width="6%" align="center">
                                                                                            <strong>
                                                                                                <asp:Label ID="Label51" runat="server" Text="<%$ Resources:lang,ZhiZe%>"></asp:Label></strong>
                                                                                        </td>
                                                                                        <td width="6%" align="center">
                                                                                            <strong>
                                                                                                <asp:Label ID="Label52" runat="server" Text="<%$ Resources:lang,BanGongDianHua%>"></asp:Label></strong>
                                                                                        </td>
                                                                                        <td width="6%" align="center">
                                                                                            <strong>
                                                                                                <asp:Label ID="Label53" runat="server" Text="<%$ Resources:lang,YiDongDianHua%>"></asp:Label></strong>
                                                                                        </td>


                                                                                        <td width="7%" align="center">
                                                                                            <strong>
                                                                                                <asp:Label ID="Label54" runat="server" Text="<%$ Resources:lang,JiaRuRiQi%>"></asp:Label></strong>
                                                                                        </td>
                                                                                        <td width="5%" align="center">
                                                                                            <strong>
                                                                                                <asp:Label ID="Label60" runat="server" Text="<%$ Resources:lang,ZhuangTai%>"></asp:Label></strong>
                                                                                        </td>

                                                                                    </tr>
                                                                                </table>
                                                                            </td>
                                                                            <td width="6" align="right">
                                                                                <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" />
                                                                            </td>
                                                                        </tr>
                                                                    </table>
                                                                    <asp:DataGrid ID="DataGrid2" runat="server" AllowPaging="True" AutoGenerateColumns="False" OnItemCommand="DataGrid2_ItemCommand" OnPageIndexChanged="DataGrid2_PageIndexChanged"
                                                                        Width="100%" Height="1px" CellPadding="4" ForeColor="#333333" GridLines="None" PageSize="25"
                                                                        ShowHeader="false">
                                                                        <Columns>
                                                                            <asp:ButtonColumn ButtonType="LinkButton" CommandName="Update" Text="&lt;div&gt;&lt;img src=ImagesSkin/Update.png border=0 alt='修改' /&gt;&lt;/div&gt;">
                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                            </asp:ButtonColumn>
                                                                            <asp:TemplateColumn HeaderText="Delete">
                                                                                <ItemTemplate>
                                                                                    <asp:LinkButton ID="LBT_Delete" CommandName="Delete" runat="server" OnClientClick="return confirm(getDeleteMsgByLangCode())" Text="&lt;div&gt;&lt;img src=ImagesSkin/Delete.png border=0 alt='删除' /&gt;&lt;/div&gt;"></asp:LinkButton>
                                                                                </ItemTemplate>
                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                            </asp:TemplateColumn>
                                                                            <asp:BoundColumn DataField="UserCode" HeaderText="代码">
                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                                            </asp:BoundColumn>
                                                                            <asp:HyperLinkColumn DataNavigateUrlField="UserCode" DataNavigateUrlFormatString="TTUserInforView.aspx?UserCode={0}"
                                                                                DataTextField="UserName" HeaderText="姓名" Target="_blank">
                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                                                            </asp:HyperLinkColumn>
                                                                            <asp:BoundColumn DataField="Gender" HeaderText="性别">
                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="3%" />
                                                                            </asp:BoundColumn>
                                                                            <%--<asp:BoundColumn DataField="Age" HeaderText="年龄">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="3%" />
                                                                    </asp:BoundColumn>--%>
                                                                            <asp:BoundColumn DataField="DepartCode" HeaderText="部门代码">
                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                                                            </asp:BoundColumn>
                                                                            <asp:BoundColumn DataField="DepartName" HeaderText="部门名称">
                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="7%" />
                                                                            </asp:BoundColumn>
                                                                            <asp:BoundColumn DataField="Duty" HeaderText="职责">
                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                                                            </asp:BoundColumn>
                                                                            <asp:BoundColumn DataField="OfficePhone" HeaderText="办公电话">
                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                                                            </asp:BoundColumn>
                                                                            <asp:BoundColumn DataField="MobilePhone" HeaderText="移动电话">
                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                                                            </asp:BoundColumn>
                                                                            <asp:BoundColumn DataField="JoinDate" HeaderText="加入日期" DataFormatString="{0:yyyy/MM/dd}">
                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="7%" />
                                                                            </asp:BoundColumn>
                                                                            <asp:TemplateColumn HeaderText="状态">
                                                                                <ItemTemplate>
                                                                                    <%# ShareClass. GetStatusHomeNameByOtherStatus(Eval("Status").ToString()) %>
                                                                                </ItemTemplate>
                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="5%" />
                                                                            </asp:TemplateColumn>


                                                                        </Columns>

                                                                        <ItemStyle CssClass="itemStyle" />
                                                                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                                        <EditItemStyle BackColor="#2461BF" />
                                                                        <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                                        <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />
                                                                    </asp:DataGrid>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                        <br />
                                                    </td>

                                                </tr>
                                            </table>
                                            <br />
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>

                    <div class="layui-layer layui-layer-iframe" id="popwindow"
                        style="z-index: 9999; width: 900px; height: 530px; position: absolute; overflow: hidden; display: none; border-radius: 10px;">
                        <div class="layui-layer-title" style="background: #e7e7e8;" id="popwindow_title">
                            <asp:Label ID="Label55" runat="server" Text="&lt;div&gt;&lt;img src=ImagesSkin/Update.png border=0 width=30px height=30px alt='BusinessForm' /&gt;&lt;/div&gt;"></asp:Label>
                        </div>
                        <div id="popwindow_content" class="layui-layer-content" style="overflow: auto; text-align: left;">

                            <table class="formBgStyle" style="width: 600px; text-align: left;" cellpadding="3"
                                cellspacing="0">
                                <tr>
                                    <td style="width: 15%; text-align: right" class="formItemBgStyle">
                                        <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,DaiMa%>"></asp:Label>：
                                    </td>
                                    <td class="formItemBgStyle">
                                        <asp:TextBox ID="TB_UserCode" Width="220px" runat="server"></asp:TextBox>
                                    </td>
                                    <td style="text-align: left;" width="40px" class="formItemBgStyle">
                                        <span style="color: #ff0000">*</span>
                                    </td>
                                    <td style="text-align: center;" width="220px" rowspan="6" class="formItemBgStyle">
                                        <asp:Image ID="IM_MemberPhoto" runat="server" Height="200px" Width="200px" AlternateText="Member'sPhoto" />
                                    </td>
                                </tr>
                                <tr>
                                    <td style="text-align: right" class="formItemBgStyle">
                                        <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,YongHuMing%>"></asp:Label>：
                                    </td>
                                    <td class="formItemBgStyle">
                                        <asp:TextBox ID="TB_UserName" Width="220px" runat="server"></asp:TextBox>
                                        <asp:Button ID="BT_Find" runat="server" CssClass="inpu" OnClick="BT_Find_Click"  Text="<%$ Resources:lang,ChaXun%>"  Visible ="false"/>
                                    </td>
                                    <td style="text-align: left;" class="formItemBgStyle">
                                        <span style="color: #ff0000">*<span>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="text-align: right" class="formItemBgStyle">
                                        <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,XingBie%>"></asp:Label>：
                                    </td>
                                    <td style="text-align: left" class="formItemBgStyle">
                                        <asp:DropDownList ID="DL_Gender" runat="server" AutoPostBack="True">
                                            <asp:ListItem Selected="True" Value="男" Text="<%$ Resources:lang,Nan%>" />
                                            <asp:ListItem Value="女" Text="<%$ Resources:lang,Nv%>" />
                                        </asp:DropDownList>
                                    </td>
                                    <td class="formItemBgStyle"></td>
                                </tr>
                                <tr>
                                    <td style="text-align: right" class="formItemBgStyle">
                                        <asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,NianLing%>"></asp:Label>：
                                    </td>
                                    <td style="text-align: left" class="formItemBgStyle">
                                        <NickLee:NumberBox MaxAmount="1000000000000" MinAmount="-1000000000000" ID="TB_Age" runat="server" Precision="0" Width="50px" OnBlur=""
                                            OnFocus="" OnKeyPress="" PositiveColor="">0</NickLee:NumberBox>
                                    </td>
                                    <td class="formItemBgStyle"></td>
                                </tr>
                                <tr>
                                    <td style="text-align: right" class="formItemBgStyle">
                                        <asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,MiMa%>"></asp:Label>：
                                    </td>
                                    <td class="formItemBgStyle">
                                        <asp:TextBox ID="TB_Password" runat="server" Width="220px"></asp:TextBox>
                                        <cc1:PasswordStrength ID="TB_Password_PasswordStrength" runat="server" Enabled="True"
                                            TargetControlID="TB_Password">
                                        </cc1:PasswordStrength>
                                    </td>
                                    <td class="formItemBgStyle"></td>
                                </tr>
                                <tr>
                                    <td style="text-align: right" class="formItemBgStyle">
                                        <asp:Label ID="Label8" runat="server" Text="<%$ Resources:lang,ZhiWu%>"></asp:Label>：
                                    </td>
                                    <td class="formItemBgStyle">
                                        <asp:TextBox ID="TB_Duty" runat="server" Width="220px"></asp:TextBox>
                                    </td>
                                    <td style="text-align: left;" class="formItemBgStyle">
                                        <span style="color: #ff0000">*</span>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="text-align: right" class="formItemBgStyle">
                                        <asp:Label ID="Label9" runat="server" Text="<%$ Resources:lang,BuMen %>"></asp:Label></td>
                                    <td class="formItemBgStyle">
                                        <asp:TextBox ID="TB_DepartCode" runat="server"></asp:TextBox>
                                        <asp:Label ID="LB_DepartName" runat="server"></asp:Label><span style="color: #ff0000">*<span>
                                            <cc1:ModalPopupExtender ID="ModalPopupExtender1"
                                                runat="server" Enabled="True" TargetControlID="TB_DepartCode" PopupControlID="Panel3"
                                                CancelControlID="IMB_CloseDepartment" BackgroundCssClass="modalBackground" Y="150">
                                            </cc1:ModalPopupExtender></td>
                                    <td class="formItemBgStyle" style="text-align: right;"></td>
                                    <td class="formItemBgStyle"></td>
                                </tr>
                                <tr>
                                    <td style="text-align: right" class="formItemBgStyle">
                                        <asp:Label ID="Label10" runat="server" Text="<%$ Resources:lang,ZiBuMen%>"></asp:Label>：
                                    </td>
                                    <td class="formItemBgStyle">
                                        <asp:TextBox ID="TB_ChildDepartment" runat="server" Width="220px"></asp:TextBox>
                                    </td>
                                    <td class="formItemBgStyle"></td>
                                    <td style="height: 28px; text-align: left;" class="formItemBgStyle"></td>
                                </tr>
                                <tr>
                                    <td style="text-align: right" class="formItemBgStyle">
                                        <asp:Label ID="Label11" runat="server" Text="<%$ Resources:lang,BanGongDianHua%>"></asp:Label>：
                                    </td>
                                    <td class="formItemBgStyle">
                                        <asp:TextBox ID="TB_OfficePhone" runat="server" Width="220px"></asp:TextBox>
                                    </td>
                                    <td class="formItemBgStyle"></td>
                                    <td class="formItemBgStyle"></td>
                                </tr>
                                <tr>
                                    <td style="height: 28px; text-align: right" class="formItemBgStyle">
                                        <asp:Label ID="Label12" runat="server" Text="<%$ Resources:lang,ShouJi%>"></asp:Label>：
                                    </td>
                                    <td class="formItemBgStyle">
                                        <asp:TextBox ID="TB_MobilePhone" runat="server" Width="220px"></asp:TextBox>
                                    </td>
                                    <td style="height: 28px; text-align: left;" class="formItemBgStyle">
                                        <span style="color: #ff0000">*</span>
                                    </td>
                                    <td style="height: 28px; text-align: left;" class="formItemBgStyle"></td>
                                </tr>
                                <tr>
                                    <td style="text-align: right" class="formItemBgStyle">E_Mail：
                                    </td>
                                    <td class="formItemBgStyle">
                                        <asp:TextBox ID="TB_EMail" runat="server" Width="220px"></asp:TextBox>
                                    </td>
                                    <td style="text-align: left;" class="formItemBgStyle">
                                        <span style="color: #ff0000">*</span>
                                    </td>
                                    <td style="text-align: left;" class="formItemBgStyle"></td>
                                </tr>
                                <tr>
                                    <td style="height: 23px; text-align: right" class="formItemBgStyle">
                                        <asp:Label ID="Label13" runat="server" Text="<%$ Resources:lang,GongZuoFanWei%>"></asp:Label>：
                                    </td>
                                    <td colspan="3" class="auto-style1">
                                        <asp:TextBox ID="TB_WorkScope" runat="server" Width="99%"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="formItemBgStyle" style="width: 15%; text-align: right">
                                        <asp:Label ID="Label134" runat="server" Text="<%$ Resources:lang,UnitSalary%>"></asp:Label>
                                        ：</td>
                                    <td class="formItemBgStyle">
                                        <NickLee:NumberBox ID="NB_HourlySalary" runat="server" MaxAmount="1000000000000" MinAmount="-1000000000000" OnBlur="" OnFocus="" OnKeyPress="" PositiveColor="" Width="80px">0.00</NickLee:NumberBox>
                                    </td>
                                    <td class="formItemBgStyle" style="text-align: Right;" width="15%">
                                        <asp:Label ID="Label135" runat="server" Text="<%$ Resources:lang,YueXin %>"></asp:Label>
                                        ：</td>
                                    <td class="formItemBgStyle" style="text-align: left;">
                                        <NickLee:NumberBox ID="NB_MonthlySalary" runat="server" MaxAmount="1000000000000" MinAmount="-1000000000000" OnBlur="" OnFocus="" OnKeyPress="" PositiveColor="" Width="80px">0.00</NickLee:NumberBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="text-align: right" class="formItemBgStyle">
                                        <asp:Label ID="Label14" runat="server" Text="<%$ Resources:lang,YongGongLeiXing%>"></asp:Label>：</td>
                                    <td colspan="2" style="text-align: left" class="formItemBgStyle">
                                        <asp:DropDownList ID="DL_WorkType" runat="server" DataTextField="TypeName" DataValueField="TypeName">
                                        </asp:DropDownList>
                                    </td>
                                    <td style="height: 12px; text-align: left;" class="formItemBgStyle">&nbsp;</td>
                                </tr>

                                <tr>
                                    <td style="height: 12px; text-align: right;" class="formItemBgStyle">
                                        <asp:Label ID="Label16" runat="server" Text="<%$ Resources:lang,JiaRuRiQi%>"></asp:Label>：
                                    </td>
                                    <td colspan="2" style="height: 12px; text-align: left;" class="formItemBgStyle">

                                        <asp:TextBox ID="DLC_JoinDate" ReadOnly="false" runat="server"></asp:TextBox>
                                        <ajaxToolkit:CalendarExtender Format="yyyy-MM-dd" ID="CalendarExtender1"
                                            runat="server" TargetControlID="DLC_JoinDate">
                                        </ajaxToolkit:CalendarExtender>
                                    </td>
                                    <td style="height: 12px; text-align: left;" class="formItemBgStyle"></td>
                                </tr>
                                <tr>
                                    <td class="formItemBgStyle" style="text-align: right;">
                                        <asp:Label ID="Label46" runat="server" Text="<%$ Resources:lang,JieMianYuYan %>"></asp:Label>
                                        ：</td>
                                    <td class="formItemBgStyle" colspan="2" style="text-align: left;">
                                        <asp:DropDownList ID="ddlLangSwitcher" runat="server" DataValueField="LangCode" DataTextField="Language" AutoPostBack="True"></asp:DropDownList>

                                    </td>
                                    <td class="formItemBgStyle" style="height: 12px; text-align: left;">&nbsp;</td>
                                </tr>
                                <tr>
                                    <td style="text-align: right" class="formItemBgStyle">
                                        <asp:Label ID="Label15" runat="server" Text="<%$ Resources:lang,ZhuangTai%>"></asp:Label>：
                                    </td>
                                    <td colspan="2" style="text-align: left;" class="formItemBgStyle">
                                        <asp:DropDownList ID="DL_Status" runat="server">
                                            <asp:ListItem Value="在职" Text="<%$ Resources:lang,ZaiZhi%>" />
                                            <asp:ListItem Value="离职" Text="<%$ Resources:lang,LiZhi%>" />
                                            <asp:ListItem Value="终止" Text="<%$ Resources:lang,ZhongZhi%>" />
                                        </asp:DropDownList>
                                    </td>
                                    <td style="text-align: left;" class="formItemBgStyle"></td>
                                </tr>
                                <tr>
                                    <td style="text-align: right" class="formItemBgStyle"></td>
                                    <td colspan="3" style="text-align: left" class="formItemBgStyle">
                                        <span style="color: red; font-size: 8pt;">
                                            <asp:Label ID="Label23" runat="server" Text="<%$ Resources:lang,DWBTXXGSMMWKJBGBYLMM%>"></asp:Label></span>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="text-align: right" class="formItemBgStyle"></td>
                                    <td colspan="3" style="text-align: left" class="formItemBgStyle">&nbsp;</td>
                                </tr>
                                <tr>
                                    <td style="text-align: right" class="formItemBgStyle">
                                        <asp:Label ID="Label24" runat="server" Text="<%$ Resources:lang,ZhaoPianShangChuan%>"></asp:Label>：
                                    </td>
                                    <td colspan="3" style="text-align: left" class="formItemBgStyle">
                                        <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
                                            <ContentTemplate>
                                                <asp:FileUpload ID="FUP_File" runat="server" Width="300px" />
                                                <asp:Button ID="BT_UploadPhoto" runat="server" Text="<%$ Resources:lang,ShangChuan%>" OnClick="BT_UploadPhoto_Click"
                                                    CssClass="inpu" Enabled="False" />
                                                <asp:HyperLink ID="HL_MemberPhoto" runat="server" Visible="False">[HL_MemberPhoto]</asp:HyperLink>
                                            </ContentTemplate>
                                            <Triggers>
                                                <asp:PostBackTrigger ControlID="BT_UploadPhoto"></asp:PostBackTrigger>
                                            </Triggers>
                                        </asp:UpdatePanel>
                                    </td>
                                </tr>


                                <tr style="display: none;">
                                    <td class="formItemBgStyle" style="height: 12px; text-align: right;">
                                        <asp:Label ID="Label17" runat="server" Text="<%$ Resources:lang,XingZhi%>"></asp:Label>：
                                    </td>
                                    <td class="formItemBgStyle" colspan="2" style="height: 12px; text-align: left;">
                                        <asp:DropDownList ID="DL_UserType" Enabled="false" runat="server">
                                            <asp:ListItem Value="OUTER" Text="<%$ Resources:lang,WaiBu%>" />
                                            <asp:ListItem Value="INNER" Text="<%$ Resources:lang,NeiBu%>" />
                                        </asp:DropDownList>
                                    </td>
                                    <td class="formItemBgStyle" style="height: 12px; text-align: left;">&nbsp;
                                    </td>
                                </tr>
                                <tr style="display: none;">
                                    <td class="formItemBgStyle" style="height: 12px; text-align: right;">
                                        <asp:Label ID="Label18" runat="server" Text="<%$ Resources:lang,ZhuJieMianFengGe%>"></asp:Label>：</td>
                                    <td class="formItemBgStyle" colspan="2" style="height: 12px; text-align: left;">

                                        <asp:DropDownList ID="DL_SystemMDIStyle" runat="server" DataTextField="MDIStyle" DataValueField="MDIStyle">
                                        </asp:DropDownList>
                                    </td>
                                    <td class="formItemBgStyle" style="height: 12px; text-align: left;"></td>
                                </tr>
                                <tr style="display: none;">
                                    <td class="formItemBgStyle" style="height: 12px; text-align: right;">
                                        <asp:Label ID="Label19" runat="server" Text="<%$ Resources:lang,KeDengLuSheBei%>"></asp:Label>：</td>
                                    <td class="formItemBgStyle" colspan="2" style="height: 12px; text-align: left;">
                                        <asp:DropDownList ID="DL_AllowDevice" runat="server" Enabled="false">
                                            <asp:ListItem Value="ALL" Text="<%$ Resources:lang,QuanBu%>" />
                                            <asp:ListItem Value="PC" Text="<%$ Resources:lang,DianNao%>" />
                                            <asp:ListItem Value="MOBILE" Text="<%$ Resources:lang,YiDongSheBei%>" />
                                        </asp:DropDownList>
                                    </td>
                                    <td class="formItemBgStyle" style="height: 12px; text-align: left;"></td>
                                </tr>

                                <tr style="display: none;">
                                    <td class="formItemBgStyle" style="height: 12px; text-align: right;">
                                        <asp:Label ID="Label20" runat="server" Text="<%$ Resources:lang,CanKaoGongHao%>"></asp:Label>：
                                    </td>
                                    <td class="formItemBgStyle" colspan="2" style="height: 12px; text-align: left;">
                                        <asp:TextBox ID="TB_RefUserCode" runat="server" Width="220px"></asp:TextBox>
                                    </td>
                                    <td class="formItemBgStyle" style="height: 12px; text-align: left;"></td>
                                </tr>
                                <tr style="display: none;">
                                    <td class="formItemBgStyle" style="height: 12px; text-align: right;">
                                        <asp:Label ID="Label21" runat="server" Text="<%$ Resources:lang,RTXZhangHu%>"></asp:Label>：</td>
                                    <td class="formItemBgStyle" colspan="2" style="height: 12px; text-align: left;">
                                        <asp:TextBox ID="TB_UserRTXCode" runat="server" Width="220px"></asp:TextBox>
                                    </td>
                                    <td class="formItemBgStyle" style="height: 12px; text-align: left;">&nbsp;</td>
                                </tr>
                                <tr style="display: none;">
                                    <td class="formItemBgStyle" style="height: 12px; text-align: right;">
                                        <asp:Label ID="Label22" runat="server" Text="<%$ Resources:lang,ShunXuHao%>"></asp:Label>：
                                    </td>
                                    <td class="formItemBgStyle" colspan="2" style="height: 12px; text-align: left;">
                                        <NickLee:NumberBox MaxAmount="1000000000000" MinAmount="-1000000000000" ID="NB_SortNumber" runat="server" OnBlur="" OnFocus="" OnKeyPress=""
                                            PositiveColor="" Precision="0" Width="80px">0</NickLee:NumberBox>
                                    </td>
                                    <td class="formItemBgStyle" style="height: 12px; text-align: left;"></td>
                                </tr>
                            </table>

                        </div>

                        <div id="popwindow_footer" class="layui-layer-btn" style="border-top: 1px solid #ccc;">
                            <asp:LinkButton ID="BT_New" runat="server" class="layui-layer-btn notTab" OnClick="BT_New_Click" Text="<%$ Resources:lang,BaoCun%>"></asp:LinkButton><a class="layui-layer-btn notTab" onclick="return popClose();"><asp:Label ID="Label118" runat="server" Text="<%$ Resources:lang,GuanBi%>" /></a>
                        </div>
                        <span class="layui-layer-setwin"><a onclick="return popClose();" class="layui-layer-ico layui-layer-close layui-layer-close1 notTab" href="javascript:;"></a></span>
                    </div>

                    <div class="layui-layer-shade" id="popwindow_shade" style="z-index: 9998; background-color: #000; opacity: 0.3; filter: alpha(opacity=30); display: none;"></div>


                    <asp:Panel ID="Panel3" runat="server" CssClass="modalPopup" Style="display: none;">
                        <div class="modalPopup-text" style="width: 273px; height: 400px; overflow: auto;">
                            <table>
                                <tr>
                                    <td style="width: 220px; padding: 5px 5px 5px 5px;" valign="top" align="left">
                                        <asp:TreeView ID="TreeView3" runat="server" NodeWrap="True" OnSelectedNodeChanged="TreeView3_SelectedNodeChanged"
                                            ShowLines="True" Width="99%">
                                            <RootNodeStyle CssClass="rootNode" />
                                            <NodeStyle CssClass="treeNode" />
                                            <LeafNodeStyle CssClass="leafNode" />
                                            <SelectedNodeStyle CssClass="selectNode" ForeColor ="Red" />
                                        </asp:TreeView>
                                    </td>
                                    <td style="width: 60px; padding: 5px 5px 5px 5px;" valign="top" align="center">
                                        <asp:ImageButton ID="IMB_CloseDepartment" ImageUrl="ImagesSkin/Close4.jpg" runat="server" />
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </asp:Panel>

                    <asp:Panel ID="Panel1" runat="server" CssClass="modalPopup" Style="display: none; width: 710px; height: 320px;">
                        <table class="formBgStyle" style="width: 650px; text-align: left; visibility: hidden;"
                            class="formBgStyle" cellpadding="3" cellspacing="0">
                            <tr>
                                <td style="width: 15%; text-align: right" class="formItemBgStyle">
                                    <asp:Label ID="Label25" runat="server" Text="<%$ Resources:lang,YingWenMing%>"></asp:Label>：
                                </td>
                                <td class="formItemBgStyle">
                                    <asp:TextBox ID="TB_EnglishName" Width="220px" runat="server"></asp:TextBox>
                                </td>
                                <td style="text-align: Right;" width="15%" class="formItemBgStyle">
                                    <asp:Label ID="Label26" runat="server" Text="<%$ Resources:lang,MinZu%>"></asp:Label>：
                                </td>
                                <td style="text-align: left;" class="formItemBgStyle">
                                    <asp:TextBox ID="TB_Nationality" Width="220px" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 100px; text-align: right" class="formItemBgStyle">
                                    <asp:Label ID="Label27" runat="server" Text="<%$ Resources:lang,ChuShengDi%>"></asp:Label>：
                                </td>
                                <td class="formItemBgStyle">
                                    <asp:TextBox ID="TB_NativePlace" Width="220px" runat="server"></asp:TextBox>
                                </td>
                                <td style="text-align: Right;" width="130px" class="formItemBgStyle">
                                    <asp:Label ID="Label28" runat="server" Text="<%$ Resources:lang,HuKouSuoZaiDi%>"></asp:Label>：
                                </td>
                                <td style="text-align: left;" width="130px" class="formItemBgStyle">
                                    <asp:TextBox ID="TB_HuKou" Width="220px" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 100px; text-align: right" class="formItemBgStyle">
                                    <asp:Label ID="Label29" runat="server" Text="<%$ Resources:lang,JuZhuDi%>"></asp:Label>：
                                </td>
                                <td class="formItemBgStyle">
                                    <asp:TextBox ID="TB_Residency" Width="220px" runat="server"></asp:TextBox>
                                </td>
                                <td style="text-align: Right;" width="130px" class="formItemBgStyle"></td>
                                <td style="text-align: left;" width="130px" class="formItemBgStyle"></td>
                            </tr>
                            <tr>
                                <td style="width: 100px; text-align: right" class="formItemBgStyle">
                                    <asp:Label ID="Label30" runat="server" Text="<%$ Resources:lang,DiZhi%>"></asp:Label>：
                                </td>
                                <td colspan="3" class="formItemBgStyle">
                                    <asp:TextBox ID="TB_Address" runat="server" Width="492px"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 100px; text-align: right" class="formItemBgStyle">
                                    <asp:Label ID="Label31" runat="server" Text="<%$ Resources:lang,ShengRi%>"></asp:Label>：
                                </td>
                                <td class="formItemBgStyle">

                                    <asp:TextBox ID="DLC_BirthDay" ReadOnly="false" runat="server"></asp:TextBox>
                                    <ajaxToolkit:CalendarExtender Format="yyyy-MM-dd" ID="CalendarExtender2"
                                        runat="server" TargetControlID="DLC_BirthDay">
                                    </ajaxToolkit:CalendarExtender>

                                </td>
                                <td style="text-align: Right;" width="130px" class="formItemBgStyle">
                                    <asp:Label ID="Label32" runat="server" Text="<%$ Resources:lang,HunYinZhuangTai%>"></asp:Label>：
                                </td>
                                <td style="text-align: left;" width="130px" class="formItemBgStyle">
                                    <asp:DropDownList ID="DL_MaritalStatus" runat="server">
                                        <asp:ListItem Value="未婚" Text="<%$ Resources:lang,WeiHun%>" />
                                        <asp:ListItem Value="已婚" Text="<%$ Resources:lang,YiHun%>" />
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 100px; text-align: right" class="formItemBgStyle">
                                    <asp:Label ID="Label33" runat="server" Text="<%$ Resources:lang,XueLi%>"></asp:Label>：
                                </td>
                                <td class="formItemBgStyle">
                                    <asp:TextBox ID="TB_Degree" Width="220px" runat="server"></asp:TextBox>
                                </td>
                                <td style="text-align: Right;" width="130px" class="formItemBgStyle">
                                    <asp:Label ID="Label34" runat="server" Text="<%$ Resources:lang,ZhuanYe%>"></asp:Label>：
                                </td>
                                <td style="text-align: left;" width="130px" class="formItemBgStyle">
                                    <asp:TextBox ID="TB_Major" Width="220px" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 100px; text-align: right" class="formItemBgStyle">
                                    <asp:Label ID="Label35" runat="server" Text="<%$ Resources:lang,BiYeXueXiao%>"></asp:Label>：
                                </td>
                                <td colspan="3" class="formItemBgStyle">
                                    <asp:TextBox ID="TB_GraduateSchool" runat="server" Width="492px"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 100px; text-align: right" class="formItemBgStyle">
                                    <asp:Label ID="Label36" runat="server" Text="<%$ Resources:lang,ShenFenZhengHao%>"></asp:Label>：
                                </td>
                                <td class="formItemBgStyle">
                                    <asp:TextBox ID="TB_IDCard" Width="220px" runat="server"></asp:TextBox>
                                </td>
                                <td style="text-align: Right;" width="130px" class="formItemBgStyle">
                                    <asp:Label ID="Label37" runat="server" Text="<%$ Resources:lang,XueXing%>"></asp:Label>：
                                </td>
                                <td style="text-align: left;" width="130px" class="formItemBgStyle">
                                    <asp:TextBox ID="TB_BloodType" Width="220px" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 100px; text-align: right" class="formItemBgStyle">
                                    <asp:Label ID="Label39" runat="server" Text="<%$ Resources:lang,ShenGao%>"></asp:Label>：
                                </td>
                                <td class="formItemBgStyle">
                                    <NickLee:NumberBox ID="NB_Height" runat="server" Width="40px" OnBlur="" OnFocus=""
                                        OnKeyPress="" PositiveColor="" MinAmount="0" Precision="0">0</NickLee:NumberBox>
                                </td>
                                <td style="text-align: Right;" width="130px" class="formItemBgStyle">
                                    <asp:Label ID="Label38" runat="server" Text="<%$ Resources:lang,YuYan%>"></asp:Label>：
                                </td>
                                <td style="text-align: left;" width="130px" class="formItemBgStyle"></td>
                            </tr>
                            <tr>
                                <td style="width: 100px; text-align: right" class="formItemBgStyle">
                                    <asp:Label ID="Label40" runat="server" Text="<%$ Resources:lang,JinJiLianXiRen%>"></asp:Label>：
                                </td>
                                <td class="formItemBgStyle">
                                    <asp:TextBox ID="TB_UrgencyPerson" Width="220px" runat="server"></asp:TextBox>
                                </td>
                                <td style="text-align: Right;" width="130px" class="formItemBgStyle">
                                    <asp:Label ID="Label41" runat="server" Text="<%$ Resources:lang,LianXiDianHua%>"></asp:Label>：
                                </td>
                                <td style="text-align: left;" width="130px" class="formItemBgStyle">
                                    <asp:TextBox ID="TB_UrgencyCall" Width="220px" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 100px; text-align: right" class="formItemBgStyle">
                                    <asp:Label ID="Label42" runat="server" Text="<%$ Resources:lang,JieShaoRen%>"></asp:Label>：
                                </td>
                                <td class="formItemBgStyle">
                                    <asp:TextBox ID="TB_Introducer" Width="220px" runat="server"></asp:TextBox>
                                </td>
                                <td style="text-align: Right;" width="130px" class="formItemBgStyle">
                                    <asp:Label ID="Label43" runat="server" Text="<%$ Resources:lang,JieShaoRenBuMen%>"></asp:Label>：
                                </td>
                                <td style="text-align: left;" width="130px" class="formItemBgStyle">
                                    <asp:TextBox ID="TB_IntroducerDepartment" Width="220px" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 100px; text-align: right" class="formItemBgStyle">
                                    <asp:Label ID="Label44" runat="server" Text="<%$ Resources:lang,YuJieShaoRenGuanXi%>"></asp:Label>：
                                </td>
                                <td class="formItemBgStyle">
                                    <asp:TextBox ID="TB_IntroducerRelation" Width="220px" runat="server"></asp:TextBox>
                                </td>
                                <td style="text-align: Right;" width="130px" class="formItemBgStyle"></td>
                                <td style="text-align: left;" width="130px" class="formItemBgStyle"></td>
                            </tr>
                            <tr>
                                <td style="width: 100px; text-align: right" class="formItemBgStyle">
                                    <asp:Label ID="Label45" runat="server" Text="<%$ Resources:lang,BeiZhu%>"></asp:Label>：
                                </td>
                                <td colspan="3" class="formItemBgStyle">
                                    <asp:TextBox ID="TB_Comment" runat="server" Height="100px" TextMode="MultiLine" Width="500px"></asp:TextBox>
                                </td>
                            </tr>
                        </table>
                    </asp:Panel>

                    <br />
                    <br />
                    <asp:TextBox ID="TB_PhotoString1" runat="server" Style="visibility: hidden"></asp:TextBox>
                    <asp:TextBox ID="TB_PhotoString2" runat="server" Style="visibility: hidden"></asp:TextBox>
                    <asp:TextBox ID="TB_PhotoString3" runat="server" Style="visibility: hidden"></asp:TextBox>
                    <asp:Label ID="LB_DepartCode" runat="server" Visible="False"></asp:Label>
                    <asp:TextBox ID="TB_PhotoString4" runat="server" Style="visibility: hidden"></asp:TextBox>
                    <asp:Button ID="BT_SavePhoto" runat="server" CssClass="inpuLong" OnClick="BT_SavePhoto_Click"
                        Style="visibility: hidden" />
                    <asp:Label ID="LB_DepartString" runat="server" Visible="false"></asp:Label>
                    <asp:Label ID="LB_NewUserCode" runat="server" Visible="False"></asp:Label>
                    <asp:Label ID="LB_Sql2" runat="server" Visible="False"></asp:Label>

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
<script type="text/javascript" language="javascript">var cssDirectory = '<%=Session["CssDirectory"] %>'; var oLink = document.getElementById('mainCss'); oLink.href = 'css/' + cssDirectory + '/' + 'bluelightmain.css';</script></html>
