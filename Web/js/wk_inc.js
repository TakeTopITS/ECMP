/*shouye_pic*/
function wkSliderA(conPicOutSideBox,conPic,timer,btn1,btn2,btnObjn,silderFont,fontbox,time,pichover,playerwww){
		
		var btnObj = $(btn1);
		var btnObj2 = $(btn2);
		var conPicObj = $(conPic);
		var timersiloder = timer;
		var btnObjlist = $(btnObjn);
		var fontObj = $(silderFont);
		var fontboxObj = $(fontbox);
		var time=time;
		var conList = conPicObj.find("li").size();
		var conPicObjw =conPicObj.find("li").width();
		var conPicObjh =conPicObj.find("li").height();  
		
		var pn=0;
		var left = -1;
		var run = 1;
		var isplay = false;
		
		
		
		
		
		
		
		var conPicObjwidth = conPicObjw*conList;
		
		//显示播放器的box
		var conPicOutSideBoxObj = $(conPicOutSideBox);
		var conPicOutSideBoxObjW= conPicOutSideBoxObj.width();
		//显示播放器的box
		
			
		
		
		
		
		if(conPicObjwidth>=conPicOutSideBoxObjW){
			var conPicObjwidth = conPicObjw*conList*2;
		    $(conPicObj).css({width:conPicObjwidth,height:conPicObjh});
			var silderListCon = conPicObj.html();
			
			conPicObj.append(silderListCon);//复制内容
			
			function xunhuan(){
			pn++;
			if(pn>conList){
				$(conPicObj).css({
				left:0
				});
				pn=1;
				};
			$(conPicObj).animate({
				left:pn*conPicObjw*left
				});
				
			wk_silderFont(pn);
			listnav(pn);
			nv(pn);
			};
		
		time = window.setInterval(xunhuan,timersiloder);
		
		//是否自动播放
		
	//window.clearInterval(time);
	
		
		
		
		function astop(astopobj){
			astopobj.bind({
			mouseenter:function(){
					if(run) {
						window.clearInterval(time);
						run = 0;
					}
				},
			mouseleave:function(){
					if(!run) {
							
						time = window.setInterval(xunhuan,timersiloder);	
						run = 1;
					}
				}
				
			
			});
			
			}
		
		astop(conPicObj);
		astop(btnObj);
		astop(btnObj2);
		astop(btnObjlist);	
		astop(fontObj);	
		astop(fontboxObj);
		btnObj.click(function(){
							  
			if(!isplay){
				pn=pn+1;
				if(pn>conList){
					$(conPicObj).css({left:0});
					pn=1;
					}
					$(conPicObj).animate({
						left:pn*conPicObjw*left
						},function(){
							isplay = false;
							});
					
				isplay = true;	
				
				listnav(pn);
				wk_silderFont(pn);
				nv(pn)
				}				  
			
				
				
			});
		btnObj2.click(function(){
				if(!isplay){
					pn=pn-1;
					if(pn<0){
					$(conPicObj).css({left:conPicObjw*left*(conList)});
					pn = conList-1;
					}
					$(conPicObj).animate({
						left:pn*conPicObjw*left
						},function(){
							
							isplay = false;
							});
					isplay=true;
					
					listnav(pn);
					wk_silderFont(pn);
					nv(pn);
					}
			});	
		
			$(conPicObj).find("li").click(function(){
				if(!isplay){						   
				var i = ($(this).index());
				if(i>conList){
					pn = i%conList
					}else{
						pn = i
						}
				
				
				wk_silderFont(pn);
				nv(pn);
				$(conPicObj).animate({
						left:pn*conPicObjw*left
						},function(){
							isplay = false;
							});
					isplay=true;
				}
				});	
			
			};
			
			
			//是否自动播放
		$(conPicObj).find("li").click(function(){
								   
				var i = ($(this).index());
				if(i>conList){
					pn = i%conList
					}else{
						pn = i
						}
				
				
				wk_silderFont(pn);
			   
				});	
		
		
		
		//font
		function wk_silderFont(pn){
			$(fontObj).eq(pn).fadeIn("slow").siblings().hide(0);	
			if(pn==conList){
				$(fontObj).eq(0).fadeIn("slow").siblings().hide(0);
				}
			}
		//font
		
		
		
		
		
			
		btnObjlist.click(function(){
				
				var i = $(this).index();
				listnav(i)
				pn = i;
				
				$(conPicObj).animate({
				left:pn*conPicObjw*left
				});
				wk_silderFont(pn)
				
				return false;
			});	
			
		function listnav(pn){
			if(pn>=conList){
				pn=0;
				}
				$(btnObjlist).each(function(i){
											//alert(i);
								if(i==pn){
									$(this).addClass(pichover);
								}else{
									$(this).removeClass(pichover);
								}
												 });
			
			}
		
			/*new_add*/	
		
		/*pm = 1  2  3 */
		
		var newlist = conPicObj.find("li").size();
		$(".ico_iii"+0).show(0);
		function nv(pn){
			for(var i=0;i<=newlist;i++){
				$(".nv"+i).removeClass("hover");
				$(".ico_iii"+i).hide(0);
				if(i==pn){
					$(".nv"+pn).addClass("hover");
					$(".ico_iii"+i).show(0);
					if(i ==conList){
					pn = 0;
					$(".nv"+pn).addClass("hover");
					$(".ico_iii"+pn).show();
					}	
					
					}
			
				
				
				};
			
			
			
			}
		/*new_add*/	
						
}


