package com.karwisoft.learnspace.services;

import java.util.List;


import com.karwisoft.learnspace.beans.Calendar;
import com.karwisoft.learnspace.dao.CalendrierDao;

public class CalendrierServicesImp implements CalendrierServices {
    
	private CalendrierDao dao_calendar;
	
	public CalendrierDao getDao_calendar() {
		return dao_calendar;
	}


    public void setDao_calendar(CalendrierDao dao_calendar) {
		this.dao_calendar = dao_calendar;
	}


    @Override
	public List<Calendar> getCalendar() {
		
		return dao_calendar.getCalendar();
	}

}
