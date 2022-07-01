<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>Home</title>
	<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<!-- 구글폰트 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Gothic+A1:wght@700&display=swap"
	rel="stylesheet">
<!--다이얼로그-->
<link rel="stylesheet"
	href="https://code.jquery.com/ui/1.13.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script src="https://code.jquery.com/ui/1.13.1/jquery-ui.js"></script>
</head>
<style>
input:focus {
	outline-style: none;
}

body {
	font-family: 'Gothic A1', sans-serif;
}

#round {
	border-radius: 20px;
	border: 2px solid #87abed;
}

option {
	text-align: justify;
	text-align-last: justify;
}
</style>
</head>
<body class="bg-light">
	<ul class="nav">
		<li class="nav-item"><a class="nav-link active"
			aria-current="page" href="#">예약관리</a></li>
		<li class="nav-item"><a class="nav-link active"
			aria-current="page" href="#" id="houseKeeing_1">객실관리</a></li>
	</ul>
	<div class="container" id="houseKeeing_2" style="display: none;">
		<div class="row">
			<div class="col-md-offset-2 col-md-4">
				<h4 style="text-align: center;">객실목록</h4>
				<input type="hidden" id='roomnum'> <select
					class="form-select" id='roomlist' multiple
					aria-label="multiple select example" style="height: 300px;">
				</select>
			</div>
			<div class="col-md-4">
				<div>
					<h5>객실명</h5>
					<ul>
						<li><input type="text" id='room_name' class="form-control"
							style="width: 150px;"></li>
					</ul>
				</div>
				<div>
					<h5>객실종류</h5>
					<ul>
						<li><select id='room_type' class="form-select form-select-sm"
							aria-label=".form-select-sm example" style="width: 150px;"></select></li>
					</ul>
				</div>
				<div style="white-space: nowrap;">
					<h5>숙박인원</h5>
					<ul>
						<li><input type="text" id='room_cnt' class="form-control"
							style="display: inline-block; width: 150px; text-align: right;">명</li>
					</ul>
				</div>
				<div style="white-space: nowrap;">
					<h5>1박요금</h5>
					<ul>
						<li><input type="text" id='price' class="form-control"
							style="display: inline-block; width: 150px; text-align: right;">원</li>
					</ul>
				</div>
				<div>
					<input type="button" value="등록" id='roomadd'
						class="btn btn-outline-primary"> <input type="button"
						value="삭제" id='roomdelete' class="btn btn-outline-primary">
					<input type="button" value="비우기" id='clear'
						class="btn btn-outline-primary">
				</div>
			</div>
		</div>
	</div>
	<div class="container" style="padding: auto; margin: auto;">
		<div class="row">
			<div class="col-md-4" style="margin-right: 10px;" id="round">
				<div style="padding-top: 20px;">
					<h5>숙박기간</h5>
					<div>
						<ul>
							<li><input type="date" id='date1' class="form-control"
								style="width: 150px; display: inline-block;">~<input
								type="date" id='date2' class="form-control"
								style="width: 150px; display: inline-block;"></li>
						</ul>
					</div>
				</div>
				<h5>숙박예정 인원</h5>
				<ul>
					<div>
						<div>
							<li><input type="number" id='recnt' class="form-control"
								style="width: 150px; display: inline-block; text-align: right;"
								min=1>명</li>
						</div>
					</div>
				</ul>
				<div>
					<h5>객실종류</h5>
					<ul>
						<li><select id='reroomtype'
							class="form-select form-select-sm"
							aria-label=".form-select-sm example" style="width: 150px;">
						</select></li>
					</ul>
				</div>
				<div style="text-align: center;">
					<input type="button" value="찾기" id='find'
						class="btn btn-outline-primary">
				</div>
				<div>
					<h5>예약가능객실</h5>
					<div style="text-align: center;">
						<ul>
							<select id='reroomlist' class="form-control"
								style="width: 100%; height: 450px;" multiple></select>
						</ul>
					</div>
				</div>
			</div>
			<div class="col-md-3" style="margin-right: 10px;" id="round">
				<div style="padding-top: 20px;">
					<h6>예약번호</h6>
					<ul>
						<li><input type="text" id='renum' class="form-control"
							style="width: 220px;" readonly></li>
					</ul>
				</div>
				<div>
					<h6>객실명</h6>
					<ul>
						<li><input type="text" id='rerooname' class="form-control"
							style="width: 220px;" readonly></li>
					</ul>
				</div>
				<div>
					<h6>객실종류</h6>
					<ul>
						<li><input type="text" id='reroomtype2' class="form-control"
							style="width: 220px;" readonly></li>
					</ul>
				</div>
				<div>
					<h6>숙박예정인원</h6>
					<ul>
						<li><input type="text" id='recnt2' class="form-control"
							style="width: 150px; display: inline-block; text-align: right;">명</li>
					</ul>
				</div>
				<div>
					<h6>숙박기간</h6>
					<div style="white-space: nowrap;">
						<ul>
							<li><input type="text" id='date3' class="form-control"
								style="width: 110px; font-size: 10px; display: inline-block;"
								readonly>~<input type="text" id='date4'
								class="form-control"
								style="width: 110px; font-size: 10px; display: inline-block;"
								readonly></li>
						</ul>
					</div>
				</div>
				<div>
					<h6>예약자</h6>
					<ul>
						<li><input type="text" id='name' class="form-control"
							style="width: 220px;"></li>
					</ul>
				</div>
				<div>
					<h6>모바일 번호</h6>
					<ul>
						<li><input type="text" id='mobile' class="form-control"
							style="width: 220px;"></li>
					</ul>
				</div>
				<div>
					<h6>숙박총액</h6>
					<ul>
						<li><input type="text" id='sum' class="form-control"
							style="width: 170px; display: inline-block; text-align: right;">원</li>
					</ul>
				</div>
				<div style="text-align: center;">
					<input type="button" value="예약등록" id='addreserve'
						class="btn btn-outline-primary"> <input type="button"
						value="예약취소" id='deletereserve' class="btn btn-outline-primary">
				</div>
				<div style="text-align: center; padding-top: 10px">
					<input type="button" value="비우기" id='clearn2'
						class="btn btn-outline-primary">
				</div>
			</div>
			<div class="col-md-4" id="round">
				<div style="padding-top: 50px;">
					<h4>예약내역</h4>
				</div>
				<select id='reroomlist2' class="form-control"
					style="width: 100%; height: 700px;" multiple></select>
			</div>
		</div>
	</div>


	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>
