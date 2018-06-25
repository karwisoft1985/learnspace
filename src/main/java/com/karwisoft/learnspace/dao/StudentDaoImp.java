package com.karwisoft.learnspace.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.karwisoft.learnspace.beans.Student;
import com.karwisoft.learnspace.beans.Tuto;
import com.project.hibernate.HibernateUtil;

public class StudentDaoImp implements StudentDao{

	@Override
	public Integer addStudent(Student student) {
		SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
        Session session = sessionFactory.openSession();
		session.beginTransaction();
    	session.save(student);
        session.getTransaction().commit(); 
		session.close();
		return student.getIdStudent();
	}

	@Override
	public List<Student> getStudentBymail(String emailstudent) {
		SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
        Session session = sessionFactory.openSession();  
        String hql = "FROM Student S WHERE S.email = :emailstudent";
        Query query = session.createQuery(hql);
        query.setParameter("emailstudent",emailstudent);
        List<Student> resps = (List<Student>) query.list();
        session.close();
        return resps;
	}

	@Override
	public List<Student> getStudentByLogin(String emailstud, String passwordstud) {

		SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
        Session session = sessionFactory.openSession();
        String hql = "FROM Student T WHERE T.email = :emailstud AND T.password = :passwordstud order by idStudent desc";
        Query query = session.createQuery(hql);
        query.setParameter("emailstud",emailstud);
        query.setParameter("passwordstud",passwordstud);
        List<Student> resps = (List<Student>) query.list();
        session.close();
        return resps;
	}

	@Override
	public List<Student> getStudentById(Integer idStudent) {
		SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
        Session session = sessionFactory.openSession();
        String hql = "FROM Student T WHERE T.idStudent = :idStudent order by idStudent desc";
        Query query = session.createQuery(hql);
        query.setParameter("idStudent",idStudent);
        List<Student> resps = (List<Student>) query.list();
        session.close();
        return resps;
	}

	@Override
	public void updateStudent(String name, String gender, String password, String location, String aboutMe,
			String birthdate, String spokenlanguage, String subjects, String communication, String learningPreferences, String riwayaToLearn,
			String certifications, String timeZone, Integer idStudent) {

		
		 SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
        Session session = sessionFactory.openSession();
        session.beginTransaction();
        Query queryup = session.createQuery("update Student set name = :name , gender = :gender , password = :password , location = :location , aboutMe = :aboutMe , birthdate = :birthdate, spokenlanguage = :spokenlanguage, subjects = :subjects, communication = :communication, learningPreferences = :learningPreferences, riwayaToLearn = :riwayaToLearn, certifications = :certifications, timeZone = :timeZone   where idStudent = :idStudent ");
	     queryup.setParameter("idStudent", idStudent);
	     queryup.setParameter("name", name); 
	     queryup.setParameter("gender", gender); 
	     queryup.setParameter("password", password); 
	     queryup.setParameter("location", location); 
	     queryup.setParameter("aboutMe", aboutMe);
	     queryup.setParameter("birthdate", birthdate); 
	     queryup.setParameter("spokenlanguage", spokenlanguage); 
	     queryup.setParameter("subjects", subjects); 
	     queryup.setParameter("communication", communication); 
	     queryup.setParameter("learningPreferences", learningPreferences); 
	     queryup.setParameter("riwayaToLearn", riwayaToLearn); 
	     queryup.setParameter("certifications", certifications); 
	     queryup.setParameter("timeZone", timeZone); 
		 queryup.executeUpdate();
		 session.getTransaction().commit(); 
	     session.close();
	}

	@Override
	public void uploadphotostud(String picture, int idStudent) {
		SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
        Session session = sessionFactory.openSession();
        session.beginTransaction();
        Query queryup = session.createQuery("update Student S set S.picture = :picture where S.idStudent = :idStudent ");
	     queryup.setParameter("idStudent", idStudent);
	     queryup.setParameter("picture", picture);     
		 queryup.executeUpdate();
		 session.getTransaction().commit(); 
	     session.close();
	}

	@Override
	public void activercompte(Integer idStudent) {
		 SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
	        Session session = sessionFactory.openSession();
	        session.beginTransaction();
	        Integer actif = 1;
	        Query queryup = session.createQuery("update Student set actif = :actif where idStudent = :idStudent ");
		     queryup.setParameter("idStudent", idStudent);
		     queryup.setParameter("actif", actif);			 
			 queryup.executeUpdate();
			 session.getTransaction().commit(); 
		     session.close();
	}

