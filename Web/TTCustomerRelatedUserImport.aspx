<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTCustomerRelatedUserImport.aspx.cs" Inherits="TTCustomerRelatedUserImport" %>

<%@ Register Assembly="NickLee.Web.UI" Namespace="NickLee.Web.UI" TagPrefix="NickLee" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Assembly="Brettle.Web.NeatUpload" Namespace="Brettle.Web.NeatUpload"
    TagPrefix="Upload" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link id="mainCss" href="css/bluelightmain.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="js/allAHandler.js"></script>
    <script type="text/javascript" language="javascript">
        $(function () {
            if (top.location != self.location) { } else { CloseWebPage(); }



        });


        function displayWaitingImage(varDisplayValue) {

            document.getElementById("div_imgwaiting").style.display = varDisplayValue;

        }

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
                    <div id="AboveDiv">
                        <table cellpadding="0" cellspacing="0" width="100%" class="bian">
                            <tr>
                                <td height="31" class="page_topbj">
                                    <table width="96%" border="0" align="center" cellpadding="0" cellspacing="0">
                                        <tr>
                                            <td align="left">
                                                <table width="1600" border="0" align="left" cellpadding="0" cellspacing="0">
                                                    <tr>
                                                        <td width="29">
                                                            <%--<img src="Logo/main_top_l.jpg" alt="" width="29" height="31" />--%>
                                                        </td>
                                                        <td align="center" background="ImagesSkin/main_top_bj.jpg" class="titlezi">
                                                            <asp:Label ID="Label1" runat="server" Text="客户可视人员导入"></asp:Label>
                                                        </td>
                                                        <td width="5">
                                                            <%-- <img src="ImagesSkin/main_top_r.jpg" width="5" height="31" />--%>
                                                        </td>
                                                        <td>&nbsp;</td>
                                                    </tr>
                                                    <tr>
                                                        <td width="29" style="text-align: left;"></td>
                                                        <td align="center" background="ImagesSkin/main_top_bj.jpg" style="text-align: left;" colspan="4">

                                                            <asp:UpdatePanel ID="UpdatePanel3" runat="server" UpdateMode="Conditional">
                                                                <ContentTemplate>
                                                                    <div>
                                                                        <table>
                                                                            <tr>
                                                                                <td>
                                                                                    <Upload:InputFile ID="FileUpload_Training" runat="server" Width="400px" />
                                                                                </td>
                                                                                <td>
                                                                                    <div id="div_imgwaiting" style="display: none;">
                                                                                        <img id="Img_Waiting" src="Images/Processing.gif" alt="Loading,please wait..." />
                                                                                    </div>
                                                                                </td>
                                                                                <td>
                                                                                    <asp:CheckBox ID="CB_IsClearAll" runat="server" Checked="false" Text="导入时删除原来的" />
                                                                                </td>
                                                                                <td style="padding-left: 10px;">
                                                                                    <asp:Button ID="btn_ExcelToDataTraining" runat="server" CssClass="inpu" OnClick="btn_ExcelToDataTraining_Click" OnClientClick="displayWaitingImage('block');" Text="<%$ Resources:lang,DaoRuShuJu%>" />
                                                                                </td>

                                                                            </tr>
                                                                        </table>

                                                                        <asp:Label ID="Label28" runat="server" Text="客户可视人员导入模板"></asp:Label>
                                                                        ：<a href="Template/客户可视人员导入模板.xls"><asp:Label ID="Label29" runat="server" Text="客户可视人员导入模板"></asp:Label>
                                                                        </a>
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
                                                            <br />
                                                            <asp:Label ID="LB_ErrorText" runat="server" ForeColor="Red"></asp:Label>

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

