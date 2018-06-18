<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html class="no-js" lang="zxx">
  
   <%@ include file="/WEB-INF/views/includes/header.jsp" %>
   
   <script src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
   <script src="<%=request.getContextPath()%>/resources/js_webservices/gestiontutors/tutors.js"></script>
   
   <body>
		<div class="fakeloader"></div>
		<!-- Main wrapper -->
		<div class="wrapper" id="wrapper">
		<!-- Header -->
		
		<header id="header-area" class="header-area fixed--header sticky--header ">
				<div class="container">
					<div class="header header--style-1">
						<div class="logo image--logo hidden-md hidden-sm hidden-xs">
							<a href="index"><img src="<%=request.getContextPath()%>/resources/images/logo/logo-white.png" alt="header logo"></a>
						</div>
						<%@ include file="/WEB-INF/views/includes/navbar.jsp" %>
						<div class="mobile-menu hidden-lg hidden-xlg hidden-xx hidden-sp">
						  <a class="mobile-logo" href="index"><img src="<%=request.getContextPath()%>/resources/images/logo/mobile-logo.png" alt="logo"></a>
						 </div>
					</div>
				</div>
		</header><!-- //Header -->

			<div class="banner-area">
				<div class="banner banner-slide-active slider-arrow--style1 slide-animate-text">

					

					<!-- Single Banner -->
					<div class="banner__single bg-image--2 fullscreen d-flex align-items-center" data-black-overlay="6" >
						<div class="container">
							<div class="row">
								<div class="col-md-12">
									<div class="banner__content text-center">
									  
										<div id="login" class="bl_register" >
										   
										   <div class="bl_register_stud">
										       <h3 style="color:#fff;text-transform:uppercase;">Forgot Password</h3>										       
										       <form  method="post" action="forgot_pass">
										       <c:if test="${not empty success}">
		    <div class="alert alert-success" role="alert">
			<button type="button" class="close" data-dismiss="alert"
                                aria-label="Close">
				<span aria-hidden="true">x</span>
			</button>
			<strong>${success}</strong>
		    </div>
		</c:if>
                                                <div class="form-group">
                                                <label for="exampleInputEmail1" style="color:#fff;">Enter your email</label>
                                                <input type="email" class="form-control" id="emailstudent" name="emailstudent" placeholder="Enter email" required/>
                                                </div>
                                                <input type="submit" value="Reset Password" class="btn btn-info"/>
                                                
                                                </form>
										   </div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div><!-- //Single Banner -->
					
				</div>
			</div><!-- //Top Banner -->
           <%@ include file="/WEB-INF/views/includes/footer.jsp" %>
			
