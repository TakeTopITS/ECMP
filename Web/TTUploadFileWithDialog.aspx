<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTUploadFileWithDialog.aspx.cs" Inherits="TTUploadFileWithDialog" %>

<meta name="viewport" content="width=device-width; initial-scale=1.0; maximum-scale=1.0; minimum-scale=0.1; user-scalable=1" />

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Assembly="Brettle.Web.NeatUpload" Namespace="Brettle.Web.NeatUpload"
    TagPrefix="Upload" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>附件上传</title>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <link id="mainCss" href="css/bluelightmain.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="lhgdialog/lhgcore.min.js"></script>
    <script type="text/javascript" src="lhgdialog/lhgdialog.min.js"> </script>

    <script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="js/allAHandler.js"></script>

    <script language="javascript" type="text/javascript">

        function toFather() {

            var val = document.getElementById("txtReturnValue").value;

            if (navigator.userAgent.indexOf("MSIE") >= 0) {

                document.parentWindow.parent.setValue(val);

            }
            else {

                window.parent.setValue(val);

            }

            CloseLayer();
        }

    </script>

    <base target="_self">
</head>
<body>
    <center>
        <form id="form1" runat="server">
            <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="True" EnableScriptLocalization="True">
            </asp:ScriptManager>
            <br />
            <br />
            <table style="width: 350px;" cellpadding="3" cellspacing="0">
                <tr>
                    <td  align="left">
                        <asp:Label ID="Label11" runat="server" Text="<%$ Resources:lang,LeiXing%>"></asp:Label>
                        <asp:Label ID="LB_DocTypeID" runat="server"></asp:Label>
                    </td>
                    <td colspan ="3" align="left">
                        <asp:TextBox ID="TB_DocType" runat="server" Width="99%"></asp:TextBox>
                        <cc1:ModalPopupExtender ID="TB_DocType_ModalPopupExtender" runat="server"
                            Enabled="True" TargetControlID="TB_DocType" PopupControlID="Panel3"
                            CancelControlID="IMBT_Close1" BackgroundCssClass="modalBackground" Y="150">
                        </cc1:ModalPopupExtender>
                    </td>
                </tr>
                <tr>
                     <td  align="left">
                        <asp:Label ID="Label13" runat="server" Text="<%$ Resources:lang,QuanXian%>"></asp:Label>
                    </td>
                                      <td  align="left">
                        <asp:DropDownList ID="DL_Visible" runat="server" DataTextField="HomeName" 
                            DataValueField="GroupName" CssClass="DDList" >
                        </asp:DropDownList>
                    </td>
                    <td  align="left">
                        <asp:Label ID="Label14" runat="server" Text="<%$ Resources:lang,ZuoZhe%>"></asp:Label>
                    </td>
                    <td align="left">
                        <asp:TextBox ID="TB_Author" runat="server" Width="100px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td colspan="4" align="center">
                        <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
                            <ContentTemplate>
                                <div>
                                    <Upload:InputFile ID="AttachFile" runat="server" Width="300px" Height="22px" />
                                    <br />
                                    <br />
                                   <%-- <div id="ProgressBar">
                                        <Upload:ProgressBar ID="ProgressBar1" runat='server' Width="500px" Height="100px">
                                        </Upload:ProgressBar>
                                    </div>--%>
                                </div>
                            </ContentTemplate>
                            <Triggers>
                                <asp:PostBackTrigger ControlID="BtnUP" />
                            </Triggers>
                        </asp:UpdatePanel>
                    </td>
                  
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <asp:Button ID="BtnUP" runat="server" CssClass ="inpuLong" OnClick="BtnUP_Click" Text="<%$ Resources:lang,ShangChuan%>" />
                    </td>
                      <td colspan="2" align="center">
                        <asp:Button ID="BtnClose" runat="server" CssClass="inpuLong" OnClientClick="CloseLayer()" Text="<%$ Resources:lang,GuanBi%>" />
                    </td>
                 </tr>
            </table>
            <input id="txtReturnValue" type="text" runat="server" style="display: none;" />
            <asp:Panel ID="Panel3" runat="server" CssClass="modalPopup" Style="display: none;">
                <div class="modalPopup-text" style="width: 273px; height: 400px; overflow: auto;">
                    <table>
                        <tr>
                            <td style="width: 220px; padding: 5px 5px 5px 5px;" valign="top" align="left">
                                <asp:TreeView ID="TreeView3" runat="server" NodeWrap="True" OnSelectedNodeChanged="TreeView3_SelectedNodeChanged"
                                    ShowLines="True" Width="220px">
                                    <RootNodeStyle CssClass="rootNode" />
                                    <NodeStyle CssClass="treeNode" />
                                    <LeafNodeStyle CssClass="leafNode" />
                                    <SelectedNodeStyle CssClass="selectNode" ForeColor ="Red" />
                                </asp:TreeView>
                            </td>
                            <td style="width: 60px; padding: 5px 5px 5px 5px;" valign="top" align="center">
                                <asp:ImageButton ID="IMBT_Close1" ImageUrl="ImagesSkin/Close4.jpg" runat="server" />
                            </td>
                        </tr>
                    </table>
                </div>
            </asp:Panel>
        </form>
    </center>
</body>
<script type="text/javascript" language="javascript">var cssDirectory = '<%=Session["CssDirectory"] %>'; var oLink = document.getElementById('mainCss'); oLink.href = 'css/' + cssDirectory + '/' + 'bluelightmain.css';</script></html>
