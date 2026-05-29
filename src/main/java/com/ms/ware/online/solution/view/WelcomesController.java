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
    public String login() {
        return "Login";
    }
    @RequestMapping(value = "/web/setup", method = RequestMethod.GET)
    public String setup() {
        return "login/setup";
    }
    @RequestMapping(value = "/web/home", method = RequestMethod.GET)
    public String home() {
        return "login/home";
    }



    @RequestMapping(value = "/web/logout", method = RequestMethod.GET)
    public void logout(HttpSession session, HttpServletResponse response) throws IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        try {
            session.invalidate();
        } catch (Exception ignored) {
        }
        out.println("<script>" +
                "localStorage.clear();" +
                "window.location.assign('/');" +
                "</script>");

    }

}
