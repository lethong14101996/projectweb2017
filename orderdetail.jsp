<%@page import="bean.order"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="bean.myproduct"%>
<%@page import="java.util.ArrayList"%>
<%@page import="bean.shoppingcart1"%>
<%@page import="java.sql.Connection"%>
<%@page import="db.DatabaseConnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!--A Design by W3layouts 
Author: W3layout
Author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->
<!DOCTYPE html>
<html>
    <head>
        <title>New Store A Ecommerce Category Flat Bootstarp Resposive Website Template | Checkout :: w3layouts</title>
        <link href="css/bootstrap_2.css" rel="stylesheet" type="text/css" media="all" />
        <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
        <script src="js/jquery.min_2.js"></script>
        <!-- Custom Theme files -->
        <!--theme-style-->
        <link href="css/style_2.css" rel="stylesheet" type="text/css" media="all" />	
        <link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
        <!--//theme-style-->
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta name="keywords" content="New Store Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template, 
              Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
        <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
        <!--fonts-->
        <link href='http://fonts.googleapis.com/css?family=Lato:100,300,400,700,900' rel='stylesheet' type='text/css'>
        <link href='http://fonts.googleapis.com/css?family=Roboto:400,100,300,500,700,900' rel='stylesheet' type='text/css'><!--//fonts-->
        <!-- start menu -->
        <link href="css/memenu.css" rel="stylesheet" type="text/css" media="all" />
        <script type="text/javascript" src="js/memenu.js"></script>
        <script>$(document).ready(function () {
                $(".memenu").memenu();
            });</script>
        <script src="js/simpleCart.min.js"></script>
    </head>
    <body>

        <% DatabaseConnection db = new DatabaseConnection();
            Connection con = db.setConnection();%>
        <%
            order temp = (order) session.getAttribute("order");
        %>

        <!--header-->
        <div class="header">
             <div class="top-header">
                <div class="container">
                    <div class="top-header-left">
                        <ul class="support">
                            <li><a href="#"><label> </label></a></li>
                            <li><a href="#">24x7 Dịch vụ hỗ trợ trực tuyến<span class="live"> support</span></a></li>
                        </ul>
                        <ul class="support">
                            <li class="van"><a href="#"><label> </label></a></li>
                            <li><a href="#">Miên phí <span class="live">cho hóa đơn trên 500k</span></a></li>
                        </ul>
                        <div class="clearfix"> </div>
                    </div>
<!--                    <div class="top-header-right">
                        <div class="down-top">		
                            <select class="in-drop">
                                <option value="English" class="in-of">English</option>
                                <option value="Japanese" class="in-of">Japanese</option>
                                <option value="French" class="in-of">French</option>
                                <option value="German" class="in-of">German</option>
                            </select>
                        </div>
                        <div class="down-top top-down">
                            <select class="in-drop">

                                <option value="Dollar" class="in-of">Dollar</option>
                                <option value="Yen" class="in-of">Yen</option>
                                <option value="Euro" class="in-of">Euro</option>
                            </select>
                        </div>
                        <div class="clearfix"> </div>	
-->                    </div>
                    <div class="clearfix"> </div>		
                </div>
            <div class="bottom-header">
                <div class="container">
                    <div class="header-bottom-left">
                        <div class="logo">
                    <a href="index.jsp">E-<span>COMMERCE</span></a>
                </div>
                        <div class="search">
                            <input type="text" value="" onfocus="this.value = '';" onblur="if (this.value == '') {
                                        this.value = '';
                                    }" >
                            <input type="submit"  value="SEARCH">

                        </div>
                        <div class="clearfix"> </div>
                    </div>
                    <div class="header-bottom-right">					
