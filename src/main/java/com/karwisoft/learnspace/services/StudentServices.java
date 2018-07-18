package com.karwisoft.learnspace.services;

import java.util.List;

import com.karwisoft.learnspace.beans.Student;
import com.karwisoft.learnspace.beans.Tuto;

public interface StudentServices {

	Integer addStudent(Student student);

	List<Student> getstudentBymail(String emailstudent);

	List<Student> getStudentByLogin(String emailstud, String passwordstud);

	List<Student> getStudentById(Integer idStudent);

	public void updateStudent(String name, String gender, String password, String location, String aboutme, String birthdate,
			String language, String subject, String media, String preference, String riwaya, String certif,
			 String timezone, Integer id);

	public void uploadphotostud(String name, int idiamge);

	public void activercompte(Integer idStudent);

	public List<Student> getStudents();

	public List<Student> getStudentByCritereel(String subject, String language, String location);

	public List<Student> getStudentByCritereses(String gender, String language, String location);

	public List<Student> getStudentByCritereselo(String gender, String language, String subject);

	public List<Student> getStudentByCritereselg(String gender, String subject, String location);

	public List<Student> getStudentByCriteresegs(String location, String language);

	public List<Student> getStudentByCritereseslo(String gender, String language);

	public List<Student> getStudentByCritereselol(String gender, String subject);

	public List<Student> getStudentByCritereselg(String gender, String location);

	public List<Student> getStudentByCritereseglg(String subject, String location);

	public List<Student> getStudentByCritereseglo(String subject, String language);

	public List<Student> getStudentByCriteresg(String gender);

	public List<Student> getStudentByCriteresub(String subject);

	public List<Student> getStudentByCritereslo(String location);

	public List<Student> getStudentByCritereslg(String language);

	public List<Student> getStudentByCriteres(String gender, String subject, String location, String language);

	public List<Student> getstudentbyid(Integer idtutor);

	Integer getreviewedst(Integer idstud, Integer idTutor);

}
