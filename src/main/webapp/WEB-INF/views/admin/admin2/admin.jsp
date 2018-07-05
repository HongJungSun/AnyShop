<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"  %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

  	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
	
<script>
	$(document).ready(function() {
	
	    $( "#date" ).datepicker({
	    	dateFormat: 'yy'
	    });
	    
	    var date = new Date().getFullYear();	    
	    $.ajax({
	    	type: "post",
			url: "showSales.do",
			data: {date : date },
			
			success: function(msg) {
				if(msg.result == '1') {
	    	
				    var ctx = document.getElementById("myChart").getContext('2d');
					var myChart = new Chart(ctx, {
					    type: 'bar',
					    data: {
					        labels: [ "1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월" ],
					        datasets: [{
					            label: '이번 년도 매출 통계',
					            data: [
					            	msg.january, 
					            	msg.february, 
					            	msg.march, 
					            	msg.april, 
					            	msg.may,
					            	msg.june, 
					            	msg.july, 
					            	msg.august, 
					            	msg.september, 
					            	msg.october, 
					            	msg.nomember, 
					            	msg.december
						            ],
					            backgroundColor: [
					            	'rgba(255,99,132,0.4)',
					            	'rgba(255,99,132,0.4)',
					            	'rgba(255,99,132,0.4)',
					            	'rgba(255,99,132,0.4)',
					            	'rgba(255,99,132,0.4)',
					            	'rgba(255,99,132,0.4)',
					            	'rgba(255,99,132,0.4)',
					            	'rgba(255,99,132,0.4)',
					            	'rgba(255,99,132,0.4)',
					            	'rgba(255,99,132,0.4)',
					            	'rgba(255,99,132,0.4)',
					            	'rgba(255,99,132,0.4)'
					            ],
					            borderColor: [
					            	'rgba(255,99,132,0.4)',
					            	'rgba(255,99,132,0.4)',
					            	'rgba(255,99,132,0.4)',
					            	'rgba(255,99,132,0.4)',
					            	'rgba(255,99,132,0.4)',
					            	'rgba(255,99,132,0.4)',
					            	'rgba(255,99,132,0.4)',
					            	'rgba(255,99,132,0.4)',
					            	'rgba(255,99,132,0.4)',
					            	'rgba(255,99,132,0.4)',
					            	'rgba(255,99,132,0.4)',
					            	'rgba(255,99,132,0.4)'
					            ],
					            borderWidth: 1
					        }]
					    },
					    options: {
					        scales: {
					            yAxes: [{
					                ticks: {
					                    beginAtZero:true
					                }
					            }]
					        }
					    }
					});
				}
			}
	    });	
	    
	});

</script>  


