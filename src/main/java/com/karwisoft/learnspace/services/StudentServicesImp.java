package com.karwisoft.learnspace.services;
import java.util.List;

import com.karwisoft.learnspace.beans.Student;
import com.karwisoft.learnspace.beans.Tuto;
import com.karwisoft.learnspace.dao.StudentDao;

public class StudentServicesImp implements StudentServices{
	
private StudentDao dao_student;

	public StudentDao getDao_student() {
		return dao_student;
	}

	public void setDao_student(StudentDao dao_student) {
		this.dao_student = dao_student;
	}
	
	@Override
	public Integer addStudent(Student student) {
	return dao_student.addStudent(student);
	}

	@Override
	public List<Student> getstudentBymail(String emailstudent) {
		return dao_student.getStudentBymail(emailstudent);
	}

	@Override
	public List<Student> getStudentByLogin(String emailstud, String passwordstud) {
		return dao_student.getStudentByLogin(emailstud, passwordstud);
	}

	@Override
	public List<Student> getStudentById(Integer idStudent) {
		return dao_student.getStudentById(idStudent);
	}

	@Override
	public void updateStudent(String name, String gender, String password, String location, String aboutme,
			String birthdate, String language, String subject, String media, String preference, String riwaya,
			String certif, String timezone, Integer id) {
		dao_student.updateStudent(name, gender, password, location, aboutme, birthdate, language, subject, media, preference, riwaya, certif, timezone, id);
		
	}

	@Override
	public void uploadphotostud(String name, int idiamge) {
		dao_student.uploadphotostud(name, idiamge);
	}

	@Override
	public void activercompte(Integer idStudent) {
		dao_student.activercompte(idStudent);
		
	}

}
