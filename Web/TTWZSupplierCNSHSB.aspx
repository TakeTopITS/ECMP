<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTWZSupplierCNSHSB.aspx.cs" Inherits="TTWZSupplierCNSHSB" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>会员注册,中国石化设备网</title>
<meta name="description" content="中国石化设备网主要为石油，化工，煤化工，食品，精细化工，建材，医药，冶金，炼化，涂料，油漆，粉体，农药，核电，化肥等行业提供石化设备，石油机械，化工机械，涂料油漆机械，食品机械，粉体设备，制药机械，炼化设备，压力容器，煤化工设备等相关设备，同时中国石化设备网并为石油和化工设备厂商提供技术，交易信息等服务。中国石化设备网欢迎你访问咨询！" />
<meta name="keywords" content="石化设备|石化机械设备|化工机械设备|药化设备" />
<script src="http://www.cnshsb.com/script/prototype.js" type="text/javascript"></script>
<script src="http://www.cnshsb.com/script/index.js" type="text/javascript"></script>
<link rel="shortcut icon" href="favicon.ico" type="image/x-icon" />
<link href="http://www.cnshsb.com/templates/2010new/page.css" rel="stylesheet" type="text/css" />


    <script src='http://www.cnshsb.com/api/ad.php?id=50'></script>
</head>
<body>
    
    <div id="wrap">

<div id="top">
   <div id="top_sider"><Span style="float:left; padding-left:10px;">
       <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,ZGSHSBWSZSYSXCXB%>"></asp:Label><a href="#" class="Thome" onclick="setHomepage('http://www.cnshsb.com')" >
           <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,SheWeiShouYe%>"></asp:Label></a> | <a href="#" onclick="window.external.addFavorite('http://www.cnshsb.com','石化设备|石化机械设备|化工机械设备|药化设备')">
               <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,TianJiaShouCang%>"></asp:Label></a> | <a href="http://www.cnshsb.com/main.php?action=admin_shop_set">
                   <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,WangZhanJianShe%>"></asp:Label></a> | <a href="http://www.cnshsb.com/aboutus.php?type=6">
                       <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,WangLuoTuiGuang%>"></asp:Label></a> | <a href="http://www.cnshsb.com/aboutus.php?type=6">
                           <asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,ChengXinBao%>"></asp:Label></a> </span> <span style="float: right; padding-right:30px;"> [<a href='http://www.cnshsb.com/reg.php'><asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,MianFeiJiaRuHuiYuan%>"></asp:Label></a> | 
		<a href='http://www.cnshsb.com/login.php'>
            <asp:Label ID="Label8" runat="server" Text="<%$ Resources:lang,DengLu%>"></asp:Label></a>]</font></span></div>
</div>

<div class="er">
	<div style="height:90px; overflow:hidden;">
    <div id="logo"><a href="http://www.cnshsb.com"><img width="224" src="http://www.cnshsb.com/image/2010new/logo.gif" /></a></div>
    <div id="logo_ad">
      <script src='http://www.cnshsb.com/api/ad.php?id=1'></script>
    </div>
    <div id="member">
        <div id="tabs15">
        <div id="tabs155">
        <div id="2" style="height: 31px;">
        <div id="tabs16"><span><a target="_blank" style="color:#627EB7" href="http://www.cnshsb.com/aboutus.php?type=6">
            <asp:Label ID="Label9" runat="server" Text="<%$ Resources:lang,PaiMingTuiGuang%>"></asp:Label></a></span></div>
        <div id="tabs18"><span><a target="_blank" style="color:#627EB7" href="http://www.cnshsb.com/reg.php">
            <asp:Label ID="Label10" runat="server" Text="<%$ Resources:lang,MianFeiZhuCe%>"></asp:Label></a></span></div>
        </div>
        <div id="1" style="height: 31px;">
        <div id="tabs17"><span><a style="color:#627EB7" href="http://www.cnshsb.com/lostpass.php">
            <asp:Label ID="Label11" runat="server" Text="<%$ Resources:lang,WangJiMiMa%>"></asp:Label></a></span></div>
        <div id="tabs19"><span><a style="color:#627EB7" href="http://www.cnshsb.com/main.php">
            <asp:Label ID="Label12" runat="server" Text="<%$ Resources:lang,FaBuXinXi%>"></asp:Label></a></span></div>
        </div>
        </div>
      </div>
	</div>
    </div>
    <div class="clear" style="height:0px;"></div>
