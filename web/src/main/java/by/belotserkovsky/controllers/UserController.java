package by.belotserkovsky.controllers;

import by.belotserkovsky.pojos.History;
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
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.security.Principal;
import java.util.List;

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
    public String mainPage(ModelMap model, HttpSession session, Principal principal){
        User user = userService.getUserByUserName(principal.getName());
        session.setAttribute("user", user);
        String result = "";
        model.addAttribute("result", result);
        return "main";
    }

    @RequestMapping(value = "/main", method = RequestMethod.POST, params = "calc")
    public String calculate(ModelMap model,
                            @RequestParam(value = "input") String original,
                            Principal principal){
        String sIn = calcService.transformToRpn(original);
        String result = calcService.calculateRpn(sIn);
        historyService.saveHistory(original, result, principal.getName());
        model.addAttribute("expression", result);
        return "main";
    }

    /**
     * @param model
     * mapping "/user?new"
     * @return String page
     */
    @RequestMapping(value = "/new", method = RequestMethod.GET)
    public String register(ModelMap model){
        User user = new User();
        model.addAttribute("user", user);
        return "registration";
    }

    @RequestMapping(value = "/new", method = RequestMethod.GET, params = "fail")
    public String registerFail(ModelMap model){
        User user = new User();
        model.addAttribute("user", user);
        return "registration";
    }

    @RequestMapping(method = RequestMethod.POST, params = "add")
    public String addUser(@Valid User user, BindingResult br) {
        if(br.hasErrors()){
            return "registration";
        }
        User uTemp = userService.getUserByUserName(user.getUserName());
        if(uTemp != null){
            return "redirect:/calc/user/new?fail";
        }
        userService.createOrUpdateUser(user);
        return "redirect:/calc/welcome?login";
    }

    @RequestMapping(value = "/main", method = RequestMethod.POST, params = "edit")
    public String editUserInfo(ModelMap model, Principal principal){
        User user = userService.getUserByUserName(principal.getName());
        model.addAttribute("user", user);
        return "registration";
    }

    @RequestMapping(value = "/history", method = RequestMethod.GET, params = "page")
    public String showHistory(ModelMap model, @RequestParam (value = "page") String page){
        int currentPage = 1;
        int recordsPerPage = 3;
        if(page.length() != 0) {
            currentPage = Integer.parseInt(page);
        }
        int allRecords = historyService.getRowsHistory();
        List<History> listHistory = historyService.getHistory((currentPage-1)*recordsPerPage, recordsPerPage);
        int numberOfPages = (int) Math.ceil((double)allRecords / recordsPerPage);
        model.addAttribute("listHistory", listHistory);
        model.addAttribute("numberOfPages", numberOfPages);
        model.addAttribute("currentPage", currentPage);
        return "history";
    }

    @RequestMapping(value = "/main", method = RequestMethod.GET, params = "logout")
    public String logoutPage (HttpServletRequest request, HttpServletResponse response, HttpSession session) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        if (auth != null) {
            new SecurityContextLogoutHandler().logout(request, response, auth);
        }
        session.invalidate();
        return "redirect:/calc/welcome?logout";
    }
}
