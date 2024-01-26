package com.jam.timeline.controller.user;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.jam.timeline.biz.es.EventVO;
import com.jam.timeline.biz.es.ScheduleVO;
import com.jam.timeline.biz.user.UserService;
import com.jam.timeline.biz.user.UserVO;
@SessionAttributes("user")
@Controller
public class UserController {

	@Autowired
	private UserService userService; 
	
	@RequestMapping(value = "/createAccount.do")
	public String createAccount(UserVO userVO) {
		System.out.println("createAccount()");
		System.out.println(userVO.toString());
		userService.createAccount(userVO);
		return "redirect:login.jsp";
	}

	@RequestMapping(value = "/login.do")
	public String login(UserVO userVO, Model model, HttpSession session) {
		System.out.println("login(): " + userVO.toString());
		if (userVO.getUsername() == null || userVO.getPassword() == null) {
			System.out.println("null error");
		}
		UserVO user = userService.login(userVO);
		if (user != null) {
			session.setAttribute("username", user.getUsername());
			session.setAttribute("profpic_path", user.getProfpic_path());
			model.addAttribute("user", user);
			System.out.println("after login(): " + user.toString());
			return "timeline";
		} else
			return "redirect:login.jsp";
	}
	
	@RequestMapping(value = "/logout.do")
	public String logout(HttpSession session) {
		System.out.println("logout()");
		session.invalidate();
		return "redirect:home.jsp";
	}
	
	@RequestMapping(value = "/myAccount.do")
	public String myAccount(UserVO userVO, EventVO eventVO, ScheduleVO scheduleVO) {
		return "myAccount";
	}
	
	@RequestMapping(value = "/submitProfpic.do")
	public String submitProfpic(UserVO userVO, HttpSession session) throws IllegalStateException, IOException {
		userVO.setUsername((String)session.getAttribute("username"));
		System.out.println("submitProfPic(): " + userVO.toString());
		MultipartFile profpicFile = userVO.getProfpicFile();
		// if a file exists
		if(!profpicFile.isEmpty()) {
			// check file type
			String fileType = profpicFile.getContentType();
			System.out.println(fileType);
			// if it is an image
			if(fileType.startsWith("image/")) {
				// get image folder location
				// get file name of MultipartFile
				String fileName = profpicFile.getOriginalFilename();
				// set filename as userVO variable
				userVO.setProfpic_path(fileName);
				// test
				System.out.println("DB storage: " + userVO.toString());
				// save filename into DB
				userService.setProfpicPath(userVO);
				// create file with path to image folder and name of the image to save
//				File saveFile = new File("images/" + fileName);
				File saveFile = new File("C://spring/spring-workspace/spring-practice/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/Timeline/images/" + fileName);
				// create directory if it doesn't exist
				if (!saveFile.exists()) {
					saveFile.mkdirs();  
				}
				System.out.println(saveFile.toString());
				
				// transfer MultipartFile
				profpicFile.transferTo(saveFile);
				// test
				System.out.println(profpicFile.toString());
				// set attribute
				session.setAttribute("profpic_path", fileName);
			} else {
				System.out.println("not an image type");
				session.setAttribute("profpic_path", "default_image.png");				
			}
		}
		return "myAccount";
	}
	
	@RequestMapping(value = "/goToTimeline.do")
	public String goToTimeline(UserVO userVO) {
		return "timeline";
	}
	
	@RequestMapping(value="/deleteAccount.do", method = RequestMethod.GET)
	public String deleteAccountView() {
		return "deleteAccount";
	}
	
	@RequestMapping(value = "/deleteAccount.do", method= RequestMethod.POST)
	public String deleteAccount(UserVO userVO) {
		System.out.println("deleteAccount()");
		System.out.println("mapping: " + userVO.getUsername() + ", " + userVO.getPassword());
		userService.deleteAccount(userVO);
		return "redirect:logout.do";
	}
	
	@RequestMapping(value = "/updateAccount.do", method = RequestMethod.GET)
	public String updateAccountView() {
		return "updateAccount";
	}
	
	@RequestMapping(value = "/updateAccount.do", method = RequestMethod.POST)
	public String updateAccount(UserVO userVO, Model model, HttpSession session) {
		System.out.println(userVO.toString());
		String previousUsername = (String)session.getAttribute("username");
		System.out.println("pre: " + previousUsername);
		UserVO user = new UserVO();
		user.setUsername(userVO.getUsername());
		user.setPassword(userVO.getPassword());
		user.setName(userVO.getName());
		user.setEmail(userVO.getEmail());
		user.setReg_date(userVO.getReg_date());
		System.out.println("user: " + user.toString());
		userService.updateAccount(userVO, previousUsername);
		model.addAttribute("user", user);
		return "myAccount";
	}
}
