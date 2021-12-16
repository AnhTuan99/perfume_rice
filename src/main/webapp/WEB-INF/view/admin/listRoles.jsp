<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>

<!-- JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!-- SPRING FORM -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!-- Paging -->
<%@ taglib prefix="tag" uri="/WEB-INF/taglibs/pagingTagLibs.tld"%>
<!DOCTYPE html>
<html lang="en">


<!-- Tieu Long Lanh Kute -->
<!-- Added by HTTrack -->
<meta http-equiv="content-type" content="text/html;charset=UTF-8"/>
<!-- /Added by HTTrack -->
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard | Nifty - Responsive admin template.</title>


    <!--STYLESHEET-->
    <!--=================================================-->

    <jsp:include page="/WEB-INF/view/admin/layout/css.jsp"></jsp:include>


    <!--SCRIPT-->
    <!--=================================================-->

    <!--Page Load Progress Bar [ OPTIONAL ]-->


    <!--

        REQUIRED
        You must include this in your project.

        RECOMMENDED
        This category must be included but you may modify which plugins or components which should be included in your project.

        OPTIONAL
        Optional plugins. You may choose whether to include it in your project or not.

        DEMONSTRATION
        This is to be removed, used for demonstration purposes only. This category must not be included in your project.

        SAMPLE
        Some script samples which explain how to initialize plugins or components. This category should not be included in your project.


        Detailed information and more samples can be found in the document.

        -->


</head>

<!--TIPS-->
<!--You may remove all ID or Class names which contain "demo-", they are only used for demonstration. -->

