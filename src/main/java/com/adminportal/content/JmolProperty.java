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
@Table(name="JmolProperty")
public class JmolProperty {
	
	/**
	 * A unique ID representing property
	 */
	@Id
	@Column(nullable = false,updatable = false)
	private int property_id;
	
	/**
	 * Name of class like 1,2 etc
	 */
	@Column(name="name",nullable = false)
	private int name;
	
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
	public int getProperty_id() {
		return property_id;
	}
	public void setProperty_id(int property_id) {
		this.property_id = property_id;
	}
	public int getName() {
		return name;
	}
	public void setName(int name) {
		this.name = name;
	}
	
	

}
