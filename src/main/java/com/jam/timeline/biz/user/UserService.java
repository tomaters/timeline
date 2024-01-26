package com.jam.timeline.biz.user;

public interface UserService {

	void createAccount(UserVO userVO);
	UserVO login(UserVO userVO);
	void submitProfpic(UserVO userVO);
	void deleteAccount(UserVO userVO);
	void updateAccount(UserVO userVO, String previousUsername);
	void setProfpicPath(UserVO userVO);
}
