
<script>
function login(){
	
if(document.getElementById("search").style.display == "none"){
	
	document.getElementById("search").style.display = "block";
	document.getElementById("login").style.display = "none";
}else
{
	document.getElementById("search").style.display = "none";
	document.getElementById("login").style.display = "block";
}
	
}
</script>
            <div class="header__right">
            
							<div class="header__right__top d-flex justify-content-end align-items-center flex-wrap flex-sm-nowrap">
								
								<!--  
								<ul class="header__right__times d-flex justify-content-end">
									<li><p><i class="icofont icofont-full-sunny"></i>SUNRISE : 5.10 AM</p></li>
									<li><p><i class="icofont icofont-full-night"></i>SUNSET : 5.49 PM</p></li>
								</ul>
								-->
								
								<ul class="header__right__icons">
									<c:choose>
  									<c:when test="${connexionstudent != 0}">
								     <span class="dropdown">
                                          <button class="btn btn-secondary dropdown-toggle" type="button" style="padding:15px;font-size:16px;background:#1e385c;border:none;" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                            <spring:message code="label.welcome" /> ${ nom_Student } 
                                           </button>
                                          <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                                    <c:choose>
  									<c:when test="${type == 'tutor'}">
                                    <a class="dropdown-item" href="<%=request.getContextPath()%>/dashboard_tutor"><spring:message code="label.my_profile" /></a>
                                    </c:when>
                                        <c:when test="${type == 'student'}">
                                    <a class="dropdown-item" href="<%=request.getContextPath()%>/dashboard_student"><spring:message code="label.my_profile" /></a>
                                    </c:when>
                                    </c:choose>
                                              <a class="dropdown-item" href="<%=request.getContextPath()%>/deconnexion"><spring:message code="label.sign_out" /></a>
                                          </div>
                                       </span>
								 </c:when>
 								 <c:when  test="${connexionstudent == 0}">
								    <span class="dropdown">
                                          <button class="btn btn-secondary dropdown-toggle" type="button" style="padding:15px;font-size:16px;background:#1e385c;border:none;" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                           <spring:message code="label.login" /> 
                                           </button>
                                          <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                                              <a class="dropdown-item" href="<%=request.getContextPath()%>/authentification"><spring:message code="label.student" /></a>
                                              <a class="dropdown-item" href="<%=request.getContextPath()%>/login"><spring:message code="label.tutor" /></a>
                                          </div>
                                       </span>
								      <span class="dropdown">
                                          <button class="btn btn-secondary dropdown-toggle" type="button" style="padding:15px;font-size:16px;background:#1e385c;border:none;" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                            <spring:message code="label.create_account" /> 
                                           </button>
                                          <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                                              <a class="dropdown-item" href="<%=request.getContextPath()%>/registration"><spring:message code="label.student" /></a>
                                              <a class="dropdown-item" href="<%=request.getContextPath()%>/inscription"><spring:message code="label.tutor" /></a>
                                          </div>
                                       </span>
								 </c:when>
								 </c:choose>
								</ul>
							</div>
							
							<!--  
							 <div class="header__right__bottom">
								
								<nav class="menu">
									<ul class="justify-content-end">
										
										<li><a href="<%=request.getContextPath()%>/index">HOME</a></li>
										<li><a href="#">ABOUT</a></li>
										<li><a href="#">EVENT</a></li>
										<li><a href="#">ACTIVITIES</a></li>
										<li><a href="#">TIME OF SALAT</a></li>
										<li><a href="#">BLOG</a></li>
										<li><a href="#">SUPPORT</a></li>
									
									</ul>
								  </nav>                                                                          
                              </div>
							-->
							

						</div>
						
						
						