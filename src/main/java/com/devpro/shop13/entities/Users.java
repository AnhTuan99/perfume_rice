package com.devpro.shop13.entities;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "tbl_users")
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
public class Users extends BaseEntity {

    @Column(name = "username", length = 45, nullable = true)
    private String username;

    @Column(name = "password", length = 100, nullable = true)
    private String password;

    @Column(name = "email", length = 45, nullable = true)
    private String email;

    @Column(name = "fullName", length = 100, nullable = true)
    private String fullName;

    @Column(name = "reset_password_token", length = 45, nullable = true)
    private String resetPasswordToken;

    @Column(name = "telephone", length = 14, nullable = true)
    private String telephone;

    @Column(name = "address", length = 1000, nullable = true)
    private String address;

    @OneToMany(cascade = CascadeType.ALL, mappedBy = "users", fetch = FetchType.LAZY)
    private List<Saleorder> saleOrder = new ArrayList<>();

    @ManyToMany(cascade = CascadeType.ALL, fetch = FetchType.EAGER)
    @JoinTable(name = "tbl_users_roles", joinColumns = {
            @JoinColumn(name = "user_id"/* , referencedColumnName = "id" */)}, inverseJoinColumns = {
            @JoinColumn(name = "role_id"/* , referencedColumnName = "id" */)})
    private List<Roles> roles = new ArrayList<>();

    public void addRoles(Roles roless) {
        roless.getUsers().add(this);
        roles.add(roless);
    }

    public void removeRoles(Roles roless) {
        roless.getUsers().remove(this);
        roles.remove(roless);
    }

    @Override
    public String toString() {
        return "Users [username=" + username + ", password=" + password + ", email=" + email + ", fullName=" + fullName
                + ", resetPasswordToken=" + resetPasswordToken + ", saleOrder=" + saleOrder + ", roles=" + roles + "]";
    }
}
