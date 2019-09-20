package com.mcrh.data;

import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

@Entity
@Table(name="Record")
public class Record {


	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name="id")
	private int id;
	@ManyToOne
	@JoinColumn(name="mother_id")
	private Mother mother;
	@OneToOne(cascade=CascadeType.ALL)
	@JoinColumn(name="child_serial")
	private Child child;
	@Column(name="toname")
	private String notificationtoname;
	@Column(name="toid")
	private int notificationtoid;
	@Column(name="date")
	private Date notificationdate;
	@Transient
	private String snotificationdate;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public Mother getMother() {
		return mother;
	}
	public void setMother(Mother mother) {
		this.mother = mother;
	}
	public Child getChild() {
		return child;
	}
	public void setChild(Child child) {
		this.child = child;
	}
	
	public String getNotificationtoname() {
		return notificationtoname;
	}
	public void setNotificationtoname(String notificationtoname) {
		this.notificationtoname = notificationtoname;
	}
	public int getNotificationtoid() {
		return notificationtoid;
	}
	public void setNotificationtoid(int notificationtoid) {
		this.notificationtoid = notificationtoid;
	}
	public Date getNotificationdate() {
		return notificationdate;
	}
	public void setNotificationdate(Date notificationdate) {
		this.notificationdate = notificationdate;
	}
	public String getSnotificationdate() {
		return snotificationdate;
	}
	public void setSnotificationdate(String snotificationdate) {
		this.snotificationdate = snotificationdate;
	}
	
}
