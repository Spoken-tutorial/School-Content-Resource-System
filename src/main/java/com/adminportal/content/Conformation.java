/*  Company Name  : Spoken Tutorial IIT bombay
 * 	Author Name	  : Om Prakash
 * 	Version		  : 1.0
 * 	Description	  : This is Class Modal to persist Class related data into database.
 */
package com.adminportal.content;

import java.sql.Timestamp;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.TableGenerator;

import com.adminportal.domain.User;
/**
 * This class Represent Entity which stores Class data
 * @author om prakash
 *
 */
@Entity
@Table(name="Conformation")
public class Conformation {
	
	/**
	 * A unique ID representing conformation for a jmol
	 */
	@Id
	@Column(nullable = false,updatable = false)
	private int conformation_id;
	
	/**
	 * Name of conformation
	 */
	@Column(name="name",nullable = false)
	private String name;
	
//	@Column(name="base_jmol",nullable = false)
//	private Jmol base_jmol;
	
	/**
	 * Visibility
	 */
	@Column(name="status",nullable = false)
	private boolean status=true;
	
	/**
	 * date on which class is being added.
	 */
	@Column(name="date_added",nullable = false)
	private Timestamp dateAdded;
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name="user_id")
	private User user;
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name="jmolId")
	private Jmol jmol;
	
	
	public Timestamp getDateAdded() {
		return dateAdded;
	}
	public void setDateAdded(Timestamp dateAdded) {
		this.dateAdded = dateAdded;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public boolean isStatus() {
		return status;
	}
	public void setStatus(boolean status) {
		this.status = status;
	}
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getConformation_id() {
		return conformation_id;
	}
	public void setConformation_id(int conformation_id) {
		this.conformation_id = conformation_id;
	}
//	public Jmol getBase_jmol() {
//		return base_jmol;
//	}
//	public void setBase_jmol(Jmol base_jmol) {
//		this.base_jmol = base_jmol;
//	}
	public Jmol getJmol() {
		return jmol;
	}
	public void setJmol(Jmol jmol) {
		this.jmol = jmol;
	}
	public Conformation() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Conformation(int conformation_id, String name, boolean status, Timestamp dateAdded, User user, Jmol jmol) {
		super();
		this.conformation_id = conformation_id;
		this.name = name;
		this.status = status;
		this.dateAdded = dateAdded;
		this.user = user;
		this.jmol = jmol;
	}
	
	

}
