package com.jam.timeline.biz.es.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jam.timeline.biz.es.EventScheduleService;
import com.jam.timeline.biz.es.EventVO;
import com.jam.timeline.biz.es.ScheduleVO;

@Service("eventScheduleServiceImplement")
public class EventScheduleServiceImpl implements EventScheduleService {

	@Autowired
	private EventScheduleDAO eventScheduleDAO;

	@Override
	public void createSchedule(ScheduleVO scheduleVO) {
	}

	@Override
	public ScheduleVO viewSchedule(ScheduleVO scheduleVO) {
		return null;
	}

	@Override
	public void updateSchedule(ScheduleVO scheduleVO) {
	}

	@Override
	public void deleteSchedule(ScheduleVO scheduleVO) {
	}

	@Override
	public void createEvent(EventVO eventVO) {
		eventScheduleDAO.createEvent(eventVO);
	}

	@Override
	public EventVO viewEvent(EventVO eventVO) {
		return eventScheduleDAO.viewEvent(eventVO);
	}

	@Override
	public List<EventVO> getEventList(EventVO eventVO) {
		return eventScheduleDAO.viewEventList(eventVO);
	}

	@Override
	public void updateEvent(EventVO eventVO) {
		eventScheduleDAO.updateEvent(eventVO);
	}

	@Override
	public void deleteEvent(EventVO eventVO) {
		eventScheduleDAO.deleteEvent(eventVO);
	}

	
	
}
