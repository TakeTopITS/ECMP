<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTPictureFile.aspx.cs" Inherits="TTPictureFile" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="js/jquery-1.7.2.min.js"></script>
    <script>
        //判断浏览器是否支持HTML5 Canvas           
        window.onload = function () {
            try {
                //动态创建一个canvas元 ，并获取他2Dcontext。如果出现异常则表示不支持                   
                document.createElement("canvas").getContext("2d");
                //document.getElementById("support").innerHTML = "浏览器支持HTML5 CANVAS";
            } catch (e) {
                document.getElementById("support").innerHTML = "浏览器不支持HTML5 CANVAS";
            }
        };
        //这段代 主要是获取摄像头的视频流并显示在Video 签中           
        window.addEventListener("DOMContentLoaded", function () {
            var canvas = document.getElementById("canvas"),
                context = canvas.getContext("2d"),
                video = document.getElementById("video"),
                videoObj = { "video": true },
                errBack = function (error) {
                    console.log("Video capture error: ", error.code);
                };
            //navigator.getUserMedia这个写法在Opera中好像是navigator.getUserMedianow               
            if (navigator.getUserMedia) {
                navigator.getUserMedia(videoObj, function (stream) {
                    video.src = stream;
                    video.play();
                }, errBack);
            } else if (navigator.webkitGetUserMedia) {
                navigator.webkitGetUserMedia(videoObj, function (stream) {
                    video.src = window.webkitURL.createObjectURL(stream);
                    video.play();
                }, errBack);
            }
            //这个是拍照按钮的事件，       
            $("#snap").click(function () {
                context.drawImage(video, 0, 0, 320, 320);
                CatchCode();
            });
        }, false);                     //定时器         
        //var interval = setInterval(CatchCode, "300");
        //这个是 刷新上 图像的          
        function CatchCode() {
            //$("#snap").click();
            //实际运用可不写，测试代 ， 为单击拍照按钮就获取了当前图像，有其他用途            
            var canvans = document.getElementById("canvas");
            //获取浏览器页面的画布对象                      
            //以下开始编 数据                                    
            var imgData = canvans.toDataURL();
            //将图像转换为base64数据            
            var base64Data = imgData.substr(22);
            //在前端截取22位之后的字符串作为图像数据              
            //开始异步上    
            $.post("Handler/uploadImgCode.ashx", { "img": base64Data }, function (data, status) {
                //alert(status+"11"+data);
                if (status == "success") {
                    var resultListItem = data.split('|');
                    if (resultListItem[0] == "OK") {

                        if (navigator.userAgent.indexOf("Firefox") >= 0) {


                            parent.window.document.getElementById("TB_PictureUrl").value = "<img src=" + resultListItem[1] + "/>";

                        }
                        else {


                            window.opener.document.getElementById("TB_PictureUrl").value = "<img src=" + resultListItem[1] + "/>";

                        }

                        CloseLayer();

                    }
                    else {
                        // alert(data);                  
                    }
                } else { alert("数据上 失败"); }
            }, "text");
        }

    </script>
<script type="text/javascript" src="js/jquery-1.7.2.min.js"></script><script type="text/javascript" src="js/allAHandler.js"></script><script type="text/javascript" language="javascript">$(function () {if (top.location != self.location) { } else { CloseWebPage(); }});</script></head>
<body>
    <%--<form id="form1" runat="server">--%>
    <div>
        <div id="contentHolder">
            <table width="100%">
                <tr>
                    <td>
                        <video id="video" width="320" height="320" autoplay></video>
                    </td>
                </tr>
                <tr>
                    <td align="left">
                        <button id="snap">
                            <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,PaiZhao%>"></asp:Label></button></td>

                </tr>
                <tr>
                    <td>
                        <asp:Label ID="support" runat="server"></asp:Label>

                        <canvas style="display: none" id="canvas" width="320" height="320"></canvas>
                    </td>
                </tr>

            </table>




        </div>
    </div>
    <%--</form>--%>
</body>
<script type="text/javascript" language="javascript">var cssDirectory = '<%=Session["CssDirectory"] %>'; var oLink = document.getElementById('mainCss'); oLink.href = 'css/' + cssDirectory + '/' + 'bluelightmain.css';</script></html>
