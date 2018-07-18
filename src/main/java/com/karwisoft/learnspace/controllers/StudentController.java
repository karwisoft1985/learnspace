package com.karwisoft.learnspace.controllers;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Base64;
import java.util.Iterator;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.karwisoft.learnspace.beans.Messages;
import com.karwisoft.learnspace.beans.Student;
import com.karwisoft.learnspace.beans.Tuto;
import com.karwisoft.learnspace.services.StudentServices;
import com.karwisoft.learnspace.services.TutorServices;

import java.util.Locale;

@Controller
public class StudentController {

	@Autowired
	private StudentServices service_student;

	@Autowired
	private TutorServices service_tutor;
	
	@Autowired
	private JavaMailSender mailSender;
	
	@RequestMapping(value = "/authentification", method = RequestMethod.GET)
	public ModelAndView authentification(){
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("authentification");
		return modelAndView;
	}
	
	@RequestMapping(value = "/registration", method = RequestMethod.GET)
	public ModelAndView registration(){
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("registration");
		return modelAndView;
		
	}

	@RequestMapping(value="/addInscriEtud",method=RequestMethod.POST)
	 public String addinscrietud( @RequestParam("name") String name,
			 @RequestParam("gender") String gender ,
			 @RequestParam("email") String email ,
			 @RequestParam("language") String language ,
			 @RequestParam("location") String location ,
			 @RequestParam("subject") String subject ,
			 Locale locale, final RedirectAttributes redirectAttributes
			 )
	 {
		 UUID uuid=UUID.randomUUID();
		    String str=uuid.toString().replace("-", "");
		    String password= str.substring(0, 8);
		    byte[]   bytesEncoded = Base64.getEncoder().encode(password.getBytes());
			String psd = new String(bytesEncoded);	       
		    Integer actif=0;
		    String birthdate="";
		    String timezone="";
		    String aboutme="";
		    String riwayatolearn="";
		    String learnpref="";
		    String communication="";
		    String certifications="";
		    String listreviews="";
		    Student st = new Student();
			 List<Student> stud=service_student.getstudentBymail(email);
			 if(stud.size() != 0){
				 if(locale.equals("fr")){
redirectAttributes.addFlashAttribute("warning", "Votre email est déjà enregistré!");
				 }else{
redirectAttributes.addFlashAttribute("warning", "Your email is already registered !");
				 }					
return "redirect:/authentification";
					 }
					 else{
				st.setName(name);
				String picture = "noprofile.jpg";
				if(gender.equals("Woman")){
				picture="image.png";
				}
				 st.setPicture(picture);
				 st.setAboutMe(aboutme);
				 st.setsubjects(subject);
				 st.setbirthdate(birthdate);
				 st.setGender(gender);
				 st.setSpokenlanguage(language);
				 st.setRiwayaToLearn(riwayatolearn);
				 st.setCertifications(certifications);
				 st.setLearningPreferences(learnpref);
				 st.setCommunication(communication);
				 st.setLocation(location);
				 st.setTimeZone(timezone);
				 DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd");
			    LocalDate localDate = LocalDate.now();
			    String startdate=dtf.format(localDate);
				 st.setMembershipStartDate(startdate);
				 st.setReviews(listreviews);
				 st.setEmail(email);
				 st.setPassword(psd);
				 st.setActif(actif);
		 service_student.addStudent(st);
		 String message = "Welcome to Quran Space \n"+

"Assalamu Alaykom, \n"+
"Dear "+name+",\n"+

"We are happy that you decided to join Quran Space Community. Quran Space is a free non-profit platform that brings together Quran Tutors and Students.  \n"+

"To begin your learning journey: \n"+
"1.      Login with your credentials: "+email+" / "+password+ "\n"+
"2.      Search the Tutor that you see fits your needs and budget;  \n"+
"3.      Contact the Tutor to setup an initial meeting; \n"+
"4.      Start your learning journey \n"+

"Again, we are happy to have you aboard, and hope you acquire the good knowledge that you benefit from it in this Donya and hereafter. \n"+

"For any questions reply to this email or send an email to info@quranspace.net \n"+
"IMPORTANT NOTE: By signing in and using Quran Space you agree to the Terms of use and Privacy Policy published on QuranSpace.net. \n"+
"JazakAllah khair, \n"+
"Quran Space Team \n"+
"QuranSpace.net \n";
              
                 //fin contenu du message//	        
          // creates a simple e-mail object
          SimpleMailMessage mail = new SimpleMailMessage();	         
        mail.setFrom("info@quranspace.net");	  		
  		mail.setTo(email);
  		mail.setSubject("Account activation QuranSpace");
  		mail.setText(message);
  		
  		// sends the e-mail
  		  mailSender.send(mail);

  		  if(locale.equals("fr")){
  		redirectAttributes.addFlashAttribute("success", "Votre inscription est faite avec succès! Vous trouverez sur votre boîte email votre login et mot de passe!");  
  		  }else{
  		redirectAttributes.addFlashAttribute("success", "You have successfully registered! You will find your access on your mailbox!");  
  		  }
  		return "redirect:/registration";
					 }
	 }
	
