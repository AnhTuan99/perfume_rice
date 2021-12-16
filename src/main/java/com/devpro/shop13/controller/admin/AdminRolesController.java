package com.devpro.shop13.controller.admin;

import com.devpro.shop13.dto.AjaxResponse;
import com.devpro.shop13.dto.MyUser;
import com.devpro.shop13.dto.ProductSearch;
import com.devpro.shop13.entities.Roles;
import com.devpro.shop13.services.RolesService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.time.LocalDateTime;
import java.util.List;


@Controller
public class AdminRolesController {

	@Autowired
	private RolesService rolesService;

	@RequestMapping(value = { "/admin/listRoles" }, method = RequestMethod.GET)
	public String list(final ModelMap model, final HttpServletRequest request, final HttpServletResponse response)
			throws Exception {
		ProductSearch productSearch= new ProductSearch();
		productSearch.buildPaging(request);
		model.addAttribute("roles", rolesService.findAll(productSearch, 10));
		model.addAttribute("productSearch",productSearch);
		return "admin/listRoles";
	}

	@RequestMapping(value = { "/admin/addRoles" }, method = RequestMethod.GET)
	public String addRolesGet(final ModelMap model, final HttpServletRequest request,
								 final HttpServletResponse response) throws Exception {
		model.addAttribute("roles", new Roles());
		return "admin/addRoles";
	}

	@RequestMapping(value = { "/admin/addRoles" }, method = RequestMethod.POST)
	public String addRolesPost(final ModelMap model, final HttpServletRequest request,
								  final HttpServletResponse response,
								  @ModelAttribute("roles") Roles roles) throws Exception {
		Object principal= SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		boolean check =false;
		List<Roles> re= rolesService.findAll();
		for (Roles r : re) {
			if(roles.getId()==r.getId())
				check =true;
		}
		if(check ==true){
			Roles rolesOnDb = rolesService.getById(roles.getId());
			roles.setCreatedDate(rolesOnDb.getCreatedDate());
			roles.setCreatedBy(rolesOnDb.getCreatedBy());
			roles.setUpdatedDate(LocalDateTime.now());
			roles.setUpdatedBy(((MyUser)principal).getId());
		}
		else{
			roles.setCreatedDate(LocalDateTime.now());
			roles.setCreatedBy(((MyUser)principal).getId());
		}
		rolesService.save(roles);
		return "redirect:/admin/listRoles";
	}

	@RequestMapping(value = { "/admin/updateRoles/{id}" }, method = RequestMethod.GET)
	public String updateProduct(@PathVariable("id") Integer id,
							   final ModelMap model, final HttpServletRequest request, final HttpServletResponse response) throws Exception {
		Roles roles = rolesService.getById(id);
		model.addAttribute("roles", roles);
		return "admin/addRoles";
	}

	@RequestMapping(value = { "/deleteRoles" }, method = RequestMethod.POST)
	public ResponseEntity<AjaxResponse> deleteRoles(final ModelMap model, final HttpServletRequest request,
													   final HttpServletResponse response, @RequestBody Roles roles) {

		Roles ro = rolesService.getById(roles.getId());
		if(ro.getStatus())
			ro.setStatus(false);
		else
			ro.setStatus(true);
		rolesService.save(ro);
		return ResponseEntity.ok(new AjaxResponse(200, "Xóa thành công"));
	}
}
