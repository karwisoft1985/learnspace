package com.karwisoft.learnspace.dao;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.karwisoft.learnspace.beans.Messages;
import com.karwisoft.learnspace.beans.Review;
import com.karwisoft.learnspace.beans.Tuto;
import com.project.hibernate.HibernateUtil;
public class TutorDaoImp implements TutorDao{

	@Override
	public List<Tuto> getTutor() {
		
		SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
        Session session = sessionFactory.openSession();
        session.beginTransaction();
        Integer actif = 1;
        String hql = "FROM Tuto where actif = :actif order by hourly asc";
        Query query = session.createQuery(hql);
	     query.setParameter("actif", actif);
        List<Tuto> resps = (List<Tuto>) query.list();
        session.getTransaction().commit(); 
		session.close();
        return resps;
        
	}

	@Override
	public Integer addTutor(Tuto t) {
		
		Session session =  HibernateUtil.getSessionFactory().openSession();
		session.beginTransaction();
		session.save(t);
		session.getTransaction().commit();
		return t.getIdTutor();
		
	}

	@Override
	public List<Tuto> getTutorById(Integer id) {
		
		SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
        Session session = sessionFactory.openSession();
        String hql = "FROM Tuto T WHERE T.idTutor = :id order by idTutor desc";
        Query query = session.createQuery(hql);
        query.setParameter("id",id);
        List<Tuto> resps = (List<Tuto>) query.list();
        session.close();
        return resps;
	}

	@Override
	public List<Tuto> getTutorByLogin(String email, String password) {
		
		SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
        Session session = sessionFactory.openSession();
        String hql = "FROM Tuto T WHERE T.email = :email AND T.password = :password order by idTutor desc";
        Query query = session.createQuery(hql);
        query.setParameter("email",email);
        query.setParameter("password",password);
        List<Tuto> resps = (List<Tuto>) query.list();
        session.close();
        return resps;
	
	}

	@Override
	public List<Tuto> getTutorByCritere(String subject, String language, String gender, String location){
		
		SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
        Session session = sessionFactory.openSession();  
        Integer actif = 1;
        String hql = "FROM Tuto T WHERE T.gender = :gender and T.actif = :actif and T.subjectIcanteach like :subject and T.location = :location and T.language like :language order by hourly asc";
        Query query = session.createQuery(hql);
        String lg= "%" + language + "%";
        String sbj= "%" + subject + "%";
	     query.setParameter("actif", actif);	
        query.setParameter("gender",gender);
        query.setParameter("subject",sbj);
        query.setParameter("location",location);
        query.setParameter("language",lg);
        List<Tuto> resps = (List<Tuto>) query.list();
        session.close();
        return resps;
	}

	public List<Tuto> getTutorByCritereel(String subject, String language, String location) {
		SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
        Session session = sessionFactory.openSession();
        Integer actif =1;
        String hql = "FROM Tuto T WHERE T.subjectIcanteach like :subject and T.actif = :actif and T.location = :location and T.language like :language order by hourly asc";
        Query query = session.createQuery(hql); 
        String lg= "%" + language + "%";
        String sbj= "%" + subject + "%";
	     query.setParameter("actif", actif);
        query.setParameter("subject",sbj);
        query.setParameter("location",location);
        query.setParameter("language",lg);
        List<Tuto> resps = (List<Tuto>) query.list();
        session.close();
        return resps;
	}

	public List<Tuto> getTutorByCriterees(String gender, String language, String location) {
		SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
        Session session = sessionFactory.openSession();
        Integer actif = 1;
        String hql = "FROM Tuto T WHERE T.gender = :gender and T.actif = :actif and T.location = :location and T.language like :language order by hourly asc";
        Query query = session.createQuery(hql); 
        String lg= "%" + language + "%";
	    query.setParameter("actif", actif);
        query.setParameter("gender",gender);
        query.setParameter("location",location);
        query.setParameter("language",lg);
        List<Tuto> resps = (List<Tuto>) query.list();
        session.close();
        return resps;
	}

