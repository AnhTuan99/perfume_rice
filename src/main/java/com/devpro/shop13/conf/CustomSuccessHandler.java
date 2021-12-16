package com.devpro.shop13.conf;

import com.devpro.shop13.dto.MyUser;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.web.authentication.SavedRequestAwareAuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@Component
public class CustomSuccessHandler extends SavedRequestAwareAuthenticationSuccessHandler {
    @Override
    public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
                                        Authentication authentication) throws IOException, ServletException {
        MyUser logined = (MyUser) getUserLogined();
        if (logined.hasAuthority("ADMIN")) {
            response.sendRedirect(request.getContextPath() + "/admin");
        } else if (logined.hasAuthority("USER")) {
            response.sendRedirect(request.getContextPath() + "/index");
        }
    }

    public UserDetails getUserLogined() {
        Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        return (MyUser) principal;
    }
}
