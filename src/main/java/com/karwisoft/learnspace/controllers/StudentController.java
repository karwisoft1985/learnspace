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
import com.karwisoft.learnspace.beans.Student;
import com.karwisoft.learnspace.beans.Tuto;
import com.karwisoft.learnspace.services.StudentServices;


@Controller
public class StudentController {

	@Autowired
	private StudentServices service_student;
	
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
			 final RedirectAttributes redirectAttributes
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
					redirectAttributes.addFlashAttribute("warning", "Your email is already exist !");
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

"To begin learning: \n"+
"1.      Login with your credentials: "+email+" / "+password+ "\n"+
"2.      Search the Tutor that you see fit with your needs and budget;  \n"+
"3.      Contact the Tutor to setup an appointment with him/her; \n"+
"4.      Start your learning journey \n"+

"Again, we are happy to have you aboard, and hope acquire the good knowledge and you benefit from it in this Donya and hereafter. \n"+

"For any questions reply to this email or send an email to info@quranspace.net \n"+

"JazakAllah khair, \n"+
"Quran Space Team \n"+
"QuranSpace.net \n";
              
                 //fin contenu du message//	        
          // creates a simple e-mail object
          SimpleMailMessage mail = new SimpleMailMessage();	         
        
  		mail.setTo(email);
  		mail.setSubject("Account activation QuranSpace");
  		mail.setText(message);
  		
  		// sends the e-mail
  		  mailSender.send(mail);

		redirectAttributes.addFlashAttribute("success", "You have successfully registered! You will find your access on your mailbox!");  
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
				 final RedirectAttributes redirectAttributes)
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
     		"This is your new password, we strongly encourage you to change it as soon as you�re logged in:"+ psd +"\n"+

     		"We are hoping that you are enjoying your journey with us.\n"+
     		"For any questions please reply to this email or send an email to info@quranspace.net\n"+

     		"JazakAllah khair,\n"+
     		"Quran Space Team\n"+
     		"QuranSpace.net\n";
	  		email.setText(message);	  		
	  		mailSender.send(email);
     		}
	  	redirectAttributes.addFlashAttribute("success", "Your password has been reset, please check your mailbox for your new password.");				 			
         return "redirect:/forgotpassword";
	    }
	
		
		@RequestMapping(value="/connexion_student",method=RequestMethod.POST)
		 public String cnxTutor(HttpServletRequest request,Model model,
				 @RequestParam("emailstud") String emailstud,
				 @RequestParam("passwordstud") String passwordstud,RedirectAttributes redirectAttributes ,HttpSession session
		)
		 {
			byte[]   bytesEncoded = Base64.getEncoder().encode(passwordstud.getBytes());
			String psd = new String(bytesEncoded);
			List<Student> logins=service_student.getStudentByLogin(emailstud,psd);
			if (logins.isEmpty())
			{				
				redirectAttributes.addFlashAttribute("indexmsgstd", "Login or password is invalid!");
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
				 @RequestParam("passwordstud") String passwordstud,RedirectAttributes redirectAttributes ,HttpSession session
		)
		 {
			byte[]   bytesEncoded = Base64.getEncoder().encode(passwordstud.getBytes());
			String psd = new String(bytesEncoded);
			List<Student> logins=service_student.getStudentByLogin(emailstud,psd);
			Integer id_tutor=(Integer) session.getAttribute("id_tutor");
			if (logins.isEmpty())
			{				
				redirectAttributes.addFlashAttribute("error","Login or password is invalid!");
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
				 @RequestParam("nom_tutor") String nom_tutor,@RequestParam("textmsg") String textmsg,final RedirectAttributes redirectAttributes)
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
	    	  }
		redirectAttributes.addFlashAttribute("successsent", "Your message has been sent successfully!");			
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
	    public  String webserviceGetStudentLoginById(HttpSession session) throws JSONException{
			  
			Integer idStudent= (Integer) session.getAttribute("id_student");
			
			  
			  JSONArray array = new JSONArray(); 
	    	  List<Student> listStudent =  service_student.getStudentById(idStudent);
	    	  for(Iterator<Student> i = listStudent.iterator();i.hasNext();){
	    		  
	    	  Student item = i.next();
	    	  JSONObject obj = new JSONObject();
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
		    public  String webserviceGetTutorById(@PathVariable("id") int idStudent) throws JSONException{
				
				JSONArray array = new JSONArray(); 
		    	List<Student> listStudent =  service_student.getStudentById(idStudent);
		    	  for(Iterator<Student> i = listStudent.iterator(); i.hasNext(); ){
		    	  Student item = i.next();
		    	  JSONObject obj = new JSONObject();
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
			
		 
		 @RequestMapping(value="/deconnexion")
			public String deconnexionetudiant(HttpServletRequest request){
				 HttpSession session = request.getSession(); 
				session.setAttribute("connexionstudent",0);
				session.setAttribute("type","");
				 session.invalidate();
				   return "redirect:/index";
			}
}
