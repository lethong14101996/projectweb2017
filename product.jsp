<%-- 
    Document   : product
    Created on : May 20, 2017, 9:56:46 AM
    Author     : nguyenminhtri
--%>

<%@page import="java.sql.Connection"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="bean.myproduct"%>
<%@page import="db.DatabaseConnection"%>
<%@page import="repository.ProductRepositoty"%>
<%@page import="model.Product"%>
<%@page import="java.util.List"%>
<%@page import="model.UserRole"%>
<%@page import="model.UserSessionHolder"%>
<%@page import="util.Settings"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.ResourceBundle"%>
<%@page import="repository.AccountRepository"%>
<%@page import="repository.ProductRepositoty"%>
<%@page import="model.Order"%>
<%@page import="dao.OrderDAO"%>
<%@page import="model.Product"%>
<%@page import="java.util.List"%>
<%@page import="dao.BaseDAO"%>
<%@page import="model.Account"%>
<%@page import="model.UserRole"%>
<%@page import="model.UserSessionHolder"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="util.Settings"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>

<%
    Map<String, String> map = (HashMap<String, String>) Settings.getSessionAttribute(request, "languageCode");
    UserSessionHolder ush = Settings.getCurrentUserSession(request);

    List<Product> products = ProductRepositoty.getAllProduct();
    String cartSettings = "href=\"login.jsp\"";

    if (map == null) {
        request.getRequestDispatcher("language?lang=vi").forward(request, response);
    } else {
%>

<html>
    <head>
        <title>Big shope A Ecommerce Category Flat Bootstarp Resposive Website Template | Product :: w3layouts</title>
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
        <!--theme-style-->
        <link href="css/style.css" rel="stylesheet" type="text/css" media="all" />	
        <!--//theme-style-->
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
        <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
        <!--fonts-->
        <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700,800' rel='stylesheet' type='text/css'>
        <!--//fonts-->
        <script src="js/jquery.min.js"></script>
        <script src="js/jquery-ui.js"></script>


        <!--script-->
    </head>
    <body> 
        <% DatabaseConnection db = new DatabaseConnection();
            Connection con = db.setConnection();%>
        <%
            ArrayList<myproduct> list = (ArrayList<myproduct>) session.getAttribute("product");
        %>
        <%
            ArrayList<String> name = new ArrayList<String>();

            con = db.setConnection();

            String sql1 = "Select name from pro.myproduct";
            ResultSet rs1 = db.getResult(sql1, con);
            int i = 0;
            while (rs1.next()) {
                name.add(rs1.getString("name"));
            }
            rs1.close();
            System.out.println(i);

        %>
        <!--header-->
        <div class="header">
            <div class="top-header">
                <div class="container">
                    <div class="top-header-left">
                        <ul class="support">
                            <li><a href="error.jsp"><label> </label></a></li>
                            <li><a href="error.jsp"><%=map.get("live_support")%><span class="live"></span></a>

                            </li>
                        </ul>
                        <ul class="support">
                            <li class="van"><a href="error.jsp"><label> </label></a></li>
                            <li><a href="error.jsp"><%=map.get("shipping")%><span class="live"></span></a></li>
                        </ul>
                    </div>
                    <div class="top-header-right">
                        <ul class="support">
                            <li><a href="language?lang=vi">Tiếng Việt</a><a href="#">|</a> 
                            <li><a href="language?lang=en">English</a>
                        </ul>        
                    </div>
                </div>
                <!---->
                <div class="clearfix"> </div>	
            </div>
            <div class="clearfix"> </div>		
        </div>
    </div>
    <div class="bottom-header">
        <div class="container">
            <div class="col-sm-3 header-bottom-left">
                <div class="logo">
                    <a href="index.jsp">E-<span>COMMERCE</span></a>
                </div>
                <div class="search">
                    <form method="GET" id="form-search" action="controller">
                        <div>
                            <input type="text" id="autocomplete" name="keyword" placeholder=""/>
                            <input type="hidden" name="action" value="search"/>
                            <input type="submit" id="searchsubmit" value=" " name="Search"/>
                        </div>
                    </form>
                    <script>
                        $('#autocomplete').autocomplete({
                            source: [
                        <%
                            for (int j = 0; j < name.size(); ++j) {
                        %>
                                "<%=name.get(j)%>",
                        <% } %>
                            ]

                        });
                    </script>
                </div>
                <div class="clearfix"> </div>
            </div>

            <div class="col-sm-6 header-bottom-right">	

                <% if (ush.getAccrole() == UserRole.GUEST) {%>
                <div class="account"><a href="login.jsp"><span></span><%=map.get("my_account")%></a></div>
                <ul class="login">
                    <li><a href="login.jsp"><span> </span><%=map.get("login")%> </a></li>
                    <li><a data-toggle="modal" data-target="#registerModal">| <%=map.get("reg")%></a></li>
                </ul>
                <% } else {
                    String settings = "";
                    if (ush.getAccrole().equals(UserRole.ADMINISTRATOR)) {
                        settings = "admin.jsp";
                        cartSettings = "data-toggle=\"modal\" data-target=\"#myModal\"";
                    } else if (ush.getAccrole().equals(UserRole.CUSTOMER)) {
                        settings = "account.jsp";
                        cartSettings = "data-toggle=\"modal\" data-target=\"#myModal\"";
                    } else if (ush.getAccrole().equals(UserRole.STAFF)) {
                        settings = "staff.jsp";
                        cartSettings = "data-toggle=\"modal\" data-target=\"#myModal\"";
                    }

                %>
                <div class="account"><a href="#"><span></span><%=map.get("account.welcome")%><%=ush.getAccname()%></a></div>
                <ul class="login">
                    <li><a href="<%=settings%>"><span> </span><%=map.get("account.setting")%> </a></li> 
                    <li><a href="logout">| <%=map.get("logout")%> </a></li>
                </ul>
                <%}%>

                <div class="cart"><a href="controller?action=checkout"><span> </span><%=map.get("cart")%></a></div>
                <div class="clearfix"> </div>
            </div>

            <div class="clearfix"> </div>	
        </div>
    </div>
    </div>
    <!---->
    <!-- start content -->

    <div class="container">

        <div class="women-product">
            <div class=" w_content">
                <!--                    <div class="women">
                                        <a href="#"><h4>Enthecwear - <span>4449 itemms</span> </h4></a>
                                        <ul class="w_nav">
                                            <li>Sort : </li>
                                            <li><a class="active" href="#">popular</a></li> |
                                            <li><a href="#">new </a></li> |
                                            <li><a href="#">discount</a></li> |
                                            <li><a href="#">price: Low High </a></li> 
                                            <div class="clearfix"> </div>	
                                        </ul>
                -->                        <div class="clearfix"> </div>	<!--
                                    </div>-->
            </div>
            <!-- grids_of_4 -->
            <div class="grid-product">


                <% for (int j = 0; j < list.size(); ++j) {

                        myproduct temp = list.get(j);
                        String sql = "select url from pro.url where ID_product = '" + temp.getID_product() + "'";
                        ResultSet rs = db.getResult(sql, con);

                        String[] url = new String[5];
                        int l = 0;
                        while (rs.next()) {
                            url[l] = rs.getString("url");
                            ++l;
                        }

                %>
                <div class="  product-grid" style="height:285px; width:210px  " >
                    <!--Choose 1 picture input in single page-->
                    <div class="content_box"><a href="controller?action=productDetail&id=<%=temp.getID_product()%>">
                            
                            <div class="left-grid-view grid-view-left">
                                <img src="<%=url[0]%>"  class="img-responsive watch-center" alt=""/>
                                <div class="mask">
                                    <div class="info">Quick View</div>
                                </div>
                        </a>
                    </div>
                    <h3><a href="controller?action=productDetail&id=<%=temp.getID_product()%>"><%=temp.getName()%></a></h3>
                    
                    <p><%= temp.getPrice() %> $ </p>
                    

                </div>
            </div>
            <% }%>

        </div>
        <div class="clearfix"> </div>
    </div>

    <div class="sub-cate">
        <div class=" top-nav rsidebar span_1_of_left">
            <h3 class="cate">DANH MỤC SẢN PHẨM</h3>
            <ul class="menu">

                <li class="item1"><a href="#">Điện tử<img class="arrow-img" src="images/arrow1.png" alt=""/> </a>
                    <ul class="cute">
                        <li class="subitem1"><a href="product.html">Điện thoại</a></li>
                        <li class="subitem2"><a href="product.html">Máy tính bảng </a></li>
                        <li class="subitem3"><a href="product.html">Ti vi </a></li>
                        <li class="subitem4"><a href="product.html">Máy ảnh </a></li>
                    </ul>
                </li>
                <li class="item2"><a href="#">Quần áo<img class="arrow-img " src="images/arrow1.png" alt=""/></a>
                    <ul class="cute">
                        <li class="subitem1"><a href="product.html">Quần áo nam </a></li>
                        <li class="subitem2"><a href="product.html">Quần áo nữ</a></li>
                        <li class="subitem3"><a href="product.html">Quần áo trẻ em </a></li>
                    </ul>
                </li>
                <li class="item2"><a href="#">Phụ kiện<img class="arrow-img " src="images/arrow1.png" alt=""/></a>
                    <ul class="cute">
                        <li class="subitem1"><a href="product.html">Túi xách </a></li>
                        <li class="subitem2"><a href="product.html">Mắt kính </a></li>
                        <li class="subitem3"><a href="product.html">nón</a></li>
                        <li class="subitem4"><a href="product.html">Giày, dép</a></li>
                    </ul>
                </li>
                <li class="item2"><a href="#">Sinh hoạt<img class="arrow-img " src="images/arrow1.png" alt=""/></a>
                    <ul class="cute">
                        <li class="subitem1"><a href="product.html">Dụng cụ nấu ăn </a></li>
                        <li class="subitem2"><a href="product.html">Dụng cụ vệ sinh </a></li>
                        <li class="subitem3"><a href="product.html">Sản phẩm giặt giũ</a></li>
                        <li class="subitem4"><a href="product.html">Dụng cụ phòng tắm</a></li>
                        <li class="subitem5"><a href="product.html">Dụng cụ làm vườn</a></li>
                        <li class="subitem6"><a href="product.html">Dụng cụ trang trí</a></li>




                    </ul>
                </li>
                <li class="item2"><a href="#">Dân dụng<img class="arrow-img " src="images/arrow1.png" alt=""/></a>
                    <ul class="cute">
                        <li class="subitem1"><a href="product.html">Bản ủi</a></li>
                        <li class="subitem2"><a href="product.html">Tủ lạnh</a></li>
                        <li class="subitem3"><a href="product.html">Máy giặt</a></li>
                        <li class="subitem4"><a href="product.html">Máy quạt</a></li>
                        <li class="subitem5"><a href="product.html">Máy lạnh</a></li>
                        <li class="subitem6"><a href="product.html">Máy nước nóng</a></li>




                    </ul>
                </li>

                <li class="item2"><a href="#">Nội thất<img class="arrow-img " src="images/arrow1.png" alt=""/></a>
                    <ul class="cute">
                        <li class="subitem1"><a href="product.html">Phòng ngủ</a></li>
                        <li class="subitem2"><a href="product.html">Phòng khách</a></li>
                        <li class="subitem3"><a href="product.html">Phòng ăn</a></li>
                        <li class="subitem4"><a href="product.html">Phòng làm việc</a></li>
                        <li class="subitem5"><a href="product.html">Phòng tắm</a></li>
                        <li class="subitem6"><a href="product.html">Hành lang</a></li>




                    </ul>
                </li>

                <li class="item2"><a href="#">Sắc đẹp<img class="arrow-img " src="images/arrow1.png" alt=""/></a>
                    <ul class="cute">
                        <li class="subitem1"><a href="product.html">Thực phẩm chức năng</a></li>
                        <li class="subitem2"><a href="product.html">Mỹ phẩm</a></li>
                        <li class="subitem3"><a href="product.html">Dụng cụ trang điểm</a></li>
                        <!--                    <li class="subitem4"><a href="product.html">Phòng làm việc</a></li>
                                            <li class="subitem5"><a href="product.html">Phòng tắm</a></li>
                                                <li class="subitem6"><a href="product.html">Hành lang</a></li>-->




                    </ul>
                </li>

                <li class="item2"><a href="#">Thực phẩm<img class="arrow-img " src="images/arrow1.png" alt=""/></a>
                    <ul class="cute">
                        <li class="subitem1"><a href="product.html">Thưc phẩm tươi sống</a></li>
                        <li class="subitem2"><a href="product.html">Thực phẩm đóng hộp</a></li>





                    </ul>
                </li>

                <li class="item2"><a href="#">Du lịch<img class="arrow-img " src="images/arrow1.png" alt=""/></a>
                    <ul class="cute">
                        <li class="subitem1"><a href="product.html">Vali</a></li>
                        <li class="subitem2"><a href="product.html">Ba lô</a></li>
                        <li class="subitem3"><a href="product.html">Lều, thãm trải</a></li>
                        <!--                    <li class="subitem4"><a href="product.html">Phòng làm việc</a></li>
                                            <li class="subitem5"><a href="product.html">Phòng tắm</a></li>
                                                <li class="subitem6"><a href="product.html">Hành lang</a></li>-->




                    </ul>
                </li>

                <li class="item2"><a href="#">Thể thao<img class="arrow-img " src="images/arrow1.png" alt=""/></a>
                    <ul class="cute">
                        <li class="subitem1"><a href="product.html">Bóng đá</a></li>
                        <li class="subitem2"><a href="product.html">Bóng bàn</a></li>
                        <li class="subitem3"><a href="product.html">Cầu lông</a></li>
                        <li class="subitem4"><a href="product.html">Quần vợt</a></li>
                        <li class="subitem5"><a href="product.html">Mạo hiểm</a></li>
                        <li class="subitem6"><a href="product.html">Bơi lội</a></li>




                    </ul>
                </li>



            </ul>
        </div>
        <!--initiate accordion-->
        <script type="text/javascript">
            $(function () {
                var menu_ul = $('.menu > li > ul'),
                        menu_a = $('.menu > li > a');
                menu_ul.hide();
                menu_a.click(function (e) {
                    e.preventDefault();
                    if (!$(this).hasClass('active')) {
                        menu_a.removeClass('active');
                        menu_ul.filter(':visible').slideUp('normal');
                        $(this).addClass('active').next().stop(true, true).slideDown('normal');
                    } else {
                        $(this).removeClass('active');
                        $(this).next().stop(true, true).slideUp('normal');
                    }
                });

            });
        </script>
        <div class=" chain-grid menu-chain">
            <a href="single.html"><img class="img-responsive chain" src="images/wat.jpg" alt=" " /></a>	   		     		
            <div class="grid-chain-bottom chain-watch">
                <span class="actual dolor-left-grid">300$</span>
                <span class="reducedfrom">500$</span>  
                <h6>Lorem ipsum dolor</h6>  		     			   		     										
            </div>
        </div>

    </div>
    <div class="clearfix"> </div>
</div>
<!---->
<div class="footer">
    <div class="footer-top">
        <div class="container">
            <div class="latter">


                <div class="clearfix"> </div>
            </div>

            <div class="clearfix"> </div>
        </div>
    </div>
    <div class="footer-bottom">
        <div class="container">
            <div class="foo-grids">
                <div class="col-md-3 footer-grid">
                    <h4 class="footer-head">GIỚI THIỆU</h4>
                    <p> Chúng tôi là tập đoàn mua bán trực tuyến qua mạng internet với quy mô toàn cầu. Chất lượng và niềm tin của khác hàng là điều thiết yếu.</p><p>Mục đích của tập đoàn cung cấp dịch vụ mua sắm trực tuyến một cách nhanh chóng và tiện lợi cho khách hàng.</p>
                </div>

                <div class="col-md-3 footer-grid">
                    <h4 class="footer-head">TRỢ GIÚP</h4>
                    <ul>

                        <li><a href="error.jsp"><p> Cách sử dụng</p></a></li>
                        <li><a href="error.jsp"><p> Điều khiển</p></a></li>
                        <li><a href="error.jsp"><p> FAQ</p></a></li>
                        <li><a href="error.jspl">Phản hồi</a></li>
                        <li><a href="error.jsp"><p> Liên lạc</p></a></li>
                        <li><a href="error.jsp"><p> Code</p></a></li>

                    </ul>
                </div>

                <div class="col-md-3 footer-grid">
                    <h4 class="footer-head">THÔNG TIN</h4>
                    <ul>

                        <li><a href="error.jsp"><p>Vị trí</p></a></li>
                        <li><a href="error.jsp"><p> Điềukhoản sử dụng</p></a></li>
                        <li><a href="error.jsp"><p> Tìm kiếm phổ biến</p></a></li>

                        <li><a href="error.jsp"><p> Chính sách bảo mật</p></a></li>


                    </ul>
                </div>

                <div class="col-md-3 footer-grid">
                    <h4 class="footer-head">LIÊN HỆ</h4>
                    <span class="hq">Trụ sở chính</span>

                    <ul class="location">
                        <li><span class="glyphicon glyphicon-map-marker"></span></li>
                        <li><a href="error.jsp">Trung tâm nhân sự</a></li>
                        <div class="clearfix"></div>
                    </ul>	
                    <ul class="location">
                        <li><span class="glyphicon glyphicon-earphone"></span></li>
                        <li><a href="error.jsp">+0 561 111 235</a></li>
                        <div class="clearfix"></div>
                    </ul>	
                    <ul class="location">
                        <li><span class="glyphicon glyphicon-envelope"></span></li>
                        <li><a href="error.jsp">ecommerce@hcmiu.edu.vn.com</a></li>
                        <div class="clearfix"></div>
                    </ul>						
                </div>					
            </div>

            <div class="clearfix"> </div>
        </div>
    </div>

</body>
</html>
<%}%>