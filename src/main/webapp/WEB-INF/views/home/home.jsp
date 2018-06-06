<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"  %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

  <!-- Start slider -->
  <section id="aa-slider">
    <div class="aa-slider-area">
      <div id="sequence" class="seq">
        <div class="seq-screen">
          <ul class="seq-canvas">
            <!-- single slide item -->
            <c:forEach items="${productInfo}" var="productInfo" varStatus="i">
            <li>
              <div class="seq-model">             
                <img data-seq src="resources/product/${productInfo.product_img}" alt="recent product top5" />
              </div>
              <div class="seq-title">
               <span data-seq>최신상품 ${i.count}</span>                
                <h2 data-seq>${productInfo.product_name }</h2>                
               <!--  <p data-seq></p> -->
                <a data-seq href="viewProduct.do?product_id=${productInfo.product_id}" class="aa-shop-now-btn aa-secondary-btn">바로 구매하러가기 </a>
              </div>
            </li>
            </c:forEach>                  
          </ul>
        </div>
        
        <!-- slider navigation btn -->
        <fieldset class="seq-nav" aria-controls="sequence" aria-label="Slider buttons">
          <a type="button" class="seq-prev" aria-label="Previous"><span class="fa fa-angle-left"></span></a>
          <a type="button" class="seq-next" aria-label="Next"><span class="fa fa-angle-right"></span></a>
        </fieldset>
      </div>
    </div>
  </section>
  <!-- / slider -->
  
  
  <!-- Start Promo section -->
  <section id="aa-promo">
    <div class="container">
      <div class="row">
        <div class="col-md-12">
          <div class="aa-promo-area">
            <div class="row">
              <!-- promo left -->
              <div class="col-md-5 no-padding">                
                <div class="aa-promo-left">
                  <div class="aa-promo-banner">                    
                    <img src="resources/bootstrap/img/promo-banner-1.jpg" alt="img">                    
                    <div class="aa-prom-content">
                      <h4><a href="polpularProduct.do">인기 상품 </a></h4>                      
                    </div>
                  </div>
                </div>
              </div>
              <!-- promo right -->
              <div class="col-md-7 no-padding">
                <div class="aa-promo-right">
                  <div class="aa-single-promo-right">
                    <div class="aa-promo-banner">                      
                      <img src="resources/bootstrap/img/promo-banner-3.jpg" alt="img">                      
                      <div class="aa-prom-content">
                        <h4><a href="season.do?keyword=spring">봄 상품</a></h4>                        
                      </div>
                    </div>
                  </div>
                  <div class="aa-single-promo-right">
                    <div class="aa-promo-banner">                      
                      <img src="resources/bootstrap/img/promo-banner-2.jpg" alt="img">                      
                      <div class="aa-prom-content">
                        <h4><a href="season.do?keyword=summer">여름 상품</a></h4>                        
                      </div>
                    </div>
                  </div>
                  <div class="aa-single-promo-right">
                    <div class="aa-promo-banner">                      
                      <img src="resources/bootstrap/img/promo-banner-4.jpg" alt="img">                      
                      <div class="aa-prom-content">
                        <h4><a href="season.do?keyword=autumn">가을 상품</a></h4>                        
                      </div>
                    </div>
                  </div>
                  <div class="aa-single-promo-right">
                    <div class="aa-promo-banner">                      
                      <img src="resources/bootstrap/img/promo-banner-5.jpg" alt="img">                      
                      <div class="aa-prom-content">
                        <h4><a href="season.do?keyword=winter">겨울 상품</a></h4>                        
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
  <!-- / Promo section -->
  
  <!-- Products section -->
  <section id="aa-product">
    <div class="container">
      <div class="row">
        <div class="col-md-12">
          <div class="row">
            <div class="aa-product-area">
              <div class="aa-product-inner" >            
                <!-- 남,여,어린이,스포츠  tab -->
                 <ul class="nav nav-tabs aa-products-tab">
                    <li><a href="#manProductInfo" data-toggle="tab">남자</a></li>
                    <li><a href="#womenProductInfo" data-toggle="tab">여자</a></li>
                    <li><a href="#kidsProductInfo" data-toggle="tab">어린이</a></li>
                    <li><a href="#sportsProductInfo" data-toggle="tab">운동</a></li>
                  </ul>
                  <!-- / 남,여,어린이,스포츠 -->
                  
                  <div class="tab-content">
                    <!-- 남자상품 카테고리 -->
                    <div class="tab-pane fade in active" id="manProductInfo">
                      <ul class="aa-product-catg">
                      <c:forEach items="${manProductInfo}" var="manProductInfo">
	                      <!-- start single product item -->
	                        <li>
	                          <figure>
	                            <a class="aa-product-img" href="viewProduct.do?product_id=${manProductInfo.product_id }"><img src="resources/product/${manProductInfo.product_img }" style="width:auto; height:200px;"></a>
	                            <figcaption>
	                              <h4 class="aa-product-title"><a href="viewProduct.do?product_id=${manProductInfo.product_id }">${manProductInfo.product_name }</a></h4>
	                              <span class="aa-product-price">
	                              	<fmt:formatNumber type= "number" maxFractionDigits= "3" value= "${manProductInfo.product_price}" /> 원 
	                              </span>
	                              <span class="aa-product-price">
	                              </span>
	                            </figcaption>
	                          </figure>                         
	                          <!-- product badge -->
	                          <!-- <span class="aa-badge aa-sale" href="#">SALE!</span> -->
	                        </li>
	                      </c:forEach>  
                       </ul>                      
                    </div>
                    <!-- / 남자상품 카테고리 -->                   
                    
                    
                    <!-- 여자 상품 카테고리 -->
                    <div class="tab-pane fade" id="womenProductInfo">
                      <ul class="aa-product-catg">
                        <c:forEach items="${womenProductInfo}" var="womenProductInfo">
	                        <li>
	                          <figure>
	                            <a class="aa-product-img" href="viewProduct.do?product_id=${womenProductInfo.product_id }"><img src="resources/product/${womenProductInfo.product_img }" style="width:auto; height:200px;"></a>
	                            <figcaption>
	                              <h4 class="aa-product-title"><a href="viewProduct.do?product_id=${womenProductInfo.product_id }">${womenProductInfo.product_name }</a></h4>
	                              <span class="aa-product-price">
	                              	<fmt:formatNumber type= "number" maxFractionDigits= "3" value= "${womenProductInfo.product_price}" /> 원 
	                              </span>
	                              <span class="aa-product-price">
	                              </span>
	                            </figcaption>
	                          </figure>                         
	                      
	                          <!-- product badge -->
	                          <!-- <span class="aa-badge aa-sale" href="#">SALE!</span> -->
	                        </li>
	                        </c:forEach>
						</ul>
					</div> 
                    <!-- / 여자 상품 카테고리 -->
                    
                    <!-- 어린이 상품 카테고리 -->
                    <div class="tab-pane fade" id="kidsProductInfo">
                      <ul class="aa-product-catg">
                       <c:forEach items="${kidsProductInfo}" var="kidsProductInfo">
                        <li>
                          <figure>
                            <a class="aa-product-img" href="viewProduct.do?product_id=${kidsProductInfo.product_id }"><img src="resources/product/${kidsProductInfo.product_img }" style="width:auto; height:200px;"></a>
                            <a class="aa-add-card-btn"href="#"><span class="fa fa-shopping-cart"></span>Add To Cart</a>
                            <figcaption>
                              <h4 class="aa-product-title"><a href="viewProduct.do?product_id=${kidsProductInfo.product_id }">${kidsProductInfo.product_name }</a></h4>
                              <span class="aa-product-price">
	                              	<fmt:formatNumber type= "number" maxFractionDigits= "3" value= "${kidsProductInfo.product_price}" /> 원 
	                              </span>
                            </figcaption>
                          </figure>                         
                       
                          <!-- product badge -->
                          <!-- <span class="aa-badge aa-sale" href="#">SALE!</span> -->
                        </li> 
                       </c:forEach>                     
                      </ul>
                    </div>
                    <!-- / 어린이 상품 카테고리 -->
                    
                    
                    <!-- 스포츠 상품 카테고리 -->
                    <div class="tab-pane fade" id="sportsProductInfo">
                       <ul class="aa-product-catg">
                    	<c:forEach items="${sportsProductInfo}" var="sportsProductInfo">
	                      <!-- start single product item -->
	                        <li>
	                          <figure>
	                            <a class="aa-product-img" href="viewProduct.do?product_id=${sportsProductInfo.product_id }"><img src="resources/product/${sportsProductInfo.product_img }" style="width:auto; height:200px;"></a>
	                            <figcaption>
	                              <h4 class="aa-product-title"><a href="viewProduct.do?product_id=${sportsProductInfo.product_id }">${sportsProductInfo.product_name }</a></h4>
	                              <span class="aa-product-price">
	                              	<fmt:formatNumber type= "number" maxFractionDigits= "3" value= "${sportsProductInfo.product_price}" /> 원 
	                              </span>
	                              <span class="aa-product-price">
	                              </span>
	                            </figcaption>
	                          </figure>                         
	           
	                          <!-- product badge -->
	                          <!-- <span class="aa-badge aa-sale" href="#">SALE!</span> -->
	                        </li>
	                      </c:forEach>
	                   </ul>
	                  </div>
	                  <!-- / 스포츠 상품 카테고리 -->
                  </div>
                               
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
  <!-- / Products section -->
  

  <!-- footer -->
  <!-- Include all compiled plugins (below), or include individual files as needed -->
  <script src="resources/bootstrap/js/bootstrap.js"></script>  
  <!-- SmartMenus jQuery plugin -->
  <script type="text/javascript" src="resources/bootstrap/js/jquery.smartmenus.js"></script>
  <!-- SmartMenus jQuery Bootstrap Addon -->
  <script type="text/javascript" src="resources/bootstrap/js/jquery.smartmenus.bootstrap.js"></script>  
  <!-- To Slider JS -->
  <script src="resources/bootstrap/js/sequence.js"></script>
  <script src="resources/bootstrap/js/sequence-theme.modern-slide-in.js"></script>  
  <!-- Product view slider -->
  <script type="text/javascript" src="resources/bootstrap/js/jquery.simpleGallery.js"></script>
  <script type="text/javascript" src="resources/bootstrap/js/jquery.simpleLens.js"></script>
  <!-- slick slider -->
  <script type="text/javascript" src="resources/bootstrap/js/slick.js"></script>
  <!-- Price picker slider -->
  <script type="text/javascript" src="resources/bootstrap/js/nouislider.js"></script>
  <!-- Custom js -->
  <script src="resources/bootstrap/js/custom.js"></script>   
  <!-- / footer -->

   