<!-- top -->
          <div class="row tile_count">
            <div class="col-md-2 col-sm-4 col-xs-6 tile_stats_count">
              <span class="count_top"><i class="fa fa-user"></i> 총 회원 수</span>
               <c:if test="${memberCount eq null }">
               	<div class="count">0</div>
               </c:if>
              <c:if test="${memberCount ne null }">
              	<div class="count">${memberCount }</div>
              </c:if>
            </div>
            <div class="col-md-2 col-sm-4 col-xs-6 tile_stats_count">
              <span class="count_top"> 총 상품</span>
               <c:if test="${totalProduct eq null }">
               <div class="count"> 0 </div>
               </c:if>
              <c:if test="${totalProduct ne null }">
              	<div class="count"> ${totalProduct }</div>
              </c:if>
            </div>
            <div class="col-md-2 col-sm-4 col-xs-6 tile_stats_count">
              <span class="count_top"><i class="fa fa-user"></i> 미 배송 상품</span>
               <c:if test="${delivery_state_N eq null }">
               	 <div class="count">0</div>              	
               </c:if>
              <c:if test="${delivery_state_N ne null }">
              	<div class="count">${delivery_state_N }</div>
              </c:if>

            </div>
            <div class="col-md-2 col-sm-4 col-xs-6 tile_stats_count">
              <span class="count_top"><i class="fa fa-user"></i> 총 배송 상품 </span>
               <c:if test="${delivery_state_Y eq null }">
               	<div class="count">0</div>
               </c:if>
              <c:if test="${delivery_state_Y ne null }">
              	<div class="count">${delivery_state_Y }</div>
              </c:if>

            </div>
            <div class="col-md-2 col-sm-4 col-xs-6 tile_stats_count">
              <span class="count_top"><i class="fa fa-user"></i> 배송 취소 상품 </span>
               <c:if test="${delivery_state_C eq null }">
               	<div class="count">0</div>
               </c:if>
              <c:if test="${delivery_state_C ne null }">
              	<div class="count">${delivery_state_C }</div>
              </c:if>

            </div>
            <div class="col-md-2 col-sm-4 col-xs-6 tile_stats_count">
              <span class="count_top"><i class="fa fa-user"></i> 오늘 총 매출 </span>              
              <c:if test="${totalPayment eq null }">
              		<div class="count"> 0 원 </div>
              </c:if>
              <c:if test="${totalPayment ne null }">
	              <div class="count">
	              	<fmt:formatNumber type= "number" maxFractionDigits= "3" value= "${totalPayment}" /> 원
	               </div>
               </c:if>
            </div>
            
          </div>
     <!-- /top --> 


	<div class="row">
            <div class="col-md-12 col-sm-12 col-xs-12">
              <div class="dashboard_graph">
                <div class="row x_title">
                  <div class="col-md-6">
                    <h3>매출 통계 </h3>
                  </div>
                  <div class="col-md-6">
                      	해당 년도 검색 : <input type="text" id="date">
                      	
                      	<button type="button" id="showSales" class="btn btn-success" onClick="return showSales();"> 검색 </button>
                      	<script>
                      	
                        function showSales() {

                        	var date= $("#date").val();
                        	
                        	if( date == null || date == "" || date.length != 4) {
                        		alert('년도는 숫자 4자리로 입력해주시거나 선택해주세요.');
                        		return false;
                        	} else {

                        		$.ajax({
                        			type: "post",
                        			url: "showSales.do",
                        			data: {date : date},
                        			
                        			success: function(msg) {
                        				if(msg.result == '1') {
                        					
                        					$('#label').text(msg.label);
                        					
                        					var ctx = document.getElementById("myChart2").getContext('2d');
                        					var myChart = new Chart(ctx, {
                        					    type: 'bar',
                        					    data: {
                        					        labels: [ "1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월" ],
                        					        datasets: [{
                        					            label:  msg.label +'년도 매출 통계',
                        					            data: [
                        						            	msg.january, 
                        						            	msg.february, 
                        						            	msg.march, 
                        						            	msg.april, 
                        						            	msg.may,
                        						            	msg.june, 
                        						            	msg.july, 
                        						            	msg.august, 
                        						            	msg.september, 
                        						            	msg.october, 
                        						            	msg.nomember, 
                        						            	msg.december
                        						            ],
                        					            backgroundColor: [
                        					            	'rgba(54, 162, 235, 0.4)',
                        					            	'rgba(54, 162, 235, 0.4)',
                        					            	'rgba(54, 162, 235, 0.4)',
                        					            	'rgba(54, 162, 235, 0.4)',
                        					            	'rgba(54, 162, 235, 0.4)',
                        					            	'rgba(54, 162, 235, 0.4)',
                        					            	'rgba(54, 162, 235, 0.4)',
                        					            	'rgba(54, 162, 235, 0.4)',
                        					            	'rgba(54, 162, 235, 0.4)',
                        					            	'rgba(54, 162, 235, 0.4)',
                        					            	'rgba(54, 162, 235, 0.4)',
                        					            	'rgba(54, 162, 235, 0.4)'
                        					            ],
                        					            borderColor: [
                        					            	'rgba(54, 162, 235, 0.4)',
                        					            	'rgba(54, 162, 235, 0.4)',
                        					            	'rgba(54, 162, 235, 0.4)',
                        					            	'rgba(54, 162, 235, 0.4)',
                        					            	'rgba(54, 162, 235, 0.4)',
                        					            	'rgba(54, 162, 235, 0.4)',
                        					            	'rgba(54, 162, 235, 0.4)',
                        					            	'rgba(54, 162, 235, 0.4)',
                        					            	'rgba(54, 162, 235, 0.4)',
                        					            	'rgba(54, 162, 235, 0.4)',
                        					            	'rgba(54, 162, 235, 0.4)',
                        					            	'rgba(54, 162, 235, 0.4)'
                        					            ],
                        					            borderWidth: 1
                        					        }]
                        					    },	    
                        					    options: {
                        					        scales: {
                        					            yAxes: [{
                        					                ticks: {
                        					                    beginAtZero:true
                        					                }
                        					            }]
                        					        }
                        					    }
                        					});
                        				}
                        				
                        			},
                        			
                        		});
                        	}
                        }                      	
                      	</script>

                    </div>
                  </div>
                </div>
                
                
			<!-- 매출 통계 그래프 -->
               	<canvas id="myChart" width="300" height="100"></canvas>               	

             <!-- /매출 통계 그래프 --> 
             <hr>
             <div id="label" style="font-size:30px;"></div>
             <canvas id="myChart2" width="300" height="100"></canvas>
             

	</div>
</div>
                    	