	@Override
	public List<Student> getStudents() {
		SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
        Session session = sessionFactory.openSession();
        session.beginTransaction();
        Integer actif = 1;
        String hql = "FROM Student where actif = :actif";
        Query query = session.createQuery(hql);
	     query.setParameter("actif", actif);
        List<Student> resps = (List<Student>) query.list();
        session.getTransaction().commit(); 
		session.close();
        return resps;
	}

	@Override
	public List<Student> getStudentByCritereel(String subject, String language, String location) {
		SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
        Session session = sessionFactory.openSession();  
        Integer actif = 1;
        String hql = "FROM Student ST WHERE ST.actif = :actif and ST.subjects like :subject and ST.location = :location and ST.spokenlanguage like :language";
        Query query = session.createQuery(hql);
        String lg= "%" + language + "%";
        String sbj= "%" + subject + "%";
	     query.setParameter("actif", actif);	
        query.setParameter("subject",sbj);
        query.setParameter("location",location);
        query.setParameter("language",lg);
        List<Student> resps = (List<Student>) query.list();
        session.close();
        return resps;
	}

	@Override
	public List<Student> getStudentByCritereses(String gender, String language, String location) {
		SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
        Session session = sessionFactory.openSession();  
        Integer actif = 1;
        String hql = "FROM Student ST WHERE ST.actif = :actif and ST.gender like :gender and ST.location = :location and ST.spokenlanguage like :language";
        Query query = session.createQuery(hql);
        String lg= "%" + language + "%";
	     query.setParameter("actif", actif);	
        query.setParameter("gender",gender);
        query.setParameter("location",location);
        query.setParameter("language",lg);
        List<Student> resps = (List<Student>) query.list();
        session.close();
        return resps;
	}

	@Override
	public List<Student> getStudentByCritereselo(String gender, String language, String subject) {
		SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
        Session session = sessionFactory.openSession();  
        Integer actif = 1;
        String hql = "FROM Student ST WHERE ST.actif = :actif and ST.subjects like :subject and ST.gender = :gender and ST.spokenlanguage like :language";
        Query query = session.createQuery(hql);
        String lg= "%" + language + "%";
        String sbj= "%" + subject + "%";
	     query.setParameter("actif", actif);	
        query.setParameter("subject",sbj);
        query.setParameter("gender",gender);
        query.setParameter("language",lg);
        List<Student> resps = (List<Student>) query.list();
        session.close();
        return resps;
	}

	@Override
	public List<Student> getStudentByCritereselg(String gender, String subject, String location) {
		SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
        Session session = sessionFactory.openSession();  
        Integer actif = 1;
        String hql = "FROM Student ST WHERE ST.actif = :actif and ST.subjects like :subject and ST.location = :location and ST.gender like :gender";
        Query query = session.createQuery(hql);
        String sbj= "%" + subject + "%";
	     query.setParameter("actif", actif);	
        query.setParameter("subject",sbj);
        query.setParameter("location",location);
        query.setParameter("gender",gender);
        List<Student> resps = (List<Student>) query.list();
        session.close();
        return resps;
	}

	@Override
	public List<Student> getStudentByCriteresegs(String location, String language) {
		SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
        Session session = sessionFactory.openSession();  
        Integer actif = 1;
        String hql = "FROM Student ST WHERE ST.actif = :actif and ST.location = :location and ST.spokenlanguage like :language";
        Query query = session.createQuery(hql);
        String lg= "%" + language + "%";
	     query.setParameter("actif", actif);	
        query.setParameter("location",location);
        query.setParameter("language",lg);
        List<Student> resps = (List<Student>) query.list();
        session.close();
        return resps;
        }

	@Override
	public List<Student> getStudentByCritereseslo(String gender, String language) {
		SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
        Session session = sessionFactory.openSession();  
        Integer actif = 1;
        String hql = "FROM Student ST WHERE ST.actif = :actif and ST.gender = :gender and ST.spokenlanguage like :language";
        Query query = session.createQuery(hql);
        String lg= "%" + language + "%";
	     query.setParameter("actif", actif);	
        query.setParameter("gender",gender);
        query.setParameter("language",lg);
        List<Student> resps = (List<Student>) query.list();
        session.close();
        return resps;
	}

	@Override
	public List<Student> getStudentByCritereselol(String gender, String subject) {
		SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
        Session session = sessionFactory.openSession();  
        Integer actif = 1;
        String hql = "FROM Student ST WHERE ST.actif = :actif and ST.subjects like :subject and ST.gender like :gender";
        Query query = session.createQuery(hql);
        String sbj= "%" + subject + "%";
	     query.setParameter("actif", actif);	
        query.setParameter("subject",sbj);
        query.setParameter("gender",gender);
        List<Student> resps = (List<Student>) query.list();
        session.close();
        return resps;
	}

