<%@page import="com.bit.dto.ReplyDto"%>
<%@page import="java.util.List"%>
<%@page import="com.bit.dto.CommunityDto"%>
<%@page import="org.apache.catalina.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="../css/myProject.css" rel="stylesheet">
<script type="text/javascript" src="../js/jquery-1.12.4.min.js"></script>
<style type="text/css">
</style>
<script type="text/javascript">
	$(function(){
		console.log();
		$('#replyList').find($('.editInput')).hide();
		
		
		//유저가 게시판 삭제할 경우
		$('#detailfooterdom').find('a').last().click(function(){
			var url = $(this).attr('href');
			var param = url.substring(url.indexOf('?')+1);
			var url = url.substring(0,url.indexOf('?'));
			
			console.log(url+"\n"+param);
			if(confirm('삭제하시겠습니까')){
				$.post(url, param, function(){
					location.replace('list?page=1');
					
				});					
			}
			return false;
		})
		//삭제 버튼 마우스 이벤트 / css
		//수정
		$('#detailfooterdom').find('a').first().mouseover(function(){
			$(this).css("color","blue");
			$(this).css("font-weight","bold");
		}).mouseout(function(){
			$(this).css("color","black");
			$(this).css("font-weight","normal");
		})
		//삭제
		$('#detailfooterdom').find('a').last().mouseover(function(){
			$(this).css("color","red");
			$(this).css("font-weight","bold");
		}).mouseout(function(){
			$(this).css("color","black");
			$(this).css("font-weight","normal");
		})
		
		//댓글
		$('#replyWriteForm>a').click(function(){
			//console.log('댓글 작성 클릭릭', $('#communityNo').val(), $('#uid').val(), $('#content').val());
			var communityNo = $('#communityNo').val();
			var uid = $('#uid').val();
			var content =$('#contents').val();
			//console.log(communityNo, uid, content);
			// 비로그인 시 로그인 폼으로
			if("삭제된 댓글 입니다."==content){
				alert('사용할 수 없는 문장입니다.')
				return false;
			}
			if(uid==""|| uid==''){
				location.replace('/testSite1/user/loginForm.jsp');
			}
			$.ajax({
				url:'reply.do',
				method:'post',
				data:{"communityNo":$('#communityNo').val(), "id":$('#uid').val(), "content":content},
			}).done(function(){
				//디테일 페이지로 이동
				var go = '/testSite1/community/detail?communityNo='+communityNo;
				location.replace(go);
				adskldsklds
				
			});
			
		});
		//대댓글
		var modalState=false;
		$('#replyFooter>div:nth-child(1)').click(function(){
			//댓글작성 클릭 시 댓글 작성 Form 생성
			if(modalState==false){
			console.log($(this).parent().parent().find('input').first().val())
			var communityNo = $('#communityNo').val();
			$('<input placeholder="댓글을 입력해주세요." id="replycontent"/>').appendTo($(this).parent().next());
			$('<a>작성</a>').appendTo($(this).parent().next().last())
						.click(function(){
							/*
							console.log(
									
									'대댓글 작성 클릭'
									, $('#communityNo').val()
									, $('#uid').val()
									,$('#replycontent').val()
									, $(this).parent().parent().find('input').first().val()
									
									);
							*/
							// 비로그인 시 로그인 폼으로
							if(uid==""|| uid==''){
								location.replace('/testSite1/user/loginForm.jsp');
							}
							
							$.ajax({
								url:'rereply',
								method:'post',
								data:{
									"communityNo":$('#communityNo').val(),
									"id":$('#uid').val(),
									"content":$('#replycontent').val(), 
									"positions": $(this).parent().parent().find('input').first().val()
									}
							}).done(function(){
								//디테일 페이지로 이동
								var go = '/testSite1/community/detail?communityNo='+communityNo;
								location.replace(go);
							})
						});
			modalState=true;
			}else{
				$(this).parent().next().remove();
				modalState=false;
			}
		});
		//수정
		$('#replyFooter>div:nth-child(2)').click(function(){
			var value,editValue,editNo;
			$(this).parent().prev().find($('.editInput')).show();
			$(this).parent().prev().find($('.editDiv')).hide();
			
			console.log($(this).parent().prev().find($('.editInput')).find('input'))
			
			$(this).parent().prev().find($('.editInput')).find('a').click(function(){
				//기존 값
				valuedom=$(this).parent().prev().html();
				//변경 값
				editValue=$(this).parent().prev().next().find('input').val();
				//replyNo
				replyNo = $(this).parent().prev().parent().prev().parent().find($('input')).eq(1).val();
				console.log('no찾기',valuedom,editValue,editNo);
				if(uid==replyUserId){
					return false;
				}
				$.ajax({
					url:'replyEdit',
					method:'post',
					data:{
						replyNo:replyNo,
						content:editValue
					}
				});
				
				$(this).parent().prev().text(editValue);
				$(this).parent().prev().next().hide();
				$(this).parent().prev().show();
				console.log('변경',$(this).parent().prev().html())
			})
			
		});
		
		//삭제
		$('#replyFooter>div:nth-child(3)').click(function(){
			console.log('삭제 클릭')
			var result;
			var uid = $('#uid').val();
			var replyUserId = $('#replyUserId').val();
			
			if(uid==replyUserId){
				return false;
			}
			$.ajax({
				url:'replyDelete',
				method:'post',
				data:{
					replyNo:$('#replyNo').val()
				},
				dataType:"text"
			}).done(function(data){
				if(data==='ok'){
					//삭제 성공
					//console.log('삭제 성공!!!!!!!!');
					result='ok';
					//console.log($(this))
					return result;
				}else{
					alert('삭제 실패');
					rsult='false';
				}
				
			})
			
			//ajax보다 빠르게 실행됨...
			//console.log('result ',result)
			//if(result==='ok'){
								
			//}else{
				
			//}
			
			// Dom 텍스트 변경
			$(this).parent().prev().text('삭제된 댓글 입니다.').css("color","gray").css("font-size","13px").css("font-weight", "bold").next().remove();
		});
		
	})
