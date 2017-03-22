package com.bumbelbee.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import javax.ws.rs.PathParam;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.bumbelbee.Exception.UserNotFound;
import com.bumbelbee.helper.ModuleControllerHelper;
import com.bumbelbee.helper.SessionIdentifierGenerator;
import com.bumbelbee.model.User;
import com.bumbelbee.model.UserPassword;
import com.bumbelbee.repository.UserRepository;
import com.bumbelbee.service.SecurityService;
import com.bumbelbee.service.UserPasswordService;
import com.bumbelbee.service.UserService;
import com.bumbelbee.util.DateUtil;
import com.bumbelbee.util.MailSenderHelper;
import com.bumbelbee.validation.UserValidators;

@RestController
public class ModuleController {

	@Autowired
	private UserService userService;

	@Autowired
	private UserPasswordService userPwdService;

	@Autowired
	private UserValidators userValidator;

	@Autowired
	MailSenderHelper mailSenderHelper;

	@Autowired
	UserRepository userRepository;

	@Autowired
	private SecurityService securityService;

	@InitBinder
	private void initBinder(WebDataBinder binder) {
		binder.setValidator(userValidator);
	}

	private final Logger logger = LoggerFactory
			.getLogger(ModuleController.class);

	ObjectError error;
	FieldError fieldError;


	@RequestMapping({ "/", "/login" })
	public ModelAndView welcome(final Model model, final Locale locale,final RedirectAttributes redirectAttributes,
			HttpSession argHttpSession) {
		model.addAttribute("user", new User());
//		model.addAttribute("pagestatus", "fresh");'
		return new ModelAndView("login");
	}

	@RequestMapping(value = "/unauth/createUser", method = RequestMethod.POST)
	public ModelAndView saveEmployee(ModelMap model,
			@ModelAttribute @Valid User user, BindingResult result,
			final RedirectAttributes redirectAttributes) {

		if (!userService.ifExist("email", user.getEmail())) {
			if (!userService.ifExist("username", user.getUsername())) {
				if (ModuleControllerHelper.isValidPassword(user.getPassword())) {
					if (ModuleControllerHelper.isPasswordConfirmed(
							user.getPassword(), user.getConfirmPassword())) {
						String activationToken = new SessionIdentifierGenerator()
								.generatePasswordResetToken();
						UserPassword userPassword = new UserPassword();
						userPassword.setEmail(user.getEmail());
						userPassword.setActivationToken(activationToken);
						userPassword.setActivationTokenTimestamp(new Date());
						user.setUserPassword(userPassword);
						userService.save(user);
						mailSenderHelper.sendUserActivaionMail(user,
								activationToken);
						logger.info("New user " + user.getUsername()
								+ " was successfully created.");
					} else {
						fieldError = new FieldError("user", "confirmPassword",
								"Passowrd do not match. ");
						result.addError(fieldError);
					}
				} else {
					fieldError = new FieldError("user", "password",
							"Invalid passowrd.");
					result.addError(fieldError);
				}
			} else {
				fieldError = new FieldError("user", "username",
						"Username already registered.");
				result.addError(fieldError);
			}
		} else {
			fieldError = new FieldError("user", "email",
					"Email Id already registered.");
			result.addError(fieldError);
		}

		if (result.hasErrors()) {
			model.addAttribute("user", user);
			model.addAttribute("pagestatus", "registration-error");
			model.addAttribute("actionstatus", null);
		}else{
			model.addAttribute("user", new User());
			model.addAttribute("pagestatus", null);
			model.addAttribute("actionstatus", "regs");
		}
		redirectAttributes.addFlashAttribute("result", result);
		return new ModelAndView("login");
	}

