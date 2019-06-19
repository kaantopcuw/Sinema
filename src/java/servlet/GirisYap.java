/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import Database.MyDatabase;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author PC
 */
public class GirisYap extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            
            MyDatabase db = new MyDatabase();
            Connection con = db.getConnection();
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM users where username ='"+username+"' and password = '"+password+"';");
            
            if (rs.next()) {
                
                HttpSession session = request.getSession();
                
                String yetkiString = rs.getString("yetki");
                int user_id = rs.getInt("user_id");
                
                session.setAttribute("user_id", user_id);
                session.setAttribute("username", username);
                session.setAttribute("isim", rs.getString("isim"));
                session.setAttribute("soyad", rs.getString("soyad"));
                session.setAttribute("yetki", yetkiString);
                
                Cookie[] cookies = request.getCookies();
                if (cookies != null) {
                    int seans_id = 0;
                    int kisi_sayisi = 0;
                    for(Cookie c : cookies){
                        if (c.getName().compareTo("seans_id") == 0) {
                            seans_id = Integer.valueOf(c.getValue());
                            c.setValue("");
                            c.setMaxAge(0);
                            response.addCookie(c);
                        }else if (c.getName().compareTo("kisi_sayisi") == 0) {
                            kisi_sayisi = Integer.valueOf(c.getValue());
                            c.setValue("");
                            c.setMaxAge(0);
                            response.addCookie(c);
                        }
                    }
                    if (seans_id > 0 && kisi_sayisi >0) {
                        ResultSet seanslarRs = stmt.executeQuery("SELECT * FROM seanslar where seans_id = '"+seans_id+"';");
                        if (seanslarRs.next()) {
                            int kalan_kapasite = seanslarRs.getInt("kalan_kapasite");
                            if (kalan_kapasite >= kisi_sayisi) { // kayýt edilecek kiþi sayýsý kapasiteden düþükse kaydet
                                kalan_kapasite -= kisi_sayisi;
                                stmt.execute("UPDATE seanslar SET kalan_kapasite = '"+kalan_kapasite+"' WHERE (seans_id = '"+seans_id+"');");
                                stmt.execute("INSERT INTO rezervasyonlar (seans_id, user_id, koltuk_sayisi) VALUES ('"+seans_id+"', '"+user_id+"', '"+kisi_sayisi+"');");
                            }
                        }
                    }
                    
                }
                
                con.close();
                if (yetkiString.compareTo("1") == 0) {
                    response.sendRedirect("yoneticiPage.jsp");
                }else{
                    response.sendRedirect("kullanici.jsp");
                }
            }else{
                response.sendRedirect("giris.jsp");
            }
            
        } catch (SQLException ex) {
            Logger.getLogger(GirisYap.class.getName()).log(Level.SEVERE, null, ex);
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