	@RequestMapping(value = "/forgotpassword", method = RequestMethod.GET)
	public ModelAndView forgot_password(){
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("forgotpassword");
		return modelAndView;
		
	}

	 @RequestMapping(value = "/forgot_pass" , method = RequestMethod.POST)
	    public String forgotpass(Model model,@RequestParam String emailstudent,
				 Locale locale, final RedirectAttributes redirectAttributes)
	    {
		  SimpleMailMessage email = new SimpleMailMessage();
	         
	        email.setFrom("info@quranspace.net");
	  		email.setTo(emailstudent);
	  		email.setSubject("Access Quranspace");
	  		List<Student> lp = service_student.getstudentBymail(emailstudent);
	  		for(Student p : lp)
     		{
	  		String name=p.getName();
	  		String password=p.getPassword();
	  		byte[]   bytesEncoded = Base64.getDecoder().decode(password.getBytes());
				String psd = new String(bytesEncoded);
		       
     		String message="Assalamu Alaykom,\n"+

     		"Dear "+ name +",\n"+

     		"You recently requested a Password reset\n"+
     		"This is your new password, we strongly encourage you to change it as soon as you’re logged in:"+ psd +"\n"+

     		"We are hoping that you are enjoying your journey with us.\n"+
     		"For any questions please reply to this email or send an email to info@quranspace.net\n"+

     		"JazakAllah khair,\n"+
     		"Quran Space Team\n"+
     		"QuranSpace.net\n";
	  		email.setText(message);	  		
	  		mailSender.send(email);
     		}
if(locale.equals("fr")){
redirectAttributes.addFlashAttribute("success", "Votre mot de passe a été réinitialisé, veuillez vérifier votre boîte email pour votre nouveau mot de passe.");				 			
}else{
redirectAttributes.addFlashAttribute("success", "Your password has been reset, please check your mailbox for your new password.");				 			
}
return "redirect:/forgotpassword";
	    }
	
		
		@RequestMapping(value="/connexion_student",method=RequestMethod.POST)
		 public String cnxTutor(HttpServletRequest request,Model model,
				 @RequestParam("emailstud") String emailstud,
				 @RequestParam("passwordstud") String passwordstud,
				 Locale locale, RedirectAttributes redirectAttributes ,HttpSession session
		)
		 {
			byte[]   bytesEncoded = Base64.getEncoder().encode(passwordstud.getBytes());
			String psd = new String(bytesEncoded);
			List<Student> logins=service_student.getStudentByLogin(emailstud,psd);
			if (logins.isEmpty())
			{	
if(locale.equals("fr")){
redirectAttributes.addFlashAttribute("indexmsgstd", "Email ou mot de passe incorrect!");
}else {
	redirectAttributes.addFlashAttribute("indexmsgstd", "Login or password is invalid!");
	}			
return "redirect:/authentification";
			}
			else{
				
				Integer idStudent = logins.get(0).getIdStudent();
				Integer actif=logins.get(0).getActif();
				if(actif==0){
				service_student.activercompte(idStudent);	
				}
				List<Student> student = service_student.getStudentById(idStudent);
				String nom=student.get(0).getName();
				session.setAttribute("id_student",student.get(0).getIdStudent());
				session.setAttribute("nom_Student",nom);
				session.setAttribute("connexionstudent", student.get(0).getIdStudent());
				session.setAttribute("emailstudent", student.get(0).getEmail());
				session.setAttribute("type", "student");
				return "redirect:/dashboard_student";
			}
		 }

		@RequestMapping(value="/profil_tutor/connexion_student2",method=RequestMethod.POST)
		 public String cnxTutor2(HttpServletRequest request,Model model,
				 @RequestParam("emailstud") String emailstud,
				 @RequestParam("passwordstud") String passwordstud,
				 Locale locale, RedirectAttributes redirectAttributes ,HttpSession session
		)
		 {
			byte[]   bytesEncoded = Base64.getEncoder().encode(passwordstud.getBytes());
			String psd = new String(bytesEncoded);
			List<Student> logins=service_student.getStudentByLogin(emailstud,psd);
			Integer id_tutor=(Integer) session.getAttribute("id_tutor");
			if (logins.isEmpty())
			{				
				if(locale.equals("fr")){
redirectAttributes.addFlashAttribute("error","Email ou mot de passe incorrect!");
				}else{
redirectAttributes.addFlashAttribute("error","Login or password is invalid!");
				}
				return "redirect:/profil_tutor/"+id_tutor;
			}
			else{
				Integer idStudent = logins.get(0).getIdStudent();
				List<Student> student = service_student.getStudentById(idStudent);
				String nom=student.get(0).getName();
				session.setAttribute("id_student",student.get(0).getIdStudent());
				session.setAttribute("nom_Student",nom);			
				session.setAttribute("connexionstudent", student.get(0).getIdStudent());
				session.setAttribute("emailstudent",student.get(0).getEmail());
				session.setAttribute("type", "student");
				return "redirect:/profil_tutor/"+id_tutor;
			}
		 }
		

