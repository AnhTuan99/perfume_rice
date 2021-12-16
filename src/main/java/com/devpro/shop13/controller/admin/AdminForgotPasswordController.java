package com.devpro.shop13.controller.admin;

import com.devpro.shop13.Exception.CustomerNotFoundException;
import com.devpro.shop13.dto.Utility;
import com.devpro.shop13.entities.Users;
import com.devpro.shop13.services.RolesService;
import com.devpro.shop13.services.UsersService;
import net.bytebuddy.utility.RandomString;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.query.Param;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.UnsupportedEncodingException;

@Controller
public class AdminForgotPasswordController {
    // data đẩy xuống tầng view thông qua model
    // request và response đại diện cho thông tin người dùng gửi lên và sever gửi về

    @Autowired
    private UsersService usersService;

    @Autowired
    private RolesService rolesService;

    @Autowired
    private JavaMailSender mailSender;

    @RequestMapping(value = {"/reminderPassword"}, method = RequestMethod.GET)
    public String reminderPassword(final ModelMap model, final HttpServletRequest request, final HttpServletResponse response) throws IOException {
        return "admin/reminderPass";
    }

    @RequestMapping(value = {"/reminderPassword"}, method = RequestMethod.POST)
    public String processForgotPassword(HttpServletRequest request, Model model) {
        String email = request.getParameter("email");
        String token = RandomString.make(45);
        try {
            usersService.updateResetPasswordToken(token, email);
            String resetPasswordLink = Utility.getSiteURL(request) + "/reset_password?token=" + token;
            sendEmail(email, resetPasswordLink);
            model.addAttribute("message", "Chúng tôi đã gửi một liên kết đặt lại mật khẩu đến email của bạn. Hãy kiểm tra.");

        } catch (CustomerNotFoundException ex) {
            model.addAttribute("error", ex.getMessage());
        } catch (UnsupportedEncodingException | MessagingException e) {
            model.addAttribute("error", "Lỗi khi gửi email");
        }

        return "admin/reminderPass";
    }

    public void sendEmail(String recipientEmail, String link)
            throws MessagingException, UnsupportedEncodingException {
        MimeMessage message = mailSender.createMimeMessage();
        MimeMessageHelper helper = new MimeMessageHelper(message, true, "UTF-8");

        helper.setFrom("contact@shopme.com", "Perfume Rice Support");
        helper.setTo(recipientEmail);

        String subject = "Đây là liên kết để đặt lại mật khẩu của bạn";

        String content = "<p>Hello,</p>"
                + "<p>Bạn đã yêu cầu đặt lại mật khẩu của mình.</p>"
                + "<p>Nhấp vào liên kết bên dưới để thay đổi mật khẩu của bạn:</p>"
                + "<p><a href=\"" + link + "\">Thay đổi mật khẩu của tôi</a></p>"
                + "<br>"
                + "<p>Bỏ qua email này nếu bạn nhớ mật khẩu của mình, "
                + "hoặc bạn đã không thực hiện yêu cầu.</p>";

        helper.setSubject(subject);

        helper.setText(content, true);

        mailSender.send(message);
    }

    @RequestMapping(value = {"/reset_password"}, method = RequestMethod.GET)
    public String showResetPasswordForm(@Param(value = "token") String token, final ModelMap model, final HttpServletRequest request, final HttpServletResponse response) throws IOException {

        try {
            Users users = usersService.findByResetPasswordToken(token);
            model.addAttribute("token", token);


        } catch (Exception e) {
            model.addAttribute("message", "Liên kết đặt lại mật khẩu đã hết hạn");
            return "admin/messagePass";
        }

        return "admin/resetPass";
    }

    @RequestMapping(value = {"/reset_password"}, method = RequestMethod.POST)
    public String processResetPassword(HttpServletRequest request, Model model) {
        String token = request.getParameter("token");
        String password = request.getParameter("password");

        try {
            Users users = usersService.findByResetPasswordToken(token);
            usersService.updatePassword(users, password);
            model.addAttribute("message", "Bạn đã thay đổi thành công mật khẩu của bạn.");

        } catch (Exception e) {
            model.addAttribute("message", "Mã không hợp lệ");
        }

        return "admin/messagePass";
    }


}

