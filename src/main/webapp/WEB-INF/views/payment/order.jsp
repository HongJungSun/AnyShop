<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<!-- 결제 스크립트 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script type="text/javascript"src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>


<script>
	IMP.init('imp23299716'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
</script>

<script>

$(document).ready(function(){
	var finalPrice =0;  //최종 결제 금액
	var firstPrice =0;  //기본 결제 금액
	
	//최종 결제 금액 구하기 위한 함수
	$('.price').each(function(){

		finalPrice += parseInt( $(this).val() );
		$('input[name=finalPrice]').val(finalPrice);

	});  

	// 기본 결제 금액
	$('.price').each(function(){

		firstPrice += parseInt( $(this).val() );
		$('input[name=firstPrice]').val(firstPrice);

	});
	
	
	// 주문자 정보
	$('input:checkbox[name=setDefaultInfo]').on("click",function(){

		if($(this).prop("checked") == true) {
			$('#_name').val($('#_defaultName').val());
			$('#_phone').val($('#_defaultPhone').val());
			
		} else {
			$('#_name').val("");
			$('#_phone').val("");
		}
		
	});
	
	
	// 배송지 주소
	$('input:radio[name=setAddress]').on("click",function() {
			
		if($(this).val() == "myAddress") {
			$('#sample4_postcode').val($('#_address1').val());
			$('#sample4_roadAddress').val($('#_address2').val());
			$('#sample4_jibunAddress').val($('#_address3').val());
			
		} else {
			$('#sample4_postcode').val("");
			$('#sample4_roadAddress').val("");
			$('#sample4_jibunAddress').val("");
		}
		
	});
	
	
	// 마일리지 전부사용 클릭
	$('#_allPoint').on("click",function(){
		if($(this).prop("checked") == true) {
			$('#_point').val($(this).val());
		} else {
			$('#_point').val(0);
		}
		
	});
	
});


//결제	 
function requestPay() {
	
	var point = parseInt( $('#_point').val() );        //사용 포인트
	var allPoint = parseInt( $('#_allPoint').val() );  //가지고 있는 총 포인트
	
	// 배송지 정보, 주문자 정보 null값 확인
	if( $('#_defaultName').val() == "" ) {
		alert('주문자 정보에 이름을 입력해 주세요.');
		return false;
	} else if( $('#_defaultEmail').val() == "") {
		alert('주문자 정보에 이메일을 입력해 주세요.');
		return false;
	} else if( $('#_defaultPhone').val() == "") {
		alert('주문자 정보에 번호을 입력해 주세요.');
		return false;
	} else if( $('#_name').val() == "") {
		alert('배송 정보에 이름을 입력해 주세요.');
		return false;
	}
	else if( $('#sample4_postcode').val() == "" || $('#sample4_roadAddress').val() == "" || $('#sample4_jibunAddress').val() == "") {
		alert('배송 정보에 주소를 입력해 주세요.');
		return false;
	}
	else if( $('#_phone').val() == "") {
		alert('배송 정보에 번호를 입력해 주세요.');
		return false;
	} else if( point > allPoint) {
		alert('사용하려는 포인트가 회원님이 가지고 있는 총 포인트보다 큽니다.');
		return false;
	} else if( point > parseInt( $('input[name=finalPrice]').val() )) {
		alert('상품 가격보다 높은 포인트는 사용하실 수 없습니다.');
		return false;
	}
	
	else {
		
		var paymentListInfo =[];        // 결제 상품 정보 배열
		var i = $('.status').length;    // 결제 상품 총 갯수
		var amount = 1000 - point;      // 결제금액 1000으로 고정		
		var product_name_Arr = [];      // 상품명 담을 배열
			
		
		// 결제 객체에 담기위한 상품명 정보 배열
		$('.product_name').each(function(){
	
			product_name_Arr.push($(this).text());
		});
		
	
	   // IMP.request_pay(param, callback) 호출
		IMP.request_pay({
		    pg : 'inicis',    // version 1.1.0부터 지원.
		    pay_method: 'card',
		    merchant_uid : 'merchant_' + new Date().getTime(),
		    name : JSON.stringify(product_name_Arr),
		    amount : amount,
		    buyer_name : $('#_defaultName').val(),
		    buyer_tel : $('#_defaultPhone').val()
		    
		}, function(rsp) {		
			
		    if ( rsp.success ) {
		        var msg = '결제가 완료되었습니다.';
		        msg += '고유ID : ' + rsp.imp_uid;
		        msg += '상점 거래ID : ' + rsp.merchant_uid;
		        msg += '결제 금액 : ' + rsp.paid_amount;
		        msg += '카드 승인번호 : ' + rsp.apply_num;	
		        
					
				// Object 데이터에 결제상품 정보 값넣기
				for(var k=0; k < i; k++) {
					paymentObject = new Object();
					
					paymentObject.id = $('#_id').val();
					paymentObject.imp_uid = rsp.imp_uid + k;
					paymentObject.apply_num = rsp.apply_num + k;
					paymentObject.product_id= $(".product_id:eq("+ k +")").val();
					paymentObject.product_price = $(".price:eq("+ k +")").val();
					paymentObject.product_name = $(".product_name:eq("+ k +")").text();
					paymentObject.address = $("input[name=address1]").val() + $("input[name=address2]").val() + $("input[name=address3]").val();
					paymentObject.product_quantity = $(".aa-cart-quantity:eq("+ k +")").val();
					paymentObject.product_size= $(".product_size:eq("+ k +")").text();
					paymentObject.product_color= $(".product_color:eq("+ k +")").text();;
					paymentObject.gender = $('#_gender').val();
					paymentObject.name = $('input[name=name]').val();
					paymentObject.age = $('#_age').val();
					paymentObject.height = $('#_height').val();
					paymentObject.weight = $('#_weight').val();
					paymentObject.usePoint = point;
					
					paymentListInfo.push(paymentObject);
	
				}													
		             $.ajax({
		                    type: 'post',
		                    url: "payComplete.do",
		                    dataType: "json",
		                    data: JSON.stringify(paymentListInfo),
	   	            		contentType: "application/json; charset=UTF-8",
	   	            success: function(msg) {
	   	            	if(msg.result ==1 ){
	   	            		alert('결제에 성공하셨습니다.');
	   	            		if(confirm(" 결제하신 내용을 확인하시겠습니까? ") == true) {
	 	            			
	   	            			location.href="checkout.do?id=" + $('#_id').val(); 
	   	            		}	
	   	            		
	   	            	}
	   	            },
		               });			  	             
	
		    } else {
		        var msg = '결제에 실패하였습니다.';
		        msg += '에러내용 : ' + rsp.error_msg;
		    }
		}); 
	}
} 




</script>

<input type="hidden" name="address1" id="_address1" value="${sessionScope.loginInfo.address1 }">
<input type="hidden" name="address2" id="_address2" value="${sessionScope.loginInfo.address2 }">
<input type="hidden" name="address3" id="_address3" value="${sessionScope.loginInfo.address3 }">
<input type="hidden" id="_id" value="${sessionScope.loginInfo.id }">
<input type="hidden" id="_gender" value="${sessionScope.loginInfo.gender }">
<input type="hidden" id="_age" value="${sessionScope.loginInfo.age }">
<input type="hidden" id="_height" value="${sessionScope.loginInfo.height }">
<input type="hidden" id="_weight" value="${sessionScope.loginInfo.weight }">

<section id="cart-view">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="cart-view-area">
					<div class="cart-view-table">
						<form action="">
							<h3>주문 리스트</h3>
							<div class="table-responsive">
								<table class="table">
									<thead>
										<tr>
											<th>번호</th>
											<th>이미지</th>
											<th>상품명</th>
											<th>수량</th>
											<th>가격</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="wishListInfo" items="${list}" varStatus="status">
											<input type="hidden" class="wishlist_idx" name="wishlist_idx" value="${wishListInfo.wishlist_idx}">
											<input type="hidden" class="product_id" name="produt_id" value="${wishListInfo.product_id}">											
											<tr>
												<td class="status">${status.count}</td>
												<td>
													<a href="viewProduct.do?product_id=${wishListInfo.product_id}">
													<img src="resources/product/${wishListInfo.product_img}" alt="img"></a>
												</td>
												<td>
													<a class="aa-cart-title" href="viewProduct.do?product_id=${wishListInfo.product_id}"> 
														<span class="product_name">${wishListInfo.product_name} </span>
													</a> <br> 
													<span> 사이즈: </span>
													 <span style="font-size: 13px;" class="product_size"> ${wishListInfo.product_size} </span>
													<span> , 색상: </span>
													<span style="font-size: 13px;" class="product_color"> ${wishListInfo.product_color} </span>
												</td>
												<td>
													<input class="aa-cart-quantity" type="text" value="${wishListInfo.product_quantity}" readonly style="border: 0; background-color: #F5F5F5; text-align: center;">
												</td>
												<td>
													<fmt:formatNumber type="number" maxFractionDigits="3" value="${wishListInfo.product_price }" /> 원 
													<input type="hidden" class="price" name="price" value="${wishListInfo.product_price}"></td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>



<section id="cart-view">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="cart-view-area">
					<div class="cart-view-table">
						<form action="">
							<h3>주문자 정보</h3>
							<div class="table-responsive">
								<table class="table">
									<tr>
										<td>이름</td>
										<td><input type="text" name="name" id="_defaultName" value="${sessionScope.loginInfo.name}" readonly style="border: 0; background-color: #F5F5F5;"> <br>
										</td>
									</tr>
									<tr>
										<td>이메일</td>
										<td><input type="text" name="email" id="_defaultEmail" value="${sessionScope.loginInfo.email}"> <br></td>
									</tr>
									<tr>
										<td>연락처</td>
										<td><input type="text" name="phone" id="_defaultPhone" value="${sessionScope.loginInfo.phone}"> <br></td>
									</tr>
								</table>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>



<section id="cart-view">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="cart-view-area">
					<div class="cart-view-table">
						<form action="">
							<div>
								<span style="font-size:30px;">배송 정보 
									<span style="font-size:15px;">
										<input type="checkbox" name="setDefaultInfo" style="margin-left: 20px;">위 정보와 같음
									</span>
								</span>
								
							</div>
							<div class="table-responsive">
								<table class="table">
									<tr>
										<td>이름</td>
										<td><input type="text" name="name" id="_name" style="float:left;"> <br></td>
									</tr>
									<tr>
										<td> 배송지 선택  </td>
										<td style="float:left;">
											<input type="radio" name="setAddress" value="myAddress"> 자택 
											<input type="radio" name="setAddress" value="newAddress"> 신규 주소 <br>
										</td>
									</tr>
									<tr>
										<td>주소</td>
										<td><input type="text" name="address1" id="sample4_postcode" placeholder="우편번호" style="float:left;"> 
											<input type="button" onclick="sample4_execDaumPostcode()" value="주소 찾기" style="float:left;"><br> 
											<input type="text" name="address2" class="form-control" id="sample4_roadAddress" placeholder="기본 주소"> 
											<input type="text" name="address3" class="form-control" id="sample4_jibunAddress" placeholder="상세주소"></td>
									</tr>
									<tr>
										<td>연락처</td>
										<td><input type="text" name="phone" id="_phone" style="float:left;"> <br></td>
									</tr>
								</table>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>



<section id="cart-view">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="cart-view-area">
					<div class="cart-view-table">
						<form action="">
							<h3>주문 상품 정보</h3>
							<div class="table-responsive">
								<table class="table">
									<thead>
										<tr>
											<th>상품 금액</th>
											<th>할인 금액</th>
											<th>결제 예정 금액</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>
												<input type="text" name="firstPrice" readonly style="border:0; background-color: #F5F5F5; text-align:center;">원 
											</td>
											<td> 
												<input type="text" name="salePoint" value="0" readonly style="border:0; background-color: #F5F5F5; text-align:center;">원 
											</td>
											<td rowspan="2">
												<input type="text" name="finalPrice" readonly style="border:0; background-color: #F5F5F5; text-align:center;">원 
											</td>										
										</tr>
										<tr>
											<td colspan="2"> 마일리지 사용 
												<input type="text" name="point" id="_point" style="border:0;" value="0">
												<input type="checkbox" name="allPoint" id="_allPoint" value="${sessionScope.loginInfo.point}"> 전액사용(사용 가능한 마일리지: ${sessionScope.loginInfo.point}원)
											</td>
										</tr>
									</tbody>
								</table>								
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
		 <button class="aa-cart-view-btn" type="button" onClick="return requestPay();" style="float:right;">결제하기</button>
	</div>
</section>





<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
	//본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
	function sample4_execDaumPostcode() {
		new daum.Postcode(
				{
					oncomplete : function(data) {
						// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

						// 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
						// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
						var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
						var extraRoadAddr = ''; // 도로명 조합형 주소 변수

						// 법정동명이 있을 경우 추가한다. (법정리는 제외)
						// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
						if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
							extraRoadAddr += data.bname;
						}
						// 건물명이 있고, 공동주택일 경우 추가한다.
						if (data.buildingName !== '' && data.apartment === 'Y') {
							extraRoadAddr += (extraRoadAddr !== '' ? ', '
									+ data.buildingName : data.buildingName);
						}
						// 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
						if (extraRoadAddr !== '') {
							extraRoadAddr = ' (' + extraRoadAddr + ')';
						}
						// 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
						if (fullRoadAddr !== '') {
							fullRoadAddr += extraRoadAddr;
						}

						// 우편번호와 주소 정보를 해당 필드에 넣는다.
						document.getElementById('sample4_postcode').value = data.zonecode; //5자리 새우편번호 사용
						document.getElementById('sample4_roadAddress').value = fullRoadAddr;

						// 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
						if (data.autoRoadAddress) {
							//예상되는 도로명 주소에 조합형 주소를 추가한다.
							var expRoadAddr = data.autoRoadAddress
									+ extraRoadAddr;
							document.getElementById('guide').innerHTML = '(예상 도로명 주소 : '
									+ expRoadAddr + ')';

						} else if (data.autoJibunAddress) {
							var expJibunAddr = data.autoJibunAddress;
							document.getElementById('guide').innerHTML = '(예상 지번 주소 : '
									+ expJibunAddr + ')';

						} else {
							document.getElementById('guide').innerHTML = '';
						}
					}
				}).open();
	}
</script>
