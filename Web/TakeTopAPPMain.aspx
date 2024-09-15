<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TakeTopAPPMain.aspx.cs" Inherits="TakeTopAPPMain" %>

<meta name="viewport" content="width=device-width; initial-scale=1.0; maximum-scale=1.5;  user-scalable=1" />
<%@ Import Namespace="System.Globalization" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link href="css/bluelightAPPMain.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="lhgdialog/lhgcore.min.js"></script>
    <script type="text/javascript" src="lhgdialog/lhgdialog.min.js"> </script>
    <style type="text/css">
        /* 收缩展开效果 */
        html, body {
            margin: 0;
            background-color:#EFF2F7;
        }

        a {
            text-decoration: none;
        }

        .box span img {
            vertical-align: middle;
        }

        .box:hover {
            background: #ECECEC;
        }

        div.leftSet {
            height: 72px;
            background: url(ImagesSkin/leftSetbg.gif) 0 0 no-repeat;
        }

        .titlecj {
            font-size: 14px;
            text-decoration: none;
            line-height: 37px;
        }

        .plusSpan {
            padding: 0px 0px 0px 0px;
            margin: 0px 0px 0px 0px;
            display: none;
        }

        .spanHover {
            height: 37px;
            text-align: left;
            background-repeat: no-repeat;
            color: #000000;
            text-decoration: none;
            background-position: left;
        }

        .testBold {
            font-weight: bold;
        }



        #topNav {
            z-index: 999;
            background: linear-gradient(90deg, #D53E54 0%, #057BF9 100%);
            height: 60px;
            line-height: 60px;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            _position: absolute; /* for IE6 */
            _top: expression(documentElement.scrollTop + documentElement.clientHeight-this.offsetHeight); /* for IE6 */
            overflow: visible;
            display: flex;justify-content: space-around;
        }

        .tNlogo {display: inline-block;width: 100%; height: 60px; background: url(Logo/logoTopApp.png) no-repeat center center;}

        #bottomNav {
            /*background-color:#096;*/
            z-index: 999;
            background: #fff;
            border-top: 1px solid #d6dae2;
            height: 45px;
            line-height: 45px;
            position: fixed;
            bottom: 0px;
            left: 0;
            width: 100%;
            _position: absolute; /* for IE6 */
            _top: expression(documentElement.scrollTop + documentElement.clientHeight-this.offsetHeight); /* for IE6 */
            overflow: visible;
            display: flex;
        }


        /***************20201117 by forever add**************/
        /* #Div1 {
            display: flex;
            flex-wrap: wrap;
            align-content: flex-start;
            border-top: 0px solid #e7e7e7;
        } */

        .box {
            cursor: pointer;
            border-bottom: 0px solid #e7e7e7;
            flex: 0 0 25%;
            height: 85px;
        }

        .boxs span.titleSpan {
            width: auto;
        }

        span.boxs {
            display: block;
            height: 85px;
            border-right: 0px solid #e7e7e7;
        }

        .minusSpan {
            padding: 0;
            margin: 0;
            display: block;
            text-align: center;
            padding-top: 15px;
            padding-bottom: 10px;
            height: 30px;
        }

        .titleSpan {
            font-size: 12px;
            color: #2F4861;
            text-decoration: none;
            display: block;
            text-align: center;
            margin: 0 auto;
        }

        .boxs span.titleSpan {
            width: auto;
        }

        .box.boxes {
            flex: 0 0 100%;
            height: auto;
        }
        .boxes img {
            display: none;
        }
        .boxes span.boxs {
            height: 40px;
            border-right: 0;
            border-bottom: 1px solid #e7e7e7;
        }

        .boxes span.minusSpan {
            display: none !important;
        }

        .boxes span.titleSpan {
            height: 40px;
            line-height: 40px;
            text-align: center;
            font-size: 14px;
            padding-left: 0px;
        }

        .content span.titleSpan {
            height: 85px;
            padding: 0;
            text-align: center;
            line-height: 85px;
            border-right: 0px solid #e7e7e7;
        }

        .content {
            padding: 0;
            text-align: left;
            background: #fff;
            margin: 0;
            display: flex;
            flex-wrap: wrap;
            align-content: flex-start;
        }

            .content span {
                padding-left: 8px;
            }

        ul li {
            padding: 0;
            list-style: none;
            flex: 0 0 33.33%;
            height: 85px;
        }

        /*导航*/
        #nav1 {
            /* position: absolute;*/
            margin-bottom: 20px;
        }


        .Marauto {
            width: 92%;
            margin: 20px auto;
        }
            .boxline {
            display: flex;
            flex-wrap: wrap;
            align-content: flex-start;
            box-shadow: 0px 0px 15px rgba(0, 0, 0, 0.15);
            opacity: 1;
            background: #fff;
            border-radius: 8px;
            margin-bottom: 20px;
        }
        .cline {
            height: 6px;
            width: 100%;
            background: linear-gradient(90deg, #D53E54 0%, #057BF9 100%);
            border-radius: 8px 8px 0px 0px;}
            .SpaceLine {
            height: 20px;
            background-color: #EFF2F7;
        }

        #IF_ChartList{border-radius: 8px;box-shadow: 0px 0px 10px 0px rgba(0, 0, 0, 0.1);
        }
        .tNexit{display: block; width: 30px; height: 60px;  cursor: pointer;background: url(ImagesSkin/exit.png) no-repeat 0 center;}

    </style>