<body>
<div id="container" class="effect mainnav-lg">

    <!--NAVBAR-->
    <!--===================================================-->
    <jsp:include page="/WEB-INF/view/admin/layout/header.jsp"></jsp:include>
    <!--===================================================-->
    <!--END NAVBAR-->

    <div class="boxed">

        <!--CONTENT CONTAINER-->
        <!--===================================================-->
        <div id="content-container">

            <div class="panel">
                <div class="panel-heading">
                    <div class="panel-control">
                        <a
                                class="fa fa-question-circle fa-lg fa-fw unselectable add-tooltip"
                                href="#"
                                data-original-title="<h4 class='text-thin'>Information</h4><p style='width:150px'>This is an information bubble to help the user.</p>"
                                data-html="true" title=""></a>
                    </div>
                    <h3 class="panel-title">Quản Lý Quyền </h3>
                </div>

                <div class="panel-body">
                    <div class="pad-btm form-inline">
                        <div class="row">
                            <div class="col-sm-6 table-toolbar-left">
                                <a href="/admin/addRoles">
                                    <button id="demo-btn-addrow" class="btn btn-purple btn-labeled fa fa-plus">Thêm quyền
                                    </button>
                                </a>

                            </div>
                            <div class="col-sm-6 table-toolbar-right">
                                <div class="form-group">
                                    <input id="myInput" type="text"
                                           placeholder="Tìm kiếm" class="form-control" autocomplete="off">
                                </div>
                                <%--<div class="btn-group">
                                    <div class="btn-group">
                                        <button data-toggle="dropdown"
                                                class="btn btn-default dropdown-toggle">
                                            <i class="fa fa-cog"></i> <span class="caret"></span>
                                        </button>
                                        <ul role="menu" class="dropdown-menu dropdown-menu-right">
                                            <li><a href="#">Action</a></li>
                                            <li><a href="#">Another action</a></li>
                                            <li><a href="#">Something else here</a></li>
                                            <li class="divider"></li>
                                            <li><a href="#">Separated link</a></li>
                                        </ul>
                                    </div>
                                </div>--%>
                            </div>
                        </div>
                    </div>
                    <div class="table-responsive">
                        <form method="post" action="/admin/listNews">
                            <table class="table table-striped table-hover">
                                <thead>
                                <tr>
                                    <th style="width: 4ex">#</th>
                                    <th>Tên</th>
                                    <th>Mô tả</th>
                                    <th class="text-center">Tình trạng</th>
                                    <th class="text-right">Hành động</th>
                                </tr>
                                </thead>
                                <tbody id="myTable">
                                <c:forEach var="r" items="${roles }" varStatus="loop">
                                    <tr class="tr-shadow">
                                        <th scope="row">${loop.index + 1}</th>
                                        <td style="font-size: 16px;">${r.name}</td>
                                        <td>${r.description}</td>
                                        <td class="text-center">
                                            <c:choose>
                                                <c:when test="${r.status}">
                                                    <span class="badge" style="background: green;">Active</span>
                                                </c:when>
                                                <c:otherwise>
                                                    <span class="badge" style="background: red;">None</span>
                                                </c:otherwise>
                                            </c:choose>
                                        </td>
                                        <td class="text-right">
                                            <a class="btn btn-xs btn-default add-tooltip"
                                               data-toggle="tooltip" href="/admin/updateRoles/${r.id}" data-original-title="Edit"
                                               data-container="body">
                                                <i class="fa fa-pencil"></i>
                                            </a>
                                            <a class="btn btn-xs btn-danger add-tooltip"
                                               data-toggle="tooltip" href="#" data-original-title="Delete" onclick="deleteRoles(${r.id});"
                                               data-container="body">
                                                <i class="fa fa-times"></i>
                                            </a>
                                        </td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </form>
                    </div>
                    <div class="pages" style="text-align: center">
                        <tag:paginate offset="${productSearch.offset }"
                                      count="${productSearch.count }" uri="${pageUrl}" />
                    </div>
                </div>
            </div>

        </div>
        <!--===================================================-->
        <!--END CONTENT CONTAINER-->


        <!--MAIN NAVIGATION-->
        <!--===================================================-->
        <jsp:include page="/WEB-INF/view/admin/layout/menu.jsp"></jsp:include>
        <!--===================================================-->
        <!--END MAIN NAVIGATION-->

        <!--ASIDE-->
        <!--===================================================-->
        <aside id="aside-container">
            <div id="aside">
                <div class="nano">
                    <div class="nano-content">

                        <!--Nav tabs-->
                        <!--================================-->
                        <ul class="nav nav-tabs nav-justified">
                            <li class="active"><a href="#demo-asd-tab-1"
                                                  data-toggle="tab"> <i class="fa fa-comments"></i> <span
                                    class="badge badge-purple">7</span>
                            </a></li>
                            <li><a href="#demo-asd-tab-2" data-toggle="tab"> <i
                                    class="fa fa-info-circle"></i>
                            </a></li>
                            <li><a href="#demo-asd-tab-3" data-toggle="tab"> <i
                                    class="fa fa-wrench"></i>
                            </a></li>
                        </ul>
                        <!--================================-->
                        <!--End nav tabs-->


                        <!-- Tabs Content -->
                        <!--================================-->
                        <div class="tab-content">

                            <!--First tab (Contact list)-->
                            <!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
                            <div class="tab-pane fade in active" id="demo-asd-tab-1">
                                <h4 class="pad-hor text-thin">
                                    <span class="pull-right badge badge-warning">3</span> Family
                                </h4>

                                <!--Family-->
                                <div class="list-group bg-trans">
                                    <a href="#" class="list-group-item">
                                        <div class="media-left">
                                            <img class="img-circle img-xs" src="img/av2.png"
                                                 alt="Profile Picture">
                                        </div>
                                        <div class="media-body">
                                            <div class="text-lg">Stephen Tran</div>
                                            <span class="text-muted">Availabe</span>
                                        </div>
                                    </a> <a href="#" class="list-group-item">
                                    <div class="media-left">
                                        <img class="img-circle img-xs" src="img/av4.png"
                                             alt="Profile Picture">
                                    </div>
                                    <div class="media-body">
                                        <div class="text-lg">Brittany Meyer</div>
                                        <span class="text-muted">I think so</span>
                                    </div>
                                </a> <a href="#" class="list-group-item">
                                    <div class="media-left">
                                        <img class="img-circle img-xs" src="img/av3.png"
                                             alt="Profile Picture">
                                    </div>
                                    <div class="media-body">
                                        <div class="text-lg">Donald Brown</div>
                                        <span class="text-muted">Lorem ipsum dolor sit amet.</span>
                                    </div>
                                </a>
                                </div>


                                <hr>
                                <h4 class="pad-hor text-thin">
                                    <span class="pull-right badge badge-info">4</span> Friends
                                </h4>

                                <!--Friends-->
                                <div class="list-group bg-trans">
                                    <a href="#" class="list-group-item">
                                        <div class="media-left">
                                            <img class="img-circle img-xs" src="img/av5.png"
                                                 alt="Profile Picture">
                                        </div>
                                        <div class="media-body">
                                            <div class="text-lg">Betty Murphy</div>
                                            <span class="text-muted">Bye</span>
                                        </div>
                                    </a> <a href="#" class="list-group-item">
                                    <div class="media-left">
                                        <img class="img-circle img-xs" src="img/av6.png"
                                             alt="Profile Picture">
                                    </div>
                                    <div class="media-body">
                                        <div class="text-lg">Olivia Spencer</div>
                                        <span class="text-muted">Thank you!</span>
                                    </div>
                                </a> <a href="#" class="list-group-item">
                                    <div class="media-left">
                                        <img class="img-circle img-xs" src="img/av4.png"
                                             alt="Profile Picture">
                                    </div>
                                    <div class="media-body">
                                        <div class="text-lg">Sarah Ruiz</div>
                                        <span class="text-muted">2 hours ago</span>
                                    </div>
                                </a> <a href="#" class="list-group-item">
                                    <div class="media-left">
                                        <img class="img-circle img-xs" src="img/av3.png"
                                             alt="Profile Picture">
                                    </div>
                                    <div class="media-body">
                                        <div class="text-lg">Paul Aguilar</div>
                                        <span class="text-muted">2 hours ago</span>
                                    </div>
                                </a>
                                </div>


                                <hr>
                                <h4 class="pad-hor text-thin">
                                    <span class="pull-right badge badge-success">Offline</span>
                                    Works
                                </h4>

                                <!--Works-->
                                <div class="list-group bg-trans">
                                    <a href="#" class="list-group-item"> <span
                                            class="badge badge-purple badge-icon badge-fw pull-left"></span>
                                        Joey K. Greyson
                                    </a> <a href="#" class="list-group-item"> <span
                                        class="badge badge-info badge-icon badge-fw pull-left"></span>
                                    Andrea Branden
                                </a> <a href="#" class="list-group-item"> <span
                                        class="badge badge-pink badge-icon badge-fw pull-left"></span>
                                    Lucy Moon
                                </a> <a href="#" class="list-group-item"> <span
                                        class="badge badge-success badge-icon badge-fw pull-left"></span>
                                    Johny Juan
                                </a> <a href="#" class="list-group-item"> <span
                                        class="badge badge-danger badge-icon badge-fw pull-left"></span>
                                    Susan Sun
                                </a>
                                </div>

                            </div>
                            <!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
                            <!--End first tab (Contact list)-->


                            <!--Second tab (Custom layout)-->
                            <!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
                            <div class="tab-pane fade" id="demo-asd-tab-2">

                                <!--Monthly billing-->
                                <div class="pad-all">
                                    <h4 class="text-lg mar-no">Monthly Billing</h4>
                                    <p class="text-sm">January 2015</p>
                                    <button class="btn btn-block btn-success mar-top">Pay
                                        Now
                                    </button>
                                </div>


                                <hr>

                                <!--Information-->
                                <div class="text-center clearfix pad-top">
                                    <div class="col-xs-6">
                                        <span class="h4">4,327</span>
                                        <p class="text-muted text-uppercase">
                                            <small>Sales</small>
                                        </p>
                                    </div>
                                    <div class="col-xs-6">
                                        <span class="h4">$ 1,252</span>
                                        <p class="text-muted text-uppercase">
                                            <small>Earning</small>
                                        </p>
                                    </div>
                                </div>


                                <hr>

                                <!--Simple Menu-->
                                <div class="list-group bg-trans">
                                    <a href="#" class="list-group-item"><span
                                            class="label label-danger pull-right">Featured</span>Edit
                                        Password</a> <a href="#" class="list-group-item">Email</a> <a
                                        href="#" class="list-group-item"><span
                                        class="label label-success pull-right">New</span>Chat</a> <a
                                        href="#" class="list-group-item">Reports</a> <a href="#"
                                                                                        class="list-group-item">Transfer
                                    Funds</a>
                                </div>


                                <hr>

                                <div class="text-center">
                                    Questions?
                                    <p class="text-lg text-semibold">(415) 234-53454</p>
                                    <small><em>We are here 24/7</em></small>
                                </div>
                            </div>
                            <!--End second tab (Custom layout)-->
                            <!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->


                            <!--Third tab (Settings)-->
                            <!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
                            <div class="tab-pane fade" id="demo-asd-tab-3">
                                <ul class="list-group bg-trans">
                                    <li class="list-header">
                                        <h4 class="text-thin">Account Settings</h4>
                                    </li>
                                    <li class="list-group-item">
                                        <div class="pull-right">
                                            <input class="demo-switch" type="checkbox" checked>
                                        </div>
                                        <p>Show my personal status</p> <small class="text-muted">Lorem
                                        ipsum dolor sit amet, consectetuer adipiscing elit.</small>
                                    </li>
                                    <li class="list-group-item">
                                        <div class="pull-right">
                                            <input class="demo-switch" type="checkbox" checked>
                                        </div>
                                        <p>Show offline contact</p> <small class="text-muted">Lorem
                                        ipsum dolor sit amet, consectetuer adipiscing elit.</small>
                                    </li>
                                    <li class="list-group-item">
                                        <div class="pull-right">
                                            <input class="demo-switch" type="checkbox">
                                        </div>
                                        <p>Invisible mode</p> <small class="text-muted">Lorem
                                        ipsum dolor sit amet, consectetuer adipiscing elit.</small>
                                    </li>
                                </ul>


                                <hr>

                                <ul class="list-group bg-trans">
                                    <li class="list-header"><h4 class="text-thin">Public
                                        Settings</h4></li>
                                    <li class="list-group-item">
                                        <div class="pull-right">
                                            <input class="demo-switch" type="checkbox" checked>
                                        </div>
                                        Online status
                                    </li>
                                    <li class="list-group-item">
                                        <div class="pull-right">
                                            <input class="demo-switch" type="checkbox" checked>
                                        </div>
                                        Show offline contact
                                    </li>
                                    <li class="list-group-item">
                                        <div class="pull-right">
                                            <input class="demo-switch" type="checkbox">
                                        </div>
                                        Show my device icon
                                    </li>
                                </ul>


                                <hr>

                                <h4 class="pad-hor text-thin">Task Progress</h4>
                                <div class="pad-all">
                                    <p>Upgrade Progress</p>
                                    <div class="progress progress-sm">
                                        <div class="progress-bar progress-bar-success"
                                             style="width: 15%;">
                                            <span class="sr-only">15%</span>
                                        </div>
                                    </div>
                                    <small class="text-muted">15% Completed</small>
                                </div>
                                <div class="pad-hor">
                                    <p>Database</p>
                                    <div class="progress progress-sm">
                                        <div class="progress-bar progress-bar-danger"
                                             style="width: 75%;">
                                            <span class="sr-only">75%</span>
                                        </div>
                                    </div>
                                    <small class="text-muted">17/23 Database</small>
                                </div>

                            </div>
                            <!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
                            <!--Third tab (Settings)-->

                        </div>
                    </div>
                </div>
            </div>
        </aside>
        <!--===================================================-->
        <!--END ASIDE-->

    </div>


    <!-- FOOTER -->
    <!--===================================================-->
    <jsp:include page="/WEB-INF/view/admin/layout/footer.jsp"></jsp:include>

    <!--===================================================-->
    <!-- END FOOTER -->


    <!-- SCROLL TOP BUTTON -->
    <!--===================================================-->
    <button id="scroll-top" class="btn">
        <i class="fa fa-chevron-up"></i>
    </button>
    <!--===================================================-->


