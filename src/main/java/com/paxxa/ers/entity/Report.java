package com.paxxa.ers.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity
public class Report {

	@Id
	@GeneratedValue
	private Integer id;

	private String reportName;

	@Column(name = "required_report_date")
	private Date reportDay;

	@Column(name = "today_meeting_num")
	private Integer todayMeetingNum;

	@Column(name = "future_meeting_num")
	private Integer futureMeetingNum;

	@Column(name = "new_contract_num")
	private Integer newContractNum;

	@Column(name = "contract_extention_num")
	private Integer contractExtentionNum;

	private String notes;

	@ManyToOne
	@JoinColumn(name="consultant_id")
	private Consultant consultant;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getReportName() {
		return reportName;
	}

	public void setReportName(String reportName) {
		this.reportName = reportName;
	}

	public Date getReportDay() {
		return reportDay;
	}

	public void setReportDay(Date reportDay) {
		this.reportDay = reportDay;
	}

	public Integer getTodayMeetingNum() {
		return todayMeetingNum;
	}

	public void setTodayMeetingNum(Integer todayMeetingNum) {
		this.todayMeetingNum = todayMeetingNum;
	}

	public Integer getFutureMeetingNum() {
		return futureMeetingNum;
	}

	public void setFutureMeetingNum(Integer futureMeetingNum) {
		this.futureMeetingNum = futureMeetingNum;
	}

	public Integer getNewContractNum() {
		return newContractNum;
	}

	public void setNewContractNum(Integer newContractNum) {
		this.newContractNum = newContractNum;
	}

	public Integer getContractExtentionNum() {
		return contractExtentionNum;
	}

	public void setContractExtentionNum(Integer contractExtentionNum) {
		this.contractExtentionNum = contractExtentionNum;
	}

	public String getNotes() {
		return notes;
	}

	public void setNotes(String notes) {
		this.notes = notes;
	}

	public Consultant getConsultant() {
		return consultant;
	}

	public void setConsultant(Consultant consultant) {
		this.consultant = consultant;
	}



}