		@RequestMapping(value="/profil_student/sendmessagest",method=RequestMethod.GET)
		 public String sendmessagestudent(@RequestParam("emailStudent") String emailStudent,@RequestParam("idstudent") Integer idstudent,@RequestParam("id_tutor") Integer id_tutor,
				 @RequestParam("nom_tutor") String nom_tutor,@RequestParam("textmsg") String textmsg,
				 Locale locale, final RedirectAttributes redirectAttributes)
		 {		
			  List<Student> listStudent =  service_student.getStudentById(idstudent);
	    	  for(Iterator<Student> i = listStudent.iterator();i.hasNext();){
	    		  
	    	  Student item = i.next();
	    	  JSONObject obj = new JSONObject();
	  		  String name=item.getName();
			   String subject ="Contact QuranSpace";
			   String msg = "Assalamu Alaykom,\n"+

			   "Dear "+name+",\n"+
			   nom_tutor+" has sent you the following message:\n"+

				textmsg+"\n"+

			  "-- End of Message\n"+

			   "Please click here http://quranspace.net/profil_tutor/"+id_tutor+" to reply to this message.\n"+

			   "JazakAllah khair,\n"+
			   "Quran Space Team\n"+
			   "QuranSpace.net\n";
			    SimpleMailMessage mail = new SimpleMailMessage();
			    mail.setFrom("info@quranspace.net");	  
		 		mail.setTo(emailStudent);
		 		mail.setSubject(subject);
		 		mail.setText(msg);
		 		mailSender.send(mail); 
		 		 Messages  mg = new Messages();
		    	  mg.setMessage(textmsg);
		    	  mg.setExpediteur(nom_tutor);
		    	  mg.setDestinataire(name);
		    	  DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		    	  LocalDate localDate = LocalDate.now();
		    	  String datemsg=dtf.format(localDate);
			      mg.setDate(datemsg);
			      mg.setType("Contact Student");
				service_tutor.addmessage(mg);
	    	  }
				if(locale.equals("fr")){
redirectAttributes.addFlashAttribute("successsent", "Votre message a été envoyé avec succès!");			
				}else{
redirectAttributes.addFlashAttribute("successsent", "Your message has been sent successfully!");			
				}		
return "redirect:/index";
		 }		
		
		@RequestMapping(value = "/dashboard_student", method = RequestMethod.GET)
		public ModelAndView dashboard_tutor(HttpSession session){
			
			ModelAndView modelAndView = new ModelAndView();
			modelAndView.addObject("id_student", session.getAttribute("id_student"));
			modelAndView.addObject("nom_Student",session.getAttribute("nom_Student"));
			modelAndView.setViewName("espace_student/profil");
			return modelAndView;
			
		}
		@RequestMapping(value = "/webservice_profil_student", method=RequestMethod.GET)
	    @ResponseBody
	    public  String webserviceGetStudentLoginById(HttpSession session, Locale locale) throws JSONException{
			  
			Integer idStudent= (Integer) session.getAttribute("id_student");
			
			  
			  JSONArray array = new JSONArray(); 
	    	  List<Student> listStudent =  service_student.getStudentById(idStudent);
	    	  for(Iterator<Student> i = listStudent.iterator();i.hasNext();){
	    		  
	    	  Student item = i.next();
	    	  JSONObject obj = new JSONObject();

	  		  obj.put("lang",locale);
	  		  obj.put("id",item.getIdStudent());
	  		  obj.put("name",item.getName());
	  		  obj.put("email",item.getEmail());
			  obj.put("picture",item.getPicture());
			  obj.put("about",item.getAboutMe());
			  byte[]   bytesEncoded = Base64.getDecoder().decode(item.getPassword().getBytes());
				String psd = new String(bytesEncoded);
			  obj.put("password",psd);
			  obj.put("subject",item.getsubjects());
			  obj.put("birthdate",item.getbirthdate());
			  obj.put("gender",item.getGender());
			  obj.put("location",item.getLocation());
			  obj.put("language",item.getSpokenlanguage());
			  obj.put("riwaya",item.getRiwayaToLearn());
			  obj.put("certifications",item.getCertifications());
			  obj.put("preferences",item.getLearningPreferences());
			  obj.put("communication",item.getCommunication());
			  obj.put("timezone",item.getTimeZone());
			  obj.put("reviews",item.getReviews());
			  obj.put("membershipdate",item.getMembershipStartDate());
			  array.put(obj);
			 
	    	  }
	    	 return array.toString();
	   
		}	
		 	
		 @RequestMapping(value = "editstudent", method = RequestMethod.POST)
	     public String updatestudent(@RequestParam(value="mod-id") Integer id, @RequestParam(value="mod-name") String name, @RequestParam(value="mod-gender") String  gender , 	 
	    		 @RequestParam(value="mod-password") String password , @RequestParam(value="mod-loc") String  location ,  @RequestParam(value="mod-aboutme") String  aboutme ,
	    		 @RequestParam(value="mod-birthdate") String birthdate , @RequestParam(value="mod-language") String language, @RequestParam(value="mod-subject") String subject,
	    		 @RequestParam(value="mod-com-media") String media, @RequestParam(value="mod-preference") String preference,@RequestParam(value="mod-riwaya") String riwaya,
	    		 @RequestParam(value="mod-certif") String certif, @RequestParam(value="mod-timezone") String timezone
	    		 ){
			 byte[]   bytesEncoded = Base64.getEncoder().encode(password.getBytes());
				String psd = new String(bytesEncoded);
			 service_student.updateStudent(name, gender, psd, location, aboutme, birthdate, language, subject, media, preference, riwaya, certif, timezone, id);
	       return "redirect:/dashboard_student";
	       
	      }	
		 
