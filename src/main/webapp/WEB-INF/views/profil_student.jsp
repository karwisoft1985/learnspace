<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
 pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html class="no-js" lang="zxx">
  
   <%@ include file="/WEB-INF/views/includes/header.jsp" %>
   <script src="http://code.jquery.com/jquery-1.9.1.min.js"></script> 
<script>
$(document).ready(function(){
	var CheminComplet = window.location.pathname;
	var id=parseInt(CheminComplet.substring( CheminComplet.indexOf( "profil_student/" )+15 ,CheminComplet.length));	
	$.getJSON(id+"/getStudentById",
		function(donnees){
		var contenuHtml='<br><br>';
		contenuHtml+='<div class="container">';
		contenuHtml+='<div class="row">';
		contenuHtml+='<div class="col order-12">';
		contenuHtml+='<img src="../resources/images/student/'+donnees[0].picture+'" width="200px" height="200px" style="border-radius:100%;" />';
		contenuHtml+='</div></div>';
		contenuHtml+='<div class="row">';
		contenuHtml+='<div class="col order-12">';
		contenuHtml+='<h2>'+donnees[0].name+'</h2>';
		contenuHtml+='<button class="btn btn-success"  data-toggle="modal" data-target="#exampleModalsmsgst" style="padding-left:50px;padding-right:50px;font-size:20px;">Contact</button>';
		contenuHtml+='</div>';
		contenuHtml+='</div><br>';
 		contenuHtml+='<div class="row">';
 		contenuHtml+='<div class="col order-12">';
        contenuHtml+='<label><strong>';
        if(donnees[0].lang=="fr"){ 
        contenuHtml+='À propos';}
        else{ 
        contenuHtml+='About';}
        contenuHtml+='</strong></label>';
          contenuHtml+='<p>'+donnees[0].about+'</p>';
 		 contenuHtml+='</div>';
 		 contenuHtml+='</div>';
         contenuHtml+='<div class="row">';
         contenuHtml+='<div class="col">';
         contenuHtml+='<strong>';
         if(donnees[0].lang=="fr"){ 
         contenuHtml+='Date de naissance';}
         else{ 
         contenuHtml+='Date of birth';}
         contenuHtml+='</strong><br>';
         contenuHtml+='<p>'+donnees[0].birthdate+'</p>';
         contenuHtml+='</div>';
         contenuHtml+='<div class="col">';
         contenuHtml+='<strong>';
         if(donnees[0].lang=="fr"){ 
         contenuHtml+='Sexe';}
         else{ 
         contenuHtml+='Gender';}
         contenuHtml+=' </strong>';
         contenuHtml+='<br>';
         contenuHtml+='<p>'+donnees[0].gender+'</p>';
         contenuHtml+='</div>';
         contenuHtml+='<div class="col">';
         contenuHtml+='<strong>';
         if(donnees[0].lang=="fr"){ 
         contenuHtml+='Pays';}
         else{ 
         contenuHtml+='Country';}
         contenuHtml+=' </strong><br>';
         contenuHtml+='<p>'+donnees[0].location+'</p>';
         contenuHtml+='</div>';
         contenuHtml+='<div class="col order-12">';
         contenuHtml+='<strong>';
         if(donnees[0].lang=="fr"){ 
         contenuHtml+='Préférences d\'apprentissage';}
         else{ 
         contenuHtml+='Learning preferences';}
         contenuHtml+='</strong><br>';
         contenuHtml+='<p>'+donnees[0].learn_preference+'</p>';
         contenuHtml+='</div>';
         contenuHtml+='</div>';	
         contenuHtml+='<div class="row">';
         contenuHtml+='<br><br>';
         contenuHtml+='<div class="col">';
         contenuHtml+='<strong>';
         if(donnees[0].lang=="fr"){ 
         contenuHtml+='Langues parlées';}
         else{ 
         contenuHtml+=' Spoken Languages';}
         contenuHtml+=' </strong><br>';
         contenuHtml+='<p>'+donnees[0].language+'</p>';
         contenuHtml+='</div>';
         contenuHtml+='<div class="col">';
         contenuHtml+='<strong>';
         if(donnees[0].lang=="fr"){ 
         contenuHtml+='Fuseau horaire';}
         else{ 
         contenuHtml+=' Time zone';}
         contenuHtml+='</strong><br>';
         contenuHtml+='<p>'+donnees[0].timezone+'<p>';
         contenuHtml+='</div>';
         contenuHtml+='<div class="col order-1">';
         contenuHtml+='<strong>';
         if(donnees[0].lang=="fr"){ 
         contenuHtml+='Médias de communication';}
         else{ 
         contenuHtml+=' Communication media';}
         contenuHtml+=' </strong>';
         contenuHtml+='<p>'+donnees[0].communication+'</p>';
         contenuHtml+='</div>';
         contenuHtml+='</div>';
		contenuHtml+='<div class="row">';
        contenuHtml+='<div class="col">';
        contenuHtml+='<label><strong>';
        if(donnees[0].lang=="fr"){ 
        contenuHtml+='Sujets (je veux apprendre)';}
        else{ 
        contenuHtml+='Subject (I want to learn)';}
        contenuHtml+=' </strong> </label>';
        contenuHtml+='<p>';
        contenuHtml+=''+donnees[0].subject+'';
        contenuHtml+='</p>';
        contenuHtml+='</div>';
         contenuHtml+='</div>';
         contenuHtml+='<div class="row">';
		 contenuHtml+='<div class="col order-12">';
         contenuHtml+='<strong>';
         if(donnees[0].lang=="fr"){ 
         contenuHtml+='Riwaya à apprendre';}
         else{ 
         contenuHtml+=' Riwaya to learn';}
         contenuHtml+=' </strong>';
         contenuHtml+='<p>'+donnees[0].riwaya+'</p>';
         contenuHtml+='</div>';
         contenuHtml+='</div>';
         contenuHtml+='<div class="row">';
		 contenuHtml+='<div class="col order-12">';
         contenuHtml+='<strong> Certifications (Ijzazat) </strong>';
         contenuHtml+='<p>'+donnees[0].certification+'</p>';
         contenuHtml+='</div>';
         contenuHtml+='</div>';
		 contenuHtml+='</div>';
		document.getElementById("profil_student").innerHTML = contenuHtml;
		 if(${connexionstudent}==0){
		document.getElementById("id").value = id;}
		 else{
		 document.getElementById("emailStudent").value = donnees[0].email;
		document.getElementById("idstudent").value = id;
		 }		 
		});
});	
</script>
   <body>
		
		<div class="fakeloader"></div>
		
		<!-- Main wrapper -->
		<div class="wrapper" id="wrapper">
		<!-- Header -->
		<header id="header-area" class="header-area fixed--header sticky--header bg--dark--light">
				<div class="container">
					<div class="header header--style-1">
						<div class="logo image--logo hidden-md hidden-sm hidden-xs">
							<a href="<%=request.getContextPath()%>/index"><img src="<%=request.getContextPath()%>/resources/images/logo/logo-white.png" alt="header logo"></a>
						</div>
						<%@ include file="/WEB-INF/views/includes/navbar.jsp" %>
						<div class="mobile-menu hidden-lg hidden-xlg hidden-xx hidden-sp">
						   <a class="mobile-logo" href="<%=request.getContextPath()%>/index"><img src="<%=request.getContextPath()%>/resources/images/logo/mobile-logo.png" alt="logo"></a>
						 </div>
					</div>
				</div>
		</header><!-- //Header -->
           <section class="cr-section about-area ptb--150 bg--white flower--left-top flower--right-bottom" >
			
			   <c:if test="${not empty error}">
		                 <div class="col-md-12">
						      <div class="alert alert-danger"><strong>${error}</strong> </div>
					      </div>
                </c:if>
			
			<div id="profil_student">
			
			</div>		
		</section>
		
		
		</main><!-- //Page Conent -->
		
		
		<!-- Modal -->
