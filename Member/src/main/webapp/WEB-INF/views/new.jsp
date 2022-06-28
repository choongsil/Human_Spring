<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>새글쓰기</title>
</head>
<body>
제목:<input type=text id=title name=title><br>
내용:<textarea id=content rows="10" cols="70"></textarea><br>
<input type="button" value='작성완료' id='submit'>&nbsp;
<input type=button value='목록으로 돌아가기' id=btnList>
</body>
</html>
<script src='https://code.jquery.com/jquery-3.4.1.js'></script>
<script>
$(document)
.on('click','#btnList',function(){
	document.location='/member';
})
.on('click','#submit',function(){
	if(confirm('등록 하시겠습니까?')){
		$.ajax({
			type:'post',
			url:'addboard',
			data:{'title':$('#title').val(),
				'content':$('#content').val()},
			dataType: 'text',
			success:function(){
				document.location='/member'
			},
			complete: function(){
				
			}
			
		}); 
	}else{
		return false;
	}
	
})
</script>