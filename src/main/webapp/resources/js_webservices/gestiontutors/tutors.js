
 
$(document).ready(function(){
		
	    $.getJSON("listtutors",
	    function(donnees){
	    var contenuHtml='<div class="container">';
	    contenuHtml+='<div class="row">';
	    contenuHtml+='<div class="col-lg-8 offset-lg-2 col-md-10 offset-md-1 col-12 offset-0">';
	    contenuHtml+='<div class="section-title text-center">';
	    contenuHtml+='<h2>Choosing you Tutor tips</h2>';
	    contenuHtml+='<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam</p>';
	    contenuHtml+='</div>';
	    contenuHtml+='</div>';
	    contenuHtml+='</div>';
	    contenuHtml+='<div class="row">';
		
	    for ( var i = 0; i < donnees.length; i++){
	    	
	    	           contenuHtml+='<div class="col-lg-6 col-md-6 col-xl-3">';
	                   contenuHtml+='<figure class="team-member wow fadeInUp" style="visibility: visible; animation-name: fadeInUp;">';
	                   contenuHtml+='<div class="team-member__thumb">';
	                   contenuHtml+='<div class="hexagon">';
	                   contenuHtml+='<div class="hexagon__inner1">';
	                   contenuHtml+='<div class="hexagon__inner2">';
	                   contenuHtml+='<img src="resources/images/'+donnees[i].picture+'">';
	                   contenuHtml+='</div>';
	                   contenuHtml+='</div>';
	                   contenuHtml+='</div>';
	                   contenuHtml+='</div>';
	                   contenuHtml+='<figcaption class="team-member__content">';
	                   contenuHtml+='<h3>'+donnees[i].name+'</h3>';
	                   contenuHtml+='<h5>'+donnees[i].hourly+'</h5>';
	                   contenuHtml+='<a href="profil_tutor/'+donnees[i].id+'"><button class="btn btn_primay">View Profil</button></a>';
	                   contenuHtml+='</figcaption>';
	                   contenuHtml+='</figure>';
	                   contenuHtml+='</div><!-- //Single Team -->';
	    }
	    
	    contenuHtml+='</div>';
	    contenuHtml+='</div>';
	    document.getElementById("list-tutors").innerHTML = contenuHtml;
	});

});	

$(document).ready(function() {
	
	$.getJSON("profil_tutor",
    function(donnees){
    var contenuHtml='<div class="container">';
    contenuHtml+='<br><br>';
    contenuHtml+='<div class="row align-items-center">';
    contenuHtml+='<div class="col-lg-8">';
    contenuHtml+='<div class="about-content">';
    contenuHtml+='<h3><strong>“QuranSpace”</strong> Lorem ipsum dolor sit amet</h3>';
    contenuHtml+='<h2>Lorem ipsum dolor sit amet</h2>';
    contenuHtml+='<p><span class="mark">“QuranSpace”</span>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore</p>';
    contenuHtml+='<p>"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore</p>';
    contenuHtml+='<div class="about-content__bottom d-flex align-items-center flex-wrap flex-sm-nowrap">';
    contenuHtml+='<div class="about-content__bottom__left">';
    contenuHtml+='<p>Lorem ipsum dolor sit amet</p>';
    contenuHtml+='<h3 class="body--font"><a href="#">+0011 22 33 44 55</a></h3>';
    contenuHtml+='</div>';
    contenuHtml+='<span>or</span>';
    contenuHtml+='<div class="about-content__bottom__right">';
    contenuHtml+='<a href="#" class="cr-btn cr-btn--sm cr-btn--transparent cr-btn--dark"><span>Read More</span></a>';
    contenuHtml+='</div>';
    contenuHtml+='</div>';
    contenuHtml+='</div>';
    contenuHtml+='</div>';
    contenuHtml+='<div class="col-lg-4">';
    contenuHtml+='<div class="about-images clearfix">';
    contenuHtml+='<img class="wow fadeInUp" data-wow-delay="0.1s" src="images/about/small-2.jpg" alt="smalal image" style="visibility: visible; animation-delay: 0.1s; animation-name: fadeInUp;">';
    contenuHtml+='</div>';
    contenuHtml+='</div>';
    contenuHtml+='</div>';
    contenuHtml+='</div>';
    
    document.getElementById("profil_tutor").innerHTML = contenuHtml;
});
});	


function rechercheTutors(){
	
	
	var gender=document.getElementById("gender-rech").value;
	var subject=document.getElementById("sub-rech").value;
	var loc=document.getElementById("loc-rech").value;
	var lan=document.getElementById("lan-rech").value;
	sessionStorage.setItem("gender-rech",gender);
	sessionStorage.setItem("sub-rech",subject);
	sessionStorage.setItem("loc-rech",loc);
	sessionStorage.setItem("lan-rech",lan);
	
	location.href ="rechercherTutor";
	
}

	





