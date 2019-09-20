package com.mcrh.data;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.validation.constraints.NotNull;

@Entity
@Table(name="Child")
public class Child {

	@NotNull
	@Id
	@Column(name = "serialno")
	private int serialno;
	@Column(name = "firstname")
	private String firstname;
	@Column(name = "middlename")
	private String middlename;
	@Column(name = "lastname")
	private String lastname;
	@Column(name = "sex")
	private String sex;
	@Column(name = "birthtype")
	private String birthtype;
	@Column(name = "birthtypeother")
	private String birthtypeother;
	@Column(name = "bithnature")
	private String birthnature;
	@Column(name = "dob")
	private Date dob;
	@Transient
	private String sdob;
	@Column(name = "pob")
	private String pob;
	@Column(name = "pobsub")
	private String pobsub;
	@OneToOne(mappedBy="child")
	private Record record;
	@ManyToOne
	@JoinColumn(name="mother_id")
	private Mother mother;
	public int getSerialno() {
		return serialno;
	}
	public void setSerialno(int serialno) {
		this.serialno = serialno;
	}
	public String getFirstname() {
		return firstname;
	}
	public void setFirstname(String firstname) {
		this.firstname = firstname;
	}
	public String getMiddlename() {
		return middlename;
	}
	public void setMiddlename(String middlename) {
		this.middlename = middlename;
	}
	public String getLastname() {
		return lastname;
	}
	public void setLastname(String lastname) {
		this.lastname = lastname;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getBirthtype() {
		return birthtype;
	}
	public void setBirthtype(String birthtype) {
		this.birthtype = birthtype;
	}
	public String getBirthnature() {
		return birthnature;
	}
	
	public String getBirthtypeother() {
		return birthtypeother;
	}
	public void setBirthtypeother(String birthtypeother) {
		this.birthtypeother = birthtypeother;
	}
	public void setBirthnature(String birthnature) {
		this.birthnature = birthnature;
	}
	public Date getDob() {
		return dob;
	}
	public void setDob(Date dob) {
		this.dob = dob;
	}
	
	public String getSdob() {
		return sdob;
	}
	public void setSdob(String sdob) {
		this.sdob = sdob;
	}
	public String getPob() {
		return pob;
	}
	public void setPob(String pob) {
		this.pob = pob;
	}
	public String getPobsub() {
		return pobsub;
	}
	public void setPobsub(String pobsub) {
		this.pobsub = pobsub;
	}
	public Record getRecord() {
		return record;
	}
	public void setRecord(Record record) {
		this.record = record;
	}
	public Mother getMother() {
		return mother;
	}
	public void setMother(Mother mother) {
		this.mother = mother;
	}

}
