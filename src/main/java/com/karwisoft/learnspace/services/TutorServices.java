package com.karwisoft.learnspace.services;
import java.util.List;

import com.karwisoft.learnspace.beans.Messages;
import com.karwisoft.learnspace.beans.Review;
import com.karwisoft.learnspace.beans.Tuto;
public interface TutorServices {
	
	public List<Tuto> getTutor();
	public Integer addTutor(Tuto t);
	public List<Tuto> getTutorById(Integer id);
	public List<Tuto> getTutorByLogin(String email,String password);
	public List<Tuto> getTutorByCritere(String subject,String language,String gender,String location);
	public List<Tuto> getTutorByCritereel(String subject, String language, String location);
	public List<Tuto> getTutorByCriterees(String gender, String language, String location);
	public List<Tuto> getTutorByCritereelo(String gender, String subject, String language);
	public List<Tuto> getTutorByCritereelg(String gender, String subject, String location);
	public List<Tuto> getTutorByCritereegs(String location, String language);
	public List<Tuto> getTutorByCritereeslo(String gender, String language);
	public List<Tuto> getTutorByCritereelol(String gender, String subject);
	public List<Tuto> getTutorByCritereeslg(String gender, String location);
	public List<Tuto> getTutorByCritereeglg(String subject, String location);
	public List<Tuto> getTutorByCritereeglo(String subject, String language);
	public List<Tuto> getTutorByCritereg(String gender);
	public List<Tuto> getTutorByCriteresub(String subject);
	public List<Tuto> getTutorByCriterelg(String language);
	public List<Tuto> getTutorByCriterelo(String location);
	public List<Tuto> getTutoBymail(String emailtutor);
	public void activercompte(Integer idTutor);
	public void uploadphototutor(String name, Integer idimage);
	public Integer UpdateTutor(String modName, String modGender, Integer modAge, String modLocRech, String modPassword,
			String modHourly, String modSub1, String modlanguage, String modPreference, String modComMedia,
			String modRiwaya, String modCertif, String modPreviousexp, String modAbout, String modTimeZone, String name, Integer id_tutor);
	Integer addmessage(Messages mg);
	Integer addreview(Review rv);
	

}