<div id="nav21">
<div id="nav22">
<div class="menu">
			<ul>
              		<li class="menu_link" ><a target="_blank" href="http://www.cnshsb.com/">
                          <asp:Label ID="Label13" runat="server" Text="<%$ Resources:lang,ShouYe%>"></asp:Label></a></li> 
        <li class="menu_line"><img src="http://www.cnshsb.com/image/2010new/selectmenu_line.gif"></li>    
	  		<li class="menu_link" ><a target="_blank" href="http://www.cnshsb.com/biz_server.php">
                  <asp:Label ID="Label14" runat="server" Text="<%$ Resources:lang,ZiXun%>"></asp:Label></a></li> 
        <li class="menu_line"><img src="http://www.cnshsb.com/image/2010new/selectmenu_line.gif"></li>    
	  		<li class="menu_link" ><a target="_blank" href="http://www.cnshsb.com/companys_category.php">
                  <asp:Label ID="Label15" runat="server" Text="<%$ Resources:lang,GongSi%>"></asp:Label></a></li> 
        <li class="menu_line"><img src="http://www.cnshsb.com/image/2010new/selectmenu_line.gif"></li>    
	  		<li class="menu_link" ><a target="_blank" href="http://www.cnshsb.com/products_category.php">
                  <asp:Label ID="Label16" runat="server" Text="<%$ Resources:lang,ChanPin%>"></asp:Label></a></li> 
        <li class="menu_line"><img src="http://www.cnshsb.com/image/2010new/selectmenu_line.gif"></li>    
	  		<li class="menu_link" ><a target="_blank" href="http://www.cnshsb.com/buy_list.php?catType=1">
                  <asp:Label ID="Label17" runat="server" Text="<%$ Resources:lang,GongYing%>"></asp:Label></a></li> 
        <li class="menu_line"><img src="http://www.cnshsb.com/image/2010new/selectmenu_line.gif"></li>    
	  		<li class="menu_link"><a target="_blank" href="http://www.cnshsb.com/buy_list.php?catType=2">
                  <asp:Label ID="Label18" runat="server" Text="<%$ Resources:lang,QiuGou%>"></asp:Label></a></li> 
        <li class="menu_line"><img src="http://www.cnshsb.com/image/2010new/selectmenu_line.gif"></li>    
	  		<li class="menu_link" ><a target="_blank" href="http://www.cnshsb.com/project_list.php">
                  <asp:Label ID="Label19" runat="server" Text="<%$ Resources:lang,ZhaoShang%>"></asp:Label></a></li> 
        <li class="menu_line"><img src="http://www.cnshsb.com/image/2010new/selectmenu_line.gif"></li>    
	  		<li class="menu_link"><a target="_blank" href="http://www.cnshsb.com/news_list.php?id=72">
                  <asp:Label ID="Label20" runat="server" Text="<%$ Resources:lang,JiShu%>"></asp:Label></a></li> 
        <li class="menu_line"><img src="http://www.cnshsb.com/image/2010new/selectmenu_line.gif"></li>    
	  		<li class="menu_link" ><a target="_blank" href="http://www.cnshsb.com/job.php">
                  <asp:Label ID="Label21" runat="server" Text="<%$ Resources:lang,RenCai%>"></asp:Label></a></li> 
        <li class="menu_line"><img src="http://www.cnshsb.com/image/2010new/selectmenu_line.gif"></li>    
	  		<li class="menu_link" ><a target="_blank" href="http://www.cnshsb.com/exhibition.php">
                  <asp:Label ID="Label22" runat="server" Text="<%$ Resources:lang,ZhanHui%>"></asp:Label></a></li> 
        <li class="menu_line"><img src="http://www.cnshsb.com/image/2010new/selectmenu_line.gif"></li>    
	  		<li class="menu_link"><a target="_blank" href="http://www.cnshsb.com/aboutus.php?msg=1">
                  <asp:Label ID="Label23" runat="server" Text="<%$ Resources:lang,XieZhuCaiGou%>"></asp:Label></a></li> 
        <li class="menu_line"><img src="http://www.cnshsb.com/image/2010new/selectmenu_line.gif"></li>    
	  		<li class="menu_link" ><a target="_blank" href="http://www.cnshsb.com/main.php">
                  <asp:Label ID="Label24" runat="server" Text="<%$ Resources:lang,HuiYuanDengLu%>"></asp:Label></a></li> 
        <li class="menu_line"><img src="http://www.cnshsb.com/image/2010new/selectmenu_line.gif"></li>    
	  			</ul>
            </div>
