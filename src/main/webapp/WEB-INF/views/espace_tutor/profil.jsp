<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!doctype html>
<html class="no-js" lang="zxx">
	<%@ include file="/WEB-INF/views/includes/header.jsp" %>
	<script src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
	<script>
$(document).ready(function(){	    
	    $.getJSON("webservice_profil_dashboard_tutor",
	    function(donnees){
	    		 
	    var contenuHtml1='<br><br>';
		contenuHtml1+='<div class="container">';
		contenuHtml1+='<div class="row">';
		contenuHtml1+='<div class="col order-12">';
		contenuHtml1+='<img src="resources/images/tutor/'+donnees[0].picture+'" width="200px" height="200px" style="border-radius:100%;" />';

		contenuHtml1+='<form action="uploadphototutor" method="POST" enctype="multipart/form-data">';
		contenuHtml1+='<input type="hidden" value="'+donnees[0].id+'" name="idimage" />';
		contenuHtml1+='<input type="file" name="image" required/><br>';
		if(donnees[0].lang=="fr"){ 
	    contenuHtml1+='<input type="submit" value="Envoyer" class="btn btn-info" style="width:220px" style="float:left;"/>';
		}else{
		contenuHtml1+='<input type="submit" value="Send" class="btn btn-info" style="width:220px" style="float:left;"/>';
		}
	    contenuHtml1+='</form>';
		
		contenuHtml1+='</div>';
		contenuHtml1+='</div>';
		contenuHtml1+='</div>';
		
		var contenuHtml='<br><br>';		   
		contenuHtml+='<button type="button" class="btn btn-warning" style="color:#fff;font-weight:bold;float:right;" data-toggle="modal" data-target="#exampleModal"><i class="fa fa-pencil" style="color:#fff"></i>';
        if(donnees[0].lang=="fr"){ 
            contenuHtml+=' MODIFIER MON PROFIL';}
            else{ 
            contenuHtml+=' UPDATE MY PROFILE';}
        contenuHtml+='</button>';
		contenuHtml+='<br><br><br>';
		contenuHtml+='<div class="container">';
		contenuHtml+='<div class="row">';
		contenuHtml+='<div class="col order-12">';
		contenuHtml+='<h2>'+donnees[0].name+'</h2>';
		contenuHtml+='</div>';
        contenuHtml+='</div>';
		contenuHtml+='<br>';
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
         contenuHtml+='<div class="col">';
         contenuHtml+='<strong>';
         if(donnees[0].lang=="fr"){ 
         contenuHtml+='Taux horaire';}
         else{ 
         contenuHtml+='Hourly rate';}
         contenuHtml+=' </strong><br>';
 		contenuHtml+='<h1 class="display-6" style="color:#bf470d;font-size:40px;">'+donnees[0].hourly+'</h1>';
 		contenuHtml+='</div>';
         contenuHtml+='</div>';
 		contenuHtml+='<div class="row">';
        contenuHtml+='<div class="col">';
        contenuHtml+='<strong>';
        if(donnees[0].lang=="fr"){ 
        contenuHtml+='Adresse e-mail';}
        else{ 
        contenuHtml+='Email address';}
        contenuHtml+=' </strong> <br>';
        contenuHtml+='<p>'+donnees[0].email+'</p>';
        contenuHtml+='</div>';
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
         contenuHtml+='<div class="col">';
         contenuHtml+='<strong>';
         if(donnees[0].lang=="fr"){ 
         contenuHtml+='Date d\'adhésion';}
         else{ 
         contenuHtml+='Date of membership';}
         contenuHtml+='</strong><br>';
         contenuHtml+='<p>'+donnees[0].startdate+'<p>';
         contenuHtml+='</div>';
         contenuHtml+='</div>';
 		contenuHtml+='<div class="row">';
        contenuHtml+='<div class="col">';
        contenuHtml+='<label><strong>';
        if(donnees[0].lang=="fr"){ 
        contenuHtml+='Sujets (je peux enseigner)';}
        else{ 
        contenuHtml+='Subject (I can teach)';}
        contenuHtml+=' </strong> </label>';
        contenuHtml+='<p>'+donnees[0].subject_icanteach+'</p>';
        contenuHtml+='</div>';
         contenuHtml+='<div class="col">';
         contenuHtml+='<strong>';
         if(donnees[0].lang=="fr"){ 
          contenuHtml+='Préférences d\'enseignement';}
          else{ 
          contenuHtml+=' Teaching preferences';}
          contenuHtml+='</strong><br>';
         contenuHtml+='<p>'+donnees[0].teach_preference+'</p>';
         contenuHtml+='</div>';
         contenuHtml+='<div class="col">';
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
        contenuHtml+='À propos de moi';}
        else{ 
        contenuHtml+='About me';}
        contenuHtml+='</strong></label>';
         contenuHtml+='<p>'+donnees[0].about+'</p>';
		 contenuHtml+='</div>';
		 contenuHtml+='</div>';
			contenuHtml+='<div class="row">';
			contenuHtml+='<div class="col order-12">';
	         contenuHtml+='<label><strong>';
	         if(donnees[0].lang=="fr"){ 
	         contenuHtml+='Exemple de récitation';}
	         else{ 
	         contenuHtml+='Recitation sample';}
	         contenuHtml+='</strong></label>';
	         if(donnees[0].recitation != ""){
	         contenuHtml+='<audio controls>';
	        contenuHtml+=' <source src="resources/images/tutor/recitation/'+donnees[0].recitation+'" type="audio/ogg">';
	        contenuHtml+=' <source src="resources/images/tutor/recitation/'+donnees[0].recitation+'" type="audio/mpeg">';
	         contenuHtml+='Your browser does not support the audio element.';
	         contenuHtml+='</audio>';
	         }
			 contenuHtml+='</div>';
			 contenuHtml+='</div>';
   		contenuHtml+='<div class="row">';
		 contenuHtml+='<div class="col order-12">';
         contenuHtml+='<strong> Riwaya </strong>';
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
		 contenuHtml+='<div class="col">';
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
		 
		 document.getElementById("tutor-profil").innerHTML = contenuHtml;
		 document.getElementById("tutor-picture").innerHTML = contenuHtml1;
		 document.getElementById("mod-name").value = donnees[0].name;
		 document.getElementById("mod-age").value = donnees[0].age;
	document.getElementById("mod-riwaya").value = donnees[0].riwaya;
		 document.getElementById("mod-aboutme").value = donnees[0].about;
		 document.getElementById("mod-password").value = donnees[0].password;
		document.getElementById("mod-hourly").value = donnees[0].hourly;
		 document.getElementById("mod-previous-exp").value = donnees[0].preview_experience;
		 document.getElementById("mod-certif").value = donnees[0].certification;
		 document.getElementById("mod-loc-rech").options[0].value = donnees[0].location;
		 document.getElementById("mod-loc-rech").options[0].text = donnees[0].location;
		document.getElementById("mod-subj").options[0].value = donnees[0].subject_icanteach;
		 document.getElementById("mod-subj").options[0].text = donnees[0].subject_icanteach;
		 document.getElementById("mod-com-media").options[0].value = donnees[0].media_cam;
		 document.getElementById("mod-com-media").options[0].text = donnees[0].media_cam;
		 document.getElementById("mod-language").options[0].value = donnees[0].language;
		 document.getElementById("mod-language").options[0].text = donnees[0].language;
		 document.getElementById("mod-timezone").options[0].value = donnees[0].timezone;
		 document.getElementById("mod-timezone").options[0].text = donnees[0].timezone;
		 document.getElementById("mod-preference").options[0].value = donnees[0].teach_preference;
		 document.getElementById("mod-preference").options[0].text = donnees[0].teach_preference;
		 document.getElementById("mod-gender").options[0].value = donnees[0].gender;
		 document.getElementById("mod-gender").options[0].text = donnees[0].gender;
		  
	    });
});	
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
						
						<%@ include file="/WEB-INF/views/includes/navbar_dashboard.jsp" %>
						
						  <div class="mobile-menu hidden-lg hidden-xlg hidden-xx hidden-sp">
							   <a class="mobile-logo" href="index"><img src="<%=request.getContextPath()%>/resources/images/logo/mobile-logo.png" alt="logo"></a>
						  </div>
						
					</div>
				</div>
			</header><!-- //Header --> 
            
			<!-- Page Conent -->
			
			<!-- Page Conent -->
			<main class="page-content">
				
				<!-- Checkout Section Start-->
				<div class="checkout-section cr-section pt--150 pb--120 bg--white">
				
				   
				    <div class="container">
				        <div class="row">
				             
				            <div class="col-lg-3 col-12 mb-30">
				               <br><br>
				                <!-- Checkout Accordion Start -->
				                <div id="checkout-accordion">
				                    <!-- Checkout Method -->
				                    <div class="single-accordion" id="tutor-picture">				                        
				                    </div>
				                </div><!-- Checkout Accordion Start -->
				                
				            </div>
				            
				            <!-- Order Details -->
				            <div class="col-lg-9 col-12 mb-30" id="tutor-profil">
				                 
								 
								 
				            </div>
				            
				        </div>
				    </div>
				</div><!-- Checkout Section End-->

			</main><!-- //Page Conent -->
			
			<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel"><spring:message code="label.update_profil" /></h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
    
    
    <form method="POST" action="UpdateTutor"  enctype="multipart/form-data" >
    
    
    <div class="form-row">
    
    <div class="form-group col-md-12">
       <label for="inputEmail4"><spring:message code="label.name" /> * </label>
       <input type="text" class="form-control" id="mod-name" name="mod-name" placeholder="Name" required />
    </div>
    
     <div class="form-group col-md-12">
       <label for="inputEmail4"><spring:message code="label.gender" /></label>
      <select name="mod-gender" id="mod-gender" class="form-control">     
 <option selected="selected"></option>
