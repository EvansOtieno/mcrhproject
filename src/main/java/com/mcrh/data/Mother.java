package com.mcrh.data;

import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;

@Entity
@Table(name = "Mother")
public class Mother {
	@NotNull
	@Id
	@Column(name = "idno")
	private int idno;
	@Column(name = "firstname")
	private String firstname;
	@Column(name = "middlename")
	private String middlename;
	@Column(name = "lastname")
	private String lastname;
	@OneToMany(mappedBy="mother",fetch = FetchType.EAGER)
	private Set<Child> child;
	@OneToMany(mappedBy="mother",fetch = FetchType.EAGER)
	private Set<Record> record;
	public int getIdno() {
		return idno;
	}
	public void setIdno(int idno) {
		this.idno = idno;
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
	public Set<Child> getChild() {
		return child;
	}
	public void setChild(Set<Child> child) {
		this.child = child;
	}	
	public Set<Record> getRecord() {
		return record;
	}
	public void setRecord(Set<Record> record) {
		this.record = record;
	}

}
