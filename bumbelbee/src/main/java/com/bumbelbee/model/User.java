package com.bumbelbee.model;

import java.io.Serializable;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinColumns;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotBlank;

@Entity
@Table(name = "User")
public class User implements Serializable{

	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "user_id")
	private long Id;

	@NotBlank(message = "username can not be empty.")
	@Size(min = 3, max = 20, message = "Username should be of proper length")
	@Column(name = "user_name", nullable = false, unique = true)
	private String username;

	@NotBlank(message = "Email can not be empty.")
	@Email(message = "Please enter a valid email.")
	@Column(name = "user_email", nullable = false, unique = true)
	private String email;

	@NotBlank(message = "Passoword can not be empty.")
	@Size(min = 6, message = "Passoword size must be between 6 and 20.")
	@Column(name = "user_password", nullable = false)
	private String password;

	@Column(name = "user_active", nullable = false)
	private boolean active;

	@Transient
	@NotBlank(message = "confirmPassword.")
	private String confirmPassword;

	@OneToOne(cascade = CascadeType.ALL, fetch = FetchType.EAGER)
	@PrimaryKeyJoinColumn
	@JoinColumns({@JoinColumn(name = "user_email", referencedColumnName = "userpassword_email",insertable=false, updatable=false) })
	private UserPassword userPassword;
	
	@ManyToMany
    @JoinTable(name = "user_role", joinColumns = @JoinColumn(name = "user_id"), inverseJoinColumns = @JoinColumn(name = "role_id"))
	private Set<Role> roles;

	@OneToMany(mappedBy = "user")
	private Set<Project> projects;


	
	public long getId() {
		return Id;
	}

	public void setId(long id) {
		Id = id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public boolean isActive() {
		return active;
	}

	public void setActive(boolean active) {
		this.active = active;
	}

	public String getConfirmPassword() {
		return confirmPassword;
	}

	public void setConfirmPassword(String confirmPassword) {
		this.confirmPassword = confirmPassword;
	}

	public UserPassword getUserPassword() {
		return userPassword;
	}

	public void setUserPassword(UserPassword userPassword) {
		this.userPassword = userPassword;
	}

    public Set<Role> getRoles() {
        return roles;
    }

	public void setRoles(Set<Role> roles) {
		this.roles = roles;
	}
	
	public Set<Project> getProjects() {
		return projects;
	}

	public void setProjects(Set<Project> projects) {
		this.projects = projects;
	}

	@Override
	public boolean equals(Object argUser) {
		if(argUser instanceof User){
			User user_ = (User)argUser;
			if(this.Id==user_.getId()){
				if(this.email==user_.getEmail()){
					return true;
				}
			}
		}
		return false;
	}

}