/*
$(function(){
	
	var time1;
	var time2;
	wkSliderA (".wk_sideboxa",".wk_insideboxa",10000,".wksolder_btna",".wksolder_btn2a","","","",time1);
	wkSliderA (".wk_sideboxb",".wk_insideboxb",10000,".wksolder_btnb",".wksolder_btn2b","","","",time2);
	});
*/


//tab
function indextab(spanCenternav,spanCentermian,hover){
	var spanCenternavObj = $(spanCenternav);
	var hover = hover;
	var spanCentermianObj = $(spanCentermian);
	var asize = spanCenternavObj.find("a").size();
	spanCenternavObj.find("a").mouseenter(function(){
		var i = $(this).index();
		$(this).addClass(hover).siblings().removeClass(hover);
		
		//

		//
		
		for(var j=0;j<asize;j++){
			spanCentermianObj.eq(j).hide(0);
			}
		spanCentermianObj.eq(i).show(0);
		
		});
	
	
}

$(function(){
	var hover1 = "hover";
	indextab(".spanCenternav",".spanCentermian");
	})



/*banner*/
$(function(){
		  
		  
		  var timer=5000;
		  var showtime = 800;
		  var showbox = $("#banner_show");
		  var inbox = $(".bannger_inbox");
		  var movelist = $("#yq_banner_list");
		  
		  var s;
		  var b = 0;
		  var size =inbox.size();
		  
		  var play = 1;
		  
		  function move(){
			  b++;
			  if(b>size-1){
				  b=0;
				  }
			  inbox.each(function(e){
								  inbox.eq(e).hide(0);
								  
								  $("#banner_magbox"+e).hide();
								  movelist.find("a").eq(e).removeClass("hover");
								  if(e == b){
									 inbox.eq(b).fadeIn(showtime);
									 $("#banner_magbox"+b).show();
									 movelist.find("a").eq(b).addClass("hover");
									  }
								  });
			  
			  
			  }
		  
		   s = setInterval(move,timer);
		   
		   function stopp(obj){
			   $(obj).hover(function(){
									if(play){
										clearInterval(s);
										play = 0;
										}	  
										  
										  
								      },
								 function(){
									 if(!play){
									s = setInterval(move,timer); 
									 play = 1;
										}	
									 }		  
										  );
			   
			   
			   }
		   
		  stopp(".banner_show");
		  
		  $(".banner_btn_right").click(function(){
											 move(); 
											   });
		  
		   $(".banner_btn_left").click(function(){
											  b--;
			  if(b<0){
				  b=size-1
				  }
			  inbox.each(function(e){
								  inbox.eq(e).hide(0);
								  movelist.find("a").eq(e).removeClass("hover");
								  if(e == b){
									 inbox.eq(b).fadeIn(showtime);
									 movelist.find("a").eq(b).addClass("hover");
									  }
								  }); 
											   });
		  
		   movelist.find("a").click(function(){
							var rel = $(this).attr("rel");
							inbox.each(function(e){
								  inbox.eq(e).hide(0);
								  movelist.find("a").eq(e).removeClass("hover");
								  $("#banner_magbox"+e).hide(0);
								  if(e == rel){
									 inbox.eq(rel).fadeIn(showtime);
									 movelist.find("a").eq(rel).addClass("hover");
									 $("#banner_magbox"+rel).show(0);	
									  }
								  });
							});
		   
		   
		    $(".bannger_inbox").each(function(e){
										    var inboxsize = $(".bannger_inbox").size();
											inboxwimg = $(this).find("img").width();
											$(".bannger_inbox").eq(e).css({"margin-left":(-1)*inboxwimg/2+"px","z-index":inboxsize-e});
											
												});
		   
		   
});

