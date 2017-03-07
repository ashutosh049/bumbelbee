package com.bumbelbee.util;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.mail.MessagingException;
import javax.mail.internet.AddressException;

import org.apache.velocity.app.VelocityEngine;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;
import org.springframework.ui.velocity.VelocityEngineUtils;

import com.bumbelbee.model.User;

@PropertySource({ "classpath:bumbelbee.properties" })
public class MailSenderHelper {

	@Autowired
	MailSender mailsender;

	@Autowired
	private VelocityEngine velocityEngine;

	@Resource
	private Environment env;

	public void sendUserActivaionMail(User anEntity, String activationToken) {
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("username", anEntity.getUsername());
		model.put("password", anEntity.getPassword());
		model.put("registrationConfirmationToken",
				"http://localhost:8080/bumbelbee/" + "unauth/activate/user/"
						+ anEntity.getId() + "/" + activationToken);

		String text = VelocityEngineUtils.mergeTemplateIntoString(
				velocityEngine, "welcome.vm", "UTF-8", model);

		try {
			mailsender.sendJunkMail(env
					.getRequiredProperty(BmblbConstants.SENDER_EMAIL), env
					.getRequiredProperty(BmblbConstants.SENDER_EMAIL_PASSWORD),
					"Welcome to BumbelBee", text, anEntity.getEmail());
		} catch (AddressException e) {

		} catch (MessagingException e) {
		}
	}

	public void sendPassowrdResetByMailMail(User anEntity,String passwordResetToken) {
		
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("passwordresettoken", "http://localhost:8080/bumbelbee/"
				+ "unauth/resetpasssword/" + anEntity.getId() + "/"
				+ passwordResetToken);

		String text = VelocityEngineUtils.mergeTemplateIntoString(
				velocityEngine, "reset-password.vm", "UTF-8", model);

		try {
			mailsender.sendJunkMail(env
					.getRequiredProperty(BmblbConstants.SENDER_EMAIL), env
					.getRequiredProperty(BmblbConstants.SENDER_EMAIL_PASSWORD),
					"BumbelBee password request", text, anEntity.getEmail());
		} catch (AddressException e) {

		} catch (MessagingException e) {
		}
		
	}

	public void resetPasswordSuccessMail(User anEntity) {
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("username", anEntity.getUsername());
		String text = VelocityEngineUtils.mergeTemplateIntoString(
				velocityEngine, "reset-password-success.vm", "UTF-8", model);

		try {
			mailsender.sendJunkMail(env
					.getRequiredProperty(BmblbConstants.SENDER_EMAIL), env
					.getRequiredProperty(BmblbConstants.SENDER_EMAIL_PASSWORD),
					"BumbelBee password changed", text, anEntity.getEmail());
		} catch (AddressException e) {

		} catch (MessagingException e) {
		}
	}

}
