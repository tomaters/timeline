package com.jam.timeline.biz.user.impl;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jam.timeline.biz.user.UserVO;


@Repository
public class UserDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis; 
	
	public void createAccount(UserVO userVO) {
		System.out.println("mybatis createAccount(): " + userVO.toString());
		mybatis.insert("userDAO.createAccount", userVO);
	}
	
	public UserVO login(UserVO userVO) {
		System.out.println("login()");
		return mybatis.selectOne("userDAO.login", userVO);
	}
	
	public void setProfpicPath(UserVO userVO) {
		System.out.println("setProfpicPath() using " + userVO.toString());
		mybatis.update("userDAO.setProfpicPath", userVO);
	}
	
	public void deleteAccount(UserVO userVO) {
		System.out.println("deleteAccount()");
		mybatis.update("userDAO.deleteAccount", userVO);
	}
	
	public UserVO viewAccount(String username) {
		System.out.println("viewAccount()");
		return mybatis.selectOne("userDAO.viewAccount", username);
	}
	
	public boolean checkUsername(String username) {
		System.out.println("checkUsername()");
		return mybatis.selectOne("userDAO.checkUsername", username);
	}
	
	public void updateAccount(UserVO userVO, String previousUsername) {
		System.out.println("updateAccount()");
		userVO.setUsername(previousUsername);
		mybatis.update("userDAO.updateAccount", userVO);
	}
}