<option><spring:message code="label.opt1gender" /></option>
<option><spring:message code="label.opt2gender" /></option>
</select>
  </div>
    
     <div class="form-group col-md-12">
       <label for="inputEmail4"><spring:message code="label.age" /> </label>
       <input type="number" class="form-control" id="mod-age" name="mod-age" placeholder="Age" />
    </div>
   
   </div>
   
 <div class="form-row">
 
<div class="form-group col-md-12">
       <label for="inputEmail4"><spring:message code="label.password" /> *</label>
       <input type="text" class="form-control" id="mod-password" name="mod-password" placeholder="Password" required />
</div>

    <div class="form-group col-md-12">
    <label ><spring:message code="label.country" /></label>
    <select name="mod-loc-rech" id="mod-loc-rech" class="form-control">
      
 <option selected="selected"></option>

<option value="Afganistan">Afghanistan</option>
<option value="Albania">Albania</option>
<option value="Algeria">Algeria</option>
<option value="American Samoa">American Samoa</option>
<option value="Andorra">Andorra</option>
<option value="Angola">Angola</option>
<option value="Anguilla">Anguilla</option>
<option value="Antigua & Barbuda">Antigua & Barbuda</option>
<option value="Argentina">Argentina</option>
<option value="Armenia">Armenia</option>
<option value="Aruba">Aruba</option>
<option value="Australia">Australia</option>
<option value="Austria">Austria</option>
<option value="Azerbaijan">Azerbaijan</option>
<option value="Bahamas">Bahamas</option>
<option value="Bahrain">Bahrain</option>
<option value="Bangladesh">Bangladesh</option>
<option value="Barbados">Barbados</option>
<option value="Belarus">Belarus</option>
<option value="Belgium">Belgium</option>
<option value="Belize">Belize</option>
<option value="Benin">Benin</option>
<option value="Bermuda">Bermuda</option>
<option value="Bhutan">Bhutan</option>
<option value="Bolivia">Bolivia</option>
<option value="Bonaire">Bonaire</option>
<option value="Bosnia & Herzegovina">Bosnia & Herzegovina</option>
<option value="Botswana">Botswana</option>
<option value="Brazil">Brazil</option>
<option value="British Indian Ocean Ter">British Indian Ocean Ter</option>
<option value="Brunei">Brunei</option>
<option value="Bulgaria">Bulgaria</option>
<option value="Burkina Faso">Burkina Faso</option>
<option value="Burundi">Burundi</option>
<option value="Cambodia">Cambodia</option>
<option value="Cameroon">Cameroon</option>
<option value="Canada">Canada</option>
<option value="Canary Islands">Canary Islands</option>
<option value="Cape Verde">Cape Verde</option>
<option value="Cayman Islands">Cayman Islands</option>
<option value="Central African Republic">Central African Republic</option>
<option value="Chad">Chad</option>
<option value="Channel Islands">Channel Islands</option>
<option value="Chile">Chile</option>
<option value="China">China</option>
<option value="Christmas Island">Christmas Island</option>
<option value="Cocos Island">Cocos Island</option>
<option value="Colombia">Colombia</option>
<option value="Comoros">Comoros</option>
<option value="Congo">Congo</option>
<option value="Cook Islands">Cook Islands</option>
<option value="Costa Rica">Costa Rica</option>
<option value="Cote DIvoire">Cote D'Ivoire</option>
<option value="Croatia">Croatia</option>
<option value="Cuba">Cuba</option>
<option value="Curaco">Curacao</option>
<option value="Cyprus">Cyprus</option>
<option value="Czech Republic">Czech Republic</option>
<option value="Denmark">Denmark</option>
<option value="Djibouti">Djibouti</option>
<option value="Dominica">Dominica</option>
<option value="Dominican Republic">Dominican Republic</option>
<option value="East Timor">East Timor</option>
<option value="Ecuador">Ecuador</option>
<option value="Egypt">Egypt</option>
<option value="El Salvador">El Salvador</option>
<option value="Equatorial Guinea">Equatorial Guinea</option>
<option value="Eritrea">Eritrea</option>
<option value="Estonia">Estonia</option>
<option value="Ethiopia">Ethiopia</option>
<option value="Falkland Islands">Falkland Islands</option>
<option value="Faroe Islands">Faroe Islands</option>
<option value="Fiji">Fiji</option>
<option value="Finland">Finland</option>
<option value="France">France</option>
<option value="French Guiana">French Guiana</option>
<option value="French Polynesia">French Polynesia</option>
<option value="French Southern Ter">French Southern Ter</option>
<option value="Gabon">Gabon</option>
<option value="Gambia">Gambia</option>
<option value="Georgia">Georgia</option>
<option value="Germany">Germany</option>
<option value="Ghana">Ghana</option>
<option value="Gibraltar">Gibraltar</option>
<option value="Great Britain">Great Britain</option>
<option value="Greece">Greece</option>
<option value="Greenland">Greenland</option>
<option value="Grenada">Grenada</option>
<option value="Guadeloupe">Guadeloupe</option>
<option value="Guam">Guam</option>
<option value="Guatemala">Guatemala</option>
<option value="Guinea">Guinea</option>
<option value="Guyana">Guyana</option>
<option value="Haiti">Haiti</option>
<option value="Hawaii">Hawaii</option>
<option value="Honduras">Honduras</option>
<option value="Hong Kong">Hong Kong</option>
<option value="Hungary">Hungary</option>
<option value="Iceland">Iceland</option>
<option value="India">India</option>
<option value="Indonesia">Indonesia</option>
<option value="Iran">Iran</option>
<option value="Iraq">Iraq</option>
<option value="Ireland">Ireland</option>
<option value="Isle of Man">Isle of Man</option>
<option value="Israel">Israel</option>
<option value="Italy">Italy</option>
<option value="Jamaica">Jamaica</option>
<option value="Japan">Japan</option>
<option value="Jordan">Jordan</option>
<option value="Kazakhstan">Kazakhstan</option>
<option value="Kenya">Kenya</option>
<option value="Kiribati">Kiribati</option>
<option value="Korea North">Korea North</option>
<option value="Korea Sout">Korea South</option>
<option value="Kuwait">Kuwait</option>
<option value="Kyrgyzstan">Kyrgyzstan</option>
<option value="Laos">Laos</option>
<option value="Latvia">Latvia</option>
<option value="Lebanon">Lebanon</option>
<option value="Lesotho">Lesotho</option>
<option value="Liberia">Liberia</option>
<option value="Libya">Libya</option>
<option value="Liechtenstein">Liechtenstein</option>
<option value="Lithuania">Lithuania</option>
<option value="Luxembourg">Luxembourg</option>
<option value="Macau">Macau</option>
<option value="Macedonia">Macedonia</option>
<option value="Madagascar">Madagascar</option>
<option value="Malaysia">Malaysia</option>
<option value="Malawi">Malawi</option>
<option value="Maldives">Maldives</option>
<option value="Mali">Mali</option>
<option value="Malta">Malta</option>
<option value="Marshall Islands">Marshall Islands</option>
<option value="Martinique">Martinique</option>
<option value="Mauritania">Mauritania</option>
<option value="Mauritius">Mauritius</option>
<option value="Mayotte">Mayotte</option>
<option value="Mexico">Mexico</option>
<option value="Midway Islands">Midway Islands</option>
<option value="Moldova">Moldova</option>
<option value="Monaco">Monaco</option>
<option value="Mongolia">Mongolia</option>
<option value="Montserrat">Montserrat</option>
<option value="Morocco">Morocco</option>
<option value="Mozambique">Mozambique</option>
<option value="Myanmar">Myanmar</option>
<option value="Nambia">Nambia</option>
<option value="Nauru">Nauru</option>
<option value="Nepal">Nepal</option>
<option value="Netherland Antilles">Netherland Antilles</option>
<option value="Netherlands">Netherlands (Holland, Europe)</option>
<option value="Nevis">Nevis</option>
<option value="New Caledonia">New Caledonia</option>
<option value="New Zealand">New Zealand</option>
<option value="Nicaragua">Nicaragua</option>
<option value="Niger">Niger</option>
<option value="Nigeria">Nigeria</option>
<option value="Niue">Niue</option>
<option value="Norfolk Island">Norfolk Island</option>
<option value="Norway">Norway</option>
<option value="Oman">Oman</option>
<option value="Pakistan">Pakistan</option>
<option value="Palau Island">Palau Island</option>
<option value="Palestine">Palestine</option>
<option value="Panama">Panama</option>
<option value="Papua New Guinea">Papua New Guinea</option>
<option value="Paraguay">Paraguay</option>
<option value="Peru">Peru</option>
<option value="Phillipines">Philippines</option>
<option value="Pitcairn Island">Pitcairn Island</option>
<option value="Poland">Poland</option>
<option value="Portugal">Portugal</option>
<option value="Puerto Rico">Puerto Rico</option>
<option value="Qatar">Qatar</option>
<option value="Republic of Montenegro">Republic of Montenegro</option>
<option value="Republic of Serbia">Republic of Serbia</option>
<option value="Reunion">Reunion</option>
<option value="Romania">Romania</option>
<option value="Russia">Russia</option>
<option value="Rwanda">Rwanda</option>
<option value="St Barthelemy">St Barthelemy</option>
<option value="St Eustatius">St Eustatius</option>
<option value="St Helena">St Helena</option>
<option value="St Kitts-Nevis">St Kitts-Nevis</option>
<option value="St Lucia">St Lucia</option>
<option value="St Maarten">St Maarten</option>
<option value="St Pierre & Miquelon">St Pierre & Miquelon</option>
<option value="St Vincent & Grenadines">St Vincent & Grenadines</option>
<option value="Saipan">Saipan</option>
<option value="Samoa">Samoa</option>
<option value="Samoa American">Samoa American</option>
<option value="San Marino">San Marino</option>
<option value="Sao Tome & Principe">Sao Tome & Principe</option>
<option value="Saudi Arabia">Saudi Arabia</option>
<option value="Senegal">Senegal</option>
<option value="Serbia">Serbia</option>
<option value="Seychelles">Seychelles</option>
<option value="Sierra Leone">Sierra Leone</option>
<option value="Singapore">Singapore</option>
<option value="Slovakia">Slovakia</option>
<option value="Slovenia">Slovenia</option>
<option value="Solomon Islands">Solomon Islands</option>
<option value="Somalia">Somalia</option>
<option value="South Africa">South Africa</option>
<option value="Spain">Spain</option>
<option value="Sri Lanka">Sri Lanka</option>
<option value="Sudan">Sudan</option>
<option value="Suriname">Suriname</option>
<option value="Swaziland">Swaziland</option>
<option value="Sweden">Sweden</option>
<option value="Switzerland">Switzerland</option>
<option value="Syria">Syria</option>
<option value="Tahiti">Tahiti</option>
<option value="Taiwan">Taiwan</option>
<option value="Tajikistan">Tajikistan</option>
<option value="Tanzania">Tanzania</option>
<option value="Thailand">Thailand</option>
<option value="Togo">Togo</option>
<option value="Tokelau">Tokelau</option>
<option value="Tonga">Tonga</option>
<option value="Trinidad & Tobago">Trinidad & Tobago</option>
<option value="Tunisia">Tunisia</option>
<option value="Turkey">Turkey</option>
<option value="Turkmenistan">Turkmenistan</option>
<option value="Turks & Caicos Is">Turks & Caicos Is</option>
<option value="Tuvalu">Tuvalu</option>
<option value="Uganda">Uganda</option>
<option value="Ukraine">Ukraine</option>
<option value="United Arab Erimates">United Arab Emirates</option>
<option value="United Kingdom">United Kingdom</option>
<option value="United States of America">United States of America</option>
<option value="Uraguay">Uruguay</option>
<option value="Uzbekistan">Uzbekistan</option>
<option value="Vanuatu">Vanuatu</option>
<option value="Vatican City State">Vatican City State</option>
<option value="Venezuela">Venezuela</option>
<option value="Vietnam">Vietnam</option>
<option value="Virgin Islands (Brit)">Virgin Islands (Brit)</option>
<option value="Virgin Islands (USA)">Virgin Islands (USA)</option>
<option value="Wake Island">Wake Island</option>
<option value="Wallis & Futana Is">Wallis & Futana Is</option>
<option value="Yemen">Yemen</option>
<option value="Zaire">Zaire</option>
<option value="Zambia">Zambia</option>
<option value="Zimbabwe">Zimbabwe</option>                                               
</select>
</div>

 </div>   
 
 <div class="form-row">
     <div class="form-group col-md-12">
          <label ><spring:message code="label.subject_teach" /> *</label>
          <select name="mod-subj" id="mod-subj" multiple class="form-control" required>
          
            
               <option selected="selected"></option>
               <option><spring:message code="label.opt1subject" /></option>
               <option><spring:message code="label.opt2subject" /></option>
               <option><spring:message code="label.opt3subject" /></option>
            
             
           </select>
         
     </div>
       <div class="form-group col-md-12">
       <label for=""><spring:message code="label.spoken_lang" /></label>
       <select class="form-control" id="mod-language" name="mod-language"  multiple>
           <option selected></option>
         <option>Akan</option>
                                                  <option>Amharic</option>
                                                  <option>Arabic</option>
                                                  <option>Assamese</option>
                                                  <option>Awadhi</option>
                                                  <option>Azerbaijani</option>
                                                  <option>Balochi</option>
                                                  <option>Belarusian</option>
                                                  <option>Bengali</option>
                                                  <option>Bhojpuri</option>
                                                  <option>Burmese</option>
                                                  <option>Cebuano (Visayan)</option>
                                                  <option>Chewa</option>
                                                  <option>Chhattisgarhi</option>
                                                  <option>Chittagonian</option>
                                                  <option>Czech</option>
                                                  <option>Deccan</option>
                                                  <option>Dhundhari</option>
                                                  <option>Dutch</option>
                                                  <option>Eastern Min</option>
                                                  <option>English</option>
                                                  <option>French</option>
                                                  <option>Fula</option>
                                                  <option>Gan Chinese</option>
                                                  <option>German</option>
                                                  <option>Greek</option>
                                                  <option>Gujarati</option>
                                                  <option>Haitian Creole</option>
                                                  <option>Hakka</option>
                                                  <option>Haryanvi</option>
                                                  <option>Hausa</option>
                                                  <option>Hiligaynon</option>
                                                  <option>Hindi</option>
                                                  <option>Hmong</option>
                                                  <option>Hungarian</option>
                                                  <option>Igbo</option>
                                                  <option>Ilocano</option>
                                                  <option>Italian</option>
                                                  <option>Japanese</option>
                                                  <option>Javanese</option>
                                                  <option>Jin</option>
                                                  <option>Kannada</option>
                                                  <option>Kazakh</option>
                                                  <option>Khmer</option>
                                                  <option>Kinyarwanda</option>
                                                  <option>Kirundi</option>
                                                  <option>Konkani</option>
                                                  <option>Korean</option>
                                                  <option>Kurdish</option>
                                                  <option>Madurese</option>
                                                  <option>Magahi</option>
                                                  <option>Maithili</option>
                                                  <option>Malagasy</option>
                                                  <option>Malay/Indonesian</option>
                                                  <option>Malayalam</option>
                                                  <option>Mandarin</option>
                                                  <option>Marathi</option>
                                                  <option>Marwari</option>
                                                  <option>Mossi</option>
                                                  <option>Nepali</option>
                                                  <option>Northern Min</option>
                                                  <option>Odia (Oriya)</option>
                                                  <option>Oromo</option>
                                                  <option>Pashto</option>
                                                  <option>Persian</option>
                                                  <option>Polish</option>
                                                  <option>Portuguese</option>
                                                  <option>Punjabi</option>
                                                  <option>Quechua</option>
                                                  <option>Romanian</option>
                                                  <option>Russian</option>
                                                  <option>Saraiki</option>
                                                  <option>Serbo-Croatian</option>
                                                  <option>Shona</option>
                                                  <option>Sindhi</option>
                                                  <option>Sinhalese</option>
                                                  <option>Somali</option>
                                                  <option>Southern Min</option>
                                                  <option>Spanish</option>
                                                  <option>Sundanese</option>
                                                  <option>Swedish</option>
                                                  <option>Sylheti</option>
                                                  <option>Tagalog</option>
                                                  <option>Tamil</option>
                                                  <option>Telugu</option>
                                                  <option>Thai</option>
                                                  <option>Turkish</option>
                                                  <option>Turkmen</option>
                                                  <option>Ukrainian</option>
                                                  <option>Urdu</option>
                                                  <option>Uyghur</option>
                                                  <option>Uzbek</option>
                                                  <option>Vietnamese</option>
                                                  <option>Wu (inc. Shanghainese)</option>
                                                  <option>Xhosa</option>
                                                  <option>Xiang (Hunnanese)</option>
                                                  <option>Yoruba</option>
                                                  <option>Yue (Cantonese)</option>
                                                  <option>Zhuang</option>
                                                  <option>Zulu</option>
       </select>
    </div>
