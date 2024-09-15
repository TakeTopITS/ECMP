<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTModuleTreeSelectPage.aspx.cs"
    Inherits="TTModuleTreeSelectPage" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title></title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <style type="text/css">
        body
        {
            margin: 0;
            pading: 0;
            text-align: left;
            font-family: Arial, sans-serif, Helvetica, Tahoma;
            font-size: 12px;
            line-height: 1.5;
            color: black;
            background-image: url(img/bg.png);
        }
        
        .modalPopup
        {
            background-color: #EFF3FB;
            border-width: 10px;
            border-style: solid;
            border-color: Gray;
            padding: 3px;
        }
    </style>
    <script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="js/allAHandler.js"></script>
    <script type="text/javascript" language="javascript">
        //选择节点
        function selectNode(nodeName,pageName) {

            parent.selectNode(nodeName,pageName);

            parent.layer.closeAll();
           
        }

        function hideParentDivModuleSelect() {

            parent.window.hideDivModuleSelect();
        }

    </script>
</head>
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
    <form id="form1" runat="server">
    <%--  <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="True" EnableScriptLocalization="True">--%>
    <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="True" EnableScriptLocalization="True">
    </asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div class="modalPopup-text" style="width: 240px; height: 500px; overflow: auto;">
                <table>
                    <tr>
                        <td style="width: 200px; padding: 5px 5px 5px 5px;" valign="top" align="left">
                            <asp:TreeView ID="TreeView1" runat="server" NodeWrap="True" OnSelectedNodeChanged="TreeView1_SelectedNodeChanged"
                                ShowLines="True" Width="100%">
                                <RootNodeStyle CssClass="rootNode" />
                                <NodeStyle CssClass="treeNode" />
                                <LeafNodeStyle CssClass="leafNode" />
                                <SelectedNodeStyle CssClass="selectNode" ForeColor="Red" />
                            </asp:TreeView>
                        </td>
                        <td style="width: 30px; padding: 5px 5px 5px 5px;" valign="top" align="center">
                            <asp:ImageButton ID="IMBT_Close" OnClientClick="javascript:hideParentDivModuleSelect();"
                                ImageUrl="ImagesSkin/Close4.jpg" runat="server" />
                        </td>
                    </tr>
                </table>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
    <div style="position: absolute; left: 40%; top: 80%;">
        <asp:UpdateProgress ID="TakeTopUp" runat="server" AssociatedUpdatePanelID="UpdatePanel1">
            <ProgressTemplate>
                 <img src="Images/Processing.gif" alt="Loading,please wait..." />
            </ProgressTemplate>
        </asp:UpdateProgress>
    </div>
    </form>
</body>
<script type="text/javascript" language="javascript">    var cssDirectory = '<%=Session["CssDirectory"] %>'; var oLink = document.getElementById('mainCss'); oLink.href = 'css/' + cssDirectory + '/' + 'bluelightmain.css';</script>
</html>

<%--***--%>
<%--***--%>
<%--***--%>
