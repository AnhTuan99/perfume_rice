package com.devpro.shop13.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.springframework.util.StringUtils;

import javax.servlet.http.HttpServletRequest;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
public class ProductSearch {

    private String seo;
    private String categorySeo;

    public Integer offset = null;
    public Integer count = null;

    public void buildPaging(HttpServletRequest request) {
        if (!StringUtils.isEmpty(request.getParameter("offset"))) {
            this.offset = Integer.parseInt(request.getParameter("offset"));
        } else {
            this.offset = 0;
        }
    }
}
