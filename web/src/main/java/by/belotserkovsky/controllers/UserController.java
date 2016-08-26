package by.belotserkovsky.controllers;

import by.belotserkovsky.pojos.User;
import by.belotserkovsky.services.ICalcService;
import by.belotserkovsky.services.IHistoryService;
import by.belotserkovsky.services.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

/**
 * Created by K.Belotserkovsky
 */

@Controller
@RequestMapping(value = "/calc/user")
public class UserController {

    @Autowired
    private IUserService userService;

    @Autowired
    private ICalcService calcService;

    @Autowired
    private IHistoryService historyService;

    @RequestMapping(value = "/main", method = RequestMethod.GET)
    public String mainPage(ModelMap model){
        String result = "";
        model.addAttribute("result", result);
        return "main";
    }

    @RequestMapping(value = "/main", method = RequestMethod.POST, params = "calc")
    public String calculate(ModelMap model,
                            @RequestParam(value = "userName") String name,
                            @RequestParam(value = "expression") String original){
        String sIn = calcService.transformToRpn(original);
        Double result = calcService.calculateRpn(sIn);
        historyService.saveHistory(original, result.toString(), name);
        model.addAttribute("expression", result);
        return "main";
    }

    /**
     * @param model
     * mapping "/user?new"
     * @return String page
     */
    @RequestMapping(method = RequestMethod.GET, params = "new")
    public String register(ModelMap model){
        User user = new User();
        model.addAttribute("user", user);
        return "registration";
    }

    @RequestMapping(method = RequestMethod.POST, params = "add")
    public String addUser(@Valid User user, BindingResult br) {
        if(br.hasErrors()){
            return "registration";
        }
        userService.createOrUpdateUser(user);
        return "redirect:/calc/welcome?login";
    }

    @RequestMapping(method = RequestMethod.GET, params = "logout")
    public String logoutPage (HttpServletRequest request, HttpServletResponse response) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        if (auth != null) {
            new SecurityContextLogoutHandler().logout(request, response, auth);
        }
        return "redirect:/calc/welcome?logout";
    }
}
