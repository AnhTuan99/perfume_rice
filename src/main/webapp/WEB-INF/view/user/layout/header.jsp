<%@ page import="org.springframework.security.core.context.SecurityContextHolder" %>
<%@ page import="org.springframework.security.core.userdetails.UserDetails" %>
<%@ page import="com.devpro.shop13.entities.Users" %>
<%@ page import="com.devpro.shop13.dto.MyUser" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%!
  public String getFullNameLogined() {
    String fullName = "";
    Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
    if (principal instanceof UserDetails) {
      fullName = ((MyUser)principal).getFullName();
    }
    return fullName;
  }
%>
<header>
    <div class="header-container">
      <div class="container">
        <div class="row">
          <div class="col-sm-3 col-xs-12">
            <!-- Header Logo -->
            <div class="logo"><a title="Magento Commerce" href="/index"><img alt="Magento Commerce" src="/user/images/PerfumeRice.png"></a></div>
            <!-- End Header Logo -->
          </div>
          <div class="col-lg-9 col-xs-12 right_menu">
            <div class="toplinks">
              <!-- Default Welcome Message -->
              <div class="welcome-msg hidden-xs">Chào mừng bạn đến với Perfume Rice! </div>
              <!-- End Default Welcome Message -->
              <div class="links">
                <% if(getFullNameLogined().isEmpty()) {%>
                <div class="myaccount"><a title="My Account" href="/cai-nay-la-mapping-trong-adminlogincontroller"><span class="hidden-xs">Đăng Nhập</span></a></div>
                <div class="login"><a href="/signUp"><span class="hidden-xs">Đăng Ký</span></a></div>
                <%} else{%>
                <div class="myaccount"><a title="My Account" href="/profile"><span class="hidden-xs"><%= getFullNameLogined()%></span></a></div>
                <div class="login"><a href="/cai-nay-la-thuoc-tinh-href-trong-the-a-logout"><span class="hidden-xs">Đăng Xuất</span></a></div>
                <%} %>

              </div>
              <!-- links -->
            </div>

            <!-- Search-col -->
            <div class="search-box pull-right">
              <form action="/search" method="POST" id="search_mini_form" name="Categories">
                <input type="text" placeholder="Tìm kiếm..." maxlength="70" name="keyword" id="search">
                <button type="submit" class="search-btn-bg" id="btnClear" onclick="clearSearch()">
                  <span class="glyphicon glyphicon-search"></span>&nbsp;
                </button>
              </form>
            </div>
            <!-- End Search-col -->


            <!-- End Header Currency -->
          </div>
        </div>
      </div>
    </div>
  </header>