</div>
</div>

</div>

</div>

<div id="navbottom">
    <div id="navad">
   <div id="ad_left">
       <div id="navsearch"><div style="float:left;width:526px; padding-left:0px; margin-top:6px;;">
        						<form method="get" name="sear" id="sear" action="http://www.cnshsb.com/news_list.php">
				         			  <input value="" type="text" class="editbox" name="key"/>
        			  <select style="width:80px; height:28px; vertical-align:bottom; font-size:14px;border:#fca001 1px solid; padding:3px;" name="type" onchange="select_form(this.value,'http://www.cnshsb.com')">
					<option value="4"  >
                        <asp:Label ID="Label25" runat="server" Text="<%$ Resources:lang,ZiXun%>"></asp:Label></option>
                    <option value="3"  >
                        <asp:Label ID="Label26" runat="server" Text="<%$ Resources:lang,GongSi%>"></asp:Label></option>
					<option value="2"  >
                        <asp:Label ID="Label27" runat="server" Text="<%$ Resources:lang,ChanPin%>"></asp:Label></option>
					<option value="8"  >
                        <asp:Label ID="Label29" runat="server" Text="<%$ Resources:lang,GongYing%>"></asp:Label></option>
                    <option value="9"  >
                        <asp:Label ID="Label28" runat="server" Text="<%$ Resources:lang,QiuGou%>"></asp:Label></option>
                    <option value="6"  >
                        <asp:Label ID="Label30" runat="server" Text="<%$ Resources:lang,ZhaoShang%>"></asp:Label></option>
                    <option value="7"  >
                        <asp:Label ID="Label32" runat="server" Text="<%$ Resources:lang,RenCai%>"></asp:Label></option>
					<option value="5"  >
                        <asp:Label ID="Label31" runat="server" Text="<%$ Resources:lang,ZhanHui%>"></asp:Label></option>
					
				</select>
				<input type="submit" class="button" value="" />
                <input name="catType" id="catType" type="hidden" value="1" />
				</form>				
				</div>
                
                <div id="nav_ad">
		   			<div id="nav_adK">
                    <div class="menu1">
                    <ul>  
                    <li class=menu_link1><a href="http://www.cnshsb.com/aboutus.php?msg=1">
                        <asp:Label ID="Label33" runat="server" Text="<%$ Resources:lang,MianFeiFaBuQiuGouXinXi%>"></asp:Label></a></li>                  
<LI class=menu_line1><IMG src="http://www.cnshsb.com/image/2010new/selectmenu_line1.gif"></LI>
                    <li class=menu_link1><a href="http://www.cnshsb.com/biz_server.php">
                        <asp:Label ID="Label34" runat="server" Text="<%$ Resources:lang,HangYeFangTan%>"></asp:Label></a></li>
