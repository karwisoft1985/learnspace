<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
 pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html class="no-js" lang="zxx">
  
   <%@ include file="/WEB-INF/views/includes/header.jsp" %>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/stylesheet.css">
 <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/SimpleStarRating.css">
   <script src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
 
   <script src="<%=request.getContextPath()%>/resources/js_webservices/gestiontutors/tutors.js"></script>

<script>
$(document).ready(function(){
	var CheminComplet = window.location.pathname;
	var id=parseInt(CheminComplet.substring( CheminComplet.indexOf( "profil_tutor/" )+13 ,CheminComplet.length));	
	$.getJSON(id+"/getTutorById",
		function(donnees){
		var contenuHtml='';
		var contenuHtmln='';
		var contenuHtmlp='<br><br>';
		contenuHtmlp+='<div class="container">';
		contenuHtmlp+='<div class="row">';
		contenuHtmlp+='<div class="col order-12">';
		contenuHtmlp+='<img src="../resources/images/tutor/'+donnees[0].picture+'" width="200px" height="200px" style="border-radius:100%;" />';
		contenuHtmlp+='</div></div></div>';
		contenuHtmln+='<div class="container">';
		contenuHtmln+='<div class="row">';
		contenuHtmln+='<div class="col order-12">';
		contenuHtmln+='<h2>'+donnees[0].name+'</h2>';
		contenuHtmln+='</div>';
		contenuHtmln+='</div></div>';
		contenuHtml+='<br><br>';
		contenuHtml+='<div class="container">';
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
         contenuHtml+='<div class="col order-1">';
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
		contenuHtml+='<div class="col order-1">';
        contenuHtml+='<label><strong>';
        if(donnees[0].lang=="fr"){ 
        contenuHtml+='Taux horaire';}
        else{ 
        contenuHtml+='Hourly rate';}
        contenuHtml+=' </strong></label>';
		contenuHtml+='<h1 class="display-6" style="color:#bf470d;font-size:40px;">'+donnees[0].hourly+'</h1>';
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
		 contenuHtml+='<div class="col order-12">';
         contenuHtml+='<strong>';
         if(donnees[0].lang=="fr"){ 
         contenuHtml+='Exemple de récitation';}
         else{ 
         contenuHtml+='Recitation sample';}
         contenuHtml+='</strong></br>';
         if(donnees[0].recitation != ""){
         contenuHtml+='<audio controls>';
	     contenuHtml+=' <source src="../resources/images/tutor/recitation/'+donnees[0].recitation+'" type="audio/ogg">';
	     contenuHtml+=' <source src="../resources/images/tutor/recitation/'+donnees[0].recitation+'" type="audio/mpeg">';
	     contenuHtml+='Your browser does not support the audio element.';
	     contenuHtml+='</audio>';
         }
         contenuHtml+='</div>';
         contenuHtml+='</div>';
         contenuHtml+='<div class="row">';
		 contenuHtml+='<div class="col order-12">';
         contenuHtml+='<strong> Riwaya: </strong>';
         contenuHtml+='<p>'+donnees[0].riwaya+'</p>';
         contenuHtml+='</div>';
         contenuHtml+='</div>';
         contenuHtml+='<div class="row">';
		 contenuHtml+='<div class="col order-12">';
         contenuHtml+='<strong> Certifications (Ijzazat) </strong>';
         contenuHtml+='<p>'+donnees[0].certification+'</p>';
         contenuHtml+='</div>';
         contenuHtml+='</div>';
         contenuHtml+='<div class="row">';
		 contenuHtml+='<div class="col order-12">';
         contenuHtml+='<strong>';
         if(donnees[0].lang=="fr"){ 
         contenuHtml+='Expériences précedentes';}
         else{ 
         contenuHtml+='Previous experiences';}
         contenuHtml+='</strong>';
         contenuHtml+='<p>'+donnees[0].preview_experience+'</p>';
         contenuHtml+='</div>';   
         contenuHtml+='</div>'; 
		 contenuHtml+='</div>';
		 
		 document.getElementById("pic_tutor").innerHTML = contenuHtmlp;
		 document.getElementById("name_tutor").innerHTML = contenuHtmln;
			document.getElementById("profil_tutor").innerHTML = contenuHtml;
		 document.getElementById("emailTut").value = donnees[0].email;		
		 document.getElementById("emailTutrv").value = donnees[0].email;	 
		 document.getElementById("idTut").value = id;
		 document.getElementById("idTutor").value = id;
		
		});

});	