/*banner*/

$(function(){
var tt1;
		   $(".content_bottom_tig").bind({
										mouseenter:function(){
											
											$(this).find(".h_bg").addClass("hover");

											that = $(this)
											tt1= setTimeout(function(){
													that.animate({
													height:130
													}); 
													},200);

											

											
											},
										click:function(){
											
											
											},
										mouseleave:function(){
											 $(this).find(".h_bg").removeClass("hover");
											clearTimeout(tt1);
											that.animate({
												height:25
												}); 
													
											       
												

											 
											
											}	
										 
										 
										 });
										
		   })
/*index_nav*/
$(function(){
		   $("#nav_mian").hover(function(){
									 $("#nav_mian_tankuang").show();
									 
									 },function(){
										$("#nav_mian_tankuang").hide();
										 
										 });
		   
		   
		   });

/**/
function showandhide(lan_nav_1,top_tig_1,tt){
	
	
	
	var t5= tt;
	var lan_nav = $(lan_nav_1);
	var top_tig = $(top_tig_1);
	lan_nav.hover(function(){
								clearTimeout(t5);
								top_tig.show();
									},function(){
										 var that = top_tig;
										 t5 = setTimeout(function(){that.hide();},200);
										 });
	
	top_tig.hover(function(){
								clearTimeout(t5);
									},function(){
										 var that = $(this);
										 t5 = setTimeout(function(){that.hide();},200);
										 });
	
			
			
}
$(function(){
	var t1;
	var t2;
	var t3;
	showandhide(".lan_nav",".top_tig1",t1);
	showandhide(".lan_nav2",".top_tig2",t2);
	showandhide(".lan_nav3",".top_tig3",t3);
	
	});
	
	
	
	

function show_comp_box (n){
		
		var m = $(".all_company_earo_bpox").size();
		for(var i=0;i<m;i++){
			$("#all_company_re_id"+i).addClass("close").removeClass("open");
			$("#all_company_box"+i).hide();
			
			};
		
		$("#all_company_re_id"+n).addClass("open").removeClass("close");
	
		$("#all_company_box"+n).show();	
		
		
}
	
function showhy_comp_box (n){
		
		var m = $(".all_companyhy_earo_bpox").size();
		for(var i=0;i<m;i++){
			$("#all_companyhy_re_id"+i).addClass("close").removeClass("open");
			$("#all_companyhy_box"+i).hide();
			
			};
		
		$("#all_companyhy_re_id"+n).addClass("open").removeClass("close");
	
		$("#all_companyhy_box"+n).show();	
		
		
}	
	



	