package com.ms.ware.online.solution.view;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class SetupController {
    @RequestMapping(value = "/web/setup/country", method = RequestMethod.GET)
    public String country() {
        return "setup/country";
    }

    @RequestMapping(value = "/web/setup/branch", method = RequestMethod.GET)
    public String branch() {
        return "setup/branch";
    }

    @RequestMapping(value = "/web/setup/application-user", method = RequestMethod.GET)
    public String ApplicationUser() {
        return "setup/ApplicationUser";
    }
    @RequestMapping(value = "/web/booking/booking", method = RequestMethod.GET)
    public String booking() {
        return "booking/booking";
    }
}