	@RequestMapping(value = { "/unauth/requestPassowrdReset/mail" }, method = RequestMethod.POST)
	public ModelAndView requestPassowrdResetByMail(ModelMap model,
			@ModelAttribute @Valid User user, BindingResult result,
			final RedirectAttributes redirectAttributes) {
		if (userService.ifExist("email", user.getEmail())) {
			user = userService.findByEmail(user.getEmail()).get(0);
			String resetToken = new SessionIdentifierGenerator()
					.generatePasswordResetToken();
			UserPassword userPassword = userPwdService.findById(user.getId());
			userPassword.setPasswordToken(resetToken);
			userPassword.setPasswordTokenTimestamp(new Date());
			userPwdService.update(userPassword);
			mailSenderHelper.sendPassowrdResetByMailMail(user, resetToken);
			user = new User();
		} else {
			fieldError = new FieldError("user", "email","Email Id not registered.");
			result.addError(fieldError);
		}
		if (result.hasErrors()) {
			model.addAttribute("user", user);
			model.addAttribute("pagestatus", "request-password-error");
			model.addAttribute("actionstatus", null);
		}else{
			model.addAttribute("user", new User());
			model.addAttribute("pagestatus", null);
			model.addAttribute("actionstatus", "rps");
		}
		return new ModelAndView("/login");
	}

	@RequestMapping(value = { "/unauth/resetpasssword/{Id}/{passwordResetToken}" }, method = RequestMethod.GET)
	public ModelAndView resetPassowrdShowForm(ModelMap model,
			@PathVariable("Id") long Id,
			@PathVariable("passwordResetToken") String passwordResetToken,
			final RedirectAttributes redirectAttributes) {
		User user = userService.findById(Id);
		if (user != null) {
			UserPassword userPassword = userPwdService.findById(Id);
			if (userPassword.getPasswordToken()!=null && userPassword.getPasswordToken().equals(passwordResetToken)) {
				if (DateUtil.getDifferenceInMinutes(
						userPassword.getPasswordTokenTimestamp(), new Date()) >60) {
					if (user.isActive()) {
						ModelAndView mav = new ModelAndView("reset-password");
						User passwordResetUSer = new User();
						passwordResetUSer.setId(user.getId());
						passwordResetUSer.setUsername(user.getUsername());
						passwordResetUSer.setEmail(user.getEmail());
						passwordResetUSer.setPassword("");
						passwordResetUSer.setConfirmPassword("");
						mav.addObject("user", passwordResetUSer);
						return mav;
					}
				} else {
					// expired
					logger.info("[User] : " + user.getId()
							+ " password reset token expired.");
					return new ModelAndView("reset-password-token-expired");
				}
			}
		}
		return new ModelAndView("redirect:/login");
	}

	@RequestMapping(value = { "/unauth/savePassword/{Id}/{passwordResetToken}" }, method = RequestMethod.POST)
	public ModelAndView resetPasswordSumitForm(ModelMap model,
			@PathVariable("Id") long Id,
			@PathVariable("passwordResetToken") String passwordResetToken,
			@ModelAttribute @Valid User user, BindingResult result,
			final RedirectAttributes redirectAttributes) throws UserNotFound {

		User passwordResetUser = user;
		user = userService.findById(Id);

		passwordResetUser.setId(user.getId());
		passwordResetUser.setUsername(user.getUsername());
		passwordResetUser.setEmail(user.getEmail());

		if (ModuleControllerHelper.isValidPassword(passwordResetUser
				.getPassword())) {
			if (ModuleControllerHelper.isPasswordConfirmed(
					passwordResetUser.getPassword(),
					passwordResetUser.getConfirmPassword())) {

				user.setPassword(passwordResetUser.getPassword());

				UserPassword ups = user.getUserPassword();
				ups.setPasswordToken(null);
				ups.setPasswordTokenTimestamp(null);

				userService.update(user);
				userPwdService.update(ups);
				mailSenderHelper.resetPasswordSuccessMail(user);
				return new ModelAndView(
						"redirect:/login?password-reset-seccesss");
			} else {
				fieldError = new FieldError("user", "confirmPassword",
						"Passowrd do not match. ");
				result.addError(fieldError);
			}
		} else {
			fieldError = new FieldError("user", "password", "Invalid passowrd.");
			result.addError(fieldError);
		}

		if (result.hasErrors()) {
			ModelAndView mav = new ModelAndView("reset-password");
			redirectAttributes.addFlashAttribute("result", result);
			model.addAttribute("actionstatus", null);
			model.addAttribute("actionstatus", null);
			return mav;
		}else{
			model.addAttribute("user", new User());
			model.addAttribute("pagestatus", null);
			model.addAttribute("actionstatus", "rsps");
		}
		redirectAttributes.addFlashAttribute("result", result);
		return new ModelAndView("login");
	}

