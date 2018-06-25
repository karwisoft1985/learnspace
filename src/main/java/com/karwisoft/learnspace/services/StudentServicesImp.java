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

	@Override
	public List<Student> getStudents() {
		return dao_student.getStudents();
	}

	@Override
	public List<Student> getStudentByCritereel(String subject, String language, String location) {
		return dao_student.getStudentByCritereel(subject, language, location);
		}

	@Override
	public List<Student> getStudentByCritereses(String gender, String language, String location) {
		return dao_student.getStudentByCritereses(gender, language, location);
		}

	@Override
	public List<Student> getStudentByCritereselo(String gender, String language, String subject) {
		return dao_student.getStudentByCritereselo(gender, language, subject);
		}

	@Override
	public List<Student> getStudentByCritereselg(String gender, String subject, String location) {
		return dao_student.getStudentByCritereselg(gender, subject, location);
	}

	@Override
	public List<Student> getStudentByCriteresegs(String location, String language) {
		return dao_student.getStudentByCriteresegs(location, language);
		}

	@Override
	public List<Student> getStudentByCritereseslo(String gender, String language) {
		return dao_student.getStudentByCritereseslo(gender, language);
		}

	@Override
	public List<Student> getStudentByCritereselol(String gender, String subject) {
		return dao_student.getStudentByCritereselol(gender, subject);
		}

	@Override
	public List<Student> getStudentByCritereselg(String gender, String location) {
		return dao_student.getStudentByCritereselg(gender, location);
		}

	@Override
	public List<Student> getStudentByCritereseglg(String subject, String location) {
		return dao_student.getStudentByCritereseglg(subject, location);
		}

	@Override
	public List<Student> getStudentByCritereseglo(String subject, String language) {
		return dao_student.getStudentByCritereseglo(subject, language);
		}

	@Override
	public List<Student> getStudentByCriteresg(String gender) {
	return dao_student.getStudentByCriteresg(gender);
		}

	@Override
	public List<Student> getStudentByCriteresub(String subject) {
		return dao_student.getStudentByCriteresub(subject);
		}

	@Override
	public List<Student> getStudentByCritereslo(String location) {
		return dao_student.getStudentByCritereslo(location);
		}

	@Override
	public List<Student> getStudentByCritereslg(String language) {
		return dao_student.getStudentByCritereslg(language);
		
	}

	@Override
	public List<Student> getStudentByCriteres(String gender, String subject, String location, String language) {
		return dao_student.getStudentByCriteres(gender, subject, location, language);
		}

}
