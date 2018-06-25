function rechercheStudents(){
	
	
	var gender=document.getElementById("genderrech").value;
	var subject=document.getElementById("subrech").value;
	var loc=document.getElementById("locrech").value;
	var lan=document.getElementById("lanrech").value;
	sessionStorage.setItem("genderrech",gender);
	sessionStorage.setItem("subrech",subject);
	sessionStorage.setItem("locrech",loc);
	sessionStorage.setItem("lanrech",lan);
	
	location.href ="rechercherStudent";
	
}

	





