package com.jam.timeline.biz.es.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jam.timeline.biz.es.EventVO;

@Repository
public class EventScheduleDAO {

	@Autowired
	private SqlSessionTemplate mybatis;
	
	public void createEvent(EventVO eventVO) {
		System.out.println("mybatis createEvent() using " + eventVO.toString());
		mybatis.insert("eventScheduleDAO.createEvent", eventVO);
	}
	
	public EventVO viewEvent(EventVO eventVO) {
		System.out.println("mybatis viewEvent() using " + eventVO.toString());
		return mybatis.selectOne("eventScheduleDAO.viewEvent", eventVO);
	}
	
	public List<EventVO> viewEventList(EventVO eventVO){
		System.out.println("Mybatis viewEventList() using " + eventVO.toString());
		if(eventVO.getSearchKeyword() == null || eventVO.getSearchKeyword().equals("")) {
			return mybatis.selectList("eventScheduleDAO.getEventList", eventVO);
		}
		else {
			return mybatis.selectList("eventScheduleDAO.getEventListWithCondition", eventVO);
		}
	}
	
	public void updateEvent(EventVO eventVO) {
		System.out.println("mybatis updateEvent using " + eventVO.toString());
		mybatis.update("eventScheduleDAO.updateEvent", eventVO);
	}
	
	public void deleteEvent(EventVO eventVO) {
		System.out.println("mybatis deleteEvent using " + eventVO.toString());
		mybatis.delete("eventScheduleDAO.deleteEvent", eventVO);
	}
}
