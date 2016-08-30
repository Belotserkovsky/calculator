package by.belotserkovsky.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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
    public String logout() {
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
