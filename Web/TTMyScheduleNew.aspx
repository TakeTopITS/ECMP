<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTMyScheduleNew.aspx.cs" Inherits="TTMyScheduleNew" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>New Event</title>
    <link id="mainCss" href="css/bluelightmain.css" rel="stylesheet" type="text/css" />
    <link href='../Media/empty.css' type="text/css" rel="stylesheet" />



</head>
<body style="background-color: white; margin: 10px;">
    <form id="form1" runat="server">
        <div>
            <table Width="98%"  border="0" cellspacing="4" cellpadding="0">
                <tr>
                    <td align="right"></td>
                    <td style="text-align: center;">
                        <h2>
                            <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,RiCheng%>"></asp:Label></h2>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,kaishi%>"></asp:Label>
                        :</td>
                    <td>
                        <asp:TextBox ID="TextBoxStart" runat="server" Width="98%" ></asp:TextBox></td>
                </tr>
                <tr>
                    <td align="right">
                        <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,jieshu%>"></asp:Label>
                        :</td>
                    <td>
                        <asp:TextBox ID="TextBoxEnd" runat="server" Width="98%" ></asp:TextBox></td>
                </tr>
                <tr>
                    <td align="right">
                        <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,mingcheng%>"></asp:Label>
                        :</td>
                    <td>
                        <asp:TextBox ID="TextBoxName" TextMode="MultiLine" Width="98%" Height="60px" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td align="right">
                        <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,yanse%>"></asp:Label>
                        : 
                    </td>
                    <td align="left">
                        <asp:RadioButtonList ID="RBColorSelector" runat="server" RepeatDirection="Horizontal">
                            <asp:ListItem Text="&lt;div&gt;&lt;div style='background-color:red;'&gt;&nbsp;&nbsp;&nbsp; &lt;/div&gt; &lt;/div&gt;" Value="red"> </asp:ListItem>
                            <asp:ListItem Text="&lt;div&gt;&lt;div style='background-color:blue;'&gt;&nbsp;&nbsp;&nbsp; &lt;/div&gt; &lt;/div&gt;" Value="blue"></asp:ListItem>
                            <asp:ListItem Text="&lt;div&gt;&lt;div style='background-color:green;'&gt;&nbsp;&nbsp;&nbsp; &lt;/div&gt; &lt;/div&gt;" Value="green"></asp:ListItem>
                            <asp:ListItem Text="&lt;div&gt;&lt;div style='background-color:gold;'&gt;&nbsp;&nbsp;&nbsp; &lt;/div&gt; &lt;/div&gt;" Value="gold"></asp:ListItem>
                            <asp:ListItem Text="&lt;div&gt;&lt;div style='background-color:black;'&gt;&nbsp;&nbsp;&nbsp; &lt;/div&gt; &lt;/div&gt;" Value="black"></asp:ListItem>
                            <asp:ListItem Text="&lt;div&gt;&lt;div style='background-color:white;border:1px solid;'&gt;&nbsp;&nbsp;&nbsp; &lt;/div&gt; &lt;/div&gt;" Value="white" Selected="True"></asp:ListItem>
                        </asp:RadioButtonList>
                        <br />
                    </td>
                </tr>
                <tr>
                    <td align="right"></td>
                    <td>
                        <table width="85%">
                            <tr>
                                <td>
                                    <asp:Button ID="ButtonOK" runat="server" CssClass="inpu" OnClick="ButtonOK_Click" Text="<%$ Resources:lang,baocun%>" /></td>
                                <td align="center">
                                    <asp:Button ID="ButtonCancel" runat="server" CssClass="inpu" OnClick="ButtonCancel_Click" Text="<%$ Resources:lang,quxiao%>" /></td>
                            </tr>
                        </table>

                    </td>
                </tr>
            </table>

        </div>
    </form>

    <script type="text/javascript">
        document.getElementById("TextBoxName").focus();
    </script>

</body>
<script type="text/javascript" language="javascript">var cssDirectory = '<%=Session["CssDirectory"] %>'; var oLink = document.getElementById('mainCss'); oLink.href = 'css/' + cssDirectory + '/' + 'bluelightmain.css';</script>
</html>

