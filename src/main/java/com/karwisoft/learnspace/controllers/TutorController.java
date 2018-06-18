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
import com.karwisoft.learnspace.services.TutorServices;

@Controller
public class TutorController {

	@Autowired
	private TutorServices service_tutor;

	@Autowired
	private JavaMailSender mailSender;	
	

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public ModelAndView login(){
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("login");
		return modelAndView;
	}
	
	
	@RequestMapping(value = "/inscription", method = RequestMethod.GET)
	public ModelAndView inscription(){
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("inscription");
		return modelAndView;
		
	}
	
	@RequestMapping(value = "/forgot_password", method = RequestMethod.GET)
	public ModelAndView forgot_password(){
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("forgot_password");
		return modelAndView;
		
	}

	 @RequestMapping(value = "/forgotpass" , method = RequestMethod.POST)
	    public String forgotpass(Model model,@RequestParam String emailtutor,
				 final RedirectAttributes redirectAttributes)
	    {
		  SimpleMailMessage email = new SimpleMailMessage();
	         
	        email.setFrom("info@quranspace.net");
	  		email.setTo(emailtutor);
	  		email.setSubject("Access Quranspace");
	  		List<Tuto> lp = service_tutor.getTutoBymail(emailtutor);
	  		for(Tuto p : lp)
     		{
	  		String name=p.getName();
	  		String password=p.getPassword();
	  		byte[]   bytesEncoded = Base64.getDecoder().decode(password.getBytes());
			String psd = new String(bytesEncoded);
	       
     		String message="Assalamu Alaykom,\n"+

     		"Dear "+ name +",\n"+

     		"You recently requested a Password reset\n"+
     		"This is your new password, we strongly encourage you to change it as soon as you’re logged in: "+ psd +"\n"+

     		"We are hoping that you are enjoying your journey with us.\n"+
     		"For any questions please reply to this email or send an email to info@quranspace.net\n"+

     		"JazakAllah khair,\n"+
     		"Quran Space Team\n"+
     		"QuranSpace.net\n";
	  		email.setText(message);	  		
	  		mailSender.send(email);
     		}
	  	redirectAttributes.addFlashAttribute("success", "Your password has been reset, please check your mailbox for your new password.");				 			
         return "redirect:/forgot_password";
	    }
	

		@RequestMapping(value = "/profil_tutor/{id}", method = RequestMethod.GET)
		public ModelAndView profil_tutor(@PathVariable("id") int idTutor,HttpSession session){
			
			 ModelAndView modelAndView = new ModelAndView();
			 session.setAttribute("id_tutor",idTutor);
			 Object connexionstudent= session.getAttribute("connexionstudent"); 
			 if(connexionstudent == null)
		        {
		        	session.setAttribute("connexionstudent", 0);
		        }	
			 modelAndView.addObject("connexionstudent",session.getAttribute("connexionstudent"));
			 modelAndView.setViewName("profil_tutor");
			 return modelAndView;
			
		}

