<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTReportDesigner.aspx.cs" Inherits="TTReportDesigner" %>

<%@ Register assembly="Stimulsoft.Report.WebDesign" namespace="Stimulsoft.Report.Web" tagprefix="cc1" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="js/allAHandler.js"></script>
    <script type="text/javascript" language="javascript">
        $(function () {
            if (top.location != self.location) { } else { CloseWebPage(); }
        });
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <span ID ="Span_ConnectString" runat="server">
            </span>

            <cc1:stiwebdesigner runat="server" id="StiMobileDesigner1" 
                oncreatereport="StiMobileDesigner1_CreateReport" onsavereport="StiMobileDesigner1_SaveReport"
                onloadreport="StiMobileDesigner1_GetDataSetOnLoad" ShowPreviewPrintButton="False" ShowExportToPdf="False" />


        </div>
      
    </form>
</body>
<script type="text/javascript" language="javascript">var cssDirectory = '<%=Session["CssDirectory"] %>'; var oLink = document.getElementById('mainCss'); oLink.href = 'css/' + cssDirectory + '/' + 'bluelightmain.css';</script></html>
