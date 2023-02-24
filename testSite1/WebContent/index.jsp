<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="js/jquery.bxslider.min.js"></script>
<link href="css/myProject.css" rel="stylesheet">
<style type="text/css">
	.bx{
		width: 750px;
		height:400px;
		margin: 100px 100px 0px -100px;
	}
	.bx>ul{}
	.bx>ul>li{}
	.bx li>img{
		width: 250px;
		height: 250px;
	}
	.bx .bx-wrapper{
		position: relative;
	}
	.bx .bx-controls-direction>a{
		position: absolute;
		top: 20px;
		background-color: rgba(0,0,0,0.2);
		display: inline-block;
		width: 50px;
		height: 230px;
		text-align: center;
		text-decoration: none;
		color:white;
		font-size: 50pt;
		line-height: 220px;
		font-weight: bold;
	}
	.bx-pager{
		width: 120px;
		margin: 0 auto;
	}
	.bx-pager .bx-pager-item{
		margin:20px 0px 20px 0px;
		float: left;
		width: 20px;
		height: 20px;	
	}
	.bx .bx-controls-direction>a:last-child{
		left:700px;
	}
	.bx .bx-pager-link{
		text-decoration: none;
		color:gray;
	}
	.bx .bx-pager .active{
		color: red; //#333 
	}
	
</style>
<script type="text/javascript">
$(function(){

		$('.bx>ul').bxSlider({
			slideWidth:250, 
			moveSlides:1, 
			minSlides:1, 
			maxSlides:3,
			prevText:"<",
			nextText:">"
			});
		$('.bx-pager-link').text('ο');
	});
</script>
</head>
<body>
	<%@include file="../includes/menu.jsp" %>
	<div id="content">
			<div class="bx">
				<ul>
					<li><img alt="" src="imgs/thumb01.jpg"></li>
					<li><img alt="" src="imgs/thumb02.jpg"></li>
					<li><img alt="" src="imgs/thumb03.jpg"></li>
					<li><img alt="" src="imgs/thumb04.jpg"></li>
					<li><img alt="" src="imgs/thumb05.jpg"></li>
					<li><img alt="" src="imgs/thumb06.jpg"></li>
				</ul>
			</div>
	</div>
	<jsp:include page="includes/footer.jsp"></jsp:include>
	
</body>
</html>