		 @RequestMapping(value = "uploadphotostud", method = RequestMethod.POST)
	     public String image_student(@RequestParam(value="idimage") Integer idimage,@RequestParam(value="image") MultipartFile image , 
	     		                       HttpServletRequest request)
	     {
			
	     	String name=image.getOriginalFilename();
	     	 ServletContext servletContext = request.getSession().getServletContext();
	  		
	  		String path="resources/images/student";
	  	
	              String rootpath=servletContext.getRealPath(path);
	          	if(!image.isEmpty()){
	    	        try{
	    	            byte[] bytes=image.getBytes();
	    	        File newFile = new File(rootpath);
	    	           if (!newFile.exists()){
	    	                newFile.mkdirs();
	    	            }
	    	            File serverFile = new File(newFile.getAbsolutePath()+File.separator+name);
	    	            BufferedOutputStream stream = new BufferedOutputStream(
	    	                    new FileOutputStream(serverFile));
	    	            stream.write(bytes);
	    	            stream.close();
	    	        }catch(Exception e){
	    	            e.printStackTrace();
	    	        }
	    	    }
	       
	          	service_student.uploadphotostud(name, idimage);
	       return "redirect:/dashboard_student";
	       
	      }

			@RequestMapping(value = "/rechercherStudent", method = RequestMethod.GET)
			public ModelAndView rechercherStudent(){
				
				ModelAndView modelAndView = new ModelAndView();
				modelAndView.setViewName("list_students");
				return modelAndView;
				
			}
			@RequestMapping(value = "/profil_student/{id}", method = RequestMethod.GET)
			public ModelAndView profil_student(@PathVariable("id") int idStudent,HttpSession session){				
				 ModelAndView modelAndView = new ModelAndView();
				 Object connexionstudent= session.getAttribute("connexionstudent"); 
				 if(connexionstudent == null)
			        {
			        	session.setAttribute("connexionstudent", 0);
			        }	
				 modelAndView.addObject("connexionstudent",session.getAttribute("connexionstudent"));
				 modelAndView.setViewName("profil_student");
				 return modelAndView;
				
			}

			@RequestMapping(value = "/profil_student/{id}/getStudentById", method=RequestMethod.GET)
		    @ResponseBody
		    public  String webserviceGetTutorById(@PathVariable("id") int idStudent, Locale locale) throws JSONException{
				
				JSONArray array = new JSONArray(); 
		    	List<Student> listStudent =  service_student.getStudentById(idStudent);
		    	  for(Iterator<Student> i = listStudent.iterator(); i.hasNext(); ){
		    	  Student item = i.next();
		    	  JSONObject obj = new JSONObject();
		  		  obj.put("lang",locale);
		  		  obj.put("id",item.getIdStudent());
		  		  obj.put("name",item.getName());
		  		  obj.put("email",item.getEmail());
				  obj.put("picture",item.getPicture());
				  obj.put("reviews",item.getReviews());
				  obj.put("about",item.getAboutMe());
				  obj.put("language",item.getSpokenlanguage());
				  obj.put("timezone",item.getTimeZone());
				  obj.put("subject",item.getsubjects());
				  obj.put("birthdate",item.getbirthdate());
				  obj.put("gender",item.getGender());
				  obj.put("riwaya",item.getRiwayaToLearn());
				  obj.put("certification",item.getCertifications());
				  obj.put("recitation",item.getCertifications());
				  obj.put("learn_preference",item.getLearningPreferences());
				  obj.put("location",item.getLocation());
				  obj.put("communication",item.getCommunication());
				  array.put(obj);
				 
		    	 }
		    	 return array.toString();
		   
			}
			
			@RequestMapping(value = "/liststudents", method=RequestMethod.GET)
		    @ResponseBody
		    public  String liststudents(Locale locale) throws JSONException{
				
				JSONArray array = new JSONArray(); 
		    	List<Student> listStudent =  service_student.getStudents();
		    	for(Iterator<Student> i = listStudent.iterator(); i.hasNext(); ){
		    	  
		    		Student item = i.next();
		  	      JSONObject obj = new JSONObject();
		  		  obj.put("lang",locale);
				  obj.put("id",item.getIdStudent());
		  		  obj.put("name",item.getName());
				  obj.put("picture",item.getPicture());
				  obj.put("about",item.getAboutMe());
				  obj.put("subjects",item.getsubjects());
				  obj.put("birthdate",item.getbirthdate());
				  obj.put("gender",item.getGender());
				  obj.put("riwaya",item.getRiwayaToLearn());
				  obj.put("certification",item.getCertifications());
				  obj.put("learn_preference",item.getLearningPreferences());
				  obj.put("location",item.getLocation());
				  obj.put("language",item.getSpokenlanguage());
				  array.put(obj);
		  		
		    	}
		    	return array.toString();		   
			}	 
			
