package com.ms.ware.online.solution.view;

import org.springframework.context.annotation.ComponentScan;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

@Controller
@ComponentScan
public class WelcomesController {
    @RequestMapping(value = "", method = RequestMethod.GET)
    public String index() {
        return "Login";
    }

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String index1() {
        return "Login";
    }


    @RequestMapping(value = "/OrganizationLogin", method = RequestMethod.GET)
    public String schoolLogin() {
        return "Login";
    }

    @RequestMapping(value = "/ForgotPassword", method = RequestMethod.GET)
    public String forgotPassword() {
        return "ForgotPassword";
    }


    @RequestMapping(value = "logout", method = RequestMethod.GET)
    public void logout(HttpSession session, HttpServletResponse response) throws IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        try {
            session.invalidate();
        } catch (Exception ignored) {
        }
        out.println("<script>" +
                "const path=localStorage.getItem('context-path');" +
                "const doc=localStorage.getItem('document-path');" +
                "localStorage.clear();" +
                "const URL='/ms-ware/Login?path='+path.replace('/edulink/','')+'&doc='+doc.replace('/','');" +
                "window.location.assign(URL);" +
                "</script>");

    }

}
