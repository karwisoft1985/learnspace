<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
 pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html class="no-js" lang="zxx">
  
   <%@ include file="/WEB-INF/views/includes/header.jsp" %>
   <script src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
   <script src="<%=request.getContextPath()%>/resources/js_webservices/gestiontutors/tutors.js"></script>
   
<script>
$(document).ready(function(){
	var id= window.location.pathname.substring(25);
	
	$.getJSON(id+"/getTutorById",
		function(donnees){
		var contenuHtml='<br><br>';
		contenuHtml+='<div class="container">';
		contenuHtml+='<div class="row">';
		contenuHtml+='<div class="col">';
		contenuHtml+='<h2>'+donnees[0].name+'</h2>';
		contenuHtml+='<button class="btn btn-success"  data-toggle="modal" data-target="#exampleModal" style="padding-left:50px;padding-right:50px;font-size:20px;">Contact</button>';
		contenuHtml+='</div>';
		contenuHtml+='<div class="col order-12">';
		contenuHtml+='<img src="../resources/images/tutor/'+donnees[0].picture+'" width="200px" height="200px" style="border-radius:100%;" />';
		contenuHtml+='</div>';
		contenuHtml+='<div class="col order-1">';
		contenuHtml+='<label><strong>';
        if(donnees[0].lang=="fr"){ 
        contenuHtml+='Taux horaire';}
        else{ 
        contenuHtml+='Hourly rate';}
        contenuHtml+=' </strong></label>';
		contenuHtml+='<h1 class="display-6" style="color:#bf470d;font-size:40px;">'+donnees[0].hourly+'</h1>';
		contenuHtml+='</div>';
        contenuHtml+='</div>';
		contenuHtml+='<br>';
		contenuHtml+='<div class="row">';
		contenuHtml+='<br><br>';
		contenuHtml+='<div class="col order-12">';
        contenuHtml+='<label><strong>';
        if(donnees[0].lang=="fr"){ 
        contenuHtml+='À propos';}
        else{ 
        contenuHtml+='About';}
        contenuHtml+='</strong></label>';
         contenuHtml+='<p>';
         contenuHtml+=''+donnees[0].about+'';
         contenuHtml+='</p>';
		 contenuHtml+='</div>';
         contenuHtml+='<div class="col order-1">';
         contenuHtml+='<label><strong>';
         if(donnees[0].lang=="fr"){ 
         contenuHtml+='Sujets';}
         else{ 
         contenuHtml+='Subjects';}
         contenuHtml+='</strong></label>';
         contenuHtml+='<p>';
         contenuHtml+=''+donnees[0].subject_icanteach+'';
         contenuHtml+='</p>';
         contenuHtml+='</div>';
         contenuHtml+='</div>';
		   
		   
         contenuHtml+='<div class="row">';
         contenuHtml+='<div class="col">';
         contenuHtml+='<strong>';
         if(donnees[0].lang=="fr"){ 
         contenuHtml+='Âge';}
         else{ 
         contenuHtml+='Age';}
         contenuHtml+=' </strong><br>';
         contenuHtml+='<p>'+donnees[0].age+'</p>';
         contenuHtml+='</div>';
         contenuHtml+='<div class="col order-12">';
         contenuHtml+='<strong>';
         if(donnees[0].lang=="fr"){ 
         contenuHtml+='Sexe';}
         else{ 
         contenuHtml+='Gender';}
         contenuHtml+=' </strong>';
         contenuHtml+='<br>';
         contenuHtml+='<p>'+donnees[0].gender+'</p>';
         contenuHtml+='</div>';
         contenuHtml+='<div class="col order-12">';
         contenuHtml+='<strong>';
         if(donnees[0].lang=="fr"){ 
         contenuHtml+='Langues parlées';}
         else{ 
         contenuHtml+=' Spoken Languages';}
         contenuHtml+=' </strong><br>';
         contenuHtml+='<p>'+donnees[0].language+'</p>';
         contenuHtml+='</div>';
         contenuHtml+='</div>';
         
         contenuHtml+='<div class="row">';
         contenuHtml+='<br><br>';
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
         contenuHtml+='Fuseau horaire';}
         else{ 
         contenuHtml+=' Time zone';}
         contenuHtml+='</strong><br>';
         contenuHtml+='<p>'+donnees[0].timezone+'<p>';
         contenuHtml+='</div>';
         contenuHtml+='</div>';
         contenuHtml+='<div class="row">';
		 contenuHtml+='<div class="col">';
         contenuHtml+='<strong>';
         if(donnees[0].lang=="fr"){ 
         contenuHtml+='Exemple de récitation';}
         else{ 
         contenuHtml+='Recitation sample';}
         contenuHtml+='</strong></br>';
         contenuHtml+='<audio controls>';
	     contenuHtml+=' <source src="resources/images/tutor/recitation/'+donnees[0].recitation+'" type="audio/ogg">';
	     contenuHtml+=' <source src="resources/images/tutor/recitation/'+donnees[0].recitation+'" type="audio/mpeg">';
	     contenuHtml+='Your browser does not support the audio element.';
	     contenuHtml+='</audio>';
         contenuHtml+='</div>';
         contenuHtml+='<div class="col order-12">';
         contenuHtml+='<strong>';
         if(donnees[0].lang=="fr"){ 
          contenuHtml+='Préférences d\'enseignement';}
          else{ 
          contenuHtml+=' Teaching preferences';}
          contenuHtml+='</strong><br>';
         contenuHtml+='<p>'+donnees[0].teach_preference+'</p>';
         contenuHtml+='</div>';
         contenuHtml+='<div class="col order-1">';
         contenuHtml+='<strong>';
         if(donnees[0].lang=="fr"){ 
         contenuHtml+='Médias de communication';}
         else{ 
         contenuHtml+=' Communication media';}
         contenuHtml+=' </strong>';
         contenuHtml+='<p>'+donnees[0].media_cam+'</p>';
         contenuHtml+='</div>';
           
         contenuHtml+='</div>';
		 
		 
         contenuHtml+='<div class="row">';
		 
         contenuHtml+='<div class="col">';
         contenuHtml+='<strong> Riwaya </strong>';
         contenuHtml+='<p>'+donnees[0].riwaya+'</p>';
         contenuHtml+='</div>';
         contenuHtml+='<div class="col order-12">';
         contenuHtml+='<strong>';
         if(donnees[0].lang=="fr"){ 
          contenuHtml+='Sujets vérifiés';}
          else{ 
          contenuHtml+='Verified subjects';}
          contenuHtml+='</strong><br>';
         contenuHtml+='<p>'+donnees[0].subject_verif+'</p>';
         contenuHtml+='</div>';
         contenuHtml+='<div class="col order-1">';
         contenuHtml+='<strong> Certifications (Ijzazat) </strong>';
         contenuHtml+='<p>'+donnees[0].certification+'</p>';
         contenuHtml+='</div>';
         
         contenuHtml+='</div>';
		 contenuHtml+='</div>';
		 
		 document.getElementById("profil_tutor").innerHTML = contenuHtml;
		 document.getElementById("emailTut").value = donnees[0].email;
		 
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
							<a href=""><img src="<%=request.getContextPath()%>/resources/images/logo/logo-white.png" alt="header logo"></a>
						</div>
						<%@ include file="/WEB-INF/views/includes/navbar.jsp" %>
						<div class="mobile-menu hidden-lg hidden-xlg hidden-xx hidden-sp">
						   <a class="mobile-logo" href="#"><img src="<%=request.getContextPath()%>/resources/images/logo/mobile-logo.png" alt="logo"></a>
						 </div>
					</div>
				</div>
		</header><!-- //Header -->
        <section class="cr-section about-area ptb--150 bg--white flower--left-top flower--right-bottom" id="profil_tutor">
					
		</section>
		
		</main><!-- //Page Conent -->
		
		
		<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
       
        <h5 class="modal-title" id="exampleModalLabel"><spring:message code="label.send_msg" /></h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
       <c:if test="${connexionstudent == 1}">
          
          <form action="sendmessage" method="GET">
               <input type="text" id="emailTut" name="emailTut" />
             <br>
          
             <textarea class="form-control" rows="5" name="textmsg">
             </textarea>
          
               <spring:message code="label.send" var="labelsend"></spring:message>
       		<input type="submit" class="btn btn-primary" value="${labelsend }" />
     
         </form>
      
      </c:if>
      
      <c:if test="${connexionstudent != 1}">
        <form action="connexion_student2" method="post">
      
          <div class="form-group">
               <label for="exampleInputEmail1" style="color:#fff;"><spring:message code="label.email_address" /></label>
               <spring:message code="label.enter_mail" var="labelentermail"></spring:message>
       		 <input type="email" class="form-control" name="emailstud" aria-describedby="emailHelp" placeholder="${labelentermail }">
            </div>
            <div class="form-group">
                   <label for="exampleInputPassword1" style="color:#fff;"><spring:message code="label.password" /></label>
             <spring:message code="label.password" var="labelpassword"></spring:message>
       		<input type="password" class="form-control" name="passwordstud" placeholder="${labelpassword }">
            </div>
            <button type="submit" class="btn btn-info">Connexion</button>
			<a style="color:#fff;margin-left:20px;" href="registration" class="btn btn-info"><spring:message code="label.inscription" /></a>
             <a style="color:#fff;margin-left:20px;" href="forgotpassword"><spring:message code="label.forgot_password" /></a>
												
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
			
