<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!doctype html>
<html class="no-js" lang="zxx">
	<%@ include file="/WEB-INF/views/includes/header.jsp" %>
	
	<script src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
    <script src="<%=request.getContextPath()%>/resources/js_webservices/gestiontutors/tutors.js"></script>
    
    <script>
    
    $(document).ready(function(){
    	
    	var gender = sessionStorage.getItem("gender-rech");
    	var subject = sessionStorage.getItem("sub-rech");
    	var location = sessionStorage.getItem("loc-rech");
    	var language = sessionStorage.getItem("lan-rech");
    	if(gender == '' && subject =='' && location =='' && language ==''){
        var link="listtutors";
        }
    	else if(gender == '' && subject !='' && location !='' && language !=''){
    	var link="searchtutorsel/"+subject+"/"+location+"/"+language;
    	}
    	else if(gender != '' && subject =='' && location !='' && language !=''){
        var link="searchtutorses/"+gender+"/"+location+"/"+language;
        }
    	else if(gender != '' && subject !='' && location =='' && language !=''){
        var link="searchtutorselo/"+gender+"/"+subject+"/"+language;
        }
    	else if(gender != '' && subject !='' && location !='' && language ==''){
        var link="searchtutorselg/"+gender+"/"+subject+"/"+location;
        }
    	else if(gender == '' && subject =='' && location !='' && language !=''){
        var link="searchtutorsegs/"+location+"/"+language;
        }
    	else if(gender != '' && subject =='' && location =='' && language !=''){
        var link="searchtutorseslo/"+gender+"/"+language;
        }
    	else if(gender != '' && subject !='' && location =='' && language ==''){
      	var link="searchtutorselol/"+gender+"/"+subject;
        }
    	else if(gender != '' && subject =='' && location !='' && language ==''){
        var link="searchtutorseslg/"+gender+"/"+location;
        }
    	else if(gender == '' && subject !='' && location !='' && language ==''){
        var link="searchtutorseglg/"+subject+"/"+location;
        }
    	else if(gender == '' && subject !='' && location =='' && language !=''){
        var link="searchtutorseglo/"+subject+"/"+language;
        }
    	else if(gender != '' && subject =='' && location =='' && language ==''){
            var link="searchtutorsg/"+gender;
            }
    	else if(gender == '' && subject !='' && location =='' && language ==''){
            var link="searchtutorssub/"+subject;
            }
    	else if(gender == '' && subject =='' && location !='' && language ==''){
            var link="searchtutorslo/"+location;
            }
    	else if(gender == '' && subject =='' && location =='' && language !=''){
            var link="searchtutorslg/"+language;
            }
       	else{
    	var link="searchtutors/"+gender+"/"+subject+"/"+location+"/"+language;
    	}
    	$.getJSON(link,
        function(donnees){
    	var contenuHtml1='';
    	var contenuHtml='<div class="container">';
        if(donnees.length > 0){
    	if(donnees.length > 25){
         contenuHtml+='<div class="row">';
    	for(var i = 0; i < 25 ; i++){	
        	           contenuHtml+='<div class="col-md-6 col-sm-6 col-xs-12">';
                       contenuHtml+='<figure class="team-member wow fadeInUp" style="visibility: visible; animation-name: fadeInUp;">';
                       contenuHtml+='<div class="team-member__thumb">';
                       contenuHtml+='<div class="hexagon">';
                       contenuHtml+='<div class="hexagon__inner1">';
                       contenuHtml+='<div class="hexagon__inner2">';
                       contenuHtml+='<img src="resources/images/tutor/'+donnees[i].picture+'">';
                       contenuHtml+='</div>';
                       contenuHtml+='</div>';
                       contenuHtml+='</div>';
                       contenuHtml+='</div>';
                       contenuHtml+='<figcaption class="team-member__content">';
                       contenuHtml+='<h3>'+donnees[i].name+'</h3>';
                       contenuHtml+='<h5>'+donnees[i].hourly+'</h5>';
                       contenuHtml+='<a href="profil_tutor/'+donnees[i].id+'"><button class="btn btn_primay">';
                       if(donnees[0].lang=="fr"){ 
                       contenuHtml+='Voir le profil';}
                       else{ 
                       contenuHtml+='View Profile';}                       
                       contenuHtml+='</button></a>';
                       contenuHtml+='</figcaption>';
                       contenuHtml+='</figure>';
                       contenuHtml+='</div>';
        }
    	 contenuHtml+='</div>';
    	 contenuHtml+='<span id="list-tutors-none" style="display:none;">';
 	     contenuHtml+='<div class="row">';
 	     for ( var i = 25; i < donnees.length; i++){
 	        contenuHtml+='<div class="col-md-6 col-sm-6 col-xs-12">';
            contenuHtml+='<figure class="team-member wow fadeInUp" style="visibility: visible; animation-name: fadeInUp;">';
            contenuHtml+='<div class="team-member__thumb">';
            contenuHtml+='<div class="hexagon">';
            contenuHtml+='<div class="hexagon__inner1">';
            contenuHtml+='<div class="hexagon__inner2">';
            contenuHtml+='<img src="resources/images/tutor/'+donnees[i].picture+'">';
            contenuHtml+='</div>';
            contenuHtml+='</div>';
            contenuHtml+='</div>';
            contenuHtml+='</div>';
            contenuHtml+='<figcaption class="team-member__content">';
            contenuHtml+='<h3>'+donnees[i].name+'</h3>';
            contenuHtml+='<h5>'+donnees[i].hourly+'</h5>';
            contenuHtml+='<a href="profil_tutor/'+donnees[i].id+'"><button class="btn btn_primay">';
            if(donnees[0].lang=="fr"){ 
            contenuHtml+='Voir le profil';}
            else{ 
            contenuHtml+='View Profile';}                                      
            contenuHtml+='</button></a>';
            contenuHtml+='</figcaption>';
            contenuHtml+='</figure>';
            contenuHtml+='</div>';
 	     }

  	    contenuHtml+='</div>'; 
  	  contenuHtml1+='<br><br>';
  	contenuHtml1+='<div id="" style="text-align:center;">';
  	contenuHtml1+='<a href="javascript:listtutorsAll();" class="btn btn-primary" style="padding:20px;">';
    if(donnees[0].lang=="fr"){ 
        contenuHtml1+='Charger plus';}
        else{ 
        contenuHtml1+='Load More';} 	
  	contenuHtml1+='</a></div>';
        }
    	else{
          	 contenuHtml+='<div class="row">';
    		for(var i = 0; i < donnees.length ; i++){
    		 contenuHtml+='<div class="col-md-6 col-sm-6 col-xs-12">';
             contenuHtml+='<figure class="team-member wow fadeInUp" style="visibility: visible; animation-name: fadeInUp;">';
             contenuHtml+='<div class="team-member__thumb">';
             contenuHtml+='<div class="hexagon">';
             contenuHtml+='<div class="hexagon__inner1">';
             contenuHtml+='<div class="hexagon__inner2">';
             contenuHtml+='<img src="resources/images/tutor/'+donnees[i].picture+'">';
             contenuHtml+='</div>';
             contenuHtml+='</div>';
             contenuHtml+='</div>';
             contenuHtml+='</div>';
             contenuHtml+='<figcaption class="team-member__content">';
             contenuHtml+='<h3>'+donnees[i].name+'</h3>';
             contenuHtml+='<h5>'+donnees[i].hourly+'</h5>';
             contenuHtml+='<a href="profil_tutor/'+donnees[i].id+'"><button class="btn btn_primay">';
             if(donnees[0].lang=="fr"){ 
              contenuHtml+='Voir le profil';}
              else{ 
              contenuHtml+='View Profile';} 
             contenuHtml+='</button></a>';
             contenuHtml+='</figcaption>';
             contenuHtml+='</figure>';
             contenuHtml+='</div>';	
    		}
            contenuHtml+='</div>';
    	}
        }
        else{
        	contenuHtml+='<br><h4>';
        	if(donnees[0].lang=="fr"){ 
            contenuHtml+='Aucun tuteur trouvé avec ces critères';}
            else{ 
            contenuHtml+='No tutor with these criteria';} 
        	contenuHtml+='</h4><br>';	
        }
           contenuHtml+='</div>';
           document.getElementById("search_tutors").innerHTML = contenuHtml;
           document.getElementById("btn-load").innerHTML = contenuHtml1;
           
        });

    });	 
    </script>
   <script>
    function listtutorsAll(){    	    	
    	document.getElementById("list-tutors-none").style.display = "block" ;   	
    	document.getElementById("btn-load").style.display = "none" ;
    }
    </script>  
	<body>
		<!--[if lte IE 9]>
			<p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="https://browsehappy.com/">upgrade your browser</a> to improve your experience and security.</p>
		<![endif]-->
        <!-- Add your site or application content here -->
		<div class="fakeloader"></div>
		<!-- Main wrapper -->
		<div class="wrapper" id="wrapper">
			
			<!-- Header -->
			<header id="header-area" class="header-area fixed--header sticky--header bg--dark--light">
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
            
			<!-- Page Conent -->
			<main class="page-content">
				
				  <!-- Checkout Section Start-->
				  <div class="checkout-section cr-section pt--150 pb--120 bg--white">
				
				   
				   <div class="container">
				        <div class="row">
				          <div id="search_tutors">
				             
				           </div>   
				        </div>
				        <span id="btn-load"></span>				       
				   </div><!-- Checkout Section End-->
				   
				 </div>

			</main><!-- //Page Conent -->

			
			<%@ include file="/WEB-INF/views/includes/footer.jsp" %>
