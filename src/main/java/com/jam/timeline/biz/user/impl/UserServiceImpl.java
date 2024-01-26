package com.jam.timeline.biz.user.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jam.timeline.biz.user.UserService;
import com.jam.timeline.biz.user.UserVO;

@Service("userServiceImplement")
public class UserServiceImpl implements UserService{
	@Autowired
	private UserDAO userDAO;

	@Override
	public void createAccount(UserVO userVO) {
		userDAO.createAccount(userVO); 
	}

	@Override
	public UserVO login(UserVO userVO) {
		return userDAO.login(userVO);
	}

	@Override
	public void submitProfpic(UserVO userVO) {
		userDAO.setProfpicPath(userVO);
	}

	@Override
	public void deleteAccount(UserVO userVO) {
		userDAO.deleteAccount(userVO);
	}

	@Override
	public void updateAccount(UserVO userVO, String previousUsername) {
		userDAO.updateAccount(userVO, previousUsername);
	}

	@Override
	public void setProfpicPath(UserVO userVO) {
		userDAO.setProfpicPath(userVO);
	}
	


}
