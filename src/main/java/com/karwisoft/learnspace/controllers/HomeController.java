package com.karwisoft.learnspace.controllers;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.Locale;


/**
  * Handles requests for the application home page.
*/
@Controller
public class HomeController {
	@Autowired
	private JavaMailSender mailSender;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String  home(RedirectAttributes redirectAttributes){
	    return "redirect:/index";
	}
	
	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public ModelAndView acceuil(HttpSession session){
		ModelAndView modelAndView = new ModelAndView();
		 Object connexionstudent= session.getAttribute("connexionstudent"); 
		 if(connexionstudent == null)
	        {
	        	session.setAttribute("connexionstudent", 0);
	        }	
		modelAndView.setViewName("index");
		return modelAndView;
	}
	
	@RequestMapping(value = "/contact", method = RequestMethod.POST)
	public String addcontact(@RequestParam(value="namecontact")  String nom, @RequestParam(value="emailcontact") String email,
			@RequestParam(value="subjectcontact") String sujet,@RequestParam(value="messagecontact")  String message, 
			Locale locale, final RedirectAttributes redirectAttributes) {
		

		String recipientAddress = "info@quranspace.net";
		 String subject =sujet;
		 String msg = "Name: " + nom +"\n"+
				 "Email: "+email+"\n"+
				 "Message: "+message+"\n";
		 
		    SimpleMailMessage mail = new SimpleMailMessage();
		    mail.setFrom("info@quranspace.net");
		    mail.setReplyTo(email);		  
	  		mail.setTo(recipientAddress);
	  		mail.setSubject(subject);
	  		mail.setText(msg);
	  		mailSender.send(mail);
if(locale.equals("fr")){
redirectAttributes.addFlashAttribute("successcontact", "Votre message a été envoyé avec succès!");  
}else {
redirectAttributes.addFlashAttribute("successcontact", "Your message has been sent successfully!");  
}
		  return "redirect:/index";
		 
	}
	
}
