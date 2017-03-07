package com.bumbelbee.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.BeanIds;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.access.AccessDeniedHandler;
import org.springframework.security.web.csrf.CsrfTokenRepository;
import org.springframework.security.web.csrf.HttpSessionCsrfTokenRepository;
/**
 * Spring Security Configuration.
 */
@Configuration
@EnableWebSecurity
//@ImportResource({ "classpath:webSecurityConfig.xml" })
public class BmblbWebSecurityConfigurerAdapter extends WebSecurityConfigurerAdapter {

	@Autowired
	private UserDetailsService userDetailsService;
	
	
	@Autowired
	MySimpleUrlAuthenticationSuccessHandler mySimpleUrlAuthenticationSuccessHandler;
	
	@Autowired
	MySimpleAuthenticationFailureHandler mySimpleAuthenticationFailureHandler;
	
	@Autowired
	BCryptPasswordEncoder bCryptPasswordEncoder;
	
	@Autowired
	CsrfTokenRepository csrfTokenRepository;
	
	@Autowired
	AccessDeniedHandler accessDeniedHandler;


	protected void configure(HttpSecurity http) throws Exception {
		http
			.authorizeRequests()
					.antMatchers("/resources/**", "resources").permitAll()
					.antMatchers("/unauth*").permitAll()
					.antMatchers("/auth*").hasRole("ADMIN")
					.antMatchers("/index*").hasRole("ADMIN")
					.antMatchers("/blank*").hasRole("USER")
					.antMatchers("/buttons*").authenticated()
					.anyRequest().permitAll()
				.and()
			.formLogin()
					.loginPage("/login")
					.successHandler(mySimpleUrlAuthenticationSuccessHandler)
					.failureUrl("/login?failed=login-error")
					.failureHandler(mySimpleAuthenticationFailureHandler)
					.usernameParameter("username")
					.passwordParameter("password")
					.permitAll()
				.and()
			.logout()
					.logoutUrl("/logout")
					.logoutSuccessUrl("/login?logout=success")
					.invalidateHttpSession(true)
					.clearAuthentication(true)	 
				.and()
			.exceptionHandling().accessDeniedHandler(accessDeniedHandler)
				.and()
		.csrf().csrfTokenRepository(csrfTokenRepository);
	
	}
	
	@Autowired
	public void configureGlobal(AuthenticationManagerBuilder auth) throws Exception {
	    auth.userDetailsService(userDetailsService).passwordEncoder(bCryptPasswordEncoder);
	}
	
	@Bean(name = BeanIds.AUTHENTICATION_MANAGER)
    @Override
    public AuthenticationManager authenticationManagerBean() throws Exception {
        return super.authenticationManagerBean();
    }
	

}