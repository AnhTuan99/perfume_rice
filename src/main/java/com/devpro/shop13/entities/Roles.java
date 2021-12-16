package com.devpro.shop13.entities;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;
import java.util.HashSet;
import java.util.Set;

@Entity
@Table(name = "tbl_roles")
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
public class Roles extends BaseEntity {
    @Column(name = "name", length = 45, nullable = true)
    private String name;

    @Column(name = "description", length = 45, nullable = true)
    private String description;

    @ManyToMany(cascade = {CascadeType.PERSIST, CascadeType.REFRESH}, fetch = FetchType.EAGER, mappedBy = "roles")
    private Set<Users> users = new HashSet<>();

    public void addUsers(Users userss) {
        userss.getRoles().add(this);
        users.add(userss);
    }

    public void removeUsers(Users userss) {
        userss.getRoles().remove(this);
        users.remove(userss);
    }
}
