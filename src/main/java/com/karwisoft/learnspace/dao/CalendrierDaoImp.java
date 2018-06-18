package com.karwisoft.learnspace.dao;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;


import com.karwisoft.learnspace.beans.Calendar;
import com.project.hibernate.HibernateUtil;
public class CalendrierDaoImp implements CalendrierDao {

	@Override
	public List<Calendar> getCalendar(){
		
		 SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
         Session session = sessionFactory.openSession();
         session.beginTransaction();
         String hql = "FROM Calendar order by idDepartement desc";
         Query query = session.createQuery(hql);
         List<Calendar> resps = (List<Calendar>) query.list();
         session.getTransaction().commit(); 
		 session.close();
         return resps;
    }

}
