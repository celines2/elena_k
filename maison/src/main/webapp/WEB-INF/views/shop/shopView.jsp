<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="title" value="쇼핑해요"/>
</jsp:include>
   <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js"></script>
<link rel="stylesheet"href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css" />
<jsp:include page="/WEB-INF/views/common/menuTitle.jsp">
	<jsp:param name="menuTitle" value="쇼핑해요"/>
</jsp:include>
<style>
.ellipsis{
    width:200px;
    padding:0 5px;
    overflow:hidden;
    text-overflow:ellipsis;
    white-space:nowrap;
    }
</style>
<!-- Start -->
<div class="shop-list-box">
	<div class="container">
		<div class="row">
			<div class="col-xl-5 col-lg-5 col-md-6"></div>
		</div>
	</div>
</div>
<!-- End -->

<!-- ShopMainStart -->
<div class="shop-box-inner">
        <div class="container">
            <div class="row">
            <c:if test="${product != null}">
                <div class="col-xl-9 col-lg-9 col-sm-12 col-xs-12 shop-content-right">
                    <div class="right-product-box">
                        <div class="product-item-filter row">
                            <div class="col-12 col-sm-8 text-center text-sm-left">
                                <div class="toolbar-sorter-right">
                                    <span>Sort by </span>
                                    <select id="basic" class="selectpicker show-tick form-control" data-placeholder="$ USD">
									<option data-display="Select">Nothing</option>
									<option value="1">Popularity</option>
									<option value="2">High Price → High Price</option>
									<option value="3">Low Price → High Price</option>
									<option value="4">Best Selling</option>
								</select>
                                </div>
                                <p>Showing all ${count} results</p>
                            </div>
                            <div class="col-12 col-sm-4 text-center text-sm-right">
                                <ul class="nav nav-tabs ml-auto">
                                    <li>
                                        <a class="nav-link active" href="#grid-view" data-toggle="tab"> <i class="fa fa-th"></i> </a>
                                    </li>
                                    <li>
                                        <a class="nav-link" href="#list-view" data-toggle="tab"> <i class="fa fa-list-ul"></i> </a>
                                    </li>
                                </ul>
                            </div>
                        </div>
		<!-- 상품 -->
                 <div class="product-categorie-box">
                            <div class="tab-content">
                                <div role="tabpanel" class="tab-pane fade show active" id="grid-view">
                                    <div class="row" id="divResult">
                                    <input type="hidden" name="memberId" id="memberId" value="${loginMember.memberId }">
                                    <c:forEach var="list" items="${product}" varStatus="i">
                                    <c:if test="${list.productStatus eq 'Y'}">
                                        <div class="col-sm-6 col-md-6 col-lg-4 col-xl-4">
                                            <div class="products-single fix">
                                                <div class="box-img-hover">
                                                    <div class="type-lb">
                                                        <p class="sale">NEW</p><!-- 일주일 지나면 buy now! -->
                                                    </div>
                                                    <img src="${ path }/resources/upload/product/${list.productImg}" class="img-fluid" alt="Image">
                                                    <div class="mask-icon">
                                                        <ul>
                                                            <li><a href="#" data-toggle="tooltip" data-placement="right" title="View"><i class="fas fa-eye"></i></a></li>
                                                            <li><a href="#" data-toggle="tooltip" data-placement="right" title="Compare"><i class="fas fa-sync-alt"></i></a></li>
                                                            <li><a href="#" data-toggle="tooltip" data-placement="right" title="Add to Wishlist"><i class="far fa-heart"></i></a></li>
                                                        </ul>
                                                        <input type="hidden" value="${list.productNo }">
                                                        <a class="cart basketA" href="#">Add to Cart</a>
                                                    </div>
                                                </div>
                                                <div class="why-text">
                                                    <h4 class="ellipsis"><a href="${ path }/shop/shopDetail.do?no=${list.productNo}">${list.productName}</a></h4><br>
                                                    <h5><c:out value="${list.price}">${list.price}</c:out>원</h5>
                                                </div>
                                            </div>
                                        </div>
                                        </c:if>
                                        </c:forEach>
                                     </div>
                                  </div>
                            </div>
                        </div>
                    </div>
                <!-- 요청해요 -->
		<div id="request-container" style="margin:0 10% 0 7%;"></div>
                </div>
                </c:if><!-- product가 null이 아니면 -->
                

                <!-- 카테고리 -->
				<div class="col-xl-3 col-lg-3 col-sm-12 col-xs-12 sidebar-shop-left">
                    <div class="product-categori">
                        <div class="search-product">
                            <form action="" method="post">
                                <input class="form-control" id="autocomplete" name="value" placeholder="Search here..." type="text" list="list">
                                <datalist id="list"></datalist>
                                <button type="button" name="search" id="search"> <i class="fa fa-search"></i> </button>
                            </form>
                        </div>
                        <div class="filter-sidebar-left">
                            <div class="title-left">
                                <h3>Categories</h3>
                            </div>
                            <div class="list-group list-group-collapse list-group-sm list-group-tree" id="list-group-men" data-children=".sub-men">
                            	<c:forEach var="largeCate" items="${category }" varStatus="i">                  
                                <div class="list-group-collapse sub-men">
                                    <a class="list-group-item list-group-item-action" href="#sub-men${i.index }" data-toggle="collapse" aria-expanded="true" aria-controls="sub-men${i.index }">
                                  
                                    	${ largeCate.largeCate }
								</a>
                                   
                                    <div class="collapse <c:if test='${i.index eq 0}'>show</c:if> " id="sub-men${i.index }" data-parent="#list-group-men">
                                    <div class="list-group">
                                    <c:forEach var="mc" items="${ medicate }" varStatus="j">
                                    
                                      <!-- 중분류카테고리 검색조건으로 seq넘기기 -->
                                    <c:if test="${ i.current.largeCate  eq j.current.largeCate }">
                                        <a href=""  id="${j.index+1}" name="cateSearch" class="list-group-item list-group-item-action<c:if test='${i.index eq 0}'>active</c:if>" value="${ j.current.mediumCate }">${ mc.mcName }</a>
                                     </c:if>
                                     </c:forEach>
                                    </div>
                                     </div>
                                </div>
                                 </c:forEach>
                                 <br>
	                        </div>
	                    </div>
	                </div>
	            </div>
	        </div>
	     </div>
	   </div>
   
    <div id="pageBar">
    	${pageBar }
    </div>
   </div>
   <br>
    <script>
    	$(function(){
    		
    		$(".basketA").click(
    				function() {
    					var amount = 1;
    					const productNo = $(this).prev().val();
    					$(this).attr('href',
    					'${path}/basket/insertBasket.do?productNo='+ productNo
    					+ '&amount=' + amount);
    					});

    				
    		
    		
    		
    		
    		var mId = $("#memberId").val();
			var html = '';
			var divResult = $("#divResult");
			var requestContainer = $("#request-container");
    		//keyword ajax 성공
    		$("button[name=search]").click(function(){
					var keyword = $("#autocomplete").val();
			
				$.ajax({
					url:"${path}/shop/search.do",
					data:{keyword:keyword},
// 					type:"get",
					dataType:"json",
					success:function(data){
						var obj = Object.keys(data).length;
						divResult.empty();
						
						
						if(obj >0){
						$.each(data,function(i){
							/* divResult.empty(); */
							if(data[i].productStatus=='Y'){
			        html = "	<div class='col-sm-6 col-md-6 col-lg-4 col-xl-4'>									"
							/* +"	<div class='products-single fix' onclick= selectOneProduct("+data[i].productNo +")>" */
							+"	<div class='products-single fix'>"
							+"	<div class='box-img-hover'>																"
							+"	<div class='type-lb'>																		"
							+"	<p class='sale'>NEW</p>																"
							+"	</div>																							"
							+"	<img src='${ path }/resources/upload/product/"+data[i].productImg+"'  "
							+"	class='img-fluid' alt='Image'>															"
							+"	<div class='mask-icon'>																	"
							+"	<ul>																								"
							+"	<li><a href='#' data-toggle='tooltip' data-placement='right'					"
							+"	title='View'><i class='fas fa-eye'></i></a></li>								"
							+"	<li><a href='#' data-toggle='tooltip' data-placement='right'					"
							+"	title='Compare'><i class='fas fa-sync-alt'></i></a></li>					"
							+"	<li><a href='#' data-toggle='tooltip' data-placement='right'					"
							+"	title='Add to Wishlist'><i class='far fa-heart'></i></a></li>				"
							+"	</ul>																							"
							+"	<a class='cart' href='#'>Add to Cart</a>											"
							+"	</div>																							"
							+"	</div>																							"
							+"	<div class='why-text'>																		"
							+"	<h4 class='ellipsis'>																								"
							+"	<a href='${ path }/shop/shopDetail.do?no="+data[i].productNo+"'>"+data[i].productName+"</a>	"
							+"	</h4>																							"
							+"	<br>																								"
							+"	<h5>"+data[i].price+"원</h5>															"
							+"	</div>																							"
							+"	</div>																							"
							+"	</div>																							";
							}else{
								html="<span>검색하신 상품은 현재 준비중입니다.</span>";
							}
			       			 divResult.append(html);
			       			 requestContainer.empty();
						 });
						}else{
							requestContainer.empty();
							if(mId == null || mId != 'admin'){
					html = " <form action='${path}/shop/product/requestP.do' method='post'>																					"
							+"<div>																																											"
							+"<h2><strong>💌 요청해요</strong></h2><br><br>																											"
							+"<span><strong>원하시는 상품의 모델명, 품번 등을 자세히 기입하시면 더 신속하게 확인 가능합니다.</strong><br><br>											"
							+" &nbsp;**유의사항**<br>																																				"
					 		+"1. 현재 판매중인 상품관련 문의는 질문해요 게시판에 남겨주세요.<br>																										"
							+"2. 입점불가대상 : 생필품 제외한 모든 상품 &nbsp;																															"
							+"ex)식품, 브랜드 정책상 온라인미판매 상품 등</span>																														"
							+"</div>																																										"
							+"<br>																																											"
							+"<textarea rows='10' cols='80' name='requestContent' id='requestP' placeholder='이런 상품 구해주세요 ' required></textarea>			"
							+"<input type='hidden' name='memberId' value='${loginMember.memberId}'>																					"
							+"<c:if test='${ loginMember.memberId != null}'>																												"
							+"<button type='submit' id='loginReqBtn' class='btn' onclick='${path}/shop/product/requestP.do'>요청</button>"
							+"</c:if> 																																										"
							+"<c:if test='${ loginMember eq null }'>																															"
							+"<button type='button' id='reqBtn' class='btn'>요청</button>																								"
							+"</c:if>																																										"
	                		+"</form>																																										"
	                		+"<script>"
	                		+"$('#reqBtn').click(function(){"
	            			+"swal('','로그인 후 이용해 주세요.');"
	            			+"});//reqBtn"
	            			+"<script>";
	                		requestContainer.append(html);
							}else{
								html="<h4>조회하신 상품이 없습니다.</h4>";
								requestContainer.append(html);
							}
	                		
						}
						
						$("#autocomplete").val("");
					}
				})
    	});

    	
    		//카테고리 서치
    		$("[name=cateSearch]").click(function(){
    			var id=$(this).attr('id');
				$.ajax({
					url:"${path}/shop/cateSearch.do",
					type:"post",
					data:{category:id},
					dataType:"json",
					success:function(data){
						
						var obj = Object.keys(data).length;
						divResult.empty();
						if(obj>0){
						$.each(data,function(i){
							/* divResult.empty(); */
							if(data[i].productStatus=='Y'){
			        html = "	<div class='col-sm-6 col-md-6 col-lg-4 col-xl-4'>									"
							+"	<div class='products-single fix'>"
							+"	<div class='box-img-hover'>																"
							+"	<div class='type-lb'>																		"
							+"	<p class='sale'>NEW</p>																"
							+"	</div>																							"
							+"	<img src='${ path }/resources/upload/product/"+data[i].productImg+"'  "
							+"	class='img-fluid' alt='Image'>															"
							+"	<div class='mask-icon'>																	"
							+"	<ul>																								"
							+"	<li><a href='#' data-toggle='tooltip' data-placement='right'					"
							+"	title='View'><i class='fas fa-eye'></i></a></li>								"
							+"	<li><a href='#' data-toggle='tooltip' data-placement='right'					"
							+"	title='Compare'><i class='fas fa-sync-alt'></i></a></li>					"
							+"	<li><a href='#' data-toggle='tooltip' data-placement='right'					"
							+"	title='Add to Wishlist'><i class='far fa-heart'></i></a></li>				"
							+"	</ul>																							"
							+"	<a class='cart' href='#'>Add to Cart</a>											"
							+"	</div>																							"
							+"	</div>																							"
							+"	<div class='why-text'>																		"
							+"	<h4 class='ellipsis'>																								"
							+"	<a href='${ path }/shop/shopDetail.do?no="+data[i].productNo+"'>"+data[i].productName+"</a>	"
							+"	</h4>																							"
							+"	<br>																								"
							+"	<h5>"+data[i].price+"원</h5>															"
							+"	</div>																							"
							+"	</div>																							"
							+"	</div>																							";
							}else{
								html="<span>해당 카테고리의 상품은 현재 준비중입니다.</span>";
							}
			       			 divResult.append(html);
			       			 requestContainer.empty();
						 });
						}else{
							requestContainer.empty();
							if(mId == null || mId != 'admin'){
								divResult.append("<span style='margin:5% 0% 5% 15%;'><small>현재 선택하신 카테고리의 상품은 존재하지 않습니다. &nbsp;필요한 상품이 있으시다면 하단 요청해요를 통해 요청해주세요:)<small></span><br><br><br><br><hr>");
							}else if(mId=='admin'){
								divResult.append("<span style='margin:5% 0% 5% 15%;'><small>현재 선택하신 카테고리의 상품은 존재하지 않습니다.");
							}
							if(mId == null || mId != 'admin'){
								html = "<hr> <form action='${path}/shop/product/requestP.do' method='post'>																					"
										+"<div>																																											"
										+"<h2><strong>💌 요청해요</strong></h2><br><br>																											"
										+"<span><strong>원하시는 상품의 모델명, 품번 등을 자세히 기입하시면 더 신속하게 확인 가능합니다.</strong><br><br>											"
										+" &nbsp;**유의사항**<br>																																				"
								 		+"1. 현재 판매중인 상품관련 문의는 질문해요 게시판에 남겨주세요.<br>																										"
										+"2. 입점불가대상 : 생필품 제외한 모든 상품 &nbsp;																															"
										+"ex)식품, 브랜드 정책상 온라인미판매 상품 등</span>																														"
										+"</div>																																										"
										+"<br>																																											"
										+"<textarea rows='10' cols='80' name='requestContent' id='requestP' placeholder='이런 상품 구해주세요 ' required></textarea>			"
										+"<input type='hidden' name='memberId' value='${loginMember.memberId}'><br>																					"
										+"<c:if test='${ loginMember.memberId != null}'>																												"
										+"<button type='submit' id='loginReqBtn' class='btn' onclick='${path}/shop/product/requestP.do'>요청</button>"
										+"</c:if> 																																										"
										+"<c:if test='${ loginMember eq null }'>																															"
										+"<button type='button' id='reqBtn' class='btn'>요청</button>																								"
										+"</c:if>																																										"
				                		+"</form>																																										"
				                		+"<script>"
				                		+"$('#reqBtn').click(function(){"
				            			+"swal('','로그인 후 이용해 주세요.');"
				            			+"});//reqBtn"
				            			+"<script>";
				                		requestContainer.append(html);
							}
						};
					}
				})
				return false;
				});
    		//cateSearch
				
    	});//onload
	
    </script>
    <script>
    	function selectOneProduct(productNo){							
    		location.href="url?no="+productNo;	//Get방식
    	}
    	
    	function searchCate(mediumCate){
    		location.href="url?category="+mediumCate;
    	}
    	
    </script>
    <!-- End Shop Page -->
  
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>		
<!-- PLUGINS -->
<script src="<%=request.getContextPath() %>/resources/js/jquery-ui.js"></script>
<script src="<%=request.getContextPath() %>/resources/js/jquery.nicescroll.min.js"></script>