</div> 

  <div class="form-row">
 <div class="form-group col-md-12">
       <label ><spring:message code="label.about_me" /></label>
       <textarea class="form-control" name="mod-aboutme" id="mod-aboutme"></textarea>
    </div>
<div class="form-group col-md-12">
       <label for=""><spring:message code="label.timezone" /></label>
       <select class="form-control" id="mod-timezone" name="mod-timezone" >
           <option selected></option>
          <option value="(GMT -12:00) Eniwetok, Kwajalein">(GMT -12:00) Eniwetok, Kwajalein</option>
          <option value="(GMT -11:00) Midway Island, Samoa">(GMT -11:00) Midway Island, Samoa</option>
          <option value="(GMT -10:00) Hawaii">(GMT -10:00) Hawaii</option>
          <option value="(GMT -9:30) Taiohae">(GMT -9:30) Taiohae</option>
          <option value="(GMT -9:00) Alaska">(GMT -9:00) Alaska</option>
          <option value="(GMT -8:00) Pacific Time (US & Canada)">(GMT -8:00) Pacific Time (US & Canada)</option>
          <option value="(GMT -7:00) Mountain Time (US & Canada)">(GMT -7:00) Mountain Time (US & Canada)</option>
          <option value="(GMT -6:00) Central Time (US & Canada), Mexico City">(GMT -6:00) Central Time (US & Canada), Mexico City</option>
          <option value="(GMT -5:00) Eastern Time (US & Canada), Bogota, Lima">(GMT -5:00) Eastern Time (US & Canada), Bogota, Lima</option>
          <option value="(GMT -4:30) Caracas">(GMT -4:30) Caracas</option>
          <option value="(GMT -4:00) Atlantic Time (Canada), Caracas, La Paz">(GMT -4:00) Atlantic Time (Canada), Caracas, La Paz</option>
          <option value="(GMT -3:30) Newfoundland">(GMT -3:30) Newfoundland</option>
          <option value="(GMT -3:00) Brazil, Buenos Aires, Georgetown">(GMT -3:00) Brazil, Buenos Aires, Georgetown</option>
          <option value="(GMT -2:00) Mid-Atlantic">(GMT -2:00) Mid-Atlantic</option>
          <option value="(GMT -1:00) Azores, Cape Verde Islands">(GMT -1:00) Azores, Cape Verde Islands</option>
          <option value="(GMT +0:00) Western Europe Time, London, Lisbon, Casablanca">(GMT +0:00) Western Europe Time, London, Lisbon, Casablanca</option>
          <option value="(GMT +1:00) Brussels, Copenhagen, Madrid, Paris">(GMT +1:00) Brussels, Copenhagen, Madrid, Paris</option>
          <option value="(GMT +2:00) Kaliningrad, South Africa">(GMT +2:00) Kaliningrad, South Africa</option>
          <option value="(GMT +3:00) Baghdad, Riyadh, Moscow, St. Petersburg">(GMT +3:00) Baghdad, Riyadh, Moscow, St. Petersburg</option>
          <option value="(GMT +3:30) Tehran">(GMT +3:30) Tehran</option>
          <option value="(GMT +4:00) Abu Dhabi, Muscat, Baku, Tbilisi">(GMT +4:00) Abu Dhabi, Muscat, Baku, Tbilisi</option>
          <option value="(GMT +4:30) Kabul">(GMT +4:30) Kabul</option>
          <option value="(GMT +5:00) Ekaterinburg, Islamabad, Karachi, Tashkent">(GMT +5:00) Ekaterinburg, Islamabad, Karachi, Tashkent</option>
          <option value="(GMT +5:30) Bombay, Calcutta, Madras, New Delhi">(GMT +5:30) Bombay, Calcutta, Madras, New Delhi</option>
          <option value="(GMT +5:45) Kathmandu, Pokhara">(GMT +5:45) Kathmandu, Pokhara</option>
          <option value="(GMT +6:00) Almaty, Dhaka, Colombo">(GMT +6:00) Almaty, Dhaka, Colombo</option>
          <option value="(GMT +6:30) Yangon, Mandalay">(GMT +6:30) Yangon, Mandalay</option>
          <option value="(GMT +7:00) Bangkok, Hanoi, Jakarta">(GMT +7:00) Bangkok, Hanoi, Jakarta</option>
          <option value="(GMT +8:00) Beijing, Perth, Singapore, Hong Kong">(GMT +8:00) Beijing, Perth, Singapore, Hong Kong</option>
          <option value="(GMT +8:45) Eucla">(GMT +8:45) Eucla</option>
          <option value="(GMT +9:00) Tokyo, Seoul, Osaka, Sapporo, Yakutsk">(GMT +9:00) Tokyo, Seoul, Osaka, Sapporo, Yakutsk</option>
          <option value="(GMT +9:30) Adelaide, Darwin">(GMT +9:30) Adelaide, Darwin</option>
          <option value="(GMT +10:00) Eastern Australia, Guam, Vladivostok">(GMT +10:00) Eastern Australia, Guam, Vladivostok</option>
          <option value="(GMT +10:30) Lord Howe Island">(GMT +10:30) Lord Howe Island</option>
          <option value="(GMT +11:00) Magadan, Solomon Islands, New Caledonia">(GMT +11:00) Magadan, Solomon Islands, New Caledonia</option>
          <option value="(GMT +11:30) Norfolk Island">(GMT +11:30) Norfolk Island</option>
          <option value="(GMT +12:00) Auckland, Wellington, Fiji, Kamchatka">(GMT +12:00) Auckland, Wellington, Fiji, Kamchatka</option>
          <option value="(GMT +12:45) Chatham Islands">(GMT +12:45) Chatham Islands</option>
          <option value="(GMT +13:00) Apia, Nukualofa">(GMT +13:00) Apia, Nukualofa</option>
          <option value="(GMT +14:00) Line Islands, Tokelau">(GMT +14:00) Line Islands, Tokelau</option>       
