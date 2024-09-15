<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTPersonalSpaceReportView.aspx.cs" Inherits="TTPersonalSpaceReportView" %>
<%@ Register Namespace="Stimulsoft.Report.Web" TagPrefix="cc1" Assembly="Stimulsoft.Report.Web" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">

        <cc1:StiWebViewer ID="StiWebViewer1" runat="server" ShowToolbar="false"
            OnGetReport="StiWebViewer1_GetReport" ></cc1:StiWebViewer>

    </form>
</body>
<script type="text/javascript" language="javascript">
    var cssDirectory = '<%=Session["CssDirectory"] %>';

    var oLink = document.getElementById('mainCss');
    oLink.href = 'css/' + cssDirectory + '/' + 'bluelightmain.css';

    var oTabLink = document.getElementById('tabCss');
    oTabLink.href = 'css/' + cssDirectory + '/' + 'tab.css';

</script>
</html>