<!--                        <div class="account"><a href="login.html"><span> </span>YOUR ACCOUNT</a></div>
                        <ul class="login">
                            <li><a href="login.html"><span> </span>LOGIN</a></li> |
                            <li ><a href="register.html">SIGNUP</a></li>
                        </ul>-->
                        <div class="cart"><a href="#"><span> </span>CART</a></div>
                        <div class="clearfix"> </div>
                    </div>
                    <div class="clearfix"> </div>	
                </div>
            </div>
        


        <div class="container">
            <div class="check">	 
                <h1>My Shopping Bag (<%=temp.getTotalPrice()%>)</h1>




                <div class="col-md-9 cart-items">
                    <%
                        ArrayList<myproduct> list = temp.getList();
                        for (int i = 0; i < list.size(); ++i) {
                            myproduct temp1 = list.get(i);
                            String sql = "select url from pro.url where ID_product = '" + temp1.getID_product() + "'";
                            ResultSet rs = db.getResult(sql, con);

                            String[] url = new String[5];
                            int j = 0;
                            while (rs.next()) {
                                url[j] = rs.getString("url");
                                ++j;
                            }

                    %>
                    <script>$(document).ready(function (c) {
                            $('.close1').on('click', function (c) {
                                $('.cart-header').fadeOut('slow', function (c) {
                                    $('.cart-header').remove();
                                });
                            });
                        });
                    </script>
                    <div class="cart-header">
                        <div class="close1"> </div>
                        <div class="cart-sec simpleCart_shelfItem">
                            <div class="cart-item cyc">
                                <img src="<%=url[0]%>" class="img-responsive" alt=""/>
                            </div>
                            <div class="cart-item-info">
                                <h3><a href="#"><%=temp1.getName()%></a><span>Model No: 3578</span></h3>
                                <ul class="qty">
                                    <li><p>Size : 5</p></li>
                                    <li><p><%=temp1.getQuantity()%></p></li>
                                </ul>

                                <div class="delivery">
                                    <p>Service Charges : <%=temp1.getPrice()*temp1.getQuantity()%></p>
                                    <span>Delivered in 2-3 bussiness days</span>
                                    <div class="clearfix"></div>
                                </div>	
                            </div>
                            <div class="clearfix"></div>

                        </div>
                    </div>
                    <%}%>
                    
                    <script>$(document).ready(function (c) {
                            $('.close1').on('click', function (c) {
                                $('.cart-header').fadeOut('slow', function (c) {
                                    $('.cart-header').remove();
                                });
                            });
                        });
                    </script>
                    <div class="cart-header">
                        <div class="close1"> </div>
                        
                    </div>
                    <script>$(document).ready(function (c) {
                            $('.close2').on('click', function (c) {
                                $('.cart-header2').fadeOut('slow', function (c) {
                                    $('.cart-header2').remove();
                                });
                            });
                        });
                    </script>
                    <div class="cart-header2">
                        <div class="close2"> </div>
                       
                    </div>		
                </div>
                <div class="col-md-3 cart-total">
                    <a class="continue" href="#">Continue to basket</a>
                    <div class="price-details">
                        <h3>Price Details</h3>
                        <span>Total</span>
                        <span class="total1">6200.00</span>
                        <span>Discount</span>
                        <span class="total1">---</span>
                        <span>Delivery Charges</span>
                        <span class="total1">150.00</span>
                        <div class="clearfix"></div>				 
                    </div>	
                    <ul class="total_price">
                        <li class="last_price"> <h4>TOTAL</h4></li>	
                        <li class="last_price"><span></span></li>
                        <div class="clearfix"> </div>
                    </ul>


                    <div class="clearfix"></div>
                    <a class="order" href="controller?action=order">Place Order</a>
                    <div class="total-item">
                        <h3>OPTIONS</h3>
                        <h4>COUPONS</h4>
                        <a class="cpns" href="#">Apply Coupons</a>
                        <p><a href="#">Log In</a> to use accounts - linked coupons</p>
                    </div>
                </div>

                <div class="clearfix"> </div>
            </div>
        </div>


        <!--//content-->
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