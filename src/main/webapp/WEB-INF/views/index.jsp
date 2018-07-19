<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html class="no-js" lang="zxx">
  
   <%@ include file="/WEB-INF/views/includes/header.jsp" %>
   
   <script src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
   <script src="<%=request.getContextPath()%>/resources/js_webservices/gestiontutors/tutors.js"></script>
  <script src="<%=request.getContextPath()%>/resources/js_webservices/gestionstudents/students.js"></script>
  
   <body>
		<div class="fakeloader"></div>
		<!-- Main wrapper -->
		<div class="wrapper" id="wrapper">
		<!-- Header -->
		
		<header id="header-area" class="header-area fixed--header sticky--header ">
				<div class="container">
					<div class="header header--style-1">
						<div class="logo image--logo hidden-md hidden-sm hidden-xs">
							<a href="#"><img src="<%=request.getContextPath()%>/resources/images/logo/logo-white.png" alt="header logo"></a>
						</div>
						<%@ include file="/WEB-INF/views/includes/navbar.jsp" %>
						<div class="mobile-menu hidden-lg hidden-xlg hidden-xx hidden-sp">
						   <a class="mobile-logo" href="#"><img src="<%=request.getContextPath()%>/resources/images/logo/mobile-logo.png" alt="logo"></a>
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
									    <div id="search" class="bl_register search">
			<c:if test="${not empty successcontact}">
		    <div class="alert alert-success" role="alert">
			<button type="button" class="close" data-dismiss="alert" aria-label="Close">
			<span aria-hidden="true">x</span>
			</button>
			<center><strong>${successcontact}</strong></center>
		    </div>
			</c:if>
			
			<c:if test="${not empty successsentrv}">
		    <div class="alert alert-success" role="alert">
			<button type="button" class="close" data-dismiss="alert" aria-label="Close">
			<span aria-hidden="true">x</span>
			</button>
			<center><strong>${successsentrv}</strong></center>
		    </div>
			</c:if>
									       <h3 style="color:#fff;text-transform:uppercase;">
									       <spring:message code="label.FindAtutor" />
									       </h3>
									       <div class="row">
									       <div class="col-md-3">
									       <div class="form-group">
                                                <label for="exampleInputEmail1" style="color:#fff;"><spring:message code="label.subject" /></label>
                                                <select name="sub-rech" id="sub-rech" class="form-control">
                                                  <option value="">--</option>
                                                  <option><spring:message code="label.opt1subject" /></option>
                                                  <option><spring:message code="label.opt2subject" /></option>
                                                  <option><spring:message code="label.opt3subject" /></option>
                                                </select>
                                            </div>
                                            </div>
                                            <div class="col-md-3">
                                            <div class="form-group">
                                                <label for="exampleInputEmail1" style="color:#fff;"><spring:message code="label.Lang" /></label>
                                                <select name="lan-rech" id="lan-rech" class="form-control">
                                                  <option value="">--</option>
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
                                                <label for="exampleInputEmail1" style="color:#fff;"><spring:message code="label.gender" /></label>
                                                <select name="gender-rech" id="gender-rech" class="form-control">
                                                  <option value="" >--</option>
                                                  <option><spring:message code="label.opt1gender" /></option>
                                                  <option><spring:message code="label.opt2gender" /></option>
                                                </select>
                                            </div>
                                            </div>
                                            <div class="col-md-3">
                                            <div class="form-group">
                                                <label for="exampleInputEmail1" style="color:#fff;"><spring:message code="label.country" /></label>
                                                <select name="loc-rech" id="loc-rech" class="form-control">
                                                  <option value="" selected="selected">--</option>
                                 
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

</div>
<br>
<div class="row">

<div class="col-md-12">
<div class="form-group">
                 
   <a href="javascript:rechercheTutors();" class="btn btn-info" style="padding-left:100px;padding-right:100px;padding-top:20px;padding-bottom:20px;"><spring:message code="label.search" /></a>
                    
                    
</div>
									    
