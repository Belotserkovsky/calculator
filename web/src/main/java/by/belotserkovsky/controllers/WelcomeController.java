package by.belotserkovsky.controllers;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Created by K.Belotserkovsky
 */

@Controller
@RequestMapping(value = "/calc/welcome")
public class WelcomeController {
    /**
     * @return String page
     * mapping "/welcome"
     */
    @RequestMapping(method = RequestMethod.GET)
    public String welcomePage(){
        return "welcome";
    }

    /**
     * @return String page
     * mapping /welcome?logout
     */
    @RequestMapping(method = RequestMethod.GET, params = "logout")
    public String logoutPage () {
        return "welcome";
    }

    /**
     * @return String page
     * mapping "/welcome?login"
     */
    @RequestMapping(method = RequestMethod.GET, params = "login")
    public String loginAfterRegister() {
        return "welcome";
    }

    /**
     * @return String page
     * mapping "/welcome?loginFail"
     */
    @RequestMapping(method = RequestMethod.GET, params = "loginFail")
    public String accessDenied(){
        return "welcome";
    }
}
