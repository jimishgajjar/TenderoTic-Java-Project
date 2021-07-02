<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%
    response.setHeader("Cache-Control", "no-cache"); //Forces caches to obtain a new copy of the page from the origin server
    response.setHeader("Cache-Control", "no-store"); //Directs caches not to store the page under any circumstance
    response.setDateHeader("Expires", 0); //Causes the proxy cache to see the page as "stale"
    response.setHeader("Pragma", "no-cache"); //HTTP 1.0 backward compatibility

    String TM_id = (String) session.getAttribute("TM_id");

    if (TM_id == null) {
        String site = new String("Front_page.jsp");

        response.setStatus(response.SC_MOVED_TEMPORARILY);
        response.setHeader("Location", site);
    }
%>
<!DOCTYPE HTML>
<html>
    <head>
        <title>TenderoTic - <%=TM_id%></title>
        <link rel="shortcut icon" href="images/logo.png">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta name="keywords" content="Minimal Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
              Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
        <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
        <link href="dashboard_css/bootstrap.min.css" rel='stylesheet' type='text/css' />
        <!-- Custom Theme files -->
        <link href="dashboard_css/style.css" rel='stylesheet' type='text/css' />
        <link href="dashboard_css/font-awesome.css" rel="stylesheet"> 
        <script src="dashboard_js/jquery.min.js"></script>
        <!-- Mainly scripts -->
        <script src="dashboard_js/jquery.metisMenu.js"></script>
        <script src="dashboard_js/jquery.slimscroll.min.js"></script>
        <!-- Custom and plugin javascript -->
        <link href="dashboard_css/custom.css" rel="stylesheet">
        <script src="dashboard_js/custom.js"></script>
        <script src="dashboard_js/screenfull.js"></script>
        <script>
            $(function () {
                $('#supported').text('Supported/allowed: ' + !!screenfull.enabled);

                if (!screenfull.enabled) {
                    return false;
                }
                $('#toggle').click(function () {
                    screenfull.toggle($('#container')[0]);
                });
            });
        </script>
        <!----->        
        <!--  Search Dropdown Script  -->
        <script>
            function myNewFunction(element) {
                var val1 = element.options[element.selectedIndex].text;
                alert(val1);
                if (val1 == "Title") {
                    $("#drop12").hide();
                    $("#drop1").show();
                } else if (val1 == "Category") {
                    $("#drop12").show();
                    $("#drop1").hide();
                } else {
                    $("#drop12").hide();
                    $("#drop1").hide();
                }
            }
        </script>
        <!-- // Search Dropdown Script  -->
        <!-- Slide menu display none -->
        <style>
            #page-wrapper2{  display: none;}
            #mySidenav{  display: none;}
            #drop1{  display: none;}
            #drop12{  display: none;}
            #page-wrapper{margin-left: 0}
        </style>
        <!-- //Slide menu display none -->
    </head>
    <body>
        <%
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost/e-tender", "root", "");
        %>
        <div id="wrapper">
            <!----->
            <nav class="navbar-default navbar-static-top" role="navigation">
                <div class="navbar-header" id="page-wrapper1">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>

                    <input type="checkbox" id="page-wrapper13" class="nav-trigger" />
                    <label for="nav-trigger"></label>
                </div>
                <div class="navbar-header" id="page-wrapper2">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <h1> <a class="navbar-brand"> TenderoTic</a></h1>         
                </div>

                <div class=" border-bottom">
                    <div class="full-left">
                        <section class="full-top" style="padding-left: 20px;">
                            <button id="toggle"><i class="fa fa-arrows-alt"></i></button>	
                        </section>

                        <form class=" navbar-left-right" action="tm_result_search.jsp">
                            <select name="drop_down" class="dropselect" id="drop" onChange="myNewFunction(this);">
                                <option>None</option>
                                <option>Category</option>
                                <option>Title</option>
                            </select>

                            <select name="drop12" id="drop12" class="dropselect">
                                <% PreparedStatement ps_co1 = con.prepareStatement("SELECT * FROM category");
                                    ResultSet rs_co1 = ps_co1.executeQuery();
                                    while (rs_co1.next()) {
                                %>
                                <option ><%=rs_co1.getString("title")%></option>
                                <%}%>
                            </select>

                            <select name="drop1" id="drop1"  class="dropselect">
                                <% PreparedStatement ps_co = con.prepareStatement("SELECT * FROM tender_info where result_dec_date>'2016-10-15' ");
                                    ResultSet rs_co = ps_co.executeQuery();
                                    while (rs_co.next()) {
                                %>
                                <option><%=rs_co.getString("title")%></option>
                                <%}%>
                            </select>
                            <input type="submit" value=""  class="fa fa-search">
                        </form>
                        <div class="clearfix"> </div>
                    </div>

                    <!-- Brand and toggle get grouped for better mobile display -->

                    <!-- Collect the nav links, forms, and other content for toggling -->
                    <div class="drop-men" >
                        <ul class=" nav_1">
                            <li class="dropdown at-drop">
                                <a href="#" class="dropdown-toggle dropdown-at " data-toggle="dropdown"><i class="fa fa-globe"></i> <span class="number">5</span></a>
                                <ul class="dropdown-menu menu1 " role="menu">
                                    <li><a href="#">

                                            <div class="user-new">
                                                <p>Admin Approved Your Tender</p>
                                                <span>40 seconds ago</span>
                                            </div>
                                            <div class="user-new-left">

                                                <i class="fa fa-user-plus"></i>
                                            </div>
                                            <div class="clearfix"> </div>
                                        </a></li>
                                    <li><a href="#">
                                            <div class="user-new">
                                                <p>Someone liked your page</p>
                                                <span>3 minutes ago</span>
                                            </div>
                                            <div class="user-new-left">

                                                <i class="fa fa-heart"></i>
                                            </div>
                                            <div class="clearfix"> </div>
                                        </a></li>
                                    <li><a href="#">
                                            <div class="user-new">
                                                <p>Result declared of xyz tender</p>
                                                <span>4 hours ago</span>
                                            </div>
                                            <div class="user-new-left">

                                                <i class="fa fa-lock"></i>
                                            </div>
                                            <div class="clearfix"> </div>
                                        </a></li>
                                    <li><a href="#">
                                            <div class="user-new">
                                                <p>xyz company posted tender</p>
                                                <span>yesterday at 08:30am</span>
                                            </div>
                                            <div class="user-new-left">

                                                <i class="fa fa-file-text-o"></i>
                                            </div>
                                            <div class="clearfix"> </div>
                                        </a></li>
                                    <li><a href="#">
                                            <div class="user-new">
                                                <p>Today last day to fill tender for xyz company</p>
                                                <span>Last Week</span>
                                            </div>
                                            <div class="user-new-left">

                                                <i class="fa fa-info"></i>
                                            </div>
                                            <div class="clearfix"> </div>
                                        </a></li>
                                    <li><a href="#" class="view">View all messages</a></li>
                                </ul>
                            </li>
                            <li class="dropdown">
                                <%
                                    String path = "profile_pic\\";
                                    String company_name = "";
                                    String person_name = "";
                                    String contact1 = "";
                                    String contact2 = "";
                                    String area = "";
                                    String city_id = "";
                                    String zipcode = "";

                                    PreparedStatement ps = con.prepareStatement("select * from tender_manager_regis_tab where tm_id='" + TM_id + "'");
                                    ResultSet rs = ps.executeQuery();
                                    String imgLen = "";
                                    if (rs.next()) {
                                        imgLen = rs.getString("profilepic_path");
                                        company_name = rs.getString("company_name");
                                        person_name = rs.getString("person_name");
                                        contact1 = rs.getString("contact_no1");
                                        contact2 = rs.getString("contact_no2");
                                        area = rs.getString("area");
                                        city_id = rs.getString("city_id");
                                        zipcode = rs.getString("zip_code");
                                    }

                                    path += imgLen;

                                    String city_name = "";;
                                    ps = con.prepareStatement("select * from city where city_id='" + city_id + "'");
                                    rs = ps.executeQuery();
                                    if (rs.next()) {
                                        city_name = rs.getString("name");
                                    }
                                %>
                                <a href="#" class="dropdown-toggle dropdown-at" data-toggle="dropdown"><span class=" name-caret"><%=TM_id%><i class="caret"></i></span><img src="<%= path%>" height="60" width="60"></a>
                                <ul class="dropdown-menu " role="menu">
                                    <li><a href="tm_profile.jsp"><i class="fa fa-user"></i>Edit Profile</a></li>
                                    <li><a href="tm_change_pass.jsp"><i class="fa fa-lock"></i>Change Password</a></li>
                                    <li><a href="#"><i class="fa fa-calendar"></i>Calender</a></li>
                                    <li><a href="TM_logout"><i class="fa fa-clipboard"></i>Logout</a></li>
                                </ul>
                            </li>

                        </ul>
                    </div><!-- /.navbar-collapse -->
                    <div class="clearfix">

                    </div>

                    <div id="mySidenav">
                        <div class="navbar-default sidebar" role="navigation">
                            <div class="sidebar-nav navbar-collapse">
                                <ul class="nav" id="side-menu">
                                    <li>
                                        <a href="tm_dashboard.jsp" class="hvr-bounce-to-right"><i class="fa fa-dashboard nav_icon "></i><span class="nav-label">Dashboards</span> </a>
                                    </li>
                                    <li>
                                        <a href="#" class=" hvr-bounce-to-right"><i class="fa fa-file-text-o nav_icon"></i> <span class="nav-label">Manage Tender</span><span class="fa arrow"></span></a>
                                        <ul class="nav nav-second-level">
                                            <li><a href="tm__view_tender.jsp" class=" hvr-bounce-to-right"> <i class="fa fa-list nav_icon"></i>View Tender</a></li>
                                            <li><a href="tm_current_tender.jsp" class=" hvr-bounce-to-right"> <i class="fa fa-align-left nav_icon"></i>Current Tender</a></li>
                                            <li><a href="tm_update_tender.jsp" class=" hvr-bounce-to-right"> <i class="fa fa-check-square-o nav_icon"></i>Update Tender</a></li>
                                            <li><a href="tm_delete_tender.jsp" class=" hvr-bounce-to-right"><i class="fa fa-trash-o nav_icon"></i>Delete Tender</a></li>
                                        </ul>
                                    </li>
                                    <li>
                                        <a href="tm_post_tender.jsp" class=" hvr-bounce-to-right"><i class="fa fa-upload nav_icon"></i> <span class="nav-label">Post Tender</span></a>
                                    </li>
                                    <li>
                                        <a href="tm_select_result_tender.jsp" class=" hvr-bounce-to-right"><i  class="fa fa-check-square-o nav_icon"></i> <span class="nav-label">Result</span> </a>
                                    </li>
                                    <li>
                                        <a href="#" class=" hvr-bounce-to-right"><i class="fa fa-history nav_icon"></i> <span class="nav-label" >History</span><span class="fa arrow"></span></a>
                                        <ul class="nav nav-second-level">
                                            <li><a href="tm_tender_history.jsp" class=" hvr-bounce-to-right"> <i class="fa fa-history nav_icon"></i>Tender History</a></li>
                                            <li><a href="tm_view_tenderer.jsp" class=" hvr-bounce-to-right"><i class="fa fa-history nav_icon"></i>Tenderer History</a></li>
                                        </ul> 
                                    </li>                                
                                    <li>
                                        <a href="tm_faq.jsp" class=" hvr-bounce-to-right"><i class="fa fa-question-circle nav_icon"></i> <span class="nav-label">Answer FAQs </span> </a>
                                    </li>
                                    <li>
                                        <a href="tm_feedback.jsp" class=" hvr-bounce-to-right"><i  class="fa fa-comments-o nav_icon"></i> <span class="nav-label">Feedback</span> </a>
                                    </li>                                                               
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </nav>
            <div id="page-wrapper" class="gray-bg dashbard-1">
                <div class="content-main">

                    <!--banner-->	
                    <div class="banner">

                        <h2>
                            <a href="tm_dashboard.jsp">Home</a>
                            <i class="fa fa-angle-right"></i>
                            <span>View Profile</span>
                        </h2>
                    </div>

                    <!-- View Profile -->
                    <div class=" profile">
                        <form action="TM_update_profile" method="post" enctype="multipart/form-data">
                            <div class="profile-bottom">
                                <h3><i class="fa fa-user"></i>Profile</h3>
                                <div class="profile-bottom-top">
                                    <div class="col-md-4 profile-bottom-img">                                       
                                        <div  class="post-file">
                                            <input type="image" class="img-circle img_text" alt="No Image" src="<%= path%>" alt="" height="150" width="150">
                                            <div class="center">Change</div>
                                            <input id="input-1" name="input1[]" type="file" multiple="" class="">
                                        </div>
                                    </div>
                                    <div class="col-md-8 profile-text">
                                        <h6><%= person_name%></h6>
                                        <table>
                                            <tr>
                                                <td>Company Name</td>  
                                                <td> :</td>  
                                                <td><%= company_name%></td>
                                            </tr>

                                            <tr>
                                                <td>Name</td>  
                                                <td> :</td>  
                                                <td><input type="text" name="name" value="<%= person_name%>"></td>
                                            </tr>

                                            <tr>
                                                <td>Mobile No</td>
                                                <td> :</td>
                                                <td><input type="text" name="contact1" value="<%= contact1%>" maxlength="10" minlength="10"></td>
                                            </tr>

                                            <tr>
                                                <td>Contact No</td>
                                                <td> :</td>
                                                <td><input type="text" name="contact2" value="<%= contact2%>" maxlength="10" minlength="10"></td>
                                            </tr>

                                            <tr>
                                                <td>Area</td>
                                                <td>:</td>
                                                <td><input type="text" name="area" value="<%= area%>"></td>
                                            </tr>

                                            <tr>
                                                <td>City</td>
                                                <td>:</td>
                                                <td><select name = "city_name">
                                                        <option><%= city_name%></option>
                                                        <%
                                                            ps = con.prepareStatement("select * from city");
                                                            rs = ps.executeQuery();
                                                            while (rs.next()) {%>                                                    
                                                        <option><%= rs.getString("name")%></option>
                                                        <% }%>
                                                    </select></td>
                                            </tr>

                                            <tr>
                                                <td>Zip Code</td>
                                                <td>:</td>
                                                <td><input type="text" name="zipcode" value="<%= zipcode%>" maxlength="6"></td>
                                            </tr>
                                        </table>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="profile-bottom-bottom">
                                    <div class="col-md-4 profile-fo">
                                        <input type="submit" class="bttn" value="Save Changes">
                                    </div>
                                    <div class="col-md-4 profile-fo">
                                        <a href="tm_change_pass.jsp" class="pro1"><i class="fa fa-key"></i>Change Password</a>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                            </div>
                        </form>
                    </div>
                    <!-- // View Profile -->

                    <div class="copy">
                        <p> &copy; 2016 TenderoTic. All Rights Reserved </p>
                    </div>
                </div>
                <div class="clearfix"> </div>
            </div>
        </div>
        <!---->
        <!--scrolling js-->
        <script src="dashboard_js/jquery.nicescroll.js"></script>
        <script src="dashboard_js/scripts.js"></script>
        <!--//scrolling js-->
        <script src="dashboard_js/bootstrap.min.js"></script>

        <!-- Side Menu -->
        <script>
                                var temp = 0;
                                var val = document.getElementById("page-wrapper");
                                $(document).ready(function () {
                                    $("#page-wrapper1").click(function () {
                                        $("#page-wrapper1").fadeOut(500);
                                        $("#mySidenav").fadeIn(1000);
                                        $("#page-wrapper2").fadeIn(1000);
                                        document.getElementById("mySidenav").style.width = "250px";
                                        document.getElementById("page-wrapper").style.marginLeft = "250px";
                                        document.getElementById("chart").style.width = "650px";
                                        document.getElementById("graph-lines").style.width = "100px";
                                        var val = 0;
                                    });
                                    $("#page-wrapper2").click(function () {
                                        $("#page-wrapper2").fadeOut(1000);
                                        $("#mySidenav").fadeOut(1000);
                                        $("#page-wrapper1").fadeIn(1000);
                                        document.getElementById("mySidenav").style.width = "0";
                                        document.getElementById("page-wrapper").style.marginLeft = "0";
                                        temp = 1;
                                    });
                                });
        </script>
        <!-- //Side Menu -->
    </body>
</html>
