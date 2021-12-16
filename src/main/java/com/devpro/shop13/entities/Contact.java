package com.devpro.shop13.entities;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@Entity
@Table(name = "tbl_contact")
public class Contact extends BaseEntity {
    @Column(name = "first_name", length = 45, nullable = true)
    private String first_name;

    @Column(name = "last_name", length = 45, nullable = true)
    private String last_name;

    @Column(name = "email", length = 45, nullable = true)
    private String email;

    @Column(name = "request_type", length = 45, nullable = true)
    private String request_type;

    @Column(name = "message", length = 4000, nullable = true)
    private String message;

    @Column(name = "telephone", length = 13, nullable = true)
    private String telephone;

    @Column(name = "address", length = 200, nullable = true)
    private String address;
}