</div>
</div>
</div>
										
										<div id="login" class="bl_register" style="display:none;">
										   
										   
										   
										   <div class="bl_register_tutor">
										       <h3 style="color:#fff;text-transform:uppercase;"><spring:message code="label.student_profil" /></h3>
										       <form>
                                                <div class="form-group">
                                                <label for="exampleInputEmail1" style="color:#fff;"><spring:message code="label.email_address" /></label>
                                                        <spring:message code="label.enter_mail" var="labelentermail"></spring:message>                 
                                                <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="${labelentermail}">
                                                </div>
                                               <div class="form-group">
                                                 <label for="exampleInputPassword1" style="color:#fff;"><spring:message code="label.password" /></label>
                                                  <spring:message code="label.password" var="labelpassword"></spring:message>                 
                                                <input type="password" class="form-control" id="exampleInputPassword1" placeholder="${labelpassword}">
                                                </div>
                                                <button type="submit" class="btn btn-info"><spring:message code="label.connexion" /></button>
												<a style="color:#fff;margin-left:20px;" href=""><spring:message code="label.inscription" /></a>
                                                </form>
										   </div>
										   <div class="bl_register_stud">
										       <h3 style="color:#fff;text-transform:uppercase;"><spring:message code="label.tutor_profil" /></h3>
										       <form action="connexion_tutor" method="post">
											   <div class="form-group">
												
                                                <label for="exampleInputEmail1" style="color:#fff;"><spring:message code="label.email_address" /></label>
                                                <spring:message code="label.enter_mail" var="labelentermail"></spring:message>                 
                                               <input type="email" class="form-control" id="exampleInputEmail1" name="emailTutor" aria-describedby="emailHelp" placeholder="${labelentermail}" />
                                               
											   </div>
                                               <div class="form-group">
                                                 <label for="exampleInputPassword1" style="color:#fff;"><spring:message code="label.password" /></label>
                                                  <spring:message code="label.password" var="labelpassword"></spring:message>                 
                                               <input type="password" name="passwordTutor" class="form-control" id="exampleInputPassword1" placeholder="${labelpassword}" />
                                                </div>
                                                <button type="submit" class="btn btn-info"><spring:message code="label.connexion" /></button>
                                                <a style="color:#fff;margin-left:20px;" href="inscription"><spring:message code="label.inscription" /></a>
												
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
				<div class="banner banner-slide-active slider-arrow--style1 slide-animate-text">
                     <!-- Single Banner -->
					<div class="banner__single bg-image--2 fullscreen d-flex align-items-center" data-black-overlay="6" >
						<div class="container">
							<div class="row">
								<div class="col-md-12">				
									<div class="banner__content text-center">					
									    <div id="search" class="bl_register search">			
			<c:if test="${not empty successsent}">
		    <div class="alert alert-success" role="alert">
			<button type="button" class="close" data-dismiss="alert" aria-label="Close">
			<span aria-hidden="true">x</span>
			</button>
			<center><strong>${successsent}</strong></center>
		    </div>
			</c:if>
									       <h3 style="color:#fff;text-transform:uppercase;"><spring:message code="label.FindAstudent" /></h3>
									       <div class="row">
									       <div class="col-md-3">
									       <div class="form-group">
                                                <label for="exampleInputEmail1" style="color:#fff;"><spring:message code="label.subject" /></label>
                                                <select name="subrech" id="subrech" class="form-control">
                                                  <option value="">--</option>
                                                  <option><spring:message code="label.opt1subject" /></option>
                                                  <option><spring:message code="label.opt2subject" /></option>
                                                  <option><spring:message code="label.opt3subject" /></option>
                                                </select>
                                            </div>
                                            </div>
                                            <div class="col-md-3">
                                            <div class="form-group">
                                                <label for="exampleInputEmail1" style="color:#fff;"><spring:message code="label.Lang" /></label>
                                                <select name="lanrech" id="lanrech" class="form-control">
                                                  <option value="">--</option>
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
                                                <label for="exampleInputEmail1" style="color:#fff;"><spring:message code="label.gender" /></label>
                                                <select name="genderrech" id="genderrech" class="form-control">
                                                  <option value="" >--</option>
                                                  <option><spring:message code="label.opt1gender" /></option>
                                                  <option><spring:message code="label.opt2gender" /></option>
                                                </select>
                                            </div>
                                            </div>
                                            <div class="col-md-3">
                                            <div class="form-group">
                                                <label for="exampleInputEmail1" style="color:#fff;"><spring:message code="label.country" /></label>
                                                <select name="locrech" id="locrech" class="form-control">
                                                  <option value="" selected="selected">--</option>
                                 
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

</div>
<br>
<div class="row">

<div class="col-md-12">
<div class="form-group">
                 
   <a href="javascript:rechercheStudents();" class="btn btn-info" style="padding-left:100px;padding-right:100px;padding-top:20px;padding-bottom:20px;"><spring:message code="label.search" /></a>
                    
                    
</div>
									    
