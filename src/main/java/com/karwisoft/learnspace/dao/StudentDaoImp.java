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

}
