package com.devpro.shop13.controller.user;


import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Controller
public class StoreAddressController extends BaseController {

    @RequestMapping(value = {"/storeAddress"}, method = RequestMethod.GET)
    public String aboutUs(final ModelMap model, final HttpServletRequest request, final HttpServletResponse response)
            throws Exception {
        return "user/storeAddress";
    }
}