	public List<Tuto> getTutorByCritereelo(String gender, String subject, String language) {
		SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
        Session session = sessionFactory.openSession();
        Integer actif =1;
        String hql = "FROM Tuto T WHERE T.gender = :gender and T.actif = :actif and T.subjectIcanteach like :subject and T.language like :language order by hourly asc";
        Query query = session.createQuery(hql); 
        String lg= "%" + language + "%";
        String sbj= "%" + subject + "%";
	     query.setParameter("actif", actif);
        query.setParameter("gender",gender);
        query.setParameter("subject",sbj);
        query.setParameter("language",lg);
        List<Tuto> resps = (List<Tuto>) query.list();
        session.close();
        return resps;
	}

	public List<Tuto> getTutorByCritereelg(String gender, String subject, String location) {
		SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
        Session session = sessionFactory.openSession();
        Integer actif = 1;
        String hql = "FROM Tuto T WHERE T.gender = :gender and T.actif = :actif and T.subjectIcanteach like :subject and T.location= :location order by hourly asc";
        Query query = session.createQuery(hql); 
        String sbj= "%" + subject + "%";
	     query.setParameter("actif", actif);
        query.setParameter("gender",gender);
        query.setParameter("subject",sbj);
        query.setParameter("location",location);
        List<Tuto> resps = (List<Tuto>) query.list();
        session.close();
        return resps;
	}

	public List<Tuto> getTutorByCritereegs(String location, String language) {
		SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
        Session session = sessionFactory.openSession();
        Integer actif = 1;
        String hql = "FROM Tuto T WHERE T.location = :location and T.actif = :actif and T.language like :language order by hourly asc";
        Query query = session.createQuery(hql);
        String lg= "%" + language + "%";
	    query.setParameter("actif", actif);
        query.setParameter("location",location);
        query.setParameter("language",lg);
        List<Tuto> resps = (List<Tuto>) query.list();
        session.close();
        return resps;
	}

	public List<Tuto> getTutorByCritereeslo(String gender, String language) {
		SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
        Session session = sessionFactory.openSession();
        Integer actif = 1;
        String hql = "FROM Tuto T WHERE T.gender = :gender and T.actif = :actif and T.language like :language order by hourly asc";
        Query query = session.createQuery(hql);
        String lg= "%" + language + "%";
	     query.setParameter("actif", actif);
        query.setParameter("gender",gender);
        query.setParameter("language",lg);
        List<Tuto> resps = (List<Tuto>) query.list();
        session.close();
        return resps;
	}

	public List<Tuto> getTutorByCritereelol(String gender, String subject) {
		SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
        Session session = sessionFactory.openSession();
        Integer actif = 1;
        String hql = "FROM Tuto T WHERE T.gender = :gender and T.actif = :actif and T.subjectIcanteach like :subject order by hourly asc";
        Query query = session.createQuery(hql);
        String sbj= "%" + subject + "%";
	     query.setParameter("actif", actif);
        query.setParameter("gender",gender);
        query.setParameter("subject",sbj);
        List<Tuto> resps = (List<Tuto>) query.list();
        session.close();
        return resps;
	}

	public List<Tuto> getTutorByCritereeslg(String gender, String location) {
		SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
        Session session = sessionFactory.openSession();
        Integer actif = 1;
        String hql = "FROM Tuto T WHERE T.gender = :gender and T.actif = :actif and T.location = :location order by hourly asc";
        Query query = session.createQuery(hql);
	     query.setParameter("actif", actif);
        query.setParameter("gender",gender);
        query.setParameter("location",location);
        List<Tuto> resps = (List<Tuto>) query.list();
        session.close();
        return resps;
	}

