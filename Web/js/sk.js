<!--
var mypath='',mypaths;
for(i=0;i<document.scripts.length;i++)
  {
    if(document.scripts[i].src.indexOf('js/sk.js?')!='-1')
    {
      mypath=document.scripts[i].src ;
      mypaths=mypath.split('?') ;
      mypath=mypaths[1] ;
      break ;
    }
  }


function WriteQqStr()
{
	document.write('<DIV id=backi style="LEFT: 0px; OVERFLOW: visible; POSITION: absolute; TOP: 140px">');
	document.write('<table border="0" cellpadding="0" cellspacing="0" width="72">');
	document.write('<tr><td><a href="javascript:close_float_left();void(0);" title="close"><IMG src="'+mypath+'img/sk/01.gif" border=0></a></td></tr>');
	document.write('<tr><td><A href="tencent://message/?uin=623077337&Site=www.taketopits.com&Menu=yes"><IMG src="'+mypath+'img/sk/02.gif" border=0></A></td></tr>');
	
	
	document.write('<tr><td><A href="msnim:chat?contact=jack_erp@hotmail.com" target=_blank><IMG src="'+mypath+'img/sk/06.gif" border=0></A></td></tr>');
	document.write('<tr><td><A href="'+mypath+'user.php" target=_blank><IMG src="'+mypath+'img/sk/05-1.gif" border=0></A></td></tr>');
	document.write('</table>');
	document.write('</DIV>');
}

function close_float_left(){backi.style.visibility='hidden';}

lastScrollY=0; 
function heartBeat(){ 
diffY=document.documentElement.scrollTop; 
percent=.1*(diffY-lastScrollY); 
if(percent>0)percent=Math.ceil(percent); 
else percent=Math.floor(percent); 
document.all.backi.style.pixelTop+=percent; 
lastScrollY=lastScrollY+percent; 
} 

if (!document.layers) {WriteQqStr();window.setInterval("heartBeat()",1); }
//-->