package com.bumbelbee.init;


import java.util.Locale;
import java.util.Properties;

import javax.annotation.Resource;
import javax.sql.DataSource;

import org.apache.velocity.app.VelocityEngine;
import org.apache.velocity.runtime.RuntimeConstants;
import org.apache.velocity.runtime.resource.loader.ClasspathResourceLoader;
import org.hibernate.ejb.HibernatePersistence;
import org.springframework.context.MessageSource;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.context.support.ReloadableResourceBundleMessageSource;
import org.springframework.core.env.Environment;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.orm.jpa.JpaTransactionManager;
import org.springframework.orm.jpa.LocalContainerEntityManagerFactoryBean;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.access.AccessDeniedHandler;
import org.springframework.security.web.access.AccessDeniedHandlerImpl;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.web.servlet.LocaleResolver;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.i18n.CookieLocaleResolver;
import org.springframework.web.servlet.view.JstlView;
import org.springframework.web.servlet.view.UrlBasedViewResolver;

import com.bumbelbee.helper.ModuleControllerHelper;
import com.bumbelbee.security.MySimpleAuthenticationFailureHandler;
import com.bumbelbee.security.MySimpleUrlAuthenticationSuccessHandler;
import com.bumbelbee.util.BmblbConstants;
import com.bumbelbee.util.MailSender;
import com.bumbelbee.util.MailSenderHelper;
import com.bumbelbee.util.MailSenderImpl;

@Configuration

@EnableWebMvc
@EnableTransactionManagement
@ComponentScan("com.bumbelbee")
@PropertySource({"classpath:application.properties"})
@EnableJpaRepositories("com.bumbelbee.repository")
public class BmblbWebAppConfig {


	@Resource
	private Environment env;

	@Bean
	public DataSource dataSource() {
		DriverManagerDataSource dataSource = new DriverManagerDataSource();

		dataSource.setDriverClassName(env.getRequiredProperty(BmblbConstants.DB_DRIVER));
		dataSource.setUrl(env.getRequiredProperty(BmblbConstants.DB_URL));
		dataSource.setUsername(env.getRequiredProperty(BmblbConstants.DB_USERNAME));
		dataSource.setPassword(env.getRequiredProperty(BmblbConstants.DB_PASSWORD));

		return dataSource;
	}

	@Bean
	public LocalContainerEntityManagerFactoryBean entityManagerFactory() {
		LocalContainerEntityManagerFactoryBean entityManagerFactoryBean = new LocalContainerEntityManagerFactoryBean();
		entityManagerFactoryBean.setDataSource(dataSource());
		entityManagerFactoryBean.setPersistenceProviderClass(HibernatePersistence.class);
		entityManagerFactoryBean.setPackagesToScan(env.getRequiredProperty(BmblbConstants.ENTITYMANAGER_PACKAGES_TO_SCAN));
		
		entityManagerFactoryBean.setJpaProperties(hibProperties());
		
		return entityManagerFactoryBean;
	}

	private Properties hibProperties() {
		Properties properties = new Properties();
		properties.put(BmblbConstants.HIBERNATE_DIALECT,env.getRequiredProperty(BmblbConstants.HIBERNATE_DIALECT));
		properties.put(BmblbConstants.HIBERNATE_SHOW_SQL,env.getRequiredProperty(BmblbConstants.HIBERNATE_SHOW_SQL));
        properties.put(BmblbConstants.HIBERNATE_FORMAT_SQL, env.getRequiredProperty(BmblbConstants.HIBERNATE_FORMAT_SQL));
		properties.put(BmblbConstants.HIBERNATE_HBM2DDL_AUTO, env.getRequiredProperty(BmblbConstants.HIBERNATE_HBM2DDL_AUTO));
		return properties;
	}

	@Bean
	public JpaTransactionManager transactionManager() {
		JpaTransactionManager transactionManager = new JpaTransactionManager();
		transactionManager.setEntityManagerFactory(entityManagerFactory().getObject());
		return transactionManager;
	}

	@Bean
	public UrlBasedViewResolver setupViewResolver() {
		UrlBasedViewResolver resolver = new UrlBasedViewResolver();
		resolver.setPrefix(env.getRequiredProperty(BmblbConstants.SPRING_MVC_VIEW_PREFIX));
		resolver.setSuffix(env.getRequiredProperty(BmblbConstants.SPRING_MVC_VIEW_SUFFIX));
		resolver.setViewClass(JstlView.class);
		return resolver;
	}
	
	@Bean
    public MailSenderHelper mailSenderHelper() {
        return new MailSenderHelper();
    }
	@Bean
    public MailSender mailsender() {
        return new MailSenderImpl();
    }
	
	@Bean
    public ModuleControllerHelper moduleControllerHelper() {
        return new ModuleControllerHelper();
    }
	
	@Bean
    public VelocityEngine velocityEngine() {
		VelocityEngine ve = new VelocityEngine();
		ve.setProperty(RuntimeConstants.RESOURCE_LOADER, "classpath");
		ve.setProperty("classpath.resource.loader.class", ClasspathResourceLoader.class.getName());
		ve.init();
		return ve;
    }
	@Bean MySimpleUrlAuthenticationSuccessHandler mySimpleUrlAuthenticationSuccessHandler(){
		return new MySimpleUrlAuthenticationSuccessHandler();
	}
	
	@Bean MySimpleAuthenticationFailureHandler mySimpleAuthenticationFailureHandler(){
		return new MySimpleAuthenticationFailureHandler();
	}
	
	@Bean
    public AccessDeniedHandler accessDeniedHandler() {
        AccessDeniedHandlerImpl accessDeniedHandler = new AccessDeniedHandlerImpl();
        accessDeniedHandler.setErrorPage("/unauth/fail/restrictedaccess");
        return accessDeniedHandler;
    }
	
	
	@Bean
	public BCryptPasswordEncoder bCryptPasswordEncoder() {
		return new BCryptPasswordEncoder();
	}
	
	@Bean
    public PasswordEncoder passwordEncoder() {
        PasswordEncoder encoder = new BCryptPasswordEncoder();
        return encoder;
    }
	
	@Bean(name = "localeResolver")
	public LocaleResolver localeResolver() {
	    CookieLocaleResolver cookieLocaleResolver = new CookieLocaleResolver();
	    cookieLocaleResolver.setDefaultLocale(Locale.ENGLISH);
	    return cookieLocaleResolver;
	}
	@Bean(name = "messageSource")
	public MessageSource messageSource() {
	    ReloadableResourceBundleMessageSource messageSource =     new ReloadableResourceBundleMessageSource();
	    messageSource.setBasename("classpath:messages");
	    messageSource.setUseCodeAsDefaultMessage(true);
	    messageSource.setDefaultEncoding("UTF-8");
	    messageSource.setCacheSeconds(0);
	    return messageSource;
	}
	 
}