	public List<Tuto> getTutorByCritereeglg(String subject, String location) {
		SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
        Session session = sessionFactory.openSession();
        Integer actif = 1;
        String hql = "FROM Tuto T WHERE T.subjectIcanteach like :subject and T.actif = :actif and T.location = :location order by hourly asc";
        Query query = session.createQuery(hql);
        String sbj= "%" + subject + "%";
	     query.setParameter("actif", actif);
        query.setParameter("subject",sbj);
        query.setParameter("location",location);
        List<Tuto> resps = (List<Tuto>) query.list();
        session.close();
        return resps;
	}

	public List<Tuto> getTutorByCritereeglo(String subject, String language) {
		SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
        Session session = sessionFactory.openSession();
        Integer actif = 1;
        String hql = "FROM Tuto T WHERE T.subjectIcanteach like :subject and T.actif = :actif and T.language like :language order by hourly asc";
        Query query = session.createQuery(hql);
        String lg= "%" + language + "%";
        String sbj= "%" + subject + "%";
	     query.setParameter("actif", actif);
        query.setParameter("subject",sbj);
        query.setParameter("language",lg);
        List<Tuto> resps = (List<Tuto>) query.list();
        session.close();
        return resps;
	}

	public List<Tuto> getTutorByCritereg(String gender) {
		SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
        Session session = sessionFactory.openSession();
        Integer actif = 1;
        String hql = "FROM Tuto T WHERE T.gender = :gender and T.actif = :actif order by hourly asc";
        Query query = session.createQuery(hql);
	    query.setParameter("actif", actif);
        query.setParameter("gender",gender);
        List<Tuto> resps = (List<Tuto>) query.list();
        session.close();
        return resps;
	}

	public List<Tuto> getTutorByCriteresub(String subject) {
		SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
        Session session = sessionFactory.openSession();
        Integer actif = 1;
        String hql = "FROM Tuto T WHERE T.subjectIcanteach like :subject and T.actif = :actif order by hourly asc";
        Query query = session.createQuery(hql);
        String sbj= "%" + subject + "%";
	     query.setParameter("actif", actif);
        query.setParameter("subject",sbj);
        List<Tuto> resps = (List<Tuto>) query.list();
        session.close();
        return resps;
	}

	public List<Tuto> getTutorByCriterelg(String language) {
		SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
        Session session = sessionFactory.openSession();
        Integer actif = 1;
        String hql = "FROM Tuto T WHERE T.language like :language and T.actif = :actif order by hourly asc";
        Query query = session.createQuery(hql);
        String lg= "%" + language + "%";
        query.setParameter("actif", actif);
        query.setParameter("language",lg);
        List<Tuto> resps = (List<Tuto>) query.list();
        session.close();
        return resps;
	}

	public List<Tuto> getTutorByCriterelo(String location) {
		
		SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
        Session session = sessionFactory.openSession();
        Integer actif = 1;
        String hql = "FROM Tuto T WHERE T.location = :location and T.actif = :actif order by hourly asc";
        Query query = session.createQuery(hql);
        query.setParameter("location",location);
	     query.setParameter("actif", actif);
        List<Tuto> resps = (List<Tuto>) query.list();
        session.close();
        return resps;
	
	}
    public List<Tuto> getTutoBymail(String emailtutor) {
    	
		SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
        Session session = sessionFactory.openSession();  
        String hql = "FROM Tuto T WHERE T.email = :emailtutor";
        Query query = session.createQuery(hql);
        query.setParameter("emailtutor",emailtutor);
        List<Tuto> resps = (List<Tuto>) query.list();
        session.close();
        return resps;
	}

	public void activercompte(Integer idTutor) {
		 SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
	        Session session = sessionFactory.openSession();
	        session.beginTransaction();
	        Integer actif = 1;
	        Query queryup = session.createQuery("update Tuto set actif = :actif where idTutor = :idTutor ");
		     queryup.setParameter("idTutor", idTutor);
		     queryup.setParameter("actif", actif);			 
			 queryup.executeUpdate();
			 session.getTransaction().commit(); 
		     session.close();
		
	}

