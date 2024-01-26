package com.jam.timeline.biz.user;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

public class UserVO {
	// DB
	private String username;
	private String password;
	private String name;
	private String email;
	private Date reg_date;
	private String profpic_path;
	// File for profpic
	private MultipartFile profpicFile;
	
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
	public String getProfpic_path() {
		return profpic_path;
	}
	public void setProfpic_path(String profpic_path) {
		this.profpic_path = profpic_path;
	}
	public MultipartFile getProfpicFile() {
		return profpicFile;
	}
	public void setProfpicFile(MultipartFile profpicFile) {
		this.profpicFile = profpicFile;
	}
	
	@Override
	public String toString() {
		return "UserVO [username=" + username + ", password=" + password + ", name=" + name + ", email=" + email
				+ ", reg_date=" + reg_date + ", profpic_path=" + profpic_path + ", profpicFile=" + profpicFile + "]";
	}
}