</body>
<script>
	$(document).ready(function() {
		roomdata();
		roomtypedata();
		$("#houseKeeing_2").dialog({
			title : '객실관리',
			autoOpen : false,
			modal : true,
			show : {
				effect : "blind",
				duration : 800
			},
			hide : {
				effect : "blind",
				duration : 800
			},
			width : '700px',
			height : 'auto',
			open : function(event, ui) {

			},
			close : function(event, ui) {
				noreserve();
				reserveroom();
			}
		});
	}).on('click', '#houseKeeing_1', function() {
		$("#houseKeeing_2").dialog("open");
	})
	//객실목록 클릭했을때
	.on('click', '#roomlist option:selected', function() {
		$('#roomnum').val($(this).val());
		let ar = $(this).text().split(' ');
		$('#room_name').val(ar[0]);
		$('#room_type').val(ar[1]);
		$('#room_cnt').val(ar[2]);
		$('#price').val(ar[3]);
		$('#roomadd').val('수정');
	})
	// 객실목록 수정 및 추가
	.on('click', '#roomadd', function() {
		if ($('#roomadd').val() == '수정') {
			$.ajax({
				type : 'get',
				url : 'updateRoom',
				data : {
					room_id : $('#roomnum').val(),
					room_name : $('#room_name').val(),
					room_type : $('#room_type').val(),
					min : $('#room_cnt').val(),
					price : $('#price').val()
				},
				success : function(data) {
					roomdata();
					$('#roomnum').val('');
					$('#room_name').val('');
					$('#room_type').val('');
					$('#room_cnt').val('');
					$('#price').val('');
					$('#roomadd').val('등록');
				}
			})
		}

		else if ($('#roomadd').val() == '등록') {
			$.ajax({
				type : 'get',
				url : 'addRoom',
				data : {
					room_name : $('#room_name').val(),
					room_type : $('#room_type').val(),
					min : $('#room_cnt').val(),
					price : $('#price').val()
				},
				success : function(data) {
					roomdata();
					$('#roomnum').val('');
					$('#room_name').val('');
					$('#room_type').val('');
					$('#room_cnt').val('');
					$('#price').val('');
				}
			})

		}
	})
	//삭제 버튼
	.on('click', '#roomdelete', function() {
		$.ajax({
			type : 'get',
			url : 'deleteroom',
			data : {
				room_id : $('#roomnum').val()
			},
			success : function(data) {
				roomdata();
				$('#roomnum').val('');
				$('#room_name').val('');
				$('#room_type').val('');
				$('#room_cnt').val('');
				$('#price').val('');
				$('#roomadd').val('등록');
			}
		})
	})
	//객실관리비우기 버튼
	.on('click', '#clear', function() {
		$('#roomnum').val('');
		$('#room_name').val('');
		$('#room_type').val('');
		$('#room_cnt').val('');
		$('#price').val('');
		$('#roomadd').val('등록');
	})

	.on('click', '#find', function() {
		noreserve();
		reserveroom();
	})
	//예약내역 클릭시
	.on('click', '#reroomlist2 option:selected', function() {
		$.ajax({
			type : 'get',
			url : 'update',
			data : {
				renum : $('#reroomlist2 option:selected').val(),

			},
			dataType : 'json',
			success : function(data) {
				for (let i = 0; i < data.length; i++) {
					let jo = data[i];
					$('#renum').val(jo['renum']), //예약번호
					$('#rerooname').val(jo['roomname']), //객실명
					$('#reroomtype2').val(jo['typename']), //타입명
					$('#recnt2').val(jo['recnt']), //예약자수
					$('#date3').val(jo['checkin']), //체크인
					$('#date4').val(jo['checkout']), //체크아웃
					$('#name').val(jo['name']), //예약자명
					$('#mobile').val(jo['mobile']), //모바일
					$('#sum').val(jo['price']), //가격
					$('#addreserve').val('예약수정') //예약등록버튼 예약수정으로
				}

			}
		})
	})
	//예약 가능 객실 클릭시
	.on('click', '#reroomlist option:selected', function() {
		let ar = $('#reroomlist option:selected').text().split(' ');
		let ar1 = $('#date1').val().split('-');
		let ar2 = $('#date2').val().split('-');

		let da1 = new Date(ar1[0], ar1[1], ar1[2]);
		let da2 = new Date(ar2[0], ar2[1], ar2[2]);
		const diffDate = da1.getTime() - da2.getTime();
		const dateDays = Math.abs(diffDate / (1000 * 3600 * 24));
		$('#rerooname').val(ar[0]);
		$('#reroomtype2').val($('#reroomtype option:selected').text());
		$('#recnt2').val($('#recnt').val());
		$('#date3').val($('#date1').val());
		$('#date4').val($('#date2').val());
		$('#sum').val(ar[1] * dateDays);
		$('#renum').val('');
		$('#name').val('');
		$('#mobile').val('');
		$('#addreserve').val('예약등록')

	})
	//예약 등록 버튼 클릭시
	.on(
			'click',
			'#addreserve',
			function() {
				if ($('#addreserve').val() == '예약등록'
						&& $('#recnt2').val() != '0'
						&& $('#name').val() != ''
						&& $('#mobile').val() != ''
						&& $('#recnt2').val() <= $('#reroomtype option:selected').val()
						&& $('#recnt2').val()<10) {
					$.ajax({
						type : 'get',
						url : 'reserveadd',
						data : {
							reroomnum : $('#reroomlist option:selected').val(),
							recnt : $('#recnt2').val(),
							reprice : $('#sum').val(),
							name : $('#name').val(),
							mobile : $('#mobile').val(),
							checkin : $('#date3').val(),
							checkout : $('#date4').val(),
							roomtype : $('#reroomtype option:selected').val()

						},
						success : function(data) {
							noreserve();
							reserveroom();
							$('#rerooname').val('');
							$('#reroomtype2').val('');
							$('#recnt2').val('');
							$('#date3').val('');
							$('#date4').val('');
							$('#name').val('');
							$('#mobile').val('');
							$('#sum').val('');
						}
					})//예약 수정하기
				} else if ($('#addreserve').val() == '예약수정'
						&& $('#recnt2').val() <= $(
								'#reroomtype option:selected').val()
						&& $('#recnt2').val() != '0' && $('#name').val() != ''
						&& $('#mobile').val() != ''
						&& $('#recnt2').val()<10) {
					$.ajax({
						type : 'get',
						url : 'uptodate',
						data : {
							renum : $('#renum').val(),
							name : $('#name').val(),
							mobile : $('#mobile').val(),
							min : $('#recnt2').val()

						},//
						success : function(data) {
							noreserve();
							reserveroom();
							$('#renum').val('');
							$('#rerooname').val('');
							$('#reroomtype2').val('');
							$('#recnt2').val('');
							$('#date3').val('');
							$('#date4').val('');
							$('#name').val('');
							$('#mobile').val('');
							$('#sum').val('');
							$('#addreserve').val('예약등록')
						}
					})
				} else {
					alert('예약내역을 다시 확인해주세요')
				}
			}).on('click', '#deletereserve', function() {
		$.ajax({
			type : 'get',
			url : 'cancel',
			data : {
				renum : $('#renum').val()

			},
			success : function(data) {
				noreserve();
				reserveroom();
				$('#rerooname').val('');
				$('#reroomtype2').val('');
				$('#recnt2').val('');
				$('#date3').val('');
				$('#date4').val('');
				$('#name').val('');
				$('#mobile').val('');
				$('#sum').val('');
				$('#renum').val('');
				$('#addreserve').val('예약등록');
				alert('예약 취소가 완료되었습니다.');
			}
		})
	})
	//비우기 눌렀을때
	.on('click', '#clearn2', function() {
		$('#renum').val('');
		$('#rerooname').val('');
		$('#reroomtype2').val('');
		$('#recnt2').val('');
		$('#date3').val('');
		$('#date4').val('');
		$('#name').val('');
		$('#mobile').val('');
		$('#sum').val('');
		$('#addreserve').val('예약등록');
	})
	//이미예약된 객실 찾기
	function reserveroom() {
		$.ajax({
			type : 'get',
			url : 'reserve',
			data : {
				roomtype : $('#reroomtype option:selected').val(),
				cnt : $('#recnt').val(),
				checkin : $('#date1').val(),
				checkout : $('#date2').val()

			},
			dataType : 'json',
			success : function(data) {
				$('#reroomlist2').empty();
				for (let i = 0; i < data.length; i++) {
					let jo = data[i];
					let str = '<option value='+jo['renum']+'>' + jo['roomname']
							+ ' ' + jo['checkin'] + '~' + jo['checkout'] + ' '
							+ jo['name'] + '</option>';
					$('#reroomlist2').append(str);
				}
			}
		})
	}
	//예약가능 객실 찾기
	function noreserve() {
		$.ajax({
			type : 'get',
			url : 'noreserve',
			data : {
				room_type : $('#reroomtype option:selected').val(),
				cnt : $('#recnt').val(),
				typename : $('#reroomtype').val(),
				checkin : $('#date1').val(),
				checkout : $('#date2').val()
			},
			dataType : 'json',
			success : function(data) {
				$('#reroomlist').empty();
				for (let i = 0; i < data.length; i++) {
					let jo = data[i];
					let str = '<option value='+jo['roomnum']+'>'
							+ jo['roomname'] + ' ' + jo['price'] + ' '
							+ '숙박가능인원:' + jo['min'] + '명' + '</option>';
					$('#reroomlist').append(str);
				}
			}
		})
	}
	//객실목록 불러오기
	function roomdata() {
		$.ajax({
			type : 'get',
			url : 'SelectRoom',
			dataType : 'json',
			success : function(data) {
				$('#roomlist').empty();
				for (let i = 0; i < data.length; i++) {
					let jo = data[i];
					let str = '<option value='+jo['roomnumber']+'>'
							+ jo['roomname'] + ' ' + jo['roomtype'] + ' '
							+ jo['min'] + ' ' + jo['price'] + '</option>';
					$('#roomlist').append(str);
				}
			}
		})
	}
	//객실타입 불러오기
	function roomtypedata() {
		$.ajax({
			type : 'get',
			url : 'typelist',
			dataType : 'json',
			success : function(data) {
				$('#room_type').empty();
				$('#reroomtype').empty();
				$('#room_type').append('<option value=-1>-</option>');
				for (let i = 0; i < data.length; i++) {
					let jo = data[i];
					let str = '<option value='+jo['type_id']+'>'
							+ jo['type_name'] + '</option>';
					$('#room_type').append(str);
					$('#reroomtype').append(str);
				}
			}
		})

	}
</script>
</html>
