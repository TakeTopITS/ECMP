(function($) {
	$.fn.huadong = function( obj, obja, time ) {
		this.height($(window).height()).css({'position':'absolute', 'top':'0px', 'left' : '0px'});
		var left = $(obj).width(), up = this;
		$(obj).height($(window).height()).width(0).hide();
		$(obja).click(function(){;
			$(obj).show().animate({'width':left + 'px'}, time);
		});
		$(obj).mouseout(function(){
			$(this).animate({'width':'0px'}, time, function(){ $(this).hide(); });
		});
	}
})(jQuery);