			@RequestMapping(value = "/searchstudentsel/{subject}/{location}/{language}", method=RequestMethod.GET)
		    @ResponseBody
		    public  String webserviceListSearchTutorsel(
		    		@PathVariable("subject") String subject ,
		    		@PathVariable("location") String location ,
		    		@PathVariable("language") String language ,
		    		Locale locale
					) throws JSONException{
				JSONArray array = new JSONArray();
				List<Student> listStudent =  service_student.getStudentByCritereel(subject, language, location);
				for(Iterator<Student> i = listStudent.iterator(); i.hasNext(); ){    	  
		    	  Student item = i.next();
		  	      JSONObject obj = new JSONObject();
		  		  obj.put("lang",locale);
				  obj.put("id",item.getIdStudent());
		  		  obj.put("name",item.getName());
				  obj.put("picture",item.getPicture());
				  obj.put("about",item.getAboutMe());
				  obj.put("subjects",item.getsubjects());
				  obj.put("birthdate",item.getbirthdate());
				  obj.put("gender",item.getGender());
				  obj.put("riwaya",item.getRiwayaToLearn());
				  obj.put("certification",item.getCertifications());
				  obj.put("learn_preference",item.getLearningPreferences());
				  obj.put("location",item.getLocation());
				  obj.put("language",item.getSpokenlanguage());
				  array.put(obj);
		  		
		    	}
		    	return array.toString();   
			}
			
			@RequestMapping(value = "/searchstudentses/{gender}/{location}/{language}", method=RequestMethod.GET)
		    @ResponseBody
		    public  String webserviceListSearchstudentsel(
		    		@PathVariable("gender") String gender ,
		    		@PathVariable("location") String location ,
		    		@PathVariable("language") String language , Locale locale
					) throws JSONException{
				JSONArray array = new JSONArray();
				List<Student> listStudent =  service_student.getStudentByCritereses(gender, language, location);
				for(Iterator<Student> i = listStudent.iterator(); i.hasNext(); ){    	  
		    	  Student item = i.next();
		  	      JSONObject obj = new JSONObject();
		  		  obj.put("lang",locale);
				  obj.put("id",item.getIdStudent());
		  		  obj.put("name",item.getName());
				  obj.put("picture",item.getPicture());
				  obj.put("about",item.getAboutMe());
				  obj.put("subjects",item.getsubjects());
				  obj.put("birthdate",item.getbirthdate());
				  obj.put("gender",item.getGender());
				  obj.put("riwaya",item.getRiwayaToLearn());
				  obj.put("certification",item.getCertifications());
				  obj.put("learn_preference",item.getLearningPreferences());
				  obj.put("location",item.getLocation());
				  obj.put("language",item.getSpokenlanguage());
				  array.put(obj);
		  		
		    	}
		    	return array.toString();   
			}
			
			@RequestMapping(value = "/searchstudentselo/{gender}/{subject}/{language}", method=RequestMethod.GET)
		    @ResponseBody
		    public  String webserviceListSearchstudentselo(
		    		@PathVariable("gender") String gender ,
		    		@PathVariable("subject") String subject ,
		    		@PathVariable("language") String language , Locale locale
					) throws JSONException{
				JSONArray array = new JSONArray();
				List<Student> listStudent =  service_student.getStudentByCritereselo(gender, language, subject);
				for(Iterator<Student> i = listStudent.iterator(); i.hasNext(); ){    	  
		    	  Student item = i.next();
		  	      JSONObject obj = new JSONObject();
		  		  obj.put("lang",locale);
				  obj.put("id",item.getIdStudent());
		  		  obj.put("name",item.getName());
				  obj.put("picture",item.getPicture());
				  obj.put("about",item.getAboutMe());
				  obj.put("subjects",item.getsubjects());
				  obj.put("birthdate",item.getbirthdate());
				  obj.put("gender",item.getGender());
				  obj.put("riwaya",item.getRiwayaToLearn());
				  obj.put("certification",item.getCertifications());
				  obj.put("learn_preference",item.getLearningPreferences());
				  obj.put("location",item.getLocation());
				  obj.put("language",item.getSpokenlanguage());
				  array.put(obj);
		  		
		    	}
		    	return array.toString();   
			}
			@RequestMapping(value = "/searchstudentselg/{gender}/{subject}/{location}", method=RequestMethod.GET)
		    @ResponseBody
		    public  String webserviceListsearchstudentselg(
		    		@PathVariable("gender") String gender ,
		    		@PathVariable("subject") String subject ,
		    		@PathVariable("location") String location , Locale locale
					) throws JSONException{
				JSONArray array = new JSONArray();
				List<Student> listStudent =  service_student.getStudentByCritereselg(gender, subject, location);
				for(Iterator<Student> i = listStudent.iterator(); i.hasNext(); ){    	  
		    	  Student item = i.next();
		  	      JSONObject obj = new JSONObject();
		  		  obj.put("lang",locale);
				  obj.put("id",item.getIdStudent());
		  		  obj.put("name",item.getName());
				  obj.put("picture",item.getPicture());
				  obj.put("about",item.getAboutMe());
				  obj.put("subjects",item.getsubjects());
				  obj.put("birthdate",item.getbirthdate());
				  obj.put("gender",item.getGender());
				  obj.put("riwaya",item.getRiwayaToLearn());
				  obj.put("certification",item.getCertifications());
				  obj.put("learn_preference",item.getLearningPreferences());
				  obj.put("location",item.getLocation());
				  obj.put("language",item.getSpokenlanguage());
				  array.put(obj);
		  		
		    	}
		    	return array.toString();   
			}
			@RequestMapping(value = "/searchstudentsegs/{location}/{language}", method=RequestMethod.GET)
		    @ResponseBody
		    public  String webserviceListsearchstudentsegs(
		    		@PathVariable("location") String location,
		    		@PathVariable("language") String language, Locale locale
					) throws JSONException{
				JSONArray array = new JSONArray();
				List<Student> listStudent =  service_student.getStudentByCriteresegs(location,language);
				for(Iterator<Student> i = listStudent.iterator(); i.hasNext(); ){    	  
		    	  Student item = i.next();
		  	      JSONObject obj = new JSONObject();
		  		  obj.put("lang",locale);
				  obj.put("id",item.getIdStudent());
		  		  obj.put("name",item.getName());
				  obj.put("picture",item.getPicture());
				  obj.put("about",item.getAboutMe());
				  obj.put("subjects",item.getsubjects());
				  obj.put("birthdate",item.getbirthdate());
				  obj.put("gender",item.getGender());
				  obj.put("riwaya",item.getRiwayaToLearn());
				  obj.put("certification",item.getCertifications());
				  obj.put("learn_preference",item.getLearningPreferences());
				  obj.put("location",item.getLocation());
				  obj.put("language",item.getSpokenlanguage());
				  array.put(obj);
		  		
		    	}
		    	return array.toString();   
			}	
			
