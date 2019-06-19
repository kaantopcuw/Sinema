<%-- 
    Document   : rezervasyonKaydet
    Created on : 23.May.2019, 10:46:30
    Author     : PC
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="Database.MyDatabase"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-9"%>

<%
    if ( session.getAttribute("yetki") != null) {
        if (Integer.valueOf(session.getAttribute("yetki").toString()) == 1) {
            response.sendRedirect("index.jsp");
        }  
    }
%>
<!DOCTYPE html>
<html>
<jsp:include page="include/head.jsp"/>
<jsp:include page="include/header.jsp"/>
<body>
    <div class="row film-sec">
        <div class="col-md-6 mx-auto">
            <div class="row">
                <%
                    
                    String seans_idString = request.getParameter("seans_id").toString();
                    String kisi_sayisiString = request.getParameter("kisi_sayisi").toString();
                    if (seans_idString == null || kisi_sayisiString == null) {
                        response.sendRedirect("index.jsp");
                    }
                    int seans_id = Integer.valueOf(seans_idString);
                    int kisi_sayisi = Integer.valueOf(kisi_sayisiString);
                    if (session.getAttribute("user_id")!=null) {
                        int user_id = Integer.valueOf(session.getAttribute("user_id").toString());
                        MyDatabase db = new MyDatabase();
                        Connection con = db.getConnection();
                        Statement stmt = con.createStatement();
                        ResultSet rs = stmt.executeQuery("SELECT * FROM seanslar where seans_id = '"+seans_id+"';");

                        if (rs.next()) {
                            int kalan_kapasite = rs.getInt("kalan_kapasite");
                            if (kalan_kapasite >= kisi_sayisi) { // kayýt edilecek kiþi sayýsý kapasiteden düþükse kaydet
                                kalan_kapasite -= kisi_sayisi;
                                stmt.execute("UPDATE seanslar SET kalan_kapasite = '"+kalan_kapasite+"' WHERE (`seans_id` = '"+seans_id+"');");
                                stmt.execute("INSERT INTO rezervasyonlar (seans_id, user_id, koltuk_sayisi) VALUES ('"+seans_id+"', '"+user_id+"', '"+kisi_sayisi+"');");
                                out.print("<h4>Kayýt Baþarýlý</h4>");
                            }else{
                                out.print("Daha az kiþi ile tekrar deneyin.");
                            }


                        }else{
                            out.print("Hatalý iþlem yaptýnýz. Tekrar deneyin.");
                        } 
                    }else{
                        Cookie seansCookie = new Cookie("seans_id", seans_idString);
                        Cookie userCookie = new Cookie("kisi_sayisi", kisi_sayisiString);
                        
                        
                        seansCookie.setMaxAge(60*60*24); 
                        userCookie.setMaxAge(60*60*24); 
                        
                        response.addCookie( seansCookie );
                        response.addCookie( userCookie );
                        response.sendRedirect("giris.jsp?o=no");
                    }
                    
                    
                %>
            </div>
        </div>
    </div>
</body>
</html>
