package com.karwisoft.learnspace.dao;
import java.util.List;

import com.karwisoft.learnspace.beans.Messages;
import com.karwisoft.learnspace.beans.Review;
import com.karwisoft.learnspace.beans.Tuto;
public interface TutorDao {
	
	public List<Tuto> getTutor();
	public Integer addTutor(Tuto t);
	public Integer UpdateTutor(String modName, String modGender, Integer modAge, String modLocRech, String modPassword,
			String modHourly, String modSub1, String modlanguage, String modPreference, String modComMedia,
			String modRiwaya, String modCertif, String modPreviousexp, String modAbout, String modTimeZone, String name, Integer id_tutor);
	public List<Tuto> getTutorById(Integer id);
	public List<Tuto> getTutorByLogin(String email,String password);
	public List<Tuto> getTutorByCritere(String subject,String language,String gender,String location);
	Integer addmessage(Messages mg);
	Integer addreview(Review rv);
}
