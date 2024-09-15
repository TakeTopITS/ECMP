<%@ Page Language="C#" AutoEventWireup="true"  CodeFile="TakeTopSystemOtherCodeRunPage.aspx.cs" Inherits="TakeTopSystemOtherCodeRunPage" %>
<%--<%@ OutputCache Duration="64800" VaryByParam="*" %>--%>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server" />
     <%--   <asp:Timer ID="Timer1" OnTick="Timer1_Tick" runat="server" Interval="10000" />--%>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
         <%--   <Triggers>
                <asp:AsyncPostBackTrigger ControlID="Timer1" />
            </Triggers>--%>
            <ContentTemplate>
                <div>
                    正在升级！
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
    </form>
</body>
<script type="text/javascript" language="javascript">var cssDirectory = '<%=Session["CssDirectory"] %>'; var oLink = document.getElementById('mainCss'); oLink.href = 'css/' + cssDirectory + '/' + 'bluelightmain.css';</script></html>
