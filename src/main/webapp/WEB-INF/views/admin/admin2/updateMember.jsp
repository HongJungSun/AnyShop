<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"  %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>



		<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 도로명 조합형 주소 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }
                // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
                if(fullRoadAddr !== ''){
                    fullRoadAddr += extraRoadAddr;
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample4_postcode').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('sample4_roadAddress').value = fullRoadAddr;


                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    //예상되는 도로명 주소에 조합형 주소를 추가한다.
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    document.getElementById('guide').innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    document.getElementById('guide').innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';

                } else {
                    document.getElementById('guide').innerHTML = '';
                }
            }
        }).open();
    }
</script>

    
    <div class="row">
              <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                  <div class="x_title">
                    <h2> 회원 정보 수정</h2>
                    <ul class="nav navbar-right panel_toolbox">
                      <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                      </li>
                      <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><i class="fa fa-wrench"></i></a>
                        <ul class="dropdown-menu" role="menu">
                          <li><a href="#">Settings 1</a>
                          </li>
                          <li><a href="#">Settings 2</a>
                          </li>
                        </ul>
                      </li>
                      <li><a class="close-link"><i class="fa fa-close"></i></a>
                      </li>
                    </ul>
                    <div class="clearfix"></div>
                  </div>
                  <div class="x_content">

			<!-- 회원 정보 수정 form -->
                    <form class="form-horizontal form-label-left" action="updateMemberAfter.do" method="post">
                    	<input type="hidden" name="pw" value="${userInfo.pw}">
                    	<input type="hidden" name="id" value="${userInfo.id}">
                      <span class="section">${userInfo.name }</span>

                      <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name">Name <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input id="name" value="${userInfo.name}" class="form-control col-md-7 col-xs-12" data-validate-length-range="6" data-validate-words="2" name="name" placeholder="both name(s) e.g Jon Doe" required="required" type="text">
                        </div>
                      </div>
                      <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="phone">Phone <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input type="text" id="phone" name="phone" value="${userInfo.phone}" required="required" class="form-control col-md-7 col-xs-12">
                        </div>
                      </div>
                      <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="gender">Gender <span class="required">*</span>
                        </label>
                        <div>
                       	  <c:if test="${userInfo.gender eq '남자' }">
                      	   	 <input type="radio" id="gender" name="gender" value="남자" checked required="required">남자 
                      	   	 <input type="radio" id="gender" name="gender" value="여자" required="required">여자
          				  </c:if>  
          				  <c:if test="${userInfo.gender eq '여자' }">
          				  	 <input type="radio" id="gender" name="gender" value="남자" required="required"> 남자
          				   	 <input type="radio" id="gender" name="gender" value="여자" checked required="required"> 여자
                          </c:if>
                        </div>
                      </div>
                      <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="email">E-mail <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input type="text" id="email" name="email" value="${userInfo.email }" required="required" class="form-control col-md-7 col-xs-12">
                        </div>
                      </div>
                      <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="address">Address <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                         <%--  <input id="_address1" type="text" name="address1" value="${userInfo.address1 }" data-validate-length-range="5,20" class="optional form-control col-md-7 col-xs-12"> --%>
                          	<input type="text" name="address1" id="sample4_postcode" placeholder="우편번호"> 
							<input type="button" onclick="sample4_execDaumPostcode()" value="주소 찾기"><br>
							<input type="text" name="address2" class="form-control" id="sample4_roadAddress" placeholder="기본 주소">
							<input type="text" name="address3" class="form-control" id="sample4_jibunAddress" placeholder="상세주소">
                        </div>
                      </div>
                      <div class="item form-group">
                        <label for="point" class="control-label col-md-3">Point</label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input id="point" type="text" name="point" value="${userInfo.point }" data-validate-length="6,8" class="form-control col-md-7 col-xs-12" required="required">
                        </div>
                      </div>
                      <div class="item form-group">
                        <label for="point" class="control-label col-md-3"> Height*</label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input id="point" type="text" name="point" value="${userInfo.height }" data-validate-length="6,8" class="form-control col-md-7 col-xs-12" required="required">
                        </div>
                      </div>
                      <div class="item form-group">
                        <label for="point" class="control-label col-md-3">Age*</label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input id="point" type="text" name="point" value="${userInfo.age }" data-validate-length="6,8" class="form-control col-md-7 col-xs-12" required="required">
                        </div>
                      </div>
                      <div class="item form-group">
                        <label for="point" class="control-label col-md-3">Weight*</label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input id="point" type="text" name="point" value="${userInfo.weight }" data-validate-length="6,8" class="form-control col-md-7 col-xs-12" required="required">
                        </div>
                      </div>
                      
                      <div class="ln_solid"></div>
                      <div class="form-group">
                        <div class="col-md-6 col-md-offset-3">
                          <input type="reset" class="btn btn-primary">
                          <input type="submit" class="btn btn-success">
                        </div>
                      </div>
                    </form> 
                  <!-- /end form -->
                    <button type="button" class="btn btn-primary" onClick="back();"> Cancel </button>                          
                          <script>
                          	function back() {
                          		history.back();
                          	}
                          
                          </script>
                    
                  </div>
                </div>
              </div>
            </div>