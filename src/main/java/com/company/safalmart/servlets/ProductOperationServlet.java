
package com.company.safalmart.servlets;

import com.company.safalmart.dao.CategoryDao;
import com.company.safalmart.dao.ProductDao;
import com.company.safalmart.entities.Category;
import com.company.safalmart.entities.Product;
import com.company.safalmart.helper.FactoryProvider;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
@MultipartConfig
public class ProductOperationServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            try {
                
                String op=request.getParameter("operation");
                
                if (op.trim().equals("add_category")) {
                    
                    String cTitle=request.getParameter("category_title");
                    String cDesc=request.getParameter("category_description");
                    
                    Category category = new Category();
                    category.setcTitle(cTitle);
                    category.setcDesc(cDesc);
                    
                    CategoryDao categoryDao = new CategoryDao(FactoryProvider.getFactory());
                    int categoryId=categoryDao.saveCategory(category);
                    HttpSession httpSession = request.getSession();
                    httpSession.setAttribute("message", "Category added sucessfully !!! Category Id :: "+categoryId);
                    response.sendRedirect("admin.jsp");
                    return;
                    
                }else if (op.trim().equals("add_product")) {
                    
                    String pName=request.getParameter("product_name");
                    String pDesc=request.getParameter("product_description");
                    int pPrice=Integer.parseInt(request.getParameter("product_price"));
                    int pDisc=Integer.parseInt(request.getParameter("product_discount"));
                    int pQuantity=Integer.parseInt(request.getParameter("product_quantity"));
                    int cId=Integer.parseInt(request.getParameter("category_Id"));
                    Part part=request.getPart("product_photo");
                    
                    Product p = new Product();
                    p.setpName(pName);
                    p.setpDesc(pDesc);
                    p.setpPrice(pPrice);
                    p.setpDisc(pDisc);
                    p.setpQuantity(pQuantity);
                    p.setpPic(part.getSubmittedFileName());
                    
                    //get Category by Id
                    
                    CategoryDao cdao=new CategoryDao(FactoryProvider.getFactory());
                    Category category = cdao.getCategoryById(cId);
                    
                    p.setCategory(category);
                    
                    //save Product
                    
                    ProductDao pdao=new ProductDao(FactoryProvider.getFactory());
                    int pId=pdao.saveProduct(p);
                    
                    //upload Photo
                    
                    String path=request.getRealPath("Img")+File.separator+"Product"+File.separator+part.getSubmittedFileName();
                    System.out.println(path);
                    
                    try {
                        
                        FileOutputStream fos=new FileOutputStream(path);
                        
                        InputStream is=part.getInputStream();
                        
                        byte []data=new byte[is.available()];
                        
                        //read data
                        is.read(data);
                        
                        //write data
                        fos.write(data);
                        
                        fos.close();
                        
                        is.close();
                        
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                    
                    HttpSession httpSession = request.getSession();
                    httpSession.setAttribute("message", "Product added sucessfully !!! Product Id:: "+pId);
                    response.sendRedirect("admin.jsp");
                    
                }
                
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
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
