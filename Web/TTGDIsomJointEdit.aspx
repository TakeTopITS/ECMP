<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTGDIsomJointEdit.aspx.cs" Inherits="TTGDIsomJointEdit" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>单线图接头编辑</title>
    <link id="mainCss" href="css/bluelightmain.css" rel="stylesheet" type="text/css" />
    <script src="js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="js/allAHandler.js"></script>

    <script src="js/My97DatePicker/WdatePicker.js"></script>
    <script type="text/javascript">

        function ClickReturnRedict() {
            var varIsom_no = document.getElementById("HF_Isom_no").value;
            var varUrl = "TTGDIsomJointList.aspx?Isom_no=" + varIsom_no;
            window.location.href = varUrl;
        }

        function SelectStandardSize() {
            var url = "TTGDSelectorStandardSizeList.aspx";

            popShowByURLForFixedSize(url + (url.indexOf("?") == -1 ? "?" : "&") + "ctrlId=" + id + "&ctrlName=" + name, '选择尺寸', 900, 500);
        }

        function SelectWeldType() {
            var url = "TTGDSelectorWeldTypeList.aspx";

            popShowByURLForFixedSize(url + (url.indexOf("?") == -1 ? "?" : "&") + "ctrlId=" + id + "&ctrlName=" + name, '选择焊接类型', 900, 500);
        }

        function SelectWPSNo() {
            var url = "TTGDSelectorWPSNoList.aspx";

            popShowByURLForFixedSize(url + (url.indexOf("?") == -1 ? "?" : "&") + "ctrlId=" + id + "&ctrlName=" + name, '选择WPS工艺', 900, 500);
          
        }

        function SelectApplication() {
            var url = "TTGDSelectorApplicationList.aspx";

            popShowByURLForFixedSize(url + (url.indexOf("?") == -1 ? "?" : "&") + "ctrlId=" + id + "&ctrlName=" + name, '选择介质', 900, 500);

        }

        function SelectPressure() {
            var url = "TTGDSelectorPressureList.aspx";

            popShowByURLForFixedSize(url + (url.indexOf("?") == -1 ? "?" : "&") + "ctrlId=" + id + "&ctrlName=" + name, '选择试压包号', 900, 500);

        }

        //焊工
        function SelectWelders(url, id, name) {

            popShowByURLForFixedSize(url + (url.indexOf("?") == -1 ? "?" : "&") + "ctrlId=" + id + "&ctrlName=" + name, '选择焊工', 900, 500);

        }

        //FRI
        function SelectFri(url, id) {

            popShowByURLForFixedSize(url + (url.indexOf("?") == -1 ? "?" : "&") + "ctrlId=" + id , '选择FRI', 900, 500);

          }


        function LoadParentLit() {

            alert("保存成功！");

            if (navigator.userAgent.indexOf("Firefox") >= 0) {

                window.parent.LoadProjectList();
            }
            else {


                window.parent.LoadProjectList();

            }
            CloseLayer();
        }
   
        $(function () {



        });

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
                                                            <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,DanXianTuJieTouBianJi%>"></asp:Label>
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
                                                        <td style="text-align: left" class="formItemBgStyle">
                                                            <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,JieTouHao%>"></asp:Label>：
                                                        </td>
                                                        <td style="text-align: left" class="formItemBgStyle">
                                                            <asp:TextBox ID="TXT_JointNo" runat="server"></asp:TextBox>
                                                        </td>
                                                        <td style="text-align: left" class="formItemBgStyle">
                                                            <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,BianGeng%>"></asp:Label>：
                                                        </td>
                                                        <td style="text-align: left" class="formItemBgStyle">
                                                            <asp:TextBox ID="TXT_Rev" runat="server"></asp:TextBox>
                                                        </td>
                                                        <td style="text-align: left" class="formItemBgStyle">
                                                            <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,ChiCun%>"></asp:Label>：
                                                        </td>
                                                        <td style="text-align: left" class="formItemBgStyle">
                                                            <asp:TextBox ID="TXT_Size" runat="server"></asp:TextBox>&nbsp;
                                                            <input type="button" id="btnPerson" class="inpu" runat="server" value="选择" onclick="SelectStandardSize();" />
                                                        </td>

                                                    </tr>
                                                    <tr>
                                                        <td style="text-align: left" class="formItemBgStyle">
                                                            <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,LeiXing%>"></asp:Label>：
                                                        </td>
                                                        <td style="text-align: left" class="formItemBgStyle">
                                                            <asp:TextBox ID="TXT_Mold" runat="server"></asp:TextBox>&nbsp;
                                                            <input type="button" id="Button1" class="inpu" runat="server" value="选择" onclick="SelectWeldType();" />
                                                        </td>
                                                        <td style="text-align: left" class="formItemBgStyle">S/F：
                                                        </td>
                                                        <td style="text-align: left" class="formItemBgStyle">
                                                            <asp:DropDownList ID="DDL_SF" runat="server">
                                                                <asp:ListItem Text="S" Value="S" />
                                                                <asp:ListItem Text="F" Value="F" />
                                                            </asp:DropDownList>
                                                            <%--<asp:TextBox ID="TXT_SF" runat="server"></asp:TextBox>--%>
                                                        </td>
                                                        <td style="text-align: left" class="formItemBgStyle">
                                                            <asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,JieZhiDaiHao%>"></asp:Label>：
                                                        </td>
                                                        <td style="text-align: left" class="formItemBgStyle">
                                                            <asp:TextBox ID="TXT_MediumCode" runat="server"></asp:TextBox>&nbsp;
                                                            <input type="button" id="Button2" class="inpu" runat="server" value="选择" onclick="SelectApplication();" />
                                                        </td>

                                                    </tr>
                                                    <tr>
                                                        <td style="text-align: left" class="formItemBgStyle">
                                                            <asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,GuanJianHaoAnZhuangRiQi%>"></asp:Label>：
                                                        </td>
                                                        <td style="text-align: left" class="formItemBgStyle">
                                                            <asp:TextBox ID="TXT_Pipefittings" runat="server"></asp:TextBox>&nbsp;&nbsp;<asp:TextBox ID="TXT_InstallationTime" runat="server" onClick="WdatePicker({dateFmt:'yyyy-MM-dd'})"></asp:TextBox>
                                                        </td>
                                                        <td style="text-align: left" class="formItemBgStyle">
                                                            <asp:Label ID="Label8" runat="server" Text="<%$ Resources:lang,DaDiHanGong%>"></asp:Label>：
                                                        </td>
                                                        <td style="text-align: left" class="formItemBgStyle">
                                                            <asp:HiddenField ID="HF_RanderWelder1" runat="server" />
                                                            <asp:TextBox ID="TXT_RanderWelder1" runat="server"></asp:TextBox>&nbsp;
                                                            <input type="button" value="选择" id="BT_SelectPrice" class="inpu" onclick="SelectWelders('TTGDSelectorWeldersList.aspx', 'HF_RanderWelder1', 'TXT_RanderWelder1')" /><br />
                                                            <asp:HiddenField ID="HF_RanderWelder2" runat="server" />
                                                            <asp:TextBox ID="TXT_RanderWelder2" runat="server"></asp:TextBox>&nbsp;
                                                            <input type="button" value="选择" id="Button3" class="inpu" onclick="SelectWelders('TTGDSelectorWeldersList.aspx', 'HF_RanderWelder2', 'TXT_RanderWelder2')" />
                                                        </td>
                                                        <td style="text-align: left" class="formItemBgStyle">
                                                            <asp:Label ID="Label9" runat="server" Text="<%$ Resources:lang,DaDiRiQi%>"></asp:Label>：
                                                        </td>
                                                        <td style="text-align: left" class="formItemBgStyle">
                                                            <asp:TextBox ID="TXT_RanderTime" runat="server" onClick="WdatePicker({dateFmt:'yyyy-MM-dd'})"></asp:TextBox>
                                                        </td>

                                                    </tr>
                                                    <tr>
                                                        <td style="text-align: left" class="formItemBgStyle">
                                                            <asp:Label ID="Label10" runat="server" Text="<%$ Resources:lang,GaiMianHanGong%>"></asp:Label>：
                                                        </td>
                                                        <td style="text-align: left" class="formItemBgStyle">
                                                            <asp:HiddenField ID="HF_CoveringWelder1" runat="server" />
                                                            <asp:TextBox ID="TXT_CoveringWelder1" runat="server"></asp:TextBox>&nbsp;
                                                            <input type="button" value="选择" id="Button4" class="inpu" onclick="SelectWelders('TTGDSelectorWeldersList.aspx', 'HF_CoveringWelder1', 'TXT_CoveringWelder1')" /><br />
                                                            <asp:HiddenField ID="HF_CoveringWelder2" runat="server" />
                                                            <asp:TextBox ID="TXT_CoveringWelder2" runat="server"></asp:TextBox>&nbsp;
                                                            <input type="button" value="选择" id="Button5" class="inpu" onclick="SelectWelders('TTGDSelectorWeldersList.aspx', 'HF_CoveringWelder2', 'TXT_CoveringWelder2')" />
                                                        </td>
                                                        <td style="text-align: left" class="formItemBgStyle">
                                                            <asp:Label ID="Label11" runat="server" Text="<%$ Resources:lang,GaiMianRiQi%>"></asp:Label>：
                                                        </td>
                                                        <td style="text-align: left" class="formItemBgStyle">
                                                            <asp:TextBox ID="TXT_CoveringTime" runat="server" onClick="WdatePicker({dateFmt:'yyyy-MM-dd'})"></asp:TextBox>
                                                        </td>
                                                        <td style="text-align: left" class="formItemBgStyle">WPS No：
                                                        </td>
                                                        <td style="text-align: left" class="formItemBgStyle">
                                                            <asp:TextBox ID="TXT_WPSNo" runat="server"></asp:TextBox>&nbsp;
                                                            <input type="button" id="Button10" class="inpu" runat="server" value="选择" onclick="SelectWPSNo();" />
                                                        </td>

                                                    </tr>
                                                    <tr>
                                                        <td style="text-align: left" class="formItemBgStyle">
                                                            <asp:Label ID="Label12" runat="server" Text="<%$ Resources:lang,ShiYaBaoHao%>"></asp:Label>：
                                                        </td>
                                                        <td style="text-align: left" class="formItemBgStyle">
                                                            <asp:TextBox ID="TXT_PressurePackNo" runat="server"></asp:TextBox>&nbsp;
                                                            <input type="button" id="Button11" class="inpu" runat="server" value="选择" onclick="SelectPressure();" />
                                                        </td>
                                                        <td style="text-align: left" class="formItemBgStyle">FRI1-4：
                                                        </td>
                                                        <td style="text-align: left" class="formItemBgStyle">
                                                            <asp:TextBox ID="TXT_FRI1" runat="server" Width="50"></asp:TextBox>&nbsp;
                                                            <input type="button" value="选择" id="Button7" class="inpu" onclick="SelectFri('TTGDSelectorFriList.aspx', 'TXT_FRI1')" />
                                                            <asp:TextBox ID="TXT_FRI2" runat="server" Width="50"></asp:TextBox>&nbsp;
                                                            <input type="button" value="选择" id="Button6" class="inpu" onclick="SelectFri('TTGDSelectorFriList.aspx', 'TXT_FRI2')" /><br />
                                                            <asp:TextBox ID="TXT_FRI3" runat="server" Width="50"></asp:TextBox>&nbsp;
                                                            <input type="button" value="选择" id="Button8" class="inpu" onclick="SelectFri('TTGDSelectorFriList.aspx', 'TXT_FRI3')" />
                                                            <asp:TextBox ID="TXT_FRI4" runat="server" Width="50"></asp:TextBox>&nbsp;
                                                            <input type="button" value="选择" id="Button9" class="inpu" onclick="SelectFri('TTGDSelectorFriList.aspx', 'TXT_FRI4')" />
                                                        </td>
                                                        <td style="text-align: left" class="formItemBgStyle">Fit-Up：
                                                        </td>
                                                        <td style="text-align: left" class="formItemBgStyle">
                                                            <asp:TextBox ID="TXT_FitUpTime" runat="server" onClick="WdatePicker({dateFmt:'yyyy-MM-dd'})"></asp:TextBox><br />
                                                            <asp:TextBox ID="TXT_FitUp" runat="server"></asp:TextBox>
                                                        </td>

                                                    </tr>
                                                    <tr>
                                                        <td style="text-align: left" class="formItemBgStyle">
                                                            <asp:Label ID="Label13" runat="server" Text="<%$ Resources:lang,WaiGuan%>"></asp:Label>：
                                                        </td>
                                                        <td style="text-align: left" class="formItemBgStyle">
                                                            <asp:TextBox ID="TXT_VisualTime" runat="server" onClick="WdatePicker({dateFmt:'yyyy-MM-dd'})"></asp:TextBox><br />
                                                            <asp:TextBox ID="TXT_Visual" runat="server"></asp:TextBox>
                                                        </td>
                                                        <td style="text-align: left" class="formItemBgStyle">RT：
                                                        </td>
                                                        <td style="text-align: left" class="formItemBgStyle">
                                                            <asp:TextBox ID="TXT_RTTime" runat="server" onClick="WdatePicker({dateFmt:'yyyy-MM-dd'})"></asp:TextBox><br />
                                                            <asp:TextBox ID="TXT_RT" runat="server"></asp:TextBox>
                                                        </td>
                                                        <td style="text-align: left" class="formItemBgStyle">PT：
                                                        </td>
                                                        <td style="text-align: left" class="formItemBgStyle">
                                                            <asp:TextBox ID="TXT_PTTime" runat="server" onClick="WdatePicker({dateFmt:'yyyy-MM-dd'})"></asp:TextBox><br />
                                                            <asp:TextBox ID="TXT_PT" runat="server"></asp:TextBox>
                                                        </td>

                                                    </tr>
                                                    <tr>
                                                        <td style="text-align: left" class="formItemBgStyle">
                                                            <asp:Label ID="Label14" runat="server" Text="<%$ Resources:lang,ReChuLi%>"></asp:Label>：
                                                        </td>
                                                        <td style="text-align: left" class="formItemBgStyle">
                                                            <asp:TextBox ID="TXT_PWHTTime" runat="server" onClick="WdatePicker({dateFmt:'yyyy-MM-dd'})"></asp:TextBox><br />
                                                            <asp:TextBox ID="TXT_PWHT" runat="server"></asp:TextBox>
                                                        </td>
                                                        <td style="text-align: left" class="formItemBgStyle">PMI：
                                                        </td>
                                                        <td style="text-align: left" class="formItemBgStyle">
                                                            <asp:TextBox ID="TXT_PMITime" runat="server" onClick="WdatePicker({dateFmt:'yyyy-MM-dd'})"></asp:TextBox><br />
                                                            <asp:TextBox ID="TXT_PMI" runat="server"></asp:TextBox>
                                                        </td>
                                                        <td style="text-align: left" class="formItemBgStyle">MT：
                                                        </td>
                                                        <td style="text-align: left" class="formItemBgStyle">
                                                            <asp:TextBox ID="TXT_MTTime" runat="server" onClick="WdatePicker({dateFmt:'yyyy-MM-dd'})"></asp:TextBox><br />
                                                            <asp:TextBox ID="TXT_MT" runat="server"></asp:TextBox>
                                                        </td>

                                                    </tr>
                                                    <tr>
                                                        <td style="text-align: left" class="formItemBgStyle">
                                                            <asp:Label ID="Label15" runat="server" Text="<%$ Resources:lang,LiShiYe%>"></asp:Label>：
                                                        </td>
                                                        <td style="text-align: left" class="formItemBgStyle">
                                                            <asp:TextBox ID="TXT_HistorySheet" runat="server"></asp:TextBox>
                                                        </td>
                                                        <td style="text-align: left" class="formItemBgStyle">
                                                            <asp:Label ID="Label16" runat="server" Text="<%$ Resources:lang,YaLiShiYan%>"></asp:Label>：
                                                        </td>
                                                        <td style="text-align: left" class="formItemBgStyle">
                                                            <asp:TextBox ID="TXT_PressTest" runat="server"></asp:TextBox>
                                                        </td>
                                                        <td style="text-align: left" class="formItemBgStyle">
                                                            <asp:Label ID="Label17" runat="server" Text="<%$ Resources:lang,ChouQianXiangQing%>"></asp:Label>：
                                                        </td>
                                                        <td style="text-align: left" class="formItemBgStyle">
                                                            <asp:TextBox ID="TXT_RTLotDetailsRT1" runat="server" Width="50"></asp:TextBox>&nbsp;
                                                            <asp:TextBox ID="TXT_RTLotDetailsRT2" runat="server" Width="50"></asp:TextBox><br />
                                                            <asp:TextBox ID="TXT_RTLotDetailsRT3" runat="server" Width="50"></asp:TextBox>&nbsp;
                                                            <asp:TextBox ID="TXT_RTLotDetailsRT4" runat="server" Width="50"></asp:TextBox>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="text-align: center" class="formItemBgStyle" colspan="6">
                                                            <asp:Button ID="btnOK" runat="server" Text="<%$ Resources:lang,BaoCun%>" CssClass="inpu" OnClick="btnOK_Click" />&nbsp;&nbsp;
                                                            <%--<input type="button" value="返回" id="BT_Return" class="inpu" onclick="ClickReturnRedict();" />--%>
                                                            <input id="btnClose()" class="inpu" onclick="window.returnValue = false; CloseLayer();"
                                                                type="button" value="关闭" />
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
                <asp:HiddenField ID="HF_ID" runat="server" />
                <asp:HiddenField ID="HF_Isom_no" runat="server" />
            </ContentTemplate>
        </asp:UpdatePanel>
    </form>
</body>
<script type="text/javascript" language="javascript">var cssDirectory = '<%=Session["CssDirectory"] %>'; var oLink = document.getElementById('mainCss'); oLink.href = 'css/' + cssDirectory + '/' + 'bluelightmain.css';</script></html>
