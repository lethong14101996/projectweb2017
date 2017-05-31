/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import bean.myproduct;
import bean.order;
import bean.shoppingcart1;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import dao.*;
import java.io.File;
import java.sql.ResultSet;
import java.util.Hashtable;
import java.util.Iterator;
import java.util.List;
import javax.servlet.http.HttpSession;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 *
 * @author trung
 */
@WebServlet(name = "controller", urlPatterns = {"/controller"})
public class controller extends HttpServlet {

    private Object session;

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            String action = request.getParameter("action");
            if (action.equals("1")) {
                DAO dao = new DAO();
                ArrayList<myproduct> product = dao.getProduct(1);
                session.setAttribute("product", product);
                dispatcher(request, response, "product.jsp");
            }
            if (action.equals("2")) {
                DAO dao = new DAO();
                ArrayList<myproduct> product = dao.getProduct(2);
                session.setAttribute("product", product);
                dispatcher(request, response, "product.jsp");
            }

            if (action.equals("3")) {
                DAO dao = new DAO();
                ArrayList<myproduct> product = dao.getProduct(3);
                session.setAttribute("product", product);
                dispatcher(request, response, "product.jsp");
            }

            if (action.equals("productDetail")) {
                int id = Integer.parseInt(request.getParameter("id"));
                DAO detail = new DAO();
                myproduct productDetail = detail.productDetail(id);
                session.setAttribute("productdetail", productDetail);
                dispatcher(request, response, "single.jsp");
            }
            if (action.equals("AddtoCart")) {
                System.out.println("Add to Cart");
                shoppingcart1 cart = (shoppingcart1) session.getAttribute("cart");
                if (cart == null) {
                    System.out.println("cart: " + null);
                    cart = new shoppingcart1();
                }

                System.out.println("product " + session.getAttribute("productdetail"));

                myproduct temp = (myproduct) session.getAttribute("productdetail");

                int quantity = Integer.parseInt(request.getParameter("quantity"));

                cart.addProduct(temp, quantity);
                System.out.println("cart total " + cart.getTotal());
                session.setAttribute("cart", cart);
                dispatcher(request, response, "single.jsp");
            }
            if (action.equals("checkout")) {
                System.out.println(action);
                shoppingcart1 cart = (shoppingcart1) session.getAttribute("cart");
                if (cart == null) {
                    cart = new shoppingcart1();
                }
                session.setAttribute("cart", cart);
                dispatcher(request, response, "checkout.jsp");
            }
            if (action.equals("delete")) {
                int id = Integer.parseInt(request.getParameter("id"));
                System.out.println(action + " " + id);
                shoppingcart1 cart = (shoppingcart1) session.getAttribute("cart");
                cart.deleteProduct(id);
                session.setAttribute("cart", cart);
                dispatcher(request, response, "checkout.jsp");
            }

            if (action.equals("order")) { // order san pham
                shoppingcart1 cart = (shoppingcart1) session.getAttribute("cart");
                String accid = (String) session.getAttribute("login");
                DAO dao = new DAO();
                dao.order(cart, accid);
                session.removeAttribute("cart");
                response.sendRedirect("index.jsp");

            }
            if (action.equals("orderDetail")) { // lay detail theo ID_order
                String id = request.getParameter("ID_order");
                DAO dao = new DAO();
                order ans = dao.getOrder(id);
                session.setAttribute("order", ans);
                response.sendRedirect("orderdetail.jsp");
            }
            if (action.equals("getdetail")) { // lay list order trong thang do nam do
                System.out.println(request.getParameter("month"));
                System.out.println(request.getParameter("year"));
                DAO dao = new DAO();
                ArrayList<order> order = dao.getOrder1(Integer.parseInt(request.getParameter("month")), Integer.parseInt(request.getParameter("year")));
                session.setAttribute("orderList", order);
                response.sendRedirect("statistic.jsp");
            }
            if (action.equals("search")) {
                System.out.println(request.getParameter("keyword"));
                DAO dao = new DAO();
                ArrayList<myproduct> product = dao.getProductSearch(request.getParameter("keyword"));
                session.setAttribute("product", product);
                dispatcher(request, response, "product.jsp");
            }

            if (action.equals("Upload")) {

                String dirNames = "C:/Users/MINH QUAN/Desktop/ECommerceProject/web/Database";

                //User newUser = (User) session.getAttribute("user");
                String user = (String) session.getAttribute("login"); // acccID ADmin

                String fileName = null;
                boolean isMultiPArt = ServletFileUpload.isMultipartContent(request);

                if (isMultiPArt) {
                    FileItemFactory factory = new DiskFileItemFactory();
                    ServletFileUpload upload = new ServletFileUpload(factory);
                    List items = null;
                    try {
                        items = upload.parseRequest(request);
                    } catch (FileUploadException e) {
                        e.printStackTrace();
                    }
                    Iterator iter = items.iterator();
                    Hashtable params = new Hashtable();

                    File theDir = new File(dirNames + File.separator + user);

                    // if the directory does not exist, create it
                    if (!theDir.exists()) {
                        System.out.println("creating directory: " + user);
                        boolean result = false;

                        try {
                            theDir.mkdir();
                            result = true;
                        } catch (SecurityException se) {
                            //handle it
                        }
                        if (result) {
                            System.out.println("DIR created");
                        }
                    }
                    String[] url = new String[5];
                    int cnt = 0;
                    while (iter.hasNext()) {
                        FileItem item = (FileItem) iter.next();
                        if (item.isFormField()) {
                            params.put(item.getFieldName(), item.getString()); // text
                        } else { // pictures
                            try {
                                String itemName = item.getName();
                                fileName = itemName.substring(itemName.lastIndexOf("\\") + 1);
                                System.out.println("path: " + fileName);
                                String realPath = dirNames + File.separator + user + File.separator + fileName;
                                System.out.println("realPath: " + realPath);
                                File savedFile = new File(realPath); // luu vo server
                                item.write(savedFile);
                                url[cnt] = "./Database" + File.separator + user + File.separator + fileName; //Database
                                ++cnt;
                            } catch (Exception e) {
                                e.printStackTrace();
                            }
                        }
                    }
                    System.out.println("url " + cnt);

                    
                    
//                        newUser = new User();
//                        newUser.setEmail(Email);
                    out.print(url[0]);
                    String temp = ".\\User" + File.separator + user + File.separator + fileName;
                    System.out.println("Temp " + temp);

                    String name = (String)params.get("name");
                    String description = (String)params.get("description");
                    String price = (String)params.get("price");
                    String ID_category = (String)params.get("category");
                    String ID_supplier = (String)params.get("supplier");
                    System.out.println(name + " " + price + " " + description + " " + ID_category + " " + ID_supplier);
                    String ID_status = "1";
                    
                    DAO dao = new DAO();
                    dao.uploadProduct(name, description, price, ID_supplier, ID_status, ID_category, url);
                    //Connector.editUser(myProfile.getEmail(), newUser);
                    //response.sendRedirect("index.jsp");
                    dispatcher(request, response, "index.jsp");

                }
            }

        }
    }

    public void dispatcher(HttpServletRequest request, HttpServletResponse response, String page) throws ServletException, IOException {
        RequestDispatcher rd = request.getRequestDispatcher(page);
        rd.forward(request, response);

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
