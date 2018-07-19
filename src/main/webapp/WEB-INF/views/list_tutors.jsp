<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
 		 document.getElementById("sub-rech").options[0].text = subject;
         document.getElementById("gender-rech").options[0].text = gender;
    	 document.getElementById("loc-rech").options[0].text = location;
    	 document.getElementById("lan-rech").options[0].text = language;
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
									       <div class="col-md-3">
									       <div class="form-group">
                                                <label for="exampleInputEmail1" style="color:#303030;"><spring:message code="label.subject" /></label>
                                                <select name="sub-rech" id="sub-rech" class="form-control">
                                                  <option selected></option>
                                                  <option><spring:message code="label.opt1subject" /></option>
                                                  <option><spring:message code="label.opt2subject" /></option>
                                                  <option><spring:message code="label.opt3subject" /></option>
                                                </select>
                                            </div>
                                            </div>
                                            <div class="col-md-3">
                                            <div class="form-group">
                                                <label for="exampleInputEmail1" style="color:#303030;"><spring:message code="label.Lang" /></label>
                                                <select name="lan-rech" id="lan-rech" class="form-control">
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
                                            <div class="col-md-3">
                                            <div class="form-group">
                                                <label for="exampleInputEmail1" style="color:#303030;"><spring:message code="label.gender" /></label>
                                                <select name="gender-rech" id="gender-rech" class="form-control">
                                                   <option selected></option>
                                                 <option><spring:message code="label.opt1gender" /></option>
                                                  <option><spring:message code="label.opt2gender" /></option>
                                                </select>
                                            </div>
                                            </div>
                                            <div class="col-md-3">
                                            <div class="form-group">
                                                <label for="exampleInputEmail1" style="color:#303030;"><spring:message code="label.country" /></label>
                                                <select name="loc-rech" id="loc-rech" class="form-control">
                                                 <option selected></option>
                                                 
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

<br>
<div class="col-md-12">
<center><a href="javascript:rechercheTutors();" class="btn btn-info" style="padding-left:100px;padding-right:100px;padding-top:20px;padding-bottom:20px;"><spring:message code="label.search" /></a>								    
</center>
</div>
</div>
				        <div class="row">
				          <div id="search_tutors">
				             
				           </div>   
				        </div>
				        <span id="btn-load"></span>				       
				   </div><!-- Checkout Section End-->
				   
				 </div>

			</main><!-- //Page Conent -->

			
			<%@ include file="/WEB-INF/views/includes/footer.jsp" %>
