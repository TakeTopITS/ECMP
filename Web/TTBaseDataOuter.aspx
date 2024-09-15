<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTBaseDataOuter.aspx.cs" Inherits="TTBaseDataOuter" %>

<%@ Register Assembly="NickLee.Web.UI" Namespace="NickLee.Web.UI" TagPrefix="NickLee" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1. Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
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
                                                <table width="345" border="0" align="left" cellpadding="0" cellspacing="0">
                                                    <tr>
                                                        <td width="29">
                                                            <%--<img src="Logo/main_top_l.jpg" alt="" width="29" height="31" />--%>
                                                        </td>
                                                        <td align="center" background="ImagesSkin/main_top_bj.jpg" class="titlezi">
                                                            <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,JiChuShuJu%>"></asp:Label>
                                                            <asp:Label ID="LB_DepartString" runat="server" Visible="false"></asp:Label>
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
                                <td>
                                    <table style="text-align: center;">
                                        <tr>
                                            <td colspan="5" style="background-color: buttonface; text-align: left;"><strong>
                                                <asp:Label ID="Label492256" runat="server" Text="<%$ Resources:lang,RenShiXinZhunLei%>"></asp:Label>

                                            </strong>
                                            </td>
                                            <td style="background-color: buttonface">
                                                <table>
                                                    <tr>
                                                        <td>
                                                            <asp:Label ID="Label94" runat="server" Text="<%$ Resources:lang,TiaoMaLeiXing%>"></asp:Label>
                                                        </td>
                                                        <td>
                                                            <asp:DropDownList ID="DL_BarType" AutoPostBack="true" runat="server" OnSelectedIndexChanged="DL_BarType_SelectedIndexChanged">
                                                                <asp:ListItem Value="BarCode" Text="<%$ Resources:lang,TiaoXingMa%>" />
                                                                <asp:ListItem Value="NoLogoQrCode" Text="<%$ Resources:lang,ErWeiMa%>" />
                                                            </asp:DropDownList>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                            <td style="background-color: buttonface" colspan="2"></td>
                                        </tr>
                                        <tr>
                                            <td colspan="2"><strong>
                                                <div style="display: none;">
                                                    <asp:Label ID="Label492244" runat="server" Text="<%$ Resources:lang,RiChengKeGaiQianZhiTianShu%>"></asp:Label>
                                            </strong>

                                                <br />
                                                <NickLee:NumberBox ID="NB_ScheduleLimitedDays" runat="server" MaxAmount="10" MinAmount="0" Precision="0" Width="50px" Visible="false"></NickLee:NumberBox>
                                                <asp:Button ID="BT_ScheduleLimitedDaysUpdate" runat="server" CssClass="inpu" OnClick="BT_ScheduleLimitedDaysUpdate_Click" Text="<%$ Resources:lang,BaoCun%>" Visible="false" />
                    </div>
                    </td>
                                        <td>
                                            <b>
                                                <asp:Label ID="Label17" runat="server" Text="<%$ Resources:lang,KPILeiXing%>"></asp:Label>
                                            </b></td>
                    <td style="height: 7px;">
                        <strong>
                            <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,JiXiaoQuanZhongSheDing%>"></asp:Label>
                        </strong>
                    </td>
                    <td align="center">
                        <strong>
                            <asp:Label ID="Label43" runat="server" Text="<%$ Resources:lang,ZhiChengSheZhi%>"></asp:Label>
                        </strong>
                    </td>
                    <td align="center">
                        <strong>
                            <asp:Label ID="Label436" runat="server" Text="<%$ Resources:lang,ZhiWuSheZhi%>"></asp:Label>
                        </strong>
                    </td>
                    <td>
                        <strong>
                            <asp:Label ID="Label425" runat="server" Text="<%$ Resources:lang,YongGongLeiXing%>"></asp:Label>
                        </strong>
                    </td>
                    <td>
                        <strong>
                            <asp:Label ID="Label159" runat="server" Text="<%$ Resources:lang,QingJiaLeiXing%>"></asp:Label>
                        </strong>
                    </td>
                    </tr>
                    <tr>
                        <td colspan="2" rowspan="5" width="200px;" align="center">
                            <b>
                                <asp:Label ID="Label93" runat="server" Text="<%$ Resources:lang,MeiZouGongZuoRiSheDing%>"></asp:Label>
                                <br />
                            </b>
                            ( 1,2,3,4,5,6,0 )
                                <br />
                            <asp:Label ID="Label88" runat="server" Text="<%$ Resources:lang,ZhouMoKaiShiRiQi%>"></asp:Label>
                            <br />
                            <NickLee:NumberBox ID="NB_WeekendFirstDay" runat="server" MaxAmount="10" MinAmount="0" Precision="0" Width="50px" Amount="6">6</NickLee:NumberBox>
                            <br />
                            <asp:Label ID="Label89" runat="server" Text="<%$ Resources:lang,ZhouMoJieShuRiQi%>"></asp:Label>
                            <br />
                            <NickLee:NumberBox ID="NB_WeekendSecondDay" runat="server" MaxAmount="10" MinAmount="0" Precision="0" Width="50px"></NickLee:NumberBox>
                            <br />
                            <asp:Label ID="Label90" runat="server" Text="<%$ Resources:lang,ZhouMoShiHouGongZuoRi%>"></asp:Label>
                            <br />
                            <asp:DropDownList ID="DL_WeekendsAreWorkdays" runat="server">
                                <asp:ListItem Value="false" Text="NO"></asp:ListItem>
                                <asp:ListItem Value="true" Text="YES"></asp:ListItem>
                            </asp:DropDownList>
                            <br />
                            <asp:Button ID="BT_UpdateWeekendFirstDay" runat="server" CssClass="inpu" Text="<%$ Resources:lang,BaoCun%>" OnClick="BT_WorkingDayRuleUpdate_Click" />
                            <br />
                            <br />
                            <b>
                                <asp:Label ID="Label492245" runat="server" Text="<%$ Resources:lang,YiTianShangBanShiJianShu%>"></asp:Label></b>
                            <br />
                            <table>
                                <tr>
                                    <td>
                                        <asp:Label ID="Label492246" runat="server" Text="<%$ Resources:lang,KaiShiShiJian%>"></asp:Label></td>
                                    <td>
                                        <asp:DropDownList ID="DL_StartHour" runat="server">
                                            <asp:ListItem>00</asp:ListItem>
                                            <asp:ListItem>01</asp:ListItem>
                                            <asp:ListItem>02</asp:ListItem>
                                            <asp:ListItem>03</asp:ListItem>
                                            <asp:ListItem>04</asp:ListItem>
                                            <asp:ListItem>05</asp:ListItem>
                                            <asp:ListItem>06</asp:ListItem>
                                            <asp:ListItem>07</asp:ListItem>
                                            <asp:ListItem>08</asp:ListItem>
                                            <asp:ListItem>09</asp:ListItem>
                                            <asp:ListItem>10</asp:ListItem>
                                            <asp:ListItem>11</asp:ListItem>
                                            <asp:ListItem>12</asp:ListItem>
                                            <asp:ListItem>13</asp:ListItem>
                                            <asp:ListItem>14</asp:ListItem>
                                            <asp:ListItem>15</asp:ListItem>
                                            <asp:ListItem>16</asp:ListItem>
                                            <asp:ListItem>17</asp:ListItem>
                                            <asp:ListItem>18</asp:ListItem>
                                            <asp:ListItem>19</asp:ListItem>
                                            <asp:ListItem>20</asp:ListItem>
                                            <asp:ListItem>21</asp:ListItem>
                                            <asp:ListItem>22</asp:ListItem>
                                            <asp:ListItem>23</asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                    <td>:<asp:DropDownList ID="DL_StartMin" runat="server">
                                        <asp:ListItem>00</asp:ListItem>
                                        <asp:ListItem>01</asp:ListItem>
                                        <asp:ListItem>02</asp:ListItem>
                                        <asp:ListItem>03</asp:ListItem>
                                        <asp:ListItem>04</asp:ListItem>
                                        <asp:ListItem>05</asp:ListItem>
                                        <asp:ListItem>06</asp:ListItem>
                                        <asp:ListItem>07</asp:ListItem>
                                        <asp:ListItem>08</asp:ListItem>
                                        <asp:ListItem>09</asp:ListItem>
                                        <asp:ListItem>10</asp:ListItem>
                                        <asp:ListItem>11</asp:ListItem>
                                        <asp:ListItem>12</asp:ListItem>
                                        <asp:ListItem>13</asp:ListItem>
                                        <asp:ListItem>14</asp:ListItem>
                                        <asp:ListItem>15</asp:ListItem>
                                        <asp:ListItem>16</asp:ListItem>
                                        <asp:ListItem>17</asp:ListItem>
                                        <asp:ListItem>18</asp:ListItem>
                                        <asp:ListItem>19</asp:ListItem>
                                        <asp:ListItem>20</asp:ListItem>
                                        <asp:ListItem>21</asp:ListItem>
                                        <asp:ListItem>22</asp:ListItem>
                                        <asp:ListItem>23</asp:ListItem>
                                        <asp:ListItem>24</asp:ListItem>
                                        <asp:ListItem>25</asp:ListItem>
                                        <asp:ListItem>26</asp:ListItem>
                                        <asp:ListItem>27</asp:ListItem>
                                        <asp:ListItem>28</asp:ListItem>
                                        <asp:ListItem>29</asp:ListItem>
                                        <asp:ListItem>30</asp:ListItem>
                                        <asp:ListItem>31</asp:ListItem>
                                        <asp:ListItem>32</asp:ListItem>
                                        <asp:ListItem>33</asp:ListItem>
                                        <asp:ListItem>34</asp:ListItem>
                                        <asp:ListItem>35</asp:ListItem>
                                        <asp:ListItem>36</asp:ListItem>
                                        <asp:ListItem>37</asp:ListItem>
                                        <asp:ListItem>38</asp:ListItem>
                                        <asp:ListItem>39</asp:ListItem>
                                        <asp:ListItem>40</asp:ListItem>
                                        <asp:ListItem>41</asp:ListItem>
                                        <asp:ListItem>42</asp:ListItem>
                                        <asp:ListItem>43</asp:ListItem>
                                        <asp:ListItem>44</asp:ListItem>
                                        <asp:ListItem>45</asp:ListItem>
                                        <asp:ListItem>46</asp:ListItem>
                                        <asp:ListItem>47</asp:ListItem>
                                        <asp:ListItem>48</asp:ListItem>
                                        <asp:ListItem>49</asp:ListItem>
                                        <asp:ListItem>50</asp:ListItem>
                                        <asp:ListItem>51</asp:ListItem>
                                        <asp:ListItem>52</asp:ListItem>
                                        <asp:ListItem>53</asp:ListItem>
                                        <asp:ListItem>54</asp:ListItem>
                                        <asp:ListItem>55</asp:ListItem>
                                        <asp:ListItem>56</asp:ListItem>
                                        <asp:ListItem>57</asp:ListItem>
                                        <asp:ListItem>58</asp:ListItem>
                                        <asp:ListItem>59</asp:ListItem>
                                    </asp:DropDownList></td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="Label492247" runat="server" Text="<%$ Resources:lang,JieShuShiJian%>"></asp:Label></td>
                                    <td>
                                        <asp:DropDownList ID="DL_EndHour" runat="server">
                                            <asp:ListItem>00</asp:ListItem>
                                            <asp:ListItem>01</asp:ListItem>
                                            <asp:ListItem>02</asp:ListItem>
                                            <asp:ListItem>03</asp:ListItem>
                                            <asp:ListItem>04</asp:ListItem>
                                            <asp:ListItem>05</asp:ListItem>
                                            <asp:ListItem>06</asp:ListItem>
                                            <asp:ListItem>07</asp:ListItem>
                                            <asp:ListItem>08</asp:ListItem>
                                            <asp:ListItem>09</asp:ListItem>
                                            <asp:ListItem>10</asp:ListItem>
                                            <asp:ListItem>11</asp:ListItem>
                                            <asp:ListItem>12</asp:ListItem>
                                            <asp:ListItem>13</asp:ListItem>
                                            <asp:ListItem>14</asp:ListItem>
                                            <asp:ListItem>15</asp:ListItem>
                                            <asp:ListItem>16</asp:ListItem>
                                            <asp:ListItem>17</asp:ListItem>
                                            <asp:ListItem>18</asp:ListItem>
                                            <asp:ListItem>19</asp:ListItem>
                                            <asp:ListItem>20</asp:ListItem>
                                            <asp:ListItem>21</asp:ListItem>
                                            <asp:ListItem>22</asp:ListItem>
                                            <asp:ListItem>23</asp:ListItem>
                                        </asp:DropDownList></td>
                                    <td>:<asp:DropDownList ID="DL_EndMin" runat="server">
                                        <asp:ListItem>00</asp:ListItem>
                                        <asp:ListItem>01</asp:ListItem>
                                        <asp:ListItem>02</asp:ListItem>
                                        <asp:ListItem>03</asp:ListItem>
                                        <asp:ListItem>04</asp:ListItem>
                                        <asp:ListItem>05</asp:ListItem>
                                        <asp:ListItem>06</asp:ListItem>
                                        <asp:ListItem>07</asp:ListItem>
                                        <asp:ListItem>08</asp:ListItem>
                                        <asp:ListItem>09</asp:ListItem>
                                        <asp:ListItem>10</asp:ListItem>
                                        <asp:ListItem>11</asp:ListItem>
                                        <asp:ListItem>12</asp:ListItem>
                                        <asp:ListItem>13</asp:ListItem>
                                        <asp:ListItem>14</asp:ListItem>
                                        <asp:ListItem>15</asp:ListItem>
                                        <asp:ListItem>16</asp:ListItem>
                                        <asp:ListItem>17</asp:ListItem>
                                        <asp:ListItem>18</asp:ListItem>
                                        <asp:ListItem>19</asp:ListItem>
                                        <asp:ListItem>20</asp:ListItem>
                                        <asp:ListItem>21</asp:ListItem>
                                        <asp:ListItem>22</asp:ListItem>
                                        <asp:ListItem>23</asp:ListItem>
                                        <asp:ListItem>24</asp:ListItem>
                                        <asp:ListItem>25</asp:ListItem>
                                        <asp:ListItem>26</asp:ListItem>
                                        <asp:ListItem>27</asp:ListItem>
                                        <asp:ListItem>28</asp:ListItem>
                                        <asp:ListItem>29</asp:ListItem>
                                        <asp:ListItem>30</asp:ListItem>
                                        <asp:ListItem>31</asp:ListItem>
                                        <asp:ListItem>32</asp:ListItem>
                                        <asp:ListItem>33</asp:ListItem>
                                        <asp:ListItem>34</asp:ListItem>
                                        <asp:ListItem>35</asp:ListItem>
                                        <asp:ListItem>36</asp:ListItem>
                                        <asp:ListItem>37</asp:ListItem>
                                        <asp:ListItem>38</asp:ListItem>
                                        <asp:ListItem>39</asp:ListItem>
                                        <asp:ListItem>40</asp:ListItem>
                                        <asp:ListItem>41</asp:ListItem>
                                        <asp:ListItem>42</asp:ListItem>
                                        <asp:ListItem>43</asp:ListItem>
                                        <asp:ListItem>44</asp:ListItem>
                                        <asp:ListItem>45</asp:ListItem>
                                        <asp:ListItem>46</asp:ListItem>
                                        <asp:ListItem>47</asp:ListItem>
                                        <asp:ListItem>48</asp:ListItem>
                                        <asp:ListItem>49</asp:ListItem>
                                        <asp:ListItem>50</asp:ListItem>
                                        <asp:ListItem>51</asp:ListItem>
                                        <asp:ListItem>52</asp:ListItem>
                                        <asp:ListItem>53</asp:ListItem>
                                        <asp:ListItem>54</asp:ListItem>
                                        <asp:ListItem>55</asp:ListItem>
                                        <asp:ListItem>56</asp:ListItem>
                                        <asp:ListItem>57</asp:ListItem>
                                        <asp:ListItem>58</asp:ListItem>
                                        <asp:ListItem>59</asp:ListItem>
                                    </asp:DropDownList></td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="Label492248" runat="server" Text="<%$ Resources:lang,XiuXiShiJianYi%>"></asp:Label></td>
                                    <td>
                                        <asp:DropDownList ID="DL_RestStartTimeHour" runat="server">
                                            <asp:ListItem>00</asp:ListItem>
                                            <asp:ListItem>01</asp:ListItem>
                                            <asp:ListItem>02</asp:ListItem>
                                            <asp:ListItem>03</asp:ListItem>
                                            <asp:ListItem>04</asp:ListItem>
                                            <asp:ListItem>05</asp:ListItem>
                                            <asp:ListItem>06</asp:ListItem>
                                            <asp:ListItem>07</asp:ListItem>
                                            <asp:ListItem>08</asp:ListItem>
                                            <asp:ListItem>09</asp:ListItem>
                                            <asp:ListItem>10</asp:ListItem>
                                            <asp:ListItem>11</asp:ListItem>
                                            <asp:ListItem>12</asp:ListItem>
                                            <asp:ListItem>13</asp:ListItem>
                                            <asp:ListItem>14</asp:ListItem>
                                            <asp:ListItem>15</asp:ListItem>
                                            <asp:ListItem>16</asp:ListItem>
                                            <asp:ListItem>17</asp:ListItem>
                                            <asp:ListItem>18</asp:ListItem>
                                            <asp:ListItem>19</asp:ListItem>
                                            <asp:ListItem>20</asp:ListItem>
                                            <asp:ListItem>21</asp:ListItem>
                                            <asp:ListItem>22</asp:ListItem>
                                            <asp:ListItem>23</asp:ListItem>
                                        </asp:DropDownList></td>
                                    <td>:<asp:DropDownList ID="DL_RestStartTimeMin" runat="server">
                                        <asp:ListItem>00</asp:ListItem>
                                        <asp:ListItem>01</asp:ListItem>
                                        <asp:ListItem>02</asp:ListItem>
                                        <asp:ListItem>03</asp:ListItem>
                                        <asp:ListItem>04</asp:ListItem>
                                        <asp:ListItem>05</asp:ListItem>
                                        <asp:ListItem>06</asp:ListItem>
                                        <asp:ListItem>07</asp:ListItem>
                                        <asp:ListItem>08</asp:ListItem>
                                        <asp:ListItem>09</asp:ListItem>
                                        <asp:ListItem>10</asp:ListItem>
                                        <asp:ListItem>11</asp:ListItem>
                                        <asp:ListItem>12</asp:ListItem>
                                        <asp:ListItem>13</asp:ListItem>
                                        <asp:ListItem>14</asp:ListItem>
                                        <asp:ListItem>15</asp:ListItem>
                                        <asp:ListItem>16</asp:ListItem>
                                        <asp:ListItem>17</asp:ListItem>
                                        <asp:ListItem>18</asp:ListItem>
                                        <asp:ListItem>19</asp:ListItem>
                                        <asp:ListItem>20</asp:ListItem>
                                        <asp:ListItem>21</asp:ListItem>
                                        <asp:ListItem>22</asp:ListItem>
                                        <asp:ListItem>23</asp:ListItem>
                                        <asp:ListItem>24</asp:ListItem>
                                        <asp:ListItem>25</asp:ListItem>
                                        <asp:ListItem>26</asp:ListItem>
                                        <asp:ListItem>27</asp:ListItem>
                                        <asp:ListItem>28</asp:ListItem>
                                        <asp:ListItem>29</asp:ListItem>
                                        <asp:ListItem>30</asp:ListItem>
                                        <asp:ListItem>31</asp:ListItem>
                                        <asp:ListItem>32</asp:ListItem>
                                        <asp:ListItem>33</asp:ListItem>
                                        <asp:ListItem>34</asp:ListItem>
                                        <asp:ListItem>35</asp:ListItem>
                                        <asp:ListItem>36</asp:ListItem>
                                        <asp:ListItem>37</asp:ListItem>
                                        <asp:ListItem>38</asp:ListItem>
                                        <asp:ListItem>39</asp:ListItem>
                                        <asp:ListItem>40</asp:ListItem>
                                        <asp:ListItem>41</asp:ListItem>
                                        <asp:ListItem>42</asp:ListItem>
                                        <asp:ListItem>43</asp:ListItem>
                                        <asp:ListItem>44</asp:ListItem>
                                        <asp:ListItem>45</asp:ListItem>
                                        <asp:ListItem>46</asp:ListItem>
                                        <asp:ListItem>47</asp:ListItem>
                                        <asp:ListItem>48</asp:ListItem>
                                        <asp:ListItem>49</asp:ListItem>
                                        <asp:ListItem>50</asp:ListItem>
                                        <asp:ListItem>51</asp:ListItem>
                                        <asp:ListItem>52</asp:ListItem>
                                        <asp:ListItem>53</asp:ListItem>
                                        <asp:ListItem>54</asp:ListItem>
                                        <asp:ListItem>55</asp:ListItem>
                                        <asp:ListItem>56</asp:ListItem>
                                        <asp:ListItem>57</asp:ListItem>
                                        <asp:ListItem>58</asp:ListItem>
                                        <asp:ListItem>59</asp:ListItem>
                                    </asp:DropDownList></td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="Label492249" runat="server" Text="<%$ Resources:lang,XiuXiShiJianEr%>"></asp:Label></td>
                                    <td>
                                        <asp:DropDownList ID="DL_RestEndTimeHour" runat="server">
                                            <asp:ListItem>00</asp:ListItem>
                                            <asp:ListItem>01</asp:ListItem>
                                            <asp:ListItem>02</asp:ListItem>
                                            <asp:ListItem>03</asp:ListItem>
                                            <asp:ListItem>04</asp:ListItem>
                                            <asp:ListItem>05</asp:ListItem>
                                            <asp:ListItem>06</asp:ListItem>
                                            <asp:ListItem>07</asp:ListItem>
                                            <asp:ListItem>08</asp:ListItem>
                                            <asp:ListItem>09</asp:ListItem>
                                            <asp:ListItem>10</asp:ListItem>
                                            <asp:ListItem>11</asp:ListItem>
                                            <asp:ListItem>12</asp:ListItem>
                                            <asp:ListItem>13</asp:ListItem>
                                            <asp:ListItem>14</asp:ListItem>
                                            <asp:ListItem>15</asp:ListItem>
                                            <asp:ListItem>16</asp:ListItem>
                                            <asp:ListItem>17</asp:ListItem>
                                            <asp:ListItem>18</asp:ListItem>
                                            <asp:ListItem>19</asp:ListItem>
                                            <asp:ListItem>20</asp:ListItem>
                                            <asp:ListItem>21</asp:ListItem>
                                            <asp:ListItem>22</asp:ListItem>
                                            <asp:ListItem>23</asp:ListItem>
                                        </asp:DropDownList></td>
                                    <td>:<asp:DropDownList ID="DL_RestEndTimeMin" runat="server">
                                        <asp:ListItem>00</asp:ListItem>
                                        <asp:ListItem>01</asp:ListItem>
                                        <asp:ListItem>02</asp:ListItem>
                                        <asp:ListItem>03</asp:ListItem>
                                        <asp:ListItem>04</asp:ListItem>
                                        <asp:ListItem>05</asp:ListItem>
                                        <asp:ListItem>06</asp:ListItem>
                                        <asp:ListItem>07</asp:ListItem>
                                        <asp:ListItem>08</asp:ListItem>
                                        <asp:ListItem>09</asp:ListItem>
                                        <asp:ListItem>10</asp:ListItem>
                                        <asp:ListItem>11</asp:ListItem>
                                        <asp:ListItem>12</asp:ListItem>
                                        <asp:ListItem>13</asp:ListItem>
                                        <asp:ListItem>14</asp:ListItem>
                                        <asp:ListItem>15</asp:ListItem>
                                        <asp:ListItem>16</asp:ListItem>
                                        <asp:ListItem>17</asp:ListItem>
                                        <asp:ListItem>18</asp:ListItem>
                                        <asp:ListItem>19</asp:ListItem>
                                        <asp:ListItem>20</asp:ListItem>
                                        <asp:ListItem>21</asp:ListItem>
                                        <asp:ListItem>22</asp:ListItem>
                                        <asp:ListItem>23</asp:ListItem>
                                        <asp:ListItem>24</asp:ListItem>
                                        <asp:ListItem>25</asp:ListItem>
                                        <asp:ListItem>26</asp:ListItem>
                                        <asp:ListItem>27</asp:ListItem>
                                        <asp:ListItem>28</asp:ListItem>
                                        <asp:ListItem>29</asp:ListItem>
                                        <asp:ListItem>30</asp:ListItem>
                                        <asp:ListItem>31</asp:ListItem>
                                        <asp:ListItem>32</asp:ListItem>
                                        <asp:ListItem>33</asp:ListItem>
                                        <asp:ListItem>34</asp:ListItem>
                                        <asp:ListItem>35</asp:ListItem>
                                        <asp:ListItem>36</asp:ListItem>
                                        <asp:ListItem>37</asp:ListItem>
                                        <asp:ListItem>38</asp:ListItem>
                                        <asp:ListItem>39</asp:ListItem>
                                        <asp:ListItem>40</asp:ListItem>
                                        <asp:ListItem>41</asp:ListItem>
                                        <asp:ListItem>42</asp:ListItem>
                                        <asp:ListItem>43</asp:ListItem>
                                        <asp:ListItem>44</asp:ListItem>
                                        <asp:ListItem>45</asp:ListItem>
                                        <asp:ListItem>46</asp:ListItem>
                                        <asp:ListItem>47</asp:ListItem>
                                        <asp:ListItem>48</asp:ListItem>
                                        <asp:ListItem>49</asp:ListItem>
                                        <asp:ListItem>50</asp:ListItem>
                                        <asp:ListItem>51</asp:ListItem>
                                        <asp:ListItem>52</asp:ListItem>
                                        <asp:ListItem>53</asp:ListItem>
                                        <asp:ListItem>54</asp:ListItem>
                                        <asp:ListItem>55</asp:ListItem>
                                        <asp:ListItem>56</asp:ListItem>
                                        <asp:ListItem>57</asp:ListItem>
                                        <asp:ListItem>58</asp:ListItem>
                                        <asp:ListItem>59</asp:ListItem>
                                    </asp:DropDownList></td>
                                </tr>
                            </table>

                            <br />
                            <asp:Label ID="Label492250" runat="server" Text="<%$ Resources:lang,GongZuoShiJian%>"></asp:Label>
                            <asp:TextBox ID="TB_HourNum" runat="server" Width="85px">8</asp:TextBox>
                            <br />
                            <br />
                            <asp:Button ID="BT_DayHourNum" runat="server" CssClass="inpu" OnClick="BT_DayHourNum_Click" Text="<%$ Resources:lang,BaoCun%>" />
                            <br />
                            <asp:Label ID="lbl_DayHourNumID" runat="server" Visible="False"></asp:Label>


                        </td>

                        <td valign="top" rowspan="5" align="center">
                            <table background="ImagesSkin/main_n_bj.jpg" border="0" cellpadding="0" cellspacing="0" width="98%">
                                <tr>
                                    <td width="7">
                                        <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" />
                                    </td>
                                    <td>
                                        <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                            <tr>
                                                <td align="center" width="60%"><strong>
                                                    <asp:Label ID="Label111" runat="server" Text="<%$ Resources:lang,LeiXing%>"></asp:Label>
                                                </strong></td>
                                                <td align="center" width="40%"><strong>
                                                    <asp:Label ID="Label112" runat="server" Text="<%$ Resources:lang,ShunXu%>"></asp:Label>
                                                </strong></td>
                                            </tr>
                                        </table>
                                    </td>
                                    <td align="right" width="6">
                                        <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" />
                                    </td>
                                </tr>
                            </table>
                            <asp:DataGrid ID="DataGrid30" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" OnItemCommand="DataGrid30_ItemCommand" ShowHeader="false" Width="98%">
                                <FooterStyle BackColor="#57CD1" Font-Bold="True" ForeColor="White" />
                                <EditItemStyle BackColor="#2461BF" />
                                <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                <PagerStyle CssClass="notTab" HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" />
                                <ItemStyle CssClass="itemStyle" />
                                <Columns>
                                    <asp:TemplateColumn HeaderText="名称">
                                        <ItemTemplate>
                                            <asp:Button ID="BT_KPIType" runat="server" CssClass="inpu" Text='<%# DataBinder.Eval(Container.DataItem,"Type") %>' />
                                        </ItemTemplate>
                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="60%" />
                                    </asp:TemplateColumn>
                                    <asp:BoundColumn DataField="SortNumber" HeaderText="顺序">
                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="40%" />
                                    </asp:BoundColumn>
                                </Columns>
                                <HeaderStyle BackColor="#57CD1" Font-Bold="True" ForeColor="White" />
                            </asp:DataGrid>
                            <div style="width: 200px;">
                                <asp:Label ID="Label492216" runat="server" Text="<%$ Resources:lang,LeiXing%>"></asp:Label>
                                <asp:TextBox ID="TB_KPIType" runat="server" Width="130"></asp:TextBox>
                            </div>
                            <div style="width: 200px;">
                                <asp:Label ID="Label492217" runat="server" Text="<%$ Resources:lang,ShunXu%>"></asp:Label>
                                <asp:TextBox ID="TB_KPITypeSort" runat="server" Width="130"></asp:TextBox>
                            </div>
                            &nbsp; &nbsp;<br />
                            <asp:Button ID="BT_AddKPIType" runat="server" CssClass="inpu" OnClick="BT_AddKPIType_Click" Text="<%$ Resources:lang,XinZeng%>" />
                            <asp:Button ID="BT_DeleteKPIType0" runat="server" CssClass="inpu" OnClick="BT_DeleteKPIType_Click" Text="<%$ Resources:lang,ShanChu%>" />
                        </td>
                        <td valign="top" align="center">
                            <table background="ImagesSkin/main_n_bj.jpg" border="0" cellpadding="0" cellspacing="0" width="98%">
                                <tr>
                                    <td width="7">
                                        <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" />
                                    </td>
                                    <td>&nbsp;</td>
                                    <td align="right" width="6">
                                        <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" />
                                    </td>
                                </tr>
                            </table>
                            <table>
                                <tr>
                                    <td>
                                        <div style="width: 100px;">
                                            <asp:Label ID="Label9" runat="server" Text="<%$ Resources:lang,ZiPingQuanZhong%>"></asp:Label>
                                        </div>
                                    </td>
                                    <td>
                                        <NickLee:NumberBox ID="NB_KPISelfCheckWeight" runat="server" MaxAmount="10" MinAmount="0" Width="50px">.</NickLee:NumberBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="Label22221" runat="server" Text="<%$ Resources:lang,LingDaoQuanPingZhong%>"></asp:Label>
                                    </td>
                                    <td>
                                        <NickLee:NumberBox ID="NB_KPILeaderCheckWeight" runat="server" MaxAmount="10" MinAmount="0" Width="50px">.</NickLee:NumberBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="Label11" runat="server" Text="<%$ Resources:lang,DiSanFangPingQuanZhong%>"></asp:Label>
                                    </td>
                                    <td>
                                        <NickLee:NumberBox ID="NB_KPIThirdPartCheckWeight" runat="server" MaxAmount="10" MinAmount="0" Width="50px">.</NickLee:NumberBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="Label12" runat="server" Text="<%$ Resources:lang,XiTongPingQuanZhong%>"></asp:Label>
                                    </td>
                                    <td>
                                        <NickLee:NumberBox ID="NB_KPISqlCheckWeight" runat="server" MaxAmount="10" MinAmount="0" Width="50px">.</NickLee:NumberBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="Label13" runat="server" Text="<%$ Resources:lang,RenShiPingQuanZhong%>"></asp:Label>
                                    </td>
                                    <td>
                                        <NickLee:NumberBox ID="NB_KPIHRCheckWeight" runat="server" MaxAmount="10" MinAmount="0" Width="50px">.</NickLee:NumberBox>
                                    </td>
                                </tr>
                            </table>
                            <br />
                            <br />
                            <asp:Button ID="BT_KPICheckWeight" runat="server" CssClass="inpu" OnClick="BT_KPICheckWeight_Click" Text="<%$ Resources:lang,BaoCun%>" />
                        </td>
                        <td rowspan="5" align="center">
                            <table background="ImagesSkin/main_n_bj.jpg" cellpadding="0" cellspacing="0" width="100%">
                                <tr>
                                    <td width="7">
                                        <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" />
                                    </td>
                                    <td>
                                        <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                            <tr>
                                                <td align="center" width="20%"><strong>
                                                    <asp:Label ID="Label431" runat="server" Text="<%$ Resources:lang,XuHao%>"></asp:Label>
                                                </strong></td>
                                                <td align="center" width="60%"><strong>
                                                    <asp:Label ID="Label432" runat="server" Text="<%$ Resources:lang,ZhiCheng%>"></asp:Label>
                                                </strong></td>
                                                <td align="center" width="20%"><strong>
                                                    <asp:Label ID="Label433" runat="server" Text="<%$ Resources:lang,ShunXu%>"></asp:Label>
                                                </strong></td>
                                            </tr>
                                        </table>
                                    </td>
                                    <td align="right" width="6">
                                        <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" />
                                    </td>
                                </tr>
                            </table>
                            <asp:DataGrid ID="DataGrid40" runat="server" AutoGenerateColumns="False" GridLines="None" OnItemCommand="DataGrid40_ItemCommand" ShowHeader="False" Width="100%">
                                <FooterStyle BackColor="#57CD1" Font-Bold="True" ForeColor="White" />
                                <EditItemStyle BackColor="#2461BF" />
                                <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                <PagerStyle CssClass="notTab" HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" />
                                <ItemStyle CssClass="itemStyle" />
                                <Columns>
                                    <asp:TemplateColumn HeaderText="序号">
                                        <ItemTemplate>
                                            <asp:Button ID="BT_PositionID" runat="server" CssClass="inpu" Text='<%# DataBinder.Eval(Container.DataItem,"ID") %>' />
                                        </ItemTemplate>
                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="20%" />
                                    </asp:TemplateColumn>
                                    <asp:BoundColumn DataField="Position" HeaderText="职称">
                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="60%" />
                                    </asp:BoundColumn>
                                    <asp:BoundColumn DataField="SortNumber" HeaderText="顺序">
                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="20%" />
                                    </asp:BoundColumn>
                                </Columns>
                            </asp:DataGrid>
                            <div style="width: 200px;">
                                <asp:Label ID="Label492220" runat="server" Text="<%$ Resources:lang,ZhiCheng%>"></asp:Label>
                                <asp:TextBox ID="TB_Position" runat="server" Width="150"></asp:TextBox>
                            </div>
                            <div style="width: 200px;">
                                <asp:Label ID="Label492221" runat="server" Text="<%$ Resources:lang,ShunXu%>"></asp:Label>
                                <asp:TextBox ID="TB_DepartPositionSort" runat="server" Width="150"></asp:TextBox>
                            </div>
                            <asp:Label ID="LB_PositionID" runat="server" Visible="false"></asp:Label>
                            <br />
                            <asp:Button ID="BT_NewPosition" runat="server" CssClass="inpu" OnClick="BT_NewPosition_Click" Text="<%$ Resources:lang,XinZeng%>" />
                            <asp:Button ID="BT_UpdatePosition" runat="server" CssClass="inpu" Enabled="False" OnClick="BT_UpdatePosition_Click" Text="<%$ Resources:lang,BaoCun%>" />
                            <asp:Button ID="BT_DeletePosition" runat="server" CssClass="inpu" Enabled="False" OnClick="BT_DeletePosition_Click" Text="<%$ Resources:lang,ShanChu%>" />
                        </td>
                        <td align="center" rowspan="5">
                            <table background="ImagesSkin/main_n_bj.jpg" cellpadding="0" cellspacing="0" width="100%">
                                <tr>
                                    <td width="7">
                                        <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" />
                                    </td>
                                    <td>
                                        <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                            <tr>
                                                <td align="center" width="60%"><strong>
                                                    <asp:Label ID="Label437" runat="server" Text="<%$ Resources:lang,ZhiWu%>"></asp:Label>
                                                </strong></td>
                                                <td align="center" width="20%"><strong>
                                                    <asp:Label ID="Label438" runat="server" Text="<%$ Resources:lang,GuanJianZi%>"></asp:Label>
                                                </strong></td>
                                                <td align="center" width="20%"><strong>
                                                    <asp:Label ID="Label439" runat="server" Text="<%$ Resources:lang,ShunXu%>"></asp:Label>
                                                </strong></td>
                                            </tr>
                                        </table>
                                    </td>
                                    <td align="right" width="6">
                                        <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" />
                                    </td>
                                </tr>
                            </table>
                            <asp:DataGrid ID="DataGrid1" runat="server" AutoGenerateColumns="False" GridLines="None" OnItemCommand="DataGrid1_ItemCommand" ShowHeader="False" Width="100%">
                                <FooterStyle BackColor="#57CD1" Font-Bold="True" ForeColor="White" />
                                <EditItemStyle BackColor="#2461BF" />
                                <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                <PagerStyle CssClass="notTab" HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" />
                                <ItemStyle CssClass="itemStyle" />
                                <Columns>
                                    <asp:TemplateColumn HeaderText="职务">
                                        <ItemTemplate>
                                            <asp:Button ID="BT_Duty" runat="server" CssClass="inpu" Text='<%# DataBinder.Eval(Container.DataItem,"Duty") %>' />
                                        </ItemTemplate>
                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="60%" />
                                    </asp:TemplateColumn>
                                    <asp:BoundColumn DataField="KeyWord" HeaderText="关键字">
                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="20%" />
                                    </asp:BoundColumn>
                                    <asp:BoundColumn DataField="SortNumber" HeaderText="顺序">
                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="20%" />
                                    </asp:BoundColumn>
                                </Columns>
                            </asp:DataGrid>
                            <div style="width: 200px;">
                                <asp:Label ID="Label44" runat="server" Text="<%$ Resources:lang,ZhiWu%>"></asp:Label>
                                <asp:TextBox ID="TB_Duty" runat="server"></asp:TextBox>
                                <asp:Label ID="LB_Duty_Backup" runat="server" Visible="false"></asp:Label>
                            </div>
                            <div class="auto-style1">
                                <asp:Label ID="Label441" runat="server" Text="<%$ Resources:lang,GuanJian%>"></asp:Label>
                                <asp:TextBox ID="TB_DutyKeyWord" runat="server"></asp:TextBox>
                                <asp:Label ID="LB_DutyKeyWord_Backup" runat="server" Visible="false"></asp:Label>
                            </div>
                            <div style="width: 200px;">
                                <asp:Label ID="Label442" runat="server" Text="<%$ Resources:lang,ShunXu%>"></asp:Label>
                                <asp:TextBox ID="TB_DutySort" runat="server"></asp:TextBox>
                            </div>
                            &nbsp;<br />
                            <asp:Button ID="BT_NewDuty" runat="server" CssClass="inpu" OnClick="BT_NewDuty_Click" Text="<%$ Resources:lang,XinZeng%>" />
                            <asp:Button ID="BT_UpdateDuty" runat="server" CssClass="inpu" Enabled="False" OnClick="BT_UpdateDuty_Click" Text="<%$ Resources:lang,BaoCun%>" />
                            <asp:Button ID="BT_DeleteDuty" runat="server" CssClass="inpu" Enabled="False" OnClick="BT_DeleteDuty_Click" Text="<%$ Resources:lang,ShanChu%>" />
                        </td>
                        <td rowspan="5" align="center">
                            <table background="ImagesSkin/main_n_bj.jpg" border="0" cellpadding="0" cellspacing="0" width="98%">
                                <tr>
                                    <td>
                                        <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                            <tr>
                                                <td align="center" width="60%"><strong>
                                                    <asp:Label ID="Label426" runat="server" Text="<%$ Resources:lang,LeiXingMingCheng%>"></asp:Label>
                                                </strong></td>
                                                <td align="center" width="40%"><strong>
                                                    <asp:Label ID="Label427" runat="server" Text="<%$ Resources:lang,PaiXu%>"></asp:Label>
                                                </strong></td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            </table>
                            <asp:DataGrid ID="DataGrid34" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" OnItemCommand="DataGrid34_ItemCommand" ShowHeader="false" Width="98%">
                                <FooterStyle BackColor="#57CD1" Font-Bold="True" ForeColor="White" />
                                <EditItemStyle BackColor="#2461BF" />
                                <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                <PagerStyle CssClass="notTab" HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" />
                                <ItemStyle CssClass="itemStyle" />
                                <Columns>
                                    <asp:TemplateColumn HeaderText="类型名称">
                                        <ItemTemplate>
                                            <asp:Button ID="BT_TypeName" runat="server" CssClass="inpu" Text='<%# DataBinder.Eval(Container.DataItem,"TypeName").ToString().Trim() %>' />
                                        </ItemTemplate>
                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="60%" />
                                    </asp:TemplateColumn>
                                    <asp:BoundColumn DataField="SortNo" HeaderText="排序">
                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="40%" />
                                    </asp:BoundColumn>
                                </Columns>
                            </asp:DataGrid>
                            <div style="width: 200px;">
                                <asp:Label ID="Label428" runat="server" Text="<%$ Resources:lang,LeiXing%>"></asp:Label>
                                <asp:TextBox ID="TB_TypeName" runat="server" Width="110px"></asp:TextBox>
                            </div>
                            <div style="width: 200px;">
                                <asp:Label ID="Label429" runat="server" Text="<%$ Resources:lang,ShunXu%>"></asp:Label>
                                <asp:TextBox ID="TB_TypeSortNo" runat="server" Width="110px"></asp:TextBox>
                            </div>
                            &nbsp;
                            <br />
                            <asp:Button ID="BT_AddBookReaderType" runat="server" CssClass="inpu" OnClick="BT_AddBookReaderType_Click" Text="<%$ Resources:lang,XinZeng%>" />
                            <asp:Button ID="BT_DeleteBookReaderType" runat="server" CssClass="inpu" OnClick="BT_DeleteBookReaderType_Click" Text="<%$ Resources:lang,ShanChu%>" />
                            &nbsp;
                        </td>
                        <td rowspan="5" align="center">
                            <table background="ImagesSkin/main_n_bj.jpg" border="0" cellpadding="0" cellspacing="0" width="98%">
                                <tr>
                                    <td>
                                        <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                            <tr>
                                                <td align="center" width="60%"><strong>
                                                    <asp:Label ID="Label167" runat="server" Text="<%$ Resources:lang,MingCheng%>"></asp:Label>
                                                </strong></td>
                                                <td align="center" width="40%"><strong>
                                                    <asp:Label ID="Label168" runat="server" Text="<%$ Resources:lang,ShunXu%>"></asp:Label>
                                                </strong></td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            </table>
                            <asp:DataGrid ID="DataGrid17" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" OnItemCommand="DataGrid17_ItemCommand" ShowHeader="false" Width="98%">
                                <FooterStyle BackColor="#57CD1" Font-Bold="True" ForeColor="White" />
                                <EditItemStyle BackColor="#2461BF" />
                                <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                <PagerStyle CssClass="notTab" HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" />
                                <ItemStyle CssClass="itemStyle" />
                                <Columns>
                                    <asp:TemplateColumn HeaderText="名称">
                                        <ItemTemplate>
                                            <asp:Button ID="BT_LeaveType" runat="server" CssClass="inpu" Text='<%# DataBinder.Eval(Container.DataItem,"Type") %>' />
                                        </ItemTemplate>
                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="60%" />
                                    </asp:TemplateColumn>
                                    <asp:BoundColumn DataField="SortNumber" HeaderText="顺序">
                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="40%" />
                                    </asp:BoundColumn>
                                </Columns>
                                <HeaderStyle BackColor="#57CD1" Font-Bold="True" ForeColor="White" />
                            </asp:DataGrid>
                            <div style="width: 200px;">
                                <asp:Label ID="Label172" runat="server" Text="<%$ Resources:lang,LeiXing%>"></asp:Label>
                                <asp:TextBox ID="TB_LeaveType" runat="server" Width="110px"></asp:TextBox>
                            </div>
                            <div style="width: 200px;">
                                <asp:Label ID="Label177" runat="server" Text="<%$ Resources:lang,ShunXu%>"></asp:Label>
                                <asp:TextBox ID="TB_LeaveSortNumber" runat="server" Width="110px">1</asp:TextBox>
                            </div>
                            <br />
                            <asp:Button ID="BT_AddLeaveType" runat="server" CssClass="inpu" OnClick="BT_AddLeaveType_Click" Text="<%$ Resources:lang,XinZeng%>" />
                            <asp:Button ID="BT_DeleteLeaveType" runat="server" CssClass="inpu" OnClick="BT_DeleteLeaveType_Click" Text="<%$ Resources:lang,ShanChu%>" />
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                    </tr>

                    <tr>
                        <td colspan="8" style="background-color: beige; height: 20px; text-align: left;"><strong>&nbsp; </strong></td>
                    </tr>
                    <tr>
                        <td style="height: 19px;"><strong>
                            <asp:Label ID="Label21" runat="server" Text="加班类型"></asp:Label>
                        </strong></td>
                        <td>&nbsp;</td>
                        <td align="center"><strong>
                            <asp:Label ID="Label492291" runat="server" Text="节日类型"></asp:Label>
                        </strong></td>
                        <td>&nbsp;</td>
                        <td align="center" colspan="4">&nbsp;</td>
                    </tr>
                    <tr>
                        <td align="center" valign="top">
                            <table background="ImagesSkin/main_n_bj.jpg" border="0" cellpadding="0" cellspacing="0" width="98%">
                                <tr>
                                    <td width="7">
                                        <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" />
                                    </td>
                                    <td>
                                        <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                            <tr>
                                                <td align="center" width="60%"><strong>
                                                    <asp:Label ID="Label108" runat="server" Text="<%$ Resources:lang,LeiXing%>"></asp:Label>
                                                </strong></td>
                                                <td align="center" width="40%"><strong>
                                                    <asp:Label ID="Label109" runat="server" Text="<%$ Resources:lang,ShunXu%>"></asp:Label>
                                                </strong></td>
                                            </tr>
                                        </table>
                                    </td>
                                    <td align="right" width="6">
                                        <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" />
                                    </td>
                                </tr>
                            </table>
                            <asp:DataGrid ID="DataGrid16" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" OnItemCommand="DataGrid16_ItemCommand" ShowHeader="false" Width="98%">
                                <FooterStyle BackColor="#57CD1" Font-Bold="True" ForeColor="White" />
                                <EditItemStyle BackColor="#2461BF" />
                                <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                <PagerStyle CssClass="notTab" HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" />
                                <ItemStyle CssClass="itemStyle" />
                                <Columns>
                                    <asp:TemplateColumn HeaderText="名称">
                                        <ItemTemplate>
                                            <asp:Button ID="BT_OvertimeType" runat="server" CssClass="inpu" Text='<%# DataBinder.Eval(Container.DataItem,"Type") %>' />
                                        </ItemTemplate>
                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="60%" />
                                    </asp:TemplateColumn>
                                    <asp:BoundColumn DataField="SortNumber" HeaderText="顺序">
                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="40%" />
                                    </asp:BoundColumn>
                                </Columns>
                                <HeaderStyle BackColor="#57CD1" Font-Bold="True" ForeColor="White" />
                            </asp:DataGrid>
                            <asp:Label ID="Label110" runat="server" Text="<%$ Resources:lang,LeiXing%>"></asp:Label>
                            <asp:TextBox ID="TB_OvertimeType" runat="server" Width="80"></asp:TextBox>
                            <br />
                            <asp:Label ID="Label118" runat="server" Text="<%$ Resources:lang,ShunXu%>"></asp:Label>
                            <asp:TextBox ID="TB_OvertimeTypeSort" runat="server" Width="80"></asp:TextBox>
                            <br />
                            <br />
                            <asp:Button ID="BT_OvertimeTypeNew" runat="server" CssClass="inpu" OnClick="BT_OvertimeTypeNew_Click" Text="<%$ Resources:lang,XinZeng%>" />
                            <asp:Button ID="BT_OvertimeTypeDelete" runat="server" CssClass="inpu" OnClick="BT_OvertimeTypeDelete_Click" Text="<%$ Resources:lang,ShanChu%>" />
                        </td>
                        <td align="center" valign="top">&nbsp;</td>
                        <td align="center" valign="top">
                            <table background="ImagesSkin/main_n_bj.jpg" border="0" cellpadding="0" cellspacing="0" width="98%">
                                <tr>
                                    <td width="7">
                                        <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" />
                                    </td>
                                    <td>
                                        <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                            <tr>
                                                <td align="center" width="60%"><strong>
                                                    <asp:Label ID="Label492287" runat="server" Text="<%$ Resources:lang,LeiXing%>"></asp:Label>
                                                </strong></td>
                                                <td align="center" width="40%"><strong>
                                                    <asp:Label ID="Label492288" runat="server" Text="<%$ Resources:lang,ShunXu%>"></asp:Label>
                                                </strong></td>
                                            </tr>
                                        </table>
                                    </td>
                                    <td align="right" width="6">
                                        <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" />
                                    </td>
                                </tr>
                            </table>
                            <asp:DataGrid ID="DataGrid50" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" OnItemCommand="DataGrid50_ItemCommand" ShowHeader="false" Width="98%">
                                <FooterStyle BackColor="#57CD1" Font-Bold="True" ForeColor="White" />
                                <EditItemStyle BackColor="#2461BF" />
                                <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                <PagerStyle CssClass="notTab" HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" />
                                <ItemStyle CssClass="itemStyle" />
                                <Columns>
                                    <asp:TemplateColumn HeaderText="名称">
                                        <ItemTemplate>
                                            <asp:Button ID="BT_FestivalsType" runat="server" CssClass="inpu" Text='<%# DataBinder.Eval(Container.DataItem,"Type") %>' />
                                        </ItemTemplate>
                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="60%" />
                                    </asp:TemplateColumn>
                                    <asp:BoundColumn DataField="SortNumber" HeaderText="顺序">
                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="40%" />
                                    </asp:BoundColumn>
                                </Columns>
                                <HeaderStyle BackColor="#57CD1" Font-Bold="True" ForeColor="White" />
                            </asp:DataGrid>
                            <asp:Label ID="Label492289" runat="server" Text="<%$ Resources:lang,LeiXing%>"></asp:Label>
                            <asp:TextBox ID="TB_FestivalsType" runat="server" Width="80"></asp:TextBox>
                            <br />
                            <asp:Label ID="Label492290" runat="server" Text="<%$ Resources:lang,ShunXu%>"></asp:Label>
                            <asp:TextBox ID="TB_FestivalsTypeSort" runat="server" Width="80"></asp:TextBox>
                            <br />
                            <br />
                            <asp:Button ID="BT_FestivalsTypeNew" runat="server" CssClass="inpu" OnClick="BT_FestivalsTypeNew_Click" Text="<%$ Resources:lang,XinZeng%>" />
                            <asp:Button ID="BT_FestivalsTypeDelete" runat="server" CssClass="inpu" OnClick="BT_FestivalsTypeDelete_Click" Text="<%$ Resources:lang,ShanChu%>" />
                        </td>
                        <td align="center" valign="top">&nbsp;</td>
                        <td align="center" colspan="4">&nbsp;</td>
                    </tr>

                    <tr>
                        <td colspan="8"></td>
                    </tr>
                    <tr>
                        <td colspan="8" style="text-align: left; background-color: beige; height: 20px;">

                            <b>

                                <asp:Label ID="Label267" runat="server" Text="<%$ Resources:lang,KaoQinGuiZe%>">
                                </asp:Label>
                            </b></td>
                    </tr>
                    <tr>
                        <td colspan="8" align="center">
                            <table background="ImagesSkin/main_n_bj.jpg" border="0" cellpadding="0" cellspacing="0" width="100%">
                                <tr>
                                    <td width="7">
                                        <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" />
                                    </td>
                                    <td>
                                        <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                            <tr>
                                                <td align="center" width="4%"><strong>ID</strong> </td>
                                                <td align="center" width="4%"><strong>
                                                    <asp:Label ID="Label268" runat="server" Text="<%$ Resources:lang,ZaoBanShangBanKaiShiShiJian%>"></asp:Label>
                                                </strong></td>
                                                <td align="center" width="4%"><strong>
                                                    <asp:Label ID="Label269" runat="server" Text="<%$ Resources:lang,ZaoBanShangBanJieShuShiJian%>"></asp:Label>
                                                </strong></td>
                                                <td align="center" width="1%"><strong>
                                                    <asp:Label ID="Label53" runat="server" Text="IsMust"></asp:Label>
                                                </strong></td>

                                                <td align="center" width="4%"><strong>
                                                    <asp:Label ID="Label27" runat="server" Text="<%$ Resources:lang,ZaoBanXiaBanKaiShiShiJian%>"></asp:Label>
                                                </strong></td>
                                                <td align="center" width="4%"><strong>
                                                    <asp:Label ID="Label271" runat="server" Text="<%$ Resources:lang,ZaoBanXiaBanJieShuShiJian%>"></asp:Label>
                                                </strong></td>
                                                <td align="center" width="1%"><strong>
                                                    <asp:Label ID="Label41" runat="server" Text="IsMust"></asp:Label>
                                                </strong></td>

                                                <td align="center" width="4%"><strong>
                                                    <asp:Label ID="Label272" runat="server" Text="<%$ Resources:lang,ZhongBanShangBanKaiShiShiJian%>"></asp:Label>
                                                </strong></td>
                                                <td align="center" width="4%"><strong>
                                                    <asp:Label ID="Label273" runat="server" Text="<%$ Resources:lang,ZhongBanShangBanJieShuShiJian%>"></asp:Label>
                                                </strong></td>
                                                <td align="center" width="1%"><strong>
                                                    <asp:Label ID="Label42" runat="server" Text="IsMust"></asp:Label>
                                                </strong></td>

                                                <td align="center" width="4%"><strong>
                                                    <asp:Label ID="Label274" runat="server" Text="<%$ Resources:lang,ZhongBanXiaBanKaiShiShiJian%>"></asp:Label>
                                                </strong></td>
                                                <td align="center" width="4%"><strong>
                                                    <asp:Label ID="Label275" runat="server" Text="<%$ Resources:lang,ZhongBanXiaBanJieShuShiJian%>"></asp:Label>
                                                </strong></td>
                                                <td align="center" width="1%"><strong>
                                                    <asp:Label ID="Label46" runat="server" Text="IsMust"></asp:Label>
                                                </strong></td>

                                                <td align="center" width="4%"><strong>
                                                    <asp:Label ID="Label276" runat="server" Text="<%$ Resources:lang,WanBanShangBanKaiShiShiJian%>"></asp:Label>
                                                </strong></td>
                                                <td align="center" width="4%"><strong>
                                                    <asp:Label ID="Label277" runat="server" Text="<%$ Resources:lang,WanBanShangBanJieShuShiJian%>"></asp:Label>
                                                </strong></td>
                                                <td align="center" width="1%"><strong>
                                                    <asp:Label ID="Label48" runat="server" Text="IsMust"></asp:Label>
                                                </strong></td>

                                                <td align="center" width="4%"><strong>
                                                    <asp:Label ID="Label278" runat="server" Text="<%$ Resources:lang,WanBanXiaBanKaiShiShiJian%>"></asp:Label>
                                                </strong></td>
                                                <td align="center" width="4%"><strong>
                                                    <asp:Label ID="Label279" runat="server" Text="<%$ Resources:lang,WanBanXiaBanJieShuShiJian%>"></asp:Label>
                                                </strong></td>
                                                <td align="center" width="1%"><strong>
                                                    <asp:Label ID="Label49" runat="server" Text="IsMust"></asp:Label>
                                                </strong></td>

                                                <td align="center" width="4%"><strong>
                                                    <asp:Label ID="Label2118" runat="server" Text="<%$ Resources:lang,JiaBanShangBanKaiShiShiJian%>"></asp:Label>
                                                </strong></td>
                                                <td align="center" width="4%"><strong>
                                                    <asp:Label ID="Label281" runat="server" Text="<%$ Resources:lang,JiaBanShangBanJieShuShiJian%>"></asp:Label>
                                                </strong></td>
                                                <td align="center" width="1%"><strong>
                                                    <asp:Label ID="Label50" runat="server" Text="IsMust"></asp:Label>
                                                </strong></td>

                                                <td align="center" width="4%"><strong>
                                                    <asp:Label ID="Label282" runat="server" Text="<%$ Resources:lang,JiaBanXiaBanKaiShiShiJian%>"></asp:Label>
                                                </strong></td>
                                                <td align="center" width="4%"><strong>
                                                    <asp:Label ID="Label283" runat="server" Text="<%$ Resources:lang,JiaBanXiaBanJieShuShiJian%>"></asp:Label>
                                                </strong></td>
                                                <td align="center" width="1%"><strong>
                                                    <asp:Label ID="Label52" runat="server" Text="IsMust"></asp:Label>
                                                </strong></td>
                                                <td align="center" width="4%"><strong>
                                                    <asp:Label ID="Label55" runat="server" Text="<%$ Resources:lang,YunXiZuiDaJuLi%>"></asp:Label>
                                                </strong>(<asp:Label ID="Label56" runat="server" Text="<%$ Resources:lang,Mi%>"></asp:Label>)</td>
                                            </tr>
                                        </table>
                                    </td>
                                    <td align="right" width="6">
                                        <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" />
                                    </td>
                                </tr>
                            </table>
                            <asp:DataGrid ID="DataGrid24" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" OnItemCommand="DataGrid24_ItemCommand" ShowHeader="false" Width="100%">
                                <FooterStyle BackColor="#57CD1" Font-Bold="True" ForeColor="White" />
                                <EditItemStyle BackColor="#2461BF" />
                                <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                <PagerStyle CssClass="notTab" HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" />
                                <ItemStyle CssClass="itemStyle" />
                                <Columns>
                                    <asp:TemplateColumn HeaderText="ID">
                                        <ItemTemplate>
                                            <asp:Button ID="BT_ID" runat="server" CssClass="inpu" Text='<%# DataBinder.Eval(Container.DataItem,"ID") %>' />
                                        </ItemTemplate>
                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="4%" />
                                    </asp:TemplateColumn>
                                    <asp:BoundColumn DataField="MCheckInStart" HeaderText="早班上班开始时间">
                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="4%" />
                                    </asp:BoundColumn>
                                    <asp:BoundColumn DataField="MCheckInEnd" HeaderText="早班上班结束时间">
                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="4%" />
                                    </asp:BoundColumn>
                                    <asp:BoundColumn DataField="MCheckInIsMust" HeaderText="早班上班必须">
                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="1%" />
                                    </asp:BoundColumn>

                                    <asp:BoundColumn DataField="MCheckOutStart" HeaderText="早班下班开始时间">
                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="4%" />
                                    </asp:BoundColumn>
                                    <asp:BoundColumn DataField="MCheckOutEnd" HeaderText="早班下班结束时间">
                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="4%" />
                                    </asp:BoundColumn>
                                    <asp:BoundColumn DataField="MCheckOutIsMust" HeaderText="早班下班必须">
                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="1%" />
                                    </asp:BoundColumn>

                                    <asp:BoundColumn DataField="ACheckInStart" HeaderText="中班上班开始时间">
                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="4%" />
                                    </asp:BoundColumn>
                                    <asp:BoundColumn DataField="ACheckInEnd" HeaderText="中班上班结束时间">
                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="4%" />
                                    </asp:BoundColumn>
                                    <asp:BoundColumn DataField="ACheckInIsMust" HeaderText="中上午上班必须">
                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="1%" />
                                    </asp:BoundColumn>

                                    <asp:BoundColumn DataField="ACheckOutStart" HeaderText="中班下班开始时间">
                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="4%" />
                                    </asp:BoundColumn>
                                    <asp:BoundColumn DataField="ACheckOutEnd" HeaderText="中班下班结束时间">
                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="4%" />
                                    </asp:BoundColumn>
                                    <asp:BoundColumn DataField="ACheckOutIsMust" HeaderText="中午下班必须">
                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="1%" />
                                    </asp:BoundColumn>

                                    <asp:BoundColumn DataField="NCheckInStart" HeaderText="晚班上班开始时间">
                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="4%" />
                                    </asp:BoundColumn>
                                    <asp:BoundColumn DataField="NCheckInEnd" HeaderText="晚班上班结束时间">
                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="4%" />
                                    </asp:BoundColumn>
                                    <asp:BoundColumn DataField="NCheckInIsMust" HeaderText="晚班上班必须">
                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="1%" />
                                    </asp:BoundColumn>

                                    <asp:BoundColumn DataField="NCheckOutStart" HeaderText="晚班下班开始时间">
                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="4%" />
                                    </asp:BoundColumn>
                                    <asp:BoundColumn DataField="NCheckOutEnd" HeaderText="晚班下班结束时间">
                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="4%" />
                                    </asp:BoundColumn>
                                    <asp:BoundColumn DataField="NCheckOutIsMust" HeaderText="晚班下班必须">
                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="1%" />
                                    </asp:BoundColumn>

                                    <asp:BoundColumn DataField="OCheckInStart" HeaderText="加班上班开始时间">
                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="4%" />
                                    </asp:BoundColumn>
                                    <asp:BoundColumn DataField="OCheckInEnd" HeaderText="加班上班结束时间">
                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="4%" />
                                    </asp:BoundColumn>
                                    <asp:BoundColumn DataField="OCheckInIsMust" HeaderText="加班上班必须">
                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="1%" />
                                    </asp:BoundColumn>

                                    <asp:BoundColumn DataField="OCheckOutStart" HeaderText="加班下班开始时间">
                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="4%" />
                                    </asp:BoundColumn>
                                    <asp:BoundColumn DataField="OCheckOutEnd" HeaderText="加班下班结束时间">
                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="4%" />
                                    </asp:BoundColumn>
                                    <asp:BoundColumn DataField="OCheckOutIsMust" HeaderText="加班下班必须">
                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="1%" />
                                    </asp:BoundColumn>
                                    <asp:BoundColumn DataField="LargestDistance" HeaderText="允许最大距离">
                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="4%" />
                                    </asp:BoundColumn>
                                </Columns>
                            </asp:DataGrid>
                        </td>
                    </tr>
                    <tr>
                        <td align="left">
                            <asp:Label ID="Label284" runat="server" Text="<%$ Resources:lang,BianHao%>"></asp:Label>
                            <asp:Label ID="LB_AttendanceRuleID" runat="server"></asp:Label>
                        </td>
                        <td align="left" colspan="7"><span style="color: #CC;">（<asp:Label ID="Label31" runat="server" Text="<%$ Resources:lang,GeShiShiLiZhuYiFenZhongGeShiHeFanWei%>"></asp:Label>
                            --&gt;<asp:Label ID="Label32" runat="server" Text="<%$ Resources:lang,XSGSHFW%>"></asp:Label>
                            &gt;<asp:Label ID="Label33" runat="server" Text="<%$ Resources:lang,FZHXSDBNWFS%>"></asp:Label>
                        </span></td>
                    </tr>
                    <tr>
                        <td align="left" colspan="8">
                            <asp:Label ID="Label285" runat="server" Text="<%$ Resources:lang,ZaoBanShangBanKaiShiShiJian%>"></asp:Label>
                            <asp:TextBox ID="TB_MCheckInStart" runat="server" Width="50px"></asp:TextBox>
                            &nbsp;<asp:Label ID="Label286" runat="server" Text="<%$ Resources:lang,ZaoBanShangBanJieShuShiJian%>"></asp:Label>
                            <asp:TextBox ID="TB_MCheckInEnd" runat="server" Width="50px"></asp:TextBox>
                            &nbsp;<asp:Label ID="Label37" runat="server" Text="IsMust"></asp:Label>
                            <asp:DropDownList ID="DDL_MCheckInIsMust" runat="server">
                                <asp:ListItem Value="NO"></asp:ListItem>
                                <asp:ListItem Value="YES"></asp:ListItem>
                            </asp:DropDownList>

                            &nbsp;<asp:Label ID="Label287" runat="server" Text="<%$ Resources:lang,ZaoBanXiaBanKaiShiShiJian%>"></asp:Label>
                            <asp:TextBox ID="TB_MCheckOutStart" runat="server" Width="50px"></asp:TextBox>
                            &nbsp;<asp:Label ID="Label288" runat="server" Text="<%$ Resources:lang,ZaoBanXiaBanJieShuShiJian%>"></asp:Label>
                            <asp:TextBox ID="TB_MCheckOutEnd" runat="server" Width="50px"></asp:TextBox>
                            &nbsp;<asp:Label ID="Label40" runat="server" Text="IsMust"></asp:Label>
                            <asp:DropDownList ID="DDL_MCheckOutIsMust" runat="server">
                                <asp:ListItem Value="NO"></asp:ListItem>
                                <asp:ListItem Value="YES"></asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td align="left" colspan="8" align="center">
                            <asp:Label ID="Label289" runat="server" Text="<%$ Resources:lang,ZhongBanShangBanKaiShiShiJian%>"></asp:Label>
                            <asp:TextBox ID="TB_ACheckInStart" runat="server" Width="50px"></asp:TextBox>
                            &nbsp;<asp:Label ID="Label29" runat="server" Text="<%$ Resources:lang,ZhongBanShangBanJieShuShiJian%>"></asp:Label>
                            <asp:TextBox ID="TB_ACheckInEnd" runat="server" Width="50px"></asp:TextBox>
                            &nbsp;<asp:Label ID="Label20" runat="server" Text="IsMust"></asp:Label>
                            <asp:DropDownList ID="DDL_ACheckInIsMust" runat="server">
                                <asp:ListItem Value="NO"></asp:ListItem>
                                <asp:ListItem Value="YES"></asp:ListItem>
                            </asp:DropDownList>
                            &nbsp;<asp:Label ID="Label291" runat="server" Text="<%$ Resources:lang,ZhongBanXiaBanKaiShiShiJian%>"></asp:Label>
                            <asp:TextBox ID="TB_ACheckOutStart" runat="server" Width="50px"></asp:TextBox>
                            &nbsp;<asp:Label ID="Label292" runat="server" Text="<%$ Resources:lang,ZhongBanXiaBanJieShuShiJian%>"></asp:Label>
                            <asp:TextBox ID="TB_AChectOutEnd" runat="server" Width="50px"></asp:TextBox>
                            &nbsp;<asp:Label ID="Label22" runat="server" Text="IsMust"></asp:Label>
                            <asp:DropDownList ID="DDL_ACheckOutIsMust" runat="server">
                                <asp:ListItem Value="NO"></asp:ListItem>
                                <asp:ListItem Value="YES"></asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td align="left" colspan="8" align="center">
                            <asp:Label ID="Label293" runat="server" Text="<%$ Resources:lang,WanBanShangBanKaiShiShiJian%>"></asp:Label>
                            <asp:TextBox ID="TB_NCheckInStart" runat="server" Width="50px"></asp:TextBox>
                            &nbsp;<asp:Label ID="Label294" runat="server" Text="<%$ Resources:lang,WanBanShangBanJieShuShiJian%>"></asp:Label>
                            <asp:TextBox ID="TB_NCheckInEnd" runat="server" Width="50px"></asp:TextBox>
                            &nbsp;<asp:Label ID="Label25" runat="server" Text="IsMust"></asp:Label>
                            <asp:DropDownList ID="DDL_NCheckInIsMust" runat="server">
                                <asp:ListItem Value="NO"></asp:ListItem>
                                <asp:ListItem Value="YES"></asp:ListItem>
                            </asp:DropDownList>
                            &nbsp;<asp:Label ID="Label295" runat="server" Text="<%$ Resources:lang,WanBanXiaBanKaiShiShiJian%>"></asp:Label>
                            <asp:TextBox ID="TB_NCheckOutStart" runat="server" Width="50px"></asp:TextBox>
                            &nbsp;<asp:Label ID="Label296" runat="server" Text="<%$ Resources:lang,WanBanXiaBanJieShuShiJian%>"></asp:Label>
                            <asp:TextBox ID="TB_NCheckOutEnd" runat="server" Width="50px"></asp:TextBox>
                            &nbsp;<asp:Label ID="Label26" runat="server" Text="IsMust"></asp:Label>
                            <asp:DropDownList ID="DDL_NCheckOutIsMust" runat="server">
                                <asp:ListItem Value="NO"></asp:ListItem>
                                <asp:ListItem Value="YES"></asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td align="left" colspan="8" align="center">
                            <asp:Label ID="Label297" runat="server" Text="<%$ Resources:lang,JiaBanShangBanKaiShiShiJian%>"></asp:Label>
                            <asp:TextBox ID="TB_OCheckInStart" runat="server" Width="50px"></asp:TextBox>
                            &nbsp;<asp:Label ID="Label298" runat="server" Text="<%$ Resources:lang,JiaBanShangBanJieShuShiJian%>"></asp:Label>
                            <asp:TextBox ID="TB_OCheckInEnd" runat="server" Width="50px"></asp:TextBox>
                            &nbsp;<asp:Label ID="Label30" runat="server" Text="IsMust"></asp:Label>
                            <asp:DropDownList ID="DDL_OCheckInIsMust" runat="server">
                                <asp:ListItem Value="NO"></asp:ListItem>
                                <asp:ListItem Value="YES"></asp:ListItem>
                            </asp:DropDownList>
                            &nbsp;<asp:Label ID="Label299" runat="server" Text="<%$ Resources:lang,JiaBanXiaBanKaiShiShiJian%>"></asp:Label>
                            <asp:TextBox ID="TB_OCheckOutStart" runat="server" Width="50px"></asp:TextBox>
                            &nbsp;<asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,JiaBanXiaBanJieShuShiJian%>"></asp:Label>
                            <asp:TextBox ID="TB_OCheckOutEnd" runat="server" Width="50px"></asp:TextBox>
                            &nbsp;<asp:Label ID="Label35" runat="server" Text="IsMust"></asp:Label>
                            <asp:DropDownList ID="DDL_OCheckOutIsMust" runat="server">
                                <asp:ListItem Value="NO"></asp:ListItem>
                                <asp:ListItem Value="YES"></asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td align="left" colspan="8" align="center">
                            <asp:Label ID="Label101" runat="server" Text="<%$ Resources:lang,Longitude%>"></asp:Label>
                            <asp:TextBox ID="TB_Longitude" runat="server" Width="100px" Text="0"></asp:TextBox>
                            <asp:Label ID="Label102" runat="server" Text="<%$ Resources:lang,Latitude%>"></asp:Label>
                            <asp:TextBox ID="TB_Latitude" runat="server" Width="100px" Text="0"></asp:TextBox>
                            <asp:Label ID="Label100" runat="server" Text="<%$ Resources:lang,DiZhi%>"></asp:Label>
                            <asp:TextBox ID="TB_Address" runat="server" Width="300px"></asp:TextBox>
                            <a class="titleSpan" onclick="popShowByURL('TTUserAttendanceRuleBaiDuMap.aspx','BaiDuMap', 600, 500)">
                                <img src="ImagesSkin/GPS.jpg" alt="取经纬度" width="20" height="20" style="border: 0px;">
                            </a>
                            &nbsp;&nbsp;<asp:Label ID="Label2119" runat="server" Text="<%$ Resources:lang,YunXiZuiDaJuLi%>"></asp:Label>
                            <NickLee:NumberBox ID="NB_LargestDistance" runat="server" MaxAmount="1000000000000" MinAmount="-1000000000000" Width="80px">0.00</NickLee:NumberBox>
                            <asp:Label ID="Label492261" runat="server" Text="<%$ Resources:lang,Mi%>"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="5" align="center">
                            <asp:Button ID="BT_AddAttendanceRule" runat="server" CssClass="inpu" OnClick="BT_AddAttendanceRule_Click" Text="<%$ Resources:lang,XinZeng%>" />
                            &nbsp;
                                        <asp:Button ID="BT_DeleteAttendanceRule" runat="server" CssClass="inpu" OnClick="BT_DeleteAttendanceRule_Click" Text="<%$ Resources:lang,ShanChu%>" />
                        </td>
                        <td colspan="3">&nbsp; </td>
                    </tr>

                    <tr>
                        <td colspan="5" style="background-color: buttonface; text-align: left;">
                            <strong>
                                <asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,JiBenLeiXingLei%>"></asp:Label>
                            </strong>
                            </b></td>
                        <td style="background-color: buttonface"></td>
                        <td style="background-color: buttonface" colspan="2"></td>
                    </tr>
                    <tr>
                        <td>
                            <strong>
                                <asp:Label ID="Label492229" runat="server" Text="<%$ Resources:lang,JiLiangDanWei%>"></asp:Label>
                            </strong>&nbsp;</td>
                        <td colspan="3">
                            <strong>
                                <asp:Label ID="Label4311" runat="server" Text="<%$ Resources:lang,BiBieLeiXing%>"></asp:Label>
                            </strong>
                        </td>
                        <td>
                            <strong>
                                <asp:Label ID="Label84" runat="server" Text="<%$ Resources:lang,JueSeZuLeiXing%>"></asp:Label>
                            </strong><span class="style1">*</span>&nbsp;</td>
                        <td>
                            <b>
                                <asp:Label ID="Label492239" runat="server" Text="<%$ Resources:lang,HangYeLeiXing%>"></asp:Label>
                            </b>&nbsp;</td>
                        <td><b>
                            <asp:Label ID="Label492234" runat="server" Text="<%$ Resources:lang,GongYiLeiXing%>"></asp:Label>
                        </b></td>
                        <td style="height: 7px;">
                            <strong>
                                <asp:Label ID="Label492273" runat="server" Text="缺陷类型"></asp:Label>
                            </strong>&nbsp;</td>
                    </tr>
                    <tr>
                        <td valign="top" align="center">
                            <table background="ImagesSkin/main_n_bj.jpg" border="0" cellpadding="0" cellspacing="0" width="98%">
                                <tr>
                                    <td width="7">
                                        <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" />
                                    </td>
                                    <td>
                                        <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                            <tr>
                                                <td align="center" width="60%"><strong>
                                                    <asp:Label ID="Label492230" runat="server" Text="<%$ Resources:lang,DanWei%>"></asp:Label>
                                                </strong></td>
                                                <td align="center" width="40%"><strong>
                                                    <asp:Label ID="Label492231" runat="server" Text="<%$ Resources:lang,ShunXu%>"></asp:Label>
                                                </strong></td>
                                            </tr>
                                        </table>
                                    </td>
                                    <td align="right" width="6">
                                        <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" />
                                    </td>
                                </tr>
                            </table>
                            <asp:DataGrid ID="DataGrid14" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" OnItemCommand="DataGrid14_ItemCommand" ShowHeader="false" Width="98%">
                                <FooterStyle BackColor="#57CD1" Font-Bold="True" ForeColor="White" />
                                <EditItemStyle BackColor="#2461BF" />
                                <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                <PagerStyle CssClass="notTab" HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" />
                                <ItemStyle CssClass="itemStyle" />
                                <Columns>
                                    <asp:TemplateColumn HeaderText="单位">
                                        <ItemTemplate>
                                            <asp:Button ID="BT_UnitName" runat="server" CssClass="inpu" Text='<%# DataBinder.Eval(Container.DataItem,"UnitName") %>' />
                                        </ItemTemplate>
                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="60%" />
                                    </asp:TemplateColumn>
                                    <asp:BoundColumn DataField="SortNumber" HeaderText="顺序">
                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="40%" />
                                    </asp:BoundColumn>
                                </Columns>
                                <HeaderStyle BackColor="#57CD1" Font-Bold="True" ForeColor="White" />
                            </asp:DataGrid>
                            <asp:Label ID="Label492232" runat="server" Text="<%$ Resources:lang,DanWei%>"></asp:Label>
                            <asp:TextBox ID="TB_UnitName" runat="server" Width="110px"></asp:TextBox>
                            <br />
                            <asp:Label ID="Label492233" runat="server" Text="<%$ Resources:lang,ShunXu%>"></asp:Label>
                            <asp:TextBox ID="TB_UnitSort" runat="server" Width="110px"></asp:TextBox>
                            <br />
                            <br />
                            <asp:Button ID="BT_UnitNew" runat="server" CssClass="inpu" OnClick="BT_UnitNew_Click" Text="<%$ Resources:lang,XinZeng%>" />
                            <asp:Button ID="BT_UnitDelete" runat="server" CssClass="inpu" OnClick="BT_UnitDelete_Click" Text="<%$ Resources:lang,ShanChu%>" />
                        </td>
                        <td colspan="3">
                            <table background="ImagesSkin/main_n_bj.jpg" border="0" cellpadding="0" cellspacing="0" width="98%">
                                <tr>
                                    <td width="7">
                                        <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" />
                                    </td>
                                    <td>
                                        <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                            <tr>
                                                <td align="center" width="40%"><strong>
                                                    <asp:Label ID="Label4411" runat="server" Text="<%$ Resources:lang,BiBie%>"></asp:Label>
                                                </strong></td>
                                                <td align="center" width="20%"><strong>
                                                    <asp:Label ID="Label4511" runat="server" Text="<%$ Resources:lang,HuiLv%>"></asp:Label>
                                                </strong></td>
                                                <td align="center" width="20%"><strong>
                                                    <asp:Label ID="Label4611" runat="server" Text="<%$ Resources:lang,PaiXu%>"></asp:Label>
                                                </strong>
                                                </td>
                                                <td align="center" width="20%"><strong>
                                                    <asp:Label ID="Label61" runat="server" Text="本币"></asp:Label>
                                                </strong>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                    <td align="right" width="6">
                                        <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" />
                                    </td>
                                </tr>
                            </table>
                            <asp:DataGrid ID="DataGrid35" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" OnItemCommand="DataGrid35_ItemCommand" ShowHeader="false" Width="98%">
                                <FooterStyle BackColor="#57CD1" Font-Bold="True" ForeColor="White" />
                                <EditItemStyle BackColor="#2461BF" />
                                <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                <PagerStyle CssClass="notTab" HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" />
                                <ItemStyle CssClass="itemStyle" />
                                <Columns>
                                    <asp:TemplateColumn HeaderText="ID">
                                        <ItemTemplate>
                                            <asp:Button ID="BT_CurrencyType" runat="server" CssClass="inpu" Text='<%# DataBinder.Eval(Container.DataItem,"Type") %>' />
                                        </ItemTemplate>
                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="40%" />
                                    </asp:TemplateColumn>
                                    <asp:BoundColumn DataField="ExchangeRate" HeaderText="汇率">
                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="left" Width="20%" />
                                    </asp:BoundColumn>
                                    <asp:BoundColumn DataField="SortNo" HeaderText="顺充号">
                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="20%" />
                                    </asp:BoundColumn>
                                    <asp:BoundColumn DataField="IsHome" HeaderText="本币">
                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="20%" />
                                    </asp:BoundColumn>
                                </Columns>
                            </asp:DataGrid>
                            <asp:Label ID="Label47" runat="server" Text="<%$ Resources:lang,LeiXing%>"></asp:Label>
                            <asp:TextBox ID="TB_CurrencyType" runat="server" Width="110px"></asp:TextBox>

                            <asp:Label ID="Label60" runat="server" Text="本币"></asp:Label>
                            <asp:DropDownList ID="DL_IsHomeCurrency" runat="server">
                                <asp:ListItem Value="NO">NO</asp:ListItem>
                                <asp:ListItem Value="YES">YES</asp:ListItem>
                            </asp:DropDownList>
                            <br />
                            <asp:Label ID="Label4811" runat="server" Text="<%$ Resources:lang,HuiLv%>"></asp:Label>
                            <asp:TextBox ID="TB_ExchangeRate" runat="server" Width="110px"></asp:TextBox>
                            <br />
                            <asp:Label ID="Label4911" runat="server" Text="<%$ Resources:lang,ShunXu%>"></asp:Label>
                            <asp:TextBox ID="TB_CurrencyTypeSortNo" runat="server" Width="110px"></asp:TextBox>
                            <br />
                            <br />
                            <asp:Button ID="BT_AddCurrencyType" runat="server" CssClass="inpu" OnClick="BT_AddCurrencyType_Click" Text="<%$ Resources:lang,XinZeng%>" />
                            <asp:Button ID="BT_DeleteCurrencyType" runat="server" CssClass="inpu" OnClick="BT_DeleteCurrencyType_Click" Text="<%$ Resources:lang,ShanChu%>" />
                        </td>
                        <td valign="top" align="center">
                            <table background="ImagesSkin/main_n_bj.jpg" border="0" cellpadding="0" cellspacing="0" width="98%">
                                <tr>
                                    <td width="7">
                                        <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" />
                                    </td>
                                    <td>
                                        <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                            <tr>
                                                <td align="center" width="60%"><strong>
                                                    <asp:Label ID="Label91" runat="server" Text="<%$ Resources:lang,LeiXing%>"></asp:Label>
                                                </strong></td>
                                                <td align="center" width="40%"><strong>
                                                    <asp:Label ID="Label92" runat="server" Text="<%$ Resources:lang,ShunXu%>"></asp:Label>
                                                </strong></td>
                                            </tr>
                                        </table>
                                    </td>
                                    <td align="right" width="6">
                                        <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" />
                                    </td>
                                </tr>
                            </table>
                            <asp:DataGrid ID="DataGrid15" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" OnItemCommand="DataGrid15_ItemCommand" ShowHeader="false" Width="98%">
                                <FooterStyle BackColor="#57CD1" Font-Bold="True" ForeColor="White" />
                                <EditItemStyle BackColor="#2461BF" />
                                <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                <PagerStyle CssClass="notTab" HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" />
                                <ItemStyle CssClass="itemStyle" />
                                <Columns>
                                    <asp:TemplateColumn HeaderText="类型">
                                        <ItemTemplate>
                                            <asp:Button ID="BT_ActorGroupType" runat="server" CssClass="inpu" Text='<%# DataBinder.Eval(Container.DataItem,"Type") %>' />
                                        </ItemTemplate>
                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="60%" />
                                    </asp:TemplateColumn>
                                    <asp:BoundColumn DataField="SortNumber" HeaderText="顺序">
                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="40%" />
                                    </asp:BoundColumn>
                                </Columns>
                                <HeaderStyle BackColor="#57CD1" Font-Bold="True" ForeColor="White" />
                            </asp:DataGrid>
                            <asp:Label ID="Label99" runat="server" Text="<%$ Resources:lang,LeiXing%>"></asp:Label>
                            <asp:TextBox ID="TB_ActorGroupType" runat="server" Width="110px"></asp:TextBox>
                            <br />
                            <asp:Label ID="Label14" runat="server" Text="<%$ Resources:lang,ShunXu%>"></asp:Label>
                            <asp:TextBox ID="TB_ActorGroupTypeSort" runat="server" Width="110px"></asp:TextBox>
                            <br />
                            <br />
                            <asp:Button ID="BT_ActorGroupNew" runat="server" CssClass="inpu" OnClick="BT_ActorGroupNew_Click" Text="<%$ Resources:lang,XinZeng%>" />
                            <asp:Button ID="BT_ActorGroupDelete" runat="server" CssClass="inpu" OnClick="BT_ActorGroupDelete_Click" Text="<%$ Resources:lang,ShanChu%>" />
                        </td>
                        <td align="center">
                            <table background="ImagesSkin/main_n_bj.jpg" border="0" cellpadding="0" cellspacing="0" width="98%">
                                <tr>
                                    <td width="7">
                                        <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" />
                                    </td>
                                    <td>
                                        <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                            <tr>
                                                <td align="center" width="60%"><strong>
                                                    <asp:Label ID="Label492240" runat="server" Text="<%$ Resources:lang,LeiXing%>"></asp:Label>
                                                </strong></td>
                                                <td align="center" width="40%"><strong>
                                                    <asp:Label ID="Label492241" runat="server" Text="<%$ Resources:lang,ShunXu%>"></asp:Label>
                                                </strong></td>
                                            </tr>
                                        </table>
                                    </td>
                                    <td align="right" width="6">
                                        <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" />
                                    </td>
                                </tr>
                            </table>
                            <asp:DataGrid ID="DataGrid26" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" OnItemCommand="DataGrid26_ItemCommand" ShowHeader="false" Width="98%">
                                <FooterStyle BackColor="#57CD1" Font-Bold="True" ForeColor="White" />
                                <EditItemStyle BackColor="#2461BF" />
                                <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                <PagerStyle CssClass="notTab" HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" />
                                <ItemStyle CssClass="itemStyle" />
                                <Columns>
                                    <asp:TemplateColumn HeaderText="类型">
                                        <ItemTemplate>
                                            <asp:Button ID="BT_IndustryType" runat="server" CssClass="inpu" Text='<%# DataBinder.Eval(Container.DataItem,"Type") %>' />
                                        </ItemTemplate>
                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="60%" />
                                    </asp:TemplateColumn>
                                    <asp:BoundColumn DataField="SortNumber" HeaderText="顺序">
                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="40%" />
                                    </asp:BoundColumn>
                                </Columns>
                                <HeaderStyle BackColor="#57CD1" Font-Bold="True" ForeColor="White" />
                            </asp:DataGrid>
                            <asp:Label ID="Label492242" runat="server" Text="<%$ Resources:lang,LeiXing%>"></asp:Label>
                            <asp:TextBox ID="TB_IndustryType" runat="server" Width="110px"></asp:TextBox>
                            <br />
                            <asp:Label ID="Label492243" runat="server" Text="<%$ Resources:lang,ShunXu%>"></asp:Label>
                            <asp:TextBox ID="TB_IndustryTypeSort" runat="server" Width="110px"></asp:TextBox>
                            <br />
                            <br />
                            <asp:Button ID="BT_AddIndustryType" runat="server" CssClass="inpu" OnClick="BT_AddIndustryType_Click" Text="<%$ Resources:lang,XinZeng%>" />
                            <asp:Button ID="BT_DeleteIndustryType" runat="server" CssClass="inpu" OnClick="BT_DeleteIndustryType_Click" Text="<%$ Resources:lang,ShanChu%>" />
                        </td>
                        <td valign="top" align="center">
                            <table background="ImagesSkin/main_n_bj.jpg" border="0" cellpadding="0" cellspacing="0" width="98%">
                                <tr>
                                    <td width="7">
                                        <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" />
                                    </td>
                                    <td>
                                        <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                            <tr>
                                                <td align="center" width="60%"><strong>
                                                    <asp:Label ID="Label492235" runat="server" Text="<%$ Resources:lang,GongYi%>"></asp:Label>
                                                </strong></td>
                                                <td align="center" width="40%"><strong>
                                                    <asp:Label ID="Label492236" runat="server" Text="<%$ Resources:lang,ShunXu%>"></asp:Label>
                                                </strong></td>
                                            </tr>
                                        </table>
                                    </td>
                                    <td align="right" width="6">
                                        <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" />
                                    </td>
                                </tr>
                            </table>
                            <asp:DataGrid ID="DataGrid3" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" OnItemCommand="DataGrid3_ItemCommand" ShowHeader="false" Width="98%">
                                <FooterStyle BackColor="#57CD1" Font-Bold="True" ForeColor="White" />
                                <EditItemStyle BackColor="#2461BF" />
                                <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                <PagerStyle CssClass="notTab" HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" />
                                <ItemStyle CssClass="itemStyle" />
                                <Columns>
                                    <asp:TemplateColumn HeaderText="工艺">
                                        <ItemTemplate>
                                            <asp:Button ID="BT_ProcessName" runat="server" CssClass="inpu" Text='<%# DataBinder.Eval(Container.DataItem,"ProcessName") %>' />
                                        </ItemTemplate>
                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="60%" />
                                    </asp:TemplateColumn>
                                    <asp:BoundColumn DataField="SortNumber" HeaderText="顺序">
                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="40%" />
                                    </asp:BoundColumn>
                                </Columns>
                                <HeaderStyle BackColor="#57CD1" Font-Bold="True" ForeColor="White" />
                            </asp:DataGrid>
                            <div style="width: 200px;">
                                <asp:Label ID="Label492237" runat="server" Text="<%$ Resources:lang,GongYi%>"></asp:Label>
                                <asp:TextBox ID="TB_ProcessName" runat="server" Width="110px"></asp:TextBox>
                            </div>
                            <asp:Label ID="Label492238" runat="server" Text="<%$ Resources:lang,ShunXu%>"></asp:Label>
                            <asp:TextBox ID="TB_ProcessSort" runat="server" Width="110px"></asp:TextBox>
                            <br />
                            <br />
                            <asp:Button ID="BT_AddProductProcess" runat="server" CssClass="inpu" OnClick="BT_AddProductProcess_Click" Text="<%$ Resources:lang,XinZeng%>" />
                            <asp:Button ID="BT_DeleteProductProcess" runat="server" CssClass="inpu" OnClick="BT_DeleteProductProcess_Click" Text="<%$ Resources:lang,ShanChu%>" />
                        </td>
                        <td valign="top" align="center">
                            <table background="ImagesSkin/main_n_bj.jpg" border="0" cellpadding="0" cellspacing="0" width="98%">
                                <tr>
                                    <td width="7">
                                        <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" />
                                    </td>
                                    <td>
                                        <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                            <tr>
                                                <td align="center" width="60%"><strong>
                                                    <asp:Label ID="Label492274" runat="server" Text="<%$ Resources:lang,LeiXing%>"></asp:Label>
                                                </strong></td>
                                                <td align="center" width="40%"><strong>
                                                    <asp:Label ID="Label492275" runat="server" Text="<%$ Resources:lang,ShunXu%>"></asp:Label>
                                                </strong></td>
                                            </tr>
                                        </table>
                                    </td>
                                    <td align="right" width="6">
                                        <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" />
                                    </td>
                                </tr>
                            </table>
                            <asp:DataGrid ID="DataGrid47" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" OnItemCommand="DataGrid47_ItemCommand" ShowHeader="false" Width="98%">
                                <FooterStyle BackColor="#57CD1" Font-Bold="True" ForeColor="White" />
                                <EditItemStyle BackColor="#2461BF" />
                                <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                <PagerStyle CssClass="notTab" HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" />
                                <ItemStyle CssClass="itemStyle" />
                                <Columns>
                                    <asp:TemplateColumn HeaderText="类型">
                                        <ItemTemplate>
                                            <asp:Button ID="BT_DefectType" runat="server" CssClass="inpu" Text='<%# DataBinder.Eval(Container.DataItem,"Type") %>' />
                                        </ItemTemplate>
                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="60%" />
                                    </asp:TemplateColumn>
                                    <asp:BoundColumn DataField="SortNumber" HeaderText="顺序">
                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="40%" />
                                    </asp:BoundColumn>
                                </Columns>
                            </asp:DataGrid>
                            <asp:Label ID="Label492276" runat="server" Text="<%$ Resources:lang,LeiXing%>"></asp:Label>
                            <asp:TextBox ID="TB_DefectType" runat="server" Width="110px"></asp:TextBox>
                            <br />
                            <asp:Label ID="Label492277" runat="server" Text="<%$ Resources:lang,ShunXu%>"></asp:Label>
                            <asp:TextBox ID="TB_DefectTypeSort" runat="server" Width="110px"></asp:TextBox>
                            <br />
                            <br />
                            <asp:Button ID="BT_DefectTypeNew" runat="server" CssClass="inpu" OnClick="BT_DefectTypeNew_Click" Text="<%$ Resources:lang,XinZeng%>" />
                            <asp:Button ID="BT_DefectTypeDelete" runat="server" CssClass="inpu" OnClick="BT_DefectTypeDelete_Click" Text="<%$ Resources:lang,ShanChu%>" />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="8" style="background-color: beige; height: 20px;">&nbsp;
                        </td>
                    </tr>
                    </table>
                                <table style="width: 100%; text-align: center;">
                                    <tr>
                                        <td><strong>
                                            <asp:Label ID="Label136" runat="server" Text="<%$ Resources:lang,BaoBiaoLeiXing%>"></asp:Label>
                                        </strong></td>
                                        <td><strong>
                                            <asp:Label ID="Label492224" runat="server" Text="<%$ Resources:lang,CheLiangLeiXing%>"></asp:Label>
                                        </strong></td>
                                        <td style="height: 7px;"><strong>
                                            <asp:Label ID="Label492251" runat="server" Text="<%$ Resources:lang,ShiYouXingHaoSheDing%>"></asp:Label>
                                        </strong></td>
                                        <td><strong>
                                            <asp:Label ID="Label194" runat="server" Text="<%$ Resources:lang,KeHuFuWuLeiXing%>"></asp:Label>
                                        </strong></td>
                                        <td><strong>
                                            <asp:Label ID="Label393" runat="server" Text="<%$ Resources:lang,HuiYiLeiXing%>"></asp:Label>
                                        </strong></td>
                                        <td><strong>
                                            <asp:Label ID="Label492262" runat="server" Text="<%$ Resources:lang,ShangJiJieDuan%>"></asp:Label>
                                        </strong></td>
                                        <td><strong>
                                            <asp:Label ID="Label492267" runat="server" Text="<%$ Resources:lang,KeHuShangJiJieDuan%>"></asp:Label>
                                        </strong></td>
                                    </tr>
                                    <tr>
                                        <td rowspan="2" align="center">
                                            <table background="ImagesSkin/main_n_bj.jpg" border="0" cellpadding="0" cellspacing="0" width="98%">
                                                <tr>
                                                    <td width="7">
                                                        <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" />
                                                    </td>
                                                    <td>
                                                        <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                            <tr>
                                                                <td align="center" width="60%"><strong>
                                                                    <asp:Label ID="Label145" runat="server" Text="<%$ Resources:lang,MingCheng%>"></asp:Label>
                                                                </strong></td>
                                                                <td align="center" width="40%"><strong>
                                                                    <asp:Label ID="Label146" runat="server" Text="<%$ Resources:lang,ShunXu%>"></asp:Label>
                                                                </strong></td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                    <td align="right" width="6">
                                                        <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" />
                                                    </td>
                                                </tr>
                                            </table>
                                            <asp:DataGrid ID="DataGrid29" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" OnItemCommand="DataGrid29_ItemCommand" ShowHeader="false" Width="98%">
                                                <FooterStyle BackColor="#57CD1" Font-Bold="True" ForeColor="White" />
                                                <EditItemStyle BackColor="#2461BF" />
                                                <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                <PagerStyle CssClass="notTab" HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" />
                                                <ItemStyle CssClass="itemStyle" />
                                                <Columns>
                                                    <asp:TemplateColumn HeaderText="名称">
                                                        <ItemTemplate>
                                                            <asp:Button ID="BT_ReportType" runat="server" CssClass="inpu" Text='<%# DataBinder.Eval(Container.DataItem,"Type") %>' />
                                                        </ItemTemplate>
                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="60%" />
                                                    </asp:TemplateColumn>
                                                    <asp:BoundColumn DataField="SortNumber" HeaderText="顺序">
                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="40%" />
                                                    </asp:BoundColumn>
                                                </Columns>
                                                <HeaderStyle BackColor="#57CD1" Font-Bold="True" ForeColor="White" />
                                            </asp:DataGrid>
                                            <div style="width: 200px;">
                                                <asp:Label ID="Label151" runat="server" Text="<%$ Resources:lang,LeiXing%>"></asp:Label>
                                                <asp:TextBox ID="TB_ReportType" runat="server" Width="120px"></asp:TextBox>
                                            </div>
                                            <div style="width: 200px;">
                                                <asp:Label ID="Label492219" runat="server" Text="<%$ Resources:lang,ShunXu%>"></asp:Label>
                                                <asp:TextBox ID="TB_ReportTypeSort" runat="server" Width="120px"></asp:TextBox>
                                            </div>
                                            <br />
                                            <asp:Button ID="BT_AddReportType" runat="server" CssClass="inpu" OnClick="BT_AddReportType_Click" Text="<%$ Resources:lang,XinZeng%>" />
                                            <asp:Button ID="BT_DeleteReportType" runat="server" CssClass="inpu" OnClick="BT_DeleteReportType_Click" Text="<%$ Resources:lang,ShanChu%>" />
                                            &nbsp;
                                        </td>
                                        <td rowspan="2" align="center">
                                            <table background="ImagesSkin/main_n_bj.jpg" border="0" cellpadding="0" cellspacing="0" width="98%">
                                                <tr>
                                                    <td width="7">
                                                        <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" />
                                                    </td>
                                                    <td>
                                                        <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                            <tr>
                                                                <td align="center" width="60%"><strong>
                                                                    <asp:Label ID="Label492225" runat="server" Text="<%$ Resources:lang,MingCheng%>"></asp:Label>
                                                                </strong></td>
                                                                <td align="center" width="40%"><strong>
                                                                    <asp:Label ID="Label492226" runat="server" Text="<%$ Resources:lang,ShunXu%>"></asp:Label>
                                                                </strong></td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                    <td align="right" width="6">
                                                        <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" />
                                                    </td>
                                                </tr>
                                            </table>
                                            <asp:DataGrid ID="DataGrid27" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" OnItemCommand="DataGrid27_ItemCommand" ShowHeader="false" Width="98%">
                                                <FooterStyle BackColor="#57CD1" Font-Bold="True" ForeColor="White" />
                                                <EditItemStyle BackColor="#2461BF" />
                                                <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                <PagerStyle CssClass="notTab" HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" />
                                                <ItemStyle CssClass="itemStyle" />
                                                <Columns>
                                                    <asp:TemplateColumn HeaderText="名称">
                                                        <ItemTemplate>
                                                            <asp:Button ID="BT_CarType" runat="server" CssClass="inpu" Text='<%# DataBinder.Eval(Container.DataItem,"Type") %>' />
                                                        </ItemTemplate>
                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="60%" />
                                                    </asp:TemplateColumn>
                                                    <asp:BoundColumn DataField="SortNumber" HeaderText="顺序">
                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="40%" />
                                                    </asp:BoundColumn>
                                                </Columns>
                                                <HeaderStyle BackColor="#57CD1" Font-Bold="True" ForeColor="White" />
                                            </asp:DataGrid>
                                            <div style="width: 200px;">
                                                <asp:Label ID="Label492227" runat="server" Text="<%$ Resources:lang,LeiXing%>"></asp:Label>
                                                <asp:TextBox ID="TB_CarType" runat="server" Width="120px"></asp:TextBox>
                                            </div>
                                            <div style="width: 200px;">
                                                <asp:Label ID="Label492228" runat="server" Text="<%$ Resources:lang,ShunXu%>"></asp:Label>
                                                <asp:TextBox ID="TB_CarTypeSort" runat="server" Width="120px"></asp:TextBox>
                                            </div>
                                            <br />
                                            <asp:Button ID="BT_AddCarType" runat="server" CssClass="inpu" OnClick="BT_AddCarType_Click" Text="<%$ Resources:lang,XinZeng%>" />
                                            <asp:Button ID="BT_DeleteCarType" runat="server" CssClass="inpu" OnClick="BT_DeleteCarType_Click" Text="<%$ Resources:lang,ShanChu%>" />
                                        </td>
                                        <td valign="top" rowspan="2" align="center">
                                            <table background="ImagesSkin/main_n_bj.jpg" border="0" cellpadding="0" cellspacing="0" width="98%">
                                                <tr>
                                                    <td width="7">
                                                        <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" alt="" />
                                                    </td>
                                                    <td>
                                                        <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                            <tr>
                                                                <td align="center" width="30%"><strong>
                                                                    <asp:Label ID="Label492252" runat="server" Text="<%$ Resources:lang,XuHao%>"></asp:Label>
                                                                </strong></td>
                                                                <td align="center" width="70%"><strong>
                                                                    <asp:Label ID="Label492253" runat="server" Text="<%$ Resources:lang,MingChengJiXingHao%>"></asp:Label>
                                                                </strong></td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                    <td align="right" width="6">
                                                        <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" />
                                                    </td>
                                                </tr>
                                            </table>
                                            <asp:DataGrid ID="DataGrid33" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" OnItemCommand="DataGrid33_ItemCommand" ShowHeader="false" Width="98%">
                                                <FooterStyle BackColor="#57CD1" Font-Bold="True" ForeColor="White" />
                                                <EditItemStyle BackColor="#2461BF" />
                                                <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                <PagerStyle CssClass="notTab" HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" />
                                                <ItemStyle CssClass="itemStyle" />
                                                <Columns>
                                                    <asp:TemplateColumn HeaderText="序号">
                                                        <ItemTemplate>
                                                            <asp:Button ID="BT_ID" runat="server" CssClass="inpu" Text='<%# DataBinder.Eval(Container.DataItem,"ID") %>' />
                                                        </ItemTemplate>
                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="30%" />
                                                    </asp:TemplateColumn>
                                                    <asp:BoundColumn DataField="OilName" HeaderText="名称及型号">
                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="70%" />
                                                    </asp:BoundColumn>
                                                </Columns>
                                                <HeaderStyle BackColor="#57CD1" Font-Bold="True" ForeColor="White" />
                                            </asp:DataGrid>
                                            <div>
                                                <asp:Label ID="Label492254" runat="server" Text="<%$ Resources:lang,MingCheng%>"></asp:Label>
                                                <asp:TextBox ID="txt_OilName" runat="server" Width="110"></asp:TextBox>
                                            </div>
                                            <asp:Label ID="Label492255" runat="server" Text="<%$ Resources:lang,XingHao%>"></asp:Label>
                                            <asp:TextBox ID="txt_OilType" runat="server" Width="110"></asp:TextBox>
                                            <br />
                                            <br />
                                            <asp:Button ID="btn_OilTypeAdd" runat="server" CssClass="inpu" OnClick="btn_OilTypeAdd_Click" Text="<%$ Resources:lang,XinZeng%>" />
                                            <asp:Button ID="btn_OilTypeDelete" runat="server" CssClass="inpu" OnClick="btn_OilTypeDelete_Click" Text="<%$ Resources:lang,ShanChu%>" />
                                            <asp:TextBox ID="txt_ID" runat="server" Visible="False" Width="1px"></asp:TextBox>
                                        </td>
                                        <td rowspan="2" align="center">
                                            <table background="ImagesSkin/main_n_bj.jpg" border="0" cellpadding="0" cellspacing="0" width="98%">
                                                <tr>
                                                    <td width="7">
                                                        <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" />
                                                    </td>
                                                    <td>
                                                        <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                            <tr>
                                                                <td align="center" width="60%"><strong>
                                                                    <asp:Label ID="Label196" runat="server" Text="<%$ Resources:lang,MingCheng%>"></asp:Label>
                                                                </strong></td>
                                                                <td align="center" width="40%"><strong>
                                                                    <asp:Label ID="Label197" runat="server" Text="<%$ Resources:lang,ShunXu%>"></asp:Label>
                                                                </strong></td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                    <td align="right" width="6">
                                                        <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" />
                                                    </td>
                                                </tr>
                                            </table>
                                            <asp:DataGrid ID="DataGrid32" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" OnItemCommand="DataGrid32_ItemCommand" ShowHeader="false" Width="98%">
                                                <FooterStyle BackColor="#57CD1" Font-Bold="True" ForeColor="White" />
                                                <EditItemStyle BackColor="#2461BF" />
                                                <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                <PagerStyle CssClass="notTab" HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" />
                                                <ItemStyle CssClass="itemStyle" />
                                                <Columns>
                                                    <asp:TemplateColumn HeaderText="名称">
                                                        <ItemTemplate>
                                                            <asp:Button ID="BT_CustomerQuestionType" runat="server" CssClass="inpu" Text='<%# DataBinder.Eval(Container.DataItem,"Type") %>' />
                                                        </ItemTemplate>
                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="60%" />
                                                    </asp:TemplateColumn>
                                                    <asp:BoundColumn DataField="SortNumber" HeaderText="顺序">
                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="40%" />
                                                    </asp:BoundColumn>
                                                </Columns>
                                                <HeaderStyle BackColor="#57CD1" Font-Bold="True" ForeColor="White" />
                                            </asp:DataGrid>
                                            <div style="width: 200px;">
                                                <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,LeiXing%>"></asp:Label>
                                                <asp:TextBox ID="TB_CustomerQuestionType" runat="server" Width="110"></asp:TextBox>
                                            </div>
                                            <asp:Label ID="Label2112" runat="server" Text="<%$ Resources:lang,ShunXu%>"></asp:Label>
                                            <asp:TextBox ID="TB_CustomerQuestionTypeSort" runat="server" Width="110"></asp:TextBox>
                                            <br />
                                            <br />
                                            <asp:Button ID="BT_AddCustomerQuestionType" runat="server" CssClass="inpu" OnClick="BT_AddCustomerQuestionType_Click" Text="<%$ Resources:lang,XinZeng%>" />
                                            <asp:Button ID="BT_DeleteCustomerQuestionType" runat="server" CssClass="inpu" OnClick="BT_DeleteCustomerQuestionType_Click" Text="<%$ Resources:lang,ShanChu%>" />
                                        </td>
                                        <td valign="top" rowspan="2" align="center">
                                            <table background="ImagesSkin/main_n_bj.jpg" border="0" cellpadding="0" cellspacing="0" width="98%">
                                                <tr>
                                                    <td width="7">
                                                        <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" />
                                                    </td>
                                                    <td>
                                                        <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                            <tr>
                                                                <td align="center" width="60%"><strong>
                                                                    <asp:Label ID="Label394" runat="server" Text="<%$ Resources:lang,LeiXing%>"></asp:Label>
                                                                </strong></td>
                                                                <td align="center" width="40%"><strong>
                                                                    <asp:Label ID="Label395" runat="server" Text="<%$ Resources:lang,ShunXu%>"></asp:Label>
                                                                </strong></td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                    <td align="right" width="6">
                                                        <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" />
                                                    </td>
                                                </tr>
                                            </table>
                                            <asp:DataGrid ID="DataGrid9" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" OnItemCommand="DataGrid9_ItemCommand" ShowHeader="false" Width="98%">
                                                <FooterStyle BackColor="#57CD1" Font-Bold="True" ForeColor="White" />
                                                <EditItemStyle BackColor="#2461BF" />
                                                <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                <PagerStyle CssClass="notTab" HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" />
                                                <ItemStyle CssClass="itemStyle" />
                                                <Columns>
                                                    <asp:TemplateColumn HeaderText="类型">
                                                        <ItemTemplate>
                                                            <asp:Button ID="BT_MeetingType" runat="server" CssClass="inpu" Text='<%# DataBinder.Eval(Container.DataItem,"Type") %>' />
                                                        </ItemTemplate>
                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="60%" />
                                                    </asp:TemplateColumn>
                                                    <asp:BoundColumn DataField="SortNumber" HeaderText="顺序">
                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="40%" />
                                                    </asp:BoundColumn>
                                                </Columns>
                                                <HeaderStyle BackColor="#57CD1" Font-Bold="True" ForeColor="White" />
                                            </asp:DataGrid>
                                            <div style="width: 200px;">
                                                <asp:Label ID="Label396" runat="server" Text="<%$ Resources:lang,LeiXing%>"></asp:Label>
                                                <asp:TextBox ID="TB_MeetingType" runat="server" Width="110px"></asp:TextBox>
                                            </div>
                                            <asp:Label ID="Label397" runat="server" Text="<%$ Resources:lang,ShunXu%>"></asp:Label>
                                            <asp:TextBox ID="TB_MeetingTypeSort" runat="server" Width="110px"></asp:TextBox>
                                            <br />
                                            <br />
                                            <asp:Button ID="BT_MeetingTypeNew1" runat="server" CssClass="inpu" OnClick="BT_MeetingTypeNew_Click" Text="<%$ Resources:lang,XinZeng%>" />
                                            <asp:Button ID="BT_MeetingTypeDelete" runat="server" CssClass="inpu" OnClick="BT_MeetingTypeDelete_Click" Text="<%$ Resources:lang,ShanChu%>" />
                                        </td>
                                        <td rowspan="2" align="center">
                                            <table background="ImagesSkin/main_n_bj.jpg" border="0" cellpadding="0" cellspacing="0" width="98%">
                                                <tr>
                                                    <td width="7">
                                                        <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" />
                                                    </td>
                                                    <td>
                                                        <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                            <tr>
                                                                <td align="center" width="60%"><strong>
                                                                    <asp:Label ID="Label492263" runat="server" Text="<%$ Resources:lang,JieDuan%>"></asp:Label>
                                                                </strong></td>
                                                                <td align="center" width="40%"><strong>
                                                                    <asp:Label ID="Label492264" runat="server" Text="<%$ Resources:lang,KeNengXing%>"></asp:Label>
                                                                </strong></td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                    <td align="right" width="6">
                                                        <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" />
                                                    </td>
                                                </tr>
                                            </table>
                                            <asp:DataGrid ID="DataGrid45" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" OnItemCommand="DataGrid45_ItemCommand" ShowHeader="false" Width="98%">
                                                <FooterStyle BackColor="#57CD1" Font-Bold="True" ForeColor="White" />
                                                <EditItemStyle BackColor="#2461BF" />
                                                <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                <PagerStyle CssClass="notTab" HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" />
                                                <ItemStyle CssClass="itemStyle" />
                                                <Columns>
                                                    <asp:TemplateColumn HeaderText="阶段">
                                                        <ItemTemplate>
                                                            <asp:Button ID="BT_Stage" runat="server" CssClass="inpu" Text='<%# DataBinder.Eval(Container.DataItem,"Stage") %>' />
                                                        </ItemTemplate>
                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="60%" />
                                                    </asp:TemplateColumn>
                                                    <asp:BoundColumn DataField="Possibility" HeaderText="可能性">
                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="40%" />
                                                    </asp:BoundColumn>
                                                </Columns>
                                                <HeaderStyle BackColor="#57CD1" Font-Bold="True" ForeColor="White" />
                                            </asp:DataGrid>
                                            <div style="width: 200px;">
                                                <asp:Label ID="Label492265" runat="server" Text="<%$ Resources:lang,JieDuan%>"></asp:Label>
                                                <asp:TextBox ID="TB_CustomerQuestionStage" runat="server" Width="135px"></asp:TextBox>
                                            </div>
                                            <asp:Label ID="Label492266" runat="server" Text="<%$ Resources:lang,KeNengXing%>"></asp:Label>
                                            <asp:TextBox ID="TB_CustomerQuestionPossibility" runat="server" Text="0" Width="50px"></asp:TextBox>
                                            %
                                            <br />
                                            <br />
                                            <asp:Button ID="BT_AddCustomerQuestionStage" runat="server" CssClass="inpu" OnClick="BT_AddCustomerQuestionStage_Click" Text="<%$ Resources:lang,XinZeng%>" />
                                            <asp:Button ID="BT_DeleteCustomerQuestionPossibility" runat="server" CssClass="inpu" OnClick="BT_DeleteCustomerQuestionPossibility_Click" Text="<%$ Resources:lang,ShanChu%>" />
                                        </td>
                                        <td rowspan="2" align="center">
                                            <table background="ImagesSkin/main_n_bj.jpg" border="0" cellpadding="0" cellspacing="0" width="98%">
                                                <tr>
                                                    <td width="7">
                                                        <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" />
                                                    </td>
                                                    <td>
                                                        <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                            <tr>
                                                                <td align="center" width="60%"><strong>
                                                                    <asp:Label ID="Label492268" runat="server" Text="<%$ Resources:lang,JieDuan%>"></asp:Label>
                                                                </strong></td>
                                                                <td align="center" width="40%"><strong>
                                                                    <asp:Label ID="Label492269" runat="server" Text="<%$ Resources:lang,ShunXu%>"></asp:Label>
                                                                </strong></td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                    <td align="right" width="6">
                                                        <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" />
                                                    </td>
                                                </tr>
                                            </table>
                                            <asp:DataGrid ID="DataGrid46" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" OnItemCommand="DataGrid46_ItemCommand" ShowHeader="false" Width="98%">
                                                <FooterStyle BackColor="#57CD1" Font-Bold="True" ForeColor="White" />
                                                <EditItemStyle BackColor="#2461BF" />
                                                <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                <PagerStyle CssClass="notTab" HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" />
                                                <ItemStyle CssClass="itemStyle" />
                                                <Columns>
                                                    <asp:TemplateColumn HeaderText="名称">
                                                        <ItemTemplate>
                                                            <asp:Button ID="BT_Stage" runat="server" CssClass="inpu" Text='<%# DataBinder.Eval(Container.DataItem,"Stage") %>' />
                                                        </ItemTemplate>
                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="60%" />
                                                    </asp:TemplateColumn>
                                                    <asp:BoundColumn DataField="SortNumber" HeaderText="顺序">
                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="40%" />
                                                    </asp:BoundColumn>
                                                </Columns>
                                                <HeaderStyle BackColor="#57CD1" Font-Bold="True" ForeColor="White" />
                                            </asp:DataGrid>
                                            <div style="width: 200px;">
                                                <asp:Label ID="Label492270" runat="server" Text="<%$ Resources:lang,JieDuan%>"></asp:Label>
                                                <asp:TextBox ID="TB_CustomerQuestionCustomerStage" runat="server" Width="135px"></asp:TextBox>
                                            </div>
                                            <asp:Label ID="Label492271" runat="server" Text="<%$ Resources:lang,ShunXu%>"></asp:Label>
                                            <asp:TextBox ID="TB_CustomerQuestionCustomerStageSort" runat="server" Width="135px"></asp:TextBox>
                                            <br />
                                            <br />
                                            <asp:Button ID="BT_AddCustomerQuestionCustomerStage" runat="server" CssClass="inpu" OnClick="BT_AddCustomerQuestionCustomerStage_Click" Text="<%$ Resources:lang,XinZeng%>" />
                                            <asp:Button ID="BT_DeleteCustomerQuestionCustomerStage" runat="server" CssClass="inpu" OnClick="BT_DeleteCustomerQuestionCustomerStage_Click" Text="<%$ Resources:lang,ShanChu%>" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>&nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td colspan="5" style="background-color: buttonface; text-align: left;"><strong>
                                            <asp:Label ID="Label8" runat="server" Text="<%$ Resources:lang,CaiWuZhangWuLei%>"></asp:Label>
                                        </strong></b></td>
                                        <td style="background-color: buttonface"></td>
                                        <td colspan="2" style="background-color: buttonface"></td>
                                    </tr>
                                    <tr>
                                        <td style="height: 19px;"><strong>
                                            <asp:Label ID="Label448" runat="server" Text="<%$ Resources:lang,HeTongDaLei%>"></asp:Label>
                                        </strong></td>
                                        <td><strong><b>
                                            <asp:Label ID="Label453" runat="server" Text="<%$ Resources:lang,HeTongLeiXing%>"></asp:Label>
                                        </b>&nbsp; </strong></td>
                                        <td align="center"><strong>
                                            <asp:Label ID="Label222" runat="server" Text="<%$ Resources:lang,YinHang%>"></asp:Label>
                                        </strong></td>
                                        <td><strong>
                                            <asp:Label ID="Label4118" runat="server" Text="<%$ Resources:lang,ShouFuKuanFangShi%>"></asp:Label>
                                        </strong></td>
                                        <td align="center" colspan="4"><strong>
                                            <asp:Label ID="Label225" runat="server" Text="<%$ Resources:lang,KHXQFWRYYYWZ%>"></asp:Label>
                                        </strong>
                                            <br />
                                            (格式如TTCustomerQuestion.aspx?WebSite=WW.TAKETOPITS.COM)</td>
                                    </tr>
                                    <tr>
                                        <td valign="top" align="center">
                                            <table background="ImagesSkin/main_n_bj.jpg" border="0" cellpadding="0" cellspacing="0" width="98%">
                                                <tr>
                                                    <td>
                                                        <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                            <tr>
                                                                <td align="center" width="60%"><strong>
                                                                    <asp:Label ID="Label449" runat="server" Text="<%$ Resources:lang,LeiXingMingCheng%>"></asp:Label>
                                                                </strong></td>
                                                                <td align="center" width="40%"><strong>
                                                                    <asp:Label ID="Label45" runat="server" Text="<%$ Resources:lang,PaiXu%>"></asp:Label>
                                                                </strong></td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                </tr>
                                            </table>
                                            <asp:DataGrid ID="DataGrid37" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" OnItemCommand="DataGrid37_ItemCommand" ShowHeader="false" Width="98%">
                                                <FooterStyle BackColor="#57CD1" Font-Bold="True" ForeColor="White" />
                                                <EditItemStyle BackColor="#2461BF" />
                                                <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                <PagerStyle CssClass="notTab" HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" />
                                                <ItemStyle CssClass="itemStyle" />
                                                <Columns>
                                                    <asp:TemplateColumn HeaderText="类型名称">
                                                        <ItemTemplate>
                                                            <asp:Button ID="BT_ConstractBigType" runat="server" CssClass="inpu" Text='<%# DataBinder.Eval(Container.DataItem,"BigType") %>' />
                                                        </ItemTemplate>
                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="60%" />
                                                    </asp:TemplateColumn>
                                                    <asp:BoundColumn DataField="SortNumber" HeaderText="排序">
                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="40%" />
                                                    </asp:BoundColumn>
                                                </Columns>
                                            </asp:DataGrid>
                                            <asp:Label ID="Label451" runat="server" Text="<%$ Resources:lang,LeiXing%>"></asp:Label>
                                            <asp:TextBox ID="TB_ConstractBigType" runat="server" Width="110px"></asp:TextBox>
                                            <br />
                                            <asp:Label ID="Label452" runat="server" Text="<%$ Resources:lang,ShunXu%>"></asp:Label>
                                            <asp:TextBox ID="TB_ConstractBigTypeSortNo" runat="server" Width="110px"></asp:TextBox>
                                            <br />
                                            <br />
                                            <asp:Button ID="BT_AddConstractBigType" runat="server" CssClass="inpu" OnClick="BT_AddConstractBigType_Click" Text="<%$ Resources:lang,XinZeng%>" />
                                            <asp:Button ID="BT_DeleteConstractBigType" runat="server" CssClass="inpu" OnClick="BT_DeleteConstractType_Click" Text="<%$ Resources:lang,ShanChu%>" />
                                        </td>
                                        <td valign="top" align="center">
                                            <table background="ImagesSkin/main_n_bj.jpg" border="0" cellpadding="0" cellspacing="0" width="98%">
                                                <tr>
                                                    <td width="7">
                                                        <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" />
                                                    </td>
                                                    <td>
                                                        <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                            <tr>
                                                                <td align="center" width="40%"><strong>
                                                                    <asp:Label ID="Label454" runat="server" Text="<%$ Resources:lang,LeiXing%>"></asp:Label>
                                                                </strong></td>
                                                                <td align="center" width="20%"><strong>
                                                                    <asp:Label ID="Label455" runat="server" Text="<%$ Resources:lang,GuanJianCi%>"></asp:Label>
                                                                </strong></td>
                                                                <td align="center" width="20%"><strong>
                                                                    <asp:Label ID="Label456" runat="server" Text="<%$ Resources:lang,ShunXu%>"></asp:Label>
                                                                </strong></td>
                                                                <td align="center"><strong>
                                                                    <asp:Label ID="Label45622" runat="server" Text="<%$ Resources:lang,MuBan%>"></asp:Label>
                                                                </strong></td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                    <td align="right" width="6">
                                                        <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" />
                                                    </td>
                                                </tr>
                                            </table>
                                            <asp:DataGrid ID="DataGrid22" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" OnItemCommand="DataGrid22_ItemCommand" ShowHeader="false" Width="98%">
                                                <FooterStyle BackColor="#57CD1" Font-Bold="True" ForeColor="White" />
                                                <EditItemStyle BackColor="#2461BF" />
                                                <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                <PagerStyle CssClass="notTab" HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" />
                                                <ItemStyle CssClass="itemStyle" />
                                                <Columns>
                                                    <asp:TemplateColumn HeaderText="类型">
                                                        <ItemTemplate>
                                                            <asp:Button ID="BT_ConstractType" runat="server" CssClass="inpu" Text='<%# DataBinder.Eval(Container.DataItem,"Type") %>' />
                                                        </ItemTemplate>
                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="40%" />
                                                    </asp:TemplateColumn>
                                                    <asp:BoundColumn DataField="KeyWord" HeaderText="关键词">
                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="20%" />
                                                    </asp:BoundColumn>
                                                    <asp:BoundColumn DataField="SortNumber" HeaderText="顺序">
                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="20%" />
                                                    </asp:BoundColumn>
                                                    <asp:TemplateColumn>
                                                        <ItemTemplate>
                                                            <asp:HyperLink ID="HL_WorkflowWFTemplate" Text="<%$ Resources:lang,LiuCheng%>" runat="server" NavigateUrl='<%# DataBinder.Eval(Container, "DataItem.Type", "TTAttachWorkFlowTemplate.aspx?RelatedType=ConstractType&RelatedName={0}") %>'
                                                                Target="_blank"></asp:HyperLink>
                                                        </ItemTemplate>
                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" />
                                                    </asp:TemplateColumn>
                                                </Columns>
                                                <HeaderStyle BackColor="#57CD1" Font-Bold="True" ForeColor="White" />
                                            </asp:DataGrid>
                                            <asp:Label ID="Label457" runat="server" Text="<%$ Resources:lang,LeiXing%>"></asp:Label>
                                            <asp:TextBox ID="TB_ConstractType" runat="server" Width="100px"></asp:TextBox>
                                            <br />
                                            <asp:Label ID="Label458" runat="server" Text="<%$ Resources:lang,GuanJianCi%>"></asp:Label>
                                            <asp:TextBox ID="TB_ConstractTypeKeyWord" runat="server" Width="110"></asp:TextBox>
                                            <br />
                                            <asp:Label ID="Label459" runat="server" Text="<%$ Resources:lang,ShunXu%>"></asp:Label>
                                            <asp:TextBox ID="TB_ConstractTypeSort" runat="server" Width="100px"></asp:TextBox>
                                            <br />
                                            <br />
                                            <asp:Button ID="BT_ConstractAdd" runat="server" CssClass="inpu" OnClick="BT_ConstractAdd_Click" Text="<%$ Resources:lang,XinZeng%>" />
                                            <asp:Button ID="BT_ConstractDelete" runat="server" CssClass="inpu" OnClick="BT_ConstractDelete_Click" Text="<%$ Resources:lang,ShanChu%>" />
                                        </td>
                                        <td valign="top" align="center">
                                            <table background="ImagesSkin/main_n_bj.jpg" border="0" cellpadding="0" cellspacing="0" width="98%">
                                                <tr>
                                                    <td width="7">
                                                        <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" />
                                                    </td>
                                                    <td>
                                                        <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                            <tr>
                                                                <td align="center" width="60%"><strong>
                                                                    <asp:Label ID="Label226" runat="server" Text="<%$ Resources:lang,MingCheng%>"></asp:Label>
                                                                </strong></td>
                                                                <td align="center" width="40%"><strong>
                                                                    <asp:Label ID="Label227" runat="server" Text="<%$ Resources:lang,ShunXu%>"></asp:Label>
                                                                </strong></td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                    <td align="right" width="6">
                                                        <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" />
                                                    </td>
                                                </tr>
                                            </table>
                                            <asp:DataGrid ID="DataGrid39" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" OnItemCommand="DataGrid39_ItemCommand" ShowHeader="false" Width="98%">
                                                <FooterStyle BackColor="#57CD1" Font-Bold="True" ForeColor="White" />
                                                <EditItemStyle BackColor="#2461BF" />
                                                <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                <PagerStyle CssClass="notTab" HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" />
                                                <ItemStyle CssClass="itemStyle" />
                                                <Columns>
                                                    <asp:TemplateColumn HeaderText="名称">
                                                        <ItemTemplate>
                                                            <asp:Button ID="BT_BankName" runat="server" CssClass="inpu" Text='<%# DataBinder.Eval(Container.DataItem,"BankName") %>' />
                                                        </ItemTemplate>
                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="60%" />
                                                    </asp:TemplateColumn>
                                                    <asp:BoundColumn DataField="SortNumber" HeaderText="顺序">
                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="40%" />
                                                    </asp:BoundColumn>
                                                </Columns>
                                                <HeaderStyle BackColor="#57CD1" Font-Bold="True" ForeColor="White" />
                                            </asp:DataGrid>
                                            <asp:Label ID="Label236" runat="server" Text="<%$ Resources:lang,YinHang%>"></asp:Label>
                                            <asp:TextBox ID="TB_BankName" runat="server" Width="110"></asp:TextBox>
                                            <br />
                                            <asp:Label ID="Label241" runat="server" Text="<%$ Resources:lang,ShunXu%>"></asp:Label>
                                            <asp:TextBox ID="TB_BankSort" runat="server" Width="110"></asp:TextBox>
                                            <br />
                                            <br />
                                            <asp:Button ID="BT_AddBank" runat="server" CssClass="inpu" OnClick="BT_AddBank_Click" Text="<%$ Resources:lang,XinZeng%>" />
                                            <asp:Button ID="BT_DeleteBank" runat="server" CssClass="inpu" OnClick="BT_DeleteBank_Click" Text="<%$ Resources:lang,ShanChu%>" />
                                        </td>
                                        <td valign="top" align="center">
                                            <table background="ImagesSkin/main_n_bj.jpg" border="0" cellpadding="0" cellspacing="0" width="98%">
                                                <tr>
                                                    <td width="7">
                                                        <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" />
                                                    </td>
                                                    <td>
                                                        <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                            <tr>
                                                                <td align="center" width="60%"><strong>
                                                                    <asp:Label ID="Label2111" runat="server" Text="<%$ Resources:lang,MingCheng%>"></asp:Label>
                                                                </strong></td>
                                                                <td align="center" width="40%"><strong>
                                                                    <asp:Label ID="Label211" runat="server" Text="<%$ Resources:lang,ShunXu%>"></asp:Label>
                                                                </strong></td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                    <td align="right" width="6">
                                                        <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" />
                                                    </td>
                                                </tr>
                                            </table>
                                            <asp:DataGrid ID="DataGrid38" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" OnItemCommand="DataGrid38_ItemCommand" ShowHeader="false" Width="98%">
                                                <FooterStyle BackColor="#57CD1" Font-Bold="True" ForeColor="White" />
                                                <EditItemStyle BackColor="#2461BF" />
                                                <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                <PagerStyle CssClass="notTab" HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" />
                                                <ItemStyle CssClass="itemStyle" />
                                                <Columns>
                                                    <asp:TemplateColumn HeaderText="名称">
                                                        <ItemTemplate>
                                                            <asp:Button ID="BT_ReceivePayType" runat="server" CssClass="inpu" Text='<%# DataBinder.Eval(Container.DataItem,"Type") %>' />
                                                        </ItemTemplate>
                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="60%" />
                                                    </asp:TemplateColumn>
                                                    <asp:BoundColumn DataField="SortNumber" HeaderText="顺序">
                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="40%" />
                                                    </asp:BoundColumn>
                                                </Columns>
                                                <HeaderStyle BackColor="#57CD1" Font-Bold="True" ForeColor="White" />
                                            </asp:DataGrid>
                                            <asp:Label ID="Label217" runat="server" Text="<%$ Resources:lang,FangShi%>"></asp:Label>
                                            <asp:TextBox ID="TB_ReceivePayType" runat="server" Width="120px"></asp:TextBox>
                                            <br />
                                            <asp:Label ID="Label221" runat="server" Text="<%$ Resources:lang,ShunXu%>"></asp:Label>
                                            <asp:TextBox ID="TB_ReceivePayTypeSort" runat="server" Width="110"></asp:TextBox>
                                            <br />
                                            <br />
                                            <asp:Button ID="BT_AddReceivePayWay" runat="server" CssClass="inpu" OnClick="BT_AddReceivePayWay_Click" Text="<%$ Resources:lang,XinZeng%>" />
                                            <asp:Button ID="BT_DeleteReceivePayWay" runat="server" CssClass="inpu" OnClick="BT_DeleteReceivePayWay_Click" Text="<%$ Resources:lang,ShanChu%>" />
                                        </td>
                                        <td colspan="4" align="center">
                                            <asp:DataGrid ID="DataGrid41" runat="server" AutoGenerateColumns="False" GridLines="None" OnItemCommand="DataGrid41_ItemCommand" ShowHeader="False" Width="100%">
                                                <FooterStyle BackColor="#57CD1" Font-Bold="True" ForeColor="White" />
                                                <EditItemStyle BackColor="#2461BF" />
                                                <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                <PagerStyle CssClass="notTab" HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" />
                                                <ItemStyle CssClass="itemStyle" />
                                                <Columns>
                                                    <asp:TemplateColumn HeaderText="域名">
                                                        <ItemTemplate>
                                                            <asp:Button ID="BT_WebSite" runat="server" CssClass="inpuLongest" Text='<%# DataBinder.Eval(Container.DataItem,"WebSite") %>' />
                                                        </ItemTemplate>
                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                    </asp:TemplateColumn>
                                                    <asp:BoundColumn DataField="UserCode" HeaderText="代码">
                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="20%" />
                                                    </asp:BoundColumn>
                                                    <asp:BoundColumn DataField="UserName" HeaderText="名称">
                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="20%" />
                                                    </asp:BoundColumn>
                                                    <asp:BoundColumn DataField="SortNumber" HeaderText="顺序">
                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="100%" />
                                                    </asp:BoundColumn>
                                                </Columns>
                                            </asp:DataGrid>
                                            <table>
                                                <tr>
                                                    <td align="right" width="30%">
                                                        <asp:Label ID="Label235" runat="server" Text="<%$ Resources:lang,WangZhan%>"></asp:Label>
                                                    </td>
                                                    <td align="left">
                                                        <asp:TextBox ID="TB_WebSite" runat="server" Width="280px"></asp:TextBox>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="right">
                                                        <asp:Label ID="Label239" runat="server" Text="<%$ Resources:lang,KeFuRenYuanDaiMa%>"></asp:Label>
                                                    </td>
                                                    <td align="left">
                                                        <asp:TextBox ID="TB_SiteUserCode" runat="server"></asp:TextBox>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="right">
                                                        <asp:Label ID="Label2114" runat="server" Text="<%$ Resources:lang,XingMing%>"></asp:Label>
                                                    </td>
                                                    <td align="left">
                                                        <asp:TextBox ID="TB_SiteUserName" runat="server" Width="150px"></asp:TextBox>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="right">
                                                        <asp:Label ID="Label244" runat="server" Text="<%$ Resources:lang,ShunXu%>"></asp:Label>
                                                    </td>
                                                    <td align="left">
                                                        <asp:TextBox ID="TB_WebSiteSort" runat="server"></asp:TextBox>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td colspan="2" align="center">
                                                        <br />
                                                        <asp:Button ID="BT_AddWebSiteOperator" runat="server" CssClass="inpu" OnClick="BT_AddWebSiteOperator_Click" Text="<%$ Resources:lang,XinZeng%>" />
                                                        <asp:Button ID="BT_DeleteWebSiteOperator" runat="server" CssClass="inpu" OnClick="BT_DeleteWebSiteOperator_Click" Text="<%$ Resources:lang,ShanChu%>" />
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="8" style="background-color: beige; height: 20px; text-align: left;">
                                            <strong>&nbsp;
                                            </strong>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="height: 19px;"><strong>
                                            <asp:Label ID="Label16" runat="server" Text="发票类型"></asp:Label>
                                        </strong></td>
                                        <td><strong>
                                            <asp:Label ID="Label18" runat="server" Text="销售类型"></asp:Label>
                                        </strong></td>
                                        <td align="center">&nbsp;</td>
                                        <td>&nbsp;</td>
                                        <td align="center" colspan="4">&nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td valign="top" align="center">
                                            <table background="ImagesSkin/main_n_bj.jpg" border="0" cellpadding="0" cellspacing="0" width="98%">
                                                <tr>
                                                    <td>
                                                        <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                            <tr>
                                                                <td align="center" width="60%"><strong>
                                                                    <asp:Label ID="Label38" runat="server" Text="<%$ Resources:lang,LeiXingMingCheng%>"></asp:Label>

                                                                </strong></td>
                                                                <td align="center" width="40%"><strong>
                                                                    <asp:Label ID="Label57" runat="server" Text="<%$ Resources:lang,PaiXu%>"></asp:Label>
                                                                </strong></td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                </tr>
                                            </table>
                                            <asp:DataGrid ID="DataGrid49" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" OnItemCommand="DataGrid49_ItemCommand" ShowHeader="false" Width="98%">
                                                <FooterStyle BackColor="#57CD1" Font-Bold="True" ForeColor="White" />
                                                <EditItemStyle BackColor="#2461BF" />
                                                <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                <PagerStyle CssClass="notTab" HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" />
                                                <ItemStyle CssClass="itemStyle" />
                                                <Columns>
                                                    <asp:TemplateColumn HeaderText="类型名称">
                                                        <ItemTemplate>
                                                            <asp:Button ID="BT_InvoiceType" runat="server" CssClass="inpu" Text='<%# DataBinder.Eval(Container.DataItem,"Type") %>' />
                                                        </ItemTemplate>
                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="60%" />
                                                    </asp:TemplateColumn>
                                                    <asp:BoundColumn DataField="SortNumber" HeaderText="排序">
                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="40%" />
                                                    </asp:BoundColumn>
                                                </Columns>
                                            </asp:DataGrid>
                                            <asp:Label ID="Label492285" runat="server" Text="<%$ Resources:lang,LeiXing%>"></asp:Label>
                                            <asp:TextBox ID="TB_InvoiceType" runat="server" Width="110px"></asp:TextBox>
                                            <br />
                                            <asp:Label ID="Label492286" runat="server" Text="<%$ Resources:lang,ShunXu%>"></asp:Label>
                                            <asp:TextBox ID="TB_InvoiceTypeSort" runat="server" Width="110px"></asp:TextBox>
                                            <br />
                                            <br />
                                            <asp:Button ID="BT_InvoiceTypeNew" runat="server" CssClass="inpu" Text="<%$ Resources:lang,XinZeng%>" OnClick="BT_InvoiceTypeNew_Click" />
                                            <asp:Button ID="BT_InvoiceTypeDelete" runat="server" CssClass="inpu" Text="<%$ Resources:lang,ShanChu%>" OnClick="BT_InvoiceTypeDelete_Click" />
                                        </td>
                                        <td valign="top" align="center">
                                            <table background="ImagesSkin/main_n_bj.jpg" border="0" cellpadding="0" cellspacing="0" width="98%">
                                                <tr>
                                                    <td>
                                                        <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                            <tr>
                                                                <td align="center" width="60%"><strong>
                                                                    <asp:Label ID="Label492283" runat="server" Text="<%$ Resources:lang,LeiXingMingCheng%>"></asp:Label>
                                                                </strong></td>
                                                                <td align="center" width="40%"><strong>
                                                                    <asp:Label ID="Label492284" runat="server" Text="<%$ Resources:lang,PaiXu%>"></asp:Label>
                                                                </strong></td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                </tr>
                                            </table>
                                            <asp:DataGrid ID="DataGrid12" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" OnItemCommand="DataGrid12_ItemCommand" ShowHeader="false" Width="98%">
                                                <FooterStyle BackColor="#57CD1" Font-Bold="True" ForeColor="White" />
                                                <EditItemStyle BackColor="#2461BF" />
                                                <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                <PagerStyle CssClass="notTab" HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" />
                                                <ItemStyle CssClass="itemStyle" />
                                                <Columns>
                                                    <asp:TemplateColumn HeaderText="类型名称">
                                                        <ItemTemplate>
                                                            <asp:Button ID="BT_SaleType" runat="server" CssClass="inpu" Text='<%# DataBinder.Eval(Container.DataItem,"Type") %>' />
                                                        </ItemTemplate>
                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="60%" />
                                                    </asp:TemplateColumn>
                                                    <asp:BoundColumn DataField="SortNumber" HeaderText="排序">
                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="40%" />
                                                    </asp:BoundColumn>
                                                </Columns>
                                            </asp:DataGrid>
                                            <asp:Label ID="Label96" runat="server" Text="<%$ Resources:lang,LeiXing%>"></asp:Label>
                                            <asp:TextBox ID="TB_SaleType" runat="server" Width="110px"></asp:TextBox>
                                            <br />
                                            <asp:Label ID="Label97" runat="server" Text="<%$ Resources:lang,ShunXu%>"></asp:Label>
                                            <asp:TextBox ID="TB_SaleTypeSort" runat="server" Width="110px"></asp:TextBox>
                                            <br />
                                            <br />
                                            <asp:Button ID="BT_SaleTypeNew" runat="server" CssClass="inpu" Text="<%$ Resources:lang,XinZeng%>" OnClick="BT_SaleTypeNew_Click" />
                                            <asp:Button ID="BT_SaleTypeDelete" runat="server" CssClass="inpu" Text="<%$ Resources:lang,ShanChu%>" OnClick="BT_SaleTypeDelete_Click" />
                                        </td>
                                        <td valign="top" align="center">&nbsp;</td>
                                        <td valign="top" align="center">&nbsp;</td>
                                        <td colspan="4" align="center">&nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td colspan="4" style="background-color: buttonface; text-align: left;"></td>
                                        <td colspan="3" align="left" style="background-color: buttonface;">
                                            <table style="display: none;">
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="Label95" runat="server" Text="<%$ Resources:lang,ChuRuKuShuanFA%>"></asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:DropDownList ID="DL_StockCountMethod" AutoPostBack="true" runat="server" OnSelectedIndexChanged="DL_StockCountMethod_SelectedIndexChanged">
                                                            <asp:ListItem Value="FIFO" Text="<%$ Resources:lang,XianJingXianChu%>" />
                                                            <asp:ListItem Value="MWAM" Text="<%$ Resources:lang,JiaQuanPingJIng%>" />
                                                        </asp:DropDownList>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="height: 7px;"><strong>
                                            <asp:Label ID="Label359" runat="server" Text="<%$ Resources:lang,ZCYCLLXSD%>"></asp:Label>
                                        </strong></td>
                                        <td><strong>
                                            <asp:Label ID="Label58" runat="server" Text="<%$ Resources:lang,ZiChanWeiHuLeiXing%>"></asp:Label>
                                        </strong></td>
                                        <td><strong>
                                            <asp:Label ID="Label59" runat="server" Text="<%$ Resources:lang,ZiChanDiaoHuanLeiXing%>"></asp:Label>
                                        </strong></td>
                                        <td><strong>
                                            <asp:Label ID="Label6" runat="server" Text="包装方式"></asp:Label>
                                        </strong></td>
                                        <td><strong>
                                            <asp:Label ID="Label374" runat="server" Text="<%$ Resources:lang,ChuKuLeiXing%>"></asp:Label>
                                        </strong></td>
                                        <td colspan="2"><strong>
                                            <asp:Label ID="Label387" runat="server" Text="<%$ Resources:lang,RuKuLeiXing%>"></asp:Label>
                                        </strong></td>
                                    </tr>
                                    <tr>
                                        <td valign="top" align="center">
                                            <table background="ImagesSkin/main_n_bj.jpg" border="0" cellpadding="0" cellspacing="0" width="98%">
                                                <tr>
                                                    <td width="7">
                                                        <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" />
                                                    </td>
                                                    <td>
                                                        <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                            <tr>
                                                                <td align="center" width="60%"><strong>
                                                                    <asp:Label ID="Label36" runat="server" Text="<%$ Resources:lang,LeiXing%>"></asp:Label>
                                                                </strong></td>
                                                                <td align="center" width="40%"><strong>
                                                                    <asp:Label ID="Label361" runat="server" Text="<%$ Resources:lang,ShunXu%>"></asp:Label>
                                                                </strong></td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                    <td align="right" width="6">
                                                        <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" />
                                                    </td>
                                                </tr>
                                            </table>
                                            <asp:DataGrid ID="DataGrid4" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" OnItemCommand="DataGrid4_ItemCommand" ShowHeader="false" Width="98%">
                                                <FooterStyle BackColor="#57CD1" Font-Bold="True" ForeColor="White" />
                                                <EditItemStyle BackColor="#2461BF" />
                                                <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                <PagerStyle CssClass="notTab" HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" />
                                                <ItemStyle CssClass="itemStyle" />
                                                <Columns>
                                                    <asp:TemplateColumn HeaderText="类型">
                                                        <ItemTemplate>
                                                            <asp:Button ID="BT_AssetType" runat="server" CssClass="inpu" Text='<%# DataBinder.Eval(Container.DataItem,"Type") %>' />
                                                        </ItemTemplate>
                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="60%" />
                                                    </asp:TemplateColumn>
                                                    <asp:BoundColumn DataField="SortNumber" HeaderText="顺序">
                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="40%" />
                                                    </asp:BoundColumn>
                                                </Columns>
                                            </asp:DataGrid>
                                            <asp:Label ID="Label362" runat="server" Text="<%$ Resources:lang,LeiXing%>"></asp:Label>
                                            <asp:TextBox ID="TB_AssetType" runat="server" Width="110px"></asp:TextBox>
                                            <br />
                                            <asp:Label ID="Label363" runat="server" Text="<%$ Resources:lang,ShunXu%>"></asp:Label>
                                            <asp:TextBox ID="TB_AssetTypeSort" runat="server" Width="110px"></asp:TextBox>
                                            <br />
                                            <br />
                                            <asp:Button ID="BT_AssetTypeNew1" runat="server" CssClass="inpu" OnClick="BT_AssetTypeNew_Click" Text="<%$ Resources:lang,XinZeng%>" />
                                            <asp:Button ID="BT_AssetTypeDelete" runat="server" CssClass="inpu" OnClick="BT_AssetTypeDelete_Click" Text="<%$ Resources:lang,ShanChu%>" />
                                        </td>
                                        <td valign="top" align="center">
                                            <table background="ImagesSkin/main_n_bj.jpg" border="0" cellpadding="0" cellspacing="0" width="98%">
                                                <tr>
                                                    <td width="7">
                                                        <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" />
                                                    </td>
                                                    <td>
                                                        <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                            <tr>
                                                                <td align="center" width="60%"><strong>
                                                                    <asp:Label ID="Label64" runat="server" Text="<%$ Resources:lang,LeiXing%>"></asp:Label>
                                                                </strong></td>
                                                                <td align="center" width="40%"><strong>
                                                                    <asp:Label ID="Label65" runat="server" Text="<%$ Resources:lang,ShunXu%>"></asp:Label>
                                                                </strong></td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                    <td align="right" width="6">
                                                        <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" />
                                                    </td>
                                                </tr>
                                            </table>
                                            <asp:DataGrid ID="DataGrid10" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" OnItemCommand="DataGrid10_ItemCommand" ShowHeader="false" Width="98%">
                                                <FooterStyle BackColor="#57CD1" Font-Bold="True" ForeColor="White" />
                                                <EditItemStyle BackColor="#2461BF" />
                                                <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                <PagerStyle CssClass="notTab" HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" />
                                                <ItemStyle CssClass="itemStyle" />
                                                <Columns>
                                                    <asp:TemplateColumn HeaderText="类型">
                                                        <ItemTemplate>
                                                            <asp:Button ID="BT_MTType" runat="server" CssClass="inpu" Text='<%# DataBinder.Eval(Container.DataItem,"Type") %>' />
                                                        </ItemTemplate>
                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="60%" />
                                                    </asp:TemplateColumn>
                                                    <asp:BoundColumn DataField="SortNumber" HeaderText="顺序">
                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="40%" />
                                                    </asp:BoundColumn>
                                                </Columns>
                                                <HeaderStyle BackColor="#57CD1" Font-Bold="True" ForeColor="White" />
                                            </asp:DataGrid>
                                            <asp:Label ID="Label73" runat="server" Text="<%$ Resources:lang,LeiXing%>"></asp:Label>
                                            <asp:TextBox ID="TB_MTType" runat="server" Width="110px"></asp:TextBox>
                                            <br />
                                            <asp:Label ID="Label78" runat="server" Text="<%$ Resources:lang,ShunXu%>"></asp:Label>
                                            <asp:TextBox ID="TB_MTTypeSort" runat="server" Width="110px"></asp:TextBox>
                                            <br />
                                            <br />
                                            <asp:Button ID="BT_MTTypeNew" runat="server" CssClass="inpu" OnClick="BT_MTTypeNew_Click" Text="<%$ Resources:lang,XinZeng%>" />
                                            <asp:Button ID="BT_MTTypeDelete" runat="server" CssClass="inpu" OnClick="BT_MTTypeDelete_Click" Text="<%$ Resources:lang,ShanChu%>" />
                                        </td>
                                        <td valign="top" align="center">
                                            <table background="ImagesSkin/main_n_bj.jpg" border="0" cellpadding="0" cellspacing="0" width="98%">
                                                <tr>
                                                    <td width="7">
                                                        <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" />
                                                    </td>
                                                    <td>
                                                        <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                            <tr>
                                                                <td align="center" width="60%"><strong>
                                                                    <asp:Label ID="Label66" runat="server" Text="<%$ Resources:lang,LeiXing%>"></asp:Label>
                                                                </strong></td>
                                                                <td align="center" width="40%"><strong>
                                                                    <asp:Label ID="Label67" runat="server" Text="<%$ Resources:lang,ShunXu%>"></asp:Label>
                                                                </strong></td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                    <td align="right" width="6">
                                                        <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" />
                                                    </td>
                                                </tr>
                                            </table>
                                            <asp:DataGrid ID="DataGrid11" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" OnItemCommand="DataGrid11_ItemCommand" ShowHeader="false" Width="98%">
                                                <FooterStyle BackColor="#57CD1" Font-Bold="True" ForeColor="White" />
                                                <EditItemStyle BackColor="#2461BF" />
                                                <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                <PagerStyle CssClass="notTab" HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" />
                                                <ItemStyle CssClass="itemStyle" />
                                                <Columns>
                                                    <asp:TemplateColumn HeaderText="类型">
                                                        <ItemTemplate>
                                                            <asp:Button ID="BT_ChangeType" runat="server" CssClass="inpu" Text='<%# DataBinder.Eval(Container.DataItem,"Type") %>' />
                                                        </ItemTemplate>
                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="60%" />
                                                    </asp:TemplateColumn>
                                                    <asp:BoundColumn DataField="SortNumber" HeaderText="顺序">
                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="40%" />
                                                    </asp:BoundColumn>
                                                </Columns>
                                                <HeaderStyle BackColor="#57CD1" Font-Bold="True" ForeColor="White" />
                                            </asp:DataGrid>
                                            <div>
                                                <asp:Label ID="Label74" runat="server" Text="<%$ Resources:lang,LeiXing%>"></asp:Label>
                                                <asp:TextBox ID="TB_ChangeType" runat="server" Width="110px"></asp:TextBox>
                                            </div>
                                            <asp:Label ID="Label79" runat="server" Text="<%$ Resources:lang,ShunXu%>"></asp:Label>
                                            <asp:TextBox ID="TB_ChangeTypeSort" runat="server" Width="110"></asp:TextBox>
                                            <br />
                                            <br />
                                            <table>
                                                <tr>
                                                    <td>
                                                        <asp:Button ID="BT_ChangeTypeNew" runat="server" CssClass="inpu" OnClick="BT_ChangeTypeNew_Click" Text="<%$ Resources:lang,XinZeng%>" />
                                                    </td>
                                                    <td>
                                                        <asp:Button ID="BT_ChangeTypeDelete" runat="server" CssClass="inpu" OnClick="BT_ChangeTypeDelete_Click" Text="<%$ Resources:lang,ShanChu%>" />
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                        <td align="center">
                                            <table background="ImagesSkin/main_n_bj.jpg" border="0" cellpadding="0" cellspacing="0" width="98%">
                                                <tr>
                                                    <td width="7">
                                                        <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" />
                                                    </td>
                                                    <td>
                                                        <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                            <tr>
                                                                <td align="center" width="60%"><strong>
                                                                    <asp:Label ID="Label492279" runat="server" Text="<%$ Resources:lang,LeiXing%>"></asp:Label>
                                                                </strong></td>
                                                                <td align="center" width="40%"><strong>
                                                                    <asp:Label ID="Label492280" runat="server" Text="<%$ Resources:lang,ShunXu%>"></asp:Label>
                                                                </strong></td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                    <td align="right" width="6">
                                                        <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" />
                                                    </td>
                                                </tr>
                                            </table>
                                            <asp:DataGrid ID="DataGrid48" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" OnItemCommand="DataGrid48_ItemCommand" ShowHeader="false" Width="98%">
                                                <FooterStyle BackColor="#57CD1" Font-Bold="True" ForeColor="White" />
                                                <EditItemStyle BackColor="#2461BF" />
                                                <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                <PagerStyle CssClass="notTab" HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" />
                                                <ItemStyle CssClass="itemStyle" />
                                                <Columns>
                                                    <asp:TemplateColumn HeaderText="类型">
                                                        <ItemTemplate>
                                                            <asp:Button ID="BT_PackingType" runat="server" CssClass="inpu" Text='<%# DataBinder.Eval(Container.DataItem,"Type") %>' />
                                                        </ItemTemplate>
                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="60%" />
                                                    </asp:TemplateColumn>
                                                    <asp:BoundColumn DataField="SortNumber" HeaderText="顺序">
                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="40%" />
                                                    </asp:BoundColumn>
                                                </Columns>
                                                <HeaderStyle BackColor="#57CD1" Font-Bold="True" ForeColor="White" />
                                            </asp:DataGrid>
                                            <div>
                                                <asp:Label ID="Label492281" runat="server" Text="<%$ Resources:lang,LeiXing%>"></asp:Label>
                                                <asp:TextBox ID="TB_PackingType" runat="server" Width="110px"></asp:TextBox>
                                            </div>
                                            <asp:Label ID="Label492282" runat="server" Text="<%$ Resources:lang,ShunXu%>"></asp:Label>
                                            <asp:TextBox ID="TB_PackingTypeSort" runat="server" Width="110"></asp:TextBox>
                                            <br />
                                            <br />
                                            <table>
                                                <tr>
                                                    <td>
                                                        <asp:Button ID="BT_PackingTypeNew" runat="server" CssClass="inpu" Text="<%$ Resources:lang,XinZeng%>" OnClick="BT_PackingTypeNew_Click" />
                                                    </td>
                                                    <td>
                                                        <asp:Button ID="BT_PackingTypeDelete" runat="server" CssClass="inpu" Text="<%$ Resources:lang,ShanChu%>" OnClick="BT_PackingTypeDelete_Click" />
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                        <td align="center">
                                            <table background="ImagesSkin/main_n_bj.jpg" border="0" cellpadding="0" cellspacing="0" width="98%">
                                                <tr>
                                                    <td>
                                                        <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                            <tr>
                                                                <td align="center" width="60%"><strong>
                                                                    <asp:Label ID="Label375" runat="server" Text="<%$ Resources:lang,LeiXingMingCheng%>"></asp:Label>
                                                                </strong></td>
                                                                <td align="center" width="40%"><strong>
                                                                    <asp:Label ID="Label376" runat="server" Text="<%$ Resources:lang,PaiXu%>"></asp:Label>
                                                                </strong></td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                </tr>
                                            </table>
                                            <asp:DataGrid ID="DataGrid42" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" OnItemCommand="DataGrid42_ItemCommand" ShowHeader="false" Width="98%">
                                                <FooterStyle BackColor="#57CD1" Font-Bold="True" ForeColor="White" />
                                                <EditItemStyle BackColor="#2461BF" />
                                                <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                <PagerStyle CssClass="notTab" HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" />
                                                <ItemStyle CssClass="itemStyle" />
                                                <Columns>
                                                    <asp:TemplateColumn HeaderText="类型名称">
                                                        <ItemTemplate>
                                                            <asp:Button ID="BT_GoodsShipmentType" runat="server" CssClass="inpu" Text='<%# DataBinder.Eval(Container.DataItem,"TypeName").ToString().Trim() %>' />
                                                        </ItemTemplate>
                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="60%" />
                                                    </asp:TemplateColumn>
                                                    <asp:BoundColumn DataField="SortNumber" HeaderText="排序">
                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="40%" />
                                                    </asp:BoundColumn>
                                                </Columns>
                                            </asp:DataGrid>
                                            <div style="width: 200px;">
                                                <asp:Label ID="Label377" runat="server" Text="<%$ Resources:lang,LeiXing%>"></asp:Label>
                                                <asp:TextBox ID="TB_GoodsShipmentType" runat="server" Width="130"></asp:TextBox>
                                            </div>
                                            <asp:Label ID="Label378" runat="server" Text="<%$ Resources:lang,ShunXu%>"></asp:Label>
                                            <asp:TextBox ID="TB_GoodsShipmentSort" runat="server" Width="130"></asp:TextBox>
                                            <br />
                                            <br />
                                            <asp:Button ID="BT_GoodsShipmentAdd" runat="server" CssClass="inpu" OnClick="BT_GoodsShipmentAdd_Click" Text="<%$ Resources:lang,XinZeng%>" />
                                            <asp:Button ID="BT_GoodsShipmentDelete" runat="server" CssClass="inpu" OnClick="BT_GoodsShipmentDelete_Click" Text="<%$ Resources:lang,ShanChu%>" />
                                        </td>
                                        <td colspan="2" align="center">
                                            <table background="ImagesSkin/main_n_bj.jpg" border="0" cellpadding="0" cellspacing="0" width="98%">
                                                <tr>
                                                    <td>
                                                        <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                            <tr>
                                                                <td align="center" width="60%"><strong>
                                                                    <asp:Label ID="Label388" runat="server" Text="<%$ Resources:lang,LeiXingMingCheng%>"></asp:Label>
                                                                </strong></td>
                                                                <td align="center" width="40%"><strong>
                                                                    <asp:Label ID="Label389" runat="server" Text="<%$ Resources:lang,PaiXu%>"></asp:Label>
                                                                </strong></td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                </tr>
                                            </table>
                                            <asp:DataGrid ID="DataGrid43" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" OnItemCommand="DataGrid43_ItemCommand" ShowHeader="false" Width="98%">
                                                <FooterStyle BackColor="#57CD1" Font-Bold="True" ForeColor="White" />
                                                <EditItemStyle BackColor="#2461BF" />
                                                <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                <PagerStyle CssClass="notTab" HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" />
                                                <ItemStyle CssClass="itemStyle" />
                                                <Columns>
                                                    <asp:TemplateColumn HeaderText="类型名称">
                                                        <ItemTemplate>
                                                            <asp:Button ID="BT_GoodsCheckInType" runat="server" CssClass="inpu" Text='<%# DataBinder.Eval(Container.DataItem,"TypeName").ToString().Trim() %>' />
                                                        </ItemTemplate>
                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="60%" />
                                                    </asp:TemplateColumn>
                                                    <asp:BoundColumn DataField="SortNumber" HeaderText="排序">
                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="40%" />
                                                    </asp:BoundColumn>
                                                </Columns>
                                            </asp:DataGrid>
                                            <div style="width: 200px;">
                                                <asp:Label ID="Label39" runat="server" Text="<%$ Resources:lang,LeiXing%>"></asp:Label>
                                                <asp:TextBox ID="TB_GoodsCheckInType" runat="server" Width="130"></asp:TextBox>
                                            </div>
                                            <asp:Label ID="Label391" runat="server" Text="<%$ Resources:lang,ShunXu%>"></asp:Label>
                                            <asp:TextBox ID="TB_GoodsCheckInSort" runat="server" Width="130"></asp:TextBox>
                                            <br />
                                            <br />
                                            <asp:Button ID="BT_GoodsCheckInAdd" runat="server" CssClass="inpu" OnClick="BT_GoodsCheckInAdd_Click" Text="<%$ Resources:lang,XinZeng%>" />
                                            <asp:Button ID="BT_GoodsCheckInDelete" runat="server" CssClass="inpu" OnClick="BT_GoodsCheckInDelete_Click" Text="<%$ Resources:lang,ShanChu%>" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="5" style="background-color: buttonface; text-align: left;"><strong>
                                            <asp:Label ID="Label15" runat="server" Text="<%$ Resources:lang,XiangMuRenWuLei%>"></asp:Label>
                                        </strong></b></td>
                                        <td style="background-color: buttonface"></td>
                                        <td colspan="2" style="background-color: buttonface"></td>
                                    </tr>
                                    <tr>
                                        <td style="width: 198px;"><strong>
                                            <asp:Label ID="Label334" runat="server" Text="<%$ Resources:lang,XiangMuRenWuLeiXing%>"></asp:Label>
                                        </strong>&nbsp;</td>
                                        <td style="height: 7px;"><strong>
                                            <asp:Label ID="Label319" runat="server" Text="<%$ Resources:lang,XuQiuLeiXingSheDing%>"></asp:Label>
                                        </strong>&nbsp;</td>
                                        <td style="height: 7px;"><strong>
                                            <asp:Label ID="Label34" runat="server" Text="<%$ Resources:lang,RenWuCaoZuoSheDing%>"></asp:Label>
                                        </strong></td>
                                        <td><strong>
                                            <asp:Label ID="Label462211" runat="server" Text="<%$ Resources:lang,RenWuFenPaiJiLuLeiXing%>"></asp:Label>
                                        </strong>&nbsp; <span class="style1">*</span></td>
                                        <td><strong>
                                            <asp:Label ID="Label422211" runat="server" Text="<%$ Resources:lang,JiHuaLeiXing%>"></asp:Label>
                                        </strong></td>
                                        <td colspan="2"><b>
                                            <asp:Label ID="Label1811" runat="server" Text="<%$ Resources:lang,GongZuoRiZhiJiangJinCanShu%>"></asp:Label>
                                        </b>&nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td valign="top" align="center">
                                            <table background="ImagesSkin/main_n_bj.jpg" border="0" cellpadding="0" cellspacing="0" width="98%">
                                                <tr>
                                                    <td width="7">
                                                        <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" />
                                                    </td>
                                                    <td>
                                                        <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                            <tr>
                                                                <td align="center" width="60%"><strong>
                                                                    <asp:Label ID="Label335" runat="server" Text="<%$ Resources:lang,LeiXing%>"></asp:Label>
                                                                </strong></td>
                                                                <td align="center" width="40%"><strong>
                                                                    <asp:Label ID="Label336" runat="server" Text="<%$ Resources:lang,ShunXu%>"></asp:Label>
                                                                </strong></td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                    <td align="right" width="6">
                                                        <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" />
                                                    </td>
                                                </tr>
                                            </table>
                                            <asp:DataGrid ID="DataGrid18" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" OnItemCommand="DataGrid18_ItemCommand" ShowHeader="false" Width="98%">
                                                <FooterStyle BackColor="#57CD1" Font-Bold="True" ForeColor="White" />
                                                <EditItemStyle BackColor="#2461BF" />
                                                <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                <PagerStyle CssClass="notTab" HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" />
                                                <ItemStyle CssClass="itemStyle" />
                                                <Columns>
                                                    <asp:TemplateColumn HeaderText="类型">
                                                        <ItemTemplate>
                                                            <asp:Button ID="BT_TaskType" runat="server" CssClass="inpu" Text='<%# DataBinder.Eval(Container.DataItem,"Type") %>' />
                                                        </ItemTemplate>
                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="60%" />
                                                    </asp:TemplateColumn>
                                                    <asp:BoundColumn DataField="SortNumber" HeaderText="顺序">
                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="40%" />
                                                    </asp:BoundColumn>
                                                </Columns>
                                                <HeaderStyle BackColor="#57CD1" Font-Bold="True" ForeColor="White" />
                                            </asp:DataGrid>
                                            <asp:Label ID="Label337" runat="server" Text="<%$ Resources:lang,LeiXing%>"></asp:Label>
                                            <asp:TextBox ID="TB_TaskType" runat="server" Width="110px"></asp:TextBox>
                                            <br />
                                            <asp:Label ID="Label492278" runat="server" Text="<%$ Resources:lang,ShunXu%>"></asp:Label>
                                            <asp:TextBox ID="TB_TaskTypeSort" runat="server" Width="110px"></asp:TextBox>
                                            <br />
                                            <br />
                                            <asp:Button ID="BT_TaskTypeNew" runat="server" CssClass="inpu" OnClick="BT_TaskTypeNew_Click" Text="<%$ Resources:lang,XinZeng%>" />
                                            <asp:Button ID="TB_TaskTypeDelete" runat="server" CssClass="inpu" OnClick="BT_TaskTypeDelete_Click" Text="<%$ Resources:lang,ShanChu%>" />
                                        </td>
                                        <td valign="top" align="center">
                                            <table background="ImagesSkin/main_n_bj.jpg" border="0" cellpadding="0" cellspacing="0" width="98%">
                                                <tr>
                                                    <td width="7">
                                                        <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" />
                                                    </td>
                                                    <td>
                                                        <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                            <tr>
                                                                <td align="center" width="60%"><strong>
                                                                    <asp:Label ID="Label321" runat="server" Text="<%$ Resources:lang,ShunXu%>"></asp:Label>
                                                                </strong></td>
                                                                <td align="center" width="40%"><strong>
                                                                    <asp:Label ID="Label3211" runat="server" Text="<%$ Resources:lang,LeiXing%>"></asp:Label>
                                                                </strong></td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                    <td align="right" width="6">
                                                        <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" />
                                                    </td>
                                                </tr>
                                            </table>
                                            <asp:DataGrid ID="DataGrid2" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" OnItemCommand="DataGrid2_ItemCommand" ShowHeader="false" Width="98%">
                                                <FooterStyle BackColor="#57CD1" Font-Bold="True" ForeColor="White" />
                                                <EditItemStyle BackColor="#2461BF" />
                                                <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                <PagerStyle CssClass="notTab" HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" />
                                                <ItemStyle CssClass="itemStyle" />
                                                <Columns>
                                                    <asp:TemplateColumn HeaderText="类型">
                                                        <ItemTemplate>
                                                            <asp:Button ID="BT_ReqType" runat="server" CssClass="inpu" Text='<%# DataBinder.Eval(Container.DataItem,"Type") %>' />
                                                        </ItemTemplate>
                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="60%" />
                                                    </asp:TemplateColumn>
                                                    <asp:BoundColumn DataField="SortNumber" HeaderText="顺序">
                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="40%" />
                                                    </asp:BoundColumn>
                                                </Columns>
                                            </asp:DataGrid>
                                            <asp:Label ID="Label23" runat="server" Text="<%$ Resources:lang,LeiXing%>"></asp:Label>
                                            <asp:TextBox ID="TB_ReqType" runat="server" Width="110px"></asp:TextBox>
                                            <br />
                                            <asp:Label ID="Label2811" runat="server" Text="<%$ Resources:lang,ShunXu%>"></asp:Label>
                                            <asp:TextBox ID="TB_ReqTypeSort" runat="server" Width="110px"></asp:TextBox>
                                            <br />
                                            <br />
                                            <asp:Button ID="BT_ReqTypeNew" runat="server" CssClass="inpu" OnClick="BT_ReqTypeNew_Click" Text="<%$ Resources:lang,XinZeng%>" />
                                            <asp:Button ID="BT_ReqTypeDelete" runat="server" CssClass="inpu" OnClick="BT_ReqTypeDelete_Click" Text="<%$ Resources:lang,ShanChu%>" />
                                        </td>
                                        <td valign="top" align="center">
                                            <table background="ImagesSkin/main_n_bj.jpg" border="0" cellpadding="0" cellspacing="0" width="98%">
                                                <tr>
                                                    <td width="7">
                                                        <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" />
                                                    </td>
                                                    <td>
                                                        <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                            <tr>
                                                                <td align="center" width="60%"><strong>
                                                                    <asp:Label ID="Label4111" runat="server" Text="<%$ Resources:lang,CaoZuo%>"></asp:Label>
                                                                </strong></td>
                                                                <td align="center" width="40%"><strong>
                                                                    <asp:Label ID="Label4211" runat="server" Text="<%$ Resources:lang,ShunXu%>"></asp:Label>
                                                                </strong></td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                    <td align="right" width="6">
                                                        <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" />
                                                    </td>
                                                </tr>
                                            </table>
                                            <asp:DataGrid ID="DataGrid7" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" OnItemCommand="DataGrid7_ItemCommand" ShowHeader="false" Width="98%">
                                                <FooterStyle BackColor="#57CD1" Font-Bold="True" ForeColor="White" />
                                                <EditItemStyle BackColor="#2461BF" />
                                                <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                <PagerStyle CssClass="notTab" HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" />
                                                <ItemStyle CssClass="itemStyle" />
                                                <Columns>
                                                    <asp:TemplateColumn HeaderText="操作">
                                                        <ItemTemplate>
                                                            <asp:Button ID="BT_Operation" runat="server" CssClass="inpu" Text='<%# DataBinder.Eval(Container.DataItem,"Operation") %>' />
                                                        </ItemTemplate>
                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="60%" />
                                                    </asp:TemplateColumn>
                                                    <asp:BoundColumn DataField="SortNumber" HeaderText="顺序">
                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="40%" />
                                                    </asp:BoundColumn>
                                                </Columns>
                                                <HeaderStyle BackColor="#57CD1" Font-Bold="True" ForeColor="White" />
                                            </asp:DataGrid>
                                            <asp:Label ID="Label492211" runat="server" Text="<%$ Resources:lang,CaoZuo%>"></asp:Label>
                                            <asp:TextBox ID="TB_TaskOperation" runat="server" Width="95px"></asp:TextBox>
                                            <br />
                                            <asp:Label ID="Label54" runat="server" Text="<%$ Resources:lang,ShunXu%>"></asp:Label>
                                            <asp:TextBox ID="TB_OperationSortNumber" runat="server" Width="95px"></asp:TextBox>
                                            <br />
                                            <br />
                                            <asp:Button ID="BT_OperationNew" runat="server" CssClass="inpu" OnClick="BT_OperationNew_Click" Text="<%$ Resources:lang,XinZeng%>" />
                                            <asp:Button ID="BT_OperationDelete" runat="server" CssClass="inpu" OnClick="BT_OperationDelete_Click" Text="<%$ Resources:lang,ShanChu%>" />
                                        </td>
                                        <td valign="top" align="center">
                                            <table background="ImagesSkin/main_n_bj.jpg" border="0" cellpadding="0" cellspacing="0" width="98%">
                                                <tr>
                                                    <td width="7">
                                                        <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" />
                                                    </td>
                                                    <td>
                                                        <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                            <tr>
                                                                <td align="center" width="60%"><strong>
                                                                    <asp:Label ID="Label461" runat="server" Text="<%$ Resources:lang,LeiXing%>"></asp:Label>
                                                                </strong></td>
                                                                <td align="center" width="40%"><strong>
                                                                    <asp:Label ID="Label462" runat="server" Text="<%$ Resources:lang,ShunXu%>"></asp:Label>
                                                                </strong></td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                    <td align="right" width="6">
                                                        <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" />
                                                    </td>
                                                </tr>
                                            </table>
                                            <asp:DataGrid ID="DataGrid19" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" OnItemCommand="DataGrid19_ItemCommand" ShowHeader="false" Width="98%">
                                                <FooterStyle BackColor="#57CD1" Font-Bold="True" ForeColor="White" />
                                                <EditItemStyle BackColor="#2461BF" />
                                                <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                <PagerStyle CssClass="notTab" HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" />
                                                <ItemStyle CssClass="itemStyle" />
                                                <Columns>
                                                    <asp:TemplateColumn HeaderText="类型">
                                                        <ItemTemplate>
                                                            <asp:Button ID="BT_TaskRecordType" runat="server" CssClass="inpu" Text='<%# DataBinder.Eval(Container.DataItem,"Type") %>' />
                                                        </ItemTemplate>
                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="60%" />
                                                    </asp:TemplateColumn>
                                                    <asp:BoundColumn DataField="SortNumber" HeaderText="顺序">
                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="40%" />
                                                    </asp:BoundColumn>
                                                </Columns>
                                                <HeaderStyle BackColor="#57CD1" Font-Bold="True" ForeColor="White" />
                                            </asp:DataGrid>
                                            <asp:Label ID="Label463" runat="server" Text="<%$ Resources:lang,LeiXing%>"></asp:Label>
                                            <asp:TextBox ID="TB_TaskRecordType" runat="server" Width="110"></asp:TextBox>
                                            <br />
                                            <asp:Label ID="Label464" runat="server" Text="<%$ Resources:lang,ShunXu%>"></asp:Label>
                                            <asp:TextBox ID="TB_TaskRecordTypeSort" runat="server" Width="110"></asp:TextBox>
                                            <br />
                                            <br />
                                            <asp:Button ID="BT_TaskRecordNew" runat="server" CssClass="inpu" OnClick="BT_TaskRecordNew_Click" Text="<%$ Resources:lang,XinZeng%>" />
                                            <asp:Button ID="BT_TaskRecordDelete" runat="server" CssClass="inpu" OnClick="BT_TaskRecordDelete_Click" Text="<%$ Resources:lang,ShanChu%>" />
                                        </td>
                                        <td align="center">
                                            <table background="ImagesSkin/main_n_bj.jpg" border="0" cellpadding="0" cellspacing="0" width="98%">
                                                <tr>
                                                    <td width="7">
                                                        <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" />
                                                    </td>
                                                    <td>
                                                        <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                            <tr>
                                                                <td align="center" width="60%"><strong>
                                                                    <asp:Label ID="Label421" runat="server" Text="<%$ Resources:lang,MingCheng%>"></asp:Label>
                                                                </strong></td>
                                                                <td align="center" width="40%"><strong>
                                                                    <asp:Label ID="Label422" runat="server" Text="<%$ Resources:lang,ShunXu%>"></asp:Label>
                                                                </strong></td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                    <td align="right" width="6">
                                                        <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" />
                                                    </td>
                                                </tr>
                                            </table>
                                            <asp:DataGrid ID="DataGrid28" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" OnItemCommand="DataGrid28_ItemCommand" ShowHeader="false" Width="98%">
                                                <FooterStyle BackColor="#57CD1" Font-Bold="True" ForeColor="White" />
                                                <EditItemStyle BackColor="#2461BF" />
                                                <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                <PagerStyle CssClass="notTab" HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" />
                                                <ItemStyle CssClass="itemStyle" />
                                                <Columns>
                                                    <asp:TemplateColumn HeaderText="名称">
                                                        <ItemTemplate>
                                                            <asp:Button ID="BT_PlanType" runat="server" CssClass="inpu" Text='<%# DataBinder.Eval(Container.DataItem,"Type") %>' />
                                                        </ItemTemplate>
                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="60%" />
                                                    </asp:TemplateColumn>
                                                    <asp:BoundColumn DataField="SortNumber" HeaderText="顺序">
                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="40%" />
                                                    </asp:BoundColumn>
                                                </Columns>
                                                <HeaderStyle BackColor="#57CD1" Font-Bold="True" ForeColor="White" />
                                            </asp:DataGrid>
                                            <asp:Label ID="Label423" runat="server" Text="<%$ Resources:lang,LeiXing%>"></asp:Label>
                                            <asp:TextBox ID="TB_PlanType" runat="server" Width="135px"></asp:TextBox>
                                            <br />
                                            <asp:Label ID="Label424" runat="server" Text="<%$ Resources:lang,ShunXu%>"></asp:Label>
                                            <asp:TextBox ID="TB_PlanTypeSort" runat="server" Width="135px"></asp:TextBox>
                                            <br />
                                            <br />
                                            <asp:Button ID="BT_AddPlanType" runat="server" CssClass="inpu" OnClick="BT_AddPlanType_Click" Text="<%$ Resources:lang,XinZeng%>" />
                                            <asp:Button ID="BT_DeletePlanType" runat="server" CssClass="inpu" OnClick="BT_DeletePlanType_Click" Text="<%$ Resources:lang,ShanChu%>" />
                                        </td>
                                        <td colspan="2" valign="top" align="center">
                                            <table background="ImagesSkin/main_n_bj.jpg" border="0" cellpadding="0" cellspacing="0" width="98%">
                                                <tr>
                                                    <td width="7">
                                                        <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" />
                                                    </td>
                                                    <td>
                                                        <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                            <tr>
                                                                <td align="center" width="15%"><strong>
                                                                    <asp:Label ID="Label113" runat="server" Text="<%$ Resources:lang,ID%>"></asp:Label>
                                                                </strong></td>
                                                                <td align="center" width="20%"><strong>
                                                                    <asp:Label ID="Label114" runat="server" Text="<%$ Resources:lang,ZiFuDanJia%>"></asp:Label>
                                                                </strong></td>
                                                                <td align="center" width="20%"><strong>
                                                                    <asp:Label ID="Label115" runat="server" Text="<%$ Resources:lang,ZiFuShangXian%>"></asp:Label>
                                                                </strong></td>
                                                                <td align="center" width="20%"><strong>
                                                                    <asp:Label ID="Label116" runat="server" Text="<%$ Resources:lang,WenDangDanJia%>"></asp:Label>
                                                                </strong></td>
                                                                <td align="center" width="20%"><strong>
                                                                    <asp:Label ID="Label117" runat="server" Text="<%$ Resources:lang,WenDangShangXian%>"></asp:Label>
                                                                </strong></td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                    <td align="right" width="6">
                                                        <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" />
                                                    </td>
                                                </tr>
                                            </table>
                                            <asp:DataGrid ID="DataGrid23" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" OnItemCommand="DataGrid23_ItemCommand" ShowHeader="false" Width="98%">
                                                <FooterStyle BackColor="#57CD1" Font-Bold="True" ForeColor="White" />
                                                <EditItemStyle BackColor="#2461BF" />
                                                <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                <PagerStyle CssClass="notTab" HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" />
                                                <ItemStyle CssClass="itemStyle" />
                                                <Columns>
                                                    <asp:TemplateColumn HeaderText="ID">
                                                        <ItemTemplate>
                                                            <asp:Button ID="BT_ID" runat="server" CssClass="inpu" Text='<%# DataBinder.Eval(Container.DataItem,"ID") %>' />
                                                        </ItemTemplate>
                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="15%" />
                                                    </asp:TemplateColumn>
                                                    <asp:BoundColumn DataField="EveryCharPrice" HeaderText="字符单价">
                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="20%" />
                                                    </asp:BoundColumn>
                                                    <asp:BoundColumn DataField="CharUpper" HeaderText="字符上限">
                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="20%" />
                                                    </asp:BoundColumn>
                                                    <asp:BoundColumn DataField="EveryDocPrice" HeaderText="文档单价">
                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="20%" />
                                                    </asp:BoundColumn>
                                                    <asp:BoundColumn DataField="DocUpper" HeaderText="文档上限">
                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="20%" />
                                                    </asp:BoundColumn>
                                                </Columns>
                                            </asp:DataGrid>
                                            <asp:Label ID="Label124" runat="server" Text="<%$ Resources:lang,ZiFuDanJia%>"></asp:Label>
                                            <NickLee:NumberBox ID="NB_EveryCharPrice" runat="server" MaxAmount="10" Width="80px">.</NickLee:NumberBox>
                                            &nbsp;<asp:Label ID="Label125" runat="server" Text="<%$ Resources:lang,ChangDuShangXian%>"></asp:Label>
                                            <NickLee:NumberBox ID="NB_CharUpper" runat="server" MaxAmount="10" Precision="0" Width="80px"></NickLee:NumberBox>
                                            <br />
                                            <asp:Label ID="Label129" runat="server" Text="<%$ Resources:lang,WenDangDanJia%>"></asp:Label>
                                            <NickLee:NumberBox ID="NB_EveryDocPrice" runat="server" MaxAmount="10" MinAmount="-10" Width="80px">.</NickLee:NumberBox>
                                            &nbsp;<asp:Label ID="Label1311" runat="server" Text="<%$ Resources:lang,ShuLiangShangXian%>"></asp:Label>
                                            <NickLee:NumberBox ID="NB_DocUpper" runat="server" MaxAmount="10" MinAmount="-10" Precision="0" Width="80px"></NickLee:NumberBox>
                                            <br />
                                            <asp:Label ID="LB_DailyWorkUnitBonusID" runat="server" Visible="false"></asp:Label>
                                            <br />
                                            <asp:Button ID="BT_AddEveryCharPrice" runat="server" CssClass="inpu" OnClick="BT_AddEveryCharPrice_Click" Text="<%$ Resources:lang,XinZeng%>" />
                                            <asp:Button ID="BT_DeleteEveryDocPrice" runat="server" CssClass="inpu" OnClick="BT_DeleteEveryDocPrice_Click" Text="<%$ Resources:lang,ShanChu%>" />
                                        </td>
                                    </tr>

                                    <tr>
                                        <td colspan="8" style="background-color: beige; height: 20px;"></td>
                                    </tr>
                                    <tr>
                                        <td align="center" colspan="3"><strong>
                                            <asp:Label ID="Label4119" runat="server" Text="<%$ Resources:lang,DaiMaGuiZe%>"></asp:Label>
                                        </strong></td>
                                        <td style="height: 7px;">
                                            <strong>
                                                <asp:Label ID="Label62" runat="server" Text="承包商大类"></asp:Label>
                                            </strong></td>
                                        <td style="height: 7px;">
                                            <strong>
                                                <asp:Label ID="Label492272" runat="server" Text="承包商小类"></asp:Label>
                                            </strong>
                                        </td>
                                        <td style="height: 7px;" colspan="2">
                                            <strong>
                                                <asp:Label ID="Label81" runat="server" Text="承包类型"></asp:Label>
                                            </strong></td>
                                    </tr>
                                    <tr>
                                        <td align="center" colspan="3" align="center">
                                            <table background="ImagesSkin/main_n_bj.jpg" cellpadding="0" cellspacing="0" width="100%">
                                                <tr>
                                                    <td width="7">
                                                        <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" />
                                                    </td>
                                                    <td>
                                                        <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                            <tr>
                                                                <td align="center" width="15%"><strong>
                                                                    <asp:Label ID="Label491" runat="server" Text="<%$ Resources:lang,XuHao%>"></asp:Label>
                                                                </strong></td>
                                                                <td align="center" width="20%"><strong>
                                                                    <asp:Label ID="Label492" runat="server" Text="<%$ Resources:lang,DaiMaLeiXing%>"></asp:Label>
                                                                </strong></td>
                                                                <td align="center" width="15%"><strong>
                                                                    <asp:Label ID="Label493" runat="server" Text="<%$ Resources:lang,KaiTouZiFu%>"></asp:Label>
                                                                </strong></td>
                                                                <td align="center" width="20%"><strong>
                                                                    <asp:Label ID="Label494" runat="server" Text="<%$ Resources:lang,YuGuiZe%>"></asp:Label>
                                                                </strong></td>
                                                                <td align="center" width="20%"><strong>
                                                                    <asp:Label ID="Label495" runat="server" Text="<%$ Resources:lang,LiuShuiHaoKuanDu%>"></asp:Label>
                                                                </strong></td>
                                                                <td align="center" width="100%"><strong>
                                                                    <asp:Label ID="Label496" runat="server" Text="<%$ Resources:lang,ZhuangTai%>"></asp:Label>
                                                                </strong></td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                    <td align="right" width="6">
                                                        <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" />
                                                    </td>
                                                </tr>
                                            </table>
                                            <asp:DataGrid ID="DataGrid44" runat="server" AutoGenerateColumns="False" GridLines="None" OnItemCommand="DataGrid44_ItemCommand" ShowHeader="False" Width="100%">
                                                <FooterStyle BackColor="#57CD1" Font-Bold="True" ForeColor="White" />
                                                <EditItemStyle BackColor="#2461BF" />
                                                <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                <PagerStyle CssClass="notTab" HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" />
                                                <ItemStyle CssClass="itemStyle" />
                                                <Columns>
                                                    <asp:TemplateColumn HeaderText="序号">
                                                        <ItemTemplate>
                                                            <asp:Button ID="BT_CodeRuleID" runat="server" CssClass="inpu" Text='<%# DataBinder.Eval(Container.DataItem,"ID") %>' />
                                                        </ItemTemplate>
                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="15%" />
                                                    </asp:TemplateColumn>
                                                    <asp:BoundColumn DataField="CodeType" HeaderText="代码类型">
                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="20%" />
                                                    </asp:BoundColumn>
                                                    <asp:BoundColumn DataField="HeadChar" HeaderText="开头字符">
                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="15%" />
                                                    </asp:BoundColumn>
                                                    <asp:BoundColumn DataField="FieldName" HeaderText="域规则">
                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="20%" />
                                                    </asp:BoundColumn>
                                                    <asp:BoundColumn DataField="FlowIDWidth" HeaderText="ID宽度">
                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="20%" />
                                                    </asp:BoundColumn>
                                                    <asp:BoundColumn DataField="IsStartup" HeaderText="启动否">
                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="100%" />
                                                    </asp:BoundColumn>
                                                </Columns>
                                            </asp:DataGrid>
                                            <asp:Label ID="Label497" runat="server" Text="<%$ Resources:lang,LeiXing%>"></asp:Label>
                                            <asp:DropDownList ID="DL_CodeType" runat="server">
                                                <asp:ListItem Text="<%$ Resources:lang,XiangMuDaiMa%>" Value="ProjectCode" />
                                                <asp:ListItem Text="<%$ Resources:lang,HeTongDaiMa%>" Value="ConstractCode" />
                                                <asp:ListItem Text="<%$ Resources:lang,CaiGouDanHao%>" Value="PurchaseOrderCode" />
                                                <asp:ListItem Text="<%$ Resources:lang,FuKanShenQingDanHao%>" Value="PayApplyOrderCode" />
                                                <asp:ListItem Text="<%$ Resources:lang,XiaoSouBaoJiaDanHao%>" Value="QuotationOrderCode" />
                                                <asp:ListItem Text="<%$ Resources:lang,XiaoSouDingDanHao%>" Value="SaleOrderCode" />
                                                <asp:ListItem Text="<%$ Resources:lang,RuKuDanHao%>" Value="CheckInOrderCode" />
                                                <asp:ListItem Text="<%$ Resources:lang,ChuKuDanHao%>" Value="CheckOutOrderCode" />
                                                <asp:ListItem Text="<%$ Resources:lang,ShengChanDanHao%>" Value="ProductionOrderCode" />
                                                <asp:ListItem Text="<%$ Resources:lang,GeZhongShengQingDanHao%>" Value="ApplicationOrderCode" />
                                                <asp:ListItem Text="<%$ Resources:lang,SongHuoDanHao%>" Value="DeliveryOrderCode" />
                                                <asp:ListItem Text="<%$ Resources:lang,GongHuoDanHao%>" Value="SupplyOrderCode" />
                                                <asp:ListItem Text="<%$ Resources:lang,ChuHuTongZiDanHao%>" Value="OutNoticeOrderCode" />
                                                <asp:ListItem Text="<%$ Resources:lang,JieChuDanHao%>" Value="BorrowOrderCode" />
                                                <asp:ListItem Text="<%$ Resources:lang,TuiHuoHuoGuiHuanDanHao%>" Value="ReturnOrderCode" />
                                                <asp:ListItem Text="<%$ Resources:lang,DiaoBuDanHao%>" Value="TransferOrderCode" />
                                                <asp:ListItem Text="<%$ Resources:lang,kehudaima%>" Value="CustomerCode" />
                                                <asp:ListItem Text="<%$ Resources:lang,gongyingshangdaima%>" Value="VendorCode" />
                                            </asp:DropDownList>
                                            &nbsp;
                                            <asp:Label ID="Label498" runat="server" Text="<%$ Resources:lang,KaiTouZiFu%>"></asp:Label>
                                            <asp:TextBox ID="TB_HeadChar" runat="server" Width="40"></asp:TextBox>
                                            <br />
                                            <asp:Label ID="Label499" runat="server" Text="<%$ Resources:lang,YuGuiZe%>"></asp:Label>
                                            <asp:DropDownList ID="DL_FieldRule" runat="server">
                                                <asp:ListItem>[TAKETOPYEARMONTH]</asp:ListItem>
                                                <asp:ListItem>[TAKETOPYEARMONTHDAY]</asp:ListItem>
                                            </asp:DropDownList>
                                            <br />
                                            <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,LiuShuiHaoKuanDu%>"></asp:Label>
                                            <asp:TextBox ID="TB_FlowIDWidth" runat="server" Width="40"></asp:TextBox>
                                            <asp:Label ID="Label51" runat="server" Text="<%$ Resources:lang,QiYong%>"></asp:Label>
                                            &nbsp;<asp:DropDownList ID="DL_IsStartup" runat="server">
                                                <asp:ListItem Text="<%$ Resources:lang,YES%>" Value="YES" />
                                                <asp:ListItem Text="<%$ Resources:lang,NO%>" Value="NO" />
                                            </asp:DropDownList>
                                            <br />
                                            <asp:Label ID="LB_CodeRuleID" runat="server" Visible="false"></asp:Label>
                                            <br />
                                            <asp:Button ID="BT_CodeRuleAdd" runat="server" CssClass="inpu" OnClick="BT_CodeRuleAdd_Click" Text="<%$ Resources:lang,XinZeng%>" />
                                            &nbsp;<asp:Button ID="BT_CodeRuleDelete" runat="server" CssClass="inpu" OnClick="BT_CodeRuleDelete_Click" Text="<%$ Resources:lang,ShanChu%>" />
                                        </td>
                                        <td valign="top" align="center">
                                            <table background="ImagesSkin/main_n_bj.jpg" border="0" cellpadding="0" cellspacing="0" width="98%">
                                                <tr>
                                                    <td width="7">
                                                        <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" />
                                                    </td>
                                                    <td>
                                                        <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                            <tr>
                                                                <td align="center" width="60%"><strong>
                                                                    <asp:Label ID="Label63" runat="server" Text="<%$ Resources:lang,LeiXing%>"></asp:Label>
                                                                </strong></td>
                                                                <td align="center" width="40%"><strong>
                                                                    <asp:Label ID="Label68" runat="server" Text="<%$ Resources:lang,ShunXu%>"></asp:Label>
                                                                </strong></td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                    <td align="right" width="6">
                                                        <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" />
                                                    </td>
                                                </tr>
                                            </table>
                                            <asp:DataGrid ID="DataGrid5" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" OnItemCommand="DataGrid5_ItemCommand" ShowHeader="false" Width="98%">
                                                <FooterStyle BackColor="#57CD1" Font-Bold="True" ForeColor="White" />
                                                <EditItemStyle BackColor="#2461BF" />
                                                <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                <PagerStyle CssClass="notTab" HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" />
                                                <ItemStyle CssClass="itemStyle" />
                                                <Columns>
                                                    <asp:TemplateColumn HeaderText="类型">
                                                        <ItemTemplate>
                                                            <asp:Button ID="BT_SupplierBigType" runat="server" CssClass="inpu" Text='<%# DataBinder.Eval(Container.DataItem,"Type") %>' />
                                                        </ItemTemplate>
                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="60%" />
                                                    </asp:TemplateColumn>
                                                    <asp:BoundColumn DataField="SortNumber" HeaderText="顺序">
                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="40%" />
                                                    </asp:BoundColumn>
                                                </Columns>
                                                <HeaderStyle BackColor="#57CD1" Font-Bold="True" ForeColor="White" />
                                            </asp:DataGrid>
                                            <asp:Label ID="Label69" runat="server" Text="<%$ Resources:lang,LeiXing%>"></asp:Label>
                                            <asp:TextBox ID="TB_SupplierBigType" runat="server" Width="110"></asp:TextBox>
                                            <br />
                                            <asp:Label ID="Label70" runat="server" Text="<%$ Resources:lang,ShunXu%>"></asp:Label>
                                            <asp:TextBox ID="TB_SupplierBigTypeSort" runat="server" Width="110"></asp:TextBox>
                                            <br />
                                            <br />
                                            <asp:Button ID="BT_SupplierBigTypeAdd" runat="server" CssClass="inpu" OnClick="BT_SupplierBigTypeAdd_Click" Text="<%$ Resources:lang,XinZeng%>" />
                                            <asp:Button ID="BT_SupplierBigTypeDelete" runat="server" CssClass="inpu" OnClick="BT_SupplierBigTypeDelete_Click" Text="<%$ Resources:lang,ShanChu%>" />
                                        </td>
                                        <td valign="top" align="center">
                                            <table background="ImagesSkin/main_n_bj.jpg" border="0" cellpadding="0" cellspacing="0" width="98%">
                                                <tr>
                                                    <td width="7">
                                                        <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" />
                                                    </td>
                                                    <td>
                                                        <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                            <tr>
                                                                <td align="center" width="40%"><strong>
                                                                    <asp:Label ID="Label75" runat="server" Text="<%$ Resources:lang,XiaoLei%>"></asp:Label>
                                                                </strong></td>
                                                                <td align="center" width="40%"><strong>
                                                                    <asp:Label ID="Label71" runat="server" Text="<%$ Resources:lang,DaLei%>"></asp:Label>
                                                                </strong></td>
                                                                <td align="center" width="20%"><strong>
                                                                    <asp:Label ID="Label72" runat="server" Text="<%$ Resources:lang,ShunXu%>"></asp:Label>
                                                                </strong></td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                    <td align="right" width="6">
                                                        <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" />
                                                    </td>
                                                </tr>
                                            </table>
                                            <asp:DataGrid ID="DataGrid6" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" OnItemCommand="DataGrid6_ItemCommand" ShowHeader="false" Width="98%">
                                                <FooterStyle BackColor="#57CD1" Font-Bold="True" ForeColor="White" />
                                                <EditItemStyle BackColor="#2461BF" />
                                                <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                <PagerStyle CssClass="notTab" HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" />
                                                <ItemStyle CssClass="itemStyle" />
                                                <Columns>
                                                    <asp:TemplateColumn HeaderText="类型">
                                                        <ItemTemplate>
                                                            <asp:Button ID="BT_SupplierSmallType" runat="server" CssClass="inpu" Text='<%# DataBinder.Eval(Container.DataItem,"Type") %>' />
                                                        </ItemTemplate>
                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="40%" />
                                                    </asp:TemplateColumn>
                                                    <asp:BoundColumn DataField="BigType" HeaderText="大类">
                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="40%" />
                                                    </asp:BoundColumn>
                                                    <asp:BoundColumn DataField="SortNumber" HeaderText="顺序">
                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="20%" />
                                                    </asp:BoundColumn>
                                                </Columns>
                                                <HeaderStyle BackColor="#57CD1" Font-Bold="True" ForeColor="White" />
                                            </asp:DataGrid>
                                            <asp:Label ID="Label80" runat="server" Text="<%$ Resources:lang,DaLei%>"></asp:Label>
                                            <asp:DropDownList ID="DL_SupplierBigType" runat="server" DataTextField="Type" DataValueField="Type">
                                            </asp:DropDownList>
                                            <br />
                                            <asp:Label ID="Label76" runat="server" Text="<%$ Resources:lang,LeiXing%>"></asp:Label>
                                            <asp:TextBox ID="TB_SupplierSmallType" runat="server" Width="110"></asp:TextBox>
                                            <br />
                                            <asp:Label ID="Label77" runat="server" Text="<%$ Resources:lang,ShunXu%>"></asp:Label>
                                            <asp:TextBox ID="TB_SupplierSmallTypeSort" runat="server" Width="110"></asp:TextBox>
                                            <br />
                                            <br />
                                            <asp:Button ID="BT_SupplierSmallTypeAdd" runat="server" CssClass="inpu" OnClick="BT_SupplierSmallTypeAdd_Click" Text="<%$ Resources:lang,XinZeng%>" />
                                            <asp:Button ID="BT_SupplierSmallTypeDelete" runat="server" CssClass="inpu" OnClick="BT_SupplierSmallTypeDelete_Click" Text="<%$ Resources:lang,ShanChu%>" />
                                        </td>
                                        <td colspan="2" align="center">
                                            <table background="ImagesSkin/main_n_bj.jpg" border="0" cellpadding="0" cellspacing="0" width="98%">
                                                <tr>
                                                    <td width="7">
                                                        <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" />
                                                    </td>
                                                    <td>
                                                        <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                            <tr>
                                                                <td align="center" width="40%"><strong>
                                                                    <asp:Label ID="Label82" runat="server" Text="<%$ Resources:lang,LeiXing%>"></asp:Label>
                                                                </strong></td>
                                                                <td align="center" width="20%"><strong>
                                                                    <asp:Label ID="Label83" runat="server" Text="<%$ Resources:lang,ShunXu%>"></asp:Label>
                                                                </strong></td>
                                                                <td align="center">
                                                                    <strong>
                                                                        <asp:Label ID="Label87" runat="server" Text="<%$ Resources:lang,MuBan%>"></asp:Label></strong>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                    <td align="right" width="6">
                                                        <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" />
                                                    </td>
                                                </tr>
                                            </table>
                                            <asp:DataGrid ID="DataGrid8" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" OnItemCommand="DataGrid8_ItemCommand" ShowHeader="false" Width="98%">
                                                <FooterStyle BackColor="#57CD1" Font-Bold="True" ForeColor="White" />
                                                <EditItemStyle BackColor="#2461BF" />
                                                <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                <PagerStyle CssClass="notTab" HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" />
                                                <ItemStyle CssClass="itemStyle" />
                                                <Columns>
                                                    <asp:TemplateColumn HeaderText="类型">
                                                        <ItemTemplate>
                                                            <asp:Button ID="BT_BMBidType" runat="server" CssClass="inpu" Text='<%# DataBinder.Eval(Container.DataItem,"Type") %>' />
                                                        </ItemTemplate>
                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="40%" />
                                                    </asp:TemplateColumn>
                                                    <asp:BoundColumn DataField="SortNumber" HeaderText="顺序">
                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="20%" />
                                                    </asp:BoundColumn>
                                                    <asp:TemplateColumn>
                                                        <ItemTemplate>
                                                            <asp:HyperLink ID="HL_WorkflowWFTemplate" Text="<%$ Resources:lang,LiuCheng%>" runat="server" NavigateUrl='<%# DataBinder.Eval(Container, "DataItem.Type", "TTAttachWorkFlowTemplate.aspx?RelatedType=BMBidType&RelatedName={0}") %>'
                                                                Target="_blank"></asp:HyperLink>
                                                        </ItemTemplate>
                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" />
                                                    </asp:TemplateColumn>
                                                </Columns>
                                                <HeaderStyle BackColor="#57CD1" Font-Bold="True" ForeColor="White" />
                                            </asp:DataGrid>
                                            <asp:Label ID="Label85" runat="server" Text="<%$ Resources:lang,LeiXing%>"></asp:Label>
                                            <asp:TextBox ID="TB_BMBidType" runat="server" Width="110"></asp:TextBox>
                                            <br />
                                            <asp:Label ID="Label86" runat="server" Text="<%$ Resources:lang,ShunXu%>"></asp:Label>
                                            <asp:TextBox ID="TB_BMBidTypeSort" runat="server" Width="110"></asp:TextBox>
                                            <br />
                                            <br />
                                            <asp:Button ID="BT_BMBidTypeAdd" runat="server" CssClass="inpu" OnClick="BT_BMBidTypeAdd_Click" Text="<%$ Resources:lang,XinZeng%>" />
                                            <asp:Button ID="BT_BMBidTypeDelete" runat="server" CssClass="inpu" OnClick="BT_BMBidTypeDelete_Click" Text="<%$ Resources:lang,ShanChu%>" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="8" style="background-color: beige; height: 20px;"></td>
                                    </tr>
                                    <tr>
                                        <td align="center" colspan="3"><strong>
                                            <asp:Label ID="Label10" runat="server" Text="投标专业"></asp:Label>
                                        </strong></td>
                                        <td style="height: 7px;">
                                            <asp:Label ID="Label19" runat="server" Text="资金来源"></asp:Label>
                                        </td>
                                        <td style="height: 7px;">&nbsp;</td>
                                        <td style="height: 7px;" colspan="2">&nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td align="center" colspan="3" align="center">
                                            <table background="ImagesSkin/main_n_bj.jpg" cellpadding="0" cellspacing="0" width="100%">
                                                <tr>
                                                    <td width="7">
                                                        <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" />
                                                    </td>
                                                    <td>
                                                        <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                            <tr>
                                                                <td align="center" width="100%"><strong>
                                                                    <asp:Label ID="Label98" runat="server" Text="专业"></asp:Label>
                                                                </strong></td>

                                                            </tr>
                                                        </table>
                                                    </td>
                                                    <td align="right" width="6">
                                                        <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" />
                                                    </td>
                                                </tr>
                                            </table>
                                            <asp:DataGrid ID="DataGrid13" runat="server" AutoGenerateColumns="False" GridLines="None" OnItemCommand="DataGrid13_ItemCommand" ShowHeader="False" Width="100%">
                                                <FooterStyle BackColor="#57CD1" Font-Bold="True" ForeColor="White" />
                                                <EditItemStyle BackColor="#2461BF" />
                                                <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                <PagerStyle CssClass="notTab" HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" />
                                                <ItemStyle CssClass="itemStyle" />
                                                <Columns>
                                                    <asp:TemplateColumn HeaderText="序号">
                                                        <ItemTemplate>
                                                            <asp:Button ID="BT_TenderContent" runat="server" CssClass="inpuLongest" Width="99%" Text='<%# DataBinder.Eval(Container.DataItem,"TenderContent") %>' />
                                                        </ItemTemplate>
                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="100%" />
                                                    </asp:TemplateColumn>

                                                </Columns>
                                            </asp:DataGrid>
                                            <br />
                                            <br />
                                            <asp:Label ID="Label107" runat="server" Text="所属专业"></asp:Label>
                                            <asp:TextBox ID="TB_TenderContent" runat="server" Width="99%"></asp:TextBox>
                                            <br />
                                            <br />
                                            <asp:Button ID="BT_TenderContentAdd" runat="server" CssClass="inpu" Text="<%$ Resources:lang,XinZeng%>" OnClick="BT_TenderContentAdd_Click" />
                                            &nbsp;<asp:Button ID="BT_TenderContentDelete" runat="server" CssClass="inpu" Text="<%$ Resources:lang,ShanChu%>" OnClick="BT_TenderContentDelete_Click" />
                                        </td>
                                        <td valign="top" align="center">

                                            <table background="ImagesSkin/main_n_bj.jpg" cellpadding="0" cellspacing="0" width="100%">
                                                <tr>
                                                    <td width="7">
                                                        <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" />
                                                    </td>
                                                    <td>
                                                        <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                            <tr>
                                                                <td align="center" width="100%"><strong>
                                                                    <asp:Label ID="Label24" runat="server" Text="资金来源"></asp:Label>
                                                                </strong></td>

                                                            </tr>
                                                        </table>
                                                    </td>
                                                    <td align="right" width="6">
                                                        <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" />
                                                    </td>
                                                </tr>
                                            </table>
                                            <asp:DataGrid ID="DataGrid20" runat="server" AutoGenerateColumns="False" GridLines="None" OnItemCommand="DataGrid20_ItemCommand" ShowHeader="False" Width="100%">
                                                <FooterStyle BackColor="#57CD1" Font-Bold="True" ForeColor="White" />
                                                <EditItemStyle BackColor="#2461BF" />
                                                <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                <PagerStyle CssClass="notTab" HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" />
                                                <ItemStyle CssClass="itemStyle" />
                                                <Columns>
                                                    <asp:TemplateColumn HeaderText="序号">
                                                        <ItemTemplate>
                                                            <asp:Button ID="BT_FundingSource" runat="server" CssClass="inpu" Width="99%" Text='<%# DataBinder.Eval(Container.DataItem,"FundingSource") %>' />
                                                        </ItemTemplate>
                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="100%" />
                                                    </asp:TemplateColumn>

                                                </Columns>
                                            </asp:DataGrid>
                                            <br />
                                            <br />
                                            <asp:Label ID="Label28" runat="server" Text="资金来源"></asp:Label>
                                            <asp:TextBox ID="TB_FundingSource" runat="server" Width="99%"></asp:TextBox>
                                            <br />
                                            <br />
                                            <asp:Button ID="BT_FundingSourceAdd" runat="server" CssClass="inpu" Text="<%$ Resources:lang,XinZeng%>" OnClick="BT_FundingSourceAdd_Click" />
                                            &nbsp;<asp:Button ID="BT_FundingSourceDelete" runat="server" CssClass="inpu" Text="<%$ Resources:lang,ShanChu%>" OnClick="BT_FundingSourceDelete_Click" />

                                        </td>
                                        <td valign="top" align="center"></td>
                                        <td colspan="2" align="center"></td>
                                    </tr>
                                </table>

                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
            <div style="position: absolute; left: 5%; top: 5%;">
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







