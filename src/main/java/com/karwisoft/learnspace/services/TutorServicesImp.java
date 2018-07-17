package com.karwisoft.learnspace.services;

import java.util.List;

import com.karwisoft.learnspace.beans.Messages;
import com.karwisoft.learnspace.beans.Review;
import com.karwisoft.learnspace.beans.Tuto;
import com.karwisoft.learnspace.dao.TutorDaoImp;

public class TutorServicesImp implements TutorServices{
    
	private TutorDaoImp dao_tuto;
	
	public TutorDaoImp getDao_tuto() {
		return dao_tuto;
	}

    public void setDao_tuto(TutorDaoImp dao_tuto) {
		this.dao_tuto = dao_tuto;
	}


    @Override
	public List<Tuto> getTutor() {
		return dao_tuto.getTutor();
	}

	@Override
	public Integer addTutor(Tuto t) {
		// TODO Auto-generated method stub
		return dao_tuto.addTutor(t);
	}

	@Override
	public List<Tuto> getTutorById(Integer id) {
		return dao_tuto.getTutorById(id);
	}

	@Override
	public List<Tuto> getTutorByLogin(String email, String password) {
		// TODO Auto-generated method stub
		return dao_tuto.getTutorByLogin(email, password);
	}

	@Override
	public List<Tuto> getTutorByCritere(String subject, String language, String gender, String location) {
		// TODO Auto-generated method stub
		return dao_tuto.getTutorByCritere(subject, language, gender, location);
	}

	@Override
	public List<Tuto> getTutorByCritereel(String subject, String language, String location) {
		// TODO Auto-generated method stub
		return dao_tuto.getTutorByCritereel(subject, language, location);
	}

	@Override
	public List<Tuto> getTutorByCriterees(String gender, String language, String location) {

		return dao_tuto.getTutorByCriterees(gender, language, location);
	}

	@Override
	public List<Tuto> getTutorByCritereelo(String gender, String subject, String language) {
		return dao_tuto.getTutorByCritereelo(gender, subject, language);
		
}

	@Override
	public List<Tuto> getTutorByCritereelg(String gender, String subject, String location) {
		return dao_tuto.getTutorByCritereelg(gender, subject, location);
		
	}

	@Override
	public List<Tuto> getTutorByCritereegs(String location, String language) {
		return dao_tuto.getTutorByCritereegs(location, language);
	}

	@Override
	public List<Tuto> getTutorByCritereeslo(String gender, String language) {
		return dao_tuto.getTutorByCritereeslo(gender, language);
	}

	@Override
	public List<Tuto> getTutorByCritereelol(String gender, String subject) {
		return dao_tuto.getTutorByCritereelol(gender, subject);
	}

	@Override
	public List<Tuto> getTutorByCritereeslg(String gender, String location) {
		return dao_tuto.getTutorByCritereeslg(gender, location);
	}

	@Override
	public List<Tuto> getTutorByCritereeglg(String subject, String location) {
		return dao_tuto.getTutorByCritereeglg(subject, location);
	}

	@Override
	public List<Tuto> getTutorByCritereeglo(String subject, String language) {
		return dao_tuto.getTutorByCritereeglo(subject, language);
	}

	@Override
	public List<Tuto> getTutorByCritereg(String gender) {
		return dao_tuto.getTutorByCritereg(gender);
	}

	@Override
	public List<Tuto> getTutorByCriteresub(String subject) {
		return dao_tuto.getTutorByCriteresub(subject);
	}

	@Override
	public List<Tuto> getTutorByCriterelg(String language) {
		return dao_tuto.getTutorByCriterelg(language);
	}

	@Override
	public List<Tuto> getTutorByCriterelo(String location) {

		return dao_tuto.getTutorByCriterelo(location);
	}

	@Override
	public List<Tuto> getTutoBymail(String emailtutor) {
		return dao_tuto.getTutoBymail(emailtutor);
	}


	@Override
	public void activercompte(Integer idTutor) {
		dao_tuto.activercompte(idTutor);
		
	}

	@Override
	public void uploadphototutor(String name, Integer idimage) {
		dao_tuto.uploadphototutor(name, idimage);
		
	}

	@Override
	public Integer UpdateTutor(String modName, String modGender, Integer modAge, String modLocRech, String modPassword,
			String modHourly, String modSub1, String modlanguage, String modPreference, String modComMedia,
			String modRiwaya, String modCertif, String modPreviousexp, String modAbout, String modTimeZone, String name, Integer id_tutor) {
		return dao_tuto.UpdateTutor(modName,modGender,modAge,modLocRech,modPassword,modHourly,modSub1,modlanguage,modPreference,modComMedia,modRiwaya,modCertif,modPreviousexp,modAbout,modTimeZone,name,id_tutor);
		
		
	}

	@Override
	public Integer addmessage(Messages mg) {
		return dao_tuto.addmessage(mg);
	}

	@Override
	public Integer addreview(Review rv) {
		return dao_tuto.addreview(rv);
	}

	

}