</div>
<!--===================================================-->
<!-- END OF CONTAINER -->


<!-- SETTINGS - DEMO PURPOSE ONLY -->
<!--===================================================-->
<div id="demo-set" class="demo-set">
    <div class="demo-set-body bg-dark">
        <div id="demo-set-alert"></div>
        <div class="demo-set-content clearfix">
            <div class="col-xs-6 col-md-4">
                <h4 class="text-lg mar-btm">Animations</h4>
                <div id="demo-anim" class="mar-btm">
                    <label class="form-checkbox form-icon active"> <input
                            type="checkbox" checked=""> Enable Animations
                    </label>
                </div>
                <p>Transition effects</p>
                <select id="demo-ease">
                    <option value="effect" selected>ease (Default)</option>
                    <option value="easeInQuart">easeInQuart</option>
                    <option value="easeOutQuart">easeOutQuart</option>
                    <option value="easeInBack">easeInBack</option>
                    <option value="easeOutBack">easeOutBack</option>
                    <option value="easeInOutBack">easeInOutBack</option>
                    <option value="steps">Steps</option>
                    <option value="jumping">Jumping</option>
                    <option value="rubber">Rubber</option>
                </select>
                <hr class="bord-no">
                <br>
                <h4 class="text-lg mar-btm">Navigation</h4>
                <div class="mar-btm">
                    <label id="demo-nav-fixed" class="form-checkbox form-icon">
                        <input type="checkbox"> Fixed
                    </label>
                </div>
                <label id="demo-nav-coll" class="form-checkbox form-icon">
                    <input type="checkbox"> Collapsed
                </label>
                <hr class="bord-no">
                <br>
                <h4 class="text-lg mar-btm">Off Canvas Navigation</h4>
                <select id="demo-nav-offcanvas">
                    <option value="none" selected disabled="disabled">--
                        Select Mode --
                    </option>
                    <option value="push">Push</option>
                    <option value="slide">Slide in on top</option>
                    <option value="reveal">Reveal</option>
                </select>
            </div>
            <div class="col-xs-6 col-md-3">
                <h4 class="text-lg mar-btm">Aside</h4>
                <div class="form-block">
                    <label id="demo-asd-vis" class="form-checkbox form-icon">
                        <input type="checkbox"> Visible
                    </label> <label id="demo-asd-fixed" class="form-checkbox form-icon">
                    <input type="checkbox"> Fixed
                </label> <label id="demo-asd-align" class="form-checkbox form-icon">
                    <input type="checkbox"> Aside on the left side
                </label> <label id="demo-asd-themes" class="form-checkbox form-icon">
                    <input type="checkbox"> Bright Theme
                </label>
                </div>
                <hr class="bord-no">
                <br>
                <h4 class="text-lg mar-btm">Header / Navbar</h4>
                <label id="demo-navbar-fixed" class="form-checkbox form-icon">
                    <input type="checkbox"> Fixed
                </label>
                <hr class="bord-no">
                <br>
                <h4 class="text-lg mar-btm">Footer</h4>
                <label id="demo-footer-fixed" class="form-checkbox form-icon">
                    <input type="checkbox"> Fixed
                </label>
            </div>
            <div class="col-xs-12 col-md-5">
                <div id="demo-theme">
                    <h4 class="text-lg mar-btm">Color Themes</h4>
                    <div class="demo-theme-btn">
                        <a href="#" class="demo-theme demo-a-light add-tooltip"
                           data-theme="theme-light" data-type="a" data-title="(A). Light">
                            <div class="demo-theme-brand"></div>
                            <div class="demo-theme-head"></div>
                            <div class="demo-theme-nav"></div>
                        </a> <a href="#" class="demo-theme demo-a-navy add-tooltip"
                                data-theme="theme-navy" data-type="a"
                                data-title="(A). Navy Blue">
                        <div class="demo-theme-brand"></div>
                        <div class="demo-theme-head"></div>
                        <div class="demo-theme-nav"></div>
                    </a> <a href="#" class="demo-theme demo-a-ocean add-tooltip"
                            data-theme="theme-ocean" data-type="a" data-title="(A). Ocean">
                        <div class="demo-theme-brand"></div>
                        <div class="demo-theme-head"></div>
                        <div class="demo-theme-nav"></div>
                    </a> <a href="#" class="demo-theme demo-a-lime add-tooltip"
                            data-theme="theme-lime" data-type="a" data-title="(A). Lime">
                        <div class="demo-theme-brand"></div>
                        <div class="demo-theme-head"></div>
                        <div class="demo-theme-nav"></div>
                    </a> <a href="#" class="demo-theme demo-a-purple add-tooltip"
                            data-theme="theme-purple" data-type="a" data-title="(A). Purple">
                        <div class="demo-theme-brand"></div>
                        <div class="demo-theme-head"></div>
                        <div class="demo-theme-nav"></div>
                    </a> <a href="#" class="demo-theme demo-a-dust add-tooltip"
                            data-theme="theme-dust" data-type="a" data-title="(A). Dust">
                        <div class="demo-theme-brand"></div>
                        <div class="demo-theme-head"></div>
                        <div class="demo-theme-nav"></div>
                    </a> <a href="#" class="demo-theme demo-a-mint add-tooltip"
                            data-theme="theme-mint" data-type="a" data-title="(A). Mint">
                        <div class="demo-theme-brand"></div>
                        <div class="demo-theme-head"></div>
                        <div class="demo-theme-nav"></div>
                    </a> <a href="#" class="demo-theme demo-a-yellow add-tooltip"
                            data-theme="theme-yellow" data-type="a" data-title="(A). Yellow">
                        <div class="demo-theme-brand"></div>
                        <div class="demo-theme-head"></div>
                        <div class="demo-theme-nav"></div>
                    </a> <a href="#" class="demo-theme demo-a-well-red add-tooltip"
                            data-theme="theme-well-red" data-type="a"
                            data-title="(A). Well Red">
                        <div class="demo-theme-brand"></div>
                        <div class="demo-theme-head"></div>
                        <div class="demo-theme-nav"></div>
                    </a> <a href="#" class="demo-theme demo-a-coffee add-tooltip"
                            data-theme="theme-coffee" data-type="a" data-title="(A). Coffee">
                        <div class="demo-theme-brand"></div>
                        <div class="demo-theme-head"></div>
                        <div class="demo-theme-nav"></div>
                    </a> <a href="#" class="demo-theme demo-a-prickly-pear add-tooltip"
                            data-theme="theme-prickly-pear" data-type="a"
                            data-title="(A). Prickly pear">
                        <div class="demo-theme-brand"></div>
                        <div class="demo-theme-head"></div>
                        <div class="demo-theme-nav"></div>
                    </a> <a href="#" class="demo-theme demo-a-dark add-tooltip"
                            data-theme="theme-dark" data-type="a" data-title="(A). Dark">
                        <div class="demo-theme-brand"></div>
                        <div class="demo-theme-head"></div>
                        <div class="demo-theme-nav"></div>
                    </a>
                    </div>
                    <div class="demo-theme-btn">
                        <a href="#" class="demo-theme demo-b-light add-tooltip"
                           data-theme="theme-light" data-type="b" data-title="(B). Light">
                            <div class="demo-theme-brand"></div>
                            <div class="demo-theme-head"></div>
                            <div class="demo-theme-nav"></div>
                        </a> <a href="#" class="demo-theme demo-b-navy add-tooltip"
                                data-theme="theme-navy" data-type="b"
                                data-title="(B). Navy Blue">
                        <div class="demo-theme-brand"></div>
                        <div class="demo-theme-head"></div>
                        <div class="demo-theme-nav"></div>
                    </a> <a href="#" class="demo-theme demo-b-ocean add-tooltip"
                            data-theme="theme-ocean" data-type="b" data-title="(B). Ocean">
                        <div class="demo-theme-brand"></div>
                        <div class="demo-theme-head"></div>
                        <div class="demo-theme-nav"></div>
                    </a> <a href="#" class="demo-theme demo-b-lime add-tooltip"
                            data-theme="theme-lime" data-type="b" data-title="(B). Lime">
                        <div class="demo-theme-brand"></div>
                        <div class="demo-theme-head"></div>
                        <div class="demo-theme-nav"></div>
                    </a> <a href="#" class="demo-theme demo-b-purple add-tooltip"
                            data-theme="theme-purple" data-type="b" data-title="(B). Purple">
                        <div class="demo-theme-brand"></div>
                        <div class="demo-theme-head"></div>
                        <div class="demo-theme-nav"></div>
                    </a> <a href="#" class="demo-theme demo-b-dust add-tooltip"
                            data-theme="theme-dust" data-type="b" data-title="(B). Dust">
                        <div class="demo-theme-brand"></div>
                        <div class="demo-theme-head"></div>
                        <div class="demo-theme-nav"></div>
                    </a> <a href="#" class="demo-theme demo-b-mint add-tooltip"
                            data-theme="theme-mint" data-type="b" data-title="(B). Mint">
                        <div class="demo-theme-brand"></div>
                        <div class="demo-theme-head"></div>
                        <div class="demo-theme-nav"></div>
                    </a> <a href="#" class="demo-theme demo-b-yellow add-tooltip"
                            data-theme="theme-yellow" data-type="b" data-title="(B). Yellow">
                        <div class="demo-theme-brand"></div>
                        <div class="demo-theme-head"></div>
                        <div class="demo-theme-nav"></div>
                    </a> <a href="#" class="demo-theme demo-b-well-red add-tooltip"
                            data-theme="theme-well-red" data-type="b"
                            data-title="(B). Well red">
                        <div class="demo-theme-brand"></div>
                        <div class="demo-theme-head"></div>
                        <div class="demo-theme-nav"></div>
                    </a> <a href="#" class="demo-theme demo-b-coffee add-tooltip"
                            data-theme="theme-coffee" data-type="b" data-title="(B). Coofee">
                        <div class="demo-theme-brand"></div>
                        <div class="demo-theme-head"></div>
                        <div class="demo-theme-nav"></div>
                    </a> <a href="#" class="demo-theme demo-b-prickly-pear add-tooltip"
                            data-theme="theme-prickly-pear" data-type="b"
                            data-title="(B). Prickly pear">
                        <div class="demo-theme-brand"></div>
                        <div class="demo-theme-head"></div>
                        <div class="demo-theme-nav"></div>
                    </a> <a href="#" class="demo-theme demo-b-dark add-tooltip"
                            data-theme="theme-dark" data-type="b" data-title="(B). Dark">
                        <div class="demo-theme-brand"></div>
                        <div class="demo-theme-head"></div>
                        <div class="demo-theme-nav"></div>
                    </a>
                    </div>
                    <div class="demo-theme-btn">
                        <a href="#" class="demo-theme demo-c-light add-tooltip"
                           data-theme="theme-light" data-type="c" data-title="(C). Light">
                            <div class="demo-theme-brand"></div>
                            <div class="demo-theme-head"></div>
                            <div class="demo-theme-nav"></div>
                        </a> <a href="#" class="demo-theme demo-c-navy add-tooltip"
                                data-theme="theme-navy" data-type="c"
                                data-title="(C). Navy Blue">
                        <div class="demo-theme-brand"></div>
                        <div class="demo-theme-head"></div>
                        <div class="demo-theme-nav"></div>
                    </a> <a href="#" class="demo-theme demo-c-ocean add-tooltip"
                            data-theme="theme-ocean" data-type="c" data-title="(C). Ocean">
                        <div class="demo-theme-brand"></div>
                        <div class="demo-theme-head"></div>
                        <div class="demo-theme-nav"></div>
                    </a> <a href="#" class="demo-theme demo-c-lime add-tooltip"
                            data-theme="theme-lime" data-type="c" data-title="(C). Lime">
                        <div class="demo-theme-brand"></div>
                        <div class="demo-theme-head"></div>
                        <div class="demo-theme-nav"></div>
                    </a> <a href="#" class="demo-theme demo-c-purple add-tooltip"
                            data-theme="theme-purple" data-type="c" data-title="(C). Purple">
                        <div class="demo-theme-brand"></div>
                        <div class="demo-theme-head"></div>
                        <div class="demo-theme-nav"></div>
                    </a> <a href="#" class="demo-theme demo-c-dust add-tooltip"
                            data-theme="theme-dust" data-type="c" data-title="(C). Dust">
                        <div class="demo-theme-brand"></div>
                        <div class="demo-theme-head"></div>
                        <div class="demo-theme-nav"></div>
                    </a> <a href="#" class="demo-theme demo-c-mint add-tooltip"
                            data-theme="theme-mint" data-type="c" data-title="(C). Mint">
                        <div class="demo-theme-brand"></div>
                        <div class="demo-theme-head"></div>
                        <div class="demo-theme-nav"></div>
                    </a> <a href="#" class="demo-theme demo-c-yellow add-tooltip"
                            data-theme="theme-yellow" data-type="c" data-title="(C). Yellow">
                        <div class="demo-theme-brand"></div>
                        <div class="demo-theme-head"></div>
                        <div class="demo-theme-nav"></div>
                    </a> <a href="#" class="demo-theme demo-c-well-red add-tooltip"
                            data-theme="theme-well-red" data-type="c"
                            data-title="(C). Well Red">
                        <div class="demo-theme-brand"></div>
                        <div class="demo-theme-head"></div>
                        <div class="demo-theme-nav"></div>
                    </a> <a href="#" class="demo-theme demo-c-coffee add-tooltip"
                            data-theme="theme-coffee" data-type="c" data-title="(C). Coffee">
                        <div class="demo-theme-brand"></div>
                        <div class="demo-theme-head"></div>
                        <div class="demo-theme-nav"></div>
                    </a> <a href="#" class="demo-theme demo-c-prickly-pear add-tooltip"
                            data-theme="theme-prickly-pear" data-type="c"
                            data-title="(C). Prickly pear">
                        <div class="demo-theme-brand"></div>
                        <div class="demo-theme-head"></div>
                        <div class="demo-theme-nav"></div>
                    </a> <a href="#" class="demo-theme demo-c-dark add-tooltip"
                            data-theme="theme-dark" data-type="c" data-title="(C). Dark">
                        <div class="demo-theme-brand"></div>
                        <div class="demo-theme-head"></div>
                        <div class="demo-theme-nav"></div>
                    </a>
                    </div>
                </div>
            </div>
        </div>
        <div class="pad-all text-left">
            <hr class="hr-sm">
            <p class="demo-set-save-text">* All settings will be saved
                automatically.</p>
            <button id="demo-reset-settings"
                    class="btn btn-primary btn-labeled fa fa-refresh mar-btm">Restore
                Default Settings
            </button>
        </div>
    </div>
    <button id="demo-set-btn" class="btn btn-sm">
        <i class="fa fa-cog fa-2x"></i>
    </button>
