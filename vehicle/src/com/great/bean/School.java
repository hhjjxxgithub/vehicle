package com.great.bean;

import java.util.Date;

public class School {
	private Integer schoolId;

	private String schoolAccount;

	private String schoolPwd;

	private String schoolName;

	private Integer schoolState;

	private Date schoolDate;

	private String schoolLicense;

	private String schoolMaster;

	private String schoolPhone;

	private Integer roleId;

	private String schoolIntroduce;

	public String getSchoolIntroduce() {
		return schoolIntroduce;
	}

	public void setSchoolIntroduce(String schoolIntroduce) {
		this.schoolIntroduce = schoolIntroduce;
	}

	public Integer getSchoolId() {
		return schoolId;
	}

	public void setSchoolId(Integer schoolId) {
		this.schoolId = schoolId;
	}

	public String getSchoolAccount() {
		return schoolAccount;
	}

	public void setSchoolAccount(String schoolAccount) {
		this.schoolAccount = schoolAccount == null ? null : schoolAccount.trim();
	}

	public String getSchoolPwd() {
		return schoolPwd;
	}

	public void setSchoolPwd(String schoolPwd) {
		this.schoolPwd = schoolPwd == null ? null : schoolPwd.trim();
	}

	public String getSchoolName() {
		return schoolName;
	}

	public void setSchoolName(String schoolName) {
		this.schoolName = schoolName == null ? null : schoolName.trim();
	}

	public Integer getSchoolState() {
		return schoolState;
	}

	public void setSchoolState(Integer schoolState) {
		this.schoolState = schoolState;
	}

	public Date getSchoolDate() {
		return schoolDate;
	}

	public void setSchoolDate(Date schoolDate) {
		this.schoolDate = schoolDate;
	}

	public String getSchoolLicense() {
		return schoolLicense;
	}

	public void setSchoolLicense(String schoolLicense) {
		this.schoolLicense = schoolLicense == null ? null : schoolLicense.trim();
	}

	public String getSchoolMaster() {
		return schoolMaster;
	}

	public void setSchoolMaster(String schoolMaster) {
		this.schoolMaster = schoolMaster == null ? null : schoolMaster.trim();
	}

	public String getSchoolPhone() {
		return schoolPhone;
	}

	public void setSchoolPhone(String schoolPhone) {
		this.schoolPhone = schoolPhone == null ? null : schoolPhone.trim();
	}

	public Integer getRoleId() {
		return roleId;
	}

	public void setRoleId(Integer roleId) {
		this.roleId = roleId;
	}
}