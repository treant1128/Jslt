package com.wukong.jslt.pojo;

import java.sql.Timestamp;

/**
 * Foo entity. @author MyEclipse Persistence Tools
 */

public class Foo implements java.io.Serializable {

	// Fields

	private Integer id;
	private String title;
	private String taskUrl;
	private String description;
	private Timestamp createDate;
	private String numPackage;
	private Integer userNum;
	private Integer priority;
	private Boolean smsPush;
	private Boolean skip31;
	private Integer antiDuplicate;
	private Boolean verifyStatus;
	private Integer processStatus;
	private Timestamp executeDate;

	// Constructors

	/** default constructor */
	public Foo() {
	}

	/** minimal constructor */
	public Foo(String title, String taskUrl) {
		this.title = title;
		this.taskUrl = taskUrl;
	}

	/** full constructor */
	public Foo(String title, String taskUrl, String description,
			Timestamp createDate, String numPackage, Integer userNum,
			Integer priority, Boolean smsPush, Boolean skip31,
			Integer antiDuplicate, Boolean verifyStatus, Integer processStatus,
			Timestamp executeDate) {
		this.title = title;
		this.taskUrl = taskUrl;
		this.description = description;
		this.createDate = createDate;
		this.numPackage = numPackage;
		this.userNum = userNum;
		this.priority = priority;
		this.smsPush = smsPush;
		this.skip31 = skip31;
		this.antiDuplicate = antiDuplicate;
		this.verifyStatus = verifyStatus;
		this.processStatus = processStatus;
		this.executeDate = executeDate;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getTitle() {
		return this.title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getTaskUrl() {
		return this.taskUrl;
	}

	public void setTaskUrl(String taskUrl) {
		this.taskUrl = taskUrl;
	}

	public String getDescription() {
		return this.description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Timestamp getCreateDate() {
		return this.createDate;
	}

	public void setCreateDate(Timestamp createDate) {
		this.createDate = createDate;
	}

	public String getNumPackage() {
		return this.numPackage;
	}

	public void setNumPackage(String numPackage) {
		this.numPackage = numPackage;
	}

	public Integer getUserNum() {
		return this.userNum;
	}

	public void setUserNum(Integer userNum) {
		this.userNum = userNum;
	}

	public Integer getPriority() {
		return this.priority;
	}

	public void setPriority(Integer priority) {
		this.priority = priority;
	}

	public Boolean getSmsPush() {
		return this.smsPush;
	}

	public void setSmsPush(Boolean smsPush) {
		this.smsPush = smsPush;
	}

	public Boolean getSkip31() {
		return this.skip31;
	}

	public void setSkip31(Boolean skip31) {
		this.skip31 = skip31;
	}

	public Integer getAntiDuplicate() {
		return this.antiDuplicate;
	}

	public void setAntiDuplicate(Integer antiDuplicate) {
		this.antiDuplicate = antiDuplicate;
	}

	public Boolean getVerifyStatus() {
		return this.verifyStatus;
	}

	public void setVerifyStatus(Boolean verifyStatus) {
		this.verifyStatus = verifyStatus;
	}

	public Integer getProcessStatus() {
		return this.processStatus;
	}

	public void setProcessStatus(Integer processStatus) {
		this.processStatus = processStatus;
	}

	public Timestamp getExecuteDate() {
		return this.executeDate;
	}

	public void setExecuteDate(Timestamp executeDate) {
		this.executeDate = executeDate;
	}

}