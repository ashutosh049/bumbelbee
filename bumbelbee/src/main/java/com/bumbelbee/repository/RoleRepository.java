package com.bumbelbee.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.bumbelbee.model.Role;

public interface RoleRepository extends JpaRepository<Role, Long>{
}