<div class="modal fade" id="exampleModalsmsgst" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
       
        <h5 class="modal-title" id="exampleModalLabel"><spring:message code="label.send_msg" /></h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
       <c:if test="${connexionstudent != 0}">
          
          <form action="sendmessagest" method="GET">
            <input type="hidden" id="emailStudent" name="emailStudent" />
          	<input type="hidden" id="idstudent" name="idstudent" />
          	<input type="hidden" id="nom_tutor" name="nom_tutor" value="${nom_Student}" />
          	<input type="hidden" id="id_tutor" name="id_tutor"  value="${id_tutor}"/>
          <textarea class="form-control" rows="5" name="textmsg">
             </textarea>
          <br><br>
           <spring:message code="label.send" var="labelsend"></spring:message>      
             <input type="submit" class="btn btn-primary" value="${labelsend}" />
     
         </form>
      
      </c:if>
      
      <c:if test="${connexionstudent == 0}">
        <form action="connexion_tutor2" method="post">
      <center><h5 style="color:red"><spring:message code="label.msg_login" /></h5></center>
          <div class="form-group">
               <label for="exampleInputEmail1" style="color:#fff;"><spring:message code="label.email_address" /></label>
                <spring:message code="label.enter_mail" var="labelentermail"></spring:message>      
            <input type="email" class="form-control" name="emailtut" aria-describedby="emailHelp" placeholder="${labelentermail }" required />
            </div>
            <div class="form-group">
                   <label for="exampleInputPassword1" style="color:#fff;"><spring:message code="label.password" /></label>
                       <spring:message code="label.password" var="labelpassword"></spring:message>                  
                    <input type="password" class="form-control" name="passwordtut" placeholder="${labelpassword}" required />
           			 <input type="hidden" class="form-control" name="id"  id="id" />
         </div>
            <button type="submit" class="btn btn-info"><spring:message code="label.login" /></button>
			<a style="color:#fff;margin-left:20px;" href="<%=request.getContextPath()%>/inscription" class="btn btn-info"><spring:message code="label.sign_up" /></a>            									
         </form>
      </c:if>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal"><spring:message code="label.close" /></button>
        
      </div>
      
    </div>
  </div>
</div>
           <%@ include file="/WEB-INF/views/includes/footer.jsp" %>
			