</div>
</div>
</div>
									</div>
								</div>
							</div>
						</div>
					</div><!-- //Single Banner -->
					
				</div>
			</div><!-- //Top Banner -->		
				
				<!-- Upcoming Events -->
				<!--
				<section class="cr-section events-area bg--white ptb--150 flower--left-bottom">
					<div class="container">
						<div class="row">
							<div class="col-lg-8 offset-lg-2 col-md-10 offset-md-1 col-12 offset-0">
								<div class="section-title text-center">
									<h4>Our “Events”</h4>
									<h2>Slogan Events</h2>
									<p><span>Message</span> nektbou bech n3abbi bih lespace li mawjoud , nektbou bech n3abbi bih lespace li mawjoud , nektbou bech n3abbi bih lespace li mawjoud</p>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-lg-12">
								<div class="event">

									
									<div class="event__inner event-slide-active slider-dots--style1">

										
										<div class="event__single">
											<div class="event__single__inner">
												<div class="event__single__thumb">
													<img src="<%=request.getContextPath()%>/resources/images/event/1.jpg" alt="event thumb">
													<div class="event__single__date">
														<h3>15 December, 2017</h3>
													</div>
												</div>
												<div class="event__single__content">
													<h3><a href="">Importance of “Hajj” in Islam</a></h3>
													<p><strong>Ramadan</strong> is the know how to pursue pleasure rationally ncountr consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of tself, because it  pain, but because occasionally </p>
													<div class="event__single__content__location">
														<p><i class="icofont icofont-institution"></i> Al-arafah masque, Old town, Paris</p>
														<p><i class="icofont icofont-wall-clock"></i> 03.00 am to 05.30pm</p>
													</div>
												</div>
											</div>
										</div>

										
										<div class="event__single">
											<div class="event__single__inner">
												<div class="event__single__thumb">
													<img src="<%=request.getContextPath()%>/resources/images/event/2.jpg" alt="event thumb">
													<div class="event__single__date">
														<h3>17 December, 2017</h3>
													</div>
												</div>
												<div class="event__single__content">
													<h3><a href="event-details.html">Importance of “Sijdah” in Islam</a></h3>
													<p><strong>Ramadan</strong> is the know how to pursue pleasure rationally ncountr consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of tself, because it  pain, but because occasionally </p>
													<div class="event__single__content__location">
														<p><i class="icofont icofont-institution"></i> Central masque, New town, Las Vegas</p>
														<p><i class="icofont icofont-wall-clock"></i> 11.00 am to 01.30pm</p>
													</div>
												</div>
											</div>
										</div>
										<div class="event__single">
											<div class="event__single__inner">
												<div class="event__single__thumb">
													<img src="<%=request.getContextPath()%>/resources/images/event/3.jpg" alt="event thumb">
													<div class="event__single__date">
														<h3>21 December, 2017</h3>
													</div>
												</div>
												<div class="event__single__content">
													<h3><a href="">Preferred Foods in Islam</a></h3>
													<p><strong>Ramadan</strong> is the know how to pursue pleasure rationally ncountr consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of tself, because it  pain, but because occasionally </p>
													<div class="event__single__content__location">
														<p><i class="icofont icofont-institution"></i> Al-Madina masque, City, New York</p>
														<p><i class="icofont icofont-wall-clock"></i> 10.00 am to 12.30pm</p>
													</div>
												</div>
											</div>
										</div>
										<div class="event__single">
											<div class="event__single__inner">
												<div class="event__single__thumb">
													<img src="<%=request.getContextPath()%>/resources/images/event/1.jpg" alt="event thumb">
													<div class="event__single__date">
														<h3>15 December, 2017</h3>
													</div>
												</div>
												<div class="event__single__content">
													<h3><a href="">Importance of “Hajj” in Islam</a></h3>
													<p><strong>Ramadan</strong> is the know how to pursue pleasure rationally ncountr consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of tself, because it  pain, but because occasionally </p>
													<div class="event__single__content__location">
														<p><i class="icofont icofont-institution"></i> Al-arafah masque, Old town, Paris</p>
														<p><i class="icofont icofont-wall-clock"></i> 03.00 am to 05.30pm</p>
													</div>
												</div>
											</div>
										</div>
										<div class="event__single">
											<div class="event__single__inner">
												<div class="event__single__thumb">
													<img src="<%=request.getContextPath()%>/resources/images/event/2.jpg" alt="event thumb">
													<div class="event__single__date">
														<h3>17 December, 2017</h3>
													</div>
												</div>
												<div class="event__single__content">
													<h3><a href="">Importance of “Sijdah” in Islam</a></h3>
													<p><strong>Ramadan</strong> is the know how to pursue pleasure rationally ncountr consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of tself, because it  pain, but because occasionally </p>
													<div class="event__single__content__location">
														<p><i class="icofont icofont-institution"></i> Central masque, New town, Las Vegas</p>
														<p><i class="icofont icofont-wall-clock"></i> 11.00 am to 01.30pm</p>
													</div>
												</div>
											</div>
										</div>
										<div class="event__single">
											<div class="event__single__inner">
												<div class="event__single__thumb">
													<img src="<%=request.getContextPath()%>/resources/images/event/3.jpg" alt="event thumb">
													<div class="event__single__date">
														<h3>21 December, 2017</h3>
													</div>
												</div>
												<div class="event__single__content">
													<h3><a href="">Preferred Foods in Islam</a></h3>
													<p><strong>Ramadan</strong> is the know how to pursue pleasure rationally ncountr consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of tself, because it  pain, but because occasionally </p>
													<div class="event__single__content__location">
														<p><i class="icofont icofont-institution"></i> Al-Madina masque, City, New York</p>
														<p><i class="icofont icofont-wall-clock"></i> 10.00 am to 12.30pm</p>
													</div>
												</div>
											</div>
										</div>

									</div>

									
									<div class="event__filters">
										<div class="event-filters-active">
											<div class="event__filters__single">
												<div class="event__filters__single__inner">
													<img src="<%=request.getContextPath()%>/resources/images/event/event-filters/1.png" alt="event filters">
												</div>
											</div>
											<div class="event__filters__single">
												<div class="event__filters__single__inner">
													<img src="<%=request.getContextPath()%>/resources/images/event/event-filters/2.png" alt="event filters">
												</div>
											</div>
											<div class="event__filters__single">
												<div class="event__filters__single__inner">
													<img src="<%=request.getContextPath()%>/resources/images/event/event-filters/3.png" alt="event filters">
												</div>
											</div>
											<div class="event__filters__single">
												<div class="event__filters__single__inner">
													<img src="<%=request.getContextPath()%>/resources/images/event/event-filters/1.png" alt="event filters">
												</div>
											</div>
											<div class="event__filters__single">
												<div class="event__filters__single__inner">
													<img src="<%=request.getContextPath()%>/resources/images/event/event-filters/2.png" alt="event filters">
												</div>
											</div>
											<div class="event__filters__single">
												<div class="event__filters__single__inner">
													<img src="<%=request.getContextPath()%>/resources/images/event/event-filters/3.png" alt="event filters">
												</div>
											</div>
										</div>
									</div>

								</div>
							</div>
						</div>
					</div>
				</section>
                -->
				
				<!-- 
				<section class="cr-section activities-area half--bg bg-image--1 pt--90 pb--150">
					<div class="container">
						<div class="row">
							<div class="col-lg-8 offset-lg-2 col-md-10 offset-md-1 col-12 offset-0">
								<div class="section-title section-title--white text-center">
									        <h4>Activities "QURANSPACE"</h4>
									        <h2>Slogan Activities</h2>
									<p><span>Message</span> nektbou bech n3abbi bih lespace li mawjoud , nektbou bech n3abbi bih lespace li mawjoud , nektbou bech n3abbi bih lespace li mawjoud</p>
								</div>
							</div>
						</div>
						<div class="activities">
							<div class="row">
								
								<div class="col-lg-4 col-md-6 col-sm-12 col-12">
									<figure class="activity wow fadeInLeft">
										<div class="activity__thumb">
											<a href="">
												<img src="<%=request.getContextPath()%>/resources/images/activity/1.jpg" alt="activity image">
											</a>
										</div>
										<figcaption class="activity__content text-center">
											<h3><a href="#">Activité A</a></h3>
											<p><span>Message</span>nektbou bech n3abbi bih lespace li mawjoud , nektbou bech n3abbi bih lespace li mawjoud </p>
										</figcaption>
									</figure>
								</div>
								
								<div class="col-lg-4 col-md-6 col-sm-12 col-12">
									<figure class="activity wow fadeInUp">
										<div class="activity__thumb">
											<a href="">
												<img src="<%=request.getContextPath()%>/resources/images/activity/2.jpg" alt="activity image">
											</a>
										</div>
										<figcaption class="activity__content text-center">
											<h3><a href="">Activité B</a></h3>
											<p><span>Message</span>nektbou bech n3abbi bih lespace li mawjoud , nektbou bech n3abbi bih lespace li mawjoud </p>
										</figcaption>
									</figure>
								</div>
								<div class="col-lg-4 col-md-6 col-sm-12 col-12 offset-md-3 offset-lg-0 offset-0">
									<figure class="activity wow fadeInRight">
										<div class="activity__thumb">
											<a href="">
												<img src="<%=request.getContextPath()%>/resources/images/activity/3.jpg" alt="activity image">
											</a>
										</div>
										<figcaption class="activity__content text-center">
											<h3><a href="">Activité C</a></h3>
											<p><span>Message</span>nektbou bech n3abbi bih lespace li mawjoud , nektbou bech n3abbi bih lespace li mawjoud </p>
										</figcaption>
									</figure>
								</div>
							</div>
						</div>
					</div>
				</section>

				<section class="cr-section blog-area pt--150 pb--140 bg--white flower--right-bottom">
					<div class="container">
						<div class="row">
							<div class="col-lg-8 offset-lg-2 col-md-10 offset-md-1 col-12 offset-0">
								<div class="section-title text-center">
									<h4>From “Blog”</h4>
									<h2>Latest Blog Post</h2>
									<p>Islam is the know how to pursue pleasure rationally encounter consequences that are extremely painful again is there anyone who loves or pursues or desires to obtain pain of itself</p>
								</div>
							</div>
						</div>
						<div class="row">

							
							<div class="col-lg-6 col-md-6 col-xl-3">
								<article class="blog wow fadeInUp">
									<div class="blog__thumb">
										<a href="">
											<img src="<%=request.getContextPath()%>/resources/images/blog/1.jpg" alt="single blog thumb">
										</a>
									</div>
									<div class="blog__content">
										<div class="blog__content__meta">
											<p>December 20, 2017 - <a href="">Afser</a></p>
										</div>
										<h4 class="blog-title"><a href="">Islam is the only one way for peace </a></h4>
										<p>Islam is the know how to pursuesure nally encounter consequences  extremely </p>
										<a href="" class="cr-readmore">Read</a>
									</div>
								</article>
							</div>
							<div class="col-lg-6 col-md-6 col-xl-3">
								<article class="blog wow fadeInUp">
									<div class="blog__thumb">
										<a href="">
											<img src="<%=request.getContextPath()%>/resources/images/blog/2.jpg" alt="single blog thumb">
										</a>
									</div>
									<div class="blog__content">
										<div class="blog__content__meta">
											<p>December 18, 2017 - <a href="">Julfiqar</a></p>
										</div>
										<h4 class="blog-title"><a href="">Salat can help us to move closer to Allah </a></h4>
										<p>Islam is the know how to pursuesure nally encounter consequences  extremely </p>
										<a href="" class="cr-readmore">Read</a>
									</div>
								</article>
							</div>
							<div class="col-lg-6 col-md-6 col-xl-3">
								<article class="blog wow fadeInUp">
									<div class="blog__thumb">
										<a href="">
											<img src="<%=request.getContextPath()%>/resources/images/blog/3.jpg" alt="single blog thumb">
										</a>
									</div>
									<div class="blog__content">
										<div class="blog__content__meta">
											<p>December 15, 2017 - <a href="">Iftekhar</a></p>
										</div>
										<h4 class="blog-title"><a href="">Ramadan teach us how to realize fasting</a></h4>
										<p>Islam is the know how to pursuesure nally encounter consequences  extremely </p>
										<a href="" class="cr-readmore">Read</a>
									</div>
								</article>
							</div>
							<div class="col-lg-6 col-md-6 col-xl-3">
								<article class="blog wow fadeInUp">
									<div class="blog__thumb">
										<a href="">
											<img src="<%=request.getContextPath()%>/resources/images/blog/4.jpg" alt="single blog thumb">
										</a>
									</div>
									<div class="blog__content">
										<div class="blog__content__meta">
											<p>December 12, 2017 - <a href="">Momen</a></p>
										</div>
										<h4 class="blog-title"><a href="blog-details.html">Learn about Islam, It is very simple & realistic</a></h4>
										<p>Islam is the know how to pursuesure nally encounter consequences  extremely </p>
										<a href="" class="cr-readmore">Read</a>
									</div>
								</article>
							</div>

						</div>
					</div>
				</section>
				-->
				
           </main><!-- //Page Conent -->
           <%@ include file="/WEB-INF/views/includes/footer.jsp" %>
			
