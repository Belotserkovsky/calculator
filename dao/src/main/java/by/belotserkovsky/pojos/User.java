package by.belotserkovsky.pojos;

import javax.persistence.*;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;
import java.io.Serializable;
import java.util.Set;

/**
 * Created by K.Belotserkovsky
 */

@Entity
@Table(name = "T_USER")
public class User implements Serializable{

    private Long userId;

    @Size(max = 30, message = "Maximum length 30 symbols")
    private String name;

    @Size(min = 3, max = 20, message = "Username must be between 3 and 20 characters long.")
    @Pattern(regexp = "^[a-zA-Z0-9]+$", message = "Username must be alphanumeric with no spaces")
    private String userName;

    @Size(min = 3, max = 10, message = "Username must be between 3 and 10 characters long.")
    private String password;

    @Pattern(regexp = "[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+.[A-Za-z]{2,4}", message="Incorrect email address.")
    private String email;

    private String role;
    private Set<History> CalcHistory;

    public User() {
    }

    public User(String name, String userName, String password, String email, String role) {
        this.name = name;
        this.userName = userName;
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

    @Column(name = "F_NAME")
    public String getName() {
        return name;
    }

    @Column(name = "F_USER_NAME", unique = true)
    public String getUserName() {
        return userName;
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

    public void setName(String name) {
        this.name = name;
    }

    public void setUserName(String userName) {
        this.userName = userName;
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

    public void setCalcHistory(Set<History> calcHistory) {
        CalcHistory = calcHistory;
    }
}