	public void uploadphototutor(String picture, Integer idTutor) {
		SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
        Session session = sessionFactory.openSession();
        session.beginTransaction();
        Query queryup = session.createQuery("update Tuto T set T.picture = :picture where T.idTutor = :idTutor ");
	     queryup.setParameter("idTutor", idTutor);
	     queryup.setParameter("picture", picture);     
		 queryup.executeUpdate();
		 session.getTransaction().commit(); 
	     session.close();
	}

	@Override
	public Integer UpdateTutor(String name, String gender, Integer age, String location, String password,
			String hourly, String subjectIcanteach, String language, String teachPreference, String mediaCam,
			String riwaya, String certification, String previewExperience, String about, String timeZone, String recitation, Integer idTutor) {
		SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
        Session session = sessionFactory.openSession();
          session.beginTransaction();
          Query queryup = session.createQuery("update Tuto set  name= :name, gender= :gender, age = :age, about = :about, timeZone= :timeZone, password = :password, hourly = :hourly, subjectIcanteach= :subjectIcanteach, language = :language, teachPreference = :teachPreference, mediaCam = :mediaCam, riwaya = :riwaya, certification = :certification, previewExperience = :previewExperience, recitation = :recitation  where idTutor = :idTutor ");
	      queryup.setParameter("idTutor", idTutor);
	      queryup.setParameter("name", name);    
	      queryup.setParameter("gender", gender); 
	      queryup.setParameter("age", age);    
	      queryup.setParameter("password", password);  
	      queryup.setParameter("hourly", hourly);  
	      queryup.setParameter("subjectIcanteach", subjectIcanteach);  
	      queryup.setParameter("language", language);  
	      queryup.setParameter("teachPreference", teachPreference);  
	      queryup.setParameter("mediaCam", mediaCam);  
	      queryup.setParameter("riwaya", riwaya);  
	      queryup.setParameter("about", about); 
	      queryup.setParameter("timeZone", timeZone);   
	      queryup.setParameter("certification", certification);  
	      queryup.setParameter("previewExperience", previewExperience);  
	      queryup.setParameter("recitation", recitation);  
		  queryup.executeUpdate();
		  session.getTransaction().commit(); 
		  session.close();
		  return idTutor;
	}

	public Integer addmessage(Messages mg) {
		SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
        Session session = sessionFactory.openSession();
		session.beginTransaction();
    	session.save(mg);
        session.getTransaction().commit(); 
		session.close();
		return mg.getIdMsg();
	}

	public Integer addreview(Review rv) {
		SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
        Session session = sessionFactory.openSession();
		session.beginTransaction();
    	session.save(rv);
        session.getTransaction().commit(); 
		session.close();
		return rv.getIdReview();
	}

	public Integer getreviewBytutor(Integer idTutor) {

		SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
        Session session = sessionFactory.openSession();
        String hql = "SELECT SUM(R.note) FROM Review R WHERE R.idTutor = :idTutor";
        Query query = session.createQuery(hql);
        query.setParameter("idTutor",idTutor);    
         Object rst = query.list().get(0);
         int i; 
         if(rst != null){
             i =Integer.parseInt( rst.toString() );
         }
         else{
             i =0;	
         }    
        session.close();
        return i;
	}

	public Integer getnbreviewBytutor(Integer idTutor) {
		SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
        Session session = sessionFactory.openSession();
        String hql = "SELECT COUNT(R.note) FROM Review R WHERE R.idTutor = :idTutor";
        Query query = session.createQuery(hql);
        query.setParameter("idTutor",idTutor);
         Object rst = query.list().get(0);
         int i; 
         if(rst != null){
             i =Integer.parseInt( rst.toString() );
         }
         else{
             i =0;	
         } 
        session.close();
        return i;
	}

	public List<Review> getreviewsBytutor(Integer idTutor) {

		SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
        Session session = sessionFactory.openSession();
        String hql = "FROM Review R WHERE R.idTutor = :idTutor order by idReview desc";
        Query query = session.createQuery(hql);
        query.setParameter("idTutor",idTutor);
        List<Review> resps = (List<Review>) query.list();
        session.close();
        return resps;
	}
}
