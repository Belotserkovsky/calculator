package by.belotserkovsky.pojos;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Set;

/**
 * Created by K.Belotserkovsky
 */

@Entity
@Table(name = "T_USER")
public class User implements Serializable{

    private Long userId;
    private String userName;
    private String login;
    private String password;
    private String email;
    private String role;
    private Set<History> CalcHistory;

    public User() {
    }

    public User(String userName, String login, String password, String email, String role) {
        this.userName = userName;
        this.login = login;
        this.password = password;
        this.email = email;
        this.role = role;
    }

    @Id
    @Column (name = "F_USER_ID")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    public Long getUserId() {
        return userId;
    }

    @Column(name = "F_USER_NAME")
    public String getUserName() {
        return userName;
    }

    @Column(name = "F_LOGIN", unique = true)
    public String getLogin() {
        return login;
    }

    @Column (name = "F_PASSWORD")
    public String getPassword() {
        return password;
    }

    @Column(name = "F_EMAIL")
    public String getEmail() {
        return email;
    }

    @Column (name = "F_ROLE")
    public String getRole() {
        return role;
    }

    @OneToMany(mappedBy = "user", cascade = CascadeType.ALL)
    public Set<History> getCalcHistory() {
        return CalcHistory;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public void setLogin(String login) {
        this.login = login;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setRole(String role) {
        this.role = role;
    }
}
