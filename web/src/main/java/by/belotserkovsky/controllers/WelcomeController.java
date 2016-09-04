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
     * @return page "welcome"
     * mapping "/calc/welcome"
     */
    @RequestMapping(method = RequestMethod.GET)
    public String welcomePage(){
        return "welcome";
    }

    /**
     * @return page "welcome"
     * mapping /calc/welcome?logout
     */
    @RequestMapping(method = RequestMethod.GET, params = "logout")
    public String logoutPage () {
        return "welcome";
    }

    /**
     * @return page "welcome"
     * mapping "/welcome?login"
     */
    @RequestMapping(method = RequestMethod.GET, params = "login")
    public String loginAfterRegister(HttpServletRequest request, HttpServletResponse response) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        if (auth != null) {
            new SecurityContextLogoutHandler().logout(request, response, auth);
        }
        return "welcome";
    }

    /**
     * @return page "welcome"
     * mapping "/welcome?loginFail"
     */
    @RequestMapping(method = RequestMethod.GET, params = "loginFail")
    public String accessDenied(){
        return "welcome";
    }
}
