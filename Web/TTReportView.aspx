<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTReportView.aspx.cs" Inherits="TTReportView" %>

<%@ Register Namespace="Stimulsoft.Report.Web" TagPrefix="cc1" Assembly="Stimulsoft.Report.Web" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">

        <cc1:StiWebViewer ID="StiWebViewer1" runat="server"
            OnGetReport="StiWebViewer1_GetReport" PrintDestination="Direct"  ShowExportToPdf="False" ></cc1:StiWebViewer>

    </form>
</body>
<script type="text/javascript" language="javascript">var cssDirectory = '<%=Session["CssDirectory"] %>'; var oLink = document.getElementById('mainCss'); oLink.href = 'css/' + cssDirectory + '/' + 'bluelightmain.css';</script></html>
