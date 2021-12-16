package com.devpro.shop13.controller.admin;

import com.devpro.shop13.entities.Roles;
import com.devpro.shop13.entities.Users;
import com.devpro.shop13.services.RolesService;
import com.devpro.shop13.services.UsersService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.time.LocalDateTime;
import java.util.List;

@Controller
public class AdminLoginController {
    @Autowired
    private UsersService usersService;

    @Autowired
    private RolesService rolesService;

    @RequestMapping(value = {"/cai-nay-la-mapping-trong-adminlogincontroller"}, method = RequestMethod.GET)
    public String index(HttpSession session, final ModelMap model, final HttpServletRequest request, final HttpServletResponse response)
            throws Exception {
        model.addAttribute("users", new Users());
        return "admin/Login";
    }

    @RequestMapping(value = {"/signUp"}, method = RequestMethod.GET)
    public String signUp(final ModelMap model, final HttpServletRequest request, final HttpServletResponse response) throws IOException {
        return "admin/signUp";
    }

    @RequestMapping(value = {"/signUp"}, method = RequestMethod.POST)
    public String signUp(@ModelAttribute("users") Users users, final ModelMap model, final HttpServletRequest request, final HttpServletResponse response)
            throws Exception {
        users.setCreatedDate(LocalDateTime.now());
        BCryptPasswordEncoder encoder = new BCryptPasswordEncoder(8);
        String result = encoder.encode(users.getPassword());
        users.setPassword(result);
        List<Roles> listRole = rolesService.findByRoleUsers();
        users.setRoles(listRole);
        usersService.save(users);
        return "admin/Login";
    }

    @RequestMapping(value = "/403", method = RequestMethod.GET)
    public String accessDenied(Model model) {

        return "admin/pagesError";
    }
}

