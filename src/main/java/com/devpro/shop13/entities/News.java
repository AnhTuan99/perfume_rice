package com.devpro.shop13.entities;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

@Entity
@Table(name = "tbl_news")
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
public class News extends BaseEntity {
    @Column(name = "title", length = 1000, nullable = true)
    private String title;

    @Column(name = "short_news", length = 2000, nullable = true)
    private String short_news;

    @Column(name = "news", columnDefinition = "LONGTEXT", nullable = true)
    private String news;

    @Column(name = "seo", length = 200, nullable = true)
    private String seo;

    @Column(name = "avatar", length = 3000, nullable = true)
    private String avatar;
}
