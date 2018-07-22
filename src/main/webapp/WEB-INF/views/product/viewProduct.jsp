<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"  %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    
    <!-- 결제 스크립트 -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>

					
	<script>
		IMP.init('imp23299716'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
	</script>	

    <style>
    	.product_quantity {
    		    border:none; 
    		    text-align:center; 
    		    width:50px; 
    		    height:25px;
    	}
    	
    	.btn_down {
    		border:none; 
    		background-color:white; 
    		width:25px; 
    		height:25px;
    	}
    	
    	.btn_up {
    		border:none; 
    		width:32px;
    		height:28.4px;
    	}
    	
    	.changePrice {
    		border:none; 
    		background-color:#DCDCDC;
    		border:0;
    		text-align:center;
    	}
    	
    	.delete {
    		widhth:25px;
    		height:25px;
    		float:right;
    	}
    	
    	.option_price {
    		float: right;
    		background-color: #DCDCDC;
    		border:0; 
    		text-align:center;  	
    	}

    </style>
      
		<script>   
	
	        	// 클릭시 그 페이지로  스크롤바 자동이동
	            function fnMove(seq){
	                var offset = $("#tabView" + seq).offset();
	                $('html, body').animate({scrollTop : offset.top}, 600);
	            }
	        	
	            function addComma(num) {
	            	  var regexp = /\B(?=(\d{3})+(?!\d))/g;
	            	   return num.toString().replace(regexp, ',');
	            	}
	            
	          //결제 기능
	            function requestPay(i, product_sizeArray, product_colorArray) {	            		            	
	            	
	            	var paymentListInfo = new Array();
					var paymentObject;
	         		var product_quantityArray = [];
	         		var product_priceArray = [];
					
					
					var id = $('#_id').val();
					var product_id = $('#_product_id').val();
					var product_name = $('#_product_name').val();
					var name = $('#_name').val();
					var gender = $('#_gender').val();
					var phone = $('#_phone').val();
					var age = $('#_age').val();
					var height = $('#_height').val();
					var weight = $('#_weight').val();
	            	
	            	var price = $('#_hiddenAllPrice').val();
					
					
					if(id == null) {
						alert('로그인 후 이용해주세요.');
						return false;
					}
					
					if(price == 0) {
						alert('상품 옵션을 선택해 주세요.');
						return false;
					} 		        			
        			   	         	
				    // IMP.request_pay(param, callback) 호출
					IMP.request_pay({
					    pg : 'inicis',    // version 1.1.0부터 지원.
					    pay_method: 'card',
					    merchant_uid : 'merchant_' + new Date().getTime(),
					    name : product_name,
					    amount : 1000,
					    buyer_name : name,
					    buyer_tel : phone
					    
					}, function(rsp) {		
						
					    if ( rsp.success ) {
					        var msg = '결제가 완료되었습니다.';
					        msg += '고유ID : ' + rsp.imp_uid;
					        msg += '상점 거래ID : ' + rsp.merchant_uid;
					        msg += '결제 금액 : ' + rsp.paid_amount;
					        msg += '카드 승인번호 : ' + rsp.apply_num;	
					        
					     
					    //payment 수량 정보 담기
					    for(var k=0; k < i; k++) {
								product_quantityArray.push($(".product_quantity:eq("+k+")").val());
							}
							
					  //payment 가격 정보 담기
							for(var k=0; k < i; k++) {
								product_priceArray.push($(".option_price:eq("+k+")").val().toString());
							}		    														    	    													
							
								
							// Object 데이터에 값넣기
							for(var k=0; k < i; k++) {
								paymentObject = new Object();
								
								paymentObject.id = id;
								paymentObject.imp_uid = rsp.imp_uid;
								paymentObject.apply_num = rsp.apply_num;
								paymentObject.product_id= product_id;
								paymentObject.product_price = product_priceArray[k];
								paymentObject.product_name = product_name;
								paymentObject.product_quantity = product_quantityArray[k];
								paymentObject.product_size= product_sizeArray[k];
								paymentObject.product_color= product_colorArray[k];
								paymentObject.gender = gender;
								paymentObject.name = name;
								paymentObject.age = age;
								paymentObject.height = height;
								paymentObject.weight = weight;   								
								
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
			        	            			location.href="checkout.do?id=" + id; 
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
	            
            
            
	         	$(document).ready(function() {	   	         		
	         		
	         		var size;
	         		var color;
	         		var i= 0;
	         		var checkedOption = new Array();
	         		var product_colorArray = [];
	         		var product_sizeArray = [];
	         		var product_quantityArray = [];
	         		var product_priceArray = [];         		
         			var defaultPrice = ${productInfo.product_price};
         			var hiddenAllPrice;       			
         			var AllPrice;
         			
         			
         			//결제 기능 id, product_id, product_name, name, gender, phone, age, height, weight
         			 $('#_requestPay').click( function() {
         				
         				requestPay(i, product_sizeArray, product_colorArray);
         				   				
         			}); 
         			
         			
	         		 //장바구니 버튼 event
		        	$(document).on("click", "#_addWishList", function() {		        		
		        		
		        		hiddenAllPrice = $('#_hiddenAllPrice').val();  //마지막 AllPrice 에 대한 연산 결과가 object형으로 바꼇기 때문에 다시parseInt 해준다.	 
		        		
		        		var id = $('#_id').val();
	         			var product_id = ${productInfo.product_id};        			
	         			var product_name = $('#_product_name').val();
	         			var product_img = $('#_product_img').val();
	         			var wishListInfo = new Array();	
						var optionData;
						
		        		if( id == "" ) {
		        			alert('로그인 후 이용해주세요.');
		        			return false;
		        		}
		        		
	         										         					        				        				        				        		
		        		if(hiddenAllPrice == 0) {
		        			alert('상품 옵션을 선택해주세요.');
		        			return false;
		        		} else {		        					        		
		        			
							for(var k=0; k < i; k++) {
								product_quantityArray.push($(".product_quantity:eq("+k+")").val());
							}
							
							for(var k=0; k < i; k++) {
								product_priceArray.push($(".option_price:eq("+k+")").val().toString());
							}		    														    	    
																				
								
							// Object 데이터에 값넣기
							for(var k=0; k < i; k++) {
								optionData = new Object();
								
								optionData.id= id;
								optionData.product_id= product_id.toString();
								optionData.product_name= product_name;
								optionData.product_img= product_img;
								optionData.product_priceArray= product_priceArray[k];
								optionData.product_sizeArray= product_sizeArray[k];
								optionData.product_colorArray= product_colorArray[k];
								optionData.product_quantityArray= product_quantityArray[k];	
								
								wishListInfo.push(optionData);
				
							}														
																																			
							// 장바구니 담기 ( * 자바스크립트 배열 선언은 객체로 인식하기 때문에 서버로 넘겨줄때 toString()을 해줌으로써 문자열을 인식하게 해줄 수 있다 !!)
		        			$.ajax ({
		        	            type: 'POST',
		        	            url: "addWishList.do",
		        	            data: JSON.stringify(wishListInfo),
		        	            dataType: "json",
		        	            contentType: "application/json; charset=UTF-8",
		        	            success: function(msg) {
		        	            	if(msg.result ==1 ){
		        	            		alert('장바구니 담기에 성공하셨습니다.');
		        	            		if(confirm("장바구니로 이동하시겠습니까?") == true) {
		        	            			location.href="viewWishList.do"; 
		        	            		}	
		        	            	}
		        	            },
		        	            error : function(request,status,error) {
		        	            	alert('장바구니 추가 실패');
		        	                alert(request.status);
		        	                alert(error);
		        	            }
		        	         });
		        		}
		        	}); 
	         		
	         		
	         		// 동적으로 추가된 태그들은 이벤트가 안먹기 때문에 이런식으로 함수사용
	         		$(document).on("click", ".btnUp", function() {
	         			     			
	         			var n = $('.btnUp').index(this);
	         			var num = $(".product_quantity:eq("+n+")").val();
	         			var price;
	         			
	         			price = $(".option_price:eq("+n+")").val( addComma((defaultPrice*1) * (num*1+1)) );	         					         			
	         			num = $(".product_quantity:eq("+n+")").val(num*1+1);	         						         			
	         				         					         				
	         				$('#_hiddenAllPrice').val( hiddenAllPrice + defaultPrice );	
	         				hiddenAllPrice=	hiddenAllPrice + defaultPrice;

	         				$('#_AllPrice').val( addComma(hiddenAllPrice) );		         			

	         			

	         		});
	         		
	         		
	         		// 동적으로 추가된 태그들은 이벤트가 안먹기 때문에 이런식으로 함수사용
	         		$(document).on("click",".btnDown",function(){

	         			var n = $('.btnDown').index(this);
	         			var num = $(".product_quantity:eq("+n+")").val();
	         			var price;

	         				if(num <= 1) {
	         					alert('1보다 작은 수량을 선택 하실수 없습니다.');
	         					return false;
	         				} 
	         			
	         			price = $(".option_price:eq("+n+")").val( addComma((defaultPrice*1) * (num*1-1)) );  //  수량이 변경된 가격값         			
	         			num = $(".product_quantity:eq("+n+")").val(num*1-1);    // 변경된 상품 수량
	         			
	         			
         				$('#_hiddenAllPrice').val( hiddenAllPrice - defaultPrice );	
         				hiddenAllPrice=	hiddenAllPrice - defaultPrice;

         				$('#_AllPrice').val( addComma(hiddenAllPrice) );	
	         		}); 
	         		
	         		
	         		// 동적으로 추가된 태그들은 이벤트가 안먹기 때문에 이런식으로 함수사용
	         		$(document).on("click",".delete",function(){

	         			var n = $('.delete').index(this);
	         			
	         			$(".selectedOption:eq("+n+")").remove();
	         			$(".Quantity:eq("+n+")").remove();	
	         		});
	         		

	         		
	         		// 사이즈 박스 선택 변경시
	         		$('#_sizeBox').change(function(){
	         			
	         			size = $(this).val();
	         			
	         			if(checkedOption.length != 0) {
		         			if(color == null || color == "none" || size == "none") {
		         				alert('색상을 선택해주세요.');
		         				return false;
		         			}
	         			}
	         			
	         			size = this.value;	         			
	         				         			
		         		// 선택된 사이즈 컬러 load 하기
		         		if( size != null && color != null) {
		         			
		         			checkedOption[i] = size+ ", " + color;
		         			
		         			// 중복 옵션 검사
	 	         			for(var j=0; j < checkedOption.length-1; j++) {		         				
		         				if(checkedOption[i] ==  checkedOption[j]) {
		         					alert('이미선택된 상품 옵션 입니다.');
			 	         			checkedOption[i].remove();
		         					return false;
		         				}
		         			} 
	 	         			product_sizeArray.push(size).toString();
	 	         			product_colorArray.push(color).toString();		         			
			         		
	 	         			var tag = "<span class=selectedOption> </span>"
	         					+ "<span class='Quantity' style=margin-left:40px;>"
	         					+ "<button class='btnDown' style='position:absolute; margin-left:37px;'> ㅡ </button>"
	         					+ "<input type=text id=_product_quantity class='product_quantity' style='position:absolute; margin-left:70px;' readonly value=1>"
	         					+ "<button class='btnUp' style='position:absolute; margin-left:121px;'> + </button>"
	         					+ "<img class=delete src=resources/product/x.png>"
	         					+ "<span style='float:right;'>원</span>"
	         					+ "<input type=text id='_defaultPrice' class='option_price' style='text-align:right;' readonly value="+ ${productInfo.product_price} + ">"	         					
	         					+ "<hr>"
	         					+ "</span>";	         					
	         			
	         					
	         				$("#_showOption").append(tag);		// selectOption 태그 추가	         				         			
		         			$(".selectedOption:eq("+i+")").text(checkedOption[i]); //selectOption i번째에 선택된 사이즈,컬러 추가
	         				$(".option_price:eq("+i+")").val(addComma(defaultPrice));
		         			i++;	
		         			
		         			hiddenAllPrice = parseInt($('#_hiddenAllPrice').val());  
		         			hiddenAllPrice = hiddenAllPrice + defaultPrice;
		         			$('#_hiddenAllPrice').val(hiddenAllPrice);

		         			AllPrice = $('#_AllPrice').val(addComma(hiddenAllPrice)); 

		         		}
	         		});
 					   		
	         		
	         		// 컬러박스 선택 변경시
	         		$('#_colorBox').change(function(){
	         			
	         			color = $(this).val();
	         				         			
	         			if(checkedOption.length != 0) {
		         			if(size == null || size == "none" || color == "none") {
		         				alert('사이즈를 선택해주세요.');
		         				return false;
		         			}
	         			}
	         			
	         			color= this.value;	         			
	         				         			
		         		// 선택된 사이즈 컬러 load 하기
		         		if( size != null && color != null) {
		         			
		         			checkedOption[i] = size+ ", " + color;	
		         			
		         			// 중복 옵션 검사
	 	         			for(var j=0; j < checkedOption.length-1; j++) {		         				
		         				if(checkedOption[i] ==  checkedOption[j]) {
		         					alert('이미선택된 상품 옵션 입니다.');
		         					return false;
		         				}
		         			}   			         	
	 	         			product_sizeArray.push(size).toString();
	 	         			product_colorArray.push(color).toString();
		         			
		         			var tag = "<span class=selectedOption> </span>"
	         					+ "<span class='Quantity' style=margin-left:40px;>"
	         					+ "<button class='btnDown' style='position:absolute; margin-left:37px;'> ㅡ </button>"
	         					+ "<input type=text id=_product_quantity class='product_quantity' style='position:absolute; margin-left:70px;' readonly value=1>"
	         					+ "<button class='btnUp' style='position:absolute; margin-left:121px;'> + </button>"
	         					+ "<img class=delete src=resources/product/x.png>"
	         					+ "<span style='float:right;'>원</span>"
	         					+ "<input type=text id='_defaultPrice' class='option_price' style='text-align:right;' readonly value="+ ${productInfo.product_price} + ">"	         					
	         					+ "<hr>"
	         					+ "</span>";
	         					

	         			
	         				$("#_showOption").append(tag);		// selectOption 태그 추가	         				         			
		         			$(".selectedOption:eq("+i+")").text(checkedOption[i]); //selectOption i번째에 선택된 사이즈,컬러 추가
	         				$(".option_price:eq("+i+")").val(addComma(defaultPrice));
		         			i++;	
		         			
		         			hiddenAllPrice = parseInt($('#_hiddenAllPrice').val());  
		         			hiddenAllPrice = hiddenAllPrice + defaultPrice;
		         			$('#_hiddenAllPrice').val(hiddenAllPrice);

		         			AllPrice = $('#_AllPrice').val(addComma(hiddenAllPrice)); 

		         		}
	         		});         		
	         			         		      	
	         	});
	       	</script>  	
            
    
	                   			
	                   			
  <!-- product category -->
  <div id="aa-product-details"> 
        <div class="col-md-12">
          <div class="aa-product-details-area">
              <div class="row">
                <!-- Modal view slider -->
                <div class="col-md-7 col-sm-7 col-xs-12">                              
                  <div class="aa-product-view-slider">                                
                    <div id="demo-1" class="simpleLens-gallery-container" style="margin-left:90px;">
                       <img src="resources/product/${productInfo.product_img }" class="simpleLens-big-image" style="width:600px; height:400px;">
                       <input type="hidden" name="product_img" id="_product_img" value="${productInfo.product_img }">
                    </div>
                  </div>
                </div>          
                
                <!-- Modal view content -->
                <div class="col-md-4 col-sm-4 col-xs-12" style="margin-right:80px;">
                  <div class="aa-product-view-content">
                    <h1>${productInfo.product_name }</h1>
                    <div class="aa-price-block">
                      <span class="aa-product-view-price">
                      	 <fmt:formatNumber type= "number" maxFractionDigits= "3" value= "${productInfo.product_price}" /> 원
                      </span>
                    </div>
                                      <hr>             
                                      <div>
                                      	  <h6> 적립포인트:  1%  </h6>  
                                      </div>
                                      <hr>

                    	<div class="aa-prod-view-size">    
							<select name="sizeBox" id="_sizeBox" class="product_size" style="text-align:center; width:400px; height:30px;">
							    	<option value="none">size 선택</option>
							    <c:forEach items="${productInfo.product_size}" var="product_size">
							    	<option value="${product_size}">${product_size} </option>
							    </c:forEach>	    
							</select>                   
	                    </div>	                    
	                    		       <hr>

	                    <div class="bb-color-tag">
	                    	<select name="colorBox" id="_colorBox" class="product_color" style="text-align:center; width:400px; height:30px;">
							    <option value="none">color 선택</option>
							    <c:forEach items="${productInfo.product_color}" var="product_color">
							    	<option value="${product_color}">${product_color} </option>
							    </c:forEach>
							</select> 
							<hr>                  
                   		 </div> 
                   		 
                   		                    		 
     		 <!-- 상품 옵션(사이즈,컬러) 선택 view -->
            	<div id="_showOption" style="background-color:#DCDCDC;">
            	 

				</div>
			<!-- /상품 옵션(사이즈,컬러) 선택 view -->
			
       			<!-- 총상품 금액 -->
                   <div style="background-color:#DCDCDC;">총 상품 금액 		
                      <span style="float:right;">원</span>
                       <input type="text" class="AllPrice" id="_AllPrice" style="float:right; background-color:#DCDCDC; border:0;" value="0">
                       <input type="hidden" class="_hiddenAllPrice" id="_hiddenAllPrice" style="float:right; background-color:#DCDCDC; border:0;" value="0">                      
                   </div>              										                      			
                <!-- /총상품 금액 -->				
                                  
                </div>
              </div>             
               			<hr>
           </div>
        </div>
      </div>
    </div>
           <!-- 장바구니 담기, 결제 -->
              <div class="col-md-4 col-sm-4 col-xs-12" style="float:right; margin-right:120px;">
					<input type="hidden" id="_product_id" value="${productInfo.product_id}">
					<input type="hidden" id="_product_name" value="${productInfo.product_name }">
					<input type="hidden" id="_name" value="${sessionScope.loginInfo.name }">
					<input type="hidden" id="_gender" value="${sessionScope.loginInfo.gender }">
					<input type="hidden" id="_phone" value="${sessionScope.loginInfo.phone }">
					<input type="hidden" id="_age" value="${sessionScope.loginInfo.age }">
					<input type="hidden" id="_height" value=" ${sessionScope.loginInfo.height }">
					<input type="hidden" id="_weight" value="${sessionScope.loginInfo.weight } ">
						             																				
					<input class="aa-cart-view-btn" type="button" id="_requestPay" value="구매하기" style="float:right;">					
					<button class="aa-cart-view-btn" id="_addWishList" style="float:right; margin-right:10px;">
						<span class="fa fa-shopping-basket"> 장바구니 </span>
					</button>

				 

									 			 			                                           
       </div> 
        <!-- /장바구니 담기, 결제 -->    
            
            
            <!-- 상품 부가정보 + 사이정보 + 상품문의 + 리뷰 -->         
           <div class="col-md-12" style="position:relative; text-align:center;">
              <ul class="btn btn-default" style="padding:0px;">
                <li class="btn btn-default" style="background-color:white; width:300px; height:50px; font-size:20px;"><a href="#tabView1" onClick="return fnMove(1);" style="color:black">상품상세정보</a></li>              
                <li class="btn btn-default" style="background-color:black; width:300px; height:50px; font-size:20px;"><a href="#tabView2" onClick="return fnMove(2);" style="color:white">사이즈 정보</a></li>
                <li class="btn btn-default" style="background-color:black; width:300px; height:50px; font-size:20px;"><a href="#tabView3" onClick="return fnMove(3);" style="color:white">상품문의</a></li>
                <li class="btn btn-default" style="background-color:black; width:300px; height:50px; font-size:20px;"><a href="#tabView4" onClick="return fnMove(4);" style="color:white">Review</a></li>             
              </ul>
                                                       
              <!-- 상품 상세정보 -->
                <div class="tab-pane fade active in" id="tabView1">    
                	${productInfo.product_info} <br>
                              
                  	<c:if test="${productInfo.moreProductInfo1 ne ''}">
                  		<img src="resources/product/${productInfo.moreProductInfo1}"><br>
                  	</c:if>
                  	<c:if test="${productInfo.moreProductInfo2 ne ''}">
                  		<img src="resources/product/${productInfo.moreProductInfo2}"><br>
                  	</c:if>
                  	<c:if test="${productInfo.moreProductInfo3 ne ''}">
                  		<img src="resources/product/${productInfo.moreProductInfo3}"><br>
                  	</c:if>
                  	<c:if test="${productInfo.moreProductInfo4 ne ''}">
                  		<img src="resources/product/${productInfo.moreProductInfo4}"><br>
                  	</c:if>
                  	<c:if test="${productInfo.moreProductInfo5 ne ''}">
                  		<img src="resources/product/${productInfo.moreProductInfo5}"><br>
                  	</c:if>
                  	<c:if test="${productInfo.moreProductInfo6 ne ''}">
                  		<img src="resources/product/${productInfo.moreProductInfo6}"><br>
                  	</c:if>
                  	<c:if test="${productInfo.moreProductInfo7 ne ''}">
                  		<img src="resources/product/${productInfo.moreProductInfo7}"><br>
                  	</c:if>
                  	<c:if test="${productInfo.moreProductInfo8 ne ''}">
                  		<img src="resources/product/${productInfo.moreProductInfo8}"><br>
                  	</c:if>
                  	<c:if test="${productInfo.moreProductInfo9 ne ''}">
                  		<img src="resources/product/${productInfo.moreProductInfo9}"><br>
                  	</c:if>
                  	<c:if test="${productInfo.moreProductInfo10 ne ''}">
                  		<img src="resources/product/${productInfo.moreProductInfo10}"><br>
                  	</c:if>

                </div>
                <hr>
              </div>  
          
           <!-- / 상품 부가정보 + 사이정보 + 상품문의 + 리뷰 -->           
            <div class="col-md-12" style="position:relative; text-align:center;">
              <ul class="btn btn-default" style="padding:0px;">
                <li class="btn btn-default" style="background-color:black; width:300px; height:50px; font-size:20px;"><a href="#tabView1" onClick="return fnMove(1);" style="color:white;">상품상세정보</a></li>              
                <li class="btn btn-default" style="background-color:white; width:300px; height:50px; font-size:20px;"><a href="#tabView2" onClick="return fnMove(2);" style="color:black;">사이즈 정보</a></li>
                <li class="btn btn-default" style="background-color:black; width:300px; height:50px; font-size:20px;"><a href="#tabView3" onClick="return fnMove(3);" style="color:white;">상품문의</a></li>
                <li class="btn btn-default" style="background-color:black; width:300px; height:50px; font-size:20px;"><a href="#tabView4" onClick="return fnMove(4);" style="color:white;">Review</a></li>             
              </ul>
                
              <!-- 사이즈 정보 -->
                <div class="tab-pane fade active in" id="tabView2">
                  <h2> 사이즈 정보</h2>                
                  	<c:if test="${productInfo.sizeInfo1 ne '' }">
	                  <img src="resources/product/${productInfo.sizeInfo1}">
                	</c:if>
                	<br>
                	<c:if test="${productInfo.sizeInfo2 ne '' }">
	                  <img src="resources/product/${productInfo.sizeInfo2}">
                	</c:if>
                	<br>
                	<c:if test="${productInfo.sizeInfo3 ne '' }">
	                  <img src="resources/product/${productInfo.sizeInfo3}">
                	</c:if> 
                	<br>     	
                </div>
                <hr>
               </div> 
               <!-- / 상품 부가정보 + 사이정보 + 상품문의 + 리뷰 -->
             
               
            <div class="col-md-12" style="position:relative; text-align:center;">
              <ul class="btn btn-default" style="padding:0px;">
                <li class="btn btn-default" style="background-color:black; width:300px; height:50px; font-size:20px;"><a href="#tabView1" onClick="return fnMove(1);" style="color:white;">상품상세정보</a></li>              
                <li class="btn btn-default" style="background-color:black; width:300px; height:50px; font-size:20px;"><a href="#tabView2" onClick="return fnMove(2);" style="color:white;">사이즈 정보</a></li>
                <li class="btn btn-default" style="background-color:white; width:300px; height:50px; font-size:20px;"><a href="#tabView3" onClick="return fnMove(3);" style="color:black;">상품문의</a></li>
                <li class="btn btn-default" style="background-color:black; width:300px; height:50px; font-size:20px;"><a href="#tabView4" onClick="return fnMove(4);" style="color:white;">Review</a></li>             
              </ul>
             	 <!-- 상품 문의 -->
	                <div class="tab-pane fade active in" id="tabView3" style="position:relative; text-align:center;">
	                  	<h2>상품 문의</h2>
	                  	<h3> 제품에 대한 궁금한 부분을 적어주세요.</h3>
	                  	<!-- 삼품문의 게시판 검색 -->
	                  		<form action="searchBoard.do" method="post" style="margin-left:580px;">
	                  			<input type="hidden" name="product_id" value="${productInfo.product_id}">
							<!-- <span class="" style="font-size:20px;"> <font color="#ff6666"> 문의글 찾기 </font> </span> -->
	                  			<select name="keyword">
	                  				<option value="title">제목</option>
	                  				<option value="contents">내용</option>
	                  				<option value="regi_id">작성자</option>	                  			
	                  			</select>
	                  			
	                  			<input type="text" name="searchBoard">
	                  			<input type="submit" value="검색" class="btn btn-info">
	                  			<span style="font-size:20px;"> <a href="viewProduct.do?product_id=${productInfo.product_id }" class="btn"> 전체 보기 </a>  </span>
	                  		</form>
	                  	<!-- /삼품문의 게시판 검색 -->	
	                  	
	                  	<!-- 상품 문의 게시판 -->
	                  	<div>                  	
							 <table style="border:1px solid #ccc; margin-left: auto; margin-right: auto; width: 1000px;">
							    <colgroup>
							        <col width="10%"/>
							        <col width="*"/>
							        <col width="15%"/>
							        <col width="15%"/>
							        <col width="20%"/>
							    </colgroup>
							    <thead>
							        <tr>
							            <th scope="col" style="text-align:center;">글번호</th>
							            <th scope="col" style="text-align:center;">제목</th>
							            <th scope="col" style="text-align:center;">작성자</th>
							            <th scope="col" style="text-align:center;">조회수</th>
							            <th scope="col" style="text-align:center;">작성일</th>
							        </tr>
							    </thead>
							    <tbody>
							        <c:choose>
							            <c:when test="${fn:length(list) > 0 }">
							                <c:forEach items="${list}" var="row" varStatus="status">
							                    <tr>
							                        <td>${paging.totalRow-((paging.page-1)*paging.rowCount + status.count)}</td>
							                        <td style="max-width: 100px; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;">
							                        	<a href="readBoard.do?idx=${row.idx}">${row.title }</a>
							                        </td>
							                        <td>${row.regi_id }</td>
							                        <td>${row.hit_cnt }</td>
							                        <td>${row.regi_date }</td>
							                    </tr>
							                </c:forEach>
							            </c:when>
							            <c:otherwise>
							                <tr>
							                    <td colspan="4">조회된 결과가 없습니다.</td>
							                </tr>
							            </c:otherwise>
							        </c:choose>							        							        
							    </tbody>
							</table> 							
						</div>
					<!-- /상품 문의 게시판 -->
				
		<!-- 페이징 -->		
			<nav>
                <ul class="pagination" id="res">
                  <li>
                    <a href="viewProduct.do?page=${page-5}&product_id=${productInfo.product_id}" aria-label="Previous">
                      <span aria-hidden="true"> « </span>
                    </a>
                  </li>
						<c:if test="${paging.totalPage>1}">
							<c:forEach var="i" begin="${paging.pageStart}" end="${paging.pageEnd}" step="1">   
								<c:url var="pageLink" value="viewProduct.do">
							    	<c:param name="page" value="${i}" />
							    	<c:param name="keyword" value="${paging.keyword}"/>
							    	<c:param name="searchBoard" value="${paging.searchBoard}"/>
							    	<c:param name="product_id" value="${productInfo.product_id}" />
							    </c:url>
							    	<c:if test="${paging.page eq i }">                        
							         	<li><a href="${pageLink}" style="background-color:#DCDCDC;">${i}</a></li>
							         </c:if> 
							         <c:if test="${paging.page ne i }">                        
							         	<li class="page"><a href="${pageLink}">${i}</a></li>
							         </c:if>         
								    <%-- <li><a href="viewProduct.do?product_id=${productInfo.product_id }">${i}</a></li> --%>
							</c:forEach>
						</c:if>                   
                  <li>
                    <a href="viewProduct.do?page=${page+5}&product_id=${productInfo.product_id}" aria-label="Next">
                      <span aria-hidden="true"> » </span>
                    </a>
                  </li>
                </ul>
              </nav>
	<!-- /페이징 -->			
	       </div>
	    <div style="float:right; margin-right:325px;">
	    	<a href="questionBoardWrite.do?product_id=${productInfo.product_id}" class="btn btn-info btn-lg" id="_boardWrite">
	   			 글쓰기
	    	</a>	
	   </div>	              
   </div>                 
<!-- / 상품 부가정보 + 사이정보 + 상품문의 + 리뷰 -->
            
            
               
            <div class="col-md-12" style="position:relative; text-align:center;">
              <ul class="btn btn-default" style="padding:0px;">
                <li class="btn btn-default" style="background-color:black; width:300px; height:50px; font-size:20px;"><a href="#tabView1" onClick="return fnMove(1);" style="color:white;">상품상세정보</a></li>              
                <li class="btn btn-default" style="background-color:black; width:300px; height:50px; font-size:20px;"><a href="#tabView2" onClick="return fnMove(2);" style="color:white;">사이즈 정보</a></li>
                <li class="btn btn-default" style="background-color:black; width:300px; height:50px; font-size:20px;"><a href="#tabView3" onClick="return fnMove(3);" style="color:white;">상품문의</a></li>
                <li class="btn btn-default" style="background-color:white; width:300px; height:50px; font-size:20px;"><a href="#tabView4" onClick="return fnMove(4);" style="color:black;">Review</a></li>             
              </ul>
                       
               <!-- 모든 회원들 리뷰 -->
               <div class="tab-pane fade active in" id="tabView4">
                 <div class="aa-product-review-area">
                   <h4>Review 를 달아주세요.</h4>
                      <!-- review form -->
		                   <form action="regiReview.do" class="aa-review-form" method="post">
		                   	<input type="hidden" name="product_id" value="${productInfo.product_id }">
		                   	<input type="hidden" name="product_id" value="${productInfo.product_name }">
		                   	<input type="hidden" name="product_id" value="${productInfo.product_img }">
		                   	<input type="hidden" name="id" id="_id" value="${sessionScope.loginInfo.id}" >
		                   	<input type="hidden" name="age" value="${sessionScope.age}">
		                      <div>
		                        <label for="message" style="float:left;">나의 Review</label>
		                        <textarea class="form-control" name="review_contents" rows="5" cols="80" id="_review_contents"></textarea>
								<img src="resources/product/star.jpg" style="width:30px; height:30px; float:left;">
		                        <label for="star" style="float:left;">나의 점수 </label> &nbsp;&nbsp;
		                        <input type="number" name="review_point" id="_review_point" style="float:left;">
		                        <span style="float:left; font-color:red;"> 점 </span>                   
		                      </div>  
		
		                      <button type="submit" class="btn btn-default aa-review-submit" style="float:right;" onClick="return checkReview();">등록</button>
		                   </form>
		                   <br>
		             
		             <script>
	         			// 리뷰폼 확인
	    	        	function checkReview() {
	    					
	    	        		review_point = $('#_review_point').val();
	    	        		review_contents = $('#_review_contents').val();
	    	        		
	    	        		if(review_point == null) {
	    	        			alert('리뷰 점수를 입력해주세요.');
	    	        			return false;
	    	        		} else if (review_contents == null) {
	    	        			alert('리뷰 내용을 적어주세요.');
	    	        			return false;
	    	        		} else if(review_point < 0 ) {
	    	        			alert('0밑으로의 점수는 줄 수 없습니다.');
	    	        			$(this).val(0);
	    	        			return false;
	    	        		} else if( review_point > 100) {
	    	        			alert('점수 입력은 0~100점 사이로 입력해주시기 바랍니다.');
	    	        			return false;
	    	        		} else {	    	        		
		    	        		alert('성공적으로 리뷰를 등록하셨습니다.');
		    	        		return true;
	    	        		}
	    	        	}
	    	        	
		             </script>                     
              		<!-- /review form -->
              		
              		<hr>
              		<!-- view 리뷰 연령별 점수 -->
              		<div style="float:left;"> <h3 style="font-color:red;"> 연령별 상품 만족도 </h3> </div>
              		<br>              		
              		<table class="table table-striped projects" style="width:800px;">
              			<tr>
              				<td style="float:left; width:30%;">
              					<img src="resources/product/${productInfo.product_img }" style="width:200px; height:280px;">
              				</td>
              				<td class="project_progress" style="position:relative; text-align:left; width:50%;"> 				
                            	10대                           	
                            	<div class="progress progress_sm">
                              		<div class="progress-bar bg-green" role="progressbar" style="width: ${reviewPoint.review_point10 }%;">
                              			${reviewPoint.review_point10 }점
                              		</div>
                              	</div>
                              	20대
                              	<div class="progress progress_sm"> 
                              		<div class="progress-bar bg-green" role="progressbar" style="width: ${reviewPoint.review_point20 }%;">
                              			${reviewPoint.review_point20 }점
                              		</div>
                              	</div>
                              	30대
                              	<div class="progress progress_sm"> 
                              		<div class="progress-bar bg-green" role="progressbar" style="width: ${reviewPoint.review_point30 }%;">
                              			${reviewPoint.review_point30 }점
                              		</div>
                              	</div>
                              	40대
                              	<div class="progress progress_sm"> 
                              		<div class="progress-bar bg-green" role="progressbar" style="width: ${reviewPoint.review_point40 }%;">
                              			${reviewPoint.review_point40 }점
                              		</div>
                              	</div>
                              	50대
                              	<div class="progress progress_sm">
                              		<div class="progress-bar bg-green" role="progressbar" style="width:${reviewPoint.review_point50 }%;">
                              			${reviewPoint.review_point50 }점
                              		</div>
                              	</div>	
                           </td>
                           <td style="width:20%; margin:auto;">
                           		                          		
                           </td> 
              			</tr>
              		
              		</table>
                  <!-- /view 리뷰 연령별 점수 -->
                   <hr>
                 </div>
               </div>
            </div>  
           <!-- / 상품 부가정보 + 사이정보 + 상품문의 + 리뷰 -->   
           
           
             