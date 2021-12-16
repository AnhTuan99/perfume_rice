package com.devpro.shop13.controller.user;

import com.devpro.shop13.dto.AjaxResponse;
import com.devpro.shop13.dto.MyPassword;
import com.devpro.shop13.dto.MyUser;
import com.devpro.shop13.entities.Users;
import com.devpro.shop13.services.RolesService;
import com.devpro.shop13.services.UsersService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.time.LocalDateTime;

@Controller
public class ProfileController extends BaseController {
    @Autowired
    private UsersService usersService;

    @RequestMapping(value = {"/profile"}, method = RequestMethod.GET)
    public String profile(final ModelMap model, final HttpServletRequest request, final HttpServletResponse response)
            throws Exception {
        Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        Users users = usersService.getById(((MyUser) principal).getId());
        model.addAttribute("users", users);
        return "user/profile";
    }

    @RequestMapping(value = {"/profile"}, method = RequestMethod.POST)
    public String addContactPost(final ModelMap model, final HttpServletRequest request,
                                 final HttpServletResponse response, @ModelAttribute("users") Users users) throws Exception {
        Users usersOnDb = usersService.getById(users.getId());
        users.setCreatedDate(usersOnDb.getCreatedDate());
        users.setCreatedBy(usersOnDb.getCreatedBy());
        users.setUpdatedDate(LocalDateTime.now());
        users.setUpdatedBy(users.getId());
        users.setPassword(usersOnDb.getPassword());
        users.setRoles(usersOnDb.getRoles());
        usersService.save(users);
        return "redirect:/cai-nay-la-thuoc-tinh-href-trong-the-a-logout";
    }

    @RequestMapping(value = {"/profileUpdatePass"}, method = RequestMethod.POST)
    public ResponseEntity<AjaxResponse> profileUpdatePass(final ModelMap model, final HttpServletRequest request, final HttpServletResponse response, @RequestBody MyPassword myPassword) {
        Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        Users users = usersService.getById(((MyUser) principal).getId());
        if (usersService.checkIfValidOldPassword(users, myPassword.getPasswordNow()) && !myPassword.getPasswordNew().equals(myPassword.getPasswordNow())) {
            BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
            String result = encoder.encode(myPassword.getPasswordNew());
            users.setPassword(result);
            users.setUpdatedBy(((MyUser) principal).getId());
            users.setUpdatedDate(LocalDateTime.now());
            usersService.save(users);
            return ResponseEntity.ok(new AjaxResponse(200, "Cập nhật thành công"));
        }
        return ResponseEntity.ok(new AjaxResponse(500, "Cập nhật không thành công"));
    }


}

