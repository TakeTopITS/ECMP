<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTErrorPage.aspx.cs" Inherits="TTErrorPage" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Õ¯’æ¥ÌŒÛ“≥√Ê</title>    
	<link href="css/BaseCss.css" type="text/css" rel="stylesheet">
</head>
<body><center>
    <form id="form1" runat="server">
		<table cellSpacing="0" cellPadding="0" width="75%" align="center" border="0">
			<TR>
				<TD bgColor="#d8e4f8" colSpan="2" height="4"></TD>
			</TR>
			<tr>
				<td vAlign="top" width="153" bgColor="#eff7f4"><asp:image id="RegisterImage" Runat="server" Width="153"></asp:image></td>
				<TD align="center" bgColor="#ebebff">
					<TABLE cellSpacing="4" cellPadding="0" width="580">
						<TR vAlign="top" height="*">
							<TD colSpan="2" height="148">
								<TABLE cellSpacing="0" cellPadding="4" width="100%" border="0">
									<tr>
										<td><a><b>¥ÌŒÛ“≥:</b></a>&nbsp;&nbsp;<a><font color="red"><%=Request["ErrorUrl"]%></font></a></td>
									</tr>
									<TR>
										<TD>
											<HR noShade SIZE="1">
										</TD>
									</TR>
									<TR>
										<td class="Normal" valign="top">
											<a><b>¥ÌŒÛ–≈œ¢:</b></a>
											<br>
											&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a><font color="red"><%=Request["ErrorMsg"]%></font></a>
										</td>
									</TR>
									<tr>
										<td height="220"></td>
									</tr>
									<tr>
										<td vAlign="middle" align="center" height="80"><asp:button id="BackBtn" runat="server" Width="100" CssClass="ButtonCss" Text="∑µªÿ" OnClick="BackBtn_Click"></asp:button></td>
									</tr>
									<tr>
										<td colspan="2" width="100%">
											<hr size="1">
										</td>
									</tr>
								</TABLE>
							</TD>
						</TR>
					</TABLE>
				</TD>
			</tr>
		</table>
	</form>
</center></body>
<script type="text/javascript" language="javascript">var cssDirectory = '<%=Session["CssDirectory"] %>'; var oLink = document.getElementById('mainCss'); oLink.href = 'css/' + cssDirectory + '/' + 'bluelightmain.css';</script></html>