<LI class=menu_line1><IMG src="http://www.cnshsb.com/image/2010new/selectmenu_line1.gif"></LI>
                    <li class=menu_link1><a href="http://www.cnshsb.com/main.php">
                        <asp:Label ID="Label35" runat="server" Text="<%$ Resources:lang,WoDeShangWuZhuLi%>"></asp:Label></a></li>
<LI class=menu_line1><IMG src="http://www.cnshsb.com/image/2010new/selectmenu_line1.gif"></LI>
                    <li class=menu_link1><a href="http://www.cnshsb.com/aboutus.php?msg=1">
                        <asp:Label ID="Label36" runat="server" Text="<%$ Resources:lang,FuWuJianYi%>"></asp:Label></a></li>
                    </ul>
                    </div>
                    </div>
				</div>
                
	  </div>
   </div>
		<div id="ad_zb">
		   <div id="keywords"><li><b>
               <asp:Label ID="Label64" runat="server" Text="<%$ Resources:lang,ReMenChanPin%>"></asp:Label>:</b></li><li><script src='http://www.cnshsb.com/api/ad.php?id=3'></script></li></div>
		</div>
</div>
</div>
<!--头结束-->
<div class="clear"></div>
    <div id="middleadsec">
    <script src='http://www.cnshsb.com/api/ad.php?id=14'></script>
    </div>

<div class="menu_bottom L1">				
    <div class="headtop_L">
        <asp:Label ID="Label39" runat="server" Text="<%$ Resources:lang,NiDeWeiZhi%>"></asp:Label>:<a href='http://www.cnshsb.com/'><asp:Label ID="Label38" runat="server" Text="<%$ Resources:lang,ShouYe%>"></asp:Label></a> &raquo; <asp:Label ID="Label37" runat="server" Text="<%$ Resources:lang,HuiYuanZhuCe%>"></asp:Label></a>
    </div>		
</div>
<script type=text/javascript>
    var allnotblank = '所有选项不能为空';
    var passlength = '密码不能少于4个字符！';
    var passistooleng = '密码不能超过20个字符！';
    var passnotsame = '密码输入不一至！';
    var emailerror = 'E-mail格式不正确！';
    var randcodeerror = '请正确填写验证问题';
    var randcodeisemp = '请输入验证码';
    var rcodeiserror = '请正确填写验证码';
    var enterusername = '请填写用户名';
    var unameisfour = '用户名必须大于4位';
    var unameisen = '用户名不允许用中文';
    var usernameprotect = '用户名已存在或者受到保护禁止使用！';
    var have_blank = '用户名中不允许有空格！';
</script>
<script src="http://www.cnshsb.com/script/register.js" type=text/javascript></script>
<script type="text/javascript">
    var scatid = '';
    var tcatid = '';
    function getHTML(v, ob) {
        var url = 'city.php';
        var sj = new Date();
        var pars = 'shuiji=' + sj + '&cattype=pro&pcatid=' + v;
        var myAjax = new Ajax.Request(
                    url,
                    { method: 'post', parameters: pars, onComplete: showResponse }
                    );
        function showResponse(originalRequest) {
            var tempStr = 'var MyMe = ' + originalRequest.responseText;
            var i = 1; var j = 0;
            eval(tempStr);
            for (var s in MyMe) {
                ++j;
            }
            if (j > 0)
                $(ob).style.visibility = "visible";
            else
                $(ob).style.visibility = "hidden";
            $(ob).options.length = j + 1;
            $(ob).options[0].value = '';
            $(ob).options[0].text = '请选择行业类别';
            $(ob).options[0].selected = true;
            //alert(j);
            for (var k in MyMe) {
                var cityId = MyMe[k][0];
                var ciytName = MyMe[k][1];
                if (ob == 'tcatid' && i == 1) {
                    if (tcatid != '')
                        getHTML(tcatid, 'scatid');
                    else
                        getHTML(cityId, 'scatid');
                }
                $(ob).options[i].value = cityId;
                $(ob).options[i].text = ciytName;
                if (cityId == scatid || cityId == tcatid)
                    $(ob).options[i].selected = true;
                i++;
            }
        }
    }