</script>
</head>
<body>


	<%@include file="../includes/menu.jsp" %>

	<div id="content_cm">
		<div id="contentLeft">
			<div>게시판</div>
		</div>
		<div id="contentRightDetail">
			<div>상세보기</div>
			<hr/>
			<%
				CommunityDto dto = (CommunityDto)request.getAttribute("communityInfo");
			%>
			<div id="detailFormContent">
				<input type="hidden" name="id" value="<%=user.getId() %>" id="uid"/>
				<input type="hidden" name="communityNo" value="<%=dto.getCommunityNo() %>" id="communityNo"/>
	                <div id="detailtitledom">
	                    <p ><%=dto.getTitle() %></p>
	                </div>
	                <div id="detailInfodom">
	                	<p>작성자 :</p>
	                	<p><%=dto.getId() %></p>
	                	<div>
	                		<p>작성일 :</p>
	                		<p><%=dto.getHiredate() %></p>
	                	</div>
	                	<div>
		                	<p>조회수 :</p>
		               		<p><%=dto.getCounts() %></p>
	                	</div>
	                </div>
	                <div id="detailcontentdom">
	                    <textarea readonly/><%=dto.getContent() %></textarea>
	                </div>
	            <div id="detailfooterdom">
	            	<div id="reply">
	            		<p>댓글</p>
	            	</div>
	            	<%
	            		if(dto.getId().equals(user.getId())){ %>
	                		<a href="edit?communityNo=<%=dto.getCommunityNo()%>">수정</a>
		                	<a href="delete?communityNo=<%=dto.getCommunityNo()%>">삭제</a>
	                <%}%>
	            </div>

	            	<div id="replyWriteForm">
	            		<input placeholder="댓글을 입력해주세요." name="reply" id="contents"/>
	            		<a>작성</a>
	            	</div>
				<div id= "replyList">
	            <%
	            	//댓글 리스트
	            	List<ReplyDto> list = (List<ReplyDto>)request.getAttribute("replylist");
	            	for(ReplyDto replydto : list){
	            	if("삭제된 댓글 입니다.".equals(replydto.getContent())){
	            		//삭제된 댓글일 경우
	            		if(2>replydto.getDepth()){
	            		//삭제된 부모 댓글일 경우
	            %>
	            <div id="replyListForm">
	            	<input type="hidden" value="<%=replydto.getPosistions()%>" id="positions">
	            	<input type="hidden" value="<%=replydto.getReplyNo()%>" id="replyNo">   	
	            	<div id="replyTitle">
	            		<div id="replyUserId"><%=replydto.getId() %></div>
	            		<div>
	            			<div>작성일</div>
	            			<div><%=replydto.getHiredate() %></div>
	            		</div>	
	            	</div>
	            	<div id="replyContent">
	            		<div id="replyDeleteContent"><%=replydto.getContent() %></div>
	            	</div>
	            <hr/>
	            </div>	
	            <%
	            		}else{
	            	   //삭제된 자식 댓글일 경우
	            %>
	            <div id="replyListForm">
	            <input type="hidden" value="<%=replydto.getPosistions()%>" id="positions">
	            <input type="hidden" value="<%=replydto.getReplyNo()%>" id="replyNo">
	            	<div id="division">└</div>
	            	<div id="replyTitle">
	            		<div id="replyUserId"><%=replydto.getId() %></div>
	            		<div>
	            			<div>작성일</div>
	            			<div ><%=replydto.getHiredate() %></div>
	            		</div>
	            		
	            	</div>
	            	<div id="replyDeleteContent">
	            		<div id="replyDeleteContent"><%=replydto.getContent() %></div>
	            	</div>
	            <hr/>
	            </div>	
	            <%		
	            		}
	            } else{
	            	if(2>replydto.getDepth()){
	            %>
	            <div id="replyListForm">
	            	<input type="hidden" value="<%=replydto.getPosistions()%>" id="positions">
	            	<input type="hidden" value="<%=replydto.getReplyNo()%>" id="replyNo">   	
	            	<div id="replyTitle">
	            		<div id="replyUserId"><%=replydto.getId() %></div>
	            		<div>
	            			<div>작성일</div>
	            			<div><%=replydto.getHiredate() %></div>
	            		</div>	
	            	</div>
	            	<div id="replyContent">
	            		<div class="editDiv"><%=replydto.getContent() %></div>
	            		<div class="editInput">
		            		<input id="editContent" value="<%=replydto.getContent() %>">
		            		<a>변경</a>
	            		</div>
	            	</div>
	            	<div id="replyFooter">
	            		<div>댓글작성</div>
	            		<%
	            		if(replydto.getId().equals(user.getId())){ %>
	            		<div>수정</div>
	            		<div>삭제</div>
	            		<%} %>
	            	</div>
	            	<div id="rereply">
	            		
	            	</div>
	            <hr/>
	            </div>
	            <%}else{ %>
	            <div id="replyListForm">
	            <input type="hidden" value="<%=replydto.getPosistions()%>" id="positions">
	            <input type="hidden" value="<%=replydto.getReplyNo()%>" id="replyNo">
	            	<div id="division">└</div>
	            	<div id="replyTitle">
	            		<div><%=replydto.getId() %></div>
	            		<div>
	            			<div>작성일</div>
	            			<div><%=replydto.getHiredate() %></div>
	            		</div>
	            		
	            	</div>
	            	<div id="replyContent">
	            		<div class="editDiv"><%=replydto.getContent() %></div>
	            		<div class="editInput">
		            		<input id="editContent" value="<%=replydto.getContent() %>">
		            		<a>변경</a>
	            		</div>
	            	</div>
	            	<div id="replyFooter">
	            		<div>댓글작성</div>
	            		<%
	            		if(replydto.getId().equals(user.getId())){ %>
	            		<div>수정</div>
	            		<div>삭제</div>
	            		<%} %>
	            	</div>
	            	<div id="rereply">
	            		
	            	</div>
	            <hr/>
	            </div>
	            <%}}} %>
	            </div>
			</div>
		</div>
	</div>
	<jsp:include page="../includes/footer.jsp"></jsp:include>
</body>
</html>