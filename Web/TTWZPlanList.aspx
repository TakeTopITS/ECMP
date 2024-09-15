<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTWZPlanList.aspx.cs" Inherits="TTWZPlanList" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>领料计划列表</title>
    <link id="mainCss" href="css/bluelightmain.css" rel="stylesheet" type="text/css" />
    <script src="js/jquery-1.7.2.min.js"></script>
    <script src="js/allAHandler.js"></script>
    <script language="javascript">

        $(function () { 

           

            //ControlStatusCloseChange();

        });




        function ControlStatusChange(objProgress, objPlanMarker, objUserCode, objIsMark) {

            $("#BT_NewPlanBrowse").attr("class", "inpu");
            $("#BT_NewPlanBrowse").removeAttr("disabled");
            $("#BT_NewDetailBrowse").attr("class", "inpu");
            $("#BT_NewDetailBrowse").removeAttr("disabled");

            if (objProgress == "录入") {
                $("#BT_NewEdit").attr("class", "inpu");
                $("#BT_NewEdit").removeAttr("disabled");                            //编辑
                $("#BT_NewPlanSubmit").attr("class", "inpu");
                $("#BT_NewPlanSubmit").removeAttr("disabled");                          //计划提交
                $("#BT_NewSubmitReturn").attr("disabled", "disabled");
                $("#BT_NewSubmitReturn").removeClass("inpu");                            //提交退回
            }
            else if (objProgress == "提报") {
                $("#BT_NewEdit").attr("disabled", "disabled");
                $("#BT_NewEdit").removeClass("inpu");                            //编辑
                $("#BT_NewPlanSubmit").attr("disabled", "disabled");
                $("#BT_NewPlanSubmit").removeClass("inpu");                          //计划提交
                $("#BT_NewSubmitReturn").attr("class", "inpu");
                $("#BT_NewSubmitReturn").removeAttr("disabled");                            //提交退回
            }
            else {
                $("#BT_NewEdit").attr("disabled", "disabled");
                $("#BT_NewEdit").removeClass("inpu");                            //编辑
                $("#BT_NewPlanSubmit").attr("disabled", "disabled");
                $("#BT_NewPlanSubmit").removeClass("inpu");                          //计划提交
                $("#BT_NewSubmitReturn").attr("disabled", "disabled");
                $("#BT_NewSubmitReturn").removeClass("inpu");                         //提交退回
            }

            if (objProgress == "录入" && objPlanMarker == objUserCode && objIsMark == "0") {
                $("#BT_NewDelete").attr("class", "inpu");
                $("#BT_NewDelete").removeAttr("disabled");                      //删除
            }
            else {
                $("#BT_NewDelete").attr("disabled", "disabled");
                $("#BT_NewDelete").removeClass("inpu");                      //删除
            }

            if (objProgress == "录入" && objPlanMarker == objUserCode) {
                $("#BT_NewDetail").attr("class", "inpu");
                $("#BT_NewDetail").removeAttr("disabled");                      //明细
            }
            else {
                $("#BT_NewDetail").attr("disabled", "disabled");
                $("#BT_NewDetail").removeClass("inpu");                      //明细
            }
        }



        function ControlStatusCloseChange() {
            $("#BT_NewEdit").attr("disabled", "disabled");
            $("#BT_NewEdit").removeClass("inpu");
            $("#BT_NewDelete").attr("disabled", "disabled");
            $("#BT_NewDelete").removeClass("inpu");
            $("#BT_NewDetail").attr("disabled", "disabled");
            $("#BT_NewDetail").removeClass("inpu");
            $("#BT_NewPlanSubmit").attr("disabled", "disabled");
            $("#BT_NewPlanSubmit").removeClass("inpu");
            $("#BT_NewSubmitReturn").attr("disabled", "disabled");
            $("#BT_NewSubmitReturn").removeClass("inpu");
            $("#BT_NewPlanBrowse").attr("disabled", "disabled");
            $("#BT_NewPlanBrowse").removeClass("inpu");
            $("#BT_NewDetailBrowse").attr("disabled", "disabled");
            $("#BT_NewDetailBrowse").removeClass("inpu");
        }

        function LoadProjectList() {
            document.getElementById("BT_RelaceLoad").click();
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
                                                            <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,LingLiaoJiHuaBianZhi%>"></asp:Label>
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
                                                            <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,JinDu%>"></asp:Label>：<asp:DropDownList ID="DDL_Progress" runat="server" AutoPostBack="true" OnSelectedIndexChanged="DDL_Progress_SelectedIndexChanged">
                                                                <asp:ListItem Text="<%$ Resources:lang,QuanBu%>" Value=""/>
                                                                <asp:ListItem Text="<%$ Resources:lang,LuRu%>" Value="录入"/>
                                                                <asp:ListItem Text="<%$ Resources:lang,TiBao%>" Value="提报"/>
                                                                <asp:ListItem Text="<%$ Resources:lang,ShenHe%>" Value="审核"/>
                                                                <asp:ListItem Text="<%$ Resources:lang,QianShou%>" Value="签收"/>
                                                                <asp:ListItem Text="<%$ Resources:lang,HeXiao%>" Value="核消"/>
                                                            </asp:DropDownList>&nbsp;
                                                            <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,XiangMuBianMa%>"></asp:Label>：<asp:TextBox ID="TXT_ProjectCode" runat="server"></asp:TextBox>&nbsp;
                                                            <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,JiHuaMingCheng%>"></asp:Label>：<asp:TextBox ID="TXT_PlanName" runat="server"></asp:TextBox>&nbsp;
                                                            <asp:Button ID="BT_Search" runat="server" CssClass="inpu" OnClick="BT_Search_Click" Text="<%$ Resources:lang,ChaXun%>" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="left" class="formItemBgStyle">
                                                            <asp:Button ID="BT_Add" runat="server" CssClass="inpuLong" OnClick="BT_Add_Click" Text="<%$ Resources:lang,XinZengLingLiaoJiHua%>" />&nbsp;&nbsp;&nbsp;&nbsp;
                                                            <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,LieBiaoPaiXu%>"></asp:Label>：<asp:Button ID="BT_SortPlanCode" runat="server" CssClass="inpu" OnClick="BT_SortPlanCode_Click" Text="<%$ Resources:lang,JiHuaBianHao%>" />&nbsp;
                                                            <asp:Button ID="BT_SortPlanName" runat="server" CssClass="inpu" OnClick="BT_SortPlanName_Click" Text="<%$ Resources:lang,JiHuaMingCheng%>" />&nbsp;
                                                            <asp:Button ID="BT_SortProjectCode" runat="server" CssClass="inpu" OnClick="BT_SortProjectCode_Click" Text="<%$ Resources:lang,XiangMuBianMa%>" />
                                                            <asp:HiddenField ID="HF_SortPlanCode" runat="server" />
                                                            <asp:HiddenField ID="HF_SortPlanName" runat="server" />
                                                            <asp:HiddenField ID="HF_SortProjectCode" runat="server" />

                                                            <asp:Button ID="BT_RelaceLoad" runat="server" Text="<%$ Resources:lang,ChongXinJiaZaiLieBiao%>" OnClick="BT_RelaceLoad_Click" CssClass="inpu" style="display:none;" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="left" class="formItemBgStyle">
                                                            <input type="button" class="inpuLong" value="新增领料计划" onclick="window.location.href = 'TTWZPlanEdit.aspx'" style="display:none;" />&nbsp;
                                                            <asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,LingLiaoJiHuaJiLu%>"></asp:Label>&nbsp;<asp:Label ID="Label8" runat="server" Text="<%$ Resources:lang,Gong%>"></asp:Label><asp:Label ID="LB_ShowRecordCount" runat="server" Text="**"></asp:Label><asp:Label ID="Label9" runat="server" Text="<%$ Resources:lang,Tiao%>"></asp:Label>&nbsp;&nbsp;
                                                            <asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,JiLuCaoZuo%>"></asp:Label>：
                                                            <asp:Button ID="BT_NewEdit" runat="server" Text="<%$ Resources:lang,BianJi%>" CssClass="inpu" OnClick="BT_NewEdit_Click" />&nbsp;
                                                            <asp:Button ID="BT_NewDelete" runat="server" Text="<%$ Resources:lang,ShanChu%>" CssClass="inpu" OnClick="BT_NewDelete_Click" OnClientClick="return confirm(getDeleteMsgByLangCode())"/>&nbsp;
                                                            <asp:Button ID="BT_NewDetail" runat="server" Text="<%$ Resources:lang,BianZhiMingXi%>" CssClass="inpu" OnClick="BT_NewDetail_Click" />&nbsp;
                                                            <asp:Button ID="BT_NewPlanSubmit" runat="server" Text="<%$ Resources:lang,JiHuaTiJiao%>" CssClass="inpu" OnClick="BT_NewPlanSubmit_Click" />&nbsp;
                                                            <asp:Button ID="BT_NewSubmitReturn" runat="server" Text="<%$ Resources:lang,TiJiaoTuiHui%>" CssClass="inpu" OnClick="BT_NewSubmitReturn_Click" />&nbsp;
                                                            <asp:Button ID="BT_NewPlanBrowse" runat="server" Text="<%$ Resources:lang,JiHuaLiuLan%>" CssClass="inpu" OnClick="BT_NewPlanBrowse_Click" />&nbsp;
                                                            <asp:Button ID="BT_NewDetailBrowse" runat="server" Text="<%$ Resources:lang,MingXiLiuLan%>" CssClass="inpu" OnClick="BT_NewDetailBrowse_Click" />
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
                                                                                            <asp:Label ID="Label10" runat="server" Text="<%$ Resources:lang,CaoZuo%>"></asp:Label></strong>
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
                                                                                            <asp:Label ID="Label13" runat="server" Text="<%$ Resources:lang,JiHuaMingCheng%>"></asp:Label></strong>
                                                                                    </td>
                                                                                    <td width="4%" align="center">
                                                                                        <strong>
                                                                                            <asp:Label ID="Label14" runat="server" Text="<%$ Resources:lang,XiangMuBianMa%>"></asp:Label></strong>
                                                                                    </td>
                                                                                    <td width="4%" align="center">
                                                                                        <strong>
                                                                                            <asp:Label ID="Label15" runat="server" Text="<%$ Resources:lang,KuBie%>"></asp:Label></strong>
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
                                                                                            <asp:Label ID="Label23" runat="server" Text="<%$ Resources:lang,TiJiaoRiQi%>"></asp:Label></strong>
                                                                                    </td>
                                                                                    <td width="4%" align="center">
                                                                                        <strong>
                                                                                            <asp:Label ID="Label24" runat="server" Text="<%$ Resources:lang,FeiKongZhuGuan%>"></asp:Label></strong>
                                                                                    </td>
                                                                                    <td width="4%" align="center">
                                                                                        <strong>
                                                                                            <asp:Label ID="Label25" runat="server" Text="<%$ Resources:lang,ShenHeRiQi%>"></asp:Label></strong>
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
                                                                                            <asp:Label ID="Label30" runat="server" Text="<%$ Resources:lang,JinDu%>"></asp:Label></strong>
                                                                                    </td>
                                                                                    <td width="4%" align="center">
                                                                                        <strong>
                                                                                            <asp:Label ID="Label31" runat="server" Text="<%$ Resources:lang,ShiYongBiaoJi%>"></asp:Label></strong>
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
                                                                                <asp:Label ID="Label42" runat="server" Text="<%$ Resources:lang,CaoZuo%>"></asp:Label>
                                                                            </HeaderTemplate>
                                                                            <ItemTemplate>

                                                                                <asp:LinkButton ID="LinkButton6" runat="server" CommandArgument='<%# DataBinder.Eval(Container.DataItem,"PlanCode") %>' CommandName="click" CssClass="notTab" >
                                                                                    <asp:Label ID="Label41" runat="server" Text="<%$ Resources:lang,CaoZuo%>"></asp:Label></asp:LinkButton>
                                                                                <%--<asp:LinkButton ID="LinkButton1" runat="server" CommandArgument='<%# DataBinder.Eval(Container.DataItem,"PlanCode") %>' CommandName="submit" CssClass="notTab" Visible='<%# Eval("Progress").ToString()=="录入" ? true : false %>'>计划提交</asp:LinkButton>--%>
                                                                                <%--<asp:LinkButton ID="LinkButton2" runat="server" CommandArgument='<%# DataBinder.Eval(Container.DataItem,"PlanCode") %>' CommandName="submitReturn" CssClass="notTab" Visible='<%# Eval("Progress").ToString()=="提报" ? true : false %>'>提交退回</asp:LinkButton>--%>
                                                                                <%--<asp:LinkButton ID="LinkButton3" runat="server" CommandArgument='<%# DataBinder.Eval(Container.DataItem,"PlanCode") %>' CommandName="del" CssClass="notTab" Visible='<%# (Eval("Progress").ToString()=="录入" && Eval("PlanMarker").ToString()==strUserCode && Eval("IsMark").ToString()=="0") ? true : false %>'>删除</asp:LinkButton>--%>
                                                                                <%--<asp:LinkButton ID="LinkButton4" runat="server" CommandArgument='<%# DataBinder.Eval(Container.DataItem,"PlanCode") %>' CommandName="edit" CssClass="notTab" Visible='<%# Eval("Progress").ToString()=="录入" ? true : false %>'>编辑</asp:LinkButton>--%>
                                                                                <%--<asp:LinkButton ID="LinkButton5" runat="server" CommandArgument='<%# DataBinder.Eval(Container.DataItem,"PlanCode") %>' CommandName="detail" CssClass="notTab" Visible='<%# (Eval("Progress").ToString()=="录入" && Eval("PlanMarker").ToString()==strUserCode) ? true : false %>'>明细</asp:LinkButton>--%>
                                                                                
                                                                            </ItemTemplate>
                                                                        </asp:TemplateColumn>
                                                                        <asp:BoundColumn DataField="PlanCode" HeaderText="计划编号">
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="4%" />
                                                                        </asp:BoundColumn>
                                                                        <asp:TemplateColumn>
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="4%" />
                                                                            <HeaderTemplate>
                                                                                <asp:Label ID="Label32" runat="server" Text="<%$ Resources:lang,ZiBianHao%>"></asp:Label>
                                                                            </HeaderTemplate>
                                                                            <ItemTemplate>
                                                                                <%# ShareClass.StringCutByRequire(Eval("SinceNumber").ToString(), 190) %>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateColumn>
                                                                        <asp:TemplateColumn>
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="7%" />
                                                                            <HeaderTemplate>
                                                                                <asp:Label ID="Label33" runat="server" Text="<%$ Resources:lang,jiHuaMingCheng%>"></asp:Label>
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
                                                                                <asp:Label ID="Label34" runat="server" Text="<%$ Resources:lang,LingLiaoDanWei%>"></asp:Label>
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
                                                                                <asp:Label ID="Label35" runat="server" Text="<%$ Resources:lang,BianZhiRiQi%>"></asp:Label>
                                                                            </HeaderTemplate>
                                                                            <ItemTemplate>
                                                                                <%#DataBinder.Eval(Container.DataItem, "MarkerTime", "{0:yyyy-MM-dd}")%>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateColumn>
                                                                        <asp:TemplateColumn>
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="4%" />
                                                                            <HeaderTemplate>
                                                                                <asp:Label ID="Label36" runat="server" Text="<%$ Resources:lang,TiJiaoRiQi%>"></asp:Label>
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
                                                                                <asp:Label ID="Label37" runat="server" Text="<%$ Resources:lang,ShenHeRiQi%>"></asp:Label>
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
                                                                                <asp:Label ID="Label38" runat="server" Text="<%$ Resources:lang,QianShouRiQi%>"></asp:Label>
                                                                            </HeaderTemplate>
                                                                            <ItemTemplate>
                                                                                <%# ShareClass.StringCutByRequire(Eval("SignTime").ToString(),10) %>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateColumn>
                                                                        <asp:TemplateColumn>
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="4%" />
                                                                            <HeaderTemplate>
                                                                                <asp:Label ID="Label39" runat="server" Text="<%$ Resources:lang,TuiHuiLiYou%>"></asp:Label>
                                                                            </HeaderTemplate>
                                                                            <ItemTemplate>
                                                                                <%# ShareClass.StringCutByRequire(Eval("ReturnReason").ToString(), 190) %>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateColumn>
                                                                        <asp:TemplateColumn>
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="4%" />
                                                                            <HeaderTemplate>
                                                                                <asp:Label ID="Label40" runat="server" Text="<%$ Resources:lang,HeXiaoRiQi%>"></asp:Label>
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
                                                            </div>
                                                            <asp:Label ID="LB_PlanSQL" runat="server" Visible="False"></asp:Label>
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
                <asp:HiddenField ID="HF_PlanCode" runat="server" />
                <asp:HiddenField ID="HF_Progress" runat="server" />
                <asp:HiddenField ID="HF_PlanMarker" runat="server" />
                <asp:HiddenField ID="HF_IsMark" runat="server" />
            </ContentTemplate>
        </asp:UpdatePanel>
    </form>
</body>
<script type="text/javascript" language="javascript">var cssDirectory = '<%=Session["CssDirectory"] %>'; var oLink = document.getElementById('mainCss'); oLink.href = 'css/' + cssDirectory + '/' + 'bluelightmain.css';</script></html>
