<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
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
							<a href=""><img src="<%=request.getContextPath()%>/resources/images/logo/logo-white.png" alt="header logo"></a>
						</div>
						<%@ include file="/WEB-INF/views/includes/navbar.jsp" %>
						<div class="mobile-menu hidden-lg hidden-xlg hidden-xx hidden-sp">
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
										   
										   <div class="bl_register_tutor">
										       <h3 style="color:#fff;text-transform:uppercase;"><spring:message code="label.student_profil" /></h3>
										       <form action="connexion_student" method="post">
										       <div class="form-group">
                                                <label for="exampleInputEmail1" style="color:#fff;"><spring:message code="label.email_address" /></label>
                                                 <spring:message code="label.enter_mail" var="labelentermail"></spring:message>
       											<input type="email" class="form-control" name="emailstud" aria-describedby="emailHelp" placeholder="${labelentermail }">
                                                </div>
                                               <div class="form-group">
                                                 <label for="exampleInputPassword1" style="color:#fff;"><spring:message code="label.password" /></label>
                                                  <spring:message code="label.password" var="labelpassword"></spring:message>
       											<input type="password" class="form-control" name="passwordstud" placeholder="labelpassword">
                                                </div>
                                                <button type="submit" class="btn btn-info"><spring:message code="label.connexion" /></button>
												<a style="color:#fff;margin-left:20px;" href="registration" class="btn btn-info"><spring:message code="label.inscription" /></a>
                                                <a style="color:#fff;margin-left:20px;" href="forgotpassword"><spring:message code="label.forgot_password" /></a>
												 </form>
										   </div>
										   <div class="bl_register_stud">
										   
										       <c:if test="${not empty indexmsg}">
		                                          <div class="col-md-12">
						                              <div class="alert alert-danger"><strong><spring:message code="label.error" /></strong> ${indexmsg}</div>
					                              </div>
                                                </c:if>
                                               <h3 style="color:#fff;text-transform:uppercase;"><spring:message code="label.tutor_profil" /></h3>
										       <form action="connexion_tutor" method="post">
										       <div class="form-group">
												<label for="exampleInputEmail1" style="color:#fff;"><spring:message code="label.email_address" /></label>
                                                 <spring:message code="label.enter_mail" var="labelentermail"></spring:message>
       											<input type="email" class="form-control" id="exampleInputEmail1" name="emailTutor" aria-describedby="emailHelp" placeholder="${labelentermail }">
                                               </div>
                                               <div class="form-group">
                                                 <label for="exampleInputPassword1" style="color:#fff;"><spring:message code="label.password" /></label>
                                                  <spring:message code="label.password" var="labelpassword"></spring:message>
       											<input type="password" name="passwordTutor" class="form-control" id="exampleInputPassword1" placeholder="${labelpassword }">
                                                </div>
                                                <button type="submit" class="btn btn-info"><spring:message code="label.connexion" /></button>
                                                <a style="color:#fff;margin-left:20px;" href="inscription" class="btn btn-info"><spring:message code="label.inscription" /></a>
                                                <a style="color:#fff;margin-left:20px;" href="forgot_password"><spring:message code="label.forgot_password" /></a>
												</form>
										  
										  </div>
										</div>
										<!--
										<h3>Lorem ipsum dolor</h3>
										<h1>Lorem ipsum dolor Lorem ipsum dolor Lorem ipsum dolor</h1>
										<div class="banner__content__button">
										     <div class="lab_mob"> available on<br>
											 </div>
											<a href="about-us.html" class="cr-btn cr-btn--transparent cr-btn--light cr-btn--sm"><span>Click here to
											        discover APPLICATION</span></a>
										</div>
										-->
									</div>
								</div>
							</div>
						</div>
					</div><!-- //Single Banner -->
					
				</div>
			</div><!-- //Top Banner -->
			
			
				

				

				

				
            
           </main><!-- //Page Conent -->
           <%@ include file="/WEB-INF/views/includes/footer.jsp" %>
			
