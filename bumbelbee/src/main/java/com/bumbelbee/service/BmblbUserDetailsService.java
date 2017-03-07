package com.bumbelbee.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bumbelbee.model.Role;
import com.bumbelbee.model.User;
import com.bumbelbee.repository.UserRepository;
@Service
public class BmblbUserDetailsService  implements UserDetailsService {

	private final Log logger = LogFactory.getLog(this.getClass());

	private final Map<String, User> availableUsers = new HashMap<String, User>();

	 @Autowired
	 private UserRepository userRepository;

    @Transactional(readOnly = true)
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        User user = userRepository.findByUsername(username);
        
        if(user==null){
        	throw new UsernameNotFoundException(username + " not found");
        }
        
        Set<GrantedAuthority> grantedAuthorities = new HashSet<GrantedAuthority>();
        
        for (Role role : user.getRoles()){
            grantedAuthorities.add(new SimpleGrantedAuthority(role.getName()));
        }
        
        
        /*return new org.springframework.security.core.userdetails.User(user.getUsername(), user.getPassword(), grantedAuthorities);*/
        return new org.springframework.security.core.userdetails.User(
				user.getUsername(), user.getPassword(), user.isActive(), true,
				true, true, grantedAuthorities);
    }
    
    private List<GrantedAuthority> buildUserAuthority(Set<Role> userRoles) {

		Set<GrantedAuthority> setAuths = new HashSet<GrantedAuthority>();

		// Build user's authorities
		for (Role role : userRoles) {
			setAuths.add(new SimpleGrantedAuthority(role.getName()));
		}

		List<GrantedAuthority> Result = new ArrayList<GrantedAuthority>(setAuths);

		return Result;
	}
    
    
    
	
}