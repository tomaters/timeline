package com.jam.timeline.biz.es;

import java.sql.Date;

public class ScheduleVO {
	private int schedule_id;
	private String username;
	private Date event_date;
	private int event_id;
	private int hour_value;
	
	public int getSchedule_id() {
		return schedule_id;
	}
	public void setSchedule_id(int schedule_id) {
		this.schedule_id = schedule_id;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public Date getEvent_date() {
		return event_date;
	}
	public void setEvent_date(Date event_date) {
		this.event_date = event_date;
	}
	public int getEvent_id() {
		return event_id;
	}
	public void setEvent_id(int event_id) {
		this.event_id = event_id;
	}
	public int getHour_value() {
		return hour_value;
	}
	public void setHour_value(int hour_value) {
		this.hour_value = hour_value;
	}
	@Override
	public String toString() {
		return "ScheduleVO [schedule_id=" + schedule_id + ", username=" + username + ", event_date=" + event_date
				+ ", event_id=" + event_id + ", hour_value=" + hour_value + "]";
	}	
}