</script>
<!--主体开始 -->
<div id="mainbody1" class="m1">
    	<div class="leftbar">
	<div class="title4"><div class="title_left2 L2">
        <asp:Label ID="Label42" runat="server" Text="<%$ Resources:lang,HuiYuanZhuCe%>"></asp:Label></div></div>
<form action="" method="post">
      <iframe src="TTWZSupplierRegister.aspx" width="100%" height="500px"></iframe>
		  </form>
	</div>
	<div class="rightbar">
			<div class="right1">
				<div class="title5" >
					<div class="title_left1 L2">
                        <asp:Label ID="Label41" runat="server" Text="<%$ Resources:lang,ZuiXinHuiYuan%>"></asp:Label></div>
		        </div>
				 <div class="content5">
					<ul class="li_list">
					 	<li><a href='http://www.cnshsb.com/shop.php?uid=25303' title='' target='_blank'>
                             <asp:Label ID="Label40" runat="server" Text="<%$ Resources:lang,XYSXRWZYXGS%>"></asp:Label>&nbsp;</a></li><li><a href='http://www.cnshsb.com/shop.php?uid=25302' title='' target='_blank'>
                                 <asp:Label ID="Label43" runat="server" Text="<%$ Resources:lang,BJSWMPDHCHJSYXGS%>"></asp:Label>&nbsp;</a></li><li><a href='http://www.cnshsb.com/shop.php?uid=25301' title='' target='_blank'>
                                     <asp:Label ID="Label44" runat="server" Text="<%$ Resources:lang,CQYGSKKJYXGS%>"></asp:Label>&nbsp;</a></li><li><a href='http://www.cnshsb.com/shop.php?uid=25300' title='' target='_blank'>
                                         <asp:Label ID="Label45" runat="server" Text="<%$ Resources:lang,GZSTFJXSBYXGS%>"></asp:Label>&nbsp;</a></li><li><a href='http://www.cnshsb.com/shop.php?uid=25299' title='' target='_blank'>
                                             <asp:Label ID="Label46" runat="server" Text="<%$ Resources:lang,LYGZXJTSHSBZZYXGS%>"></asp:Label>&nbsp;</a></li><li><a href='http://www.cnshsb.com/shop.php?uid=25298' title='' target='_blank'>
                                                 <asp:Label ID="Label47" runat="server" Text="<%$ Resources:lang,GZSCHBKJYXGS%>"></asp:Label>&nbsp;</a></li><li><a href='http://www.cnshsb.com/shop.php?uid=25297' title='' target='_blank'>
                                                     <asp:Label ID="Label48" runat="server" Text="<%$ Resources:lang,HNJBZGJXYXGS%>"></asp:Label>&nbsp;</a></li><li><a href='http://www.cnshsb.com/shop.php?uid=25296' title='' target='_blank'>
                                                         <asp:Label ID="Label49" runat="server" Text="<%$ Resources:lang,HBJSLXGGZZYXGS%>"></asp:Label>&nbsp;</a></li><li><a href='http://www.cnshsb.com/shop.php?uid=25295' title='' target='_blank'>
                                                             <asp:Label ID="Label50" runat="server" Text="<%$ Resources:lang,JYXHHTYYXGS%>"></asp:Label>&nbsp;</a></li><li><a href='http://www.cnshsb.com/shop.php?uid=25294' title='' target='_blank'>
                                                                 <asp:Label ID="Label51" runat="server" Text="<%$ Resources:lang,SDLXQXFFGS%>"></asp:Label>&nbsp;</a></li><li><a href='http://www.cnshsb.com/shop.php?uid=25293' title='' target='_blank'>
                                                                     <asp:Label ID="Label52" runat="server" Text="<%$ Resources:lang,SZSHLKZLJXSBYXGS%>"></asp:Label>&nbsp;</a></li><li><a href='http://www.cnshsb.com/shop.php?uid=25292' title='' target='_blank'>
                                                                         <asp:Label ID="Label54" runat="server" Text="<%$ Resources:lang,SHACJXSBYXGS%>"></asp:Label>&nbsp;</a></li><li><a href='http://www.cnshsb.com/shop.php?uid=25291' title='' target='_blank'>
                                                                             <asp:Label ID="Label55" runat="server" Text="<%$ Resources:lang,HBYJSHSBZZYXGS%>"></asp:Label>&nbsp;</a></li><li><a href='http://www.cnshsb.com/shop.php?uid=25290' title='' target='_blank'>
                                                                                 <asp:Label ID="Label56" runat="server" Text="<%$ Resources:lang,YZGLDKJCYYXGS%>"></asp:Label>&nbsp;</a></li><li><a href='http://www.cnshsb.com/shop.php?uid=25289' title='' target='_blank'>
                                                                                     <asp:Label ID="Label57" runat="server" Text="<%$ Resources:lang,HNJBZGJXYXGS%>"></asp:Label>&nbsp;</a></li>
				   </ul>
			    </div>
			  	<div class="bottom5"></div>
				<div class="clear"></div>
				</div>
		</div>		
		<!--主体右侧结束 -->

