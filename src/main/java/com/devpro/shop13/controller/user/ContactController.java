package com.devpro.shop13.controller.user;

import com.devpro.shop13.dto.MyUser;
import com.devpro.shop13.entities.Contact;
import com.devpro.shop13.services.ContactService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.devpro.shop13.dto.AjaxResponse;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.time.LocalDateTime;
import java.util.List;

@Controller
public class ContactController extends BaseController{
	// data đẩy xuống tầng view thông qua model 
	// request và response đại diện cho thông tin người dùng gửi lên và sever gửi về
	// sử dụng spring form
	@Autowired
	private ContactService contactService;
    // sử dụng ajax
    @RequestMapping(value = { "/contact" }, method = RequestMethod.GET)
	public String contact(final ModelMap model, final HttpServletRequest request, final HttpServletResponse response)
			throws Exception {			 
		// đẩy dữ liệu từ controller xuống view
		return "user/contact";
	}
	
	@RequestMapping(value = { "/contact" }, method = RequestMethod.POST)
	public ResponseEntity<AjaxResponse> contact(final ModelMap model, final HttpServletRequest request, final HttpServletResponse response, @RequestBody Contact contact) {
		Object principal= SecurityContextHolder.getContext().getAuthentication().getPrincipal();
    	boolean check=false;
		boolean check2=false;
		Contact co=null;
    	List<Contact> listContactInDB= contactService.findAll();
		for (Contact c: listContactInDB) {
			if(c.getEmail() !=null && c.getEmail().equalsIgnoreCase(contact.getEmail()) && (c.getAddress()==null || c.getTelephone()==null || c.getFirst_name()==null || c.getLast_name()==null  )){
				check=true;
				co=c;
			}
			if (c.getEmail() !=null && c.getEmail().equalsIgnoreCase(contact.getEmail()) && c.getAddress() !=null && c.getAddress().equalsIgnoreCase(contact.getAddress()) && c.getLast_name() !=null && c.getLast_name().equalsIgnoreCase(contact.getLast_name()) && c.getFirst_name() !=null && c.getFirst_name().equalsIgnoreCase(contact.getFirst_name()) && c.getMessage() !=null && c.getMessage().equalsIgnoreCase(contact.getMessage()) && c.getTelephone() !=null && c.getTelephone().equalsIgnoreCase(contact.getTelephone()) ){
				check2=true;
			}

		}
		if(check==true)
		{
			co.setAddress(contact.getAddress());
			co.setFirst_name(contact.getFirst_name());
			co.setLast_name(contact.getLast_name());
			co.setMessage(contact.getMessage());
			co.setTelephone(contact.getTelephone());
			co.setUpdatedDate(LocalDateTime.now());
			co.setUpdatedBy(((MyUser)principal).getId());
			contactService.save(co);
		}
		else if(check2==false){
			contact.setCreatedDate(LocalDateTime.now());
			contact.setCreatedBy(((MyUser)principal).getId());
			contactService.save(contact);
		}


		return ResponseEntity.ok(new AjaxResponse(200, "Xác nhận thành công"));
	}

	@RequestMapping(value = { "/contactGiveEvent" }, method = RequestMethod.POST)
	public ResponseEntity<AjaxResponse> contactGiveEvent(final ModelMap model, final HttpServletRequest request, final HttpServletResponse response, @RequestBody Contact contact) {
		boolean check=false;
		Object principal= SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		List<Contact> listContactInDB= contactService.findAll();
		for (Contact c: listContactInDB) {
			if(c.getEmail() !=null && c.getEmail().equalsIgnoreCase(contact.getEmail())){
				check=true;
			}

		}
		if(check == false)
		{
			contact.setCreatedDate(LocalDateTime.now());
			contact.setCreatedBy(((MyUser)principal).getId());
			contactService.save(contact);
		}

		return ResponseEntity.ok(new AjaxResponse(200, "Xác nhận thành công"));
	}

}

