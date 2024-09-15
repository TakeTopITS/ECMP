<script language="javascript">
/////////////////////////////////////////////////////
//静态页面取得Url参数值
//例：http://www.husun.cn/index.html?id=1&name=2
//requestQueryStr("name") 得到结果2
//Author:myhon
//Date:2006-05-27
/////////////////////////////////////////////////////
var purl = document.referrer
function headcall_command( cmd )
{

	about =  headcall.about ;

	if( about == null ) 
	{
		alert('您需要安装全球免费的HeadCall网络电话，点击确定后立即下载。');
		top.location.target = '_top';
		top.location.href = "http://www.80083090755.cn/xdown/";
	}
	else
	{
		headcall.command( cmd ) ;
		if (purl!=''){
			location = purl ;
		}
		else{
			location = "http://www.80083090755.cn/";
		}
	}

}

function requestQueryStr(paraName){
	var pageUrl;
	var urlPara;
	var urlParaName;
    var urlParaValue;
	pageUrl=document.location;
	pageUrl=pageUrl.toString();
	urlPara=pageUrl.split("?");
	urlPara=urlPara[1];
	urlPara=urlPara.split("&");
	for(i=0;i<urlPara.length;i++){
	    urlParaName=urlPara[i].split("=")[0];
		urlParaValue=urlPara[i].split("=")[1];
		if(paraName==urlParaName){
		    return urlParaValue;
			break;
		}
	}
    return false;
}
//alert(requestQueryStr('phone'));

</script>
<style type="text/css">
<!--
.style2 {color: #CCCCCC}
-->
</style>

<p>
  <object classid="clsid:8A3D3492-5E6A-4FAA-BF81-7AB716196321" id="headcall" width="1" height="1" >
  </object>
  <script language="javascript">
headcall_command('dial?'+requestQueryStr('headcall'));
</script>
><span class="style2">www.80083090755.cn;QQ:24219820&#37324;&#38754;&#21442;&#25968;&#26080;&#38656;&#35201;&#20462;&#25913;&#21542;&#21017;&#20986;&#38169;&#65281;</span></p>
