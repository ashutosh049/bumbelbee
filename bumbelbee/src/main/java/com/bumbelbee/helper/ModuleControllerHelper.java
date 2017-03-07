package com.bumbelbee.helper;

import java.net.URI;
import java.net.URISyntaxException;
import java.util.UUID;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.Response;

import org.apache.commons.codec.binary.Base64;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.bumbelbee.Exception.UserNotFound;
import com.bumbelbee.controller.ModuleController;
import com.bumbelbee.model.User;
import com.bumbelbee.model.UserPassword;
import com.bumbelbee.service.UserPasswordService;
import com.bumbelbee.service.UserService;
import com.bumbelbee.util.MailSenderHelper;

import org.springframework.stereotype.Service;

@Service("ModuleControllerHelper")
@Produces("application/json")
public class ModuleControllerHelper {

	@Autowired
	private UserService userService;

	@Autowired
	private UserPasswordService userPwdService;

	@Autowired
	MailSenderHelper mailSenderHelper;

	private final Logger logger = LoggerFactory.getLogger(ModuleController.class);

	public static boolean isValidPassword(String argPassword) {
		Pattern pswNamePtrn = Pattern.compile("((?=.*\\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%]).{8,16})");
		Matcher mtch = pswNamePtrn.matcher(argPassword);
		if (mtch.matches()) {
			return true;
		}
		return false;
	}

	public static boolean isPasswordConfirmed(String argPassowrd1, String argPassowrd2) {
		return argPassowrd1.equals(argPassowrd2);
	}

	public static String generatePasswordResetToken() {
		return new String(Base64.encodeBase64(UUID.randomUUID().toString().getBytes()));
	}

	@GET
	@Path("login/user/{beeId}/{activationToken}")
	public Response resetPassword(@PathParam("beeId") Integer beeId,
			@PathParam("activationToken") String activationToken) throws UserNotFound {
		User user = userService.findById(beeId);
		String uriPath = null;
		URI uri = null;
		if (user != null) {
			/* Do not check time difference on user activation. */
			UserPassword userPassword = userPwdService.findById(beeId);
			if (userPassword.getActivationToken().equals(activationToken)) {
				user.setActive(true);
				userService.update(user);
				logger.info("[User] : " + user.getId() + " activated.");
				uriPath = "http://localhost:8080/bumbelbee/" + "/blank?id=" + user.getId() + "&activationToken="
						+ activationToken;
				uri = null;
				try {
					uri = new URI(uriPath);
				} catch (URISyntaxException e) {

				}
				return Response.temporaryRedirect(uri).build();
			} else {
				uriPath = "http://localhost:8080/bumbelbee/login";
				try {
					uri = new URI(uriPath);
				} catch (URISyntaxException e) {

				}
			}
		}
		return Response.temporaryRedirect(uri).build();
	}

}
