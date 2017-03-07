package com.bumbelbee.model;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name="user_password")
public class UserPassword implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 2710659169061473829L;

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "userpassword_id")
	private long Id;

	@Column(name = "userpassword_email")
	private String email;

	@Column(name = "userpassword_activation_token")
	private String activationToken;

	@Column(name = "userpassword_activation_token_timestamp")
	private Date activationTokenTimestamp;

	@Column(name = "userpassword_password_token")
	private String passwordToken;
	
	@Column(name = "userpassword_password_token_timestamp")
	private Date passwordTokenTimestamp;

	public long getId() {
		return Id;
	}

	public void setId(long id) {
		Id = id;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getActivationToken() {
		return activationToken;
	}

	public void setActivationToken(String activationToken) {
		this.activationToken = activationToken;
	}

	public Date getActivationTokenTimestamp() {
		return activationTokenTimestamp;
	}

	public void setActivationTokenTimestamp(Date activationTokenTimestamp) {
		this.activationTokenTimestamp = activationTokenTimestamp;
	}

	public String getPasswordToken() {
		return passwordToken;
	}

	public void setPasswordToken(String passwordToken) {
		this.passwordToken = passwordToken;
	}

	public Date getPasswordTokenTimestamp() {
		return passwordTokenTimestamp;
	}

	public void setPasswordTokenTimestamp(Date passwordTokenTimestamp) {
		this.passwordTokenTimestamp = passwordTokenTimestamp;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}


	
}