$(function() {
	$('input[type=submit]').click(function() {		
$('h6').html('<span class="stars">'+parseFloat($('input[name=amount]').val())+'</span>');
	$('span.stars').stars();
});    		
$('input[type=submit]').click();
});


	$.fn.stars = function() {
		return $(this).each(function() {
			$(this).html($('<span />').width(Math.max(0, (Math.min(5, parseFloat($(this).html())))) * 16));
		});
	}
</script>
<style type="text/css">
		span.stars, span.stars span {
			display: block;
			background: url("../resources/images/tutor/stars.png") 0 -16px repeat-x;
			width: 80px;
			height: 16px;
		}
		span.stars span {
			background-position: 0 0;
		}
	</style>
<script>
$(document).ready(function(){
		$('#formreview').captcha();
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
                
<div id="pic_tutor"></div>	 
 <c:if  test="${nbreview != 0}">    
 <div class="container" style="margin-left:10%;">       
<span style="display:none">
<input type="text" name="amount" id="amount" value="${review/nbreview}"  />
<input type="submit" value="update"></span>
<h6><span class="stars"></span></h6>	
</div>
</c:if>
	<div id="name_tutor">	</div>	
	 <div class="container" style="margin-left:5%;">       	
	<button class="btn btn-success"  data-toggle="modal" data-target="#exampleModalsmsg" style="padding-left:30px;padding-right:30px;font-size:20px;margin-right:15px">Contact</button>
	  <c:if test="${connexionstudent == 0}">
      <button class="btn btn-info"  data-toggle="modal" data-target="#exampleModalsrvw" style="padding-left:30px;padding-right:30px;font-size:20px;">Review</button>		
	</c:if>
	 <c:if test="${connexionstudent != 0}">
	 	<c:if test="${type == 'student'}">
	<c:if  test="${reviewed == 0}"> 
      <button class="btn btn-info"  data-toggle="modal" data-target="#exampleModalsrvw" style="padding-left:30px;padding-right:30px;font-size:20px;">Review</button>		
	</c:if>
	<c:if  test="${reviewed != 0}"> 

      <strong style="color:green;font-size:20px">Review <i class="fa fa-check"></i></strong>		
	</c:if>
	</c:if>
	</c:if>
	</div>
	<div id="profil_tutor">	</div>	
<c:if  test="${nbreview != 0}">  
	<hr>	
  <div class="container">
			<h3>Reviews</h3>
<c:set var="stats" value="${namestud}" />
<c:forEach items="${reviews}" varStatus="i">
<c:set var="name" value="${namestud[i.index].name}"/>	          
        <div class="row">
		<div class="col order-12">  
	<p><strong>Review by: </strong>${name}</p>
       </div></div> 
      <div class="row">
     <div class="col order-12"> 
<strong>Overall stars: </strong>
<span class="rating" data-default-rating="${reviews[i.index].note}" disabled></span>
</div></div>
 <div class="row"><div class="col order-12"><p><strong> Subject: </strong>${reviews[i.index].subject}</p></div></div>
 <div class="row">
 <div class="col order-12">
<p><strong>Comments: </strong> <textarea style="width: 70%;padding: .375rem .75rem;color: #495057;border: 1px solid #ced4da;border-radius: .25rem;position:absolute" disabled>${reviews[i.index].description}</textarea></p>
</div></div>
<hr>
</c:forEach>
     </div>
     </c:if>
		</section>
		
		
		</main><!-- //Page Conent -->
		
		
		<!-- Modal -->
<div class="modal fade" id="exampleModalsmsg" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
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
          
          <form action="sendmessage" method="GET" name="formmsg">
               <input type="hidden" id="emailTut" name="emailTut" />
          	<input type="hidden" id="idTutor" name="idTut" />
          	<input type="hidden" id="nom_Student" name="nom_Student" value="${nom_Student}" />
          	<input type="hidden" id="id_student" name="id_student"  value="${id_student}"/>
             <textarea class="form-control" rows="5" name="textmsg">
             </textarea>
          <br><br>
  <spring:message code="label.send" var="labelsend"></spring:message>      
             <button type="submit" class="btn btn-primary" style="width:100%" >${labelsend}</button>
    
         </form>
      
      </c:if>
      <c:if test="${connexionstudent == 0}">
        <form action="connexion_student2" method="post">
      <center><h5 style="color:red"><spring:message code="label.msg_login" />!</h5></center>
          <div class="form-group">
               <label for="exampleInputEmail1" style="color:#fff;"><spring:message code="label.email_address" /></label>
                    <spring:message code="label.enter_mail" var="labelentermail"></spring:message>      
            <input type="email" class="form-control" name="emailstud" aria-describedby="emailHelp" placeholder="${labelentermail}" required />
            </div>
            <div class="form-group">
                   <label for="exampleInputPassword1" style="color:#fff;"><spring:message code="label.password" /></label>
                            <spring:message code="label.password" var="labelpassword"></spring:message>      
            <input type="password" class="form-control" name="passwordstud" placeholder="${labelpassword}" required />
            </div>
            <button type="submit" class="btn btn-info"><spring:message code="label.login" /></button>
			<a style="color:#fff;margin-left:20px;" href="<%=request.getContextPath()%>/registration" class="btn btn-info"><spring:message code="label.sign_up" /></a>            									
         </form>
      </c:if>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal"><spring:message code="label.close" /></button>
        
      </div>
      
    </div>
  </div>
</div>
		
		<!-- Modal -->
<div class="modal fade" id="exampleModalsrvw" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
       
        <h5 class="modal-title" id="exampleModalLabel"><spring:message code="label.rvw" /></h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
       <c:if test="${connexionstudent != 0}">
          
          <form action="sendreview" method="GET" id="formreview">
           <input type="hidden" id="idTut" name="idTut" />
               <input type="hidden" id="emailTutrv" name="emailTutrv" />
          	<input type="hidden" id="id_student" name="id_student"  value="${id_student}"/>
    <input type="hidden" id="nomStudent" name="nomStudent" value="${nom_Student}" />
          	
     <p style="margin: 0 0 1.5em; padding: 0;">
          <span class="starRating">
   <input id="rating5" type="radio" name="rating" value="5">
        <label for="rating5">5</label>
        <input id="rating4" type="radio" name="rating" value="4">
        <label for="rating4">4</label>
        <input id="rating3" type="radio" name="rating" value="3">
        <label for="rating3">3</label>
        <input id="rating2" type="radio" name="rating" value="2">
        <label for="rating2">2</label>
        <input id="rating1" type="radio" name="rating" value="1">
        <label for="rating1">1</label>
      </span>
        </p>
         <spring:message code="label.subject" var="labelsubject"></spring:message>  
        <input class="form-control" type="text" name="textsbj" placeholder="${labelsubject}" required/>
        <br><spring:message code="label.cmnt" var="labelcmnt"></spring:message> 
        <textarea class="form-control" rows="5" name="textcomment" placeholder="${labelcmnt}" required>
        </textarea>
          <br><br>
          <spring:message code="label.sbmt" var="labelsubmit"></spring:message> 
             <input type="submit" class="btn btn-primary" value="${labelsubmit}" />
     
         </form>
      
      </c:if>
      
      <c:if test="${connexionstudent == 0}">
        <form action="connexion_student2" method="post">
      <center><h5 style="color:red"><spring:message code="label.msg_rvw" />!</h5></center>
          <div class="form-group">
               <label for="exampleInputEmail1" style="color:#fff;"><spring:message code="label.email_address" /></label>
                    <spring:message code="label.enter_mail" var="labelentermail"></spring:message>      
            <input type="email" class="form-control" name="emailstud" aria-describedby="emailHelp" placeholder="${labelentermail}" required />
            </div>
            <div class="form-group">
                   <label for="exampleInputPassword1" style="color:#fff;"><spring:message code="label.password" /></label>
                            <spring:message code="label.password" var="labelpassword"></spring:message>      
            <input type="password" class="form-control" name="passwordstud" placeholder="${labelpassword}" required />
            </div>
            <button type="submit" class="btn btn-info"><spring:message code="label.login" /></button>
			<a style="color:#fff;margin-left:20px;" href="<%=request.getContextPath()%>/registration" class="btn btn-info"><spring:message code="label.sign_up" /></a>            									
         </form>
      </c:if>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal"><spring:message code="label.close" /></button>
        
      </div>
      
    </div>
  </div>
</div>
  <script src="<%=request.getContextPath()%>/resources/js/SimpleStarRating.js"></script>
        <script>
            var ratings = document.getElementsByClassName('rating');

            for (var i = 0; i < ratings.length; i++) {
                var r = new SimpleStarRating(ratings[i]);

                ratings[i].addEventListener('rate', function(e) {
                    console.log('Rating: ' + e.detail);
                });
            }
        </script>
           <%@ include file="/WEB-INF/views/includes/footer.jsp" %>
			
