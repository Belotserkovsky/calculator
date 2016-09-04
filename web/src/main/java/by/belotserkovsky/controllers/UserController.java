package by.belotserkovsky.controllers;

import by.belotserkovsky.excepsions.ResourceNotFoundException;
import by.belotserkovsky.pojos.History;
import by.belotserkovsky.pojos.User;
import by.belotserkovsky.services.ICalcService;
import by.belotserkovsky.services.IHistoryService;
import by.belotserkovsky.services.IUserService;
import by.belotserkovsky.services.exceptions.CalculationFailsException;
import org.apache.log4j.Logger;
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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
    private static Logger log = Logger.getLogger(UserController.class);

    @Autowired
    private IUserService userService;

    @Autowired
    private ICalcService calcService;

    @Autowired
    private IHistoryService historyService;

    /**
     * @param model
     * @param principal
     * @param session
     * mapping "/user/main"
     * @return page "main"
     */
    @RequestMapping(value = "/main", method = RequestMethod.GET)
    public String mainPage(ModelMap model, HttpSession session, Principal principal){
        if(session.getAttribute("sessionUserName") == null){
            User user = userService.getUserByUserName(principal.getName());
            session.setAttribute("sessionUserName", user.getName());
            log.info("user login, username: " + user.getUserName());
        }
        String result = "";
        model.addAttribute("result", result);
        return "main";
    }

    /**
     * if user entered incorrect expression
     * @param model
     * mapping "/user/main?fail"
     * @return page "main" with error
     */
    @RequestMapping(value = "/main", method = RequestMethod.GET, params = "fail")
    public String mainPage(ModelMap model){
        String result = model.get("expression").toString();
        model.addAttribute("result", result);
        return "main";
    }

    /**
     * calculate process
     * @param model
     * @param redirectAttributes
     * @param principal
     * @param original
     * mapping "/user/main?calc"
     * @return page "main" with result
     */
    @RequestMapping(value = "/main", method = RequestMethod.POST, params = "calc")
    public String calculate(ModelMap model, @RequestParam(value = "input") String original,
                            Principal principal,
                            RedirectAttributes redirectAttributes){
        String sIn = calcService.transformToRpn(original);
        String result="";
        try {
            result = calcService.calculateRpn(sIn);
        }catch (CalculationFailsException e){
            redirectAttributes.addFlashAttribute("expression", original);
            log.error("Incorrect expression: " + original);
            return "redirect:/calc/user/main?fail";
        }
        historyService.saveHistory(original, result, principal.getName());
        model.addAttribute("expression", result);
        return "main";
    }

    /**
     * jump to page "registration"
     * @param model
     * mapping "/user/new"
     * @return page "registration"
     */
    @RequestMapping(value = "/new", method = RequestMethod.GET)
    public String register(ModelMap model){
        User user = new User();
        model.addAttribute("user", user);
        return "registration";
    }

    /**
     * redirect to page "registration" if user already exists
     * @param model
     * mapping "/user/new?fail"
     * @return page "registration"
     */
    @RequestMapping(value = "/new", method = RequestMethod.GET, params = "fail")
    public String registerFail(ModelMap model){
        User user = new User();
        model.addAttribute("user", user);
        return "registration";
    }

    /**
     * jump to page "registration" for edit user info
     * @param model
     * @param principal
     * mapping "/user/update"
     * @return page "registration"
     */
    @RequestMapping(value = "/update", method = RequestMethod.GET)
    public String editUserInfo(ModelMap model, Principal principal){
        User user = userService.getUserByUserName(principal.getName());
        model.addAttribute("user", user);
        return "registration";
    }

    /**
     * create or update user
     * @param br
     * @param principal
     * @param user
     * mapping "/user/add"
     * @return page "registration"
     */
    @RequestMapping(value = "/add", method = RequestMethod.POST)
    public String addUser(@Valid User user, BindingResult br, Principal principal) {
        if(br.hasErrors()){
            //If the user is authorized, add a name to the model again
            //because if there is an error username field will be empty
            if(principal != null){
                user.setUserName(principal.getName());
            }
            return "registration";
        }
        User userTemp = userService.getUserByUserName(user.getUserName());
        if(userTemp != null){
            return "redirect:/calc/user/new?fail";
        }
        userService.createOrUpdateUser(user);
        return "redirect:/calc/welcome?login";
    }

    /**
     * jump to calculation history page with pagination
     * @param model
     * @param principal
     * @param page
     * mapping "/user/history"
     * @return page "history"
     */
    @RequestMapping(value = "/history", method = RequestMethod.GET, params = "page")
    public String showHistory(ModelMap model, @RequestParam (value = "page") String page, Principal principal){
        int currentPage = 1;
        int recordsPerPage = 3;
        if(page.length() != 0) {
            currentPage = Integer.parseInt(page);
        }
        List<History> listHistory = historyService.getUserHistory((currentPage-1)*recordsPerPage, recordsPerPage, principal.getName());
        if(listHistory.isEmpty()){
            throw new ResourceNotFoundException();
        }
        int allRecords = historyService.getRowsUserHistory(principal.getName());
        int numberOfPages = (int) Math.ceil((double)allRecords / recordsPerPage);
        model.addAttribute("listHistory", listHistory);
        model.addAttribute("numberOfPages", numberOfPages);
        model.addAttribute("currentPage", currentPage);
        return "history";
    }

    /**
     * logout
     * @param response
     * @param request
     * mapping "/user/main?logout"
     * @return page "welcome"
     */
    @RequestMapping(value = "/main", method = RequestMethod.GET, params = "logout")
    public String logoutPage (HttpServletRequest request, HttpServletResponse response) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        if (auth != null) {
            new SecurityContextLogoutHandler().logout(request, response, auth);
        }
        return "redirect:/calc/welcome?logout";
    }
}
