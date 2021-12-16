package com.devpro.shop13.controller.admin;

import com.devpro.shop13.dto.AjaxResponse;
import com.devpro.shop13.dto.MyUser;
import com.devpro.shop13.dto.ProductSearch;
import com.devpro.shop13.entities.Contact;
import com.devpro.shop13.services.ContactService;
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
public class AdminContactController {

    @Autowired
    private ContactService contactService;

    @RequestMapping(value = {"/admin/listContact"}, method = RequestMethod.GET)
    public String listContact(final ModelMap model, final HttpServletRequest request, final HttpServletResponse response)
            throws Exception {
        ProductSearch productSearch = new ProductSearch();
        productSearch.buildPaging(request);
        model.addAttribute("contacts", contactService.findAll(productSearch, 10));
        model.addAttribute("productSearch", productSearch);
        return "admin/listContact";
    }

    @RequestMapping(value = {"/admin/addContact"}, method = RequestMethod.GET)
    public String addContactGet(final ModelMap model, final HttpServletRequest request,
                                final HttpServletResponse response) throws Exception {
        model.addAttribute("contacts", new Contact());
        return "admin/addContact";
    }

    @RequestMapping(value = {"/admin/addContact"}, method = RequestMethod.POST)
    public String addContactPost(final ModelMap model, final HttpServletRequest request,
                                 final HttpServletResponse response, @ModelAttribute("contacts") Contact contact) throws Exception {
        Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        boolean check = false;
        List<Contact> listContact = contactService.findAll();
        for (Contact c : listContact) {
            if (contact.getId() == c.getId())
                check = true;
        }
        if (check == true) {
            Contact contactOnDb = contactService.getById(contact.getId());
            contact.setCreatedDate(contactOnDb.getCreatedDate());
            contact.setCreatedBy(contactOnDb.getCreatedBy());
            contact.setUpdatedDate(LocalDateTime.now());
            contact.setUpdatedBy(((MyUser) principal).getId());
        } else {
            contact.setCreatedDate(LocalDateTime.now());
            contact.setCreatedBy(((MyUser) principal).getId());
        }
        contactService.save(contact);
        return "redirect:/admin/listContact";
    }

    @RequestMapping(value = {"/admin/updateContact/{id}"}, method = RequestMethod.GET)
    public String saveContact(@PathVariable("id") Integer id,
                              final ModelMap model, final HttpServletRequest request, final HttpServletResponse response) throws Exception {
        Contact contact = contactService.getById(id);
        model.addAttribute("contacts", contact);
        return "admin/addContact";
    }

    @RequestMapping(value = {"/deleteContact"}, method = RequestMethod.POST)
    public ResponseEntity<AjaxResponse> deleteContact(final ModelMap model, final HttpServletRequest request,
                                                      final HttpServletResponse response, @RequestBody Contact contacts) {

        Contact contact = contactService.getById(contacts.getId());
        if (contact.getStatus())
            contact.setStatus(false);
        else
            contact.setStatus(true);
        contactService.save(contact);
        return ResponseEntity.ok(new AjaxResponse(200, "Xóa thành công"));
    }


}