	@RequestMapping(value = { "/unauth/activate/user/{beeId}/{activationToken}" }, method = RequestMethod.GET)
	public ModelAndView registrationConfirmation(ModelMap model,
			@PathVariable("beeId") int beeId,
			@PathVariable("activationToken") String activationToken)
			throws UserNotFound {
		User user = userService.findById(beeId);
		if (user != null) {
			/* Do not check time difference on user activation. */
			UserPassword userPassword = userPwdService.findById(beeId);
			if (userPassword.getActivationToken().equals(activationToken)) {
				if (!user.isActive()) {
					user.setActive(true);
					userService.update(user);
					logger.info("[User] : " + user.getId() + " activated.");
					return new ModelAndView("activation-success");
				} else {
					logger.info("[User] : " + user.getId()
							+ " already activated.");
					return new ModelAndView("activation-success-re-sent");
				}
			}
		}
		return new ModelAndView("redirect:/login");
	}

	@RequestMapping(value = { "/unauth/getAllEmailIds" }, method = RequestMethod.GET)
	public String[] getTestData(@PathParam("param") String param){
		String[] emailds = {"manish.joshi@skillnetinc.com",
							"abhishek.richhariya@skillnetinc.com",
							"dharmesh.dubey@skillnetinc.com",
							"dinesh.bang@skillnetinc.com",
							"srikanth.devi@skillnetinc.com",
							"ravi.soni@skillnetinc.com",
							"indrajeet.sawarkar@skillnetinc.com",
							"akash.tiwari@skillnetinc.com",
							"chandrabhan.sisodiya@skillnetinc.com",
							"gaurav.papdiwal@skillnetinc.com",
							"rahul.mahajan@skillnetinc.com",
							"neeraj.singh@skillnetinc.com",
							"rahul.swami@skillnetinc.com",
							"pravin.goswami@skillnetinc.com",
							"kumar.ashutosh@skillnetinc.com",
							"sonam.bhojwani@skillnetinc.com",
							"noopur.sisodia@skillnetinc.com",
							"meenakshi.rathore@skillnetinc.com",
							"gyanesh.tiwari@skillnetinc.com",
							"vikas.dishoriya@skillnetinc.com",
							"aanchal.porwal@skillnetinc.com",
							"lawrence.nag@skillnetinc.com",
							"ritesh.kumar@skillnetinc.com",
							"jagdeep.dhanoa@skillnetinc.com",
							"vaibhav.jain@skillnetinc.com",
							"shweta.patel@skillnetinc.com",
							"monika.nimbore@skillnetinc.com",
							"gautam.prasad@skillnetinc.com",
							"manish.rakesh.jain@skillnetinc.com",
							"meenakshi.kanaujia@skillnetinc.com",
							"neha.vari@skillnetinc.com",
							"ankit.dubey@skillnetinc.com",
							"vaibhav.patni@skillnetinc.com",
							"akshya.singh@skillnetinc.com",
							"rahul.anil.arora@skillnetinc.com",
							"mudit.mathur@skillnetinc.com",
							"ankur.bahre@skillnetinc.com",
							"rahul.gupta@skillnetinc.com",
							"anindita.dutta@skillnetinc.com",
							"rahul.jain@skillnetinc.com",
							"namrata.jain@skillnetinc.com",
							"vikas.arya@skillnetinc.com",
							"ankit.nahar@skillnetinc.com",
							"arpita.sharda@skillnetinc.com",
							"naman.jain@skillnetinc.com"};
		return emailds;
	}
	
}