			@RequestMapping(value = "/searchstudentseslo/{gender}/{language}", method=RequestMethod.GET)
		    @ResponseBody
		    public  String webserviceListsearchstudentseslo(
		    		@PathVariable("gender") String gender,
		    		@PathVariable("language") String language, Locale locale
					) throws JSONException{
				JSONArray array = new JSONArray();
				List<Student> listStudent =  service_student.getStudentByCritereseslo(gender,language);
				for(Iterator<Student> i = listStudent.iterator(); i.hasNext(); ){    	  
		    	  Student item = i.next();
		  	      JSONObject obj = new JSONObject();
		  		  obj.put("lang",locale);
				  obj.put("id",item.getIdStudent());
		  		  obj.put("name",item.getName());
				  obj.put("picture",item.getPicture());
				  obj.put("about",item.getAboutMe());
				  obj.put("subjects",item.getsubjects());
				  obj.put("birthdate",item.getbirthdate());
				  obj.put("gender",item.getGender());
				  obj.put("riwaya",item.getRiwayaToLearn());
				  obj.put("certification",item.getCertifications());
				  obj.put("learn_preference",item.getLearningPreferences());
				  obj.put("location",item.getLocation());
				  obj.put("language",item.getSpokenlanguage());
				  array.put(obj);
		  		
		    	}
		    	return array.toString();   
			}	

			@RequestMapping(value = "/searchstudentselol/{gender}/{subject}", method=RequestMethod.GET)
		    @ResponseBody
		    public  String webserviceListsearchstudentselol(
		    		@PathVariable("gender") String gender,
		    		@PathVariable("subject") String subject, Locale locale
					) throws JSONException{
				JSONArray array = new JSONArray();
				List<Student> listStudent =  service_student.getStudentByCritereselol(gender,subject);
				for(Iterator<Student> i = listStudent.iterator(); i.hasNext(); ){    	  
		    	  Student item = i.next();
		  	      JSONObject obj = new JSONObject();
		  		  obj.put("lang",locale);
				  obj.put("id",item.getIdStudent());
		  		  obj.put("name",item.getName());
				  obj.put("picture",item.getPicture());
				  obj.put("about",item.getAboutMe());
				  obj.put("subjects",item.getsubjects());
				  obj.put("birthdate",item.getbirthdate());
				  obj.put("gender",item.getGender());
				  obj.put("riwaya",item.getRiwayaToLearn());
				  obj.put("certification",item.getCertifications());
				  obj.put("learn_preference",item.getLearningPreferences());
				  obj.put("location",item.getLocation());
				  obj.put("language",item.getSpokenlanguage());
				  array.put(obj);
		  		
		    	}
		    	return array.toString();   
			}		