</select>
    </div>
  </div>
    
  <div class="form-row">
       <div class="form-group col-md-12">
       <label ><spring:message code="label.com_media" /></label>       
       <select name="mod-com-media" id="mod-com-media" class="form-control" >          
              <option selected="selected"><option>
              <option>Hangout</option>
               <option>Skype</option>
               <option>Viber</option>
               <option>WhatsApp</option>
        </select>
     </div>
      <div class="form-group col-md-12">
       <label ><spring:message code="label.recitation" /></label>
       
       <input type="file" name="recitation" id="recitation"  accept="audio/*" />
          
     </div>    
       <div class="form-group col-md-12">
       <label ><spring:message code="label.teaching" /></label>
       
       <select name="mod-preference" id="mod-preference" class="form-control" >          
              <option selected="selected"><option>
              <option><spring:message code="label.opt1learning" /></option>
               <option><spring:message code="label.opt2learning" /></option>
               <option><spring:message code="label.opt3learning" /></option>
           
           
        </select>
     </div>
     <div class="form-group col-md-12">
       <label ><spring:message code="label.hourly" /></label>
       <input class="form-control" name="mod-hourly" id="mod-hourly" />
    </div>
    </div>
<div class="form-row">
  
    <div class="form-group col-md-12">
       <label >Riwaya</label>
       <textarea class="form-control" name="mod-riwaya" id="mod-riwaya"></textarea>
    </div>
    
    <div class="form-group col-md-12">
       <label ><spring:message code="label.certifications" /></label>
       <textarea class="form-control" name="mod-certif" id="mod-certif"></textarea>
    </div>
     <div class="form-group col-md-12">
       <label ><spring:message code="label.experience" /></label>
       <textarea class="form-control" name="mod-previous-exp" id="mod-previous-exp"></textarea>
    </div>
    	
   </div>

 <spring:message code="label.update_profile" var="labelupdate_profile"></spring:message>           
   <input type="submit" class="btn btn-primary" value="${labelupdate_profile }" />
          
   </form> 
   
</div>
   
      
      
    </div>
  </div>
</div>


			
           <%@ include file="/WEB-INF/views/includes/footer.jsp" %>
