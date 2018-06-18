<div class="header__right">

							<div class="header__right__top d-flex justify-content-end align-items-center flex-wrap flex-sm-nowrap">								
								
								<ul class="header__right__icons d-flex justify-content-end">
								<a href="#"> <div class="tutor">
								  <div class="dropdown show"   >
                                  
								  <a class="dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="color:#fff;">
                                      <i class="fa fa-user-o"></i> Welcome ${ nom_Student }
                                  </a>
                                  <div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
                                  <c:choose>
  									<c:when test="${type == 'tutor'}">
                                   <a class="dropdown-item" href="<%=request.getContextPath()%>/dashboard_tutor">My Profile</a>
                                    </c:when>
 								 <c:when test="${type == 'student'}">
                                   <a class="dropdown-item" href="<%=request.getContextPath()%>/dashboard_student">My Profile</a>
                                   </c:when>
                                   </c:choose>
                                   <a class="dropdown-item" href="<%=request.getContextPath()%>/deconnexion">
									Sign Out</a>
                                 </div>
                                 </div></div> 
								 </a>
								</ul>
								
							</div>
							
</div>