		@RequestMapping(value="/UpdateTutor",method=RequestMethod.POST)
		 public String UpdateTutor(HttpServletRequest request,Model model,
				 @RequestParam("mod-name") String modName,
				 @RequestParam("mod-loc-rech") String modLocRech ,
				 @RequestParam("mod-password") String modPassword ,
				 @RequestParam("mod-subj") String modSub1 ,
				 @RequestParam("mod-language") String modlanguage ,
				 @RequestParam("mod-preference") String modPreference ,
				 @RequestParam("mod-hourly") String modHourly ,
				 @RequestParam("mod-previous-exp") String modPreviousexp ,				 
				 @RequestParam("mod-com-media") String modComMedia ,
				 @RequestParam("mod-riwaya") String modRiwaya ,
				 @RequestParam("mod-certif") String modCertif,
				 @RequestParam("mod-age") Integer  modAge,
				 @RequestParam("mod-aboutme") String  modAbout,
				 @RequestParam("mod-timezone") String  modTimeZone,
					@RequestParam("recitation") MultipartFile recitation,
				 final RedirectAttributes redirectAttributes , 
				 HttpSession session
				 )
		         {
			String name=recitation.getOriginalFilename();
	     	 ServletContext servletContext = request.getSession().getServletContext();
	  		
	  		String path="resources/images/tutor/recitation";
	  	
	              String rootpath=servletContext.getRealPath(path);
	          	if(!recitation.isEmpty()){
	    	        try{
	    	            byte[] bytes=recitation.getBytes();
	    	        File newFile = new File(rootpath);
	    	        System.out.println(newFile);
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
			       Integer id_tutor = (Integer) session.getAttribute("id_tutor");
			       byte[]   bytesEncoded = Base64.getEncoder().encode(modPassword.getBytes());
					String psd = new String(bytesEncoded);
			       service_tutor.UpdateTutor(modName,modAge,modLocRech,psd,modHourly,modSub1,modlanguage,modPreference,modComMedia,modRiwaya,modCertif,modPreviousexp,modAbout,modTimeZone,name,id_tutor);
			       return "redirect:/dashboard_tutor";
			 
		        }
		
		 
		 @RequestMapping(value = "uploadphototutor", method = RequestMethod.POST)
	     public String image_student(@RequestParam(value="idimage") Integer idimage,@RequestParam(value="image") MultipartFile image , 
	     		                       HttpServletRequest request)
	     {
			
	     	String name=image.getOriginalFilename();
	     	 ServletContext servletContext = request.getSession().getServletContext();
	  		
	  		String path="resources/images/tutor";
	  	
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
	       
	          	service_tutor.uploadphototutor(name, idimage);
	       return "redirect:/dashboard_tutor";
	       
	      }
		
		@RequestMapping(value="/addInscriTutor",method=RequestMethod.POST)
		 public String addinscri(HttpServletRequest request,Model model,
				 @RequestParam("name") String name,
				 @RequestParam("loc-rech") String location ,
				 @RequestParam("lan-rech") String language ,
				 @RequestParam("gender") String gender ,
				 @RequestParam("email") String email ,
				 @RequestParam("sub1") String sub1,
				 final RedirectAttributes redirectAttributes
				 )
		 {
			 UUID uuid=UUID.randomUUID();
			    String str=uuid.toString().replace("-", "");
			    String password= str.substring(0, 8);
			    byte[]   bytesEncoded = Base64.getEncoder().encode(password.getBytes());
				String psd = new String(bytesEncoded);
			    Integer actif=0;
			    DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd");
			    LocalDate localDate = LocalDate.now();
			    String startdate=dtf.format(localDate);
			    String picture="people_character_avatar_smile_2-22-512.png";
			    if(gender.equals("Woman")){
			    picture ="image.png";
			    }  
			    Tuto tutor = new Tuto(
			         name,
					 picture,
					 "",
					 email,
					 psd,
					 0,
					 "",
					 sub1,
					 0,
					 gender,
					 "",
					 "",
					 "",
					 "",
					 "",
					 "",
					 location,
					 language,
					 "",
					 "",
					 startdate,
					 actif
					 );
			 List<Tuto> tut=service_tutor.getTutoBymail(email);
			 if(tut.size() != 0){
			redirectAttributes.addFlashAttribute("warning", "Your email is already exist !");
			return "redirect:/login";
			 }
			 else{
			 service_tutor.addTutor(tutor);
			 String message = "Welcome to Quran Space \n"+
					 "Assalamu Alaykom,\n"+

					" Dear "+ name+ ",\n"+

					 "We are happy that you decided to join Quran Space Community. Quran Space is a free non-profit platform that brings together Quran Tutors and Students.\n"+ 
					 "Here are your credentials to access your profile: "+ email + " / " +password+"\n"+

					 "We strongly encourage you to update your profile, so Students can find you easily.\n"+

					" Again, we are happy to have you aboard, and hope you can transfer the knowledge you have to the world and get the good reward from Allah.\n"+

					 "For any questions please reply to this email or send an email to info@quranspace.net\n"+

					 "JazakAllah khair,\n"+
					 "Quran Space Team\n"+
					" QuranSpace.net\n";
	              
	                 //fin contenu du message//	        
	          // creates a simple e-mail object
	          SimpleMailMessage mail = new SimpleMailMessage();	         
	        
	  		mail.setTo(email);
	  		mail.setSubject("Account activation QuranSpace");
	  		mail.setText(message);
	  		
	  		// sends the e-mail
	  		  mailSender.send(mail);
			 redirectAttributes.addFlashAttribute("success", "You have successfully registered! You will find your access on your mailbox!");			
			 return "redirect:/inscription";
		 }
		 }

		@RequestMapping(value="/profil_student/connexion_tutor2",method=RequestMethod.POST)
		 public String cnxTutor2(HttpServletRequest request,Model model,
				 @RequestParam("emailtut") String emailtut,	 @RequestParam("id") Integer id,
				 @RequestParam("passwordtut") String passwordtut,RedirectAttributes redirectAttributes ,HttpSession session
		)
		 {
			byte[]   bytesEncoded = Base64.getEncoder().encode(passwordtut.getBytes());
			String psd = new String(bytesEncoded);
			List<Tuto> logins=service_tutor.getTutorByLogin(emailtut, psd);
			if (logins.isEmpty())
			{		
				redirectAttributes.addFlashAttribute("error","Login or password is invalid!");
				return "redirect:/profil_student/"+id;
			}
			else{
				Integer idTutor = logins.get(0).getIdTutor();
				List<Tuto> tutor = service_tutor.getTutorById(idTutor);
				String nom=tutor.get(0).getName();
				session.setAttribute("id_tutor",tutor.get(0).getIdTutor());
				session.setAttribute("nom_Student",nom);		
				session.setAttribute("connexionstudent", tutor.get(0).getIdTutor());
				session.setAttribute("emailstudent",tutor.get(0).getEmail());
				session.setAttribute("type", "tutor");
				return "redirect:/profil_student/"+id;
			}
		 }
		
		@RequestMapping(value="/connexion_tutor",method=RequestMethod.POST)
		 public String cnxTutor(HttpServletRequest request,Model model,
				 @RequestParam("emailTutor") String emailTutor,
				 @RequestParam("passwordTutor") String passwordTutor,RedirectAttributes redirectAttributes ,HttpSession session
		)
		 {
			byte[]   bytesEncoded = Base64.getEncoder().encode(passwordTutor.getBytes());
			String psd = new String(bytesEncoded);
			List<Tuto> logins=service_tutor.getTutorByLogin(emailTutor,psd);
			if (logins.isEmpty())
			{				
				redirectAttributes.addFlashAttribute("indexmsg", "Login or password is invalid!");
				return "redirect:/login";
			}
			else{
				
				Integer idTutor = logins.get(0).getIdTutor();
				Integer actif=logins.get(0).getActif();
				if(actif==0){
				service_tutor.activercompte(idTutor);	
				}
				List<Tuto> tutor = service_tutor.getTutorById(idTutor);
				String nom=tutor.get(0).getName();
				session.setAttribute("id_tutor",tutor.get(0).getIdTutor());
				session.setAttribute("nom_Student",nom);		
				session.setAttribute("connexionstudent", tutor.get(0).getIdTutor());
				session.setAttribute("emailstudent",tutor.get(0).getEmail());
				session.setAttribute("type", "tutor");
				return "redirect:/dashboard_tutor";
			}
		 }
		
		@RequestMapping(value = "/rechercherTutor", method = RequestMethod.GET)
		public ModelAndView rechercherTutor(){
			
			ModelAndView modelAndView = new ModelAndView();
			modelAndView.setViewName("list_tutors");
			return modelAndView;
			
		}		
		
		@RequestMapping(value = "/listtutors", method=RequestMethod.GET)
	    @ResponseBody
	    public  String webserviceListOrdreMenuByEmplacement() throws JSONException{
			
			JSONArray array = new JSONArray(); 
	    	List<Tuto> listTutor =  service_tutor.getTutor();
	    	for(Iterator<Tuto> i = listTutor.iterator(); i.hasNext(); ){
	    	  
	    	  Tuto item = i.next();
	  	      JSONObject obj = new JSONObject();
			  obj.put("id",item.getIdTutor());
	  		  obj.put("name",item.getName());
	  		  obj.put("hourly",item.getHourly());
			  obj.put("picture",item.getPicture());
			  obj.put("nb_reviews",item.getNbReviews());
			  obj.put("about",item.getAbout());
			  obj.put("subject_icanteach",item.getSubjectIcanteach());
			  obj.put("age",item.getAge());
			  obj.put("gender",item.getGender());
			  obj.put("riwaya",item.getRiwaya());
			  obj.put("subject_verif",item.getSubjectVerif());
			  obj.put("certification",item.getCertification());
			  obj.put("recitation",item.getRecitation());
			  obj.put("teach_preference",item.getTeachPreference());
			  obj.put("media_cam",item.getMediaCam());
			  obj.put("location",item.getLocation());
			  obj.put("language",item.getLanguage());
			  obj.put("preview_experience",item.getPreviewExperience());
			  array.put(obj);
	  		
	    	}
	    	return array.toString();
	   
		}
		

		@RequestMapping(value="/profil_tutor/sendmessage",method=RequestMethod.GET)
		 public String sendmessagetutor(@RequestParam("emailTut") String email,@RequestParam("idTut") Integer idTut,@RequestParam("id_student") Integer id_student,
				 @RequestParam("nom_Student") String nom_Student,@RequestParam("textmsg") String textmsg,final RedirectAttributes redirectAttributes)
		 {		
			  List<Tuto> listTutor =  service_tutor.getTutorById(idTut);
	    	  for(Iterator<Tuto> i = listTutor.iterator();i.hasNext();){
	    		  
	    	  Tuto item = i.next();
	    	  JSONObject obj = new JSONObject();
	  		  String name=item.getName();
			   String subject ="Contact QuranSpace";
			   String msg = "Assalamu Alaykom,\n"+

			   "Dear "+name+",\n"+
			   nom_Student+" has sent you the following message:\n"+

				textmsg+"\n"+

			  "-- End of Message\n"+

			   "Please click here http://quranspace.net/profil_student/"+id_student+" to reply to this message.\n"+

			   "JazakAllah khair,\n"+
			   "Quran Space Team\n"+
			   "QuranSpace.net\n";
			    SimpleMailMessage mail = new SimpleMailMessage();
			    mail.setFrom("info@quranspace.net");	  
		 		mail.setTo(email);
		 		mail.setSubject(subject);
		 		mail.setText(msg);
		 		mailSender.send(mail); 
	    	  }
		redirectAttributes.addFlashAttribute("successsent", "Your message has been sent successfully!");			
		return "redirect:/index";
		 }
	
		@RequestMapping(value = "/dashboard_tutor", method = RequestMethod.GET)
		public ModelAndView dashboard_tutor(HttpSession session){
			
			ModelAndView modelAndView = new ModelAndView();
			modelAndView.addObject("id_tutor", session.getAttribute("id_tutor"));
			modelAndView.addObject("nom_tutor",session.getAttribute("nom_tutor"));
			modelAndView.setViewName("espace_tutor/profil");
			return modelAndView;
			
		}
		
		
		@RequestMapping(value = "/webservice_profil_dashboard_tutor", method=RequestMethod.GET)
	    @ResponseBody
	    public  String webserviceGetTutorLoginById(HttpSession session) throws JSONException{
			  
			Integer idTutor= (Integer) session.getAttribute("id_tutor");
			
			  
			  JSONArray array = new JSONArray(); 
	    	  List<Tuto> listTutor =  service_tutor.getTutorById(idTutor);
	    	  for(Iterator<Tuto> i = listTutor.iterator();i.hasNext();){
	    		  
	    	  Tuto item = i.next();
	    	  JSONObject obj = new JSONObject();
	  		  obj.put("id",item.getIdTutor());
	  		  obj.put("name",item.getName());
	  		  obj.put("email",item.getEmail());
	  		  obj.put("timezone",item.getTimeZone());
	  		  obj.put("hourly",item.getHourly());
			  obj.put("picture",item.getPicture());
			  obj.put("nb_reviews",item.getNbReviews());
			  obj.put("about",item.getAbout());
			  obj.put("subject_icanteach",item.getSubjectIcanteach());
			  obj.put("language",item.getLanguage());
			  obj.put("age",item.getAge());
			  byte[]   bytesEncoded = Base64.getDecoder().decode(item.getPassword().getBytes());
			  String psd = new String(bytesEncoded);
			  obj.put("password",psd);
			  obj.put("gender",item.getGender());
			  obj.put("riwaya",item.getRiwaya());
			  obj.put("subject_verif",item.getSubjectVerif());
			  obj.put("certification",item.getCertification());
			  obj.put("recitation",item.getRecitation());
			  obj.put("teach_preference",item.getTeachPreference());
			  obj.put("media_cam",item.getMediaCam());
			  obj.put("location",item.getLocation());
			  obj.put("startdate",item.getMembershipStartDate());
			  obj.put("preview_experience",item.getPreviewExperience());
			  array.put(obj);
			 
	    	  }
	    	 return array.toString();
	   
		}

		@RequestMapping(value = "/profil_tutor/{id}/getTutorById", method=RequestMethod.GET)
	    @ResponseBody
	    public  String webserviceGetTutorById(@PathVariable("id") int idTutor) throws JSONException{
			
			JSONArray array = new JSONArray(); 
	    	List<Tuto> listTutor =  service_tutor.getTutorById(idTutor);
	    	  for(Iterator<Tuto> i = listTutor.iterator(); i.hasNext(); ){
	    	  Tuto item = i.next();
	    	  JSONObject obj = new JSONObject();
	  		  obj.put("id",item.getIdTutor());
	  		  obj.put("name",item.getName());
	  		  obj.put("email",item.getEmail());
	  		  obj.put("hourly",item.getHourly());
			  obj.put("picture",item.getPicture());
			  obj.put("nb_reviews",item.getNbReviews());
			  obj.put("about",item.getAbout());
			  obj.put("language",item.getLanguage());
			  obj.put("timezone",item.getTimeZone());
			  obj.put("subject_icanteach",item.getSubjectIcanteach());
			  obj.put("age",item.getAge());
			  obj.put("gender",item.getGender());
			  obj.put("riwaya",item.getRiwaya());
			  obj.put("subject_verif",item.getSubjectVerif());
			  obj.put("certification",item.getCertification());
			  obj.put("recitation",item.getRecitation());
			  obj.put("teach_preference",item.getTeachPreference());
			  obj.put("media_cam",item.getMediaCam());
			  obj.put("location",item.getLocation());
			  obj.put("preview_experience",item.getPreviewExperience());
			  array.put(obj);
			 
	    	 }
	    	 return array.toString();
	   
		}
		
		
		@RequestMapping(value = "/searchtutorsel/{subject}/{location}/{language}", method=RequestMethod.GET)
	    @ResponseBody
	    public  String webserviceListSearchTutorsel(
	    		@PathVariable("subject") String subject ,
	    		@PathVariable("location") String location ,
	    		@PathVariable("language") String language 
				) throws JSONException{
			JSONArray array = new JSONArray();
			List<Tuto> listTutor =  service_tutor.getTutorByCritereel(subject, language, location);    	
			for(Iterator<Tuto> i = listTutor.iterator(); i.hasNext(); ){    	  
	    	  Tuto item = i.next();
	  	      JSONObject obj = new JSONObject();
	  		  obj.put("id",item.getIdTutor());
	  		  obj.put("name",item.getName());
	  		  obj.put("hourly",item.getHourly());
			  obj.put("picture",item.getPicture());
			  obj.put("nb_reviews",item.getNbReviews());
			  obj.put("about",item.getAbout());
			  obj.put("subject_icanteach",item.getSubjectIcanteach());
			  obj.put("age",item.getAge());
			  obj.put("gender",item.getGender());
			  obj.put("riwaya",item.getRiwaya());
			  obj.put("subject_verif",item.getSubjectVerif());
			  obj.put("certification",item.getCertification());
			  obj.put("recitation",item.getRecitation());
			  obj.put("teach_preference",item.getTeachPreference());
			  obj.put("media_cam",item.getMediaCam());
			  obj.put("location",item.getLocation());
			  obj.put("language",item.getLanguage());
			  obj.put("preview_experience",item.getPreviewExperience());
			  array.put(obj);
	  		
	    	}
	    	return array.toString();   
		}	
		
		@RequestMapping(value = "/searchtutorses/{gender}/{location}/{language}", method=RequestMethod.GET)
	    @ResponseBody
	    public  String webserviceListSearchTutorses(
	    		@PathVariable("gender") String gender ,
	    		@PathVariable("location") String location ,
	    		@PathVariable("language") String language 
				) throws JSONException{
			JSONArray array = new JSONArray();
			List<Tuto> listTutor =  service_tutor.getTutorByCriterees(gender, language, location);    	
			for(Iterator<Tuto> i = listTutor.iterator(); i.hasNext(); ){    	  
	    	  Tuto item = i.next();
	  	      JSONObject obj = new JSONObject();
	  		  obj.put("id",item.getIdTutor());
	  		  obj.put("name",item.getName());
	  		  obj.put("hourly",item.getHourly());
			  obj.put("picture",item.getPicture());
			  obj.put("nb_reviews",item.getNbReviews());
			  obj.put("about",item.getAbout());
			  obj.put("subject_icanteach",item.getSubjectIcanteach());
			  obj.put("age",item.getAge());
			  obj.put("gender",item.getGender());
			  obj.put("riwaya",item.getRiwaya());
			  obj.put("subject_verif",item.getSubjectVerif());
			  obj.put("certification",item.getCertification());
			  obj.put("recitation",item.getRecitation());
			  obj.put("teach_preference",item.getTeachPreference());
			  obj.put("media_cam",item.getMediaCam());
			  obj.put("location",item.getLocation());
			  obj.put("language",item.getLanguage());
			  obj.put("preview_experience",item.getPreviewExperience());
			  array.put(obj);
	  		
	    	}
	    	return array.toString();   
		}
		
		@RequestMapping(value = "/searchtutorselo/{gender}/{subject}/{language}", method=RequestMethod.GET)
	    @ResponseBody
	    public  String webserviceListSearchTutorselo(
	    		@PathVariable("gender") String gender ,
	    		@PathVariable("subject") String subject ,
	    		@PathVariable("language") String language 
				) throws JSONException{
			JSONArray array = new JSONArray();
			List<Tuto> listTutor =  service_tutor.getTutorByCritereelo(gender, subject, language);    	
			for(Iterator<Tuto> i = listTutor.iterator(); i.hasNext(); ){    	  
	    	  Tuto item = i.next();
	  	      JSONObject obj = new JSONObject();
	  		  obj.put("id",item.getIdTutor());
	  		  obj.put("name",item.getName());
	  		  obj.put("hourly",item.getHourly());
			  obj.put("picture",item.getPicture());
			  obj.put("nb_reviews",item.getNbReviews());
			  obj.put("about",item.getAbout());
			  obj.put("subject_icanteach",item.getSubjectIcanteach());
			  obj.put("age",item.getAge());
			  obj.put("gender",item.getGender());
			  obj.put("riwaya",item.getRiwaya());
			  obj.put("subject_verif",item.getSubjectVerif());
			  obj.put("certification",item.getCertification());
			  obj.put("recitation",item.getRecitation());
			  obj.put("teach_preference",item.getTeachPreference());
			  obj.put("media_cam",item.getMediaCam());
			  obj.put("location",item.getLocation());
			  obj.put("language",item.getLanguage());
			  obj.put("preview_experience",item.getPreviewExperience());
			  array.put(obj);
	  		
	    	}
	    	return array.toString();   
		}

		@RequestMapping(value = "/searchtutorselg/{gender}/{subject}/{location}", method=RequestMethod.GET)
	    @ResponseBody
	    public  String webserviceListSearchTutorselg(
	    		@PathVariable("gender") String gender ,
	    		@PathVariable("subject") String subject ,
	    		@PathVariable("location") String location 
				) throws JSONException{
			JSONArray array = new JSONArray();
			List<Tuto> listTutor =  service_tutor.getTutorByCritereelg(gender, subject, location);    	
			for(Iterator<Tuto> i = listTutor.iterator(); i.hasNext(); ){    	  
	    	  Tuto item = i.next();
	  	      JSONObject obj = new JSONObject();
	  		  obj.put("id",item.getIdTutor());
	  		  obj.put("name",item.getName());
	  		  obj.put("hourly",item.getHourly());
			  obj.put("picture",item.getPicture());
			  obj.put("nb_reviews",item.getNbReviews());
			  obj.put("about",item.getAbout());
			  obj.put("subject_icanteach",item.getSubjectIcanteach());
			  obj.put("age",item.getAge());
			  obj.put("gender",item.getGender());
			  obj.put("riwaya",item.getRiwaya());
			  obj.put("subject_verif",item.getSubjectVerif());
			  obj.put("certification",item.getCertification());
			  obj.put("recitation",item.getRecitation());
			  obj.put("teach_preference",item.getTeachPreference());
			  obj.put("media_cam",item.getMediaCam());
			  obj.put("location",item.getLocation());
			  obj.put("language",item.getLanguage());
			  obj.put("preview_experience",item.getPreviewExperience());
			  array.put(obj);
	  		
	    	}
	    	return array.toString();   
		}

		@RequestMapping(value = "/searchtutorsegs/{location}/{language}", method=RequestMethod.GET)
	    @ResponseBody
	    public  String webserviceListSearchTutorsegs(
	    		@PathVariable("location") String location ,
	    		@PathVariable("language") String language 
				) throws JSONException{
			JSONArray array = new JSONArray();
			List<Tuto> listTutor =  service_tutor.getTutorByCritereegs(location, language);    	
			for(Iterator<Tuto> i = listTutor.iterator(); i.hasNext(); ){    	  
	    	  Tuto item = i.next();
	  	      JSONObject obj = new JSONObject();
	  		  obj.put("id",item.getIdTutor());
	  		  obj.put("name",item.getName());
	  		  obj.put("hourly",item.getHourly());
			  obj.put("picture",item.getPicture());
			  obj.put("nb_reviews",item.getNbReviews());
			  obj.put("about",item.getAbout());
			  obj.put("subject_icanteach",item.getSubjectIcanteach());
			  obj.put("age",item.getAge());
			  obj.put("gender",item.getGender());
			  obj.put("riwaya",item.getRiwaya());
			  obj.put("subject_verif",item.getSubjectVerif());
			  obj.put("certification",item.getCertification());
			  obj.put("recitation",item.getRecitation());
			  obj.put("teach_preference",item.getTeachPreference());
			  obj.put("media_cam",item.getMediaCam());
			  obj.put("location",item.getLocation());
			  obj.put("language",item.getLanguage());
			  obj.put("preview_experience",item.getPreviewExperience());
			  array.put(obj);
	  		
	    	}
	    	return array.toString();   
		}

		@RequestMapping(value = "/searchtutorseslo/{gender}/{language}", method=RequestMethod.GET)
	    @ResponseBody
	    public  String webserviceListSearchTutorseslo(
	    		@PathVariable("gender") String gender ,
	    		@PathVariable("language") String language 
				) throws JSONException{
			JSONArray array = new JSONArray();
			List<Tuto> listTutor =  service_tutor.getTutorByCritereeslo(gender, language);    	
			for(Iterator<Tuto> i = listTutor.iterator(); i.hasNext(); ){    	  
	    	  Tuto item = i.next();
	  	      JSONObject obj = new JSONObject();
	  		  obj.put("id",item.getIdTutor());
	  		  obj.put("name",item.getName());
	  		  obj.put("hourly",item.getHourly());
			  obj.put("picture",item.getPicture());
			  obj.put("nb_reviews",item.getNbReviews());
			  obj.put("about",item.getAbout());
			  obj.put("subject_icanteach",item.getSubjectIcanteach());
			  obj.put("age",item.getAge());
			  obj.put("gender",item.getGender());
			  obj.put("riwaya",item.getRiwaya());
			  obj.put("subject_verif",item.getSubjectVerif());
			  obj.put("certification",item.getCertification());
			  obj.put("recitation",item.getRecitation());
			  obj.put("teach_preference",item.getTeachPreference());
			  obj.put("media_cam",item.getMediaCam());
			  obj.put("location",item.getLocation());
			  obj.put("language",item.getLanguage());
			  obj.put("preview_experience",item.getPreviewExperience());
			  array.put(obj);
	  		
	    	}
	    	return array.toString();   
		}

		@RequestMapping(value = "/searchtutorselol/{gender}/{subject}", method=RequestMethod.GET)
	    @ResponseBody
	    public  String webserviceListSearchTutorselol(
	    		@PathVariable("gender") String gender ,
	    		@PathVariable("subject") String subject 
				) throws JSONException{
			JSONArray array = new JSONArray();
			List<Tuto> listTutor =  service_tutor.getTutorByCritereelol(gender, subject);    	
			for(Iterator<Tuto> i = listTutor.iterator(); i.hasNext(); ){    	  
	    	  Tuto item = i.next();
	  	      JSONObject obj = new JSONObject();
	  		  obj.put("id",item.getIdTutor());
	  		  obj.put("name",item.getName());
	  		  obj.put("hourly",item.getHourly());
			  obj.put("picture",item.getPicture());
			  obj.put("nb_reviews",item.getNbReviews());
			  obj.put("about",item.getAbout());
			  obj.put("subject_icanteach",item.getSubjectIcanteach());
			  obj.put("age",item.getAge());
			  obj.put("gender",item.getGender());
			  obj.put("riwaya",item.getRiwaya());
			  obj.put("subject_verif",item.getSubjectVerif());
			  obj.put("certification",item.getCertification());
			  obj.put("recitation",item.getRecitation());
			  obj.put("teach_preference",item.getTeachPreference());
			  obj.put("media_cam",item.getMediaCam());
			  obj.put("location",item.getLocation());
			  obj.put("language",item.getLanguage());
			  obj.put("preview_experience",item.getPreviewExperience());
			  array.put(obj);
	  		
	    	}
	    	return array.toString();   
		}

		@RequestMapping(value = "/searchtutorseslg/{gender}/{location}", method=RequestMethod.GET)
	    @ResponseBody
	    public  String webserviceListSearchTutorseslg(
	    		@PathVariable("gender") String gender ,
	    		@PathVariable("location") String location 
				) throws JSONException{
			JSONArray array = new JSONArray();
			List<Tuto> listTutor =  service_tutor.getTutorByCritereeslg(gender, location);    	
			for(Iterator<Tuto> i = listTutor.iterator(); i.hasNext(); ){    	  
	    	  Tuto item = i.next();
	  	      JSONObject obj = new JSONObject();
	  		  obj.put("id",item.getIdTutor());
	  		  obj.put("name",item.getName());
	  		  obj.put("hourly",item.getHourly());
			  obj.put("picture",item.getPicture());
			  obj.put("nb_reviews",item.getNbReviews());
			  obj.put("about",item.getAbout());
			  obj.put("subject_icanteach",item.getSubjectIcanteach());
			  obj.put("age",item.getAge());
			  obj.put("gender",item.getGender());
			  obj.put("riwaya",item.getRiwaya());
			  obj.put("subject_verif",item.getSubjectVerif());
			  obj.put("certification",item.getCertification());
			  obj.put("recitation",item.getRecitation());
			  obj.put("teach_preference",item.getTeachPreference());
			  obj.put("media_cam",item.getMediaCam());
			  obj.put("location",item.getLocation());
			  obj.put("language",item.getLanguage());
			  obj.put("preview_experience",item.getPreviewExperience());
			  array.put(obj);
	  		
	    	}
	    	return array.toString();   
		}


		@RequestMapping(value = "/searchtutorseglg/{subject}/{location}", method=RequestMethod.GET)
	    @ResponseBody
	    public  String webserviceListSearchTutorseglg(
	    		@PathVariable("subject") String subject ,
	    		@PathVariable("location") String location 
				) throws JSONException{
			JSONArray array = new JSONArray();
			List<Tuto> listTutor =  service_tutor.getTutorByCritereeglg(subject, location);    	
			for(Iterator<Tuto> i = listTutor.iterator(); i.hasNext(); ){    	  
	    	  Tuto item = i.next();
	  	      JSONObject obj = new JSONObject();
	  		  obj.put("id",item.getIdTutor());
	  		  obj.put("name",item.getName());
	  		  obj.put("hourly",item.getHourly());
			  obj.put("picture",item.getPicture());
			  obj.put("nb_reviews",item.getNbReviews());
			  obj.put("about",item.getAbout());
			  obj.put("subject_icanteach",item.getSubjectIcanteach());
			  obj.put("age",item.getAge());
			  obj.put("gender",item.getGender());
			  obj.put("riwaya",item.getRiwaya());
			  obj.put("subject_verif",item.getSubjectVerif());
			  obj.put("certification",item.getCertification());
			  obj.put("recitation",item.getRecitation());
			  obj.put("teach_preference",item.getTeachPreference());
			  obj.put("media_cam",item.getMediaCam());
			  obj.put("location",item.getLocation());
			  obj.put("language",item.getLanguage());
			  obj.put("preview_experience",item.getPreviewExperience());
			  array.put(obj);
	  		
	    	}
	    	return array.toString();   
		}

		@RequestMapping(value = "/searchtutorseglo/{subject}/{language}", method=RequestMethod.GET)
	    @ResponseBody
	    public  String webserviceListSearchTutorseglo(
	    		@PathVariable("subject") String subject ,
	    		@PathVariable("language") String language 
				) throws JSONException{
			JSONArray array = new JSONArray();
			List<Tuto> listTutor =  service_tutor.getTutorByCritereeglo(subject, language);    	
			for(Iterator<Tuto> i = listTutor.iterator(); i.hasNext(); ){    	  
	    	  Tuto item = i.next();
	  	      JSONObject obj = new JSONObject();
	  		  obj.put("id",item.getIdTutor());
	  		  obj.put("name",item.getName());
	  		  obj.put("hourly",item.getHourly());
			  obj.put("picture",item.getPicture());
			  obj.put("nb_reviews",item.getNbReviews());
			  obj.put("about",item.getAbout());
			  obj.put("subject_icanteach",item.getSubjectIcanteach());
			  obj.put("age",item.getAge());
			  obj.put("gender",item.getGender());
			  obj.put("riwaya",item.getRiwaya());
			  obj.put("subject_verif",item.getSubjectVerif());
			  obj.put("certification",item.getCertification());
			  obj.put("recitation",item.getRecitation());
			  obj.put("teach_preference",item.getTeachPreference());
			  obj.put("media_cam",item.getMediaCam());
			  obj.put("location",item.getLocation());
			  obj.put("language",item.getLanguage());
			  obj.put("preview_experience",item.getPreviewExperience());
			  array.put(obj);
	  		
	    	}
	    	return array.toString();   
		}
		
		@RequestMapping(value = "/searchtutorsg/{gender}", method=RequestMethod.GET)
	    @ResponseBody
	    public  String webserviceListSearchTutorsg(
	    		@PathVariable("gender") String gender 
				) throws JSONException{
			JSONArray array = new JSONArray();
			List<Tuto> listTutor =  service_tutor.getTutorByCritereg(gender);    	
			for(Iterator<Tuto> i = listTutor.iterator(); i.hasNext(); ){    	  
	    	  Tuto item = i.next();
	  	      JSONObject obj = new JSONObject();
	  		  obj.put("id",item.getIdTutor());
	  		  obj.put("name",item.getName());
	  		  obj.put("hourly",item.getHourly());
			  obj.put("picture",item.getPicture());
			  obj.put("nb_reviews",item.getNbReviews());
			  obj.put("about",item.getAbout());
			  obj.put("subject_icanteach",item.getSubjectIcanteach());
			  obj.put("age",item.getAge());
			  obj.put("gender",item.getGender());
			  obj.put("riwaya",item.getRiwaya());
			  obj.put("subject_verif",item.getSubjectVerif());
			  obj.put("certification",item.getCertification());
			  obj.put("recitation",item.getRecitation());
			  obj.put("teach_preference",item.getTeachPreference());
			  obj.put("media_cam",item.getMediaCam());
			  obj.put("location",item.getLocation());
			  obj.put("language",item.getLanguage());
			  obj.put("preview_experience",item.getPreviewExperience());
			  array.put(obj);
	  		
	    	}
	    	return array.toString();   
		}

		@RequestMapping(value = "/searchtutorssub/{subject}", method=RequestMethod.GET)
	    @ResponseBody
	    public  String webserviceListSearchTutorssub(
	    		@PathVariable("subject") String subject 
				) throws JSONException{
			JSONArray array = new JSONArray();
			List<Tuto> listTutor =  service_tutor.getTutorByCriteresub(subject);    	
			for(Iterator<Tuto> i = listTutor.iterator(); i.hasNext(); ){    	  
	    	  Tuto item = i.next();
	  	      JSONObject obj = new JSONObject();
	  		  obj.put("id",item.getIdTutor());
	  		  obj.put("name",item.getName());
	  		  obj.put("hourly",item.getHourly());
			  obj.put("picture",item.getPicture());
			  obj.put("nb_reviews",item.getNbReviews());
			  obj.put("about",item.getAbout());
			  obj.put("subject_icanteach",item.getSubjectIcanteach());
			  obj.put("age",item.getAge());
			  obj.put("gender",item.getGender());
			  obj.put("riwaya",item.getRiwaya());
			  obj.put("subject_verif",item.getSubjectVerif());
			  obj.put("certification",item.getCertification());
			  obj.put("recitation",item.getRecitation());
			  obj.put("teach_preference",item.getTeachPreference());
			  obj.put("media_cam",item.getMediaCam());
			  obj.put("location",item.getLocation());
			  obj.put("language",item.getLanguage());
			  obj.put("preview_experience",item.getPreviewExperience());
			  array.put(obj);
	  		
	    	}
	    	return array.toString();   
		}
		
		@RequestMapping(value = "/searchtutorslo/{location}", method=RequestMethod.GET)
	    @ResponseBody
	    public  String webserviceListSearchTutorslo(
	    		@PathVariable("location") String location 
				) throws JSONException{
			JSONArray array = new JSONArray();
			List<Tuto> listTutor =  service_tutor.getTutorByCriterelo(location);    	
			for(Iterator<Tuto> i = listTutor.iterator(); i.hasNext(); ){    	  
	    	  Tuto item = i.next();
	  	      JSONObject obj = new JSONObject();
	  		  obj.put("id",item.getIdTutor());
	  		  obj.put("name",item.getName());
	  		  obj.put("hourly",item.getHourly());
			  obj.put("picture",item.getPicture());
			  obj.put("nb_reviews",item.getNbReviews());
			  obj.put("about",item.getAbout());
			  obj.put("subject_icanteach",item.getSubjectIcanteach());
			  obj.put("age",item.getAge());
			  obj.put("gender",item.getGender());
			  obj.put("riwaya",item.getRiwaya());
			  obj.put("subject_verif",item.getSubjectVerif());
			  obj.put("certification",item.getCertification());
			  obj.put("recitation",item.getRecitation());
			  obj.put("teach_preference",item.getTeachPreference());
			  obj.put("media_cam",item.getMediaCam());
			  obj.put("location",item.getLocation());
			  obj.put("language",item.getLanguage());
			  obj.put("preview_experience",item.getPreviewExperience());
			  array.put(obj);
	  		
	    	}
	    	return array.toString();   
		}
		
		@RequestMapping(value = "/searchtutorslg/{language}", method=RequestMethod.GET)
	    @ResponseBody
	    public  String webserviceListSearchTutorslg(
	    		@PathVariable("language") String language 
				) throws JSONException{
			JSONArray array = new JSONArray();
			List<Tuto> listTutor =  service_tutor.getTutorByCriterelg(language);    	
			for(Iterator<Tuto> i = listTutor.iterator(); i.hasNext(); ){    	  
	    	  Tuto item = i.next();
	  	      JSONObject obj = new JSONObject();
	  		  obj.put("id",item.getIdTutor());
	  		  obj.put("name",item.getName());
	  		  obj.put("hourly",item.getHourly());
			  obj.put("picture",item.getPicture());
			  obj.put("nb_reviews",item.getNbReviews());
			  obj.put("about",item.getAbout());
			  obj.put("subject_icanteach",item.getSubjectIcanteach());
			  obj.put("age",item.getAge());
			  obj.put("gender",item.getGender());
			  obj.put("riwaya",item.getRiwaya());
			  obj.put("subject_verif",item.getSubjectVerif());
			  obj.put("certification",item.getCertification());
			  obj.put("recitation",item.getRecitation());
			  obj.put("teach_preference",item.getTeachPreference());
			  obj.put("media_cam",item.getMediaCam());
			  obj.put("location",item.getLocation());
			  obj.put("language",item.getLanguage());
			  obj.put("preview_experience",item.getPreviewExperience());
			  array.put(obj);
	  		
	    	}
	    	return array.toString();   
		}
		
		@RequestMapping(value = "/searchtutors/{gender}/{subject}/{location}/{language}", method=RequestMethod.GET)
	    @ResponseBody
	    public  String webserviceListSearchTutors(
	    		@PathVariable("gender") String gender ,
	    		@PathVariable("subject") String subject ,
	    		@PathVariable("location") String location ,
	    		@PathVariable("language") String language 
				) throws JSONException{
			JSONArray array = new JSONArray();
			List<Tuto> listTutor =  service_tutor.getTutorByCritere(subject, language, gender, location);    	
			for(Iterator<Tuto> i = listTutor.iterator(); i.hasNext(); ){    	  
	    	  Tuto item = i.next();
	  	      JSONObject obj = new JSONObject();
	  		  obj.put("id",item.getIdTutor());
	  		  obj.put("name",item.getName());
	  		  obj.put("hourly",item.getHourly());
			  obj.put("picture",item.getPicture());
			  obj.put("nb_reviews",item.getNbReviews());
			  obj.put("about",item.getAbout());
			  obj.put("subject_icanteach",item.getSubjectIcanteach());
			  obj.put("age",item.getAge());
			  obj.put("gender",item.getGender());
			  obj.put("riwaya",item.getRiwaya());
			  obj.put("subject_verif",item.getSubjectVerif());
			  obj.put("certification",item.getCertification());
			  obj.put("recitation",item.getRecitation());
			  obj.put("teach_preference",item.getTeachPreference());
			  obj.put("media_cam",item.getMediaCam());
			  obj.put("location",item.getLocation());
			  obj.put("language",item.getLanguage());
			  obj.put("preview_experience",item.getPreviewExperience());
			  array.put(obj);
	  		
	    	}
	    	return array.toString();   
		}
		
		
	
}