</div>
<!--===================================================-->
<!-- END SETTINGS -->


<!--JAVASCRIPT-->
<!--=================================================-->

<jsp:include page="/WEB-INF/view/admin/layout/js.jsp"></jsp:include>

<!--

REQUIRED
You must include this in your project.

RECOMMENDED
This category must be included but you may modify which plugins or components which should be included in your project.

OPTIONAL
Optional plugins. You may choose whether to include it in your project or not.

DEMONSTRATION
This is to be removed, used for demonstration purposes only. This category must not be included in your project.

SAMPLE
Some script samples which explain how to initialize plugins or components. This category should not be included in your project.


Detailed information and more samples can be found in the document.

-->


</body>

<!-- Tieu Long Lanh Kute -->
</html>
<script type="text/javascript">
    function deleteRoles(id) {
        //javaobject
        var data = {};
        data["id"] = id;

        $.ajax({
            url : "/deleteRoles",
            type : "post",
            contentType : "application/json",
            data : JSON.stringify(data),

            dataType : "json",
            success : function(jsonResult) {
                if (jsonResult.statusCode == 200) {
                    alert(jsonResult.data);
                    location.reload();
                } else {
                    alert(jsonResult.data);
                    location.reload();
                }
            },
            error : function(jqXhr, textStatus, errorMessage) { // error callback

            }
        });
    }

</script>
<script>
    $(document).ready(function(){
        $("#myInput").on("keyup", function() {
            var value = $(this).val().toLowerCase();
            $("#myTable tr").filter(function() {
                $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
            });
        });
    });

</script>