</div>
<div class="pic1"><img src="image/green/pic02.gif" width="960" height="70" /></div>
<div class="bottom">
	<div class="clear" style="height:8px;"></div>
	<a href='http://www.cnshsb.com/aboutus.php?type=1'>
        <asp:Label ID="Label68" runat="server" Text="<%$ Resources:lang,GuanYuWoMen%>"></asp:Label></a> | <a href='http://www.cnshsb.com/aboutus.php?type=2'>
        <asp:Label ID="Label53" runat="server" Text="<%$ Resources:lang,JinDu%>"></asp:Label><asp:Label ID="Label58" runat="server" Text="<%$ Resources:lang,ZaiXianBangZhu%>"></asp:Label></a> | <a href='http://www.cnshsb.com/aboutus.php?type=4'>
            <asp:Label ID="Label59" runat="server" Text="<%$ Resources:lang,RenCaiZhaoPin%>"></asp:Label></a> | <a href='http://www.cnshsb.com/aboutus.php?type=5'>
                <asp:Label ID="Label65" runat="server" Text="<%$ Resources:lang,LianXiWoMen%>"></asp:Label></a> | <a href='http://www.cnshsb.com/aboutus.php?type=6'>
                <asp:Label ID="Label60" runat="server" Text="<%$ Resources:lang,GuanGaoLianXi%>"></asp:Label></a> | <a href='http://www.cnshsb.com/aboutus.php?type=9'>
                    <asp:Label ID="Label66" runat="server" Text="<%$ Resources:lang,FuKuanFangShi%>"></asp:Label></a> | <a href='http://www.cnshsb.com/ads_services.php'>
                    <asp:Label ID="Label61" runat="server" Text="<%$ Resources:lang,GuangGaoFuWu%>"></asp:Label></a> | <a href='http://www.cnshsb.com/change_link.php'>
                        <asp:Label ID="Label67" runat="server" Text="<%$ Resources:lang,JiaoHuanLianJie%>"></asp:Label></a> | <a href='http://www.cnshsb.com/member_services.php'>
                        <asp:Label ID="Label62" runat="server" Text="<%$ Resources:lang,HuiYuanFuWu%>"></asp:Label></a><br>
    <asp:Label ID="Label63" runat="server" Text="<%$ Resources:lang,ZGSHSBW%>"></asp:Label><br />
</div>
    
</body>
<script type="text/javascript" language="javascript">var cssDirectory = '<%=Session["CssDirectory"] %>'; var oLink = document.getElementById('mainCss'); oLink.href = 'css/' + cssDirectory + '/' + 'bluelightmain.css';</script></html>