	@Override
	public List<Student> getStudentByCritereselg(String gender, String location) {
		SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
        Session session = sessionFactory.openSession();  
        Integer actif = 1;
        String hql = "FROM Student ST WHERE ST.actif = :actif and ST.location like :location and ST.gender like :gender";
        Query query = session.createQuery(hql);
       query.setParameter("actif", actif);	
        query.setParameter("gender",gender);
        query.setParameter("location",location);
        List<Student> resps = (List<Student>) query.list();
        session.close();
        return resps;
	}

	@Override
	public List<Student> getStudentByCritereseglg(String subject, String location) {
		SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
        Session session = sessionFactory.openSession();  
        Integer actif = 1;
        String hql = "FROM Student ST WHERE ST.actif = :actif and ST.location like :location and ST.subjects like :subject";
        Query query = session.createQuery(hql);
        String sbj= "%" + subject + "%";
	     query.setParameter("actif", actif);	
        query.setParameter("subject",sbj);
        query.setParameter("location",location);
        List<Student> resps = (List<Student>) query.list();
        session.close();
        return resps;
	}

	@Override
	public List<Student> getStudentByCritereseglo(String subject, String language) {
		SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
        Session session = sessionFactory.openSession();  
        Integer actif = 1;
        String hql = "FROM Student ST WHERE ST.actif = :actif and ST.spokenlanguage like :language and ST.subjects like :subject";
        Query query = session.createQuery(hql);
        String sbj= "%" + subject + "%";
        String lg= "%" + language + "%";
	     query.setParameter("actif", actif);	
        query.setParameter("subject",sbj);
        query.setParameter("language",lg);
        List<Student> resps = (List<Student>) query.list();
        session.close();
        return resps;
	}

	@Override
	public List<Student> getStudentByCriteresg(String gender) {
		SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
        Session session = sessionFactory.openSession();  
        Integer actif = 1;
        String hql = "FROM Student ST WHERE ST.actif = :actif and ST.gender like :gender";
        Query query = session.createQuery(hql);
       query.setParameter("actif", actif);	
        query.setParameter("gender",gender);
        List<Student> resps = (List<Student>) query.list();
        session.close();
        return resps;
	}

	@Override
	public List<Student> getStudentByCriteresub(String subject) {
		SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
        Session session = sessionFactory.openSession();  
        Integer actif = 1;
        String hql = "FROM Student ST WHERE ST.actif = :actif and ST.subjects like :subject";
        Query query = session.createQuery(hql);
        String sbj= "%" + subject + "%";
	     query.setParameter("actif", actif);	
        query.setParameter("subject",sbj);
        List<Student> resps = (List<Student>) query.list();
        session.close();
        return resps;
	}

	@Override
	public List<Student> getStudentByCritereslo(String location) {
		SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
        Session session = sessionFactory.openSession();  
        Integer actif = 1;
        String hql = "FROM Student ST WHERE ST.actif = :actif and ST.location like :location";
        Query query = session.createQuery(hql);
	     query.setParameter("actif", actif);	
        query.setParameter("location",location);
        List<Student> resps = (List<Student>) query.list();
        session.close();
        return resps;
	}

	@Override
	public List<Student> getStudentByCritereslg(String language) {
		SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
        Session session = sessionFactory.openSession();  
        Integer actif = 1;
        String hql = "FROM Student ST WHERE ST.actif = :actif and ST.spokenlanguage like :language";
        Query query = session.createQuery(hql);  
        String lg= "%" + language + "%";
	     query.setParameter("actif", actif);	
	        query.setParameter("language",lg);	        
        List<Student> resps = (List<Student>) query.list();
        session.close();
        return resps;
	}

	@Override
	public List<Student> getStudentByCriteres(String gender, String subject, String location, String language) {
		SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
        Session session = sessionFactory.openSession();  
        Integer actif = 1;
        String hql = "FROM Student ST WHERE ST.actif = :actif and ST.subjects like :subject and ST.gender like :gender and ST.location = :location and ST.spokenlanguage like :language";
        Query query = session.createQuery(hql);
        String lg= "%" + language + "%";
        String sbj= "%" + subject + "%";
	    query.setParameter("actif", actif);	
	    query.setParameter("gender",gender);	
        query.setParameter("subject",sbj);
        query.setParameter("location",location);
        query.setParameter("language",lg);
        List<Student> resps = (List<Student>) query.list();
        session.close();
        return resps;
        }

}
