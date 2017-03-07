package com.bumbelbee.model;
import javax.persistence.*;

import java.util.Set;

@Entity
@Table(name = "role")
public class Role {
	
	@Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "role_id")
    private Long Id;
	
    @Column(name = "role_name")
    private String name;
	
    @ManyToMany(mappedBy = "roles")
    private Set<User> users;

    
    public Long getId() {
        return Id;
    }

    public void setId(Long id) {
        this.Id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    
    public Set<User> getUsers() {
        return users;
    }

    public void setUsers(Set<User> users) {
        this.users = users;
    }
}