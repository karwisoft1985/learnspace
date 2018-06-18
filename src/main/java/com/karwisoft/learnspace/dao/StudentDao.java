package com.karwisoft.learnspace.dao;

import java.util.List;

import com.karwisoft.learnspace.beans.Student;
import com.karwisoft.learnspace.beans.Tuto;

public interface StudentDao {

	Integer addStudent(Student student);

	List<Student> getStudentBymail(String emailstudent);

	List<Student> getStudentByLogin(String emailstud, String passwordstud);

	List<Student> getStudentById(Integer idStudent);

	public void updateStudent(String name, String gender, String password, String location, String aboutme, String birthdate,
			String language, String subject, String media, String preference, String riwaya, String certif,
			String timezone, Integer id);

	public void uploadphotostud(String name, int idiamge);

	public void activercompte(Integer idStudent);

}
