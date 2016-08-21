package by.belotserkovsky.pojos;

import javax.persistence.*;
import java.io.Serializable;
import java.sql.Date;

/**
 * Created by K.Belotserkovsky
 * Class describes expressions and results during use calculator
 */

@Entity
@Table (name = "T_HISTORY")
public class History implements Serializable{

    private Long id;
    private String expression;
    private String result;
    private Date creationDate;
    private User user;

    public History() {
    }

    public History(String expression, String result, Date creationDate) {
        this.expression = expression;
        this.result = result;
        this.creationDate = creationDate;
    }

    @Id
    @Column (name = "F_ID")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    public Long getId() {
        return id;
    }

    @Column (name = "F_EXPRESSION")
    public String getExpression() {
        return expression;
    }

    @Column (name = "F_RESULT")
    public String getResult() {
        return result;
    }

    @Column (name = "F_CREATION_DATE")
    public Date getCreationDate() {
        return creationDate;
    }

    @ManyToOne
    @JoinColumn(name = "F_USER_ID")
    public User getUser() {
        return user;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public void setExpression(String expression) {
        this.expression = expression;
    }

    public void setResult(String result) {
        this.result = result;
    }

    public void setCreationDate(Date creationDate) {
        this.creationDate = creationDate;
    }

    public void setUser(User user) {
        this.user = user;
    }
}
