<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"  %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

  <!-- Start slider -->
  <section id="aa-slider">
    <div class="aa-slider-area">
      <div id="sequence" class="seq" style="width: 70%; height:500px;">
        <div class="seq-screen">
          <ul class="seq-canvas">
            <!-- single slide item -->
            <c:forEach items="${productInfo}" var="productInfo" varStatus="i">
            <li>
              <div class="seq-model">             
                <img data-seq src="resources/product/${productInfo.product_img}" alt="recent product top5" />
              </div>
              <div class="seq-title">
               <span style="color:black;">최신상품 ${i.count}</span>             
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

   



