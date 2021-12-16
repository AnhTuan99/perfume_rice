package com.devpro.shop13.controller.admin;

import com.devpro.shop13.dto.AjaxResponse;
import com.devpro.shop13.dto.MyUser;
import com.devpro.shop13.entities.Roles;
import com.devpro.shop13.entities.Users;
import com.devpro.shop13.services.RolesService;
import com.devpro.shop13.services.UsersService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.time.LocalDateTime;
import java.util.List;


@Controller
public class AdminUsersController {

	@Autowired
	private UsersService usersService;

	@Autowired
	private RolesService rolesService;


	@RequestMapping(value = { "/admin/listUsers" }, method = RequestMethod.GET)
	public String listUsers(final ModelMap model, final HttpServletRequest request, final HttpServletResponse response)
			throws Exception {
		model.addAttribute("users", usersService.findAll());
		Users users=new Users();

		return "admin/listUsers";
	}

	@RequestMapping(value = { "/admin/addUsers" }, method = RequestMethod.GET)
	public String addUsersGet(final ModelMap model, final HttpServletRequest request,
								 final HttpServletResponse response) throws Exception {
		model.addAttribute("users", new Users());
		return "admin/addUsers";
	}

	@RequestMapping(value = { "/admin/addUsers" }, method = RequestMethod.POST)
	public String addUsersPost(final ModelMap model, final HttpServletRequest request,
								  final HttpServletResponse response,
								  @ModelAttribute("users") Users users) throws Exception {
		Object principal= SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		boolean check =false;
		List<Users> us= usersService.findAll();
		for (Users u : us) {
			if(users.getId()==u.getId())
				check =true;
		}
		if(check ==true){
			Users usersOnDb = usersService.getById(users.getId());
			users.setCreatedDate(usersOnDb.getCreatedDate());
			users.setCreatedBy(usersOnDb.getCreatedBy());
			users.setUpdatedDate(LocalDateTime.now());
			users.setUpdatedBy(((MyUser)principal).getId());
		}
		else{
			users.setCreatedDate(LocalDateTime.now());
			users.setCreatedBy(((MyUser)principal).getId());
			List<Roles> listRole=rolesService.findByRoleAdmin();
			BCryptPasswordEncoder encoder = new BCryptPasswordEncoder(8);
			String result = encoder.encode(users.getPassword());
			users.setPassword(result);
			users.setRoles(listRole);
		}
		usersService.save(users);
		return "redirect:/admin/listUsers";
	}

	@RequestMapping(value = { "/admin/updateUsers/{id}" }, method = RequestMethod.GET)
	public String updateUsers(@PathVariable("id") Integer id,
							   final ModelMap model, final HttpServletRequest request, final HttpServletResponse response) throws Exception {
		Users users = usersService.getById(id);
		model.addAttribute("users", users);
		return "admin/addUsers";
	}

	@RequestMapping(value = { "/deleteUsers" }, method = RequestMethod.POST)
	public ResponseEntity<AjaxResponse> deleteUsers(final ModelMap model, final HttpServletRequest request,
													   final HttpServletResponse response, @RequestBody Users users) {

		Users us = usersService.getById(users.getId());
		if(us.getStatus())
			us.setStatus(false);
		else
			us.setStatus(true);
		usersService.save(us);
		return ResponseEntity.ok(new AjaxResponse(200, "Xóa thành công"));
	}
}
