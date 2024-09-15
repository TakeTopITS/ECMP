<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTWZObjectCodeList.aspx.cs" Inherits="TTWZObjectCodeList" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>物资代码</title>
    <link id="mainCss" href="css/bluelightmain.css" rel="stylesheet" type="text/css" />
    <script src="js/jquery-1.7.2.min.js"></script>
    <script src="js/allAHandler.js"></script>
    <script src="js/dialog/lhgdialog.min.js"></script>
    <script language="javascript">
        $(function () {



            //ControlStatusCloseChange();

        });

        //编辑物资代码
        function AlertObjectPage(url) {

            popShowByURLForFixedSize(url, '', 1200, 500);

        }




        function LoadObjectList() {
            //alert("11");
            document.getElementById("BT_RelaceLoad").click();
        }




        function ControlStatusChange(objCreater, objUserCode, objIsMark) {

            $("#BT_NewEdit").attr("class", "inpu");
            $("#BT_NewEdit").removeAttr("disabled");
            $("#BT_NewTitle").attr("class", "inpu");
            $("#BT_NewTitle").removeAttr("disabled");
            $("#BT_NewReplace").attr("class", "inpu");
            $("#BT_NewReplace").removeAttr("disabled");
            $("#BT_NewBrowse").attr("class", "inpu");
            $("#BT_NewBrowse").removeAttr("disabled");

            if (objCreater == objUserCode && objIsMark == 0) {
                $("#BT_NewDelete").attr("class", "inpu");
                $("#BT_NewDelete").removeAttr("disabled");                            //删除
            }
            else {
                $("#BT_NewDelete").attr("disabled", "disabled");
                $("#BT_NewDelete").removeClass("inpu");                            //删除
            }
        }



        function ControlStatusCloseChange() {
            $("#BT_NewEdit").attr("disabled", "disabled");
            $("#BT_NewEdit").removeClass("inpu");
            $("#BT_NewDelete").attr("disabled", "disabled");
            $("#BT_NewDelete").removeClass("inpu");
            $("#BT_NewTitle").attr("disabled", "disabled");
            $("#BT_NewTitle").removeClass("inpu");
            $("#BT_NewReplace").attr("disabled", "disabled");
            $("#BT_NewReplace").removeClass("inpu");
            $("#BT_NewBrowse").attr("disabled", "disabled");
            $("#BT_NewBrowse").removeClass("inpu");
        }




        function ClickReplaceCode(obj) {
            $.dialog({
                lock: true,
                content: "新的物资代码：<input type='text' id='txt_ReplaceNewObjectCode' />",
                ok: function () {
                    //alert($("#txtReason").val());
                    //alert(obj);

                    $("#HF_ReplaceObjectCode").val(obj);
                    $("#HF_ReplaceNewObjectCode").val($("#txt_ReplaceNewObjectCode").val());
                    document.getElementById("BT_ReplaceOjbectCode").click();
                },
                cancel: true
            });
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
                                                            <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,WuZiDaiMa%>"></asp:Label>
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
                                                <table style="width: 1800px;" cellpadding="2" cellspacing="0" class="formBgStyle">
                                                    <tr>

                                                        <td class="formItemBgStyle" style="width: 1500px;" colspan="2">
                                                            <div style="width: 1500px;">
                                                                <table class="formBgStyle" width="60%">
                                                                    <tr style="display: none;">
                                                                        <td style="text-align: left" class="formItemBgStyle">
                                                                            <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,WuZiDaiMa%>"></asp:Label>：</td>
                                                                        <td style="text-align: left" class="formItemBgStyle">
                                                                            <asp:TextBox ID="TXT_ObjectCode" runat="server" ReadOnly="true" ForeColor="Red"></asp:TextBox><font color="red">*<asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,ZiDongShengCheng%>"></asp:Label></font>
                                                                        </td>
                                                                        <td style="text-align: left" class="formItemBgStyle">
                                                                            <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,WuZiMingCheng%>"></asp:Label>：</td>
                                                                        <td style="text-align: left" class="formItemBgStyle">
                                                                            <asp:TextBox ID="TXT_ObjectName" runat="server"></asp:TextBox>
                                                                        </td>
                                                                        <td style="text-align: left" class="formItemBgStyle">
                                                                            <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,BiaoZhun%>"></asp:Label>：</td>
                                                                        <td style="text-align: left" class="formItemBgStyle">
                                                                            <asp:TextBox ID="TXT_Standard" runat="server"></asp:TextBox>
                                                                        </td>
                                                                    </tr>
                                                                    <tr style="display: none;">
                                                                        <td style="text-align: left" class="formItemBgStyle">
                                                                            <asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,JiBie%>"></asp:Label>：</td>
                                                                        <td style="text-align: left" class="formItemBgStyle">
                                                                            <asp:TextBox ID="TXT_Level" runat="server"></asp:TextBox>
                                                                        </td>
                                                                        <td style="text-align: left" class="formItemBgStyle">
                                                                            <asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,GuiGeXingHao%>"></asp:Label>：</td>
                                                                        <td style="text-align: left" class="formItemBgStyle">
                                                                            <asp:TextBox ID="TXT_Model" runat="server"></asp:TextBox>
                                                                        </td>
                                                                        <td style="text-align: left" class="formItemBgStyle">
                                                                            <asp:Label ID="Label8" runat="server" Text="<%$ Resources:lang,JiLiangDanWei%>"></asp:Label>：</td>
                                                                        <td style="text-align: left" class="formItemBgStyle">
                                                                            <asp:DropDownList ID="DDL_Unit" DataTextField="UnitName" DataValueField="ID" runat="server"></asp:DropDownList>
                                                                        </td>
                                                                    </tr>
                                                                    <tr style="display: none;">
                                                                        <td style="text-align: left" class="formItemBgStyle">
                                                                            <asp:Label ID="Label9" runat="server" Text="<%$ Resources:lang,HuanSuanDanWei%>"></asp:Label>：</td>
                                                                        <td style="text-align: left" class="formItemBgStyle">
                                                                            <asp:DropDownList ID="DDL_ConvertUnit" DataTextField="UnitName" DataValueField="ID" runat="server"></asp:DropDownList>
                                                                        </td>
                                                                        <td style="text-align: left" class="formItemBgStyle">
                                                                            <asp:Label ID="Label10" runat="server" Text="<%$ Resources:lang,HuanSuanXiShu%>"></asp:Label>：</td>
                                                                        <td style="text-align: left" class="formItemBgStyle">
                                                                            <asp:TextBox ID="TXT_ConvertRatio" runat="server"></asp:TextBox>
                                                                        </td>
                                                                        <td style="text-align: left" class="formItemBgStyle"><span style="display: none;">
                                                                            <asp:Label ID="Label11" runat="server" Text="<%$ Resources:lang,DuiZhaoMiaoShu%>"></asp:Label>：</span>&nbsp;</td>
                                                                        <td style="text-align: left" class="formItemBgStyle">
                                                                            <span style="display: none;">
                                                                                <asp:TextBox ID="TXT_ReferDesc" runat="server"></asp:TextBox></span>&nbsp;
                                                                        </td>
                                                                    </tr>
                                                                    <tr style="display: none;">
                                                                        <td style="text-align: left" class="formItemBgStyle"><span style="display: none;">
                                                                            <asp:Label ID="Label12" runat="server" Text="<%$ Resources:lang,DuiZhaoBiaoZhun%>"></asp:Label>：</span>&nbsp;</td>
                                                                        <td style="text-align: left" class="formItemBgStyle">
                                                                            <span style="display: none;">
                                                                                <asp:TextBox ID="TXT_ReferStandard" runat="server"></asp:TextBox></span>&nbsp;
                                                                        </td>
                                                                        <td style="text-align: left" class="formItemBgStyle"><span style="display: none;">
                                                                            <asp:Label ID="Label13" runat="server" Text="<%$ Resources:lang,ShiChangHangQing%>"></asp:Label>：</span>&nbsp;</td>
                                                                        <td style="text-align: left" class="formItemBgStyle" colspan="3">
                                                                            <span style="display: none;">
                                                                                <asp:TextBox ID="TXT_Market" runat="server"></asp:TextBox></span>&nbsp;
                                                                        </td>
                                                                    </tr>
                                                                    <tr style="display: none;">

                                                                        <td style="text-align: center" class="formItemBgStyle" colspan="6">
                                                                            <asp:Button ID="btnSave" runat="server" Text="<%$ Resources:lang,BaoCun%>" OnClick="btnSave_Click" CssClass="inpu" Visible="false" />&nbsp;
                                                                            <asp:Button ID="btnReset" runat="server" Text="<%$ Resources:lang,QuXiao%>" OnClick="btnReset_Click" CssClass="inpu" Visible="false" />&nbsp;
                                                                            <%--<input type="button" class="inpu" value="创建代码" onclick="AlertObjectPage('');" />--%>


                                                                            <asp:Button ID="BT_Title" runat="server" Text="<%$ Resources:lang,ChongZuoBiaoJi%>" OnClick="BT_Title_Click" CssClass="inpu" />&nbsp;
                                                                            <asp:Button ID="BT_Replace" runat="server" Text="<%$ Resources:lang,TiHuanWuZiDaiMa%>" OnClick="BT_Replace_Click" CssClass="inpuLong" />&nbsp;
                                                                            <asp:TextBox ID="TXT_Replace" runat="server"></asp:TextBox>

                                                                            <asp:Button ID="BT_RelaceLoad" runat="server" Text="<%$ Resources:lang,ChongXinJiaZaiLieBiao%>" OnClick="BT_RelaceLoad_Click" CssClass="inpu" Style="display: none;" />&nbsp;
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td class="formItemBgStyle" colspan="6">
                                                                            <asp:Label ID="Label14" runat="server" Text="<%$ Resources:lang,JiLuCaoZuo%>"></asp:Label>：
                                                                            <asp:Button ID="BT_NewEdit" runat="server" CssClass="inpu" Text="<%$ Resources:lang,BianJi%>" OnClick="BT_NewEdit_Click" />&nbsp;
                                                                            <asp:Button ID="BT_NewDelete" runat="server" CssClass="inpu" Text="<%$ Resources:lang,ShanChu%>" OnClick="BT_NewDelete_Click" OnClientClick="return confirm(getDeleteMsgByLangCode())"/>&nbsp;
                                                                            <asp:Button ID="BT_NewTitle" runat="server" CssClass="inpu" Text="<%$ Resources:lang,ChongZuoBiaoJi%>" OnClick="BT_NewTitle_Click" />&nbsp;
                                                                            <asp:Button ID="BT_NewReplace" runat="server" CssClass="inpu" Text="<%$ Resources:lang,DaiMaTiHuan%>" OnClick="BT_NewReplace_Click" />&nbsp;
                                                                            <asp:Button ID="BT_NewBrowse" runat="server" CssClass="inpu" Text="<%$ Resources:lang,LiuLan%>" OnClick="BT_NewBrowse_Click" />&nbsp;

                                                                            <asp:Button ID="BT_ReplaceOjbectCode" runat="server" Text="<%$ Resources:lang,DaiMaTiHuanHouTaiFangFa%>" OnClick="BT_ReplaceOjbectCode_Click" CssClass="inpu" Style="display: none;" />&nbsp;
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td class="formItemBgStyle" colspan="6">
                                                                            <asp:Label ID="Label15" runat="server" Text="<%$ Resources:lang,LieBiaoPaiXu%>"></asp:Label>：
                                                                            <asp:Button ID="BT_ObjectCode" runat="server" Text="<%$ Resources:lang,WuZiDaiMa%>" CssClass="inpu" OnClick="BT_ObjectCode_Click" />&nbsp;
                                                                            <asp:Button ID="BT_IsMark" runat="server" Text="<%$ Resources:lang,ShiYongBiaoJi%>" CssClass="inpu" OnClick="BT_IsMark_Click" />&nbsp;
                                                                            <asp:Button ID="BT_ObjectName" runat="server" Text="<%$ Resources:lang,WuZiMingCheng%>" CssClass="inpu" OnClick="BT_ObjectName_Click" />&nbsp;
                                                                            <asp:HiddenField ID="HF_SortObjectCode" runat="server" />
                                                                            <asp:HiddenField ID="HF_SortIsMark" runat="server" />
                                                                            <asp:HiddenField ID="HF_SortObjectName" runat="server" />
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td style="text-align: left" class="formItemBgStyle" colspan="6">
                                                                            <asp:Button ID="BT_CreateCode" runat="server" Text="<%$ Resources:lang,ChuangJianDaiMa%>" OnClick="BT_CreateCode_Click" CssClass="inpu" />
                                                                            &nbsp;&nbsp;&nbsp;&nbsp;
                                                                            <input type="button" onclick="window.location.href = 'TTWZObjectCodeEdit.aspx'" value="批量导入" class="inpuLong" />
                                                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                                            <asp:Label ID="LB_ShowXLName" runat="server" Text="**"></asp:Label><asp:Label ID="Label16" runat="server" Text="<%$ Resources:lang,XiaoLeiWuZiDaiMaJiLu%>"></asp:Label>&nbsp;<asp:Label ID="Label17" runat="server" Text="<%$ Resources:lang,Gong%>"></asp:Label>
                                                                            <asp:Label ID="LB_ShowRecordCount" runat="server" Text="**"></asp:Label><asp:Label ID="Label18" runat="server" Text="<%$ Resources:lang,Tiao%>"></asp:Label>&nbsp;&nbsp;
                                                                        </td>
                                                                    </tr>
                                                                </table>

                                                            </div>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="left" style="width: 250px; padding: 5px 5px 5px 5px;" class="formItemBgStyle" valign="top">

                                                            <asp:TreeView ID="TV_Type" runat="server" ShowLines="True" NodeWrap="True" OnSelectedNodeChanged="TV_Type_SelectedNodeChanged">
                                                                <RootNodeStyle CssClass="rootNode" />
                                                                <NodeStyle CssClass="treeNode" />
                                                                <LeafNodeStyle CssClass="leafNode" />
                                                                <SelectedNodeStyle CssClass="selectNode" ForeColor ="Red" />
                                                            </asp:TreeView>

                                                        </td>
                                                        <td class="formItemBgStyle">
                                                            <div id="divObjectCode">
                                                                <table border="0" cellspacing="0" cellpadding="0">
                                                                    
                                                                    <tr>
                                                                        <td align="right" >
                                                                            <asp:Label ID="Label1111" runat="server" Text="<%$ Resources:lang,LeiXing%>"></asp:Label>：
                                                                        </td>
                                                                        <td align="left" >
                                                                            <asp:Label ID="LB_WZObjectType" runat="server"></asp:Label>
                                                                        </td>
                                                                        <td align="center">
                                                                            <asp:Label ID="Label52" runat="server" Text="<%$ Resources:lang,WuZiDaiMa%>"></asp:Label>
                                                                            :
                                                                                        <asp:TextBox ID="TB_WZCode" runat="server"></asp:TextBox>
                                                                        </td>
                                                                        <td align="left">
                                                                            <asp:Label ID="Label53" runat="server" Text="<%$ Resources:lang,WuZiMingChen%>"></asp:Label>
                                                                            <asp:TextBox ID="TB_WZName" runat="server"></asp:TextBox>
                                                                        </td>
                                                                        <td align="left">
                                                                            <asp:Label ID="Label54" runat="server" Text="<%$ Resources:lang,BiaoZhun%>"></asp:Label>
                                                                            <asp:TextBox ID="TB_WZCriterion" runat="server"></asp:TextBox>
                                                                        </td>
                                                                        <td align="center">
                                                                            <asp:Label ID="Label43" runat="server" Text="<%$ Resources:lang,JiBie%>"></asp:Label>
                                                                            <asp:TextBox ID="TB_WZGrade" runat="server"></asp:TextBox>
                                                                        </td>
                                                                        <td align="left">
                                                                            <asp:Label ID="Label55" runat="server" Text="<%$ Resources:lang,GuiGeXingHao%>"></asp:Label>
                                                                            <asp:TextBox ID="TB_WZModel" runat="server"></asp:TextBox>
                                                                        </td>
                                                                        <td align="left">
                                                                            <asp:Button ID="BT_Find" runat="server" CssClass="inpu" OnClick="BT_Find_Click" Text="查询" />
                                                                        </td>
                                                                    </tr>
                                                                </table>

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
                                                                                            <asp:Label ID="Label19" runat="server" Text="<%$ Resources:lang,CaoZuo%>"></asp:Label></strong>
                                                                                    </td>
                                                                                    <td width="5%" align="center">
                                                                                        <strong>
                                                                                            <asp:Label ID="Label20" runat="server" Text="<%$ Resources:lang,WuZiDaiMa%>"></asp:Label></strong>
                                                                                    </td>
                                                                                    <td width="10%" align="left">
                                                                                        <strong>
                                                                                            <asp:Label ID="Label21" runat="server" Text="<%$ Resources:lang,WuZiMingCheng%>"></asp:Label></strong>
                                                                                    </td>
                                                                                    <td width="12%" align="left">
                                                                                        <strong>
                                                                                            <asp:Label ID="Label22" runat="server" Text="<%$ Resources:lang,GuiGeXingHao%>"></asp:Label></strong>
                                                                                    </td>
                                                                                    <td width="6%" align="left">
                                                                                        <strong>
                                                                                            <asp:Label ID="Label23" runat="server" Text="<%$ Resources:lang,BiaoZhun%>"></asp:Label></strong>
                                                                                    </td>
                                                                                    <td width="4%" align="center">
                                                                                        <strong>
                                                                                            <asp:Label ID="Label24" runat="server" Text="<%$ Resources:lang,JiBie%>"></asp:Label></strong>
                                                                                    </td>
                                                                                    <td width="4%" align="center">
                                                                                        <strong>
                                                                                            <asp:Label ID="Label25" runat="server" Text="<%$ Resources:lang,JiLiangDanWei%>"></asp:Label></strong>
                                                                                    </td>
                                                                                    <td width="4%" align="center">
                                                                                        <strong>
                                                                                            <asp:Label ID="Label26" runat="server" Text="<%$ Resources:lang,HuanSuanDanWei%>"></asp:Label></strong>
                                                                                    </td>
                                                                                    <td width="4%" align="right">
                                                                                        <strong>
                                                                                            <asp:Label ID="Label27" runat="server" Text="<%$ Resources:lang,HuanSuanXiShu%>"></asp:Label></strong>
                                                                                    </td>
                                                                                    <td width="4%" align="center">
                                                                                        <strong>
                                                                                            <asp:Label ID="Label28" runat="server" Text="<%$ Resources:lang,ChuangJianRen%>"></asp:Label></strong>
                                                                                    </td>
                                                                                    <td width="8%" align="left">
                                                                                        <strong>
                                                                                            <asp:Label ID="Label29" runat="server" Text="<%$ Resources:lang,DuiZhaoMiaoShu%>"></asp:Label></strong>
                                                                                    </td>
                                                                                    <td width="8%" align="left">
                                                                                        <strong>
                                                                                            <asp:Label ID="Label30" runat="server" Text="<%$ Resources:lang,DuiZhaoMiaoShu%>"></asp:Label></strong>
                                                                                    </td>
                                                                                    <td width="4%" align="right">
                                                                                        <strong>
                                                                                            <asp:Label ID="Label31" runat="server" Text="<%$ Resources:lang,ShiChangHangQing%>"></asp:Label></strong>
                                                                                    </td>
                                                                                    <td width="4%" align="center">
                                                                                        <strong>
                                                                                            <asp:Label ID="Label32" runat="server" Text="<%$ Resources:lang,CaiJiRiQi%>"></asp:Label></strong>
                                                                                    </td>
                                                                                    <td width="4%" align="center">
                                                                                        <strong>
                                                                                            <asp:Label ID="Label33" runat="server" Text="<%$ Resources:lang,ShiYongBiaoJi%>"></asp:Label></strong>
                                                                                    </td>
                                                                                </tr>
                                                                            </table>
                                                                        </td>
                                                                        <td width="6" align="right">
                                                                            <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" />
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                                <asp:DataGrid ID="DG_List" runat="server" AllowPaging="false" AutoGenerateColumns="False"
                                                                    CellPadding="4" ForeColor="#333333" GridLines="None" Height="1px" PageSize="10" ShowHeader="false"
                                                                    Width="100%" OnItemCommand="DG_List_ItemCommand" OnPageIndexChanged="DG_List_PageIndexChanged">
                                                                    <Columns>
                                                                        <asp:TemplateColumn>
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="2%" />
                                                                            <HeaderTemplate>
                                                                                <asp:Label ID="Label34" runat="server" Text="<%$ Resources:lang,CaoZuo%>"></asp:Label>
                                                                            </HeaderTemplate>
                                                                            <ItemTemplate>

                                                                                <asp:LinkButton ID="LinkButton1" runat="server" CommandArgument='<%# Eval("ObjectCode")+"|"+Eval("Creater")+"|"+Eval("IsMark") %>' CommandName="click" CssClass="notTab">
                                                                                    <asp:Label ID="Label42" runat="server" Text="<%$ Resources:lang,CaoZuo%>"></asp:Label>
                                                                                </asp:LinkButton>
                                                                                <%--<asp:LinkButton ID="LinkButton1" runat="server" CommandArgument='<%# DataBinder.Eval(Container.DataItem,"ObjectCode") %>' CommandName="edit" CssClass="notTab">编辑</asp:LinkButton>--%>
                                                                                <%--<asp:LinkButton ID="LinkButton2" runat="server" CommandArgument='<%# DataBinder.Eval(Container.DataItem,"ObjectCode") %>' CommandName="del" CssClass="notTab">删除</asp:LinkButton>--%>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateColumn>
                                                                        <asp:BoundColumn DataField="ObjectCode" HeaderText="物资代码">
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                        </asp:BoundColumn>
                                                                        <asp:TemplateColumn>
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="10%" />
                                                                            <HeaderTemplate>
                                                                                <asp:Label ID="Label35" runat="server" Text="<%$ Resources:lang,WuZiMingCheng%>"></asp:Label>
                                                                            </HeaderTemplate>
                                                                            <ItemTemplate>
                                                                                <%# ShareClass.StringCutByRequire(Eval("ObjectName").ToString(), 14) %>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateColumn>
                                                                        <asp:TemplateColumn>
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="12%" />
                                                                            <HeaderTemplate>
                                                                                <asp:Label ID="Label36" runat="server" Text="<%$ Resources:lang,GuiGeXingHao%>"></asp:Label>
                                                                            </HeaderTemplate>
                                                                            <ItemTemplate>
                                                                                <%# ShareClass.StringCutByRequire(Eval("Model").ToString(), 190) %>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateColumn>
                                                                        <asp:TemplateColumn>
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="6%" />
                                                                            <HeaderTemplate>
                                                                                <asp:Label ID="Label37" runat="server" Text="<%$ Resources:lang,BiaoZhun%>"></asp:Label>
                                                                            </HeaderTemplate>
                                                                            <ItemTemplate>
                                                                                <%# ShareClass.StringCutByRequire(Eval("Criterion").ToString(), 8) %>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateColumn>
                                                                        <asp:TemplateColumn>
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="4%" />
                                                                            <HeaderTemplate>
                                                                                <asp:Label ID="Label38" runat="server" Text="<%$ Resources:lang,JiBie%>"></asp:Label>
                                                                            </HeaderTemplate>
                                                                            <ItemTemplate>
                                                                                <%# ShareClass.StringCutByRequire(Eval("Grade").ToString(), 5) %>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateColumn>
                                                                        <%--<asp:BoundColumn DataField="Grade" HeaderText="级别">
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="4%" />
                                                                        </asp:BoundColumn>--%>
                                                                        <asp:BoundColumn DataField="UnitName" HeaderText="计量单位">
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="4%" />
                                                                        </asp:BoundColumn>
                                                                        <asp:BoundColumn DataField="ConvertUnitName" HeaderText="换算单位">
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="4%" />
                                                                        </asp:BoundColumn>
                                                                        <asp:BoundColumn DataField="ConvertRatio" HeaderText="换算系数">
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Right" Width="4%" />
                                                                        </asp:BoundColumn>
                                                                        <asp:BoundColumn DataField="CreaterName" HeaderText="创建人">
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="4%" />
                                                                        </asp:BoundColumn>
                                                                        <asp:TemplateColumn>
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="8%" />
                                                                            <HeaderTemplate>
                                                                                <asp:Label ID="Label39" runat="server" Text="<%$ Resources:lang,DuiZhaoBiaoZhun%>"></asp:Label>
                                                                            </HeaderTemplate>
                                                                            <ItemTemplate>
                                                                                <%# ShareClass.StringCutByRequire(Eval("ReferStandard").ToString(), 11) %>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateColumn>
                                                                        <asp:TemplateColumn>
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="8%" />
                                                                            <HeaderTemplate>
                                                                                <asp:Label ID="Label40" runat="server" Text="<%$ Resources:lang,DuiZhaoMiaoShu%>"></asp:Label>
                                                                            </HeaderTemplate>
                                                                            <ItemTemplate>
                                                                                <%# ShareClass.StringCutByRequire(Eval("ReferDesc").ToString(), 11) %>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateColumn>
                                                                        <asp:BoundColumn DataField="Market" HeaderText="市场行情">
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Right" Width="4%" />
                                                                        </asp:BoundColumn>
                                                                        <asp:TemplateColumn>
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="4%" />
                                                                            <HeaderTemplate>
                                                                                <asp:Label ID="Label41" runat="server" Text="<%$ Resources:lang,CaiJiRiQi%>"></asp:Label>
                                                                            </HeaderTemplate>
                                                                            <ItemTemplate>
                                                                                <%#DataBinder.Eval(Container.DataItem, "CollectTime", "{0:yyyy/MM/dd}")%>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateColumn>
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
                                                                <asp:Label ID="LB_Sql" runat="server" Visible="False"></asp:Label>
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

                <asp:HiddenField ID="HF_ReplaceObjectCode" runat="server" />
                <asp:HiddenField ID="HF_ReplaceNewObjectCode" runat="server" />

                <asp:HiddenField ID="HF_NewObjectCode" runat="server" />
                <asp:HiddenField ID="HF_NewCreater" runat="server" />
                <asp:HiddenField ID="HF_NewIsMark" runat="server" />
            </ContentTemplate>
            <Triggers>
                <asp:PostBackTrigger ControlID="btnSave" />
                <asp:PostBackTrigger ControlID="btnReset" />
                <asp:PostBackTrigger ControlID="BT_Title" />
                <asp:PostBackTrigger ControlID="BT_Replace" />
            </Triggers>
        </asp:UpdatePanel>
        <asp:HiddenField ID="HF_ID" runat="server" />
    </form>
</body>
<script type="text/javascript" language="javascript">var cssDirectory = '<%=Session["CssDirectory"] %>'; var oLink = document.getElementById('mainCss'); oLink.href = 'css/' + cssDirectory + '/' + 'bluelightmain.css';</script></html>
