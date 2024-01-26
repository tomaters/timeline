package com.jam.timeline.biz.es;

import java.util.List;

public interface EventScheduleService {

	void createSchedule(ScheduleVO scheduleVO);
	ScheduleVO viewSchedule(ScheduleVO scheduleVO);
	void updateSchedule(ScheduleVO scheduleVO);
	void deleteSchedule(ScheduleVO scheduleVO);
	
	void createEvent(EventVO eventVO);
	EventVO viewEvent(EventVO eventVO);
	void updateEvent(EventVO eventVO);
	void deleteEvent(EventVO eventVO);
	List<EventVO> getEventList(EventVO eventVO);
}
