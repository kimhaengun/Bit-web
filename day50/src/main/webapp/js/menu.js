	$(function(){
		$('ul>li:eq(2)')
		/*
			.click(function(){
				return false;
			})
		*/	
			.mouseenter(function(){
				//emp에 마우스 올리면 ol 출력
				$(this).find('ol').show();
			})
			.mouseleave(function(){
				//emp에 마우스 빠져나가면 ol 사라짐
				$(this).find('ol').hide();
			});
	});