			@RequestMapping(value = "/searchstudentseslg/{gender}/{location}", method=RequestMethod.GET)
		    @ResponseBody
		    public  String webserviceListsearchstudentselg(
		    		@PathVariable("gender") String gender,
		    		@PathVariable("location") String location, Locale locale
					) throws JSONException{
				JSONArray array = new JSONArray();
				List<Student> listStudent =  service_student.getStudentByCritereselg(gender,location);
				for(Iterator<Student> i = listStudent.iterator(); i.hasNext(); ){    	  
		    	  Student item = i.next();
		  	      JSONObject obj = new JSONObject();
		  		  obj.put("lang",locale);
				  obj.put("id",item.getIdStudent());
		  		  obj.put("name",item.getName());
				  obj.put("picture",item.getPicture());
				  obj.put("about",item.getAboutMe());
				  obj.put("subjects",item.getsubjects());
				  obj.put("birthdate",item.getbirthdate());
				  obj.put("gender",item.getGender());
				  obj.put("riwaya",item.getRiwayaToLearn());
				  obj.put("certification",item.getCertifications());
				  obj.put("learn_preference",item.getLearningPreferences());
				  obj.put("location",item.getLocation());
				  obj.put("language",item.getSpokenlanguage());
				  array.put(obj);
		  		
		    	}
		    	return array.toString();   
			}	

			@RequestMapping(value = "/searchstudentseglg/{subject}/{location}", method=RequestMethod.GET)
		    @ResponseBody
		    public  String webserviceListsearchstudentseglg(
		    		@PathVariable("subject") String subject,
		    		@PathVariable("location") String location, Locale locale
					) throws JSONException{
				JSONArray array = new JSONArray();
				List<Student> listStudent =  service_student.getStudentByCritereseglg(subject,location);
				for(Iterator<Student> i = listStudent.iterator(); i.hasNext(); ){    	  
		    	  Student item = i.next();
		  	      JSONObject obj = new JSONObject();
		  		  obj.put("lang",locale);
				  obj.put("id",item.getIdStudent());
		  		  obj.put("name",item.getName());
				  obj.put("picture",item.getPicture());
				  obj.put("about",item.getAboutMe());
				  obj.put("subjects",item.getsubjects());
				  obj.put("birthdate",item.getbirthdate());
				  obj.put("gender",item.getGender());
				  obj.put("riwaya",item.getRiwayaToLearn());
				  obj.put("certification",item.getCertifications());
				  obj.put("learn_preference",item.getLearningPreferences());
				  obj.put("location",item.getLocation());
				  obj.put("language",item.getSpokenlanguage());
				  array.put(obj);
		  		
		    	}
		    	return array.toString();   
			}	

			@RequestMapping(value = "/searchstudentseglo/{subject}/{language}", method=RequestMethod.GET)
		    @ResponseBody
		    public  String webserviceListsearchstudentseglo(
		    		@PathVariable("subject") String subject,
		    		@PathVariable("language") String language, Locale locale
					) throws JSONException{
				JSONArray array = new JSONArray();
				List<Student> listStudent =  service_student.getStudentByCritereseglo(subject,language);
				for(Iterator<Student> i = listStudent.iterator(); i.hasNext(); ){    	  
		    	  Student item = i.next();
		  	      JSONObject obj = new JSONObject();
		  		  obj.put("lang",locale);
				  obj.put("id",item.getIdStudent());
		  		  obj.put("name",item.getName());
				  obj.put("picture",item.getPicture());
				  obj.put("about",item.getAboutMe());
				  obj.put("subjects",item.getsubjects());
				  obj.put("birthdate",item.getbirthdate());
				  obj.put("gender",item.getGender());
				  obj.put("riwaya",item.getRiwayaToLearn());
				  obj.put("certification",item.getCertifications());
				  obj.put("learn_preference",item.getLearningPreferences());
				  obj.put("location",item.getLocation());
				  obj.put("language",item.getSpokenlanguage());
				  array.put(obj);
		  		
		    	}
		    	return array.toString();   
			}				

			@RequestMapping(value = "/searchstudentsg/{gender}", method=RequestMethod.GET)
		    @ResponseBody
		    public  String webserviceListsearchstudentsg(
		    		@PathVariable("gender") String gender, Locale locale
					) throws JSONException{
				JSONArray array = new JSONArray();
				List<Student> listStudent =  service_student.getStudentByCriteresg(gender);
				for(Iterator<Student> i = listStudent.iterator(); i.hasNext(); ){    	  
		    	  Student item = i.next();
		  	      JSONObject obj = new JSONObject();
		  		  obj.put("lang",locale);
				  obj.put("id",item.getIdStudent());
		  		  obj.put("name",item.getName());
				  obj.put("picture",item.getPicture());
				  obj.put("about",item.getAboutMe());
				  obj.put("subjects",item.getsubjects());
				  obj.put("birthdate",item.getbirthdate());
				  obj.put("gender",item.getGender());
				  obj.put("riwaya",item.getRiwayaToLearn());
				  obj.put("certification",item.getCertifications());
				  obj.put("learn_preference",item.getLearningPreferences());
				  obj.put("location",item.getLocation());
				  obj.put("language",item.getSpokenlanguage());
				  array.put(obj);
		  		
		    	}
		    	return array.toString();   
			}			

