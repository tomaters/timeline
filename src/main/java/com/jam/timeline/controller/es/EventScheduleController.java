package com.jam.timeline.controller.es;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.jam.timeline.biz.es.EventScheduleService;
import com.jam.timeline.biz.es.EventVO;

@SessionAttributes({"user", "event", "schedule", "eventList"})
@Controller
public class EventScheduleController {

	@Autowired
	private EventScheduleService eventScheduleService;
	
	private int year;
	private String month;
	private int day;
	
	@ModelAttribute("conditionMap")
	public Map<String, String> searchConditionMap(){
		Map<String, String> conditionMap = new HashMap<String, String>();
		conditionMap.put("Urgent", "Urgent");
		conditionMap.put("Important", "Important");		
		conditionMap.put("Reminder", "Reminder");		
		conditionMap.put("Other", "Other");
		return conditionMap;
	}
	
	@RequestMapping(value="/createEvent.do", method=RequestMethod.GET)		
	public String goToCreateEvent() {
		return "createEvent";
	}
	@RequestMapping(value="/createEvent.do", method=RequestMethod.POST)		
	public String createEvent(EventVO eventVO) {
        System.out.println("/createEvent.do using EventVO: " + eventVO.toString());
		eventScheduleService.createEvent(eventVO);
		
		try {
			String inputDate = eventVO.getEvent_date().toString();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			Date date = sdf.parse(inputDate);
			
			year = Integer.parseInt(new SimpleDateFormat("yyyy").format(date));
	        month = new SimpleDateFormat("MMMM").format(date);
	        day = Integer.parseInt(new SimpleDateFormat("dd").format(date));
	        System.out.println(year + " " + month + " " + day);
		}  catch (Exception e) {
            e.printStackTrace();
        }
		
		return "timeline";
	}
	
	@RequestMapping(value="/viewEvent.do", method=RequestMethod.GET)
	public String viewEvent(EventVO eventVO, Model model, HttpSession session) {
		eventVO.setUsername((String)session.getAttribute("username"));
		EventVO event = eventScheduleService.viewEvent(eventVO);
		System.out.println("viewEvent.do model: " + event.toString());
		model.addAttribute("event", event);
		return "viewEvent";
	}
	
	@RequestMapping(value="/viewEventList.do", method=RequestMethod.POST)
	public String viewEventList(EventVO eventVO, Model model, HttpSession session) {
		eventVO.setUsername((String)session.getAttribute("username"));
		System.out.println("viewEventList.do using EventVO: " + eventVO);
		
		if(eventVO.getSearchKeyword() == null) eventVO.setSearchKeyword("");
		
		List<EventVO> eventList = eventScheduleService.getEventList(eventVO);
		model.addAttribute("eventList", eventList);
		return "viewEventList";
	}
	
	@RequestMapping(value="/updateEvent.do")
	public String updateEvent(EventVO eventVO) {
		System.out.println("updateEvent.do using " + eventVO.toString());
		eventScheduleService.updateEvent(eventVO);
		return "forward:viewEventList.do";
	}
	
	@RequestMapping(value="/deleteEvent.do")
	public String deleteEvent(EventVO eventVO) {
		System.out.println("deleteEvent.do using " + eventVO.toString());
		eventScheduleService.deleteEvent(eventVO);
		return "forward:viewEventList.do";
	}
	
}