</head>

<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="True" EnableScriptLocalization="True">
        </asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <div id="AboveDiv">
                    <div id="topNav"><span class="tNlogo"></span>
                        <center>
                            <img id="IMG_Waiting" src="Images/Processing.gif" alt="Loading,please wait..." style="text-align: center; display: none;" />
                        </center>
                    </div>
                  
                    <div id="Div3" style="width: 100%; height: 50px; overflow: auto;">
                    </div>
                    <div id="Div4" style="width: 100%; height: 0px; overflow: auto;">
                    </div>
                    <div class="Marauto">
                      <div id="nav1" runat="server">
                        <!-- <div class="cline"></div> -->
                        <iframe id="IF_ChartList" name="IF_NewsList" src='TTAPPPersonalSpaceAnalysisChart.aspx?Flag=<%=Session["SkinFlag"].ToString()%>' style="width: 100%; height: 170px; text-align: center;" frameborder="no" marginwidth="0" marginheight="0" scrolling="no"></iframe>
                    </div>


                    <div id="Div1" style="width: 100%; height: 800px; overflow: auto;">

                        <!-- 收缩展开效果start -->
                        <asp:Literal ID="LT_Result" runat="server"></asp:Literal>
                        <!-- 收缩展开效果end -->

                    </div>
                </div>
                    <div id="Div2" style="width: 100%; height: 35px; overflow: auto;">
                    </div>

                    <div id="bottomNav">
                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                                <td style="padding-top:5px;">

                                    <table width="100%" border="0" cellspacing="0" cellpadding="0" align="right">
                                        <tr>
                                              <td align="center" width="50%">
                                                <a class="titleSpan" href="TTAPPUpdateUserInfor.aspx">
                                                     <img id="IMG_UpdateUserInfor" src="ImagesSkin/PersonalInfor.png" width="20" height="20" />
                                                </a>
                                            </td>
                                             
                                            <td align="center" width="50%">
                                                <a href="#" class="titleSpan" onclick="if (confirm('确定要退出管理平台吗?')){;href='DefaultAPP.html';target='_top';}">
                                                    <img id="IMG_ExitSystem" src="ImagesSkin/ExitAPP.png" width="20" height="20" />
                                                </a>
                                            </td>
                                        </tr>
                                    </table>

                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
                <asp:HiddenField ID="HF_ClickValue" runat="server" Value="" />
                <asp:Label ID="LB_SuperDepartString" runat="server" Visible="false"></asp:Label>
                <div id="divload" style="position: absolute; left: 40%; top: 30%; display: none;">
                    <img src="Images/Processing.gif" alt="Loading,please wait..." />
                </div>
            </ContentTemplate>

        </asp:UpdatePanel>
        <div style="position: absolute; left: 2%; top: 20%;">
            <asp:UpdateProgress ID="TakeTopUp" runat="server" AssociatedUpdatePanelID="UpdatePanel1">
                <ProgressTemplate>
                    <img src="Images/Processing.gif" alt="Loading,please wait..." />
                </ProgressTemplate>
            </asp:UpdateProgress>
        </div>
    </form>
</body>
</html>
