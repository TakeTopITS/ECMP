// JavaScript Document

		$(function(){
			 $("#navlist li").hover(function(e){
				 e.stopPropagation();
					$(this).children(".f_max").fadeIn("fast");
				},function(){
					$(this).children(".f_max").fadeOut("fast");
			 });
		})
		
function AutoScroll(obj) {

            $(obj).find("ul:first").animate({
                marginTop: "-38px"
            }, 200, function() {
                $(this).css({ marginTop: "0px" }).find("li:first").appendTo(this);
            });
        }
        $(document).ready(function() {
            var myar = setInterval('AutoScroll("#scrollDiv")', 3000)
            $("#scrollDiv").hover(function() { clearInterval(myar); }, function() { myar = setInterval('AutoScroll("#scrollDiv")', 3000) }); 
        });
		
		//data;
$(function(){
      setInterval("GetTime()",1000);
    })