			@RequestMapping(value = "/searchstudentssub/{subject}", method=RequestMethod.GET)
		    @ResponseBody
		    public  String webserviceListsearchstudentsb(
		    		@PathVariable("subject") String subject, Locale locale
					) throws JSONException{
				JSONArray array = new JSONArray();
				List<Student> listStudent =  service_student.getStudentByCriteresub(subject);
				for(Iterator<Student> i = listStudent.iterator(); i.hasNext(); ){    	  
		    	  Student item = i.next();
		  	      JSONObject obj = new JSONObject();
		  		  obj.put("lang",locale);
				  obj.put("id",item.getIdStudent());
		  		  obj.put("name",item.getName());
				  obj.put("picture",item.getPicture());
				  obj.put("about",item.getAboutMe());
				  obj.put("subjects",item.getsubjects());
				  obj.put("birthdate",item.getbirthdate());
				  obj.put("gender",item.getGender());
				  obj.put("riwaya",item.getRiwayaToLearn());
				  obj.put("certification",item.getCertifications());
				  obj.put("learn_preference",item.getLearningPreferences());
				  obj.put("location",item.getLocation());
				  obj.put("language",item.getSpokenlanguage());
				  array.put(obj);
		  		
		    	}
		    	return array.toString();   
			}							

			@RequestMapping(value = "/searchstudentslo/{location}", method=RequestMethod.GET)
		    @ResponseBody
		    public  String webserviceListsearchstudentslo(
		    		@PathVariable("location") String location, Locale locale
					) throws JSONException{
				JSONArray array = new JSONArray();
				List<Student> listStudent =  service_student.getStudentByCritereslo(location);
				for(Iterator<Student> i = listStudent.iterator(); i.hasNext(); ){    	  
		    	  Student item = i.next();
		  	      JSONObject obj = new JSONObject();
		  		  obj.put("lang",locale);
				  obj.put("id",item.getIdStudent());
		  		  obj.put("name",item.getName());
				  obj.put("picture",item.getPicture());
				  obj.put("about",item.getAboutMe());
				  obj.put("subjects",item.getsubjects());
				  obj.put("birthdate",item.getbirthdate());
				  obj.put("gender",item.getGender());
				  obj.put("riwaya",item.getRiwayaToLearn());
				  obj.put("certification",item.getCertifications());
				  obj.put("learn_preference",item.getLearningPreferences());
				  obj.put("location",item.getLocation());
				  obj.put("language",item.getSpokenlanguage());
				  array.put(obj);
		  		
		    	}
		    	return array.toString();   
			}	
			
@RequestMapping(value = "/searchstudentslg/{language}", method=RequestMethod.GET)
@ResponseBody
public  String webserviceListsearchstudentslg(
	@PathVariable("language") String language, Locale locale
	) throws JSONException{
JSONArray array = new JSONArray();
List<Student> listStudent =  service_student.getStudentByCritereslg(language);
for(Iterator<Student> i = listStudent.iterator(); i.hasNext(); ){    	  
  Student item = i.next();
    JSONObject obj = new JSONObject();
	  obj.put("lang",locale);
  obj.put("id",item.getIdStudent());
	  obj.put("name",item.getName());
  obj.put("picture",item.getPicture());
  obj.put("about",item.getAboutMe());
  obj.put("subjects",item.getsubjects());
  obj.put("birthdate",item.getbirthdate());
  obj.put("gender",item.getGender());
  obj.put("riwaya",item.getRiwayaToLearn());
  obj.put("certification",item.getCertifications());
  obj.put("learn_preference",item.getLearningPreferences());
  obj.put("location",item.getLocation());
  obj.put("language",item.getSpokenlanguage());
  array.put(obj);
	
}
return array.toString();   
}							

@RequestMapping(value = "/searchstudents/{gender}/{subject}/{location}/{language}", method=RequestMethod.GET)
@ResponseBody
public  String webserviceListSearchStudents(
		@PathVariable("gender") String gender ,
		@PathVariable("subject") String subject ,
		@PathVariable("location") String location ,
		@PathVariable("language") String language , Locale locale
		) throws JSONException{
	JSONArray array = new JSONArray();
	List<Student> listStudent =  service_student.getStudentByCriteres(gender, subject, location, language);
	for(Iterator<Student> i = listStudent.iterator(); i.hasNext(); ){    	  
	  Student item = i.next();
	      JSONObject obj = new JSONObject();
  		  obj.put("lang",locale);
	  obj.put("id",item.getIdStudent());
		  obj.put("name",item.getName());
	  obj.put("picture",item.getPicture());
	  obj.put("about",item.getAboutMe());
	  obj.put("subjects",item.getsubjects());
	  obj.put("birthdate",item.getbirthdate());
	  obj.put("gender",item.getGender());
	  obj.put("riwaya",item.getRiwayaToLearn());
	  obj.put("certification",item.getCertifications());
	  obj.put("learn_preference",item.getLearningPreferences());
	  obj.put("location",item.getLocation());
	  obj.put("language",item.getSpokenlanguage());
	  array.put(obj);
		
	}
	return array.toString();   
}
				
		 @RequestMapping(value="/deconnexion")
			public String deconnexionetudiant(HttpServletRequest request){
				 HttpSession session = request.getSession(); 
				session.setAttribute("connexionstudent",0);
				session.setAttribute("type","");
				 session.invalidate();
				   return "redirect:/index";
			}
}
