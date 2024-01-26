package com.jam.timeline.biz.es;

import java.sql.Date;

public class EventVO {

	private int event_id;
	private String username;
	private Date event_date;
	private Date creation_date;
	private Date modified_date;
	private String event_title;
	private String event_description;
	private String event_category;
	
	private String searchKeyword;
	
	public int getEvent_id() {
		return event_id;
	}
	public void setEvent_id(int event_id) {
		this.event_id = event_id;
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
	public Date getCreation_date() {
		return creation_date;
	}
	public void setCreation_date(Date creation_date) {
		this.creation_date = creation_date;
	}
	public Date getModified_date() {
		return modified_date;
	}
	public void setModified_date(Date modified_date) {
		this.modified_date = modified_date;
	}
	public String getEvent_title() {
		return event_title;
	}
	public void setEvent_title(String event_title) {
		this.event_title = event_title;
	}
	public String getEvent_description() {
		return event_description;
	}
	public void setEvent_description(String event_description) {
		this.event_description = event_description;
	}
	public String getEvent_category() {
		return event_category;
	}
	public void setEvent_category(String event_category) {
		this.event_category = event_category;
	}
	public String getSearchKeyword() {
		return searchKeyword;
	}
	public void setSearchKeyword(String searchKeyword) {
		this.searchKeyword = searchKeyword;
	}
	
	@Override
	public String toString() {
		return "EventVO [event_id=" + event_id + ", username=" + username + ", event_date=" + event_date
				+ ", creation_date=" + creation_date + ", modified_date=" + modified_date + ", event_title="
				+ event_title + ", event_description=" + event_description + ", event_category=" + event_category
				+ ", searchKeyword=" + searchKeyword + "]";
	}
}
