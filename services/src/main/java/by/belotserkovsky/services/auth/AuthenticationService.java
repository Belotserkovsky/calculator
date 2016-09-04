package by.belotserkovsky.services.auth;

import by.belotserkovsky.pojos.User;
import by.belotserkovsky.pojos.constants.Role;
import by.belotserkovsky.services.IUserService;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

/**
 * util for authorization with Spring Security
 * Created by K.Belotserkovsky
 */

@Service("authService")
public class AuthenticationService implements UserDetailsService {
    private static Logger log = Logger.getLogger(AuthenticationService.class);

    @Autowired
    private IUserService userService;

    /**
     * @param userName
     * @return org.springframework.security.core.userdetails.User
     * @throws UsernameNotFoundException
     */
    @Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
    public UserDetails loadUserByUsername(String userName)
            throws UsernameNotFoundException {
        User user = userService.getUserByUserName(userName);
        if (user == null) {
            log.error("User not found");
            throw new UsernameNotFoundException("Username not found");
        }
        return new org.springframework.security.core.userdetails.User(user.getUserName(), user.getPassword(),
                (Role.USER.getType().equals(user.getRole()) || (Role.ADMIN.getType().equals(user.getRole()))),
                true, true, true, getGrantedAuthorities(user));
    }

    /**
     * @param user
     * @return
     */
    private List<GrantedAuthority> getGrantedAuthorities(User user) {
        List<GrantedAuthority> authorities = new ArrayList<GrantedAuthority>();
        authorities.add(new SimpleGrantedAuthority("ROLE_" + user.getRole()));
        return authorities;
    }
}
